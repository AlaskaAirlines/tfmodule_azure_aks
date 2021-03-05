package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAKS(t *testing.T) {
	// Arrange
	uniqueID := strings.ToLower(random.UniqueId())
	region := "westus2"
	resourceGroup := "tfmodulevalidation-test-group"

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/.",
		Vars: map[string]interface{}{
			"unique_id": uniqueID,
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	// Act
	terraform.InitAndApply(t, terraformOptions)

	// Assert
	assert := assert.New(t)

	clusterLocation := terraform.Output(t, terraformOptions, "aks_cluster_location")
	assert.NotNil(clusterLocation)
	assert.Equal(clusterLocation, region)

	clusterVersion := terraform.Output(t, terraformOptions, "aks_cluster_version")
	assert.NotNil(clusterVersion)
	assert.Equal(clusterVersion, "1.19.7")

	clusterName := terraform.Output(t, terraformOptions, "aks_cluster_name")
	assert.NotNil(clusterName)
	assert.Equal(clusterName, "tfval-dev-"+uniqueID+"-aks")

	clusterFQDN := terraform.Output(t, terraformOptions, "aks_cluster_fqdn")
	assert.NotNil(clusterFQDN)
	assert.Contains(clusterFQDN, "tfval-dev-"+uniqueID)
	assert.Contains(clusterFQDN, "hcp."+region+".azmk8s.io")

	clusterResourceGroup := terraform.Output(t, terraformOptions, "aks_resource_group_name")
	assert.NotNil(clusterResourceGroup)
	assert.Equal(clusterResourceGroup, resourceGroup)

	nodeResourceGroup := terraform.Output(t, terraformOptions, "aks_node_resource_group_name")
	assert.NotNil(nodeResourceGroup)
	assert.Equal(nodeResourceGroup, "MC_"+resourceGroup+"_tfval-dev-"+uniqueID+"-aks_"+region)
}

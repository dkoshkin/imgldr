# Copyright 2025 Dimitri Koshkin. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

IMG ?= controller:latest

KUSTOMIZE ?= kustomize
CONTROLLER_GEN ?= controller-gen

.PHONY: controller-gen
controller-gen: ; $(info $(M) using controller-gen from PATH)
	command -v "$(CONTROLLER_GEN)" >/dev/null

.PHONY: kustomize
kustomize: ; $(info $(M) using kustomize from PATH)
	command -v "$(KUSTOMIZE)" >/dev/null

.PHONY: manifests
manifests: controller-gen ## Generate WebhookConfiguration, ClusterRole and CustomResourceDefinition objects.
manifests: ; $(info $(M) generating CRDs and RBAC manifests)
	"$(CONTROLLER_GEN)" rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases

.PHONY: generate
generate: controller-gen ## Generate code containing DeepCopy, DeepCopyInto, and DeepCopyObject method implementations.
generate: ; $(info $(M) generating deepcopy code)
	"$(CONTROLLER_GEN)" object:headerFile="hack/license/go.txt" paths="./..."

.PHONY: build-installer
build-installer: manifests generate kustomize ## Generate a consolidated YAML with CRDs and deployment.
build-installer: ; $(info $(M) building installer manifest)
	mkdir -p dist
	cd config/manager && "$(KUSTOMIZE)" edit set image controller=${IMG}
	"$(KUSTOMIZE)" build config/default > dist/install.yaml

.PHONY: kubebuilder-sync-chart
kubebuilder-sync-chart: ## Regenerate kubebuilder helm chart and sync to charts/imgldr
kubebuilder-sync-chart: ; $(info $(M) syncing kubebuilder helm chart)
	kubebuilder edit --plugins=helm/v2-alpha
	# This workflow is added by the plugin, just remove it.
	rm -rf .github/workflows/test-chart.yml
	rm -f dist/chart/templates/manager/manager.yaml.bak
	for file in $$(find dist/chart/templates -type f \( -name '*.yaml' -o -name '*.yml' \)); do \
	  { cat hack/license/yaml.txt; echo; cat "$$file"; } > "$$file.tmp"; \
	  mv "$$file.tmp" "$$file"; \
	done
	rm -rf charts/imgldr/templates
	cp -R dist/chart/templates charts/imgldr/templates
	yq -o=yaml '.' dist/chart/values.yaml > dist/chart/values.yaml.formatted
	{ \
	  cat hack/license/yaml.txt; \
	  echo; \
	  cat dist/chart/values.yaml.formatted; \
	} > charts/imgldr/values.yaml
	rm -f dist/chart/values.yaml.formatted
	$(MAKE) chart-docs schema-chart

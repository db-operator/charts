.PHONY: all deploy build helm
.ONESHELL: test

ifeq ($(K8S_VERSION),)
K8S_VERSION := v1.28.4
endif

LOCALBIN_DIR ?= $(shell pwd)/bin
$(LOCALBIN_DIR):
	mkdir -p $(LOCALBIN_DIR)

k3d:
	@curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
	@k3d cluster create myk3s -i rancher/k3s:$(K8S_VERSION)-k3s1
	@kubectl get pod

helmfile-operator: ## Syncs the helmfile with dependencies for testing operator
	helmfile sync -f ./helmfile.yaml

helmfile-instances: ## Syncs the helmfile with dependencies for testing dbinstances
	helmfile sync -f ./helmfile.yaml -e instances

lint: ## lint helm charts
	ct lint --target-branch main --validate-maintainers=false

test-values: 
	cd charts/db-operator && \
		bash ./scripts/test_values -p ./ci/unit-test

test-operator: helmfile-operator ## test helm charts
	ct install --target-branch main --charts ./charts/db-operator

test-upgrade-operator: helmfile-operator ## test helm charts
	ct install --upgrade --target-branch main --charts ./charts/db-operator

test-instances: helmfile-instances ## test helm charts
	ct install --target-branch main --charts ./charts/db-instances

test-upgrade-instances: helmfile-instances ## test helm charts
	ct install --upgrade --target-branch main --charts ./charts/db-instances

.PHONY: gen_docs
gen-docs: ## Generate helm documentation
	test -s $(LOCALBIN)/setup-envtest || GOBIN=$(LOCALBIN_DIR) go install github.com/norwoodj/helm-docs/cmd/helm-docs@latest
	./bin/helm-docs --template-files=./charts/db-operator/README.md.gotmpl \
		--sort-values-order file --chart-to-generate=charts/db-operator
	./bin/helm-docs --template-files=./charts/db-isntances/README.md.gotmpl --sort-values-order file --chart-to-generate=charts/db-instances



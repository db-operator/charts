files=$(find ./charts/db-operator/tests -name '*.yaml')
for file in $files; do
  helm unittest -f $file ./charts/db-operator
done

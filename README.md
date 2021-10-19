# EKS deployments with Helm

GitHub action for pushing a chart to a helm repository using helm-push plugin.

## Customizing

### inputs

Following inputs can be used as `step.with` keys

| Name             | Type    | Description                        |
|------------------|---------|------------------------------------|
| `helm-chart-repo-name`          | String  | Name of the the chart in the repository. |
| `helm-chart-repo-url`      | String  | The URL of the helm repository. |
| `chart-dir`      | String  | The dir where you have the Chart.yaml and chart logic to push |
| `repo-username`      | String  | Username to authenticate to the repository, if basic auth is enabled in repo. |
| `repo-password`      | String  | Password to authenticate to the repository, if basic auth is enabled in repo. |

## Example usage

Withouth basich AUTH in repo

```yaml
uses: craftech-io/helm-push-action@v1
with:
  helm-chart-repo-name: services
  helm-chart-repo-url: https://chartmuseum.example.com
  chart-dir: services/
```

With basich AUTH in repo

```yaml
uses: craftech-io/helm-push-action@v1
with:
  helm-chart-repo-name: services
  helm-chart-repo-url: https://chartmuseum.example.com
  chart-dir: services/
  repo-username: ${{ secrets.REPO_USERNAME }}
  repo-username: ${{ secrets.REPO_PASSWORD }}
```
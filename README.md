# Okteto Load Testing Sample using Artillery

This sample shows how to use the [Okteto CLI](https://github.com/okteto/okteto) to develop a Go application directly in Kubernetes and run load tests against it using [Artillery.io](https://www.artillery.io/).

## How it works

The [Okteto Manifest](https://www.okteto.com/docs/reference/okteto-manifest/) allows you to define how your tests look like, regardless of their kind: unit, integration, e2e, load, etc.

In this sample, I've configured `unit`, `integration` and `load` tests. Check out the [okteto.yml](./okteto.yml) for the full manifest. Below, you can see the snippet related to the load testing with Artillery.

```yaml
test:
  load:
    context: load-testing
    image: artilleryio/artillery:latest
    commands:
      - run run /okteto/src/artillery.yml --target "https://hello-world-${OKTETO_NAMESPACE}.${OKTETO_DOMAIN}" --output raw-artillery-report.json
      - run report raw-artillery-report.json --output visual-artillery-report.html
    artifacts:
      - raw-artillery-report.json
      - visual-artillery-report.html
```      

When you run `okteto test load --no-cache` this will launch a container in which Okteto runs the Artillery CLI for you. When tests are completed, the Okteto CLI will retrieve the HTML and JSON report artifacts from the container and copy them on your machine. If you use `okteto test` in your CI/CI pipeline, you can then upload your artifacts as needed, for example for calculating test coverage.

## Conclusion

The first benefit of using `okteto test` is that it enables you and your team to define tests once but run them both locally and remotely in your CI/CI pipeline. Offloading your laptop from doing the heavy lifting of executing tests is generally a great idea, but this is especially true for load tests.

Check out the [Okteto Test GitHub Action](https://github.com/okteto/test) to integrate load testing in your CI/CD pipeline.

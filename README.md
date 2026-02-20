In this exercise, we will examine whether for the github action to have 2 CI/CD YAML files only. They can be called caller and executor.

pull-request.yml

merge-deploy.yml

Condition inside the merge-deploy.yml as follows.

```


jobs:
  apply-plan:
    runs-on: ubuntu-latest
    environment: ${{ inputs.environment }}
    defaults:
      run:
        shell: bash
        working-directory: files/accounts/datascience/environments/eu-west-2/wise
    steps:
    # Terraform apply
      - name: Terraform Apply
        id: Apply
        if: github.ref == 'refs/heads/"main"' && github.event_name == 'push'
        run: terraform apply -auto-approve -lock=false -refresh=true

This is ok, but we will need to click on action button every time and also need to click approval as well. Can we skip the clicking of the action button.
```

This end up of 2 YAML files instead.
1. 2 x callers. One for **pull-request** and another for **merge-deploy** where the merge-deploy with call an executor to run apply.
2. executor
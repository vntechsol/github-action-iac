Working on Personal-Access-Token and SSH-KEY for git checkout git@ on terraform source = "git@"


Important Note:

On the github repository that is intend to configure the **Action for CI/CD**. We need to create the **Repository secrets** by click on setting->Secets and variables->Actions. Click **New Resitory secret**

We will be using AWS IAM Assume Role with OIDC. Therefore, this must be available with relevant policies attach to it first for the **Action CI/CD pipeline** to provision the terraform resources to aws cloud.

The Repository secrets values can be id

AWS_GITHUB_ACTION_ROLE
AWS_PROFILE
TERRAFORM_VERSION

As mentioned above. We will trial out the SSH-Key option first.

Under github setting. Click **Deploy keys** and paste in your **ssh-private-key** values. Again, we will need to create a **Repository secrets** call ie **DEPLOY_SSH_KEY**

ssh-keygen -t ed25519 -f ssh_host_ed25519_key -N "" < /dev/null
ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key -N "" < /dev/null

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
ssh -vT git@github.com

https://nts.strzibny.name/how-to-use-ssh-private-keys-with-password/
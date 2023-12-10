# Docker compose files

Some docker compose templates for various services

## Testing environment

To test the templates and adjust them before deployment on production, use [Multipass](https://multipass.run/)

Prerequisite:
- Visual Studio Code (VS Code)
- VS Code integrated terminal (already built in VSCode)
- Remote SSH extension for VS Code
- Installed Multipass ([read how to](https://multipass.run/install))

Now open VS Code and 
1. Open Terminal in VS Code
2. Create a new RSA key with 
```
ssh-keygen -t rsa
```

3. Copy the content of the `.pub` key you just created
4. Create a cloud-init YAML file named  `vscode-multipass.yaml` containing the following (replacing with your public key that you generated)
```
groups:
  - vscode
runcmd:
  - adduser ubuntu vscode
ssh_authorized_keys:
  - ssh-rsa <public key>
```
5. Now launch a Docker Image based multipass container named `vscode` that will include our ssh key using the cloud init file we created: 
```
multipass launch docker --cloud-init vscode-multipass.yaml --name vscode
```
6. Once it is deployed, grab the IP address of the `vscode` instacne we created 
```
multipass info vscode | grep IPv4
```
7. (optional) add the IP address with a testing domain name (e.g. docker.local) in your etc/host file to avoid typing an IP address
8. Click the `Open a Remote Window` and add the host by following the prompts and entering the IP address (or the testing domain) of the `vscode` instance that you deployed
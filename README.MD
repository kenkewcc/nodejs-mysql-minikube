# Ansible to deploy nodejs and mysql to minikube

## Usage

### 1. Install prerequisite required to run the ansible. 
```
pip install --user -r infra/requirements.txt
```

### 2. Run Ansible-playbook
```
ansible-playbook infra/ansible-playbook.yaml --ask-become-pass
```
Ansible will do the following:
1. Installation for minikube.
2. Start minikube if not running.
3. Configure minikube tunnel for "load balancer"
4. Build docker image for mysql with pre-init DB
5. Deploy mysql to minikube and configure svc
6. Deploy nodejs to minikube and configure svc


### To view the webpage, use kubectl to forward the port
```
kubectl port-forward service/hello-nodejs 3000:3000
```

### To Cleanup:
```
minikube tunnel --cleanup
minikube stop
```

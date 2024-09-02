### Mini-kube

## Resources
1) https://medium.com/@chroottech/how-to-deploy-python-application-in-docker-kubernetes-1d198f2af2c
2) https://youtu.be/cYObRCAb1Fs?si=Ccb1Q8Vhdx6xXGFC

## Commands 
It looks like you're working through a series of commands to build and deploy a Docker image to Minikube, a local Kubernetes cluster. However, there's a small typo in your sequence. Here’s a corrected and annotated version of your workflow:

1. **Start Minikube:**
   ```bash
   minikube start
   ```
   This command starts a local Kubernetes cluster using Minikube.

2. **Build Docker Image:**
   ```bash
   docker build -t nirmal15082002/minikube-test:v0.0.2 .
   ```
   This builds a Docker image with the tag `nirmal15082002/minikube-test:v0.0.2` from the Dockerfile located in the current directory.

3. **Login to Docker Hub:**
   ```bash
   docker login
   ```
   This command prompts you to enter your Docker Hub credentials to log in. Make sure you correct the typo from `doker login` to `docker login`.

4. **Push Docker Image to Docker Hub:**
   ```bash
   docker push nirmal15082002/minikube-test:v0.0.2
   ```
   This uploads your Docker image to Docker Hub under the specified tag.

5. **Run Docker Image Locally (optional):**
   ```bash
   docker run -it --rm nirmal15082002/minikube-test:v0.0.2
   ```
   This command runs the Docker image locally in an interactive terminal (`-it`) and removes the container after it exits (`--rm`). This step is optional and depends on whether you need to test the image locally before deploying it to Kubernetes.

6. **Apply Kubernetes Manifest:**
   ```bash
   kubectl apply -f manifest.yaml
   ```
   This applies the Kubernetes configuration defined in `manifest.yaml`, which may include deployments, services, and other resources.

7. **Check Pods Status:**
   ```bash
   kubectl get pods
   ```
   This lists all the pods running in your Kubernetes cluster, allowing you to verify that your application is running as expected.

8. **Stop Minikube:**
   ```bash
   minikube stop
   ```
   This stops the Minikube cluster.

### Additional Tips:
- Ensure that Docker and Minikube are both running in environments that can communicate with each other. You might need to configure Docker to use the Minikube Docker daemon if you're building images that Minikube will use.
- To configure Docker to use Minikube’s Docker daemon, run:
  ```bash
  eval $(minikube docker-env)
  ```
  This command sets the Docker environment variables to point to the Minikube Docker daemon, so that you can build images directly in Minikube's context.

- After `kubectl apply -f manifest.yaml`, use `kubectl describe pod <pod-name>` or `kubectl logs <pod-name>` to get more details about your pods if they don’t seem to be working as expected.



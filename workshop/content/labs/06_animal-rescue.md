## Deploy Animal Rescue Sample Application (Optional)

The [animal rescue](https://github.com/spring-cloud-services-samples/animal-rescue/) sample 
application demonstrate many commonly used features of spring cloud gateway. To deploy 
the application and use the login with Auth0 feature you will need a client secret 

<!-- provided by the workshop instructor, look for it in the workshop Slack channel.  -->



1. For SSO configuration this workshop is using okta guest account. Updated the Identity provider details in the file `animal-rescue/overlays/sso-secret-for-gateway/secrets/test-sso-credentials.txt`. This file will be used to create animal-rescue-sso secret.  
   
2. Deploy the app using the command `kustomize build ./animal-rescue/ | kubectl apply -f -`

``` execute
kustomize build ./animal-rescue/ | kubectl apply -f -
```

3. Check the animal rescue components that are deployed into the cluster using the command 
   `kubectl get all` you should see output similar to the one below.
   
``` execute
kubectl get all
```

```text
NAME                                          READY   STATUS    RESTARTS   AGE
pod/animal-rescue-backend-74c54b577f-n7zxn    1/1     Running   0          6m54s
pod/animal-rescue-frontend-76cf7899b9-s2pxz   1/1     Running   0          6m54s
pod/gateway-demo-0                            1/1     Running   0          6m54s
pod/gateway-demo-1                            1/1     Running   0          6m15s

NAME                             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/animal-rescue-backend    ClusterIP   10.103.68.238    <none>        80/TCP     6m54s
service/animal-rescue-frontend   ClusterIP   10.106.109.195   <none>        80/TCP     6m54s
service/gateway-demo             ClusterIP   10.110.12.46     <none>        80/TCP     6m54s
service/gateway-demo-headless    ClusterIP   None             <none>        5701/TCP   6m54s

NAME                                     READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/animal-rescue-backend    1/1     1            1           6m54s
deployment.apps/animal-rescue-frontend   1/1     1            1           6m54s

NAME                                                DESIRED   CURRENT   READY   AGE
replicaset.apps/animal-rescue-backend-74c54b577f    1         1         1       6m54s
replicaset.apps/animal-rescue-frontend-76cf7899b9   1         1         1       6m54s

NAME                            READY   AGE
statefulset.apps/gateway-demo   2/2     6m54s
```

4. Notice that there are two instances of the gateway deployed, this makes the gateway 
   highly available within the k8s cluster. The gateway instances replicate data between 
   each other in order to track who is logged in into the application. 
   
5. Notice that there are two pods one running the front end application and one running the 
   backend api.
   
6. Notice that the front end and backend services are ClusterIP, so they can be reached 
   inside the k8s cluster but not from outside. We are going to need to reach the gateway to 
   direct traffic to the frontend and backend.
   
7. Using a browser visit `http://${SESSION_NAMESPACE}-animal-rescue-gateway.workshop.frankcarta.com/rescue` you will see the home page for the application. click around on the application and explore it.

``` execute
echo http://${SESSION_NAMESPACE}-animal-rescue-gateway.workshop.frankcarta.com/rescue
```

8. Click the login button in the top right corner, you will be redirected to Auth0 you can login
   with a Google account and then you will be sent back to the application where you will 
   be able to see the userid in the top right corner.
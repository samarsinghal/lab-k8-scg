## Configure gateway routes 

This topic describes how to add, update, and manage API routes for apps that use a Spring Cloud Gateway for Kubernetes instance.

### What are API routes

Spring Cloud Gateway instances match requests to target endpoints using configured API routes. A route is assigned to each request by evaluating a number of conditions, called predicates. Each predicate may be evaluated against request headers and parameter values. All of the predicates associated with a route must evaluate to true for the route to be matched to the request. The route may also include a chain of filters, to modify the request before sending it to the target endpoint, or the received response.


### Add/Map Routes to Gateway

To add an API route to a Spring Cloud Gateway for Kubernetes instance, you must create a resource of type SpringCloudGatewayMapping and a resource of type SpringCloudGatewayRouteConfig.


<br/>

<img src="../images/scg_instance.png" alt="Spring cloud gateway instance on Kubernetes cluster" style="border:none;"/>

<br/>
<br/>


1. Inspect the file `demo/route-config.yml` it contains gateway configuration CRD that proxies requests
set the gateway to github. Notice that this route configuration is generic.  

```yaml
apiVersion: "tanzu.vmware.com/v1"
kind: SpringCloudGatewayRouteConfig
metadata:
  name: my-gateway-routes
spec:
  routes:
    - uri: https://github.com
      predicates:
        - Path=/**
      filters:
        - StripPrefix=1
```

2. run the command `kubectl apply -f demo/route-config.yml` you 

3. Inspect the file `demo/mapping.yml` notice that it points at the gateway instance we already deployed
at the configuration defined in `route-config.yml`

```yaml
apiVersion: "tanzu.vmware.com/v1"
kind: SpringCloudGatewayMapping
metadata:
  name: test-gateway-mapping
spec:
  gatewayRef:
    name: my-gateway
  routeConfigRef:
    name: my-gateway-routes
```

4. run the command `kubectl apply -f demo/mapping.yml` this will configure the already deployed 
   instance to pass proxy requests to github.com 
   
After creating the mapping and route config resources, you should be able to access the myapp app at the fully qualified domain name (FQDN) used by the Gateway instance and the path /api/*. For example, if your Gateway instance is exposed by an Ingress resource at the domain gateway.example.com, you can access the myapp app at the following URL:

https://gateway.example.com/api/my-path


5. We don't have a load balancer configured with our kind cluster, so we will use port forwarding to
   test the gateway. run the command `kubectl port-forward service/my-gateway 8080:80` you will see 
   output like
```text
Forwarding from 127.0.0.1:8080 -> 8080
Forwarding from [::1]:8080 -> 8080
```

6. Using a browser go to `http://localhost:8080` you should see the github site. The request are 
   going to spring cloud gateway which is then sending them to github.com. Congrats you have 
   managed to deploy a spring cloud gateway instance using a CRD. There are many more things
   that you can do with spring cloud gateway that we will discuss in the rest of the workshop this is 
   just the start. 


Now you can deploy the `helloworld` application in workshop namespace. To create deployment first change to the `~/demo` sub directory.


```execute
kubectl create -f helloworld-deployment.yaml
```

output:

deployment.apps/helloworld created
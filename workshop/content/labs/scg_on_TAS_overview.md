## Spring Cloud Gateway on TAS Overview

<br/>


Tanzu Spring Cloud Gateway provides API gateway capabilities on the Tanzu. The product integrates with the Platform’s identity management services, Tanzu Single Sign-On and container networking.

Developers can configure routes on the Gateway service instance via JSON during service binding. This way, development teams can dynamically manage route configuration via source control, instead of ticket-based workflows or cumbersome centralized API gateway appliances.

<br/>


### Key Features

<br/>


Spring Cloud Gateway for TAS includes the following key features:

Built on Spring Framework 5, Project Reactor, and Spring Boot 2

Match routes on request attributes

Specify predicates and filters for each route

API route authorization via Tanzu Single Sign-On plans

Dynamic configuration of routes via service bindings

Scalable Rate Limiting

Path Rewriting

Leverages TAS platform capabilities for secure and resilient routing

<br/>


## Spring Cloud Gateway Operator

We installed Spring cloud gateway operator on the workshop cluster.

1. The spring cloud gateway operator installed three kubernetes custom resources definitions. Execute the command 
   `kubectl get crds` and you will see all the created custom CRDs shown below. These CRDs will be used to configure 
   the gateway. 
   
```shell
NAME                                              CREATED AT
springcloudgatewaymappings.tanzu.vmware.com       2021-03-10T01:02:51Z
springcloudgatewayrouteconfigs.tanzu.vmware.com   2021-03-10T01:02:51Z
springcloudgateways.tanzu.vmware.com              2021-03-10T01:02:51Z
```

2. execute the command  `kubectl get all -n spring-cloud-gateway` you should see a pod running the spring cloud gateway 
operator as shown below. 
   
```text
NAME                                READY   STATUS    RESTARTS   AGE
pod/scg-operator-544df5bd98-tnmdt   1/1     Running   0          6m11s

NAME                   TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
service/scg-operator   ClusterIP   10.96.210.34   <none>        80/TCP    6m11s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/scg-operator   1/1     1            1           6m11s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/scg-operator-544df5bd98   1         1         1       6m11s
```




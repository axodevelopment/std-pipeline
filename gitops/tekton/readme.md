The below describes the resources as they are more work to be done.

# route gets created for eventlistener
ROUTE_URL=$(oc get route el-github-mock-listener -o jsonpath='{.spec.host}') && curl -v -H 'Content-Type: application/json' -d '{"message": "test message", "repository": {"name": "test-repo"}}' http://$ROUTE_URL

The binding is pulling 'message' & 'repository.name' from the dataset.

The above call is to make it zsh compliant.  In short we get the el-github-mock-listener route and call that.  The eventlistener will create the service we are just exposing.


# logging
oc logs -l eventlistener=github-mock-listener -n pipelines -f

# test
this is a test to see if my workflow is working correctly...

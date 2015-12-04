# Requirements

Your application uses Java 8 and builds with maven.

# Build this STI base

	make

# Using in application

## Publish image

To use this in OpenShift it needs to be available in a Docker Repository. To do this perform (on the machine you ran make on) something along the lines of:
    
    docker tag openshift-sti-java-8:latest <myrepo_with_port>/openshift-sti-java-8
    docker push <myrepo_with_port>/openshift-sti-java-8

## Create start command

Create whatever start command you need and place it in your root directory. It is just called ```bin/start```.

## Prepare for build

If your application just needs a plain mvn build you don't really need to do anything. Default is ```mvn install```. MAVEN_OPTS is set to:

- Disable tests
- Activate profile "openshift"
- Variable platform-target set to "openshift"
- Maven repo redirected to ```./m2-repo``` . Lets us re-use when re-building.

## Bootstrap your application on OpenShift

    oc new-app <myrepo_with_port>/openshift-sti-java-8:latest --strategy=source .

This will create all the necessary resources on OpenShift. To see the generated setup before executing with ```oc create -f app-template.yaml``` perform:

        oc new-app <myrepo_with_port>/openshift-sti-java-8:latest --strategy=source --output=yaml . > app-template.yaml


# Testing...

There is a test directory here, but it's not updated right now...

## Build image to yes app locally

Move to your application directory and run:

	s2i build --force-pull=false --incremental=true . openshift-sti-java-8 <application_name>

## Start image

Aften building, start your application with:

	docker run -p 8080:8080 <application_name>

# Testing

Sorry, not implemented yet. The test directory (and Make command) is just something that came with the s2i bootstrap.
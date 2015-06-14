# Requirements

Your application uses Java 8 and builds with maven.

# Build this STI base

	make

# Using on applicatoin

## Create start command

Create whatever start command you need and place it in your root directory. It is just called ```start```.

## Prepare for build

If your application just needs a plain mvn build you don't really need to do anything. Default is ```mvn install```. MAVEN_OPTS is set to:

- Disable tests
- Activate profile "openshift"
- Variable platform-target set to "openshift"
- Maven repo redirected to ```./m2-repo``` . Lets us re-use when re-building.

## Build image

Move to your application directory and run:

	sti build --force-pull=false --incremental=true . openshift-sti-java-8 <application_name>

## Start image

Aften building, start your application with:

	docker run -p 8080:8080 <application_name>

# Testing

Sorry, not implemented yet. The test directory (and Make command) is just something that came with the STI bootstrap.
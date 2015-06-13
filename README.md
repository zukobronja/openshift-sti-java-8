# Requirements

Your application uses Java 8 and builds with maven.

## Options

If you need to trigger specific behaviour for Openshif you can either create an Maven profile called "openshift" OR activate a profile based on "-Dplatform-target=openshift" .

# Build this STI base

	make

# Run application

Move to your application directory and run:

	sti build --force-pull=false --incremental=true . openshift-sti-java-8 <application_name>

Aften building, start your application with:

	docker run -p 8080:8080 <application_name>

# Testing

Sorry, not implemented yet. The test directory (and Make command) is just something that came with the STI bootstrap.
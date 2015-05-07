LABS=labs.adoc \
		content/docker_basic_workshop/docker_basic_workshop.adoc\
		content/deploying_lamp_stack_using_docker_on_fedora/deploying_lamp_stack_using_docker_on_fedora.adoc\
		content/docker_networking/docker_networking.adoc\
		content/fedora_atomic/fedora_atomic.adoc\
		content/docker_native_orchestration/docker_native_orchestration.adoc\
		content/case_study_of_docker_in_cloud_computing_environment/case_study_of_docker_in_cloud_computing_environment.adoc\
		content/integrating_docker_with_openstack/integrating_docker_with_openstack.adoc\
		content/ansible_for_automation_in_it_and_docker_provisioning/ansible_for_automation_in_it_and_docker_provisioning.adoc\
		content/hands_on_kubernetes/hands_on_kubernetes.adoc\
		content/orchestration_of_apps_using_openshiftv3/orchestration_of_apps_using_openshiftv3.adoc\
		content/docker_security/docker_security.adoc\
		content/rkt_from_coreos/rkt_from_coreos.adoc

all: $(LABS) labs

labs: $(LABS)
	asciidoc -v labs.adoc
	a2x -fpdf -dbook --fop --no-xmllint -v labs.adoc
	$(foreach lab,$(LABS), asciidoc -v $(lab);)

html: $(LABS) 
	asciidoc -v labs.adoc
	asciidoc --backend 
	$(foreach lab,$(LABS), asciidoc -v $(lab);)

pdf: $(LABS) 
	a2x -fpdf -dbook --fop --no-xmllint -v labs.adoc

epub: $(LABS) $(SLIDES)
	a2x -fepub -dbook --no-xmllint -v labs.adoc

clean:
	find . -type f -name \*.html -exec rm -f {} \;
	find . -type f -name \*.pdf -exec rm -f {} \;
	find . -type f -name \*.epub -exec rm -f {} \;
	find . -type f -name \*.fo -exec rm -f {} \;
	find . -type f -name \*.xml -exec rm -f {} \;

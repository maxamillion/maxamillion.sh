.. title: Fedora Infrastructure Hackathon 2017
.. slug: fedora-infrastructure-hackathon-2017
.. date: 2017-05-18 21:36:00 UTC-05:00
.. tags: Fedora Infrastructure Hackathon 2017
.. category: blog
.. link:
.. description: Fedora Infrastructure Hackathon 2017
.. type: text

Fedora Infrastructure Hackathon 2017
====================================

Last week, hot on the heels of my trip to Boston for `Red Hat Summit`_,
I attended the 2017 Edition `Fedora Infrastructure Hackathon`_. The primary
goal of the Hackathon was to make a lot of progress in a relatively short amount
of time on defining `Fedora Infrastructure`_ requirements necessary to support
upcoming `Fedora Project`_ objectives, as defined by the `Council`_ and
`FESCo`_, and doing work to satisfy those requirements. In some cases this was
simply "define policies around how this should work with the infrastructure",
but in most it scenarios is meant digging in and doing work such as patching
multiple code bases to support new AuthN/AuthZ protocols and providers,
deploying net-new infrastructure services, or even bringing up services in a new
datacenter hosted by a fellow Open Source Community Project in order to leverage
newly donated hardware. We'll cover all of that in the recap of the journey
below.

It all started Monday 2017-05-08, we were hosted graciously in the `Red Hat
Tower`_, which as a proud Red Hatter and overall Red Hat fanboi it was extremely
cool to get to spend a week there, and worked as hard as we could to get a lot
done in about 4.5 days (Monday-Friday, but most people had to travel home on
Friday evening). Representative members of various aspects of the `Fedora
Community`_ were in attendance, the obvious `Fedora Infrastructure`_ Team was
well represented, but also `Fedora QA`_, `Fedora Modularity`_, `Fedora Atomic
CI`_, `CentOS`_, and `Fedora RelEng`_.

Things kicked off by defining an agenda, all notes held in a `Gobby Doc`_. We
effectively came up with a loose fitting outline of the following:

* Monday:

    * AuthN / AuthZ - FAS, FreeIPA, CommunityIPA, Ipsilon, CentOS Infra overlap
    * Modularity
    * CI

* Tuesday:

    * OpenShift in the AM, CI in the PM

* Wed/Thu:

    * Hack sessions on OpenShift and CI (break out into teams)

* Friday:

    * Breakout hack sessions and wrap up

AuthN/AuthZ
-----------

Things started off with `Patrick`_ explaining many aspects of various
AuthN/AuthZ protocols and technologies that are currently in use within the
Fedora Infrastructure as well as migration plans to bring systems and services
using older technology in line with newer technologies. There were discussions
focused around `Fedora Authentication`_, `OAuth2`_, `Kerberos`_, `OpenID`_,
`OpenID Connect`_, `FreeIPA`_, `FAS2`_, and how different `Fedora Apps`_ are
using different combinations of these technologies. From there and
identification of what apps need to be ported away from older technologies was
done along with work assigned to people in the room with the intent of
accomplishing these tasks over the next few days (and beyond, if necessary).

Bi-Directional Replication
--------------------------

Something that's come up a lot in recent history within the Fedora
Infrastructure is database high availability. The Fedora Infrastructure Team
already maintains a high level of best practices around database administration
but being able to do maintenance with extremely minimal or zero downtime to the
database servers is an extremely nice-to-have. Therefore a section of time was
dedicated to working through an approach to roll out `Postgres BDR`_ for certain
applications in the Fedora Infrastructure.

App Porting and Libraries
-------------------------

The `Fedora Apps`_ developers in the room had a some targeted breakout session
focusing on porting old Fedora web applications away from outdated or no longer
recommended libraries and frameworks in order to bring more uniformity to how
the applications are developed and maintained, but also make them easier to
support by reigning in the spread of tooling required by the group to have to
follow along with upstream developments.

Modularity
----------

Members from the `Fedora Modularity`_ Team presented on the `Module Build
Service`_ and `Arbitrary Branching`_ concept in order to discuss integration
points into the Fedora Infrastructure's existing systems. This was a lot of
discussion that resulted in documentation of processes, identification of issues
to resolve, and establishing a realistic timeline for a phased approach to
accomplish these tasks.

OpenShift
---------

The Fedora Infrastructure Team is always trying to make the most out of the
hardware that it has, and as such has been evaluating `container`_ technologies
for use in the Infrastructure. Recently an evaluation of `OpenShift`_ began and
the decision was made to move forward with using it for applications within
Fedora. During this session we worked through a `series of questions about
OpenShift`_ as they would pertain to a production deployment and had the good
fortune of being able to ask for best practices and general recommendations from
the `OpenShift Online`_ Ops Team. We then formulated a plan to have an OpenShift
Environment up and running fully automated with Ansible Playbooks (based on
`openshift-ansible`_ and `ansible-ansible-openshift-ansible`_) in stage by the
end of the week. We were successful in this endeavor but are waiting on
a certificate for new domain names.

Continuous Integration
----------------------

Next up we hear from a group within Fedora who are taking on the massive task of
attempting to perform Continuous Integration on the entire Fedora Operating
System. Alright, maybe not the **entire** set of packages but they are targeting
an installable Fedora Operating System via `Fedora Atomic Host`_. For more
information, check out the `Fedora Atomic CI`_ wiki page.

During this working session we were joined by our good friends from the
`CentOS`_ team because they were graciously offering up hardware resources in
their very own `CentOS CI`_ environment. There was a lot of work done here in
the initial days discussion around how to tie the two infrastructures together
as well as bridge things like account systems and grant appropriate permissions
throughout. Action items were tackled as the week continued.

Wrap Up
========

We met at the end of the week for a short time before most folks departed to
travel home and tallied up the score. All in all we accomplished all but one of
the objectives we set out for the hack days and the one that wasn't had
progress made on it but it was too large a piece of work to accomplish in just
a couple days and is still being worked on at this time. There's all sorts of
great info on the `Fedora Infrastructure Hackathon`_ wiki page for anyone who's
interested in digging into the details (also, check the
``CI-Infrastructure-Hackathon-2017`` `Gobby Doc`_ for a pay-by-play).

It was absolutely fantastic to get so many members of the Fedora Community into
one room and hack on things. It's also great just to get to spend time hanging
out with everyone since we rarely see one another in person. I'm even more
excited about `Flock 2017`_ than I was before!

Until next time...

.. _Ceph: http://ceph.com/
.. _OpenID: https://openid.net
.. _CentOS: https://centos.org/
.. _OAuth2: https://oauth.net/2/
.. _oVirt: https://www.ovirt.org/
.. _Gluster: https://gluster.org/
.. _Airbus: http://www.airbus.com/
.. _ManageIQ: http://manageiq.org/
.. _Fedora: https://getfedora.org/
.. _CentOS CI: https://ci.centos.org/
.. _FreeIPA: http://www.freeipa.org
.. _Red Hat: https://www.redhat.com
.. _Kubernetes: https://kubernetes.io/
.. _Foreman: https://www.theforeman.org/
.. _OpenShift: https://www.openshift.com/
.. _Flock 2017: https://flocktofedora.org/
.. _container: https://www.opencontainers.org/
.. _OpenShift Online: https://www.openshift.com/features/index.html
.. _kerberos: https://web.mit.edu/kerberos/
.. _Fedora RelEng: https://pagure.io/releng
.. _Service Now: https://www.servicenow.com/
.. _OpenID Connect: https://openid.net/connect/
.. _OpenShift Origin: https://www.openshift.org
.. _Ansible: https://github.com/ansible/ansible
.. _Fedora Apps: https://apps.fedoraproject.org/
.. _Fedora QA: https://fedoraproject.org/wiki/QA
.. _Project Atomic: https://www.projectatomic.io/
.. _Fedora Atomic Host: https://getfedora.org/en/atomic/
.. _website: https://www.redhat.com/en/summit/2017
.. _Council: https://fedoraproject.org/wiki/Council
.. _Gobby Doc: https://fedoraproject.org/wiki/Gobby
.. _FAS2: https://fedoraproject.org/wiki/Account_System
.. _Fedora Community: http://fedoracommunity.org/northam
.. _Red Hat Summit: https://www.redhat.com/en/summit/2017
.. _Patrick: https://fedoraproject.org/wiki/User:Puiterwijk
.. _Red Hat Tower: https://en.wikipedia.org/wiki/Red_Hat_Tower
.. _Postgres BDR: http://bdr-project.org/docs/stable/index.html
.. _Fedora Modularity: https://fedoraproject.org/wiki/Modularity
.. _RPM Packaging Guide: https://rpm-guide.readthedocs.io/en/latest/
.. _openshift-ansible: https://github.com/openshift/openshift-ansible
.. _Fedora Project: https://fedoraproject.org/wiki/Fedora_Project_Wiki
.. _Red Hat Technology Portfolio: https://www.redhat.com/en/technologies
.. _Fedora Atomic CI: https://fedoraproject.org/wiki/Category:FedoraAtomicCI
.. _Fedora Engineering Team: https://fedoraproject.org/wiki/Fedora_Engineering
.. _Fedora Infrastructure: https://fedoraproject.org/wiki/Infrastructure
.. _OpenShift Container Platform: https://www.openshift.com/container-platform/
.. _FESCo: https://fedoraproject.org/wiki/Fedora_Engineering_Steering_Committee
.. _Arbitrary Branching:
    https://fedoraproject.org/wiki/Changes/ArbitraryBranching
.. _Module Build Service:
    https://fedoraproject.org/wiki/Changes/ModuleBuildService
.. _Fedora Authentication:
    https://fedoraproject.org/wiki/Infrastructure/Authentication
.. _Fedora Infrastructure Hackathon:
    https://fedoraproject.org/wiki/CI_and_Infrastructure_Hackathon_2017
.. _Red Hat Enterprise Linux Atomic Host:
    https://www.redhat.com/en/resources/red-hat-enterprise-linux-atomic-host
.. _BCEC:
    https://massconvention.com/about-us/contact-us/boston-convention-exhibition-center
.. _series of questions about OpenShift:
    https://fedoraproject.org/wiki/Infrastructure/OpenShift
.. _ansible-ansible-openshift-ansible:
    https://pagure.io/ansible-ansible-openshift-ansible/

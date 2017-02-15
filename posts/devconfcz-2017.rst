.. title: DevConf.cz 2017
.. slug: devconfcz-2017
.. date: 2017-02-10 13:25:20 UTC-05:00
.. tags: DevConf.cz 2017
.. category: blog
.. link:
.. description: DevConf.cz 2017 - Define Future.
.. type: text

DevConf.cz 2017
===============

I was fortunate enough to attend `DevConf.cz 2017` this year, it's honestly one
of my favorite events of the year. Many people from the various upstream
communities I work in or closely with come to discuss and present various
technologies and it's a lot of fun.

This year I tried very hard to attend as many presentations as possible as well
as catch up with other community contributors in "The Hallway Track" because
I have in the past been bad at balancing between the official speaker track and
The Hallway Track. I like to think I did well. :)

Some of the big themes of the event were Continuous Integration, Container
Technologies, `Project Atomic`_ family of technologies, `Ansible`_, and
Cross-Community and Cross-Distro collaboration (making more of an effort to not
re-invent the wheel). Also as a point of reference, sub topics of these include
`Fedora Modularity`_, `Atomic Host`_, and `Factory 2.0`_.

This event was kind enough to post video recordings of all the Speakers and
I highly recommend those interested in any of these topic spaces to check out
the lineup, it was quite good. `Speaker Recordings here`_.

Below are quick notes about the sessions I had the opportunity to attend
including a recap of my experience with "The Hallway Track" at the end.

DevConf.cz Day 1
================

Keynote and  Welcome to DevConf.cz 2017
---------------------------------------

DevConf started off with a quick welcome message about the Conference and a
short history including fun facts about how much it's grown in recent years.

After the intro and welcome, it was off to the races with the Day 1 Keynote
that discussed the concept of how "software is eating the world" and how the
reality of more and more things moving to software is feeding into the Hybrid
Cloud concept. In the modern landscape, this solution space can be catered to
using only open source software by providing a platform to make infrastructure
consistent and stable. At the previous DevConf there was a Keynote that spoke
about full end to end Hybrid Cloud as an abstract concept that we as an open
source technology ecosystem aimed to accomplish based on current (at the time)
market trends. The bulk of this talk was a series of presenters performing live
demos, each one effectively built on top of the previous in order to show how
the abstract goal presented in the previous year's Keynote has now become a
reality.

The open technologies that made their debut on-stage were:

* `oVirt`_ (`KVM`_ and `libvirt`_ under the hood)
* `OpenStack`_
* `The Foreman`_
* `Pulp`_
* `Candlepin`_
* `FreeIPA`_
* `ManageIQ`_
* `OpenShift`_
* `WildFly`_

`Welcome to DevConf.cz 2017 and Day 1 Keynote video
<https://www.youtube.com/watch?v=gDhqCE7Gcl4>`_


Generational Core - The Future of Fedora
----------------------------------------

Next up was a session dedicated to Fedora Generational Core, which is a core
component of `Fedora Modularity`_ (or it was, it's more or less changed in name
but the concept remains the same). Generational Core is now known as Base
Runtime, these were originally different concepts targeting different use cases
but have merged over time. The Base Runtime is what defines "the line" between
Operating System and the Application. The main goal is to have an environment
that can be the building block for all other modules and content which has
a small package list and relatively low maintenance burden but can remain stable
and of high quality. The Base Runtime is the first real module as part of
`Fedora Modularity`_ that will be shipped.

The bulk of the discussion was off in the weeds talking about the journey to
trim down the dependency chain. There was a graphic (in the video link below)
that shows the incredible web of dependencies for even some of the most
fundamentally required packages to have a functional base environment. It was
a great tour of how much work is required to make this stuff happen and
highlights that `Fedora Modularity`_ isn't just new metadata on top of groups of
RPMs.

`Generational Core - The Future of Fedora video
<https://www.youtube.com/watch?v=gDhqCE7Gcl4>`_


Atomic Cluster in 10 Minutes
----------------------------

This was a quick 30-minute session that briefly covered some introductory
material about the `Project Atomic`_ family of technologies and then dove right
into a live demo using `ostree`_ layering on top of the base `rpm-ostree`_ that
comes out of the box with `Atomic Host`_. This functionality comes from either
``rpm-ostree pkg-add`` or ``atomic host install``, both of which allow for
multiple runs of the command with different packages and they will just add to
your new ostree layer on top of the base. Also, that new added layer will be
rebased on any future updates to the underlying system.

The main headline of the demo was showing off the new upstream ``kubectl init``
command from `kubernetes`_. This command allows for quick setup and testing to
be able to be up and running and kicking the tires in no time (well, 10 minutes
or less).

`Atomic Cluster in 10 Minutes video
<https://www.youtube.com/watch?v=M5GP3KJ6Fcs>`_


Atomic System Containers
------------------------

`Atomic System Containers`_ are a new interesting technology that would allow
a system administrator to augment the `Atomic Host`_ without having to modify
the base `ostree`_. This would allow for the ability to run even your container
engine daemon as a container itself. The goal is to provide services that
look/feel native to the system but are containers (Example: ``atomic install foo
&& systemctl start foo.service`` such that ``foo`` is a containerized service).
This is broken down into effectively services distributed as `OCI`_ images,
executed using `runc`_, using `systemd`_ to manage lifecycle, `ostree`_ for
storage management, `skopeo`_ for download/transport of images, and the
metadata/conf specification templates required for various integration points.
Also, any existing `Docker`_ image could be converted into a System Container by
simply adding the configuration templates.

You can demo some of this now on `Atomic Host`_ using the ``atomic install
--system [--name=NAME] CONTAINER`` command.

`Atomic System Containers video
<https://www.youtube.com/watch?v=yQZiRWWEPYo>`


Building and Shipping your own Atomic Host
------------------------------------------

This was a great workshop session put on by Jonathan Lebon that shows you how to
do exactly what the title says. Also provided was a great guide for the workshop
(linked below). I suggest anyone interested in the topic to check out both the
PDF and the video below.

`Workshop Guide PDF <http://jlebon.com/devconf/slides.pdf>`_

`Building and Shipping your own Atomic Host video
<https://www.youtube.com/watch?v=wxzZDdu1fyQ>`_


Audit and Namespaces, Looking Towards Containers
-------------------------------------------------

The main outline of this talk aimed to cover:

* Problems facing auditing and namespaces
* What auditing means for containers
* Possible solutions

First up was an introduction to `Audit`_ itself. Audit is a Linux kernel
auditing mechanism and daemon, it was originally released in 2004, it works with
`SELinux`_, it is effectively a really high powered syslog that focuses on
kernel space. Audit is a reporting tool, it monitors and reports but does not
take action with exception of only one thing: you can configure it to kernel
panic a system in the event of action that `Audit`_ is unable to log properly
(which apparently some high security places would prefer system outage than
anything occur without proper auditing). Next the discussion about kernel
namespaces and the various ones that exist, including their introduction to the
kernel on the timeline. From there a discussion of what containers are and the
misconceptions that have come from them. For starters, the kernel has no concept
of a container, it's a higher level abstraction that combines kernel features
together (namespaces, seccomp, cgroups, etc). The problem comes in that there is
only one audit daemon per system, this is because there is only one kernel per
system. This makes it difficult to map audit events to various namespaces (or
combinations of namespaces based on container storage or networking
configuration).

`Audit and Namespaces, Looking Towards Containers video
<https://www.youtube.com/watch?v=cdyRsz030zs>`_


DevConf.cz Day 2
================

Keynote: A Story of Three Distros: Better Together
--------------------------------------------------

On Day 2 of DevConf, I had the honor of being included as a participant in the
Keynote which was lead by Red Hat's VP of Engineering, Denise Dumas.

This keynote was a discussion about `Fedora`_, `Red Hat Enterprise Linux`_, and
`CentOS`_ as the three distro lineage that makes up the Red Hat Family of
distros, our individual histories, how we came to co-exist as a cross-distro
collaborative effort around operating system technologies, and our plans to
collaborate even more in the future around container technologies and runtimes.
The discussion further extended the concept of a runtime from a standpoint of
being able to migrate them between distros as we decouple these from the
operating system in such cases as containers or `Software Collections`_.

`Day 2 Keynote video
<https://www.youtube.com/watch?v=zrRzqEgmhNE>`_


OpenShift as Enterprise Kubernetes
----------------------------------

`OpenShift`_ is a `kubernetes`_ with many added developer features. One of it's
main goals is to be an Enterprise-grade on-premise `kubernetes`_ distribution
that provides everyone the power to run agile, reliable, distributed systems.
However, there are some misconceptions about containers and orchestration
systems such as `OpenShift`_. First off, containers are not lightweight virtual
machines but instead are entry points for services in a distributed system that
can be the building blocks for applications. The idea here is to "write
applications, not containers"

The `OpenShift`_ Platform provides: service discovery, auto-scaling based on
usage metrics, persistent storage management, configuration and secrets
management, access to platform API from containers, self-deployable applications,
application life cycle management, and build pipelines. The Control Plane is
a set of components that all run on the master node(s): API Server, `etcd`_, the
cluster scheduler, and controller manager.

`OpenShift`_ is extremely powerful and a very cool platform that I urge anyone
interested in to watch the video below, it was an extremely well thought out and
thorough examination of the technology stack.

`OpenShift as Enterprise Kubernetes video
<https://www.youtube.com/watch?v=Fo8gdR9_p9c>`_


Layered Image Build Service: Lessons Learned
--------------------------------------------

I'm proud to say that this presentation was one of mine, I was honored to be
able to speak at the event and I greatly enjoyed the experience.

This talk was about the `Fedora Layered Image Build Service`_ and lessons
learned along the way. I started off by covering the topics of the day and then
diving right in. I began with a fun tale of the time that the Fedora Project
Leader, `Matt Miller`_ (no relation), said (paraphrased) "There's this open
source layered image build system I heard about, we should deploy one!" which
started my 18 month journey to a GA Layered Image Build Service release for
Fedora. I discussed progress along the way, pain points, highlighted and thanked
the various upstreams that kindly supported me along the the way and tipped my
hat to the power of `OpenShift`_. The fundamental lesson learned in all of this
is that nothing in container land is set in stone, expect APIs to change, and
expect backwards incompatible changes to be the norm.

Then we defined containers quickly, had a history lesson of their lineage in
Linux space, covered the differences between a Layered Image and Base Image,
discussed `OpenShift`_ as a platform and use of it's build pipeline and API to
create custom tooling (such as with `OSBS`_).

Another topic of interest as it relates to this system is that of Release
Engineering, most noteably the cornerstones of making software that is:
Reproducible, Auditable, Definable, and Deliverable. This allows us to
understand some of the design decisions of the system.

Finally is the discussion of the Layered Image Build Service itself and the
Fedora specific implementation.

`Layered Image Build Service: Lessons Learned video
<https://www.youtube.com/watch?v=5heEilbRu2c>`_


Fedora Two-Week Atomic Host: Progress and Future
------------------------------------------------

This session was also one that I presented, it was about the Fedora `Atomic
Host`_ and the progress so far on the initiative as well as plans for the
future. First off I wanted to frame the discussion around Release Engineering and
how Fedora traditionally works. As with my previous session I defined Release
Engineering as creating a software pipeline that is Reproducible, Auditable,
Definable, and Deliverable. Also as a point of reference, a "Compose" is the
collection of primitive build artifacts (RPMs), the creation of deliverables
(ISOs, Virt Images, Cloud Images, OCI Based Image, etc), and combination of
these as a collection that is ready for testing and release release. From there
the discussion moved to how the Fedora Release Process works, it is time based
(roughly 6 months), there are Nightly `Rawhide`_ Composes, DistGit is branched
for each upcoming release which triggers Composes to begin for `Branched`_, then
`Milestone Freezes`_ (Alpha, Beta, RC, GA) go into affect with changes subject
to Fedora QE, the `Updates Criteria`_ is updated, and ultimately the GA Release.

However, the goals for the `Atomic Host Two Week`_ were to move Fedora `Atomic
Host`_ out of the Fedora 6 month release cycle in order to allow it to iterate
more rapidly. We also wanted to create a fully automated pipeline for release,
integration, validation, and delivery. We've accomplished a lot on that journey
such as the creation of the new dedicated Atomic Host compose which allows
changes to be made that won't impact the rest of Fedora, automatic generation of
`ostree`_ content based on `Bodhi`_ updates, `AutoCloud`_ automated testing,
and a two-week release cycle that is mostly automated (just need to get
automated signing work done). In the future we hope to make even more progress
around the automated signing, a fully automated end-to-end release (using
`loopabull`_), remove `kubernetes`_ from the base `ostree`_ and move it into
a `system container`_ (which would make the Atomic Host image smaller and
provide more flexibility and choice of container orchestration runtimes for
users). We would also like to change the default configuration to use overlayfs
for container storage on the backend as well as add `kubernetes`_ and
`OpenShift`_, single as well as multi-node, testing.

`Fedora Two-Week Atomic Host: Progress and Future video
<https://www.youtube.com/watch?v=B8xww8vTUqM>`_


DevConf.cz Day 3
================

Keynote: History of Containers
------------------------------

The third day of the conference started with a really fun, entertaining, and
light-hearted exploration of the history of containers starting from Virtual
Machines that started in 1963, through the creation of the `OCI`_, and all the
way up to a comical debate-style presentation about the future of containers and
wild ideas like microkernels.

One of my favorite components of this talk was the introduction of a new analogy
for what used to be known as "Pets vs Cattle" by `Steve Pousty`_. This "Pets vs
Cattle" analogy is often used as a way to refer to computing resources that we
care about having a long life and substantial uptime (such as virtual machines)
vs computing resources that are ephemeral in nature (cloud instances and
containers). The presenter identified that not only is this analogy both
offensive to the billion+ people on the planet that consider cows as sacred
animals, but it is also incorrect in that ranchers don't care about their
cattle. The new proposed analogy is "Ants and Elephants" because ants are
hive-minded and often are ephemeral in nature and they horizontally scale to
accomplish a task (which is more or less what containers aim to do). However,
elephants on the other hand spend a lot of time taking care of members of their
herd, have grave sites where they pay respects to fallen members, and are large
animals that can perform large tasks on their own. Therefore, from now on I will
use the "Ants and Elephants" analogy and I highly encourage others to join me.

`Keynote: History of Containers video
<https://www.youtube.com/watch?v=w99SWWfad4M>`_


Commissaire: Exposing System Management
---------------------------------------

The presentation on `Commissaire`_ introduced the project and it's goals of
exposing systems management over a simple JSON RPC base API that uses `kombu`_
to enable AMQP and performs tasks on the back end with `Ansible`_. Also a point
of note in the presentation is that the commissaire developers are working
upstream with Ansible on the Python2 to Python3 transition as well. The over all
goal is to be able to easily perform maintenance tasks across a container
orchestration environment such as `kubernetes`_ or `OpenShift`_.

`Commissaire: Exposing System Management video
<https://www.youtube.com/watch?v=mqaSbx2YrOE>`_


Ansible for people allergic to Dockerfiles
-----------------------------------------

This session time slot was a short 30-minute one that introduced the concepts of
`ansible-container`_, how it aims to enforce best practices across ansible
modules such that they can easily be re-used for container and non-container
creation/deployments. There was also discussion of how `ansible-container`_ can
deploy to orchestration engines automatically (`kubernetes`_ and `OpenShift`_
currently supported).

NOTE: I was unable to find the video of this talk.


Linch-Pin: Hybrid Cloud Provisioning with Ansible
-------------------------------------------------

`Linch-Pin`_ is a tool that is aimed to provide simple provisioning and
tear-down of environments in multiple on-premise and public cloud providers
using `Ansible`_. The utility currently supports short-lived testing
environments but targeting long-lived production scenarios in the future.

The guiding principle of Linch-Pin is that "Simple is Better" and it's a tool
that originated to replace a really complicated utility called "Provisioner 1.0"
(to the best of my knowledge, Provisioner 1.0 is not a public/open source tool).
`Linch-Pin`_ provides the ability to perform installation/provisioning of
systems based on "Topology Files" as input with the output being logging
information about the creation as well as an ansible inventory file such that
subsequent ansible commands can use it to find/access the specific systems that
were created by Linch-Pin. Documentation can be found `here
<https://linch-pin.readthedocs.io/en/latest/>`_.

`Linch-Pin: Hybrid Cloud Provisioning with Ansible video
<https://www.youtube.com/watch?v=Tb7Zti5Xao8>`_


Scaling Up Aggregated Logging and Metrics on OpenShift
------------------------------------------------------

This session was a technical deep dive talking about how to resolve some really
interesting problems at substantial scale of an `OpenShift`_ container
orchestration cluster. Scenarios examined here were targeting solutions for
clusters with over 10,000 pods in them. Areas such as how to scale
`ElasticSearch`_, `Kibana`_, `Cassandra`_, `fluentd`_, and `heapster`_. The
session gets off in the weeds quick and is very technical. Anyone interested in
these topics or who may potentially run into this level of scale issues is
highly recommended to check out the video.

`Scaling Up Aggregated Logging and Metrics on OpenShift video
<https://www.youtube.com/watch?v=afHxhyOyl1o>_`


Deploying Applications on Atomic Host with Ansible
--------------------------------------------------

The time slot for this session was also a quick 30 minutes and it focused
primarily on quick overview of information about each of `Atomic Host`_, `docker
build`_, `Ansible`_, and `Cockpit`_. Then it was demo time, where the presenter
showed her ansible `playbook`_ and `Dockerfile`_ explaining what each does along
the way. From there it was a live demonstration of the entire thing working
end-to-end to build and deploy a containerize application on Atomic Host using
Ansible and Docker.


`Deploying Applications on Atomic Host with Ansible video
<https://www.youtube.com/watch?v=AO2HDP3hd2E>`_


Testing and Automation and Cooperation: Oh My!
----------------------------------------------

Yet another quick 30 minute time slot that covered a considerable amount of
ground across it's topic space. This session covered Fedora's plans to a fully
integrated CI pipeline for the entire distro with updates being gated by the CI
but easily overridden if/when needed. As an example, the `OpenStack`_ project
already has this kind of CI pipeline. In Fedora land, we need to firmly decide
on what is considered the "input stream" for a CI system as well as determine
what we want to gate on (which turns out to be difficult questions to answer).
Then we need to find a place to run all tests. As a point of note is that
collaboration can be difficult for testing as testing is often project-specific,
requirements are often different and sometimes there's cross-community politics
in play. We collectively need to start moving towards a common backend toolchain
in order to start towards true cross-project collaboration. Currently, we're
targeting `Ansible`_ as that thing (`OpenStack Zuul`_ is already using ansible
on the backend).

`Testing and Automation and Cooperation: Oh My!
<https://www.youtube.com/watch?v=jcsoMrr1FyE>`_


Hallway Track
=============

The hallway tracks are always some of my favorite times at conferences and
DevConf.cz is certainly no different. However, because of the nature of them
I don't have good notes on the discussions that were had and I've included
at least highlight information about the ones that stick out most in my memory


Project Atomic
--------------

I had the opportunity to meet up with some community members of the `Fedora
Atomic WG`_ to discuss various items about plans for the future, the desire to
have multiple update streams, as well as plans for `Fedora Containers`_ and
improving the `Container Guidelines`_. All of these topic items have since been
filed into the `Atomic WG pagure.io space as issue tickets`_ for posterity and
work tracking in the future.


Fedora Infra Managed OpenShift
------------------------------

In another hallway track session a hand full of us were tossing around wild
ideas of having an `OpenShift`_ environment in Fedora space that ran on bare
metal and could provide shared hosting for upstreams to iteratively work on
things in a way that could be integrated directly with Fedora services
(such as `fedmsg`_, `taskotron`_, and `loopabull`_). This might turn out to be
a bit more far fetched than we can really accomplish purely because of the
nature of the request but it's something that everyone in the circle thought was
a good idea at the time.


Closing time...
===============

That, in a really long-winded nutshell, is my DevConf.cz 2017 experience.

I look forward to DevConf.z 2018!

Until next time...

.. _runc: http://runc.io/
.. _CentOS: https://centos.org/
.. _etcd: https://coreos.com/etcd/
.. _ManageIQ: http://manageiq.org/
.. _libvirt: https://libvirt.org/
.. _Pulp: http://pulpproject.org/
.. _WildFly: http://wildfly.org/
.. _Fedora: https://getfedora.org/
.. _oVirt: https://www.ovirt.org/
.. _Matt Miller: https://mattdm.org/
.. _fluentd: http://www.fluentd.org/
.. _kubernetes: https://kubernetes.io/
.. _Cockpit: http://cockpit-project.org/
.. _OCI: https://www.opencontainers.org/
.. _OpenStack: https://www.openstack.org/
.. _OpenShift: https://www.openshift.org/
.. _Atomic WG: https://pagure.io/atomic-wg
.. _Bodhi: https://bodhi.fedoraproject.org/
.. _ElasticSearch: https://www.elastic.co/
.. _Cassandra: https://cassandra.apache.org/
.. _The Foreman: https://www.theforeman.org/
.. _fedmsg: http://www.fedmsg.com/en/latest/
.. _Docker: https://github.com/docker/docker/
.. _Steve Pousty: https://twitter.com/TheSteve0
.. _Candlepin: http://www.candlepinproject.org/
.. _Ansible: https://github.com/ansible/ansible
.. _ostree: https://github.com/ostreedev/ostree
.. _Atomic Host: https://getfedora.org/en/atomic/
.. _Fedora Atomic WG: https://pagure.io/atomic-wg
.. _KVM: http://www.linux-kvm.org/page/Main%5FPage
.. _kibana: https://www.elastic.co/products/kibana
.. _FreeIPA: http://www.freeipa.org/page/Main_Page
.. _Audit: https://people.redhat.com/sgrubb/audit/
.. _taskotron: https://taskotron.fedoraproject.org/
.. _skopeo: https://github.com/projectatomic/skopeo
.. _taskotron: https://taskotron.fedoraproject.org/
.. _heapster: https://github.com/kubernetes/heapster
.. _OpenStack Zuul: http://status.openstack.org/zuul/
.. _SELinux: https://selinuxproject.org/page/Main_Page
.. _OSBS: https://github.com/projectatomic/osbs-client
.. _loopabull: https://github.com/maxamillion/loopabull
.. _AutoCloud: https://apps.fedoraproject.org/autocloud/
.. _Linch-Pin: https://github.com/CentOS-PaaS-SIG/linch-pin
.. _rpm-ostree: https://github.com/projectatomic/rpm-ostree
.. _systemd: https://freedesktop.org/wiki/Software/systemd/
.. _Rawhide: https://fedoraproject.org/wiki/Releases/Rawhide
.. _osbs-client: https://github.com/projectatomic/osbs-client
.. _Commissaire: https://github.com/projectatomic/commissaire
.. _playbook: https://docs.ansible.com/ansible/playbooks.html
.. _Branched: https://fedoraproject.org/wiki/Releases/Branched
.. _ansible-container: https://www.ansible.com/ansible-container
.. _Fedora Modularity: https://fedoraproject.org/wiki/Modularity
.. _Dockerfile: https://docs.docker.com/engine/reference/builder/
.. _Software Collections: https://www.softwarecollections.org/en/
.. _Updates Criteria: https://fedoraproject.org/wiki/Updates_Policy
.. _atomic-reactor:  https://github.com/projectatomic/atomic-reactor
.. _Eternal September: https://en.wikipedia.org/wiki/Eternal_September
.. _Milestone Freezes: https://fedoraproject.org/wiki/Milestone_freezes
.. _module definition: https://pagure.io/modulemd/blob/master/f/spec.yaml
.. _Release Engineering: https://en.wikipedia.org/wiki/Release_engineering
.. _docker build: https://docs.docker.com/engine/reference/commandline/build/
.. _Container Guidelines: https://fedoraproject.org/wiki/Container:Guidelines
.. _Fedora Containers: https://fedoraproject.org/wiki/Container:Review_Process
.. _FESCo: https://fedoraproject.org/wiki/Fedora_Engineering_Steering_Committee
.. _Atomic Host Two Week: https://fedoraproject.org/wiki/Changes/Two_Week_Atomic
.. _Factory 2.0:
    https://communityblog.fedoraproject.org/factory-2-0-mean-modularity/
.. _Speaker Recordings here:
    https://www.youtube.com/channel/UCmYAQDZIQGm_kPvemBc_qwg
.. _system container:
    http://www.projectatomic.io/blog/2016/09/intro-to-system-containers/
.. _Atomic System Containers:
    http://www.projectatomic.io/blog/2016/09/intro-to-system-containers/
.. _Red Hat Enterprise Linux:
    https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
.. _RHEL:
    https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
.. _Atomic WG pagure.io space as issue tickets:
    https://pagure.io/atomic-wg/issues
.. _Fedora Layered Image Build Service:
    https://docs.pagure.org/releng/layered_image_build_service.html
.. _kombu:
    http://docs.celeryproject.org/projects/kombu/en/latest/introduction.html

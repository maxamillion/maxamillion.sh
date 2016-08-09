.. title: Flock to Fedora 2016
.. slug: flock-to-fedora-2016
.. date: 2016-08-09 15:10:44 UTC-05:00
.. tags: Fedora Flock 2016
.. category: blog
.. link:
.. description: Flock to Fedora: Fedora Users and Developers Conference.
.. type: text

Flock to Fedora 2016
====================

Every year, the `Fedora`_ User and Developer community puts on an conference
entitled "`Flock to Fedora`_" or "Flock" for short. This year was no different
and the event was hosted in beautiful `Kraków, Poland
<https://en.wikipedia.org/wiki/Krak%C3%B3w>`_. The event had such an amazing
line up that I rarely had time for the always fascinating "hallway track" of
ad-hoc discussions with various conference go-ers, but in the best kind of way.

.. note:: At the time of this writing, the videos had not yet been posted but it
          was reported that they will be found at the link below.

All the sessions were being recorded and I highly recommend anyone interested to
check them out `here <https://www.youtube.com/fedoraproject>`_.

I will recap my experience and take aways from the sessions I attended and
participated in as well as post slides and/or talk materials that I know of.

Flock Day 1
===========

Keynote: State of Fedora
------------------------

Flock Day 1 started off with a bang, our very own `Fedora Project Leader, Matt
Miller`_ took the stage for the morning keynote and discussed the current state
of Fedora, where we are, where we're going, ongoing work and current noteable
`Changes`_ with work under way.

One of my favorite take aways from this talk was one about contributor
statistics that are gathered based on contributor activity as it is represented
within the `Fedora Infrastructure`_ via `fedmsg`_ and `datagrepper`_
(`datanommer`_). The statistics showed that there are over 2000 contributors, of
which roughly 300 do 90% of the work (which sounds odd, but statistically this
is actually better than average) and of the group that does 90% of the work only
about 35% of them work for Red Hat. I'm a big fan of these kind of numbers
because it reinforces that Fedora is in fact a community driven project that
Red Hat is simply a participant and sponsor of.

`Flock 2016 Keynote State of Fedora slides`_


Introducing Fedora Docker Layered Image Builds
----------------------------------------------

Next time slot that I attended was my presentation on the `Fedora Docker Layered
Image Build System`_ here I introduced something I've been working on for quite
some time with various upstream projects of technologies that come together to
form this system. Before diving into the new service I went on a breif history
lesson about what containers are, what they are in the context of Linux, and
various implementations of which Docker is simply one. The main reason I like to
start there is to level set that we have hopes to support all kinds of Linux
container runtimes and image builds but we must start somewhere and with Docker
being the most popular it makes sense to target it first. (You'd be surprised
how often the question of supporting other image formats comes up)

In an attempt to make sure there were no gaps in knowledge of everyone in the
room for my presentation I did a quick overview of what specifically Docker is,
how containers are instances of images, and how images themselves are most
commonly built (`Dockerfile`_). We then progress into concepts of `Release
Engineering`_ and why this is desireable, as outlined in an `article I wrote
for OpenSource.com`_ recently. From there we traversed into the wild world of
distributed container runtimes and orchestrators, most noteably `OpenShift`_ as
that's a core component of the Layered Image Build Service. We also discussed
components used within the Docker Layered Image Build Service such as
`atomic-reactor`_, `osbs-client`_, and `koji-containerbuild`_. The last of which
enables for the workflow using `fedpkg`_ for layered image builds for `Fedora`_
contributors just as they are used to for `RPM`_.

I then did a demo, that of course failed (as per the Demo Gods) but was able to
show a previously successful build.

.. note:: I have at this point diagnosed the issue found during the demo and it
          has been resolved.

`Introducing Fedora Docker Layered Image Build slides`_

Getting New things into Fedora
------------------------------

In recent past there has been a general communications break down between
developers and Release Engineering, this has resulted in some issues integrating
net-new deliverables within the Fedora Project. This presentation discussed the
process by which new changes should come in, the timelines that things should be
accepted by, and the various Release Engineer Tools that need integrating with.

However, there was admission that the documentation could be better about these
items and the Release Engineering tools could be more approachable for outsiders
in order to help with the process of onboarding new changes into the processes
and tooling. These items have shown improvement in the past year with further
improvements planned.

There was a lively discussion of ways to make this better and I look forward to
seeing positive movement come as a result.

Hacking Koji for fun and Profit
--------------------------------



API exploration, advanced CLI w/ api calls for testing

Containers in Production
------------------------

RunC

https://github.com/containers

https://github.com/runcom/skopeo


Fedora's MirrorManager: now and in the future
---------------------------------------------

Current features, limitations, things we're trying to do in the future to
improve and enable the mirroring of new artifacts.

Fedora ARM stat of the Union
----------------------------

State of AArch64, device support, kernel support, etc

University Outreach - New Task or New Mindset?
----------------------------------------------

Basically there's nothing currently existing, but this is almost a net new
initiative that needs to be re-kicked off.

Day 2
=====

Kirk, McCoy, and Spock build the future of Fedora
-------------------------------------------------

Kellog Logic Model applied to Fedora initiatives

Modularity: Why, where we are and how to get involved
-----------------------------------------------------

Background, there was the Rings Proposal, think about the distro as a set of
rings and the center of rings the central point of the operating system is the
most curated components of the operating system and as you get further from the
center you can have less and less curation.

However, as time went on you have less and less coorelation such that the Rings
analogy really fits. Example, any given package can change over time or need
a different version in a different use case or scenario.

Different use cases, a new website with the latest technologies vs an ERP system
where you want different lifecycles or different "aged" or different levels of
"proven" technologies.

What is a module?

* A thing that is managed as a logical unit
* A thing that promises an external, unchanging, API
* A thing that may have many, unexposed, binary artifacts to support the
  external API
* A module may "contain" other modules and is referred to as a "module stack"

Logic Model for Modularization Prototype Phase

https://fedoraproject.org/wiki/Modularity

Base Runtime (Module Stack)

* Kernel (module)
* userspace (the interface to userspace, coreutils, systemd, etc)

    * There built requirements are not part of the module, but simply a build
      requirement.

modulemd: Describe a module
* yaml definitions of modules, standard document definitions with "install
profiles"
* install profiles
* definition of components included in a module

Factory 2.0
------------

The Eternal September, the second Eternal September: GitHub

node.js is changing how people fundamentally expect things

::

    pip freeze > requirements.txt

Dependency freezing is common practice these days

* nixOS
* coreOS
* docker and friends

"Modularity"
Matt Miller started with Fedora.Next -> Rings, then Envs and Stacks, Red Hat now
funding a team to accomplish this.

Backing up first to discuss how not to throw things over the wall. In past
there's been discussions about how to articulare "Red Hat things" in the Fedora
Space. Ralph works for agroup in Red Hat called RHT DevOps.

Fedora Packagers -> RH PLatform Engineering.

Fedora Infra -> RH PnT DevOps

What Factory 2.0 is no: a single web app, a rewrite of our entire pipeline,
a silver bullet, a silver platter, just modularity, going to be easy.

"the six problem statements"

* Repetitive human intervention makes the pipeline slow
* unnecessary serialization
* rigid cedence
* artifact assumption
* modularity
* dep chain


"If we had problems before, thay're about to get a lot worse" (Imagine
modularity without Factory 2.0)

Would like to use pdc-updater to populate metadata tables with information about
dep chains, we would then use that information with other tools like pungi but
also with new tooling we haven't even thought of just yet.

Unnecessary serialization makes the pipeline slow, one big piece we will need
to is the OpenShift Build Service (OSBS). We're going to need to use an
autosigner.py to get around new problems (assuming we "go big" with containers).

Automating throughput, repetitive human intervention makes things slow. Builds
and composes. An orchestrator for the builds and the composes, best case
scenario is that things are built and composed before we ask for them.

Atomic Host Two Week is kind of a case study that we should learn lessons from
in order to merge the changes needed back into the standard pipeline instead of
the parallel pipeline that was spawned.

Flexible Cadence, The pipeline imposes a rigid and inflexible cadence on
"products". Releases related to the previous point about Automating Releases,
"the pipeline is as fast as the pipeline is".

EOL: think about the different EOL discussions for the different Editions.
Beyond that - a major goal of modularity is "independent lifecycles"

"I want to be able to build anything, in any format, without changing anything"
(not possible) but we can make the pipeline pluggable that will make it easier
over time to add new artifact types to the pipeline.

"The pernicious hobgoblin of technical debt"

* Microservices (consolidate around responsibility)
* Reactive services
* Idempotent services
* Infrastructure automation (Ansible all the things)

Docker in Production
--------------------

#. Containerize
#. Build
#. Distribute

Pagure: Past, Present, and Future
---------------------------------

Old verison was very simple: there were three repos per project: source,
tickets, and pull requests. Recently got a new UI (thanks to Ryan Lerch).

Forks, pull requests.

If you want to run your own pagure, all you need is the web services and the
database. If you'd like all the bells and whistles, you'll then need to add mail
server (pagure milter), pagure eventsource server, gitolite, and a message bus.

Doc hosting (fourth git repository for a project, optional), in the future
considering doing something similar to GitHub Pages

"Watch" repo, to get notifications for a project you're not directly involved in
or to opt out of notifications for a project you are directly involved in,

Roadmap in the Issues tab in the UI for milestones and arbitrary tag filtering.

Issue templates, delivered by markdown files in the issues git repo. Also, can
set a default message to be displayed when someone files a new pull request.


Diversity - Women in Open Source
--------------------------------

Fedora Diversity

* Started roughly a year ago
* No exists an official Fedora Diversity Advisor
* Myths
    * Women are not interested in technology
    * Women can't to programming
    * Men developers are mote talented than women
    * There is no work-life balance for women who work in the tech industry
    * So on and so on ...
* Facts
    * Women in Technology (Mothers of Tech - BizTech)
        * Ada Lovelace (Creator of Programming/Computational Machine)
        * Heddy Lamar (Frequency Hopping)
        * Admiral Hopper (Created COBOL)
        * Many more ...
    * Women are very creative, versatile, powerful, and intelligent
    * Diversity increases success

* Initiatives
    * Grace Hopper Celebration of Women in Computing
    * Women in Open source Award
    * Outreachy
    * Google Summer of Code
    * and many more

* Gaps
    * Lack of knowledge, encouragements, support, and time commitment

* Helping Pyramid
    * "Let us help ourselves"
    * Help and mentor others, women or under represented groups in the community
      to join and participate
    *

Testing Containers using Tunir
------------------------------


Day 3
=====


Lightning Talks
---------------


Automation Workshop
-------------------

Ad-Hoc discussions and work done on automation issues in the various areas of
the Fedora Infrastructure.

OpenShift on Fedora
--------------------

https://github.com/soltysh/talks/blob/master/2016/flock/scenario.md

Building Modules Workshop
-------------------------


.. _RPM: http://rpm.org/
.. _Fedora: https://getfedora.org/
.. _fedpkg: https://pagure.io/fedpkg
.. _OpenShift: https://www.openshift.org/
.. _fedmsg: http://www.fedmsg.com/en/latest/
.. _Flock to Fedora: https://flocktofedora.org/
.. _Changes: https://fedoraproject.org/wiki/Changes/Policy
.. _datanommer: https://github.com/fedora-infra/datanommer
.. _datagrepper: https://apps.fedoraproject.org/datagrepper
.. _osbs-client: https://github.com/projectatomic/osbs-client
.. _Dockerfile: https://docs.docker.com/engine/reference/builder/
.. _atomic-reactor:  https://github.com/projectatomic/atomic-reactor
.. _Fedora Infrastructure: https://fedoraproject.org/wiki/Infrastructure
.. _koji-containerbuild: https://github.com/release-engineering/koji-containerbuild
.. _Fedora Project Leader, Matt Miller:
    https://fedoraproject.org/wiki/User:Mattdm
.. _article I wrote for OpenSource.com:
    https://opensource.com/business/16/7/creating-reproducible-build-system-docker-images
.. _Fedora Docker Layered Image Build System:
    https://fedoraproject.org/wiki/Changes/Layered_Docker_Image_Build_Service
.. _Flock 2016 Keynote State of Fedora slides:
    https://mattdm.org/fedora/2016flock/StateofFedoraAugust2016-v160731a.pdf
.. _Introducing Fedora Docker Layered Image Build slides:
    https://maxamillion.fedorapeople.org/Events/Flock2016/Flock2016_IntroducingDockerLayeredImageBuildService.pdf

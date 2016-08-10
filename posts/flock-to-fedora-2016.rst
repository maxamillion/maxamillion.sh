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
of Fedora, where we are, where we're going, ongoing work and current notable
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
form this system. Before diving into the new service I went on a brief history
lesson about what containers are, what they are in the context of Linux, and
various implementations of which `Docker`_ is simply one. The main reason I like
to start there is to level set that we have hopes to support all kinds of Linux
container runtimes and image builds but we must start somewhere and with Docker
being the most popular it makes sense to target it first. (You'd be surprised
how often the question of supporting other image formats comes up)

In an attempt to make sure there were no gaps in knowledge of everyone in the
room for my presentation I did a quick overview of what specifically Docker is,
how containers are instances of images, and how images themselves are most
commonly built (`Dockerfile`_). We then progress into concepts of `Release
Engineering`_ and why this is desirable, as outlined in an `article I wrote
for OpenSource.com`_ recently. From there we traversed into the wild world of
distributed container runtimes and orchestrators, most notably `OpenShift`_ as
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
in order to help with the process of on-boarding new changes into the processes
and tooling. These items have shown improvement in the past year with further
improvements planned.

There was a lively discussion of ways to make this better and I look forward to
seeing positive movement come as a result.

Hacking Koji for fun and Profit
--------------------------------

In this session, tip and tricks for hacking on the `Koji`_ build system were the
focal point. Discussion about what Koji is, who uses it, and why someone might
want to hack it was explored. Then an overview of the major components of Koji
were presented in an attempt to give potential developers an idea of where to
look in the code depending on what component they were trying to augment or
supplement. From there a quick example of the `Python`_ API was covered as an
example of how to get started, including reference for a more advanced example
contained within the koji code itself was offered. Next up was a advanced CLI
walk through that showed how to call directly to the XMLRPC API just as you can
via the Python API.

There was a section of the session focused on the Koji Hub which is the user
facing component including how to theme the web UI, change user policy, and how
to write plugins that can add functionality to Koji via new API calls, policies,
and callback hooks.

Next up was discussion of Koji Builder plugins that can add the ability for Koji
to produce new types of Build Artifacts.

Finally, how to actually clone the git repository and then build locally
a version of the modified code was covered.

During the Q&A portion there was a discussion of how difficult Koji can be to
deploy and that it would be nice if there was a way to get up and running
quickly for hacking purposes. Something that was completely automated and not
necessarily production ready would be desired. There was also lively discussion
about the future of Koji and the iterative improvements already made in
refactoring the code as well as plans for more. Originally there was a grand
plan for a "Koji 2.0" that would be a complete rewrite but as time has gone on
that has proven too lofty of a goal to realistically achieve so the more
iterative approach is being taken.

`Hacking Koji for Fun and Profit slides`_

Containers in Production
------------------------

Dan Walsh discussed running Containers in Production, a topic that is hot on
many people's mind as container technology races into the mainstream as fast as
OpenStack did before it. This session discussed various means of container
runtime execution, including that of Docker and it's daemon. This included
various aspects the Docker daemon's strengths and weaknesses and why alternative
execution methods might be desirable or at least worth considering for
Production workloads and environments. Various aspects such as storage
configuration, non-privileged runtimes (security), remote inspection, fault
tolerance, and `systemd`_ integration were discussed.

In this presentation was a strategy for running production ready containers
using `runC`_ for execution of Open Container Initiative (`OCI`_) compliant
container images (such as Docker Images).


https://github.com/containers

https://github.com/projectatomic/skopeo

Fedora's MirrorManager: now and in the future
---------------------------------------------

The session about `MirrorManager`_ was extremely informative, covering various
aspects of the project, a brief overview of the history then diving into current
features, limitations, things we're trying to do in the future to improve and
enable the mirroring of new artifacts.

There were plenty of items that I would like to follow up on as there's so much
about content mirroring that I don't currently understand.

I sadly did not take nearly as good of notes during this session as I had hoped
to. I highly recommend anyone interested in the topic of content mirroring to
watch the recorded session for more information.

Fedora ARM State of the Union
-----------------------------

Peter Robinson gave a presentation about the current state of `Fedora ARM`_
including both armv7hl and AArch64. At the start of things he requested that
questions about specific dev boards be held to the end because he would have
a section in the session dedicated to that. Exploration of the trials and
tribulations of bringing new hardware to life was interesting (at least to me)
as there's so many things that we in the pre-existing hardware platform world
take for granted. There's many things about the ARM world and boot firmware that
make things difficult because of lack of standardization around the developer
board boot methods beyond just the standard trouble of bringing up new hardware
that doesn't yet have support for everything necessary in the kernel. Beyond
the kernel is the compiler toolchains and programming language tooling that
needs added support for new architectures such as ARM, various points of this
were discussed with examples of areas where people in the Fedora community have
stepped up to help (`Haskell SIG`_ being one great example).

From there discussions of various developer boards spiraled off into the weeds
of things that I definitely don't understand about the finer points of ARM board
"bring up" but it was interesting to listen to the state of things and take
notes of things to learn about.

University Outreach - New Task or New Mindset?
----------------------------------------------

Justin Flory and Jona Azizaj presented about the history of the `University
Involvement Initiative`_, the struggles met with attempting to expand it's
adoption and further reach, and eventually it's decline. This session was a call
to arms for community members with ties to Universities either as active
students or Alumni to help bring this initiative back to life. The main idea
behind all of this is that we would like to help foster the open source
community by bringing an active student population into it's ranks. There was
a lot of positive feedback and interest shown during the session and I have high
hopes for the future of the initiative.


Fedora Engineering Team Dinner
------------------------------

While not on the Flock schedule, this was a personal highlight for me as
a member of the `Fedora Engineering Team`_ because we are a geographically
dispersed team that lives and works from all corners of the planet. As such, we
rarely get the opportunity to all be in the same place, at the same time, and in
a social setting (as opposed to getting work done). It was great to be able to
sit and chat with colleagues and discuss both work and non-work topics and get
to know them better on a more personal level.

The main take away: I love my job, I love my team, and I love my company.

Day 2
=====

Kirk, McCoy, and Spock build the future of Fedora
-------------------------------------------------

Matt Miller took us on a Star Trek themed adventure that lead to the use of the
`Kellog Logic Model`_ applied to Fedora Initiatives and how each Working Group
(WG) or Special Interest Group (SIG) could use this model as a means to help
drive their goals as well as frame their over all initiatives to others,
including the `Fedora Council`_ and `FESCo`_. The session slides were covered
rather quickly and then discussions and questions broke out about how we could
use this for various things and/or just general questions about the logic model.

The `Fedora Modularity Logic Model`_ was an example where this is already being
used within the Fedora Project with success.

Modularity: Why, where we are and how to get involved
-----------------------------------------------------

`Fedora Modularity`_ is a new initiative that is focused on re-thinking how we
think of the way Linux distributions are composed. Instead of as a pile of
software packages, it could be a grouping of modules that can be managed as
disjoint units and lifecycle managed independently of one another.

Background on the topic leads back to the Rings Proposal (a part of
`Fedora.next`_), where we think about the distro as a set of rings and the
center of rings the central point of the operating system is the most curated
components of the operating system and as you get further from the center you
can have less and less curation.

However, as time went on you have less and less correlation such that the Rings
analogy doesn't really fit. Example, any given package can change over time or
need a different version in a different use case or scenario.

Different use cases, a new website with the latest technologies vs an ERP system
where you want different lifecycles or different "aged" or different levels of
"proven" technologies. This is the problem that modules hope to solve.

What is a module?

* A thing that is managed as a logical unit
* A thing that promises an external, unchanging, API
* A thing that may have many, unexposed, binary artifacts to support the
  external API
* A module may "contain" other modules and is referred to as a "module stack"

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

There was plenty of discussion around these topics and suggestion that people
attend the workshop the following day.

Factory 2.0
------------

As with all things in technology, we want to constantly move faster and faster
and the current methods by which we produce the operating system just won't
scale into the future. Factory 2.0 is an initiative to fix that.

The presentation kicked off with a witty note that we have entered the "The
Second `Eternal September`_," GitHub and how node.js has changed how people
fundamentally expect to consume code.

Dependency freezing has become common practice these days because of node.js and
rubygems communities impact on developers.

::

    pip freeze > requirements.txt

* ruby bundler
* nixOS
* coreOS
* docker and friends

Brief overview of `Fedora Modularity`_ was given for those who didn't make it to
Langdon's session on the topic.

Matt Miller started with Fedora.Next -> Rings, then Envs and Stacks, Red Hat now
funding a team to accomplish this.

Backing up first to discuss how not to throw things over the wall. In past
there's been discussions about how to articulate "Red Hat things" in the Fedora
Space. `Ralph Bean`_ (our presenter) works for a group in Red Hat called RHT
DevOps.

There are analogous groups within Red Hat and the Fedora Community:

Fedora Packagers -> RH Platform Engineering

Fedora Infra -> RH PnT DevOps

What Factory 2.0 is not: a single web app, a rewrite of our entire pipeline,
a silver bullet, a silver platter, just modularity, going to be easy.

"the six problem statements"

* Repetitive human intervention makes the pipeline slow
* unnecessary serialization
* rigid cadence
* artifact assumption
* modularity
* dep chain

"If we had problems before, they're about to get a lot worse" (Imagine
modularity without Factory 2.0)

Would like to use `pdc-updater`_ to populate metadata tables with information
about dep chains, we would then use that information with other tools like
`pungi`_ but also with new tooling we haven't even thought of just yet.

Unnecessary serialization makes the pipeline slow, one big piece we will need
to solve this is the OpenShift Build Service (OSBS). We're going to need to use
an autosigner.py to get around new problems (assuming we "go big" with
containers).

Automating throughput, repetitive human intervention makes things slow. Builds
and composes. An orchestrator for the builds and the composes, best case
scenario is that things are built and composed before we ask for them.

`Atomic Host Two Week`_ is kind of a case study that we should learn lessons from
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

"The pernicious hobgoblin of technical debt" as Ralph called it.

Ways we can do better and refactor:

* Microservices (consolidate around responsibility)
* Reactive services
* Idempotent services
* Infrastructure automation (`Ansible`_ all the things)

Docker in Production
--------------------

The Docker in Production session was a very brief walk through of how you can go
from your laptop to a production environment. This effectively boiled down to
best practice for how to "containerize" your application properly, ways to build
docker images and tagging schemes that you can (or should) use, a distribution
mechanism for the images, and finally a distributed orchestration framework such
as `Kubernetes`_, `OpenShift`_, or `Docker Swarm`_.

Pagure: Past, Present, and Future
---------------------------------

`Pagure`_ is a git forge.

Old version was very simple: there were three repos per project: source,
tickets, and pull requests. Recently got a new UI (thanks to Ryan Lerch).

Forks, pull requests. (A very GitHub style workflow).

If you want to run your own pagure, all you need is the web services and the
database. If you'd like all the bells and whistles, you'll then need to add mail
server (pagure milter), pagure eventsource server, gitolite, and a message bus.

Doc hosting (fourth git repository for a project, optional), in the future
considering doing something similar to `GitHub Pages`_.

"Watch" repo, to get notifications for a project you're not directly involved in
or to opt out of notifications for a project you are directly involved in.

Roadmap in the Issues tab in the UI for milestones and arbitrary tag filtering.

Issue templates, delivered by markdown files in the issues git repo. Also, can
set a default message to be displayed when someone files a new pull request.


Diversity - Women in Open Source
--------------------------------

The session on `Fedora Diversity`_ began with a lot of wonderful information
about the initiative and I have outlined to the best of my ability focal points
of those slides here.

* Started roughly a year ago
* No exists an official Fedora Diversity Adviser
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

After the slides were done, the session turned into effectively a giant round
table of people telling stories of how they've been successful because of
diverse teams, reasons they think that women and other groups of people are
currently under represented in Fedora and Open Source, ways they feel we can
increase diversity, and methods that could be used to target various under
represented groups in the Global Open Source community.

The `GNOME Outreachy`_ program was also discussed as a great example of
a program working to move things in the right direction around the topic of how
we can try to actively improve our community and the open source community at
large.

I hope to be able to participate in some of the take aways from these
discussions as they are put into action.

Testing Containers using Tunir
------------------------------

`tunir`_ is a simple tool that will spawn a virtual machine or several virtual
machine and then execute arbitrary commands and report success or failure of the
commands based on the exit code of the command. You can also make commands
blocking or non blocking and tunir has support for `Docker`_ images as well as
support for spinning up a `kubernetes`_ multi-node cluster in order to test
containers "at scale". The presentation was short and to the point with plenty
of demos showing how easy it is to get started using tunir. Also, tunir is the
testing component behind `Fedora AutoCloud`_.

Cruise Krakow
-------------

In the evening of Day 2 the Flock participants had the unique opportunity to
dine on the Vistula River and take a small tour up and down the river for some
site seeing. It was a beautiful scenic way to wind down with fellow Fedora
Flockers after a full day of sessions and technical discussions.

Day 3
=====

Lightning Talks
---------------

Day 3 kicked off with `Lightning Talks`_, I presented one myself about a small
project I've been working on titled `Loopabull`_ which is an event loop driven
`Ansible`_ playbook execution engine. There were also plenty of other wonderful
lightning talks covering topics such as `Fedora Marketing`_, `OpenShift`_
provisioning on Fedora with `Amazon Web Services`_, `Fedora CommOps`_,
`dgplug`_, and so much more.

Automation Workshop
-------------------

The automation workshop was kind of an anti-presentation session as the session
leader wanted this to either become more of a hacking session of a problem
solving session. As such, ad-Hoc discussions and work done on automation issues
in the various areas of the `Fedora Infrastructure`_ occurred and people broke
off into smaller groups within the room to work or solve problems.

OpenShift on Fedora
--------------------

This session was about running `OpenShift`_ on `Fedora`_ using the latest and
greatest features of OpenShift, most notably the new component called ``oc
cluster up`` which is an auto-deployment provisioning tool built directly into
OpenShift as of version v1.3+ which allows for the automatic creation of
a clustered environment. The entire session was provided as a very well
documented walk through and the link is below.

`OpenShift on Fedora Guided WalkThrough`_

Building Modules Workshop
-------------------------

The Modules building workshop came together as a hybrid approach of some
presentation, some discussion, some demo, and some "follow along" workshop
style. This was a lot of fun and incredibly informative, there was lively
discussion about aspects of a `module definition`_ (for me it was mostly about
trying to wrap my head around everything, and the session hosts were very
accommodating).

There were many notes taken during the session and they were preserved in an
`etherpad instance <http://piratepad.nl/module-build>`_ but in the event that
it gets lost in the ether over time I have exported it's contents to my
FedoraPeople space and it can be viewed `here
<https://maxamillion.fedorapeople.org/Events/Flock2016/module-build-latest.html>`_.

Brewery Lubicz
--------------

Next up is the evening event which was hosted in a brewery complete with
wonderful catering.

As per the schedule:

A feast and beer tasting awaits us at Browar Lubicz, a recently restored
brewery. The brewery dates from 1840 and has been brewing beer almost
continuously, even during nationalization in the 1950s. Restored in September
2015, the brewery is a high point of a trip to Krakow.

Day 4
=====

Day 4 was Friday and I slept in a little because I was going to be staying up
overnight in order to catch my 4am taxi to the airport to begin the journey back
home so I regretfully missed the morning session on `Ansible`_ best practices but
I was told it was very good and I have every intention to watch it on YouTube
once the video is posted.

What we do for Docker image test automation
-------------------------------------------

I attended this session for about 45 minutes but it quickly became apparent that
the other participants were very new to `Docker` and `taskotron`_ in general and
the session would therefore be very introductory in nature so I departed to join
a workshop elsewhere. This session was by no means bad and I think anyone who is
new to the topic of `Docker`_ or `taskotron`_ and is interested how these two
things are being used together in order to test Docker Images should absolutely
have attended or should watch the recording on YouTube after the fact.

Server SIG Pow-Wow
------------------

A lot of things are changing in the Fedora Project, particularly for
modularization. This session was by and large a collaborative brainstorming and
planning session for how to take advantage of the new initiative and how to
adapt properly. `RoleKit`_ became a focal point of discussion as well as
`Ansible`_ and potentially an integration with the two. Aspects of the
discussion related back to the `Fedora Formulas`_ proposal that unfortunately
didn't get off the ground at the time.

The session leader graciously took notes and has plans to post a write up.

Informal Friday Night Shenanigans
---------------------------------

Friday night a group of us Flockers took to the streets of Krakow City Center in
order to take in as much of the local cuisine, culture, and sites as we could on
our last night in town (at least it was the last night for some of us). This was
a really great outing and I had the opportunity to make some new friends within
the Fedora Community that I had yet to meet in person. It was a wonderful way to
close out an amazing event.

I look forward to Flock 2017!

Until next time...

.. _RPM: http://rpm.org/
.. _runC: http://runc.io/
.. _dgplug: https://www.dgplug.org
.. _Python: https://www.python.org
.. _Koji: https://pagure.io/koji
.. _pungi: https://pagure.io/pungi
.. _Fedora: https://getfedora.org/
.. _fedpkg: https://pagure.io/fedpkg
.. _Pagure: https://pagure.io/pagure
.. _Ralph Bean: http://threebean.org/
.. _Kubernetes: http://kubernetes.io/
.. _OCI: https://www.opencontainers.org/
.. _OpenShift: https://www.openshift.org/
.. _GitHub Pages: https://pages.github.com/
.. _fedmsg: http://www.fedmsg.com/en/latest/
.. _Docker: https://github.com/docker/docker/
.. _Fedora ARM: https://arm.fedoraproject.org/
.. _Flock to Fedora: https://flocktofedora.org/
.. _Ansible: https://github.com/ansible/ansible
.. _Amazon Web Services: https://aws.amazon.com/
.. _tunir: http://tunir.readthedocs.io/en/latest/
.. _Docker Swarm: https://github.com/docker/swarm/
.. _GNOME Outreachy: https://www.gnome.org/outreachy/
.. _Loopabull: https://github.com/maxamillion/loopabull
.. _Fedora CommOps: https://fedoraproject.org/wiki/CommOps
.. _Fedora Council: https://fedoraproject.org/wiki/Council
.. _MirrorManager: https://fedorahosted.org/mirrormanager/
.. _Changes: https://fedoraproject.org/wiki/Changes/Policy
.. _datanommer: https://github.com/fedora-infra/datanommer
.. _Fedora.next: https://fedoraproject.org/wiki/Fedora.next
.. _datagrepper: https://apps.fedoraproject.org/datagrepper
.. _Haskell SIG: https://fedoraproject.org/wiki/Haskell_SIG
.. _pdc-updater: https://github.com/fedora-infra/pdc-updater
.. _osbs-client: https://github.com/projectatomic/osbs-client
.. _Fedora Diversity: https://fedoraproject.org/wiki/Diversity
.. _Fedora Marketing: https://fedoraproject.org/wiki/Marketing
.. _Fedora AutoCloud: https://apps.fedoraproject.org/autocloud
.. _Fedora Modularity: https://fedoraproject.org/wiki/Modularity
.. _Dockerfile: https://docs.docker.com/engine/reference/builder/
.. _Fedora Formulas: https://fedoraproject.org/wiki/Fedora_formulas
.. _atomic-reactor:  https://github.com/projectatomic/atomic-reactor
.. _Eternal September: https://en.wikipedia.org/wiki/Eternal_September
.. _Fedora Infrastructure: https://fedoraproject.org/wiki/Infrastructure
.. _module definition: https://pagure.io/modulemd/blob/master/f/spec.yaml
.. _Lighning Talks: https://fedoraproject.org/wiki/Flock/Lightning_Talks_2016
.. _Fedora Engineering Team: https://fedoraproject.org/wiki/Fedora_Engineering
.. _FESCo: https://fedoraproject.org/wiki/Fedora_Engineering_Steering_Committee
.. _Atomic Host Two Week: https://fedoraproject.org/wiki/Changes/Two_Week_Atomic
.. _koji-containerbuild:
    https://github.com/release-engineering/koji-containerbuild
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
.. _Hacking Koji for Fun and Profit slides:
    https://mikem.fedorapeople.org/Talks/flock-2016-hacking-koji/#/
.. _University Involvement Initiative:
    https://fedoraproject.org/wiki/Objectives/University_Involvement_Initiative
.. _Kellog Logic Model:
    https://www.wkkf.org/resource-directory/resource/2006/02/wk-kellogg-foundation-logic-model-development-guide
.. _Fedora Modularity Logic Model:
    https://fedoraproject.org/wiki/Objectives/Fedora_Modularization,_Prototype_Phase
.. _OpenShift on Fedora Guided WalkThrough:
    https://github.com/soltysh/talks/blob/master/2016/flock/scenario.md

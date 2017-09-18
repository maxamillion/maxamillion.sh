.. title: Flock to Fedora 2017
.. slug: flock-to-fedora-2017
.. date: 2017-09-18 11:48:20 UTC-05:00
.. tags: Fedora Flock 2017
.. category: blog
.. link:
.. description: Flock to Fedora: Fedora Users and Developers Conference.
.. type: text

Flock to Fedora 2017
====================

Every year, the `Fedora`_ User and Developer community puts on an conference
entitled "`Flock to Fedora`_" or "Flock" for short. This year was no different
and the event was hosted in lovely `Cape Cod, MA
<https://en.wikipedia.org/wiki/Cape_Cod>`_.

This year's Flock was a little different in focus than previous year's, the goal
of the event organizers appeared to be that of "doing" as apposed to "watching
presentations" which worked out great. As an user and contributor conference,
almost everyone there was a current user or contributor so workshops to help
enhance people's knowledge level, have them contribute to an aspect of the
project, or to introduce them to a new area of the Fedora Project in a more
hands-on way was met with enthusiastic participation. There were definitely
still "speaking tracks" but there were more "participation tracks" than years
past and it turned out to be a lot of fun.

.. note:: At the time of this writing, the videos had not yet been posted but it
          was reported that they will be found at the link below.

All the sessions were being recorded and I highly recommend anyone interested to
check them out `here <https://www.youtube.com/fedoraproject>`_.

I will recap my experience and take aways from the sessions I attended and
participated in as well as post slides and/or talk materials that I know of.

Flock Day 1
===========

Keynote: Fedora State of the Union
----------------------------------

The `Fedora Project Leader, Matt Miller`_ took the stage for the morning
keynote following a brief instructional Logistics/Intro statement by event
organizers. Matt discussed the current state of Fedora, where we are, where
we're going, ongoing work and current notable `Changes`_ with work under way.


Big key take-aways here was that `Fedora Modularity`_ and `Fedora CI`_ are big
initiatives aiming to bring more content to our users, in newly consumable ways,
even faster than ever before without compromising quality (and hopefully
improving it).

`Flock 2017 Keynote State of Fedora slides`_


Factory 2.0, Fedora, and the Future
-----------------------------------

One of the big pain points from the Fedora contributor's standpoint is how long
it takes to compose the entire distro into an usable thing. Right now, once
contributors have pushed source code and built RPMs out of it, you have to take
this giant pile of RPMs, create a repository, then start to build things out of
it that are stand-alone useful for users. These kinds of things are install
media, live images, cloud and virt images, container images, etc.

`Factory 2.0`_ aims to streamline these processes, make them faster, more
intelligent based on tracking metadata about release artifacts and taking action
upon those artifacts only when necessary, and make everything "change driven"
such that we won't re-spin things for the sake of re-spinning or because some
time period has elapsed, but instead will take action conditionally on a change
occurring to one of the sources feeding into an artifact.

For those who remember last Flock, there was discussion of this concept of the
`Eternal September`_ and this was a progress report update of the work that's
being done to handle that as well as clean up the piles of technical debt that
have accrued over the last 10+ years.


Multi-Arch Container Layered Image Build System
-----------------------------------------------

Next time slot that I attended was my presentation on the new plans to provide
a Multi-Architecture implementation of the `Fedora Layered Image Build
Service`_. The goal here is to provide a single entry point for Fedora Container
Maintainers to contribute containerized content, submit it to the build system,
and then have multiple architecture container builds as a result. This is
similar to how the build system operates for RPMs today and we aim to provide
a consistent experience for all contributors.

This is something that's still being actively implemented with various upstream
components that make up the build service, but will land in the coming months.
It was my original hope to be able to provide a live demo, but it unfortunately
didn't work out.

`Multi-Arch Fedora Layered Image Build Service slides`_

Become a Container Maintainer
-----------------------------

A workshop put together by `Josh Berkus <https://twitter.com/fuzzychef>`_ that
I helped with was to introduce people who'd never created a container within the
`Fedora Layered Image Build Service`_ to our best practices and guidelines. Josh
took everyone through an exercise of looking at a Dockerfile that was not in
compliance with the guidelines and then interactively with the audience bringing
it into compliance.

After the example was completed, Josh put up a list of packages or projects that
would be good candidates for becoming containerized and shipped to the Fedora
User base. Everyone split up into teams of two (we got lucky, there was an even
number of people in the room), and they worked together to containerize
something off the list. He and I spent a period of the time going around and
helping workshop attendees and then with about 10 minutes left the teams traded
their containerized app or service with someone else and performed a container
review in order to give them an idea of what that side of the process is like.

Hopefully we've gained some new long term container maintainers!

Fedora Environment on Windows Subsystem for Linux
--------------------------------------------------

This session is one that I think many were surprised would ever happen, most
notably because I think for those who've been in the Linux landscape for long
enough to remember Microsoft's top brass calling Linux a cancer, we never would
have predicted `Windows Subsystem for Linux`_ existing. However, time goes on,
management changes, and innovation wins. Now we have this magical thing called
"Windows Subsystem for Linux" that doesn't actually run Linux at all, but
instead runs programs meant to run on Linux without modification or
recompilation.

The session goes through how this works, how the Windows kernel accomplishes
the feats of magic that it does and the work that `Seth Jennings
<https://twitter.com/sjenninglinux>`_ (the
session's presenter) put in to get Fedora working as a Linux distribution to run
on top of Windows Subsystem for Linux. It's certainly very cool, a wild time to
be alive, and something I think will ultimately be great for Fedora as an avenue
to attract new users without having to shove them into the deep end right away.

`Fedora Environment on Windows Subsystem for Linux slides`_

Day 2
=====

Freshmaker
----------

Going along with the theme of continuing to try and deliver things faster to our
users, this session discusses a new service that's being rolled out in Fedora
Infrastructure that will address the needs of "keeping things fresh" in Fedora.
Introducing `Freshmaker`_

As it stands today, we don't have a good mechanism by which to track the
"freshness" of various pieces of software, there's been some attempts at this in
the past and they weren't necessarily incorrect or flawed but they never had the
opportunity to come to fruition for one reason or another. Good news is that
Freshmaker is a real thing, it's a component of `Factory 2.0`_ and is tasked the
job of making sure that software in build pipeline is fully up to date with
latest input sources for easy of maintaining updated release artifacts for
end users to download.

Gating on Automated Tests in Fedora - Greenwave
-----------------------------------------------

`Greenwave`_ is another component of `Factory 2.0`_ with the goal of
automatically blocking or releasing software based on automated testing such
that the tests are authoritative. This session discussed the motivations and the
design as well as discussed how to override Greenwave via `WaiverDB`_.

Discussing Kubernetes and Origin Deployment Options
---------------------------------------------------

This session was mostly about `kubernetes`_, `OpenShift`_, and how to deploy
them on `Fedora`_ in different ways. There was a brief presentation and then
discussions about preferred methods of deployment, what we as a community
would like to and/or should pursue as the recommended method by which we direct
new users to install these technologies.


Fedora ARM Status Update
------------------------

Fedora's ARM champion, `Peter Robinson`_, gave an update of where things are in
ARM land, discussing the various development boards available and what Fedora
contributors and community members can expect in the next couple Fedora
releases.

On OpenShift in Fedora Infrastructure
-------------------------------------

This session was a working/discussion session that revolved around how the
`Fedora Infrastructure`_ Team plans to utilize `OpenShift`_ in the future for
Fedora services in order to achieve higher utilization of the hardware we
currently have available and to allow for applications to be developed and
deployed in a more flexible way. The current plans are still being discussed and
reviewed, which is part of what this session was for, but stay tuned for more in
the coming weeks.

The Future of fedmsg?
---------------------

Currently, `fedmsg`_ is Fedora's unified message bus. This is where all
information about activities within the Fedora Infrastructure are sent and
that's not slated to change anytime soon. However, there's new use cases for the
messages that will go out on the message bus that have changed in scope and the
reliability of message delivery is something that will become a more hard
pressing requirement. This presentation was about a proposal to add new
transports for messages in addition to the one that already exists, allowing
various services needing to listen for fedmsgs to subscribe to the protocol
endpoint that most makes sense for the purpose. This session opened a discussion
with a proposal to satisfy the newer needs while leaving the current
infrastructure in place by taking advantage of some of the features of
`ZeroMQ`_.

Day 3
=====

What does Red Hat want?
-----------------------

This was a very candid and honest presentation by our once long standing Fedora
Infrastructure lead, Mike McGrath, who spoke on behalf of Red Hat as the primary
corporate sponsor of Fedora as to what specifically Red Hat as an entity hopes
to gain from the ongoing collaboration with the Fedora Community, and the
innovations they hope to help foster moving forward. I unfortunately did not
take good notes so don't have much in the way to provide as far as specifics so
we'll have to wait for the videos to become available for those interested in
this material.

Fedora Infrastructure: To infinity and beyond
---------------------------------------------

The `Fedora Infrastructure`_ lead, `Kevin Fenzi`_, stood infront of a whiteboard
and kicked off a workshop where interested parties and contributors to the
Fedora Infrastructure outlined and planned major initiatives for the Fedora
Infrastructure for the next year. Headliners here from general consensus is that
`OpenShift`_ will definitely be leveraged more heavily but it will require some
well defined policy around development and deployment for the sake of sanitizing
where code libraries come from for security, auditing, and compliance purposes.
The other main topic of discussion was metrics reporting, various options will
be evaluated with front runners being the `Elastic Stack`_, `Hawkular`_, and
`Prometheus`_.

Modularity - the future, building, and packaging
------------------------------------------------

This session was a great introduction to how things are going to fit together,
we dove pretty far into the weeds with some of the tech behind how `Fedora
Modularity`_ fits together and ultimately if anyone is interested in digging in
there, the official docs really are quite good. I would recommend anyone
interesting in learning about the technical details about modularity to give it
a look.

Let's Create a Module
---------------------

In this workshop, put on my `Tomas Tomecek`_, we learned how to create a module
and feed it into the Fedora Module Build System (MBS). This was an interesting
exercise to go through because it helped define the relationship between rpms,
modules, non-rpm content, and the metadata that ties all of this together with
disjoint modules to create variable lifecycles between different sets of
software that come together as a module. I was unable to find the slides from
the talk, but our presenter recently `tweeted
<https://twitter.com/TomasTomec/status/909810676281085953>`_ that a colleague of
his wrote a blog post he thinks is even better than the workshop, so maybe give
that a go. :)

Continuous Integration and Deliver of our Operating System
----------------------------------------------------------

The topic of Continuous Integration (CI) is one that's extremely common in
software development teams and it is not a new concept. But what if we were
going to take that concept and apply it to the entire Fedora distribution? Now
that might be something special and could really pay off for the user and
contributor base therein. This is exactly what the `Fedora CI`_ initiative aims
to do.

What's most interesting to me about this presentation was that it went through
an exercise of thought and then showed specifically how a small team was able to
accomplish more work than almost anyone though they could because they treat the
bot they've written to integrate their CI pipeline with various other services
as a member of the team. They taught themselves to not think of it as a system
but as a team member they could offload work to, the work that nobody else
wanted to do.

I look forward to seeing a lot of this work come to fruition.

Day 4
=====

The last day of the conference we had a "Show and Tell" where various members
from different aspects of the projects got together and worked on things. The
rest of the day was a hackathon for those who were still in-town and not
traveling back home mid-day.

As always, Flock was a blast and I can't wait for Flock 2018!

Until next time...

.. _ZeroMQ: http://zeromq.org/
.. _Fedora: https://getfedora.org/
.. _kubernetes: https://kubernetes.io
.. _Hawkular: http://www.hawkular.org/
.. _Prometheus: https://prometheus.io/
.. _OpenShift: https://www.openshift.org/
.. _fedmsg: http://www.fedmsg.com/en/stable/
.. _Flock to Fedora: https://flocktofedora.org/
.. _Ansible: https://github.com/ansible/ansible
.. _Fedora CI: https://fedoraproject.org/wiki/CI
.. _Tomas Tomecek: https://twitter.com/tomastomec
.. _Elastic Stack: https://www.elastic.co/products
.. _Kevin Fenzi: https://fedoraproject.org/wiki/User:Kevin
.. _Fedora CommOps: https://fedoraproject.org/wiki/CommOps
.. _Fedora Council: https://fedoraproject.org/wiki/Council
.. _Changes: https://fedoraproject.org/wiki/Changes/Policy
.. _Fedora.next: https://fedoraproject.org/wiki/Fedora.next
.. _Fedora Diversity: https://fedoraproject.org/wiki/Diversity
.. _Fedora Marketing: https://fedoraproject.org/wiki/Marketing
.. _Fedora AutoCloud: https://apps.fedoraproject.org/autocloud
.. _Fedora Modularity: https://docs.pagure.org/modularity/
.. _Peter Robinson: https://fedoraproject.org/wiki/User:Pbrobinson
.. _Eternal September: https://en.wikipedia.org/wiki/Eternal_September
.. _Factory 2.0: https://fedoraproject.org/wiki/Infrastructure/Factory2
.. _Fedora Infrastructure: https://fedoraproject.org/wiki/Infrastructure
.. _Release Engineering: https://en.wikipedia.org/wiki/Release_engineering
.. _Fedora Engineering Team: https://fedoraproject.org/wiki/Fedora_Engineering
.. _FESCo: https://fedoraproject.org/wiki/Fedora_Engineering_Steering_Committee
.. _Freshmaker:
    https://fedoraproject.org/wiki/Infrastructure/Factory2/Focus/Freshmaker
.. _Greenwave:
    https://fedoraproject.org/wiki/Infrastructure/Factory2/Focus/Greenwave
.. _WaiverDB:
    https://fedoraproject.org/wiki/Infrastructure/Factory2/Focus/WaiverDB
.. _Windows Subsystem for Linux:
    https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux
.. _koji-containerbuild:
    https://github.com/release-engineering/koji-containerbuild
.. _Fedora Project Leader, Matt Miller:
    https://fedoraproject.org/wiki/User:Mattdm
.. _article I wrote for OpenSource.com:
    https://opensource.com/business/16/7/creating-reproducible-build-system-docker-images
.. _Fedora Layered Image Build Service:
    https://docs.pagure.org/releng/layered_image_build_service.html
.. _Flock 2017 Keynote State of Fedora slides:
    https://mattdm.org/fedora/2017flock/2017-State-of-Fedora.pdf
.. _Multi-Arch Fedora Layered Image Build Service slides:
    https://maxamillion.fedorapeople.org/Events/Flock2016/Flock2016_IntroducingDockerLayeredImageBuildService.pdf
.. _Fedora Environment on Windows Subsystem for Linux slides:
    https://www.variantweb.net/pub/fedora-wsl.pdf
.. _University Involvement Initiative:
    https://fedoraproject.org/wiki/Objectives/University_Involvement_Initiative
.. _Kellog Logic Model:
    https://www.wkkf.org/resource-directory/resource/2006/02/wk-kellogg-foundation-logic-model-development-guide
.. _Fedora Modularity Logic Model:
    https://fedoraproject.org/wiki/Objectives/Fedora_Modularization,_Prototype_Phase
.. _OpenShift on Fedora Guided WalkThrough:
    https://github.com/soltysh/talks/blob/master/2016/flock/scenario.md

.. title: SCaLE 15x
.. slug: scale-15x
.. date: 2017-03-08 16:25:15 UTC-05:00
.. tags: SCaLE 15x
.. category: blog
.. link:
.. description: SCaLE 15x
.. type: text

SCaLE 15x
=========

This year was the 15th Annual `SCaLE`_ (Southern California Linux Expo) event
where I was fortunate enough to both attend and speak at. While this is the 15th
year of the, now very well known, conference; it was in fact my first time to
attend. I spent majority of my time floating between working the `Fedora`_, `Red
Hat`_, and `OpenShift`_ booths there in the Expo Hall. I had originally planned
to spend more time at the `Fedora`_ booth than I did, but the `OpenShift`_ crew
ended up short staffed because of unexpected travel issues of some of their team
members so I filled in the best I could. As expected the interest in containers
is at full tilt and people were very interested to see what is going on with
`OpenShift`_ as it is a `Kubernetes`_ distribution with advanced features beyond
core `Kubernetes`_, and Kubernetes is easily the `most popular container
orchestration platform`_ around right now. The `Project Atomic`_ Community
manager, `Josh Berkus`_ was kind enough to lend his Sub-Atomic Cluster
(Described in this two-part blog series: `Part 1`_, `Part 2`) to the booth
efforts and that made for some very engaging demos of what OpenShift can
accomplish (even though the conference network left something to be desired, but
this is nothing new). Over all I think we were able to provide event goers
a solid booth destination in their Expo Hall travels.

Every conference I go to, I notice there's a specific "crowd profile" in terms
of what motivates the participants to attend the conference, what their
interests are, etc. Often times these are going to be things like hobbyist,
enthusiast, professional/commercial, developer, sysadmin/ops, DevOps
practitioners, and potentially (and often) some mixture of those categories.
This particular conference was a really solid representation of community
focused people and hobbyists which is always a cool crowd because everyone is
genuinely interested and enthusiastic about the technologies being represented
there. However, from a personal note, something I found rather interesting was
the number of people who came by the `Red Hat`_ booth that had never heard of
the company. This isn't entirely a new phenomenon depending on the "crowd
profile" but it's definitely the first time I've seen such a proliferation of it
at a specifically **Linux** conference. This is a weird change of pace for me as
for the longest time, Red Hat was a name synonymous with Linux. However, as the
company has focused more on the Enterprise with `RHEL`_, the community focused
`Fedora`_ and `CentOS`_ have filled in the void for the community user base and
this was a primarily community focused event. Beyond that though, the number of
people who had no idea that `Red Hat`_ is a major sponsor of and contributor to
`Fedora`_ was surprising to me.

There are two primary reasons I think lead this situation. First, Linux is so
high quality and pervasive these days that the percentage of people who used to
get off in the weeds early and often with technical issues is fewer and far
between. These systems level technology dives would quickly lead to someone
becoming well versed in topics of their distribution and the reality of
relationships between different entities (such as `Red Hat`_ and `Fedora`_)
within the scope of the community. This is no longer the case, Linux is so easy
to use and so commonplace that most people don't need (and in many cases don't
want) to dig into the nuts and bolts to the point of having a fundamental
understanding about the resulting project that produces the Distribution they
are using. I think this is great in a lot of ways, I think it's a standing
ovation to the fact that Linux has "made it" and that we collectively in the
upstream communities are providing quality software that attracts users of all
kinds, technical or otherwise. The Second reason I think lead to this is that it
poses an interesting problem in the world of marketing for both `Fedora`_ as an
upstream and `Red Hat`_ as a company to properly communicate to users and
potential users things that are interesting to them since Linux itself isn't
inherently interesting to as wide of an audience as it once was due to popular
tech trends shifting away from the system itself but instead to things you can
run on top of the system (and recently in containers). Now, `Red Hat`_ has done
a great job of making that message clear to it's customer base with material
that covers the entire `Red Hat Technology Portfolio`_. I also think that
`Fedora`_ in recent years has been doing a really good job of showing off
various features of each Fedora Edition: `Workstation`_, `Server`_, `Atomic`_
which highlights features beyond just the core distribution that are tailor made
to specific users and potential users. We just need to continue to show up to
user groups, MeetUps, and conferences with good representation to help spread
the word. On that note, a massive thanks to the amazing `Fedora Ambassadors`_.
I'd also like to find a good way to get the message out to more users of various
online and programming communities, something similar to `Fedora Loves Python`_
but for various `Special Interest Groups`_ within Fedora. Just food for thought.

Over all I think we're doing good work and doing a good job spreading the word,
it's just interesting to see how trends in technology change, how the landscape
changes, and trying to identify how we as a community need to adapt. Kudos to
the whole `Fedora Community`_!

I also had a chance to make some new friends from `GNOME`_, `EndlessOS`_,
`OpenSUSE`_, `debian`_, `opensource.com`_ and `LinuxAcademy`_ as a side effect
of spending so much time in the Expo Hall. In typical Linux Community fashion,
everyone was extremely friendly and I had a great time. :)

I spent most of my time working the booths, but I was able to make it to
a couple sessions while the Expo Hall was closed. I've taken some notes on those
below.


Kubernetes 101
--------------

`Project Atomic`_'s very own `Josh Berkus`_ did a wonderful overview of the
`Kubernetes`_ architecture, walking the audience both through the various
components of `Kubernetes`_ as well as how you would take a traditional
application that would be deployed as a "monolith" all on a since physical or
virtual machine with only vertical scaling into a multi-node orchestrated
deployment of containerized services.

This talk was accompanied by multiple live demos using `minikube`_ (with a tip
of the hat to `minishift`_) in order to show how the concepts presented during
the talk map to real world deployment and configuration within the cluster.


Patterns and Anti-Patterns in Docker Image Lifecycle
----------------------------------------------------

Speaker from `JFrog`_ talking about `Docker`_ image lifecycle management, using
`Artifactory`_ as an example component.

The presentation begins with a poll of the room about who's using Docker in dev
vs production. A primary point of concern is the concept of "trust" to know if
there's enough integrity into the process and the images that you pull down to
build your application or CI pipeline on top of.

"There is no platform without ecosystem" - Solomon Hykes (CEO Docker Inc.)

Do we have an existing pattern? Do we need to adapt it? CI/CD pipelines? (These
are old news, this has been done for years)

The speaker mentioned a concept call the "The Promotion Pyramid" which could
basically be turned on it's side and the layers of the pyramid by changed to
boxes with arrows between them and it looks just like a production pipeline
diagram.

Onward to Dockerfiles! The Dockerfile is extremely powerful, the problem is that
it's a hammer and everything now looks like nails. Fast and cheap builds are not
the way to go.

::

    FROM fedora

    RUN dnf install -y software-properties-common python
    RUN dnf install -y nodejs

    RUN mkdir /var/www

    ADD app.js /var/www/app.js

    CMD ["/usr/bin/node", "/var/www/app.js"]


The problem with this is that there's no versioning on anything so each build
may or may not produce the same thing because each ``dnf`` command could
install a different version of each component. You can use a SHA sum to refer to
the image version but these are not human readable so it's kind of pointless or
maintain your own base image.

Pattern to follow to fix this is to promote immutable binary files (`Martin
Fowler Immutable Server`_).

The promotion patterns between registries and repos it basically the only real
way because the only way to "version" docker images is with tags and the tag has
no concept of version numbers and you can only run one registry per host unless
you use VirtualHosts and many daemons mapped to ports.

As a side note, the "promotion pipeline" is effectively the exact structure that
`Fedora Containers`_ follow.

Fedora Work Session and Meetup
------------------------------

Open session to:

* Work on development
* Say Hello
* Meet others
* Ask questions about challenges you're facing
* Share knowledge
* Find out how to help

This was a really fun grass roots "Birds of a Feather" style session where
everyone in the room made a big circle, went around and introduced themselves,
and briefly talked about what they are using `Fedora`_ for. This spanned from
Workstations and Cloud all the way to use with ARM boards in small embedded
devices that are deployed out in the field. I had a great time learning what
everyone was up to with Fedora and I want to thank `Perry Rivera`_ for setting
it up and hosting. Perry was also kind enough to be taking notes and feedback
based on everything that was discussed.

Closing time
============

I had a wonderful time (aside from not feeling 100% - I came down with a sinus
infection the day before flying out to SCaLE), the event was fantastic
and I really hope I get the opportunity to go back next year.

Until next time...


.. _CentOS: https://centos.org/
.. _GNOME: https://www.gnome.org/
.. _JFrog: https://www.jfrog.com/
.. _Fedora: https://getfedora.org/
.. _debian: https://www.debian.org/
.. _Red Hat: https://www.redhat.com
.. _EndlessOS: https://endlessos.com/
.. _Kubernetes: https://kubernetes.io/
.. _OpenSUSE: https://www.opensuse.org/
.. _OpenShift: https://www.openshift.com/
.. _SCaLE: https://www.socallinuxexpo.org
.. _Server: https://getfedora.org/en/server/
.. _Atomic: https://getfedora.org/en/atomic/
.. _LinuxAcademy: https://linuxacademy.com/
.. _opensource.com: https://opensource.com/
.. _Docker: https://github.com/docker/docker/
.. _Josh Berkus: https://twitter.com/fuzzychef
.. _Steve Pousty: https://twitter.com/TheSteve0
.. _Ansible: https://github.com/ansible/ansible
.. _Project Atomic: https://www.projectatomic.io/
.. _Artifactory: https://www.jfrog.com/artifactory/
.. _minishift: https://www.openshift.org/minishift/
.. _minikube: https://github.com/kubernetes/minikube
.. _Workstation: https://getfedora.org/en/workstation/
.. _Fedora Loves Python: https://fedoralovespython.org/
.. _Fedora Community: http://fedoracommunity.org/northam
.. _Fedora Ambassadors: https://fedoraproject.org/wiki/Ambassadors
.. _Red Hat Technology Portfolio: https://www.redhat.com/en/technologies
.. _Special Interest Groups: https://fedoraproject.org/wiki/Category:SIGs
.. _Part 1: https://www.projectatomic.io/blog/2016/06/micro-cluster-part-1/
.. _Part 2: https://www.projectatomic.io/blog/2016/06/micro-cluster-part-2/
.. _Perry Rivera: https://fedoraproject.org/wiki/User:Lajuggler
.. _RHEL:
    https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
.. _Fedora Containers:
    https://docs.pagure.org/releng/layered_image_build_service.html
.. _Martin Fowler Immutable Server:
    https://martinfowler.com/bliki/ImmutableServer.html
.. _most popular container orchestration platform:
    https://cdn.thenewstack.io/media/2016/06/Chart_Top-Orchestration-Products-Based-on-Expected-Usage-Within-Next-Year.png

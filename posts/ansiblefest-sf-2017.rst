.. title: AnsibleFest SF 2017
.. slug: ansiblefest-sf-2017
.. date: 2017-09-18 17:19:20 UTC-05:00
.. tags: AnsibleFest 2017
.. category: blog
.. link:
.. description: AnsibleFest SF 2017: Ansible User and Contributor Event
.. type: text

AnsibleFest 2017
================

`AnsibleFest`_ was amazing, it always is. This has been my Third one and it's
always one that I look forward to attending. The Ansible Events Team does an
absolutely stellar job of putting things together and I'm extremely happy I was
not only able to attend but that I was accepted as a speaker.


Kick Off and Product Announcements
----------------------------------

The event kicked off with some really great product announcements, some
interesting bits about `Ansible Tower`_ and the newly announced `Ansible
Engine`_.

Ansible AWX
-----------

.. image:: /images/ansible_awx_logo.svg
    :height: 400
    :width: 600
    :alt: Ansible AWX Logo
    :align: center

As an avid fan of Open Source Software, the announcement and immediate release
of `Ansible AWX`_ was the headliner of the event for me. This is the open source
upstream to `Ansible Tower`_ that Red Hat made the commitment to release once
Ansible was acquired in accordance with their continued commitment to Open
Source. If you live in Ansible user or contributor land, you know this is
something that's been a hot topic for quite some time and I'm so glad it's been
launched officially. I've been learning `Django`_ over the last week so I can
start contributing. Looking forward to it.

Ansible Community Leader and Red Hat CEO Fireside Chat
------------------------------------------------------

.. image:: /images/robyn-jim-fireside.jpg
    :height: 400
    :width: 800
    :alt: Fireside Chat with Robyn and Jim
    :align: center


Immediately following the Ansible AWX announcement was a fireside chat with
Ansible Community Leader `Robyn Bergeron`_ (who is also previously the Fedora
Project Leader) and Red Hat CEO `Jim Whitehurst`_ to discuss various market
trends in the realm of infrastructure automation, the ability to deliver faster
and more rapidly, and the challenges business are having with the concept of
"Digital Transformation." This was a really cool thing to get the perspective of
things from both an open source community perspective and that of a business
minded individual, and to see where those two perspectives met in the middle
and/or overlapped.

Ansible Community Days
----------------------

The day before and the day after the main headline of AnsibleFest was the
Community Days, the day before AnsibleFest focused entirely on topics around
`Ansible Core`_ and the greater `Ansible Community`_. The day after AnsibleFest
focused on `Ansible AWX`_ in the morning, explaining architecture and various
technical implementation details to try and get some exposure to things for
those of us in the room who weren't previously privy to that information. The
afternoon of the second day involved the "Ansible Ambassadors" community (I'm
not sure if this is an official term)

Ansible All The Things
----------------------

I gave a presentation that I like to call "Ansible All The Things" or "Ansible
Everything" (depending on who my audience is and how acceptable they are of
meme jokes). The basic idea though is to look at Ansible not as a configuration
management tool, which I feel a lot of the "Tech Media" (for lack of a better
term) has classified it as and therefore it is often known as to the more broad
audience, but instead think of it like a Task Automation utility. This
particular task automation utility also comes with a nice `python`_ API and
a way to interact by anything that can "speak `JSON`_." This has some advantages
if you step back and thing about this abstract concept of a tool with
a programming interface that is ultimately as generic as passing JSON around
(with added convenience for python programmers). Effectively you have a method
of running a task, or series of tasks, on one or many systems in your
infrastructure. This is powerful enough to be used for all sorts of things like
configuration management (yes, Ansible can perform configuration management
tasks but it's also so much more than that), provisioning, deployment,
orchestration, command line tooling, builds, event-based execution, workflow
automation, continuous integration, and containers.

For those who would like to check you my slides, they are `here
<https://maxamillion.fedorapeople.org/AnsibleAllTheThings_AnsibleFest2017.pdf>`_.

Infrastructure Testing with Molecule
------------------------------------

I had the opportunity to attend a presentation about `Molecule`_, which I was
really excited about because this is a toolchain I've wanted to dig into for
a while. This is effectively the goal: Infrastructure as Code, TDD/CI on
your Code, and transitively your Infrastructure. What a time to be alive.

Anyways, the talk itself was absolutely fantastic. `Elana Hashman`_ is
a spectacular speaker and the amount of research she put into the talk was
apparent. The room was captivated and the questions and conversations were
enthusiastic, this was clearly a topic space people were interested in. I also
have to give a tip of the hat to the live Demo that went off flawlessly, I've
never personally pulled off a live Demo without at least one goof that contained
the amount of live editing of code that was contained in this one. Kudos.

For those who are interested in the presentation materials, check them out
`here. <https://hashman.ca/ansiblefest-2017/>`_ (Do it, it's really good.)

Closing Time
------------

The event was wonderful and I hope to have the opportunity to go next year to
the North America based AnsibleFest (they also do one in the EU/UK but it's not
often I can pull together the funding to that trip).

.. _Ansible: https://github.com/ansible/ansible
.. _AnsibleFest: https://www.ansible.com/ansiblefest
.. _Ansible Community: https://www.ansible.com/community
.. _Ansible Tower: https://www.ansible.com/tower
.. _Ansible Engine: https://www.ansible.com/ansible-engine
.. _Ansible Core: https://github.com/ansible/ansible/
.. _Django: https://www.djangoproject.com/
.. _python: https://www.python.org/
.. _JSON: http://json.org/
.. _Molecule: https://molecule.readthedocs.io/en/latest/
.. _Elana Hashman: https://twitter.com/ehashdn
.. _Robyn Bergeron: https://twitter.com/robynbergeron
.. _Jim Whitehurst: https://twitter.com/JWhitehurst

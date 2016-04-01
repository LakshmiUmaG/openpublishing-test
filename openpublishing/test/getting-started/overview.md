Overview of .NET implementations
================================

.NET Platform is, at its very core, a set of standards that can be
implemented. There are various implementations, some coming from
Microsoft, some coming from other companies and groups. This document
will outline the current state of the .NET ecosystem and its various
implementations, so you can get a good "lay of the land".

.NET Core
=========

.NET Core is a cloud-optimized, cross-platform implementation of the
.NET Platform. It currently supports three main operating systems:
Linux, Windows and OS X.

There are several reasons why we built .NET Core.

**Cross-platform support** is a requirement of many developers today.
It's important to use the platform that has the characteristics required
by the application, which, in turn, can run on the platform required by
users or perhaps is prescribed by corporate policy. For all of these, we
need a cross-platform runtime. 

**Open Source** because it has proven to be the best possible way to
enable a larger set of platforms, supported by community contribution.

**Better packaging story** of the entire runtime is also something that
influenced the design of the runtime. We wanted to make sure that the
entire runtime can be distributed as a set of pieces that developers can
pick and choose from, rather than a single, monolithic platform. .NET
Core is the first implementation of .NET Platform that will be
distributed via [NuGet](http://www.nuget.org/) package manager.

**Better isolation and versioning** was one of the influencers to create
.NET Core. Today's trends in development practices lead to a very
different way of developing sofware than what was common even a couple
of years ago. Cloud services are posed to radically change the way
developers build, test and run their solutions. Application containers
like Docker are introducing new possibilities and opportunities when it
comes to server (and services) consolidation. With this in mind, the
.NET Core is targeting scenarios where the application, essentially,
"takes" the runtime with it. This allows for per-app versioning
scenario; the developer needs to worry only about the runtime (a set of
packages, as seen in the previous paragraph) that her app is dependent
on.

With all of the above, .NET Core represents a very generic,
cross-platform and modern runtime that is capable of supporting multiple
workloads, from cloud services, to desktop applications to CLI tools.

.NET Framework
==============

The .NET Framework is the premier implemetentation of the .NET Platform
available for Windows server and client developers. It is a very
powerful, very mature framework, with a huge class library (known as the
**Framework Class Librariries**) that supports a wide variety of
applications and solutions on Windows.

There are additional stacks built on top the .NET Framework that allow
developers to build applications ranging from console applications,
across rich client (WPF) applications to scalable web applications.

[Windows
Forms](https://msdn.microsoft.com/en-us/library/dd30h2yb(v=vs.110).aspx)
and [Windows Presentation Foundation
(WPF)](https://msdn.microsoft.com/en-us/library/ms754130(v=vs.110).aspx)
are two User Interface (UI) stacks that allow you to build desktop
applications for Windows operating system. Windows Forms' strength is in
its rich support for common databinding as well as access to Windows'
native user interface controls. WPF, on the other hand, allows you to
exercise much more control over the look and feel of your application.
Both of them allow for building very rich desktop applications that run
on Windows, and you should pick the one that is suited for your use
case.

[Windows Communication Foundation
(WCF)](https://msdn.microsoft.com/en-us/library/ms731082(v=vs.110).aspx)
is a set of libraries that comprise the middleware services stack on
.NET Framework. It allows you to create services that can communicate
through various supported protocols using various data formats, and that
can be hoster in any process you choose. This leads to one of the major
features of WCF: your services are not tied to any particular hosting
strategy or approach.

**ASP.NET** is the .NET web framework. Being a very rich framework, it
has several distinct pieces which are used to produce modern and
high-performance web applications. [ASP.NET Web
Forms](http://www.asp.net/web-forms) is a set of tools geared primarily
towards developer productivity, allowing quick turnaround on web
applications with a drag-and-drop surface reusing web controls for
everything from loging in to data binding. [ASP.NET
MVC](http://www.asp.net/mvc) allows for a different approach, one that
gives you greater control over the entire pipeline, from HTTP layer to
the user interface. [ASP.NET WebAPI](http://www.asp.net/web-api) is a
convention-based framework for creating REST services. It allows you to
stand up a REST endpoint extremely fast. Finally,
[SignalR](http://www.asp.net/signalr) allows you to provide push-based
communication to your web applications using
[WebSocket](https://en.wikipedia.org/wiki/WebSocket) protocol.

.NET Native
===========

.NET Native is not so much an "edition" of the .NET platform as it is a
set of tools that allow developers to have different build outputs. The
normal .NET source compilation process takes the source code written in
one of the .NET languages (such as C\#, Visual Basic, F\# etc.) and
produces something called "Intermediate Language". IL is then picked up
by the runtime, and Just-In-Time compiled at run-time to machine code.

.NET Native is an additional step in this pipeline which takes the IL
and compiles it **Ahead-of-Time** (AOT) to machine code, so that when
the code is executed, there is only "native" code running. This means
that the resulting binary is what the OS executes; there is no JIT-ing,
no runtime compilation. This leads to better performance, as well as
some security benefits.

.NET Native is the set of tools used to build .NET **Universal Windows
Platform (UWP)** applications.

Supported operating systems
===========================

.NET Framework is supported only on Windows operating system. .NET
Native is, at this time, supported only on Windows.

.NET Core is supported on Windows, Linux and OS X.

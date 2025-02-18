![Aegis](assets/aegis-banner.png "Aegis")

## Aegis Design Decisions

We follow the **guidelines** outlined in the next few sections to achieve these.

Since **Aegis** is still in development, some of these goals discussed in the
following sections may still need to be fully implemented. Regardless,
they are the **guiding principles** we steer towards while shaping the future
of **Aegis**.

### Do One Thing Well

At a 5000-feet level, **Aegis** is a secure Key-Value store.

It can securely store arbitrary values that you, as an administrator, associate
with keys. It does that, and it does that well.

If you are searching for a solution to create and store X.509 certificates,
create dynamic secrets, automate your PKI infrastructure, federate your
identities, use as an OTP generator, policy manager, in short, anything other
than a secure key-value store, then Aegis is likely not the solution you are
looking for.

### Be Kubernetes-Native

**Aegis** is designed to run on Kubernetes and **only** on Kubernetes.

That helps us leverage Kubernetes concepts like *Operators*, *Custom Resources*,
and *Controllers* to our advantage to simplify workflow and state management.

If you are looking for a solution that runs outside Kubernetes or as a
standalone binary, then Aegis is not the Secrets Store you’re looking for.

### Have a Minimal and Intuitive API

As an administrator, there is a limited set of API endpoints that you can
interact with **Aegis**. This makes **Aegis** easy to manage. 

In addition, a minimal set of APIs means a smaller attack surface, a smaller 
footprint, and a codebase that is easy to understand, test, audit, and 
develop; all good things.

### Be Practically Secure

Corollary: Do not be annoyingly secure.

Provide a delightful user experience while taking security seriously.

**Aegis** is a secure solution, yet still delightful to operate.

You won’t have to jump over the hoops or wake up in the middle of the night
to keep it up and running. Instead, **Aegis** will work seamlessly, as if it
doesn’t exist at all.

## Secure By Default

**Aegis** stores your sensitive data in memory by default. Yes, that brings
up resource limitations since you cannot store a gorilla holding a banana and
the entire jungle in your store; however, a couple of gigabytes of RAM can store
a lot of plain text secrets in it, so it’s good enough for most practical
purposes.

More importantly, almost all modern instruction set architectures and
operating systems implement [*memory protection*][memory-protection]. The primary
purpose of memory protection is to prevent a process from accessing memory that
has not been allocated to it. This prevents a bug or malware within a process
from affecting other processes or the operating system itself.

[memory-protection]: https://en.wikipedia.org/wiki/Memory_protection "Memory Protection (Wikipedia)"

Therefore, reading a variable’s value from a process’s memory is practically
impossible unless you attach a debugger to it.

For disaster recovery, Aegis can back up an encrypted version of its state on
file system; however, the data that it actively dispatches to workloads will
always be stored in memory.

## Resilient By Default

When an **Aegis** component crashes, or when an **Aegis** component is evicted, 
the workloads can still function with the existing secrets they have without 
having to rely on the existing of an active secrets store.

When an **Aegis** component restarts, it will seamlessly recover its state from
an encrypted backup without requiring any manual intervention.

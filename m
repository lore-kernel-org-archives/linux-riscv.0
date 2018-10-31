From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Wed, 31 Oct 2018 09:48:38 +0100
Subject: virtio-gpu without ARCH_HAS_SG_CHAIN
In-Reply-To: <CAGw6cBtMu7qs2in-=eX1J6bpPK-L-8cSa5pocQ6CA=en-ju3EA@mail.gmail.com>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
 <CAEn-LTopspBXzoLZEFWQGxxC7uNJ9RZHiHyYmJPpWR4zKnj5zw@mail.gmail.com>
 <CAGw6cBtMu7qs2in-=eX1J6bpPK-L-8cSa5pocQ6CA=en-ju3EA@mail.gmail.com>
Message-ID: <CAEn-LTpfFWO864brKCj_FyaBFQuy8wvxs5OdP7rAOziJLDKc4Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Oct 30, 2018 at 6:25 PM Michael Forney <mforney@mforney.org> wrote:
>
> On 2018-10-29, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> > On Mon, Oct 29, 2018 at 8:47 PM Michael Forney <mforney@mforney.org> wrote:
> >>
> >> - Should riscv support ARCH_HAS_SG_CHAIN?
> >
> > Non-expert here, but it looks like ARCH_HAS_SG_CHAIN
> > support is generic, and a number of well known architectures
> > support it.
> >
> > So it's basically two line patch someone needs to send and
> > at least make a test by building the kernel. I can do that if you want.
>
> If that's all there is to it, then yeah, that would be appreciated. Thanks!
>
> Though, I assume there's *some* architecture-specific consideration
> that needs to be done, since it has to be selected on each
> architecture that supports it.

Done it yesterday morning. Compile-tested and I am running
the kernel w/o any issues.

Btw, if you get virtio-gpu support in TinyEMU it would be interesting
to see how that works with Fedora. I have some instructions about
that here:

https://fedoraproject.org/wiki/Architectures/RISC-V/Installing#Boot_under_TinyEMU_.28RISCVEMU.29

david

From: alankao@andestech.com (Alan Kao)
Date: Thu, 14 Jun 2018 08:25:22 +0800
Subject: On Supporting no-FPU machines
In-Reply-To: <CAK8P3a1F0zYX_v6KDkO-DT9+Ud13Vmt9aWa7vF=K1AHJxVMp8g@mail.gmail.com>
References: <20180613062653.GA14518@andestech.com>
 <20180613063217.GA12182@infradead.org>
 <CAK8P3a1bC1PgkV6n=HkSB7EnbEWGZYUo8CsDWtUh-xoLWg+rpA@mail.gmail.com>
 <20180613072012.GA5293@infradead.org>
 <20180613072044.GA3064@infradead.org>
 <CAK8P3a1F0zYX_v6KDkO-DT9+Ud13Vmt9aWa7vF=K1AHJxVMp8g@mail.gmail.com>
Message-ID: <20180614002522.GB14518@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jun 13, 2018 at 02:29:45PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 13, 2018 at 9:20 AM, Christoph Hellwig <hch@infradead.org> wrote:
> > On Wed, Jun 13, 2018 at 12:20:12AM -0700, Christoph Hellwig wrote:
> >> On Wed, Jun 13, 2018 at 08:47:00AM +0200, Arnd Bergmann wrote:
> >> > > A separate CONFIG_FPU to not build the FPU code sounds fine to me
> >> > > as long as it defaults to on.
> >> >
> >> > If we do this, that option must also take care to disable the FPU hardware
> >> > if it exists. Otherwise you might run into the situation of having a system
> >> > intended to run without FPU access but a task uses FPU registers anyway
> >> > (e.g. because the compiler decides it is faster that way on the
> >> > microarchitecture it is optimizing for) and we fail to save/restore the FPU
> >> > state between task switches.
> >>
> >> I'm not sure we can force this.  It would require a write to misa,
> >> which requires M-mode privileges.
> 
> That also means we can't have lazy save/restore of the FPU context,
> trapping on the first access to an FPU register from a user space
> task before swapping out the previous task's state, right?
> 

The lazy FP context feature trades initial performance for flexibility, and
requires changes to both M- and S-mode software.

> > [send too early]
> >
> > Instead we should just refuse to boot a !CONFIG_FPU kernel on a system
> > with a FPU.
> 
> Sure, that would work.
> 
>           Arnd

It seems to me that a CONFIG_FPU option to compile/ignore all the floating-point
relative routines is acceptable from this discussion.  Besides, there should be
a mechanism that refuses to boot a !CONFIG_FPU kernel on a system with F or D,
and also refuses to boot a CONFIG_FPU kernel on a system lacking both.

In this way, we can eliminate unnecessary codes to the maximum and keep the
modifications small for RISC-V machines without FPU.

Thanks for all your opinions.  If there is no more suggestions, we will be ready
soon to send a patch for this.

Alan

From: anup@brainfault.org (Anup Patel)
Date: Sat, 29 Sep 2018 11:39:56 +0530
Subject: [PATCH] RISC-V: Show IPI stats
In-Reply-To: <mhng-2395876e-5470-45f9-83e1-4abae5188b0c@palmer-si-x1c4>
References: <20180910134659.GA30774@infradead.org>
 <mhng-2395876e-5470-45f9-83e1-4abae5188b0c@palmer-si-x1c4>
Message-ID: <CAAhSdy0wd7LN1tb5oRkgYbxeR=Yb3LomUtTcym1dhyO6wa+a9g@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Sep 29, 2018 at 7:15 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 10 Sep 2018 06:46:59 PDT (-0700), Christoph Hellwig wrote:
> > On Fri, Sep 07, 2018 at 06:14:29PM +0530, Anup Patel wrote:
> >> This patch provides arch_show_interrupts() implementation to
> >> show IPI stats via /proc/interrupts.
> >>
> >> Now the contents of /proc/interrupts" will look like below:
> >>            CPU0       CPU1       CPU2       CPU3
> >>   8:         17          7          6         14  SiFive PLIC   8  virtio0
> >>  10:         10         10          9         11  SiFive PLIC  10  ttyS0
> >> IPI0:       170        673        251         79  Rescheduling interrupts
> >> IPI1:         1         12         27          1  Function call interrupts
> >> IPI2:         0          0          0          0  CPU wake-up interrupts
> >>
> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >
> > Thanks, this looks pretty sensible to me.  Maybe we want to also show
> > timer interrupts if we do this?
>
> IIRC we used to have some issue where the timer interrupt ID in
> /proc/interrupts aliased with a possible PLIC interrupt ID, but that was back
> when we had a big mess of chained interrupt drivers that didn't really talk to
> each other.  I think at some point I might have just removed the timer
> interrupt from /proc/interrupts as a hack, but now that our interrupt
> controller mess is sorted out it'd be better to have it.

If we have irqdomain and irqchip for HLIC then showing timer interrupts
becomes cleaner. My RISCV INTC patch achieves this.

>
> I'm fine taking this without the timer interrupts, as something is better than
> nothing.

Sure.

>
> >> --- a/arch/riscv/kernel/irq.c
> >> +++ b/arch/riscv/kernel/irq.c
> >> @@ -8,6 +8,7 @@
> >>  #include <linux/interrupt.h>
> >>  #include <linux/irqchip.h>
> >>  #include <linux/irqdomain.h>
> >> +#include <linux/seq_file.h>
> >>
> >>  /*
> >>   * Possible interrupt causes:
> >> @@ -24,6 +25,14 @@
> >>   */
> >>  #define INTERRUPT_CAUSE_FLAG        (1UL << (__riscv_xlen - 1))
> >>
> >> +int arch_show_interrupts(struct seq_file *p, int prec)
> >> +{
> >> +#ifdef CONFIG_SMP
> >> +    show_ipi_stats(p, prec);
> >> +#endif
> >> +    return 0;
> >> +}
> >
> > If we don't also add timer stats I'd just move arch_show_interrupts
> > to smp.c and make it conditional.  If we don't this split might make
> > more sense.
>
> Makes sense, but I think timer interrupts are more interesting to see than IPIs
> so we'll eventually pipe them through.  Might just be my workloads, though :)
>
> >> +static const char *ipi_names[IPI_MAX] = {
> >> +    [IPI_RESCHEDULE] = "Rescheduling interrupts",
> >> +    [IPI_CALL_FUNC] = "Function call interrupts",
> >> +    [IPI_CALL_WAKEUP] = "CPU wake-up interrupts",
> >> +};
> >
> > No need for the explicit array size.  Also please use a few tabs to
> > align this nicely:
> >
> > static const char *ipi_names[] = {
> >       [IPI_RESCHEDULE]        = "Rescheduling interrupts",
> >       [IPI_CALL_FUNC]         = "Function call interrupts",
> >       [IPI_CALL_WAKEUP]       = "CPU wake-up interrupts",
> > };
>
> I don't see a v2 of this, was there one?  If not then I'll just clean up
> ipi_names and drop this on for-next.
>
> Thanks for the patch!

I will send v3 patch because IPI_CALL_WAKEUP is not going to be available.

I will base v3 patch upon v5 of Atish's patchset. Atish will take v3 of this
patch and make it part of his v6 patchset so that it will be easy for you
to apply.

Regards,
Anup

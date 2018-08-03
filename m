From: zongbox@gmail.com (Zong Li)
Date: Fri, 3 Aug 2018 08:27:57 +0800
Subject: [PATCH] RISC-V: Add preprocessor directives for boot_sec_cpu
In-Reply-To: <27367ec8-fc26-c678-1883-299a084a5328@wdc.com>
References: <1533223376-10130-1-git-send-email-zong@andestech.com>
 <27367ec8-fc26-c678-1883-299a084a5328@wdc.com>
Message-ID: <CA+ZOyaiyaVqgba-pLABJgZHVTep8LXiiLQnT+dtCppdvJy36Zw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Atish Patra <atish.patra@wdc.com> ? 2018?8?3? ?? ??2:14???
>
> On 8/2/18 8:23 AM, Zong Li wrote:
> > The boot_sec_cpu is for hutplug CPU on SMP system. It should
> > be conditional compiling. Otherwise, it causes undefined reference
> > to `smp_callin' when compiling uniprocessor kernel.
> >
> > Signed-off-by: Zong Li <zong@andestech.com>
> > ---
> >   arch/riscv/kernel/head.S | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index 11066d5..9b6f601 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -154,6 +154,7 @@ END(_start)
> >   .section .text
> >   .global boot_sec_cpu
> >
> > +#ifdef CONFIG_HOTPLUG_CPU
> >   boot_sec_cpu:
> >       /* clear all pending flags */
> >       csrw sip, zero
> > @@ -162,6 +163,7 @@ boot_sec_cpu:
> >       fence
> >
> >       tail smp_callin
> > +#endif
> >
> >   __PAGE_ALIGNED_BSS
> >       /* Empty zero page */
> >
>
> Thanks for the fix. If you don't mind, I would like to merge it on top
> of my cpu hotplug patch and resubmit together to avoid confusion.
>
OK, just take it:)

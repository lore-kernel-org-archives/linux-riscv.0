From: zongbox@gmail.com (Zong Li)
Date: Wed, 16 May 2018 10:33:19 +0800
Subject: kernel hangs after running program that uses a custom SIGSEGV
 handler
In-Reply-To: <05c49b57-e805-5ed6-afe0-419852073333@ghiti.fr>
References: <3428122.ik0p8hGU2m@omega>
 <CADJ6UvOs+2OVmRhJThhNufg-jPT2UwaP=HNuvV_V=tuJ=fFi_w@mail.gmail.com>
 <05c49b57-e805-5ed6-afe0-419852073333@ghiti.fr>
Message-ID: <CA+ZOyahu2-9+z6Sns2YukphAJNa=cbrscSkA6+0yf_Nh54T21A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Alexandre Ghiti <alex@ghiti.fr> ? 2018?4?13? ?? ??6:14???

> Hi Stef,

> I'm happy to see there are solutions to this problem: I have a working
> port of hugetlb for riscv-linux and I was wondering how to support
> PROT_NONE.
> Can you share a link to the patches you mention please ?

> Thanks,

> Alex


> On 04/12/2018 02:14 AM, Stef O'Rear wrote:
> > On Wed, Apr 11, 2018 at 6:10 PM, Bruno Haible <bruno@clisp.org> wrote:
> >> Hi,
> >>
> >> $ uname
> >> Linux stage4.fedoraproject.org 4.16.0-rc2-00328-gebea62367bc4 #4 SMP
Mon Feb 26 16:05:16 GMT 2018 riscv64 riscv64 riscv64 GNU/Linux
> >>
> >> This kernel either hangs or prints "BUG" messages when running a
program that
> >> installs a SIGSEGV handler. That handler uses mprotect to change the
access
> >> permissions of memory pages. It is known to work fine on all other
Linux
> >> architectures that I tested.
> > The bug is caused by mishandling of PROT_NONE (failing to distinguish
> > between PROT_NONE and non-present pages), not by the segfault handler.
> > I sent a patch for this to Andrew and Richard a few weeks ago but
> > haven't had a chance to follow up.
> >
> > -s
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv


> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Is there any update? I also encounter this issue, and I change the
permission like below.
Where is the patch as Stef O'Rear mention before?

diff --git a/arch/riscv/include/asm/pgtable.h
b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..578f31510501 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -44,7 +44,7 @@
  /* Page protection bits */
  #define _PAGE_BASE     (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER)

-#define PAGE_NONE              __pgprot(0)
+#define PAGE_NONE              __pgprot(_PAGE_BASE)

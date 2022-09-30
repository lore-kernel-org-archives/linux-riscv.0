Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99B7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMpgO5bZ+NK44MzE40hSts2Yx4G7HyccEATCCrga8G4=; b=RgF2+dUF5k2OeW
	eQ1tPSKdVfUA0Rod0VwfQM7oF861fe4bF+9R4B+esy9tYzeW6x+lGweQ7xrncahPQVdR2K3GIgOU7
	C2o2W3xixkmzX/lmgCi98M9jUAPUejIsEDeXlhmDeuLLIo3QU+9Yk7SQMeq6nSvnS3Z9qyLZ/lsur
	QPA/ZUKQBAf6831lpqcRZCkHdNdWmS4HCcQzn3NKOvSWrexHPr1xtdR7gIz0gfpAhqClKf4NvEigG
	wsEWnPBVGfpH7GHyAXQe1qB8c1TOP8yCw1BpCbd+/g7hKB1Q6Xb3HLjedpKn0FFSNFWfySIpdFOCG
	4rcPEKz/5XtqK2zFv9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeECa-008sHn-2Q; Fri, 30 Sep 2022 11:29:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeECW-008sFk-KQ
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 11:29:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61DD1622E1
	for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 11:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D4CC43148
	for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664537341;
	bh=4M2D/Jb1cUhjzhI2IvpJW5DClA4LelB/2AizDYaoWQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rM8H6UvWmtNjFN1qfunErWBP1mPN2pCIEkVE6ET/GVOr47nxKR5qLbmUmzeBVJ4kd
	 Bx8rQMJTVfZdXV5mz1RvXOFPWPSLT/NYb7GfsHeIPNnxu2DFwUImCVhEh+HczdDasO
	 1RvGXklJJH/QUtmwWcR1xo5HcI2ntKkWKXeA6wxs2DDMFFOB/fgAgBfNCG2jjymUNG
	 31xPbTx6FXplx1nwhR+mnEhIaXAYMJsz7ppDYwOOeK/S4e/eMPbvysR7yL7RMDWWXZ
	 nOwwZk7i992k8O/ZLDmaux19+wqLTZnXobekw0IZATQ6ptiAkmuv8k/3lfJnGUnQGH
	 Uc4jMuQU/5Zig==
Received: by mail-oi1-f169.google.com with SMTP id d64so4422814oia.9
        for <linux-riscv@lists.infradead.org>; Fri, 30 Sep 2022 04:29:01 -0700 (PDT)
X-Gm-Message-State: ACrzQf1z31ma6qZB+bPspGLiI0e9wkfLWcQjbyUsWl0U3UNtSB2tJHpx
	r6uLrD8luBZgDQgWuBWnaZEkO8ssVwjgLfuDFXY=
X-Google-Smtp-Source: AMsMyM61h9KH2iI+tds1ffcSLmUklT4vivVvNnTAC4q0qU56HU0lY37dyL1WvNV9fDBO7Wd8EjGerSKxOP6f3m/KMEE=
X-Received: by 2002:a05:6808:201f:b0:34f:9fdf:dbbf with SMTP id
 q31-20020a056808201f00b0034f9fdfdbbfmr8700739oiw.19.1664537340502; Fri, 30
 Sep 2022 04:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-8-guoren@kernel.org>
 <Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net> <CAJF2gTRdkmemEWsDYhVXb8KD0PS6b1VAPu_MfeZ+Rmf2qEGa6Q@mail.gmail.com>
 <YylqSsL6bdhIOMte@hirez.programming.kicks-ass.net>
In-Reply-To: <YylqSsL6bdhIOMte@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 30 Sep 2022 19:28:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTd8GH=ePB03Smg5AqEFEVHDzjuWmxBGcw+LqmH361rTw@mail.gmail.com>
Message-ID: <CAJF2gTTd8GH=ePB03Smg5AqEFEVHDzjuWmxBGcw+LqmH361rTw@mail.gmail.com>
Subject: Re: [PATCH V5 07/11] riscv: convert to generic entry
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, mark.rutland@arm.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_042904_791981_9F1774F3 
X-CRM114-Status: GOOD (  35.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 20, 2022 at 3:23 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Sep 20, 2022 at 02:36:33PM +0800, Guo Ren wrote:
> > On Mon, Sep 19, 2022 at 9:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Sun, Sep 18, 2022 at 11:52:42AM -0400, guoren@kernel.org wrote:
> > >
> > > > @@ -123,18 +126,22 @@ int handle_misaligned_store(struct pt_regs *regs);
> > > >
> > > >  asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
> > > >  {
> > > > +     irqentry_state_t state = irqentry_enter(regs);
> > > >       if (!handle_misaligned_load(regs))
> > > >               return;
> > > >       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
> > > >                     "Oops - load address misaligned");
> > > > +     irqentry_exit(regs, state);
> > > >  }
> > > >
> > > >  asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
> > > >  {
> > > > +     irqentry_state_t state = irqentry_enter(regs);
> > > >       if (!handle_misaligned_store(regs))
> > > >               return;
> > > >       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
> > > >                     "Oops - store (or AMO) address misaligned");
> > > > +     irqentry_exit(regs, state);
> > > >  }
> > > >  #endif
> > > >  DO_ERROR_INFO(do_trap_store_fault,
> > > > @@ -158,6 +165,8 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
> > > >
> > > >  asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
> > > >  {
> > > > +     irqentry_state_t state = irqentry_enter(regs);
> > > > +
> > > >  #ifdef CONFIG_KPROBES
> > > >       if (kprobe_single_step_handler(regs))
> > > >               return;
> > >
> > > FWIW; on x86 I've classified many of the 'from-kernel' traps as
> > > NMI-like, since those traps can happen from any context, including with
> > > IRQs disabled.
> > The do_trap_break is for ebreak instruction, not NMI. RISC-V NMI has
> > separate CSR. ref:
> >
> > This proposal adds support for resumable non-maskable interrupts
> > (RNMIs) to RISC-V. The extension adds four new CSRs (`mnepc`,
> > `mncause`, `mnstatus`, and `mnscratch`) to hold the interrupted state,
> > and a new instruction to resume from the RNMI handler.
>
> Yes, but that's not what I'm saying. I'm saying I've classified
> 'from-kernel' traps as NMI-like.
>
> Consider:
>
>         raw_spin_lock_irq(&foo);
>         ...
>         <trap>
>
> Then you want the trap to behave as if it were an NMI; that is abide by
> the rules of NMI (strictly wait-free code).
>
> So yes, they are not NMI, but they nest just like it, so we want the
> handlers to abide by the same rules.
>
> Does that make sense?
Yes, thx for clarification. I've looked at exc_int3 of x86. Here is my
new version:

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 571556bb9261..41cc1c4bccb3 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2017 SiFive
  */

+#include <linux/entry-common.h>
 #include <linux/syscalls.h>
 #include <asm/unistd.h>
+#include <asm/syscall.h>
 #include <asm/cacheflush.h>
 #include <asm-generic/mman-common.h>

@@ -72,3 +74,28 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t,
start, uintptr_t, end,

        return 0;
 }
+
+typedef long (*syscall_t)(ulong, ulong, ulong, ulong, ulong, ulong, ulong);
+
+asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
+{
+       syscall_t syscall;
+       ulong nr = regs->a7;
+
+       regs->epc += 4;
+       regs->orig_a0 = regs->a0;
+       regs->a0 = -ENOSYS;
+
+       nr = syscall_enter_from_user_mode(regs, nr);
+#ifdef CONFIG_COMPAT
+       if ((regs->status & SR_UXL) == SR_UXL_32)
+               syscall = compat_sys_call_table[nr];
+       else
+#endif
+               syscall = sys_call_table[nr];
+
+       if (nr < NR_syscalls)
+               regs->a0 = syscall(regs->orig_a0, regs->a1, regs->a2,
+                                  regs->a3, regs->a4, regs->a5, regs->a6);
+       syscall_exit_to_user_mode(regs);
+}
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 588e17c386c6..d20037585c2f 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/kexec.h>
+#include <linux/entry-common.h>

 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
@@ -96,10 +97,18 @@ static void do_trap_error(struct pt_regs *regs,
int signo, int code,
 #else
 #define __trap_section noinstr
 #endif
-#define DO_ERROR_INFO(name, signo, code, str)                          \
-asmlinkage __visible __trap_section void name(struct pt_regs *regs)    \
-{                                                                      \
-       do_trap_error(regs, signo, code, regs->epc, "Oops - " str);     \
+#define DO_ERROR_INFO(name, signo, code, str)
         \
+asmlinkage __visible __trap_section void name(struct pt_regs *regs)
         \
+{
         \
+       if (user_mode(regs)) {
         \
+               irqentry_enter_from_user_mode(regs);
         \
+               do_trap_error(regs, signo, code, regs->epc, "Oops - "
str);     \
+               irqentry_exit_to_user_mode(regs);
         \
+       } else {
         \
+               irqentry_state_t irq_state = irqentry_nmi_enter(regs);
         \
+               do_trap_error(regs, signo, code, regs->epc, "Oops - "
str);     \
+               irqentry_nmi_exit(regs, irq_state);
         \
+       }
         \
 }

 DO_ERROR_INFO(do_trap_unknown,
@@ -123,18 +132,36 @@ int handle_misaligned_store(struct pt_regs *regs);

 asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
 {
-       if (!handle_misaligned_load(regs))
-               return;
-       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-                     "Oops - load address misaligned");
+       if (user_mode(regs)) {
+               irqentry_enter_from_user_mode(regs);
+               if (handle_misaligned_load(regs))
+                       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
+                             "Oops - load address misaligned");
+               irqentry_exit_to_user_mode(regs);
+       } else {
+               irqentry_state_t irq_state = irqentry_nmi_enter(regs);
+               if (handle_misaligned_load(regs))
+                       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
+                             "Oops - load address misaligned");
+               irqentry_nmi_exit(regs, irq_state);
+       }
 }

 asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
 {
-       if (!handle_misaligned_store(regs))
-               return;
-       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
-                     "Oops - store (or AMO) address misaligned");
+       if (user_mode(regs)) {
+               irqentry_enter_from_user_mode(regs);
+               if (handle_misaligned_store(regs))
+                       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
+                               "Oops - store (or AMO) address misaligned");
+               irqentry_exit_to_user_mode(regs);
+       } else {
+               irqentry_state_t irq_state = irqentry_nmi_enter(regs);
+               if (handle_misaligned_store(regs))
+                       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
+                               "Oops - store (or AMO) address misaligned");
+               irqentry_nmi_exit(regs, irq_state);
+       }
 }
 #endif
 DO_ERROR_INFO(do_trap_store_fault,
@@ -156,7 +183,7 @@ static inline unsigned long
get_break_insn_length(unsigned long pc)
        return GET_INSN_LENGTH(insn);
 }

-asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
+static void __do_trap_break(struct pt_regs *regs)
 {
 #ifdef CONFIG_KPROBES
        if (kprobe_single_step_handler(regs))
@@ -186,6 +213,19 @@ asmlinkage __visible __trap_section void
do_trap_break(struct pt_regs *regs)
        else
                die(regs, "Kernel BUG");
 }
+
+asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
+{
+       if (user_mode(regs)) {
+               irqentry_enter_from_user_mode(regs);
+               __do_trap_break(regs);
+               irqentry_exit_to_user_mode(regs);
+       } else {
+               irqentry_state_t irq_state = irqentry_nmi_enter(regs);
+               __do_trap_break(regs);
+               irqentry_nmi_exit(regs, irq_state);
+       }
+}
 NOKPROBE_SYMBOL(do_trap_break);

 #ifdef CONFIG_GENERIC_BUG
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index c7829289e806..cc8e642a91ea 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -15,6 +15,7 @@
 #include <linux/uaccess.h>
 #include <linux/kprobes.h>
 #include <linux/kfence.h>
+#include <linux/entry-common.h>

 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
@@ -203,7 +204,7 @@ static inline bool access_error(unsigned long
cause, struct vm_area_struct *vma)
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
  */
-asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
+static void __do_page_fault(struct pt_regs *regs)
 {
        struct task_struct *tsk;
        struct vm_area_struct *vma;
@@ -350,4 +351,13 @@ asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
        }
        return;
 }
+
+asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
+{
+       irqentry_state_t state = irqentry_enter(regs);
+
+       __do_page_fault(regs);
+
+       irqentry_exit(regs, state);
+}
 NOKPROBE_SYMBOL(do_page_fault);


        }
}

>
> > >
> > > The basic shape of the trap handlers looks a little like:
> > >
> > >         if (user_mode(regs)) {
> > If nmi comes from user_mode, why we using
> > irqenrty_enter/exit_from/to_user_mode instead of
> > irqentry_nmi_enter/exit?
>
> s/nmi/trap/ because the 'from-user' trap never nests inside kernel code.
>
> Additionally, many 'from-user' traps want to do 'silly' things like send
> signals, which is something that requires scheduling.
>
> They're fundamentally different from 'from-kernel' traps, which per the
> above, nest most dangerously.
>
> > >                 irqenrty_enter_from_user_mode(regs);
> > >                 do_user_trap();
> > >                 irqentry_exit_to_user_mode(regs);
> > >         } else {
> > >                 irqentry_state_t state = irqentry_nmi_enter(regs);
> > >                 do_kernel_trap();
> > >                 irqentry_nmi_exit(regs, state);
> > >         }
> > >
> > > Not saying you have to match Risc-V in this patch-set, just something to
> > > consider.
> > I think the shape of the riscv NMI handler looks a little like this:
> >
> > asmlinkage __visible __trap_section void do_trap_nmi(struct pt_regs *regs)
> > {
> >                  irqentry_state_t state = irqentry_nmi_enter(regs);
> >                  do_nmi_trap();
> >                  irqentry_nmi_exit(regs, state);
> > }
>
> That is correct for the NMI handler; but here I'm specifically talking
> about traps, like the unalign trap, break trap etc. Those that can
> happen *anywhere* in kernel code and nest most unfortunate.



--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

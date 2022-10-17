Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD04C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17SkajHYx+c1eQBZ5D3C+xHtGSlJW/2zZKZJkM8PTI0=; b=pvykLNjU4Dm6B0
	kHgO2/zR4Xw7U0MN3ZWDJC8JgFG5I0TrWTOXJPSdg8piBTQUM0+MYXwhOVMd/xvLxYcbAVr1xUac1
	AvYb5u+QY7vXEv+9rqciweLMq9iJZsFhR/RoQ/Q/BzA/4WUKpyP4AIYcta8NN5zWpnJodyp+3HpZ/
	r1w35+63T7qx4TLvsB44VAQbQdwdhfXHTv7SO863GkQhKsAxccKgoGISvD47gQAwQ/HT+V9EvRBcu
	7DiDBcsrG2KuQTx6iCN9+qmt2wny9Hr4VibUmmdXC9GcEMCyhQDRhWlqoxPzq54j0PE6X8bmWyoqo
	BdKOgcuGOyb+GCHBaFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okRZB-00D44a-Jf; Mon, 17 Oct 2022 14:58:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okRZ7-00D3oY-TH
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 14:58:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 854C96118C;
	Mon, 17 Oct 2022 14:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AF6C433D7;
	Mon, 17 Oct 2022 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666018682;
	bh=8GrxkZDLsUS0hnYYJXr0bB/LGt8vnwRdRBYfdFrxdEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGVtNIOuZWBTK3dBLlzk6OR6hfvO+uXKPYSVHDOAmyh4XQF9RiwaC48k8tfG7y81U
	 ufvD9uzGKC+QS31YuBe8tcSoJtywub0MqG9KPiag9YJ+u/Tzt2Lu4xyZmIU+RcD3kh
	 1zVXS8MF+mHSMs2OzBhsevXHXrQ+cMD5n3GlzBl2aG2S3ARDbJsgGRlHlifqGX+vvb
	 c7VLoSAHjEPLpc3Jfgb/vuCccPcUH/EfXBgWA4074x6wYGKHB5PagyG4/s2iKniZJ5
	 9ICE5pcDSMUIVjSag6ep5WXjWPMa+4/VwQsQXP+vk+k4y6mX5HM9Qd0W6xI2kWyonY
	 1ZU2sCUyuJ9EQ==
Date: Mon, 17 Oct 2022 15:57:57 +0100
From: Conor Dooley <conor@kernel.org>
To: binglei wang <l3b2w1@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
	davem@davemloft.net, mhiramat@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] rethook: add riscv rethook implementation
Message-ID: <Y01tdcRRFBdOmaYc@spud>
References: <20220930081357.651914-1-l3b2w1@gmail.com>
 <Yzm+z+mv/VSA+5hg@spud>
 <CAJ3C4KzyAR7dKYFBKHzFEXr-dzr-JMGRFVx+dybMhRPy0uHUgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ3C4KzyAR7dKYFBKHzFEXr-dzr-JMGRFVx+dybMhRPy0uHUgA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_075806_048429_296DFD44 
X-CRM114-Status: GOOD (  43.03  )
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

On Mon, Oct 17, 2022 at 10:31:28PM +0800, binglei wang wrote:
> Hi Conor,
> could you please help me to push forward merging process of this patch
> into the 6.1 ?  Thank you!

Hey Binglei,
Unfortunately it is too late for v6.1 (the merge window closed on
Sunday, Palmer sent his second PR on Friday) but I don't see why this
should not be picked for v6.2. I tried last week & again just now to
check the status of this patch on patchwork but I cannot find it there.
Similarly, the patch does not appear on lore:
https://lore.kernel.org/linux-riscv/CAJ3C4KzyAR7dKYFBKHzFEXr-dzr-JMGRFVx+dybMhRPy0uHUgA@mail.gmail.com/T/#t
Thread overview: 3+ messages (download: mbox.gz / follow: Atom feed)
-- links below jump to the message on this page --
     [not found] <20220930081357.651914-1-l3b2w1@gmail.com>
2022-10-02  9:10 ` [PATCH v8] rethook: add riscv rethook implementation Masami Hiramatsu
2022-10-02 16:39 ` Conor Dooley
2022-10-17 14:31   ` binglei wang

I'm not really sure what's happened there.. I can only see your v1 and
your v4 on lore/patchwork. Maybe take a look if you changed anything
between versions & try resending as v9?

HTH,
Conor.

> 
> Binglei Wang
> Best wishes.
> 
> 
> On 2022-10-03 00:39, Conor Dooley wrote:
> > Hey Binglei,
> > I am not qualified to give you an actual R-b on this patch, but I see
> > you did get one from Masami who very much is!
> >
> > That said, the patch looks a lot better (and much simpler!) now. Thanks
> > for sticking with it despite the initial issues with your email setup
> > and the submission process.
> >
> > Thanks,
> > Conor.
> >
> > On Fri, Sep 30, 2022 at 04:13:57PM +0800, Binglei Wang wrote:
> >> From: Binglei Wang <l3b2w1@gmail.com>
> >>
> >> Implement the kretprobes on riscv arch by using rethook machenism
> >> which abstracts general kretprobe info into a struct rethook_node
> >> to be embedded in the struct kretprobe_instance.
> >>
> >> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
> >> ---
> >>
> >> Notes:
> >>      v8: Add the omitted rethook.h
> >>      v7: Add the changelog.
> >>      v6: Remove the kretprobes trampoline.
> >>      v5: Trt to fix robot compiling error and warnings.
> >>      v4: Add patch version number.
> >>      v3: Trt to fix robot compiling error and warnings.
> >>      v2: Add comit log to explain reasons behind changes.
> >>          Use my personal email instead of work email
> >>              to avoid the attachments of company informaton.
> >>          Make the kprobes_trampoline.S code to be shared.
> >>      v1: Add riscv rethook implementation.
> >>
> >>   arch/riscv/Kconfig                            |  1 +
> >>   arch/riscv/include/asm/kprobes.h              |  2 --
> >>   arch/riscv/kernel/probes/Makefile             |  2 +-
> >>   arch/riscv/kernel/probes/kprobes.c            | 13 ---------
> >>   arch/riscv/kernel/probes/rethook.c            | 27 +++++++++++++++++++
> >>   arch/riscv/kernel/probes/rethook.h            |  8 ++++++
> >>   ...obes_trampoline.S => rethook_trampoline.S} |  6 ++---
> >>   7 files changed, 40 insertions(+), 19 deletions(-)
> >>   create mode 100644 arch/riscv/kernel/probes/rethook.c
> >>   create mode 100644 arch/riscv/kernel/probes/rethook.h
> >>   rename arch/riscv/kernel/probes/{kprobes_trampoline.S => rethook_trampoline.S} (94%)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index 59d18881f..bfb66cdc5 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -97,6 +97,7 @@ config RISCV
> >>      select HAVE_KPROBES if !XIP_KERNEL
> >>      select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> >>      select HAVE_KRETPROBES if !XIP_KERNEL
> >> +    select HAVE_RETHOOK if !XIP_KERNEL
> >>      select HAVE_MOVE_PMD
> >>      select HAVE_MOVE_PUD
> >>      select HAVE_PCI
> >> diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
> >> index 217ef89f2..e7882ccb0 100644
> >> --- a/arch/riscv/include/asm/kprobes.h
> >> +++ b/arch/riscv/include/asm/kprobes.h
> >> @@ -40,8 +40,6 @@ void arch_remove_kprobe(struct kprobe *p);
> >>   int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
> >>   bool kprobe_breakpoint_handler(struct pt_regs *regs);
> >>   bool kprobe_single_step_handler(struct pt_regs *regs);
> >> -void __kretprobe_trampoline(void);
> >> -void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
> >>
> >>   #endif /* CONFIG_KPROBES */
> >>   #endif /* _ASM_RISCV_KPROBES_H */
> >> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
> >> index 7f0840dcc..c40139e9c 100644
> >> --- a/arch/riscv/kernel/probes/Makefile
> >> +++ b/arch/riscv/kernel/probes/Makefile
> >> @@ -1,6 +1,6 @@
> >>   # SPDX-License-Identifier: GPL-2.0
> >>   obj-$(CONFIG_KPROBES)              += kprobes.o decode-insn.o simulate-insn.o
> >> -obj-$(CONFIG_KPROBES)               += kprobes_trampoline.o
> >> +obj-$(CONFIG_RETHOOK)               += rethook.o rethook_trampoline.o
> >>   obj-$(CONFIG_KPROBES_ON_FTRACE)    += ftrace.o
> >>   obj-$(CONFIG_UPROBES)              += uprobes.o decode-insn.o simulate-insn.o
> >>   CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
> >> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> >> index e6e950b7c..f21592d20 100644
> >> --- a/arch/riscv/kernel/probes/kprobes.c
> >> +++ b/arch/riscv/kernel/probes/kprobes.c
> >> @@ -345,19 +345,6 @@ int __init arch_populate_kprobe_blacklist(void)
> >>      return ret;
> >>   }
> >>
> >> -void __kprobes __used *trampoline_probe_handler(struct pt_regs *regs)
> >> -{
> >> -    return (void *)kretprobe_trampoline_handler(regs, NULL);
> >> -}
> >> -
> >> -void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
> >> -                                  struct pt_regs *regs)
> >> -{
> >> -    ri->ret_addr = (kprobe_opcode_t *)regs->ra;
> >> -    ri->fp = NULL;
> >> -    regs->ra = (unsigned long) &__kretprobe_trampoline;
> >> -}
> >> -
> >>   int __kprobes arch_trampoline_kprobe(struct kprobe *p)
> >>   {
> >>      return 0;
> >> diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
> >> new file mode 100644
> >> index 000000000..cbd0da059
> >> --- /dev/null
> >> +++ b/arch/riscv/kernel/probes/rethook.c
> >> @@ -0,0 +1,27 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Generic return hook for riscv.
> >> + */
> >> +
> >> +#include <linux/kprobes.h>
> >> +#include <linux/rethook.h>
> >> +#include "rethook.h"
> >> +
> >> +/* This is called from arch_rethook_trampoline() */
> >> +unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
> >> +{
> >> +    return rethook_trampoline_handler(regs, regs->s0);
> >> +}
> >> +NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
> >> +
> >> +
> >> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
> >> +{
> >> +    rhn->ret_addr = regs->ra;
> >> +    rhn->frame = regs->s0;
> >> +
> >> +    /* replace return addr with trampoline */
> >> +    regs->ra = (unsigned long)arch_rethook_trampoline;
> >> +}
> >> +NOKPROBE_SYMBOL(arch_rethook_prepare);
> >> +
> >> diff --git a/arch/riscv/kernel/probes/rethook.h b/arch/riscv/kernel/probes/rethook.h
> >> new file mode 100644
> >> index 000000000..cc573d701
> >> --- /dev/null
> >> +++ b/arch/riscv/kernel/probes/rethook.h
> >> @@ -0,0 +1,8 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +#ifndef __RISCV_RETHOOK_H
> >> +#define __RISCV_RETHOOK_H
> >> +
> >> +unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
> >> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
> >> +
> >> +#endif
> >> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
> >> similarity index 94%
> >> rename from arch/riscv/kernel/probes/kprobes_trampoline.S
> >> rename to arch/riscv/kernel/probes/rethook_trampoline.S
> >> index 7bdb09ded..21bac92a1 100644
> >> --- a/arch/riscv/kernel/probes/kprobes_trampoline.S
> >> +++ b/arch/riscv/kernel/probes/rethook_trampoline.S
> >> @@ -75,13 +75,13 @@
> >>      REG_L x31, PT_T6(sp)
> >>      .endm
> >>
> >> -ENTRY(__kretprobe_trampoline)
> >> +ENTRY(arch_rethook_trampoline)
> >>      addi sp, sp, -(PT_SIZE_ON_STACK)
> >>      save_all_base_regs
> >>
> >>      move a0, sp /* pt_regs */
> >>
> >> -    call trampoline_probe_handler
> >> +    call arch_rethook_trampoline_callback
> >>
> >>      /* use the result as the return-address */
> >>      move ra, a0
> >> @@ -90,4 +90,4 @@ ENTRY(__kretprobe_trampoline)
> >>      addi sp, sp, PT_SIZE_ON_STACK
> >>
> >>      ret
> >> -ENDPROC(__kretprobe_trampoline)
> >> +ENDPROC(arch_rethook_trampoline)
> >> --
> >> 2.27.0
> >>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

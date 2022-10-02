Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077CBC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 16:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwiO+VOZnUGP4gf9GN2+YZhiaHMYdfl5rr0cW3AqsmE=; b=oQEZzm8SUgzUIL
	6pCe7I0T+u+qfoxoo28IGnco+NzDJO/y9T7eDKoWYdSB2kK69BvNgWMFJ6NWW8/WSSov56sL0bMQO
	MewwQFj+PfvzpnSmBFl7I55QmCEUQBPHnE2our+BAeI3wDgHcCDi/3u41N0+FgA++SMOSYPuCdTb7
	64wtiIj6AyegTxewQv2S+tEhVmyEzuH6MNLX7Mua3Z0feXEH47UlRlJFyYx0+oGg0OXHyZz2LWa1B
	BSYIuSzoRJFtsZPaJEIIf5PWyYrv9EMhLLwbdG8/Uph748eTgZYnivFciON63lSqnEG540iLL96Rl
	XnY6NQCt8tA5wtTEWPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1of20Q-001pB3-Iw; Sun, 02 Oct 2022 16:39:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1of20M-001pAb-Oy
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 16:39:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CA8960EFD;
	Sun,  2 Oct 2022 16:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7226CC433C1;
	Sun,  2 Oct 2022 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664728788;
	bh=vXNiHf9agYK/eOk3du1LkZcrfdcJZeWbwCfg/j1zGrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvdXO1q1o9kEW++FCbm5r3kqiJ41jlypC7VFRUFs47lNSjnS9xxiL725ujcdQ+A5U
	 +4opWfnSnmCyt1jkVzQh+kDyYZGU4VE+SzeBXd0JnsRhgm3J3Ock+RwLpmBwwb+LuZ
	 r3hLT+RbqQhsiAzux4LnUllTw4MyhYwvZyfm8o/6nw/miNCey6eWnY58H2truTiDlL
	 pTHusNlXJ/P8wEJDf9ymKCwdJKSYQs01BqhIV5Bkwfv/YpbdlEQ1r1XQyycjjCvqBW
	 NuJNBFrShPkI0CFJfQ7Kh+7jV8TclLrofqnAGWVcocqJciHH5xt55rO3te59FnmQiB
	 /Pbxfez4l4J/g==
Date: Sun, 2 Oct 2022 17:39:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Binglei Wang <l3b2w1@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
	davem@davemloft.net, mhiramat@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] rethook: add riscv rethook implementation
Message-ID: <Yzm+z+mv/VSA+5hg@spud>
References: <20220930081357.651914-1-l3b2w1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930081357.651914-1-l3b2w1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_093950_933162_B841F22F 
X-CRM114-Status: GOOD (  29.14  )
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

Hey Binglei,
I am not qualified to give you an actual R-b on this patch, but I see
you did get one from Masami who very much is!

That said, the patch looks a lot better (and much simpler!) now. Thanks
for sticking with it despite the initial issues with your email setup
and the submission process.

Thanks,
Conor.

On Fri, Sep 30, 2022 at 04:13:57PM +0800, Binglei Wang wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> 
> Implement the kretprobes on riscv arch by using rethook machenism
> which abstracts general kretprobe info into a struct rethook_node
> to be embedded in the struct kretprobe_instance.
> 
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
> ---
> 
> Notes:
>     v8: Add the omitted rethook.h
>     v7: Add the changelog.
>     v6: Remove the kretprobes trampoline.
>     v5: Trt to fix robot compiling error and warnings.
>     v4: Add patch version number.
>     v3: Trt to fix robot compiling error and warnings.
>     v2: Add comit log to explain reasons behind changes.
>         Use my personal email instead of work email
>             to avoid the attachments of company informaton.
>         Make the kprobes_trampoline.S code to be shared.
>     v1: Add riscv rethook implementation.
> 
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/include/asm/kprobes.h              |  2 --
>  arch/riscv/kernel/probes/Makefile             |  2 +-
>  arch/riscv/kernel/probes/kprobes.c            | 13 ---------
>  arch/riscv/kernel/probes/rethook.c            | 27 +++++++++++++++++++
>  arch/riscv/kernel/probes/rethook.h            |  8 ++++++
>  ...obes_trampoline.S => rethook_trampoline.S} |  6 ++---
>  7 files changed, 40 insertions(+), 19 deletions(-)
>  create mode 100644 arch/riscv/kernel/probes/rethook.c
>  create mode 100644 arch/riscv/kernel/probes/rethook.h
>  rename arch/riscv/kernel/probes/{kprobes_trampoline.S => rethook_trampoline.S} (94%)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 59d18881f..bfb66cdc5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -97,6 +97,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_MOVE_PMD
>  	select HAVE_MOVE_PUD
>  	select HAVE_PCI
> diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
> index 217ef89f2..e7882ccb0 100644
> --- a/arch/riscv/include/asm/kprobes.h
> +++ b/arch/riscv/include/asm/kprobes.h
> @@ -40,8 +40,6 @@ void arch_remove_kprobe(struct kprobe *p);
>  int kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr);
>  bool kprobe_breakpoint_handler(struct pt_regs *regs);
>  bool kprobe_single_step_handler(struct pt_regs *regs);
> -void __kretprobe_trampoline(void);
> -void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>  
>  #endif /* CONFIG_KPROBES */
>  #endif /* _ASM_RISCV_KPROBES_H */
> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
> index 7f0840dcc..c40139e9c 100644
> --- a/arch/riscv/kernel/probes/Makefile
> +++ b/arch/riscv/kernel/probes/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_KPROBES)		+= kprobes.o decode-insn.o simulate-insn.o
> -obj-$(CONFIG_KPROBES)		+= kprobes_trampoline.o
> +obj-$(CONFIG_RETHOOK)		+= rethook.o rethook_trampoline.o
>  obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
>  obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
>  CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index e6e950b7c..f21592d20 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -345,19 +345,6 @@ int __init arch_populate_kprobe_blacklist(void)
>  	return ret;
>  }
>  
> -void __kprobes __used *trampoline_probe_handler(struct pt_regs *regs)
> -{
> -	return (void *)kretprobe_trampoline_handler(regs, NULL);
> -}
> -
> -void __kprobes arch_prepare_kretprobe(struct kretprobe_instance *ri,
> -				      struct pt_regs *regs)
> -{
> -	ri->ret_addr = (kprobe_opcode_t *)regs->ra;
> -	ri->fp = NULL;
> -	regs->ra = (unsigned long) &__kretprobe_trampoline;
> -}
> -
>  int __kprobes arch_trampoline_kprobe(struct kprobe *p)
>  {
>  	return 0;
> diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
> new file mode 100644
> index 000000000..cbd0da059
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generic return hook for riscv.
> + */
> +
> +#include <linux/kprobes.h>
> +#include <linux/rethook.h>
> +#include "rethook.h"
> +
> +/* This is called from arch_rethook_trampoline() */
> +unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
> +{
> +	return rethook_trampoline_handler(regs, regs->s0);
> +}
> +NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
> +
> +
> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
> +{
> +	rhn->ret_addr = regs->ra;
> +	rhn->frame = regs->s0;
> +
> +	/* replace return addr with trampoline */
> +	regs->ra = (unsigned long)arch_rethook_trampoline;
> +}
> +NOKPROBE_SYMBOL(arch_rethook_prepare);
> +
> diff --git a/arch/riscv/kernel/probes/rethook.h b/arch/riscv/kernel/probes/rethook.h
> new file mode 100644
> index 000000000..cc573d701
> --- /dev/null
> +++ b/arch/riscv/kernel/probes/rethook.h
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#ifndef __RISCV_RETHOOK_H
> +#define __RISCV_RETHOOK_H
> +
> +unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs);
> +void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount);
> +
> +#endif
> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
> similarity index 94%
> rename from arch/riscv/kernel/probes/kprobes_trampoline.S
> rename to arch/riscv/kernel/probes/rethook_trampoline.S
> index 7bdb09ded..21bac92a1 100644
> --- a/arch/riscv/kernel/probes/kprobes_trampoline.S
> +++ b/arch/riscv/kernel/probes/rethook_trampoline.S
> @@ -75,13 +75,13 @@
>  	REG_L x31, PT_T6(sp)
>  	.endm
>  
> -ENTRY(__kretprobe_trampoline)
> +ENTRY(arch_rethook_trampoline)
>  	addi sp, sp, -(PT_SIZE_ON_STACK)
>  	save_all_base_regs
>  
>  	move a0, sp /* pt_regs */
>  
> -	call trampoline_probe_handler
> +	call arch_rethook_trampoline_callback
>  
>  	/* use the result as the return-address */
>  	move ra, a0
> @@ -90,4 +90,4 @@ ENTRY(__kretprobe_trampoline)
>  	addi sp, sp, PT_SIZE_ON_STACK
>  
>  	ret
> -ENDPROC(__kretprobe_trampoline)
> +ENDPROC(arch_rethook_trampoline)
> -- 
> 2.27.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

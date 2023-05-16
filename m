Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2839FC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pT5XAN73B2JR7qu2UZLrNUyKdD1liozU7/Zr+F9JUmU=; b=qVqBwwIOPAs5+E
	e/zaKel72ocZipRtwxOB6nWgRAzfOFReJmZ879VRjHwYMWo3EU73SHrREupCUo6L7HUyqNPNPK98P
	LYrCeZckHJvFM7Kjr9/ch0zTgOJ1F4b/kH8yJeHV0aDkxc6KS3MaSCM/hZcmdFwatv0baOorqdiR4
	6TD5AN4WztOXIeLAdCdfxlKVE3Esdi6/W1H4cvmpbGgcOiZbKj79Cs76vhtK+nhNv+kogY5IAhHPt
	B5KjpjZ8e25iqsfQ56EPmzVQuADV3Yx4q+nah00le4tLBceQT1Ojt1BZaIYaXOpskVTkJ91cF2BvK
	bsT5dBSxLknnrgDqcZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pymIM-004KJ2-0V;
	Tue, 16 May 2023 04:28:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pymIJ-004KII-0O
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 04:28:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E2D5618BB;
	Tue, 16 May 2023 04:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBA9C4339C;
	Tue, 16 May 2023 04:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684211292;
	bh=B40QBc2Bt3WTy6hcM1whqz8LPgSBg6wuocgJLZD/Zks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fKrws8+B5QGNG4YsOCnUCjatWtzmAAeBTc64BS/GDe6TxbrrQQw/+7hY1TPgUdPW+
	 l5trkAagzobLaMQsTPa0kWxpzo2q9Tdf7zswDem7L8YZkk/xNLt+Dc6X/tlIAghDwF
	 Cd77NDn2eQeJzCaCT2wUYRZ5lkj058Q5Sgy1yUzr36P2l/5fQ8wXMa23rZCFIACpUc
	 Xrrn1W8xKP2S8cUNpsmd1hjGyKW36cD9k75Aa0/g3JC49MhtAzGwz7UkwcHEDxBgyK
	 4UZf4myxlZcDLlmqc1JnfbGS0Ms2coZ/E31M8LSOhosJwrACyhUHDjYgZZBryut7n7
	 awVm4SJajHb0Q==
Date: Tue, 16 May 2023 13:28:06 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ze Gao <zegao@tencent.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] rehook, fprobe: mark rethook related functions
 notrace
Message-Id: <20230516132806.886543f000d93e0c2b26a2f3@kernel.org>
In-Reply-To: <238bad4335d029072ca6000fb404f47376197f39.1684120990.git.zegao@tencent.com>
References: <cover.1684120990.git.zegao@tencent.com>
	<238bad4335d029072ca6000fb404f47376197f39.1684120990.git.zegao@tencent.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_212815_267680_7279DB65 
X-CRM114-Status: GOOD (  23.39  )
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

On Mon, 15 May 2023 11:26:41 +0800
Ze Gao <zegao2021@gmail.com> wrote:

> These functions are already marked as NOKPROBE to prevent recusion and
> we have the same reason to blacklist them if rethook is used with fprobe,
> since they are beyond the recursion-free region ftrace can guard.
> 
> Signed-off-by: Ze Gao <zegao@tencent.com>
> ---
>  arch/riscv/kernel/probes/rethook.c | 4 ++--
>  arch/s390/kernel/rethook.c         | 6 +++---
>  arch/x86/kernel/rethook.c          | 8 +++++---
>  kernel/trace/rethook.c             | 8 ++++----

Except for the kernel/trace/rethook.c, those looks good to me.
Could you drop notrace from kernel/trace/rethook.c? As Steve mentioned
all functions in that file is automatically notraced.

Thank you,

>  4 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
> index 5c27c1f50989..803c412a1bea 100644
> --- a/arch/riscv/kernel/probes/rethook.c
> +++ b/arch/riscv/kernel/probes/rethook.c
> @@ -8,14 +8,14 @@
>  #include "rethook.h"
>  
>  /* This is called from arch_rethook_trampoline() */
> -unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
> +unsigned long __used notrace arch_rethook_trampoline_callback(struct pt_regs *regs)
>  {
>  	return rethook_trampoline_handler(regs, regs->s0);
>  }
>  
>  NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
>  
> -void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
> +void notrace arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
>  {
>  	rhn->ret_addr = regs->ra;
>  	rhn->frame = regs->s0;
> diff --git a/arch/s390/kernel/rethook.c b/arch/s390/kernel/rethook.c
> index af10e6bdd34e..ad52119826c1 100644
> --- a/arch/s390/kernel/rethook.c
> +++ b/arch/s390/kernel/rethook.c
> @@ -3,7 +3,7 @@
>  #include <linux/kprobes.h>
>  #include "rethook.h"
>  
> -void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
> +void notrace arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
>  {
>  	rh->ret_addr = regs->gprs[14];
>  	rh->frame = regs->gprs[15];
> @@ -13,7 +13,7 @@ void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mc
>  }
>  NOKPROBE_SYMBOL(arch_rethook_prepare);
>  
> -void arch_rethook_fixup_return(struct pt_regs *regs,
> +void notrace arch_rethook_fixup_return(struct pt_regs *regs,
>  			       unsigned long correct_ret_addr)
>  {
>  	/* Replace fake return address with real one. */
> @@ -24,7 +24,7 @@ NOKPROBE_SYMBOL(arch_rethook_fixup_return);
>  /*
>   * Called from arch_rethook_trampoline
>   */
> -unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
> +unsigned long notrace arch_rethook_trampoline_callback(struct pt_regs *regs)
>  {
>  	return rethook_trampoline_handler(regs, regs->gprs[15]);
>  }
> diff --git a/arch/x86/kernel/rethook.c b/arch/x86/kernel/rethook.c
> index 8a1c0111ae79..1f7cef86f73d 100644
> --- a/arch/x86/kernel/rethook.c
> +++ b/arch/x86/kernel/rethook.c
> @@ -64,7 +64,8 @@ NOKPROBE_SYMBOL(arch_rethook_trampoline);
>  /*
>   * Called from arch_rethook_trampoline
>   */
> -__used __visible void arch_rethook_trampoline_callback(struct pt_regs *regs)
> +__used __visible void notrace arch_rethook_trampoline_callback(struct pt_regs
> +		*regs)
>  {
>  	unsigned long *frame_pointer;
>  
> @@ -104,7 +105,7 @@ NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
>  STACK_FRAME_NON_STANDARD_FP(arch_rethook_trampoline);
>  
>  /* This is called from rethook_trampoline_handler(). */
> -void arch_rethook_fixup_return(struct pt_regs *regs,
> +void notrace arch_rethook_fixup_return(struct pt_regs *regs,
>  			       unsigned long correct_ret_addr)
>  {
>  	unsigned long *frame_pointer = (void *)(regs + 1);
> @@ -114,7 +115,8 @@ void arch_rethook_fixup_return(struct pt_regs *regs,
>  }
>  NOKPROBE_SYMBOL(arch_rethook_fixup_return);
>  
> -void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
> +void notrace arch_rethook_prepare(struct rethook_node *rh, struct pt_regs
> +		*regs, bool mcount)
>  {
>  	unsigned long *stack = (unsigned long *)regs->sp;
>  
> diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
> index 60f6cb2b486b..e551e86d3927 100644
> --- a/kernel/trace/rethook.c
> +++ b/kernel/trace/rethook.c
> @@ -127,7 +127,7 @@ static void free_rethook_node_rcu(struct rcu_head *head)
>   * Return back the @node to @node::rethook. If the @node::rethook is already
>   * marked as freed, this will free the @node.
>   */
> -void rethook_recycle(struct rethook_node *node)
> +void notrace rethook_recycle(struct rethook_node *node)
>  {
>  	lockdep_assert_preemption_disabled();
>  
> @@ -194,7 +194,7 @@ void rethook_hook(struct rethook_node *node, struct pt_regs *regs, bool mcount)
>  NOKPROBE_SYMBOL(rethook_hook);
>  
>  /* This assumes the 'tsk' is the current task or is not running. */
> -static unsigned long __rethook_find_ret_addr(struct task_struct *tsk,
> +static unsigned long notrace __rethook_find_ret_addr(struct task_struct *tsk,
>  					     struct llist_node **cur)
>  {
>  	struct rethook_node *rh = NULL;
> @@ -256,7 +256,7 @@ unsigned long rethook_find_ret_addr(struct task_struct *tsk, unsigned long frame
>  }
>  NOKPROBE_SYMBOL(rethook_find_ret_addr);
>  
> -void __weak arch_rethook_fixup_return(struct pt_regs *regs,
> +void __weak notrace arch_rethook_fixup_return(struct pt_regs *regs,
>  				      unsigned long correct_ret_addr)
>  {
>  	/*
> @@ -268,7 +268,7 @@ void __weak arch_rethook_fixup_return(struct pt_regs *regs,
>  }
>  
>  /* This function will be called from each arch-defined trampoline. */
> -unsigned long rethook_trampoline_handler(struct pt_regs *regs,
> +unsigned long notrace rethook_trampoline_handler(struct pt_regs *regs,
>  					 unsigned long frame)
>  {
>  	struct llist_node *first, *node = NULL;
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956FEC46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 03:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gN9ZE8kzXsbKdy+a4A+1np/wY883sqwpPVBFy+5GhkE=; b=4II8o79OtI1CY6
	gcwJrtgYKYeG6KS5e5gXAE9of71JmxMdq2sTg+mv7Z59Yy2E7oU7pwtAiDjWL3c9fIfwuXpbgwwf6
	f02nnRxsCvLzeJsQsrjASywFrDnsPItUVTYSW/SUmpFBBtMyhWPIK6hSMCmkpKa6DrDj7PHl/Rfkg
	scG4ANDplJnkUyKv05UBmcdo0q1AOUuRNlP1NRXCxpxlZa3q8FyQIr6JC8qgGMS6lgRlPv2gcKje4
	qvm5wndethztWvPDUgwLLwC1Kcl5OQc+hJhlLBLOkZ2xHXPuowT3IrI8cssuDMJCJ7q4XeiPvoO+s
	w65LDR8/vsG+2WEA814A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHyYs-00Bdx2-30;
	Tue, 26 Dec 2023 03:56:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHyYp-00Bdwf-10
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 03:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B250060C85;
	Tue, 26 Dec 2023 03:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08C2C433C7;
	Tue, 26 Dec 2023 03:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703563011;
	bh=bALt5fFkdTtCWQl6cTTgbR1RwayXwAm/GmiyEsQiowQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzK+NX5x0tO3nUF2uxnFu2Ti44+SeA8xMdh+FzKjDWNxGKIeXFsTff1l/BLDVmNSv
	 OkoB4cQpQXeDTLZBSxR7M9Ne8GuY6ifGzpi3/I6eIGtIj5LRrENT6PWVFzTQjs59DL
	 3HKNRerMHLWAmWtUvfJZ74WCgflt3xofhOcIVtrRVrU35Qd6Xzmijq33RK6FJkJXLN
	 GrEN4JRIiRCBx6WWfg0/O2e83TRibgU509Bijm/qcBUjl5bKDRJ02Yp9z+R9LHYnOA
	 i0oIIv8l5AuPCbeRX4PfPKzY3sck/qOAersoY8le76FCjMyRkKM9l/0F5kU51OX7HV
	 nX4P/26txEReQ==
Date: Mon, 25 Dec 2023 22:56:46 -0500
From: Guo Ren <guoren@kernel.org>
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Improve exception and system call latency
Message-ID: <ZYpO/pfbea7hWu3r@gmail.com>
References: <20231225040018.1660554-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231225040018.1660554-1-antonb@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_195655_456849_4F826284 
X-CRM114-Status: GOOD (  29.30  )
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

On Sun, Dec 24, 2023 at 08:00:18PM -0800, Anton Blanchard wrote:
> Many CPUs implement return address branch prediction as a stack. The
> RISCV architecture refers to this as a return address stack (RAS). If
> this gets corrupted then the CPU will mispredict at least one but
> potentally many function returns.
> 
> There are two issues with the current RISCV exception code:
> 
> - We are using the alternate link stack (x5/t0) for the indirect branch
>   which makes the hardware think this is a function return. This will
>   corrupt the RAS.
> 
> - We modify the return address of handle_exception to point to
>   ret_from_exception. This will also corrupt the RAS.
> 
> Testing the null system call latency before and after the patch:
> 
> Visionfive2 (StarFive JH7110 / U74)
> baseline: 189.87 ns
> patched:  176.76 ns
> 
> Lichee pi 4a (T-Head TH1520 / C910)
> baseline: 666.58 ns
> patched:  636.90 ns
> 
> Just over 7% on the U74 and just over 4% on the C910.

Yes, the wrong "jalr zero, t0/ra" would pop RAS and destroy the RAS
layout of the hardware for the userspace. How about giving a fake push
for the RAS to connect "jalr zero, ra" of sub-function call return? I'm
curious if you could measure the difference with only one RAS
misprediction.

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 54ca4564a926..94c7d2be35d0 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -93,7 +93,8 @@ SYM_CODE_START(handle_exception)
        bge s4, zero, 1f

        /* Handle interrupts */
-       tail do_irq
+       auipc t0, do_irq
+       jalr  t0, t0
 1:
        /* Handle other exceptions */
        slli t0, s4, RISCV_LGPTR
@@ -103,9 +104,10 @@ SYM_CODE_START(handle_exception)
        /* Check if exception code lies within bounds */
        bgeu t0, t2, 1f
        REG_L t0, 0(t0)
-       jr t0
+       jalr t0, t0
 1:
-       tail do_trap_unknown
+       auipc t0, do_trap_unknown
+       jalr  t0, t0
 SYM_CODE_END(handle_exception)

You could prepare a deeper userspace stack calling if you want better
measurement results.

> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> This introduces some complexity in the stackframe walk code. PowerPC
> resolves the multiple exception exit paths issue by placing a value into
> the exception stack frame (basically the word "REGS") that the stack frame
> code can look for. Perhaps something to look at.
> 
>  arch/riscv/kernel/entry.S      | 21 ++++++++++++++-------
>  arch/riscv/kernel/stacktrace.c | 14 +++++++++++++-
>  2 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 54ca4564a926..89af35edbf6c 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -84,7 +84,6 @@ SYM_CODE_START(handle_exception)
>  	scs_load_current_if_task_changed s5
>  
>  	move a0, sp /* pt_regs */
> -	la ra, ret_from_exception
>  
>  	/*
>  	 * MSB of cause differentiates between
> @@ -93,7 +92,10 @@ SYM_CODE_START(handle_exception)
>  	bge s4, zero, 1f
>  
>  	/* Handle interrupts */
> -	tail do_irq
> +	call do_irq
> +.globl ret_from_irq_exception
> +ret_from_irq_exception:
> +	j ret_from_exception
>  1:
>  	/* Handle other exceptions */
>  	slli t0, s4, RISCV_LGPTR
> @@ -101,11 +103,16 @@ SYM_CODE_START(handle_exception)
>  	la t2, excp_vect_table_end
>  	add t0, t1, t0
>  	/* Check if exception code lies within bounds */
> -	bgeu t0, t2, 1f
> -	REG_L t0, 0(t0)
> -	jr t0
> -1:
> -	tail do_trap_unknown
> +	bgeu t0, t2, 3f
> +	REG_L t1, 0(t0)
> +2:	jalr ra,t1
> +.globl ret_from_other_exception
> +ret_from_other_exception:
> +	j ret_from_exception
> +3:
> +
> +	la t1, do_trap_unknown
> +	j 2b
>  SYM_CODE_END(handle_exception)
>  
>  /*
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 64a9c093aef9..b9cd131bbc4c 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -17,6 +17,18 @@
>  #ifdef CONFIG_FRAME_POINTER
>  
>  extern asmlinkage void ret_from_exception(void);
> +extern asmlinkage void ret_from_irq_exception(void);
> +extern asmlinkage void ret_from_other_exception(void);
> +
> +static inline bool is_exception_frame(unsigned long pc)
> +{
> +	if ((pc == (unsigned long)ret_from_exception) ||
> +	    (pc == (unsigned long)ret_from_irq_exception) ||
> +	    (pc == (unsigned long)ret_from_other_exception))
> +		return true;
> +
> +	return false;
> +}
We needn't put too many .globl in the entry.S, and just check that pc is
in SYM_CODE_START/END(handle_exception), then entry.S would be cleaner:

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 54ca4564a926..d452d5f12b1b 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -84,7 +84,6 @@ SYM_CODE_START(handle_exception)
        scs_load_current_if_task_changed s5

        move a0, sp /* pt_regs */

        /*
         * MSB of cause differentiates between
@@ -93,7 +92,8 @@ SYM_CODE_START(handle_exception)
        bge s4, zero, 1f

        /* Handle interrupts */
        call do_irq
        j ret_from_exception
 1:
        /* Handle other exceptions */
        slli t0, s4, RISCV_LGPTR
@@ -102,10 +102,12 @@ SYM_CODE_START(handle_exception)
        add t0, t1, t0
        /* Check if exception code lies within bounds */
        bgeu t0, t2, 1f
        REG_L ra, 0(t0)
        jalr ra, ra
        j ret_from_exception
 1:
        call do_trap_unknown
        j ret_from_exception
 SYM_CODE_END(handle_exception)


>  
>  void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			     bool (*fn)(void *, unsigned long), void *arg)
> @@ -62,7 +74,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			fp = frame->fp;
>  			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
>  						   &frame->ra);
> -			if (pc == (unsigned long)ret_from_exception) {
> +			if (is_exception_frame(pc)) {
>  				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
>  					break;
>  
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

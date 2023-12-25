Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCCC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNTa303gxDpKhiCi2QQPBwNZ07vgJb4XtHpOiFw/dQU=; b=eOPJrv7LTSQgfr
	buXxy4Q8QIPKkI2O8jqi5qUci34HG6Ml/d0xZvD0PXCGugaGyo3FVRHgn/QSrRz0PGd2nrSifq0ne
	ErObjNCVSCuEFWRDHs4Uy0a+ey3f3aJJkhUGa9X/cWqZIZOwPkMywaN9vC9Gm5tUOCiiqBY5HihEZ
	ouoqxTnkquZzjUss0A+U/SySDoQTCkDFqYLA3Q+bW1rpiSAubQBmFjYgqqkX1tKYGuv0WK8mS156r
	PLc5/BU+mLXhl839/XZ1ruRnbr69RTysX/rWQEP2VZ/tCrsVSnzX+bcnwgBE5RjHOgp2tNhC09smS
	XV57ndis73HOHS636vGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHi5s-00AWrS-2x;
	Mon, 25 Dec 2023 10:21:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHi5p-00AWqY-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 10:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10CC0B80AED;
	Mon, 25 Dec 2023 10:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECB5C433C8;
	Mon, 25 Dec 2023 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703499709;
	bh=i1SHljfWffchKYIbBiC+XAF1L/ESbbhX8W1UTDP5DLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=li2DkUGVp9xq9yTJP0kHPw1M24XeclXEsWzag2D3ZMeVYn5LzYk51j+oGOdBtGisL
	 bC6BZOszdWI1I1zAD1clav5bZppi6co2RoAz0joDC7LILXVoGU98L3YMlu558g+VBR
	 we++UoZFECEmYGoUOmQ6gua+dQBNTfrh4M5PpWO8o9cPysnhOxiX4UhvuS0nNtBlls
	 GyxQFaG1sm1Djec1ZSZQ+g4mFqfV364A1bQfqkAKfvbU8oM2jdCpHeE8TxweyE4uzL
	 Lzz8NvqQqfRvz1tUhdqrlOW5SKUl4W4ulrkXcWk6QgN5W6aXKS5FUS4NObbnxq72Md
	 Kxx1dZ2Wczkng==
Date: Mon, 25 Dec 2023 18:09:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Improve exception and system call latency
Message-ID: <ZYlUxxeEmvewNzyL@xhacker>
References: <20231225040018.1660554-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231225040018.1660554-1-antonb@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_022154_093942_5485EE86 
X-CRM114-Status: GOOD (  25.37  )
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

Nice improvement!

> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
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

can be simplified to
	jalr t1

with the above change,
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DF0C3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J86Y99503uhnecPo7pvr0Ce/tLSwafhMhzPG8FoNSlE=; b=NoCnvR8SlThRNm
	xOnIr4lxRILl1+6we4FfnfmPB8LY4OVUZFVPU1XZwp0aVETdMIScC28uad6rKGY2jVmUP+KjcSe/6
	CHWA7X6ZDKH8UGvpjDldPFy/6CpZtKNcP/2UCNvJfsgBMN2VfGzcJdlw4mEE1Yah4Av5OSpNRF38X
	twV8POlgEpU5vpwS18Vuu9WzhlZBgUGjO2RpOoYC9JaRytyF0rfm+syCDYuEtWqEwwmeF5rRj2Vs6
	Ot4kQ8jola83f4cY9YBrW1/MJ3VvzQ2v+Ttwx4bn7s2qkcYJUXoppzltLaVywdzKk9Ow0PyMlrDCA
	MtuxSCecNsPqSIt28GgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRvC8-0000000EPoP-0h8V;
	Thu, 11 Jul 2024 14:54:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRvC4-0000000EPnk-2tOj
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 14:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BB7360AD6;
	Thu, 11 Jul 2024 14:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFC1C116B1;
	Thu, 11 Jul 2024 14:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720709687;
	bh=0/mI3AauqSo/TufjQdQjUo6dCLrU1WeCSj/5ySxVsSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbPE43BmBoIbVEv+lnM0MBlVgA3oBAnb0wNCbr4rUrmOEPabS436DWqehGD5N6GJY
	 WhG6r8w+PWZitMYZrchmb+3TPUvfEOjuoV1NKJm+rENCe9rDHVthD+hAopZaZwmP3Z
	 f7PuWnhLyt7WVx4NBV55us5oX8Le3TwHtahk1cJchCMtEq9Xql5IpPR1OGKKEsl6ek
	 R9LrGPr6i4zDJLbDUpxPrFRfIQo27nXLhJHOZJXlgIWXYrV8QDPTvu6lducX1fjpar
	 QKlSlHLZxEDUQv8ioLR5Ks2e2TiX6SGGfwDT1rdQ7j+xr10TFccRxdiYQyMNkjfkDG
	 +tiKS77A4EHWw==
Date: Thu, 11 Jul 2024 22:40:33 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	antonb@tenstorrent.com
Subject: Re: [PATCH v2] riscv: Improve exception and system call latency
Message-ID: <Zo_u4eoq3-m9e3X7@xhacker>
References: <20231225040018.1660554-1-antonb@tenstorrent.com>
 <20240607061335.2197383-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607061335.2197383-1-cyrilbur@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_075448_891965_BCE493E7 
X-CRM114-Status: GOOD (  24.37  )
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

On Thu, Jun 06, 2024 at 11:13:35PM -0700, Cyril Bur wrote:
> From: Anton Blanchard <antonb@tenstorrent.com>
> 
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
> 
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

Tested-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> v2:
>    Simplify jalr ra,t1 to jalr t1
>    Drop extra .globl from entry.S and use ra == handle_exception
> ---
>  arch/riscv/kernel/entry.S      | 17 ++++++++++-------
>  arch/riscv/kernel/stacktrace.c |  4 ++--
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 68a24cf9481a..c933460ed3e9 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -88,7 +88,6 @@ SYM_CODE_START(handle_exception)
>  	call riscv_v_context_nesting_start
>  #endif
>  	move a0, sp /* pt_regs */
> -	la ra, ret_from_exception
>  
>  	/*
>  	 * MSB of cause differentiates between
> @@ -97,7 +96,8 @@ SYM_CODE_START(handle_exception)
>  	bge s4, zero, 1f
>  
>  	/* Handle interrupts */
> -	tail do_irq
> +	call do_irq
> +	j ret_from_exception
>  1:
>  	/* Handle other exceptions */
>  	slli t0, s4, RISCV_LGPTR
> @@ -105,11 +105,14 @@ SYM_CODE_START(handle_exception)
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
> +2:	jalr t1
> +	j ret_from_exception
> +3:
> +
> +	la t1, do_trap_unknown
> +	j 2b
>  SYM_CODE_END(handle_exception)
>  ASM_NOKPROBE(handle_exception)
>  
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 528ec7cc9a62..5eb3d135b717 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -16,7 +16,7 @@
>  
>  #ifdef CONFIG_FRAME_POINTER
>  
> -extern asmlinkage void ret_from_exception(void);
> +extern asmlinkage void handle_exception(void);
>  
>  static inline int fp_is_valid(unsigned long fp, unsigned long sp)
>  {
> @@ -70,7 +70,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			fp = frame->fp;
>  			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
>  						   &frame->ra);
> -			if (pc == (unsigned long)ret_from_exception) {
> +			if (pc == (unsigned long)handle_exception) {
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

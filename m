Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89675C47088
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=we7JUF/cFmLRelYtLBHDFeajqOtAZuUEJCV7dyS+3RU=; b=Sr1LlrgI3MZnmg
	cR9guCgwA6HLFx+hoj2thvMkjGc4i616TdNa6FxuG2yi357yGG7hoLm85T5PQyyEBA1BYYk4xqlc/
	hkUHVbry6sUN7TsESDOaQBRLqkBtHNKmOIaQSF/eHaK6Zea+3G+WgQ/mzl/hS0khJSFGc6lv+F+I0
	er3NLB9kZjPtxkDzEYOw7UotQUNh3QYtNY4KtUtIu3M/wpbQwYCLWDw3ps5QFYwNRNk2WMwbbdenz
	toQ6idr6jmF/nCtfT2fT25F8HbD8qvOoWsuKQcCStUa1XaJQ/HXzVwBFvNAQ24805Rr3IXm7STcMt
	8+pngsCBzE85asPH+vYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mTc-008ZfX-RJ; Thu, 01 Dec 2022 16:31:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mTa-008Zca-57
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:31:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2447AB81F8B;
	Thu,  1 Dec 2022 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C491C433C1;
	Thu,  1 Dec 2022 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669912309;
	bh=d2Jl/HzZ3cLunjfqczW81B/ARLzmlgq+fe3WizaptYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPQQHIu6HSPXnXx/X0EOrt8jWH0GSCTDEfAB+V/QrFJmzcy2qPp7VwQozOnBxn8+Y
	 8oSoev4dJE4sdMU7zkLBtqmE+tAA1CXaw50/mJjmIfmPJp1OqfdN5ix/K/kHXizG+m
	 RIKm9cXSghKS5FnbVOqwdw2rlkb1E8uKNnNxJkxKjohmCr1OFPFTdpafPKLlZE3jWj
	 u6oUl4DYSh19YGRvB6PUmOzFVFyoKGIeZYOEi3fEGNDy4KsXhQ6zYq22qqYxJF6+VX
	 mBA04NX0NP61E83hUFCgNv2223N6+yJg4ot0u4fCaeedU65UpTpCBQjtykdVsKE+05
	 DHYExtHSggaQQ==
Date: Fri, 2 Dec 2022 00:21:55 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: Add some comments about the shadow and
 overflow stacks
Message-ID: <Y4jUo09vh7PudmXW@xhacker>
References: <20221130023515.20217-1-palmer@rivosinc.com>
 <20221130023515.20217-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130023515.20217-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_083154_378851_E7B92A8C 
X-CRM114-Status: GOOD (  20.20  )
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

On Tue, Nov 29, 2022 at 06:35:15PM -0800, Palmer Dabbelt wrote:
> It took me a while to page all this back in when trying to review the
> recent spin_shadow_stack, so I figured I'd just write up some comments.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/kernel/traps.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index acdfcacd7e57..336d4aadadb1 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -200,18 +200,18 @@ void __init trap_init(void)
>  }
>  
>  #ifdef CONFIG_VMAP_STACK
> +/*
> + * Extra stack space that allows us to provide panic messages when the kernel
> + * has overflowed its stack.
> + */
>  static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>  		overflow_stack)__aligned(16);
>  /*
> - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> - * to get per-cpu overflow stack(get_overflow_stack).
> + * A temporary stack for use by handle_kernel_stack_overflow.  This is used so
> + * we can call into C code to get the per-hart overflow stack.  Usage of this
> + * stack must be protected by spin_shadow_stack.
>   */
>  long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
> -asmlinkage unsigned long get_overflow_stack(void)
> -{
> -	return (unsigned long)this_cpu_ptr(overflow_stack) +
> -		OVERFLOW_STACK_SIZE;
> -}
>  
>  /*
>   * A pseudo spinlock to protect the shadow stack from being used by multiple
> @@ -222,6 +222,12 @@ asmlinkage unsigned long get_overflow_stack(void)
>   */
>  unsigned long spin_shadow_stack;
>  
> +asmlinkage unsigned long get_overflow_stack(void)
> +{
> +	return (unsigned long)this_cpu_ptr(overflow_stack) +
> +		OVERFLOW_STACK_SIZE;
> +}
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>  	unsigned long tsk_stk = (unsigned long)current->stack;
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

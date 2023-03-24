Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65AAC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh91F9shis47Ja8GXwNTJKjQ0lDMJcwkG00KQD32WCA=; b=wYUy6FNZxlU/dk
	zlSuPn3GSOYKTVjYYZEj3D90NXxUmNfQsHQwRxlwn8/9Irxhd7s+o9BuNjIeayx4F58P6NGB/y+Ca
	r2SHo5MotxUxRlDMYeD+SipCyNZ+owOFD39lRp6NO1QOkWsm/A6TZVUgk9S7SC7oTt/7mG7sJDH9m
	fBj2a3b63V78N4yzvwYKcAIAqLhv3jtv33YXRwGOO0L3mka6SpMOH2F9yEMPOcy1wu5Qla63KveMb
	+YKisZMH47AlqVLOd6lW/0jSZuZZ1Eca609+zQT/3WaVUFC5Kd1qaSysW4zZrtgFHJMz8FRsjKm0F
	zLCPNyMo33rMOb8ek68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgzs-004QVQ-1o;
	Fri, 24 Mar 2023 12:58:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgzo-004QTX-0q;
	Fri, 24 Mar 2023 12:58:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B64711FB;
	Fri, 24 Mar 2023 05:58:56 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.56.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BC043F766;
	Fri, 24 Mar 2023 05:58:07 -0700 (PDT)
Date: Fri, 24 Mar 2023 12:57:18 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	chenhuacai@kernel.org, zhangqing@loongson.cn, kernel@xen0n.name,
	mingo@redhat.com, peterz@infradead.org, xiehuan09@gmail.com,
	dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
	dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/8] arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <ZB2eLsD4aoR3LEOV@FVFF77S0Q05N>
References: <20230324123731.3801920-1-pengdonglin@sangfor.com.cn>
 <20230324123731.3801920-5-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324123731.3801920-5-pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_055816_399472_B2BFC963 
X-CRM114-Status: GOOD (  22.45  )
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

On Fri, Mar 24, 2023 at 05:37:27AM -0700, Donglin Peng wrote:
> The commit d4815c5d1bbd ("function_graph: Support recording and
> printing the return value of function") laid the groundwork for the
> for the funcgraph-retval, and this modification makes it available
> on the ARM64 platform.
> 
> We introduce a new structure called fgraph_ret_regs for the ARM64
> platform to hold return registers and the frame pointer. We then
> fill its content in the return_to_handler and pass its address to
> the function ftrace_return_to_handler to record the return value.

I'm happy with this, or with using ftrace_regs and capturing more regs here.

This overall looks good, but there's one functional issue and a couple of minor
nits which I've detailed below.

> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/include/asm/ftrace.h  | 23 +++++++++++++++++++++++
>  arch/arm64/kernel/entry-ftrace.S |  9 +++++----
>  3 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1023e896d46b..48856d230800 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -195,6 +195,7 @@ config ARM64
>  	select HAVE_FTRACE_MCOUNT_RECORD
>  	select HAVE_FUNCTION_TRACER
>  	select HAVE_FUNCTION_ERROR_INJECTION
> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index 1c2672bbbf37..f68dcc41be3b 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -170,4 +170,27 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
>  }
>  #endif /* ifndef __ASSEMBLY__ */
>  
> +#ifndef __ASSEMBLY__
> +
> +#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> +struct fgraph_ret_regs {
> +	/* x0 - x7 */
> +	u64 regs[8];
> +
> +	u64 fp;
> +};

As a minor nit, for ftrace_regs we used `unsigned long` rather than `u64`;
could we do the same here for consistency?

This will need to be padded to 16 bytes, as within the kernel, arm64 requires
the SP to be aligned to 16 bytes at all time. Please can you add an `__unused`
field, like we have in ftrace_regs, to ensure that?

> +
> +static inline unsigned long fgraph_ret_regs_return_value(struct fgraph_ret_regs *ret_regs)
> +{
> +	return ret_regs->regs[0];
> +}
> +
> +static inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph_ret_regs *ret_regs)
> +{
> +	return ret_regs->fp;
> +}
> +#endif
> +
> +#endif
> +
>  #endif /* __ASM_FTRACE_H */
> diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
> index 350ed81324ac..8ac6f952e68f 100644
> --- a/arch/arm64/kernel/entry-ftrace.S
> +++ b/arch/arm64/kernel/entry-ftrace.S
> @@ -270,14 +270,15 @@ SYM_FUNC_END(ftrace_stub_graph)
>   */
>  SYM_CODE_START(return_to_handler)
>  	/* save return value regs */
> -	sub sp, sp, #64
> +	sub sp, sp, #72
>  	stp x0, x1, [sp]
>  	stp x2, x3, [sp, #16]
>  	stp x4, x5, [sp, #32]
>  	stp x6, x7, [sp, #48]
> +	str x29,    [sp, #64]		//     parent's fp

As above, this will need to be padded to keep the stack aligned to 16 bytes,
and I'd prefer if we could use asm-offsets so that we can have something like:

	sub	sp, sp, #FRET_REGS_SIZE
	stp	x0, x1, [sp, #FRET_REGS_X0]
	stp	x2, x3, [sp, #FRET_REGS_X2]
	stp	x4, x5, [sp, #FRET_REGS_X4]
	stp	x6, x7, [sp, #FRET_REGS_X6]
	str	x29, [sp, FRET_REGS_FP]

>  
> -	mov	x0, x29			//     parent's fp
> -	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(fp);
> +	mov	x0, sp
> +	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(regs);
>  	mov	x30, x0			// restore the original return address
>  
>  	/* restore return value regs */
> @@ -285,7 +286,7 @@ SYM_CODE_START(return_to_handler)
>  	ldp x2, x3, [sp, #16]
>  	ldp x4, x5, [sp, #32]
>  	ldp x6, x7, [sp, #48]
> -	add sp, sp, #64
> +	add sp, sp, #72

Likewise here.

Other than that, this looks good to me, thanks for respinning!

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

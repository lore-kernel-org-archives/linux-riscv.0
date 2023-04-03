Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21CAC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1V+YRrQkHq1S4Ix4INSeJkBSABnmGLCzrWu8F8tqOs=; b=s9ux/kKFhfSc0s
	qB3qItwpt1A5bZKeRfyagdU2Bf2igJw5IFPjb3eHy8VgzHGFP+94Cv3hfWEXoLhk69AP+S7sHJl5p
	tHOCtb9HZU73H4PhKVcXUx+UBustkFm+XQI9OfZPRneUvvJdjOhAdLxnOh/E5f4rb6SyJ4Ot8Un8q
	kRBlM42j9fMLSdkbTTEnwanNeAEyxy7wTMb4DmBAl6600CUw2uxhq1xvdyJbQ/17iBw+95fGmHA4b
	iwfIbL4upSG2Ct7o4EkhN3uPLINfxFOG7nPHacIvNaH5TEuMmeH2DpiK0sJ/qeyArMnEH//4flGwh
	82tqft9xlxUJjrCFz/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFJv-00EUBg-06;
	Mon, 03 Apr 2023 08:13:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFJr-00EUAN-1J;
	Mon, 03 Apr 2023 08:13:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43786FEC;
	Mon,  3 Apr 2023 01:14:21 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.57.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44A603F6C4;
	Mon,  3 Apr 2023 01:13:26 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:13:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	will@kernel.org, catalin.marinas@arm.com,
	rmk+kernel@armlinux.org.uk, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, bp@alien8.de,
	hpa@zytor.com, chenhuacai@kernel.org, zhangqing@loongson.cn,
	kernel@xen0n.name, mingo@redhat.com, peterz@infradead.org,
	xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/8] arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <ZCqKoPrqoKwSVsY7@FVFF77S0Q05N>
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
 <8f75bbf69eb49afb8e14b10dad6e091c43cff4e2.1680265828.git.pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f75bbf69eb49afb8e14b10dad6e091c43cff4e2.1680265828.git.pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_011339_537993_4D8DA3EA 
X-CRM114-Status: GOOD (  25.10  )
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

On Fri, Mar 31, 2023 at 05:47:40AM -0700, Donglin Peng wrote:
> The previous patch ("function_graph: Support recording and printing
> the return value of function") has laid the groundwork for the for
> the funcgraph-retval, and this modification makes it available on
> the ARM64 platform.
> 
> We introduce a new structure called fgraph_ret_regs for the ARM64
> platform to hold return registers and the frame pointer. We then
> fill its content in the return_to_handler and pass its address to
> the function ftrace_return_to_handler to record the return value.
> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>

Thanks for working through all the feedback!

The structual changes all look good to me, and I've given this a spin to check
that it doesn't break graph tracing, so:

Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> v10:
>  - Use CONFIG_FUNCTION_GRAPH_TRACER to control fgraph_ret_regs definition
> 
> v9:
>  - Update the commit message
> 
> v8:
>  - Fix issues in ARM64 asm code
>  - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/include/asm/ftrace.h  | 22 ++++++++++++++++++++++
>  arch/arm64/kernel/asm-offsets.c  | 13 +++++++++++++
>  arch/arm64/kernel/entry-ftrace.S | 27 ++++++++++++++-------------
>  4 files changed, 50 insertions(+), 13 deletions(-)
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
> index 1c2672bbbf37..657adcbd80a4 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -170,4 +170,26 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
>  }
>  #endif /* ifndef __ASSEMBLY__ */
>  
> +#ifndef __ASSEMBLY__
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> +struct fgraph_ret_regs {
> +	/* x0 - x7 */
> +	unsigned long regs[8];
> +
> +	unsigned long fp;
> +	unsigned long __unused;
> +};
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
> +#endif /* ifdef CONFIG_FUNCTION_GRAPH_TRACER  */
> +#endif
> +
>  #endif /* __ASM_FTRACE_H */
> diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
> index ae345b06e9f7..75082e0409bf 100644
> --- a/arch/arm64/kernel/asm-offsets.c
> +++ b/arch/arm64/kernel/asm-offsets.c
> @@ -197,6 +197,19 @@ int main(void)
>  #endif
>  #ifdef CONFIG_FUNCTION_TRACER
>    DEFINE(FTRACE_OPS_FUNC,		offsetof(struct ftrace_ops, func));
> +#endif
> +  BLANK();
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> +  DEFINE(FGRET_REGS_X0,			offsetof(struct fgraph_ret_regs, regs[0]));
> +  DEFINE(FGRET_REGS_X1,			offsetof(struct fgraph_ret_regs, regs[1]));
> +  DEFINE(FGRET_REGS_X2,			offsetof(struct fgraph_ret_regs, regs[2]));
> +  DEFINE(FGRET_REGS_X3,			offsetof(struct fgraph_ret_regs, regs[3]));
> +  DEFINE(FGRET_REGS_X4,			offsetof(struct fgraph_ret_regs, regs[4]));
> +  DEFINE(FGRET_REGS_X5,			offsetof(struct fgraph_ret_regs, regs[5]));
> +  DEFINE(FGRET_REGS_X6,			offsetof(struct fgraph_ret_regs, regs[6]));
> +  DEFINE(FGRET_REGS_X7,			offsetof(struct fgraph_ret_regs, regs[7]));
> +  DEFINE(FGRET_REGS_FP,			offsetof(struct fgraph_ret_regs, fp));
> +  DEFINE(FGRET_REGS_SIZE,		sizeof(struct fgraph_ret_regs));
>  #endif
>    return 0;
>  }
> diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
> index 350ed81324ac..da1443bcf776 100644
> --- a/arch/arm64/kernel/entry-ftrace.S
> +++ b/arch/arm64/kernel/entry-ftrace.S
> @@ -270,22 +270,23 @@ SYM_FUNC_END(ftrace_stub_graph)
>   */
>  SYM_CODE_START(return_to_handler)
>  	/* save return value regs */
> -	sub sp, sp, #64
> -	stp x0, x1, [sp]
> -	stp x2, x3, [sp, #16]
> -	stp x4, x5, [sp, #32]
> -	stp x6, x7, [sp, #48]
> +	sub sp, sp, #FGRET_REGS_SIZE
> +	stp x0, x1, [sp, #FGRET_REGS_X0]
> +	stp x2, x3, [sp, #FGRET_REGS_X2]
> +	stp x4, x5, [sp, #FGRET_REGS_X4]
> +	stp x6, x7, [sp, #FGRET_REGS_X6]
> +	str x29,    [sp, #FGRET_REGS_FP]	// parent's fp
>  
> -	mov	x0, x29			//     parent's fp
> -	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(fp);
> -	mov	x30, x0			// restore the original return address
> +	mov	x0, sp
> +	bl	ftrace_return_to_handler	// addr = ftrace_return_to_hander(regs);
> +	mov	x30, x0				// restore the original return address
>  
>  	/* restore return value regs */
> -	ldp x0, x1, [sp]
> -	ldp x2, x3, [sp, #16]
> -	ldp x4, x5, [sp, #32]
> -	ldp x6, x7, [sp, #48]
> -	add sp, sp, #64
> +	ldp x0, x1, [sp, #FGRET_REGS_X0]
> +	ldp x2, x3, [sp, #FGRET_REGS_X2]
> +	ldp x4, x5, [sp, #FGRET_REGS_X4]
> +	ldp x6, x7, [sp, #FGRET_REGS_X6]
> +	add sp, sp, #FGRET_REGS_SIZE
>  
>  	ret
>  SYM_CODE_END(return_to_handler)
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

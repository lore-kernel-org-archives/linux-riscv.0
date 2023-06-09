Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F67C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 01:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tM//UyuCe84WIz7sogIqOTU1VyrfmXDtDxXB6iot1NM=; b=xf7TPyCKeQfwE/
	imc0F4BPBoK7eWwDkPn+wwb1cLhzJvId8L7NGk1rhTvFBCp+e7nka6g1wO9ywruqKXkK1duTtf9K+
	Hyv75UZJdW79t7XdjBmTBrxiI0iYxrIyl2QNLuEnmHr/kJPOLQOdaX4MzLejb3urHQJ1b3vwT7uAP
	h5J9lsdJsUbpSd5VjOwFcaLBK9HCOFvv3ujFj/VRTvCgE6Oy5HOZxvR/CJjAS8E2gNSwUPmV6nzxb
	lh7iWOpNRDLVWU53pkKzmDXudMaGTiDN3cF7NnL/Qqq8aoP0WAr8lNJIuL+wVPvEpASW1KcxDR7Ro
	gxTq5GhSE3C85PvQe4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ROn-00BFOa-1g;
	Fri, 09 Jun 2023 01:58:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ROj-00BFN0-2Y;
	Fri, 09 Jun 2023 01:58:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D254965189;
	Fri,  9 Jun 2023 01:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF6BC433EF;
	Fri,  9 Jun 2023 01:58:36 +0000 (UTC)
Date: Thu, 8 Jun 2023 21:58:34 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, rmk+kernel@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 bp@alien8.de, hpa@zytor.com, chenhuacai@kernel.org, zhangqing@loongson.cn,
 kernel@xen0n.name, mingo@redhat.com, peterz@infradead.org,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/8] riscv: ftrace: Enable
 HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <20230608215834.729cfda2@gandalf.local.home>
In-Reply-To: <a8d71b12259f90e7e63d0ea654fcac95b0232bbc.1680954589.git.pengdonglin@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
	<a8d71b12259f90e7e63d0ea654fcac95b0232bbc.1680954589.git.pengdonglin@sangfor.com.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_185841_907470_878B76E8 
X-CRM114-Status: GOOD (  25.95  )
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


Can I get an ack from a RISC-V maintainer?

-- Steve


On Sat,  8 Apr 2023 05:42:19 -0700
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> The previous patch ("function_graph: Support recording and printing
> the return value of function") has laid the groundwork for the for
> the funcgraph-retval, and this modification makes it available on
> the RISC-V platform.
> 
> We introduce a new structure called fgraph_ret_regs for the RISC-V
> platform to hold return registers and the frame pointer. We then
> fill its content in the return_to_handler and pass its address to
> the function ftrace_return_to_handler to record the return value.
> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
> ---
> v10:
>  - Use CONFIG_FUNCTION_GRAPH_TRACER to control fgraph_ret_regs definition
> 
> v9:
>  - Update the commit message
> 
> v8:
>  - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/ftrace.h | 21 +++++++++++++++++++++
>  arch/riscv/kernel/mcount.S      |  7 +------
>  3 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eb7f29a412f8..108538815309 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -139,6 +139,7 @@ config RISCV
>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>  
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index d47d87c2d7e3..740a979171e5 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -111,4 +111,25 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  
> +#ifndef __ASSEMBLY__
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> +struct fgraph_ret_regs {
> +	unsigned long a1;
> +	unsigned long a0;
> +	unsigned long s0;
> +	unsigned long ra;
> +};
> +
> +static inline unsigned long fgraph_ret_regs_return_value(struct fgraph_ret_regs *ret_regs)
> +{
> +	return ret_regs->a0;
> +}
> +
> +static inline unsigned long fgraph_ret_regs_frame_pointer(struct fgraph_ret_regs *ret_regs)
> +{
> +	return ret_regs->s0;
> +}
> +#endif /* ifdef CONFIG_FUNCTION_GRAPH_TRACER */
> +#endif
> +
>  #endif /* _ASM_RISCV_FTRACE_H */
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index 30102aadc4d7..8a6e5a9e842a 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -65,13 +65,8 @@ ENTRY(return_to_handler)
>   * So alternatively we check the *old* frame pointer position, that is, the
>   * value stored in -16(s0) on entry, and the s0 on return.
>   */
> -#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> -	mv	t6, s0
> -#endif
>  	SAVE_RET_ABI_STATE
> -#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> -	mv	a0, t6
> -#endif
> +	mv	a0, sp
>  	call	ftrace_return_to_handler
>  	mv	a2, a0
>  	RESTORE_RET_ABI_STATE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

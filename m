Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28797C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQBFnZM002t1MohOg2zvgONOidKMnHOt6H+DSD26wSM=; b=wIGsMfcwXaVtBF
	Kxui91DB/GPHnyZFuEWkgwFRywJLYOfOhOlZvmxikXluiVeIZOcQra4HQNWkRvWYmLIEG0jPyzLhR
	MzXc1HLR6ZEaNp0G+9tdnpwO9DrxVeKrxdtCBcVGRa1Co/o3kP77yugvq2bF7EeRvQUXCgf/ff7gb
	hD/ZKaDL8mwfyuKOTAE0G2Y3snZG75oPR9OFVtoTXWTBFMDQN6AlB/Xb6A9N7j+G8KgwpvSGNBDMu
	e+NQ69ktYPbk8eEbLmoP3oPTD8GAGhf9ZHgAImc2HirtEHmeCxwFSGLKHpiiI3xVO3VlmOGde5THG
	KRgsakRXSV0228CHgJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7jYZ-00EIRm-2c;
	Fri, 09 Jun 2023 21:22:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7jYW-00EIQ4-15;
	Fri, 09 Jun 2023 21:22:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD2EC65BBE;
	Fri,  9 Jun 2023 21:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3062CC433EF;
	Fri,  9 Jun 2023 21:21:56 +0000 (UTC)
Date: Fri, 9 Jun 2023 17:21:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com, rmk+kernel@armlinux.org.uk, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, bp@alien8.de, hpa@zytor.com,
 chenhuacai@kernel.org, zhangqing@loongson.cn, kernel@xen0n.name,
 mingo@redhat.com, peterz@infradead.org, xiehuan09@gmail.com,
 dinghui@sangfor.com.cn, huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/8] ARM: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <20230609172153.73b0ef9d@gandalf.local.home>
In-Reply-To: <c61eb9290c3e817d4d70c429c0e987e3ec51a3c4.1680954589.git.pengdonglin@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
	<c61eb9290c3e817d4d70c429c0e987e3ec51a3c4.1680954589.git.pengdonglin@sangfor.com.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_142200_454127_11D6EF6B 
X-CRM114-Status: GOOD (  30.74  )
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


Hi Russell,

I noticed that this patch set only went to the linux-arm-kernel mailing
list but did not include you in the Cc.

Could you give an ack to this patch, and I can take it through my tree?

The full patch set went to linux-arm-kernel where I'm sure you have access
to.

Thanks!

-- Steve


On Sat,  8 Apr 2023 05:42:17 -0700
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> The previous patch ("function_graph: Support recording and printing
> the return value of function") has laid the groundwork for the for
> the funcgraph-retval, and this modification makes it available on
> the ARM platform.
> 
> We introduce a new structure called fgraph_ret_regs for the ARM platform
> to hold return registers and the frame pointer. We then fill its content
> in the return_to_handler and pass its address to the function
> ftrace_return_to_handler to record the return value.
> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
> ---
> v10:
>  - Use CONFIG_FUNCTION_GRAPH_TRACER to control fgraph_ret_regs definition
> 
> v9:
>  - Fix stack pointer align issues
>  - Update the commit message
> 
> v8:
>  - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> ---
>  arch/arm/Kconfig               |  1 +
>  arch/arm/include/asm/ftrace.h  | 22 ++++++++++++++++++++++
>  arch/arm/kernel/asm-offsets.c  |  8 +++++++-
>  arch/arm/kernel/entry-ftrace.S | 10 ++++++----
>  4 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index e24a9820e12f..73061379855a 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -98,6 +98,7 @@ config ARM
>  	select HAVE_FAST_GUP if ARM_LPAE
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_ERROR_INJECTION
> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
>  	select HAVE_GCC_PLUGINS
> diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
> index 7e9251ca29fe..3c457902b355 100644
> --- a/arch/arm/include/asm/ftrace.h
> +++ b/arch/arm/include/asm/ftrace.h
> @@ -77,4 +77,26 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
>  
>  #endif /* ifndef __ASSEMBLY__ */
>  
> +#ifndef __ASSEMBLY__
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> +struct fgraph_ret_regs {
> +	/* r0 - r3 */
> +	unsigned long regs[4];
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
> +#endif /* ifdef CONFIG_FUNCTION_GRAPH_TRACER */
> +#endif
> +
>  #endif /* _ASM_ARM_FTRACE */
> diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
> index 38121c59cbc2..18bb85115b21 100644
> --- a/arch/arm/kernel/asm-offsets.c
> +++ b/arch/arm/kernel/asm-offsets.c
> @@ -23,6 +23,7 @@
>  #include <asm/suspend.h>
>  #include <asm/vdso_datapage.h>
>  #include <asm/hardware/cache-l2x0.h>
> +#include <asm/ftrace.h>
>  #include <linux/kbuild.h>
>  #include <linux/arm-smccc.h>
>  #include "signal.h"
> @@ -170,5 +171,10 @@ int main(void)
>    DEFINE(KEXEC_INDIR_PAGE,	offsetof(struct kexec_relocate_data, kexec_indirection_page));
>    DEFINE(KEXEC_MACH_TYPE,	offsetof(struct kexec_relocate_data, kexec_mach_type));
>    DEFINE(KEXEC_R2,		offsetof(struct kexec_relocate_data, kexec_r2));
> -  return 0; 
> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
> +  BLANK();
> +  DEFINE(FGRET_REGS_SIZE,	sizeof(struct fgraph_ret_regs));
> +  BLANK();
> +#endif
> +  return 0;
>  }
> diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
> index 3e7bcaca5e07..d41a1676608c 100644
> --- a/arch/arm/kernel/entry-ftrace.S
> +++ b/arch/arm/kernel/entry-ftrace.S
> @@ -257,11 +257,13 @@ ENDPROC(ftrace_graph_regs_caller)
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  ENTRY(return_to_handler)
> -	stmdb	sp!, {r0-r3}
> -	add	r0, sp, #16		@ sp at exit of instrumented routine
> +	mov	ip, sp				@ sp at exit of instrumented routine
> +	stmdb	sp!, {r0-r3, ip, lr}		@ fill fgraph_ret_regs
> +	mov	r0, sp
>  	bl	ftrace_return_to_handler
> -	mov	lr, r0			@ r0 has real ret addr
> -	ldmia	sp!, {r0-r3}
> +	mov	lr, r0				@ r0 has real ret addr
> +	ldmia	sp, {r0-r3}
> +	add	sp, sp, #FGRET_REGS_SIZE	@ restore stack pointer
>  	ret	lr
>  ENDPROC(return_to_handler)
>  #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74150CDB47E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Oct 2023 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjX4Cm+y5Z4HFtyXq1Uyj54gNxj7MGQVntB/JhUlAmM=; b=vj2aBJETZp36B+
	+g7MEcqiNili6SHihwhiGPqveulBrgPCR3pRtGXbPytg3eor4jJzl2LUcXbpJMPZRs6rxNkbTjw0c
	xfVgATSzfeWo6ll0URlkt+pAH6IhPb9I7OJgUD64sIEnNVVF3YlO7FKEHog9pj20RKmMCKAkeglFw
	/ISEUysGH88Z3dUi1RfAoK5yAVzfpQkAPwH58M6vVleJ2j3BYF5RcgFiH8WH2giJJP1TEA2JaiH3k
	cBRz3GMucRuciI2ErWOCwUY3oKYx5WMsALZk4Pp1ZcPeQgluAK0/Ponq7gQWALhwQOAW7BbA5tPws
	/7H/Rk39UQW5lpTh8n4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs1u5-007JRP-1I;
	Sun, 15 Oct 2023 14:15:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs1u1-007JQK-27
	for linux-riscv@lists.infradead.org;
	Sun, 15 Oct 2023 14:15:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5BED60B25;
	Sun, 15 Oct 2023 14:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4915C433C8;
	Sun, 15 Oct 2023 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697379328;
	bh=NaXfphS/Zcd+l913uaP1A96Tr5idfnErwwX2N84AFEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tEYUuYLTrq6Z/v3TDiLLPUrehqlQo+2odlPMHxp4ylZWKM/03hK1C++7y1FdKJc/9
	 qzxhwN3JNMIlO0CZ3o+Yiqn9YflWwLHAhpMC1nD6CeUriyOVqpbsRsfiX2P8DKoSyk
	 h9EH6CyqzW3eo3LTbc6BuU6REcsUN4LcbSIQ/csn4WNiRUfY2JmOnlVxGZd/O1hY/d
	 9Iu4OYdWP98dfedgsgNqon/wGGGniYXdkGKJHBaO3RZzdgQkfB5vfvYt+1Av1nGOv7
	 ltBS0Dc4ze97aFuH/vKM1YzCnMPbAj0JpUR/4juHLbl8NEn+arMTJ9aGqE4ruL1A2b
	 zdzZglGP9IDZA==
Date: Sun, 15 Oct 2023 23:15:23 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmerdabbelt@google.com>, Guo Ren
 <guoren@linux.alibaba.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: Fix to pass correct ftrace_regs to
 ftrace_func_t functions
Message-Id: <20231015231523.901bee54f885a7bb72e1f021@kernel.org>
In-Reply-To: <169625103396.278295.15281009481727023114.stgit@devnote2>
References: <169625103396.278295.15281009481727023114.stgit@devnote2>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_071533_806703_144FE627 
X-CRM114-Status: GOOD (  17.55  )
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

Hi,

Gentry ping.

I think this should be an important fix because if a fprobe handler without
FTRACE_OPS_FL_SAVE_REGS tries to access any register via ftrace_regs, that
will get a wrong value.

Thank you,

On Mon,  2 Oct 2023 21:50:34 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Since ftrace_func_t requires to pass 'struct ftrace_regs *' as the 4th
> argument even if FTRACE_OPS_FL_SAVE_REGS is not set, ftrace_caller must
> pass 'struct ftrace_regs *', which is a partial pt_regs, on the stack
> to the ftrace_func_t functions, so that the ftrace_func_t functions can
> access some partial registers.
> 
> Fix to allocate 'struct ftrace_regs' (which has the same size of 'struct
> pt_regs') on the stack and save partial (argument) registers on it
> instead of reduced size custom data structure.
> 
> Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  arch/riscv/kernel/mcount-dyn.S |   65 +++++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index 669b8697aa38..84963680eff4 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -14,46 +14,37 @@
>  	.text
>  
>  #define FENTRY_RA_OFFSET	8
> -#define ABI_SIZE_ON_STACK	80
> -#define ABI_A0			0
> -#define ABI_A1			8
> -#define ABI_A2			16
> -#define ABI_A3			24
> -#define ABI_A4			32
> -#define ABI_A5			40
> -#define ABI_A6			48
> -#define ABI_A7			56
> -#define ABI_T0			64
> -#define ABI_RA			72
>  
>  	.macro SAVE_ABI
> -	addi	sp, sp, -ABI_SIZE_ON_STACK
> -
> -	REG_S	a0, ABI_A0(sp)
> -	REG_S	a1, ABI_A1(sp)
> -	REG_S	a2, ABI_A2(sp)
> -	REG_S	a3, ABI_A3(sp)
> -	REG_S	a4, ABI_A4(sp)
> -	REG_S	a5, ABI_A5(sp)
> -	REG_S	a6, ABI_A6(sp)
> -	REG_S	a7, ABI_A7(sp)
> -	REG_S	t0, ABI_T0(sp)
> -	REG_S	ra, ABI_RA(sp)
> +	addi	sp, sp, -PT_SIZE_ON_STACK
> +
> +	/* Save t0 as epc for ftrace_regs_get_instruction_pointer() */
> +	REG_S	t0, PT_EPC(sp)
> +	REG_S	a0, PT_A0(sp)
> +	REG_S	a1, PT_A1(sp)
> +	REG_S	a2, PT_A2(sp)
> +	REG_S	a3, PT_A3(sp)
> +	REG_S	a4, PT_A4(sp)
> +	REG_S	a5, PT_A5(sp)
> +	REG_S	a6, PT_A6(sp)
> +	REG_S	a7, PT_A7(sp)
> +	REG_S	t0, PT_T0(sp)
> +	REG_S	ra, PT_RA(sp)
>  	.endm
>  
>  	.macro RESTORE_ABI
> -	REG_L	a0, ABI_A0(sp)
> -	REG_L	a1, ABI_A1(sp)
> -	REG_L	a2, ABI_A2(sp)
> -	REG_L	a3, ABI_A3(sp)
> -	REG_L	a4, ABI_A4(sp)
> -	REG_L	a5, ABI_A5(sp)
> -	REG_L	a6, ABI_A6(sp)
> -	REG_L	a7, ABI_A7(sp)
> -	REG_L	t0, ABI_T0(sp)
> -	REG_L	ra, ABI_RA(sp)
> -
> -	addi	sp, sp, ABI_SIZE_ON_STACK
> +	REG_L	a0, PT_A0(sp)
> +	REG_L	a1, PT_A1(sp)
> +	REG_L	a2, PT_A2(sp)
> +	REG_L	a3, PT_A3(sp)
> +	REG_L	a4, PT_A4(sp)
> +	REG_L	a5, PT_A5(sp)
> +	REG_L	a6, PT_A6(sp)
> +	REG_L	a7, PT_A7(sp)
> +	REG_L	t0, PT_T0(sp)
> +	REG_L	ra, PT_RA(sp)
> +
> +	addi	sp, sp, PT_SIZE_ON_STACK
>  	.endm
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> @@ -96,8 +87,8 @@ ftrace_call:
>  	call	ftrace_stub
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> -	addi	a0, sp, ABI_RA
> -	REG_L	a1, ABI_T0(sp)
> +	addi	a0, sp, PT_RA
> +	REG_L	a1, PT_T0(sp)
>  	addi	a1, a1, -FENTRY_RA_OFFSET
>  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
>  	mv	a2, s0
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

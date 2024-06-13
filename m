Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFA1C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 22:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2F3UREbsDi2paUeHKIksGaE+aSmhY0UGeJ72aLa0DY=; b=FHPZtHW8REXEWT
	tSZBVIVYeFBkyKwvle0pAFBBcKs0pVlUbPeTvhpq6yupWCu1vl1KwXbj8YmcqH5SZ8C04UJRfCTIJ
	+tYPjGH31CDO+j6V9SNrWxgpHyKCCUqsTJUvmsuiRwisBwpTS+3mcRRamVKBodYouw1F1C7uTZftS
	v/LEvmolz8rSXLe/0XiIl4xOre4uPrsTyTrcaVeAbNNvpmbftqRLnzKX3lRHwavsRqhx4tiIi/l54
	P2PaQrrz01HVMNE+noUB8nVdWe/QRKCf/pytfe7zM5DamaC6lsoZs2bQGPq8kEN0QPoM0g7ANf7a4
	/q+k6PaFjTqd3sn2gAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHt3O-00000000g24-3Sfn;
	Thu, 13 Jun 2024 22:36:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHt3L-00000000g1B-37O8
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 22:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 799A561DD2;
	Thu, 13 Jun 2024 22:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3894BC32786;
	Thu, 13 Jun 2024 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718318178;
	bh=wL06T1k2B8Q2rL32NqzllZw15uOhghb5OR6zN4NYrfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNzn+PCHszOklsBLsMSUobxEOt3oNA31VuDs0RoPQzosJ5FKK4ZZpIUgZvpeLy0Ys
	 ZcnN3hmYy2Et0hsuuT7G67TJ4asf17PqyfivrljLeTL/7sbh/RvGLABbvGbZMLoJqz
	 xu485Bb1Lx1Vd29xTjkzPXPGV0+7rvANw6oDJIi2Pt+mRZ9cCfxMfnI6Ph7qnmymx3
	 hYltskgyvOGG2fxulkPoaxbcwPeKj5k3qWwWlGgnF8TbL8+KIagy8O2AKaf3C4Kwzg
	 p+0A1IYbrvnDSRCtba5fIGMz4WOiHodY7XQ0tN7C3b7yH7t0aVrU98QV5BpB/ekqj/
	 oHLy4+BBqawag==
Date: Thu, 13 Jun 2024 15:36:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Evgenii Shatokhin <e.shatokhin@yadro.com>
Subject: Re: [PATCH 3/8] riscv: ftrace: support fastcc in Clang for WITH_ARGS
Message-ID: <20240613223615.GA2739249@thelio-3990X>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-3-1a538e12c01e@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-3-1a538e12c01e@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_153619_987690_695E165F 
X-CRM114-Status: GOOD (  16.32  )
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

On Thu, Jun 13, 2024 at 03:11:08PM +0800, Andy Chiu wrote:
> Some caller-saved registers which are not defined as function arguments
> in the ABI can still be passed as arguments when the kernel is compiled
> with Clang. As a result, we must save and restore those registers to
> prevent ftrace from clobbering them.
> 
> - [1]: https://reviews.llvm.org/D68559
> Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
> Closes: https://lore.kernel.org/linux-riscv/7e7c7914-445d-426d-89a0-59a9199c45b1@yadro.com/
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/include/asm/ftrace.h |  7 +++++++
>  arch/riscv/kernel/asm-offsets.c |  7 +++++++
>  arch/riscv/kernel/mcount-dyn.S  | 16 ++++++++++++++--
>  3 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 9eb31a7ea0aa..5f81c53dbfd9 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -144,6 +144,13 @@ struct ftrace_regs {
>  			unsigned long a5;
>  			unsigned long a6;
>  			unsigned long a7;
> +#ifdef CONFIG_CC_IS_CLANG
> +			unsigned long t2;
> +			unsigned long t3;
> +			unsigned long t4;
> +			unsigned long t5;
> +			unsigned long t6;
> +#endif
>  		};
>  	};
>  };
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index b09ca5f944f7..db5a26fcc9ae 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -497,6 +497,13 @@ void asm_offsets(void)
>  	DEFINE(FREGS_SP,	    offsetof(struct ftrace_regs, sp));
>  	DEFINE(FREGS_S0,	    offsetof(struct ftrace_regs, s0));
>  	DEFINE(FREGS_T1,	    offsetof(struct ftrace_regs, t1));
> +#ifdef CONFIG_CC_IS_CLANG
> +	DEFINE(FREGS_T2,	    offsetof(struct ftrace_regs, t2));
> +	DEFINE(FREGS_T3,	    offsetof(struct ftrace_regs, t3));
> +	DEFINE(FREGS_T4,	    offsetof(struct ftrace_regs, t4));
> +	DEFINE(FREGS_T5,	    offsetof(struct ftrace_regs, t5));
> +	DEFINE(FREGS_T6,	    offsetof(struct ftrace_regs, t6));
> +#endif
>  	DEFINE(FREGS_A0,	    offsetof(struct ftrace_regs, a0));
>  	DEFINE(FREGS_A1,	    offsetof(struct ftrace_regs, a1));
>  	DEFINE(FREGS_A2,	    offsetof(struct ftrace_regs, a2));
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index 745dd4c4a69c..e988bd26b28b 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -96,7 +96,13 @@
>  	REG_S	x8,  FREGS_S0(sp)
>  #endif
>  	REG_S	x6,  FREGS_T1(sp)
> -
> +#ifdef CONFIG_CC_IS_CLANG
> +	REG_S	x7,  FREGS_T2(sp)
> +	REG_S	x28, FREGS_T3(sp)
> +	REG_S	x29, FREGS_T4(sp)
> +	REG_S	x30, FREGS_T5(sp)
> +	REG_S	x31, FREGS_T6(sp)
> +#endif
>  	// save the arguments
>  	REG_S	x10, FREGS_A0(sp)
>  	REG_S	x11, FREGS_A1(sp)
> @@ -115,7 +121,13 @@
>  	REG_L	x8, FREGS_S0(sp)
>  #endif
>  	REG_L	x6,  FREGS_T1(sp)
> -
> +#ifdef CONFIG_CC_IS_CLANG
> +	REG_L	x7,  FREGS_T2(sp)
> +	REG_L	x28, FREGS_T3(sp)
> +	REG_L	x29, FREGS_T4(sp)
> +	REG_L	x30, FREGS_T5(sp)
> +	REG_L	x31, FREGS_T6(sp)
> +#endif
>  	// restore the arguments
>  	REG_L	x10, FREGS_A0(sp)
>  	REG_L	x11, FREGS_A1(sp)
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

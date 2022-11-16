Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C837EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeytTU9cly6olVKTtV6X9djpbj7N1QO0u5wVuckHumk=; b=d45pACTahAyoYQ
	X3XAsfwl7Zyq/EJFrWqV0UVM+pfFnC4hjahylI5g3AsBi77/h+/AhI/M0KPG3rn5hElZXbafhEzSp
	APlCT4rD8RnAGmPD1eM19LDeTsGgrCd+78s2iZkl3trC+NNhL64WgabDKM9JmjW0L0YHtA+2wqr3Q
	VlRiyLK4xxnriJu/C/ZRDX4i96tIECVkfznTxabnDIfC6GTC9WcWAmoJVHeAU+ppRq+jrqmexWrOu
	fs+j1MTDD4IheKUZYUgMzmmANS3FE41Da+cz3hpqCu5ekq/7rvOfRnGpz1n1AJQIcc+OB1lLuFk3z
	JtpvjWMwl2fKO040ErhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovE3I-001J4a-Q2; Wed, 16 Nov 2022 08:45:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovE3G-001J0X-3J
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 08:45:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id n21so1605044ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 00:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEZ09dkupGOo3xXcLbSG5+c4w31xZYyKp2/9cbD0Y9A=;
        b=lDDFPoL6oHwy109XGi4/sz0M+BHdJSbE2zkOFdkJ5N3ENut10XegQf6XHb0M7eNjEh
         3nBCI4CypfugjLpQkIkO6araKQ4FbaodkJXEbEUPUaTh6jB8oHHNuimCXOHFoiePbD/5
         WaWP+8FSRgRDZBSRWP2ZV4evVo1eVMBrFSfVt8Dog/Ljx0HS2XJKFvkU0Hi6wfHRNZAa
         o6rWbugT/r/YIu7JnP8CTUbWgYpvO6TM7CkUNe6833wBHsIcNCn3KS/Y9rPHrZc8zKtS
         v5yMGBwX9A6ngtMprjkyf9QtqPgm5ciG4T1woWvpKCoJAp0zc+UmhXsj4UEvw1UJ/8LC
         5TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEZ09dkupGOo3xXcLbSG5+c4w31xZYyKp2/9cbD0Y9A=;
        b=ZZEtwFWE0qWjYeoKT8lYPN56WR2EMNCj0XJwnDO454e2l1BwuDs0sy0txWLnVjl18i
         s6unh3P5VnqcA/An7WiksWGbXV9YuXLmYMEGgeTQtMMkOvvxvc9VixinVS8LlbSy95af
         fOU15vEr2DZSvImRDAw9fBr4gufq+lVFq68GxiTxaBGuax3yKgPp13qbtNvTbpUAqhEu
         DgkhrIQGOBeHwPHtl/QnoGqWnl23nZ8kXq4vnjv34LcGXYlmYhmF+seynCwuVC1azGo8
         IXLtTRa5HJ0E+qVt///FmsPx+WFJlHtE2FXksVfTccktBE+0ggNqLozI+8PwRiTHQtcO
         Ccag==
X-Gm-Message-State: ANoB5plslU/H0Wlh6TQWjLbxHGG381FhCsZREMjT+zASU6aTM+0xlN/8
	/3zzmFrC4WtHKrMBViff+oqB1Q==
X-Google-Smtp-Source: AA0mqf6zGcBtNK1rK4xKOG0v95NApMPvWBjL6L4DGXBEWNMd8d5sVTR72FYbesN5H4lXaQmaZCUCkQ==
X-Received: by 2002:a17:906:344f:b0:79f:e0b3:3b99 with SMTP id d15-20020a170906344f00b0079fe0b33b99mr16745982ejb.381.1668588342285;
        Wed, 16 Nov 2022 00:45:42 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906585700b007317f017e64sm6572448ejs.134.2022.11.16.00.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 00:45:41 -0800 (PST)
Date: Wed, 16 Nov 2022 09:45:40 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: guoren@kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv/ftrace: SAVE_ALL supports lightweight save
Message-ID: <20221116084540.aslzynq4bmar6f46@kamzik>
References: <20221116031305.286634-1-suagrfillet@gmail.com>
 <20221116031305.286634-3-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116031305.286634-3-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_004546_194272_8D0EF3B4 
X-CRM114-Status: GOOD (  26.12  )
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

On Wed, Nov 16, 2022 at 11:13:04AM +0800, Song Shuai wrote:
> In order to make the function graph use ftrace directly, ftrace_caller
> should be adjusted to save the necessary regs against the pt_regs layout
> so it can call ftrace_graph_func reasonably.
> 
> SAVE_ALL now saves all the regs according to the pt_regs struct. Here
> introduces a lightweight option for SAVE_ALL to save only the necessary
> regs for ftrace_caller.
> 
> For convenience, the original argument setup for the tracing function in
> ftrace_[regs]_caller is killed and appended to the tail of SAVE_ALL.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/kernel/mcount-dyn.S | 110 +++++++++++++++++++++++++++------
>  1 file changed, 92 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index d171eca623b6..2f0a280bd7a0 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -56,7 +56,51 @@
>  	.endm
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> -	.macro SAVE_ALL
> +
> +/**
> +* SAVE_ALL - save regs against the pt_regs struct
> +*
> +* @all: tell if saving all the regs

I find it odd to have a macro name that includes 'ALL' in it
to require a parameter 'all' to be set in order to actually save
all. I suggest renaming the macro to something like SAVE_REGS.

> +*
> +* If all is set, all the regs will be saved, otherwise only ABI
> +* related regs (a0-a7,epc,ra and optional s0) will be saved.
> +*
> +* For convenience the argument setup for tracing function is appended here.
> +* Especially $sp is passed as the 4th argument of the tracing function.
> +*
> +* After the stack is established,
> +*
> +* 0(sp) stores the PC of the traced function which can be accessed
> +* by &(fregs)->regs->epc in tracing function. Note that the real
> +* function entry address should be computed with -FENTRY_RA_OFFSET.
> +*
> +* 8(sp) stores the function return address (i.e. parent IP) that
> +* can be accessed by &(fregs)->regs->ra in tracing function.
> +*
> +* The other regs are saved at the respective localtion and accessed
> +* by the respective pt_regs member.
> +*
> +* Here is the layout of stack for your reference.
> +*
> +*
> +*			=========
> +*			|  pip  |
> +* PT_SIZE_ON_STACK  ->  =========
> +*			+ ..... +
> +*			+ t3-t6 +
> +*			+ s2-s11+
> +*			+ a0-a7 + --++++-> ftrace_caller saved
> +*			+ s1    +   +
> +*			+ s0    + --+
> +*			+ t0-t2 +   +
> +*			+ tp    +   +
> +*			+ gp    +   +
> +*			+ sp    +   +
> +*			+ ra    + --+ // parent IP
> +*		sp  ->  + epc   + --+ // PC of the traced function
> +*			+++++++++
> +**/
> +	.macro SAVE_ALL, all=0
>  	addi	sp, sp, -SZREG
>  	addi	sp, sp, -PT_SIZE_ON_STACK
>  
> @@ -67,14 +111,8 @@
>  	REG_S x1,  PT_RA(sp)
>  	REG_L x1,  PT_EPC(sp)
>  
> -	REG_S x2,  PT_SP(sp)
> -	REG_S x3,  PT_GP(sp)
> -	REG_S x4,  PT_TP(sp)
> -	REG_S x5,  PT_T0(sp)
> -	REG_S x6,  PT_T1(sp)
> -	REG_S x7,  PT_T2(sp)
> -	REG_S x8,  PT_S0(sp)
> -	REG_S x9,  PT_S1(sp)
> +	/* always save the ABI regs */
> +
>  	REG_S x10, PT_A0(sp)
>  	REG_S x11, PT_A1(sp)
>  	REG_S x12, PT_A2(sp)
> @@ -83,6 +121,18 @@
>  	REG_S x15, PT_A5(sp)
>  	REG_S x16, PT_A6(sp)
>  	REG_S x17, PT_A7(sp)
> +
> +	/* save leftover regs for ftrace_regs_caller*/
> +
> +	.if \all == 1
> +	REG_S x2,  PT_SP(sp)
> +	REG_S x3,  PT_GP(sp)
> +	REG_S x4,  PT_TP(sp)
> +	REG_S x5,  PT_T0(sp)
> +	REG_S x6,  PT_T1(sp)
> +	REG_S x7,  PT_T2(sp)
> +	REG_S x8,  PT_S0(sp)
> +	REG_S x9,  PT_S1(sp)
>  	REG_S x18, PT_S2(sp)
>  	REG_S x19, PT_S3(sp)
>  	REG_S x20, PT_S4(sp)
> @@ -97,22 +147,31 @@
>  	REG_S x29, PT_T4(sp)
>  	REG_S x30, PT_T5(sp)
>  	REG_S x31, PT_T6(sp)
> +	.else
> +
> +	/* save s0 for ftrace_caller if FP_TEST defined */
> +
> +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> +	REG_S x8,  PT_S0(sp)
> +#endif
> +	.endif
> +
> +	/* setup 4 args for tracing functions  */
> +
> +	addi	a0, ra, -FENTRY_RA_OFFSET // ip
> +	la	a1, function_trace_op
> +	REG_L	a2, 0(a1)		// op
> +	REG_L	a1, PT_SIZE_ON_STACK(sp) // parent_ip
> +	mv	a3, sp			// fregs

Please line up the comments.

>  	.endm
>  
> -	.macro RESTORE_ALL
> +	.macro RESTORE_ALL, all=0
>  	REG_L x1,  PT_RA(sp)
>  	addi	sp, sp, PT_SIZE_ON_STACK
>  	REG_S x1,  (sp)
>  	addi	sp, sp, -PT_SIZE_ON_STACK
>  	REG_L x1,  PT_EPC(sp)
> -	REG_L x2,  PT_SP(sp)
> -	REG_L x3,  PT_GP(sp)
> -	REG_L x4,  PT_TP(sp)
> -	REG_L x5,  PT_T0(sp)
> -	REG_L x6,  PT_T1(sp)
> -	REG_L x7,  PT_T2(sp)
> -	REG_L x8,  PT_S0(sp)
> -	REG_L x9,  PT_S1(sp)
> +
>  	REG_L x10, PT_A0(sp)
>  	REG_L x11, PT_A1(sp)
>  	REG_L x12, PT_A2(sp)
> @@ -121,6 +180,16 @@
>  	REG_L x15, PT_A5(sp)
>  	REG_L x16, PT_A6(sp)
>  	REG_L x17, PT_A7(sp)
> +
> +	.if \all == 1
> +	REG_L x2,  PT_SP(sp)
> +	REG_L x3,  PT_GP(sp)
> +	REG_L x4,  PT_TP(sp)
> +	REG_L x5,  PT_T0(sp)
> +	REG_L x6,  PT_T1(sp)
> +	REG_L x7,  PT_T2(sp)
> +	REG_L x8,  PT_S0(sp)
> +	REG_L x9,  PT_S1(sp)
>  	REG_L x18, PT_S2(sp)
>  	REG_L x19, PT_S3(sp)
>  	REG_L x20, PT_S4(sp)
> @@ -136,6 +205,11 @@
>  	REG_L x30, PT_T5(sp)
>  	REG_L x31, PT_T6(sp)
>  
> +	.else
> +#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> +	REG_L x8,  PT_S0(sp)
> +#endif
> +	.endif
>  	addi	sp, sp, PT_SIZE_ON_STACK
>  	addi	sp, sp, SZREG
>  	.endm
> -- 
> 2.20.1
> 
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

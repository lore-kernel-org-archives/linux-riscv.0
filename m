Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1776BC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiMKYX4sZDxA1k3rvIrTUxwgy0eqRMuiWN72+TBMZnU=; b=K3X23UPi3SCRjt
	eD/qAXVUtBJvL8Gao+NCfJ/DKUt/MCFqQo+EuwSEjzcDnwo4cAtzDVahiH563YwvFZOh18yZCoIi2
	RvFO0dh70UWSSfswnL01YtcJkwoynB7O65eULneEQ/K9iJUKK5MGG65VfmkN5RHOFUV1ZB0fkicj5
	HwBdW2HUYxNmbaJqxQmLB05CXiLsFFKsoWGMESPolm2Ae/R6uT7paIeFS0H3n6o7CgHDoagaxUEn7
	ZT60rKPcfa/MwlT5poH8ZWfNr6hY5OeOmjDeJMtiQftIYnTmcSMATe6j8BYCSbyOd66I2pkbThqJb
	MIpFDH0T6c0pie7nhlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLokg-00000000K0N-2Z00;
	Mon, 24 Jun 2024 18:49:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLokd-00000000Jzt-1MTV
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 18:49:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70683d96d0eso899846b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 11:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719254954; x=1719859754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXv5fTLeV2l8Cjtpvu8snH7tYxk20NhHSNWHbcWNWfM=;
        b=o+EQTiKDSvsABrR1g51w5/Sx/QEMFiGIJvxJe/0dWsjZW0eqdyQ6vrDS/N8ACxih01
         2Hg34ITjc5DoSt0BiHKsoxz4c/BVZMipEzRgxjk5NrpE6V7pdEvXqj2zE53YWm6S3hTy
         pTBktX1rDDOu0XjV4X05u9ZeyT8Qo9Se+6HhAR5JaRDelHkfD8RQrK5ghJXA4pfQCj58
         jXjTYVZ57iRjjCg2gAiSBRiL5998505UYYAEfwoYAi+zZX+EHMC69g/vtTQevRWWNxYK
         tA8EYA5mg6yJ+Yl0E6BjxmE5a3qKszhfR8Q9xHnGnDV0cLL/6puN4Hopf4FPt39fNHgC
         QzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719254954; x=1719859754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXv5fTLeV2l8Cjtpvu8snH7tYxk20NhHSNWHbcWNWfM=;
        b=iR8LSpZH1CESWn6RpeAc2jPvPsR1FBxXDKnIr3/LP/EZ5FoXc0dd3t4Dp3lsrfioWM
         q2vqtnXugBqzhOUwTrDBXczs0Kr+OOyM1/VIhtSXZKPq0m5cvoO6qSok5x5LbKkYxZ2A
         EcON4tQvf+e/tcSBKhlSM2zaxDO5phL/X+79rWEtr/PGkKJISvwXBy0btHKKxgCszlb6
         JnqFHjEOeeUzrHP23YWKBotbv+qrKPu6YhxRWoTGSd4Qpc5SdqV0H+gl2qhFkNSm809i
         G08w2QVtNgEJJpB7J0OC3CgJqXIllFylj5St9a1o9ZStaIFD8SBHXeOTe+jYqSrkFFmT
         AtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsekC+TjRO/BH+hWuE2ESV4b+pnZdxmRGDLTNTkiuL7ZnhriqcnzyszIx12ov/aMNDpgZIbw5K/p3YTD1p2sftOcI0lJ3+Q7mFgTl3jE5e
X-Gm-Message-State: AOJu0YwGEJAfYlXsKMBfpoz89fRxXDpCKHG1J6aBK87E8J3lpfpNim5G
	Uumv74u43M/YQVfrh+dIFrWjhVRCL+c7tLaQRcti7A+oeZM/UmZp2EcKetDglmU=
X-Google-Smtp-Source: AGHT+IFAl4zjgOwZgfMgmlWaiUnJiW+uHfsZNX318jpNMNmDdLqbsP3JJ49XveytQZHiY1OLlhiZvA==
X-Received: by 2002:a05:6a20:4701:b0:1b4:772d:2892 with SMTP id adf61e73a8af0-1bcee7323b9mr5009947637.32.1719254954106;
        Mon, 24 Jun 2024 11:49:14 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5bf9sm66060955ad.122.2024.06.24.11.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 11:49:13 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:49:11 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anton Blanchard <antonb@tenstorrent.com>,
	Cyril Bur <cyrilbur@tenstorrent.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] riscv: convert bottom half of exception handling to C
Message-ID: <Znm/p4yw49e8ydW7@ghost>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616170553.2832-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_114915_521072_8CDDEA8A 
X-CRM114-Status: GOOD (  36.48  )
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

On Mon, Jun 17, 2024 at 01:05:50AM +0800, Jisheng Zhang wrote:
> For readability, maintainability and future scalability, convert the
> bottom half of the exception handling to C.

I would be interested to see the performance impact of this, since this
mostly eliminates the code from patch 1 and replaces it in C.
Anton/Cyril can you share the test case you used so that these changes
can also be benchmarked?

> 
> Mostly the assembly code is converted to C in a relatively
> straightforward manner.
> 
> However, there are two modifications I need to mention:
> 
> 1. the CSR_CAUSE reg reading and saving is moved to the C code
> because we need the cause to dispatch the exception handling,
> if we keep the cause reading and saving, we either pass it to
> do_traps() via. 2nd param or get it from pt_regs which an extra
> memory load is needed, I don't like any of the two solutions becase
> the exception handling sits in hot code path, every instruction
> matters.
> 
> 2.To cope with SIFIVE_CIP_453 errata, it looks like we don't need
> alternative mechanism any more after the asm->c convertion. Just
> replace the excp_vect_table two entries.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/errata/sifive/errata.c       | 25 ++++++++---
>  arch/riscv/include/asm/asm-prototypes.h |  1 +
>  arch/riscv/include/asm/errata_list.h    |  5 +--
>  arch/riscv/kernel/entry.S               | 58 +------------------------
>  arch/riscv/kernel/traps.c               | 41 +++++++++++++++++
>  5 files changed, 64 insertions(+), 66 deletions(-)
> 
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> index 716cfedad3a2..bbba99f207ca 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -10,9 +10,14 @@
>  #include <linux/bug.h>
>  #include <asm/patch.h>
>  #include <asm/alternative.h>
> +#include <asm/csr.h>
>  #include <asm/vendorid_list.h>
>  #include <asm/errata_list.h>
>  
> +extern void (*excp_vect_table[])(struct pt_regs *regs);
> +extern void sifive_cip_453_insn_fault_trp(struct pt_regs *regs);
> +extern void sifive_cip_453_page_fault_trp(struct pt_regs *regs);
> +
>  struct errata_info_t {
>  	char name[32];
>  	bool (*check_func)(unsigned long  arch_id, unsigned long impid);
> @@ -20,6 +25,9 @@ struct errata_info_t {
>  
>  static bool errata_cip_453_check_func(unsigned long  arch_id, unsigned long impid)
>  {
> +	if (!IS_ENABLED(CONFIG_ERRATA_SIFIVE_CIP_453))
> +		return false;
> +
>  	/*
>  	 * Affected cores:
>  	 * Architecture ID: 0x8000000000000007
> @@ -51,10 +59,6 @@ static bool errata_cip_1200_check_func(unsigned long  arch_id, unsigned long imp
>  }
>  
>  static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
> -	{
> -		.name = "cip-453",
> -		.check_func = errata_cip_453_check_func
> -	},
>  	{
>  		.name = "cip-1200",
>  		.check_func = errata_cip_1200_check_func
> @@ -62,11 +66,20 @@ static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
>  };
>  
>  static u32 __init_or_module sifive_errata_probe(unsigned long archid,
> -						unsigned long impid)
> +						unsigned long impid,
> +						unsigned int stage)
>  {
>  	int idx;
>  	u32 cpu_req_errata = 0;
>  
> +	if (stage == RISCV_ALTERNATIVES_BOOT) {
> +		if (IS_ENABLED(CONFIG_MMU) &&
> +		    errata_cip_453_check_func(archid, impid)) {
> +			excp_vect_table[EXC_INST_ACCESS] = sifive_cip_453_insn_fault_trp;
> +			excp_vect_table[EXC_INST_PAGE_FAULT] = sifive_cip_453_page_fault_trp;
> +		}
> +	}
> +
>  	for (idx = 0; idx < ERRATA_SIFIVE_NUMBER; idx++)
>  		if (errata_list[idx].check_func(archid, impid))
>  			cpu_req_errata |= (1U << idx);
> @@ -99,7 +112,7 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>  		return;
>  
> -	cpu_req_errata = sifive_errata_probe(archid, impid);
> +	cpu_req_errata = sifive_errata_probe(archid, impid, stage);
>  
>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != SIFIVE_VENDOR_ID)
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> index cd627ec289f1..81a1f27fa54f 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -55,5 +55,6 @@ DECLARE_DO_ERROR_INFO(do_trap_break);
>  asmlinkage void handle_bad_stack(struct pt_regs *regs);
>  asmlinkage void do_page_fault(struct pt_regs *regs);
>  asmlinkage void do_irq(struct pt_regs *regs);
> +asmlinkage void do_traps(struct pt_regs *regs);
>  
>  #endif /* _ASM_RISCV_PROTOTYPES_H */
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 7c8a71a526a3..95b79afc4061 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -17,9 +17,8 @@
>  #endif
>  
>  #ifdef CONFIG_ERRATA_SIFIVE
> -#define	ERRATA_SIFIVE_CIP_453 0
> -#define	ERRATA_SIFIVE_CIP_1200 1
> -#define	ERRATA_SIFIVE_NUMBER 2
> +#define	ERRATA_SIFIVE_CIP_1200 0
> +#define	ERRATA_SIFIVE_NUMBER 1
>  #endif
>  
>  #ifdef CONFIG_ERRATA_THEAD
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 81dec627a8d4..401bfe85a098 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -62,13 +62,11 @@ SYM_CODE_START(handle_exception)
>  	csrrc s1, CSR_STATUS, t0
>  	csrr s2, CSR_EPC
>  	csrr s3, CSR_TVAL
> -	csrr s4, CSR_CAUSE
>  	csrr s5, CSR_SCRATCH
>  	REG_S s0, PT_SP(sp)
>  	REG_S s1, PT_STATUS(sp)
>  	REG_S s2, PT_EPC(sp)
>  	REG_S s3, PT_BADADDR(sp)
> -	REG_S s4, PT_CAUSE(sp)
>  	REG_S s5, PT_TP(sp)
>  
>  	/*
> @@ -83,36 +81,9 @@ SYM_CODE_START(handle_exception)
>  	/* Load the kernel shadow call stack pointer if coming from userspace */
>  	scs_load_current_if_task_changed s5
>  
> -#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
> -	move a0, sp
> -	call riscv_v_context_nesting_start
> -#endif
>  	move a0, sp /* pt_regs */
> -
> -	/*
> -	 * MSB of cause differentiates between
> -	 * interrupts and exceptions
> -	 */
> -	bge s4, zero, 1f
> -
> -	/* Handle interrupts */
> -	call do_irq
> -	j ret_from_exception
> -1:
> -	/* Handle other exceptions */
> -	slli t0, s4, RISCV_LGPTR
> -	la t1, excp_vect_table
> -	la t2, excp_vect_table_end
> -	add t0, t1, t0
> -	/* Check if exception code lies within bounds */
> -	bgeu t0, t2, 3f
> -	REG_L t1, 0(t0)
> -2:	jalr t1
> +	call do_traps
>  	j ret_from_exception
> -3:
> -
> -	la t1, do_trap_unknown
> -	j 2b
>  SYM_CODE_END(handle_exception)
>  ASM_NOKPROBE(handle_exception)
>  
> @@ -329,33 +300,6 @@ SYM_FUNC_START(__switch_to)
>  	ret
>  SYM_FUNC_END(__switch_to)
>  
> -#ifndef CONFIG_MMU
> -#define do_page_fault do_trap_unknown
> -#endif
> -
> -	.section ".rodata"
> -	.align LGREG
> -	/* Exception vector table */
> -SYM_DATA_START_LOCAL(excp_vect_table)
> -	RISCV_PTR do_trap_insn_misaligned
> -	ALT_INSN_FAULT(RISCV_PTR do_trap_insn_fault)
> -	RISCV_PTR do_trap_insn_illegal
> -	RISCV_PTR do_trap_break
> -	RISCV_PTR do_trap_load_misaligned
> -	RISCV_PTR do_trap_load_fault
> -	RISCV_PTR do_trap_store_misaligned
> -	RISCV_PTR do_trap_store_fault
> -	RISCV_PTR do_trap_ecall_u /* system call */
> -	RISCV_PTR do_trap_ecall_s
> -	RISCV_PTR do_trap_unknown
> -	RISCV_PTR do_trap_ecall_m
> -	/* instruciton page fault */
> -	ALT_PAGE_FAULT(RISCV_PTR do_page_fault)
> -	RISCV_PTR do_page_fault   /* load page fault */
> -	RISCV_PTR do_trap_unknown
> -	RISCV_PTR do_page_fault   /* store page fault */
> -SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
> -
>  #ifndef CONFIG_MMU
>  SYM_DATA_START(__user_rt_sigreturn)
>  	li a7, __NR_rt_sigreturn
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 05a16b1f0aee..b44d4a8d4083 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -390,6 +390,47 @@ asmlinkage void noinstr do_irq(struct pt_regs *regs)
>  	irqentry_exit(regs, state);
>  }
>  
> +void (*excp_vect_table[])(struct pt_regs *regs) __ro_after_init = {
> +	do_trap_insn_misaligned,	/*  0 Instruction address misaligned */
> +	do_trap_insn_fault,		/*  1 Instruction access fault */
> +	do_trap_insn_illegal,		/*  2 Illegal instruction */
> +	do_trap_break,			/*  3 Breakpoint */
> +	do_trap_load_misaligned,	/*  4 Load address misaligned */
> +	do_trap_load_fault,		/*  5 Load access fault */
> +	do_trap_store_misaligned,	/*  6 Store/AMO address misaligned */
> +	do_trap_store_fault,		/*  7 Store/AMO access fault */
> +	do_trap_ecall_u,		/*  8 Environment call from U-mode */
> +	do_trap_ecall_s,		/*  9 Environment call from S-mode */
> +	do_trap_unknown,		/* 10 Reserved */
> +	do_trap_ecall_m,		/* 11 Environment call from M-mode */
> +#ifdef CONFIG_MMU
> +	do_page_fault,			/* 12 Instruciton page fault */
> +	do_page_fault,			/* 13 Load page fault */
> +	do_trap_unknown,		/* 14 Reserved */
> +	do_page_fault,			/* 15 Store/AMO page fault */
> +#endif
> +};
> +
> +asmlinkage void noinstr do_traps(struct pt_regs *regs)
> +{
> +	unsigned long cause = csr_read(CSR_CAUSE);
> +
> +	regs->cause = cause;
> +
> +#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
> +	riscv_v_context_nesting_start(regs);
> +#endif
> +	if (cause & CAUSE_IRQ_FLAG) {
> +		do_irq(regs);
> +	} else {
> +		if (cause >= ARRAY_SIZE(excp_vect_table)) {

Using unlikely here may optimize the hotpath here slightly.

- Charlie

> +			do_trap_unknown(regs);
> +			return;
> +		}
> +		excp_vect_table[cause](regs);
> +	}
> +}
> +
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long pc)
>  {
> -- 
> 2.43.0
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

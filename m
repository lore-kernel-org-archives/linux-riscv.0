Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F379CC2D0D1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 18:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hc5P3MAuiKoP1bYSlfdTC8HmAQgWxPdpuyVeavpvi4M=; b=WrTrQ7CXMt6YWF
	x8Q5/wxuESL4EiOxknqp2RfNbEd9/BSVwrU4ctFI7NVDi63Bs3cYB+dK7YmvPaBrL6iYTfugiuvxY
	LxKm+qWyeXyRkQG940nws65a9fVet3v7OPrgP6bG7807pIYP1ENqwoFSHPedXb4vnc/ZDMvbbnorf
	k7jbEmHWAVPbq+ehmtuk/GkJg9au7Ch6d6Eet2+vMlZxfBSx4RAkF6p5CT+7x/Ao+dl/rQChyDgpk
	57+9IWmR2tbKnyi+gzSAuRmZloqCykiFouQ0KZI5zSKubHqh7gL6AwTl4Kz5HP0hwLQQyt1/ttB3Y
	NWAmNn1J2zQiXIAkm8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLoow-00000000KcS-4ADu;
	Mon, 24 Jun 2024 18:53:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLoos-00000000KYd-3kiw
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 18:53:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70685ab8fb1so1068678b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719255218; x=1719860018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQbN2rQgA6olZj0JfteLM0ziVhjxiFoIeKCLSUkcl1k=;
        b=f/7OVAyhOdganCqN3qNTeFNzLawdMEV49zaU5YPr35yg66WOHhSnw2X9l5SvSLKs/k
         HXIb7LuE5+Gr00TzCcQBJci6bpOIqc0I69wl6GoVGEuWewgI0FQ7+h4no316iB1TPiJa
         D1W29sTR0emz/A8qOjTfn1hgnMAVKDAPT/rzf3eWslHSZGTD+HQRnaanLSv0E5ug4JDL
         RyzDoq6XrSkwThiH9Z0quNSgEJKQB97HEXi0OyEI80UhaweDD2BIHNfNs7KcfJxXjsZz
         TIAKjkqkFZK/AwTh7A86eZpd3QxyK0dKgBn9uS1GhNGdHjkcruZ++V98CubSMpiCB4o4
         VH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719255218; x=1719860018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQbN2rQgA6olZj0JfteLM0ziVhjxiFoIeKCLSUkcl1k=;
        b=xBs6bPjGKGaZYO7ZaMyLteaykG+007FgYP/BqSJA9rrrgH9wtLcS0PMzsn5zNjp83j
         Glm8ufG0bNeMy+W1jLxOLCpb+CMAUEfLv/wDwBcQ5TooVudMTivLMb0pshZdZhjYagj3
         7BvyXFvuW/e7HXCELkAOMvB8rUBdyxY9Cy9AYdLERWz8UzDMhpjXsLNWDsh5xXabewFK
         13b1dprSODmBBLjkkx8s4I8V5dn+9qxYw+55VL0zxq2apGiBhfbz0jgP8efLMenHe23Q
         5N9iG7QTJ0wc5JEpyTPTSzhfBPIC6I9EpyQSGTO4NWwZuix8oDEeQhA6eWefK6KsMTsI
         dpew==
X-Forwarded-Encrypted: i=1; AJvYcCVcLODaXrZ+SWRSo3rxgVxPEaI2ybZFguAibIwXXEPa1bsKr0sTIHjrC6c4JKZO5JxCeuFbUHXFtIvV63PcREamuAWKI8dTp55QN/wS2x8H
X-Gm-Message-State: AOJu0YxXU8h152iaIljgHs/Oefy0wBRdjzEFASMm4+2Zgd2oGm4VskCj
	41C/rqoz+/bN7jXiiGbJK9mjtfhhlhijgRk51X4JTe3dMyxbfG0IRWCpQCksMeE=
X-Google-Smtp-Source: AGHT+IHZRguXCheDd+Y6/VnLlaK1627YnvA3NtHYov2hpGd+KnVuRadwyUfxi8qJdw6f3yJJxUQChQ==
X-Received: by 2002:a05:6a00:2da0:b0:706:1edc:79af with SMTP id d2e1a72fcca58-706746b8ff7mr6028711b3a.22.1719255218044;
        Mon, 24 Jun 2024 11:53:38 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706953ca94dsm215462b3a.199.2024.06.24.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 11:53:37 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:53:36 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] riscv: remove asmlinkage from updated functions
Message-ID: <ZnnAsN9qW4Y9nL+/@ghost>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-7-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616170553.2832-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_115339_086149_6A282F50 
X-CRM114-Status: GOOD (  19.49  )
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

On Mon, Jun 17, 2024 at 01:05:53AM +0800, Jisheng Zhang wrote:
> Now that the callers of these functions have moved into C, they no longer
> need the asmlinkage annotation. Remove it

A couple of the functions here can be inlined as well now that they are
not called by assembly, this will allow the compiler to get rid of the
stack setup/tear down code and eliminate a handful of instructions. The
functions that can be inlined are riscv_v_context_nesting_start() and
do_irq().

- Charlie

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/asm-prototypes.h |  6 +++---
>  arch/riscv/kernel/traps.c               | 16 ++++++++--------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> index 81a1f27fa54f..70b86a825922 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -37,7 +37,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs);
>  
>  #endif /* CONFIG_RISCV_ISA_V */
>  
> -#define DECLARE_DO_ERROR_INFO(name)	asmlinkage void name(struct pt_regs *regs)
> +#define DECLARE_DO_ERROR_INFO(name)	void name(struct pt_regs *regs)
>  
>  DECLARE_DO_ERROR_INFO(do_trap_unknown);
>  DECLARE_DO_ERROR_INFO(do_trap_insn_misaligned);
> @@ -53,8 +53,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
>  DECLARE_DO_ERROR_INFO(do_trap_break);
>  
>  asmlinkage void handle_bad_stack(struct pt_regs *regs);
> -asmlinkage void do_page_fault(struct pt_regs *regs);
> -asmlinkage void do_irq(struct pt_regs *regs);
> +void do_page_fault(struct pt_regs *regs);
> +void do_irq(struct pt_regs *regs);
>  asmlinkage void do_traps(struct pt_regs *regs);
>  
>  #endif /* _ASM_RISCV_PROTOTYPES_H */
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index b44d4a8d4083..ddca8e74fb72 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -147,7 +147,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
>  #define __trap_section noinstr
>  #endif
>  #define DO_ERROR_INFO(name, signo, code, str)					\
> -asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
> +__visible __trap_section void name(struct pt_regs *regs)			\
>  {										\
>  	if (user_mode(regs)) {							\
>  		irqentry_enter_from_user_mode(regs);				\
> @@ -167,7 +167,7 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>  DO_ERROR_INFO(do_trap_insn_fault,
>  	SIGSEGV, SEGV_ACCERR, "instruction access fault");
>  
> -asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
> +__visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
>  {
>  	bool handled;
>  
> @@ -198,7 +198,7 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>  DO_ERROR_INFO(do_trap_load_fault,
>  	SIGSEGV, SEGV_ACCERR, "load access fault");
>  
> -asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
> +__visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> @@ -219,7 +219,7 @@ asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs
>  	}
>  }
>  
> -asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
> +__visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> @@ -294,7 +294,7 @@ void handle_break(struct pt_regs *regs)
>  		die(regs, "Kernel BUG");
>  }
>  
> -asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
> +__visible __trap_section void do_trap_break(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> @@ -311,7 +311,7 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  	}
>  }
>  
> -asmlinkage __visible __trap_section  __no_stack_protector
> +__visible __trap_section  __no_stack_protector
>  void do_trap_ecall_u(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
> @@ -355,7 +355,7 @@ void do_trap_ecall_u(struct pt_regs *regs)
>  }
>  
>  #ifdef CONFIG_MMU
> -asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
> +__visible noinstr void do_page_fault(struct pt_regs *regs)
>  {
>  	irqentry_state_t state = irqentry_enter(regs);
>  
> @@ -378,7 +378,7 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
>  	irq_exit_rcu();
>  }
>  
> -asmlinkage void noinstr do_irq(struct pt_regs *regs)
> +void noinstr do_irq(struct pt_regs *regs)
>  {
>  	irqentry_state_t state = irqentry_enter(regs);
>  
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

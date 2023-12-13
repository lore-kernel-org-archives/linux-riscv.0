Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE6BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 00:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iIoPNvJaYIjxXUqTSRcie73usfFTxxOp79+X+mL8Hfc=; b=TKPdA5jmMssimunnIhWSd/VD37
	KwBbNucuW6RMSOPg7adtOKrcmaTxiPUwaVVisVfzo9IUjgfFqgDstFiLLsOc9p+Q92howU0oaE0bL
	ikq14a0F1pUFF30Eh9CymZ/Eh4gOT7FlXAth1M5h5mjxP/KgsYfv539V/evlYCSS8LEtoQAsfmHRR
	tCKXUANsUMpbFFWt1GZ+9GUCL+J73UnDEDOKwqV1SApvxaXwFEFD7WJrau8CIv1W+ZJUXZLEmIyn1
	ppjzItnaRFXRGMMuA+bPxS5U0j/lnRjNOqvrBQuJxdBFsuJsgKkLHvw+SZdLJLtBc1p/1J0UfDWzK
	UyRzpyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDVb-00DEze-0h;
	Wed, 13 Dec 2023 00:53:55 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDVY-00DEyg-17
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 00:53:53 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso4424216fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 16:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1702428829; x=1703033629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLdUANKx1unw1AGMMFZA8UJQoW39VHxwZQDjHsgtVuo=;
        b=atVPNJAKmGuCCpyXYVzxiAKeIq+e/JXEZzFVQZtyS3kVKBZ1kEVPcGMCHlyIB2Tx9n
         f9jxW0bQa/bue3QzhoLhIt3ItBh53hX7a01OJVcqGIcahXjaI6DD71iDnNloT5KJ+Jya
         1rBKPqXsOL+BZ6CtlL24ZGjJJH5tfZsMUCGN1V6Wfy8VXCN0YufPn6NuJYYoDk7AgrCj
         +jTBq07klWnCcE1np/DWwsqsxec+Hcd8+9QifGQO6NnqK3ZfKyVXDoA7NO0/LiiUxn8V
         7jcNet5GqFg8LhJLwLQ1bOmiW9+Cux3bLS18x+m+oq+AMXYgKTFRIi7PTZT0kYbJUCih
         al/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702428829; x=1703033629;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLdUANKx1unw1AGMMFZA8UJQoW39VHxwZQDjHsgtVuo=;
        b=WyOiysrYJqZfL1o+cm69oULTGuKE7N0fInyE4jBL/pjhHQumimw3r1tEPJiFxTrv09
         AfF5t24cXnBPqh+dkUry0R9W1Sm2zutlPtjjzScSgClqgF7rrfeCYNOW9ScJB1fpjqkD
         biLdtttdsBCZKHCa1sbtGVtNXgh99WvNCl0Bpr5NIqO8nIL4ysmv+GFW0mHK5WJRs+g8
         aOmnD8r/xsK/P21rUb02j3mS5toqyia6JubqKi2MDC/CiVWBR0YdkA9k1UtwRzfyHYdD
         N1jFO2q71MXV8HrMhIhNoFs4UBjrfBCuuGygvUx9avQPsgtmW8yVXdvvFygShPWW+1mo
         32GA==
X-Gm-Message-State: AOJu0Yzv7YCMOv6/15/IBZCrmrntzq8ZcHjL5ZpPkb3Ot1mTPafVTRbX
	L9Oquis6EshWLCTYLd90mO81Lw==
X-Google-Smtp-Source: AGHT+IGyVfDGoC7uEkGdgEpcr0ILaIXni8QSJmDJiAwHxn36ZwOh21g2jQ843mnPTqLdQDHoedWuIg==
X-Received: by 2002:a05:6870:e256:b0:1fb:29af:7359 with SMTP id d22-20020a056870e25600b001fb29af7359mr8173956oac.81.1702428828908;
        Tue, 12 Dec 2023 16:53:48 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id s7-20020a656447000000b005c693386cb6sm7430216pgv.13.2023.12.12.16.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:53:48 -0800 (PST)
Date: Tue, 12 Dec 2023 16:53:48 -0800 (PST)
X-Google-Original-Date: Tue, 12 Dec 2023 16:53:31 PST (-0800)
Subject: Re: [PATCH v1 2/2] riscv: envcfg save and restore on trap entry/exit
In-Reply-To: <20231212235003.2036221-1-debug@rivosinc.com>
CC: debug@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, ajones@ventanamicro.com, guoren@kernel.org,
  mchitale@ventanamicro.com, waylingii@gmail.com, greentime.hu@sifive.com, samitolvanen@google.com,
  Bjorn Topel <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, jeeheng.sia@starfivetech.com,
  Heiko Stuebner <heiko@sntech.de>, Evan Green <evan@rivosinc.com>, jszhang@kernel.org, cleger@rivosinc.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: debug@rivosinc.com
Message-ID: <mhng-ae72b5fd-358d-48e2-87cf-f571b67afe9e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_165352_557859_3DE175A4 
X-CRM114-Status: GOOD (  23.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Dec 2023 15:49:25 PST (-0800), debug@rivosinc.com wrote:
> envcfg CSR defines enabling bits for cache management instructions and soon
> will control enabling for control flow integrity and pointer masking features.
>
> Control flow integrity and pointer masking features need to be enabled on per
> thread basis. Additionally, I believe cache management instructions need to be
> enabled on per thread basis. As an example a seccomped task on riscv may be
> restricted to not use cache management instructions

Do we have anything in the kernel that actually does that?  Generally we 
need some use, I couldn't find any user-mode writable envcfg bits in any 
extesions I looked at (admittidly just CFI and pointer masking), and 
unless I'm missing something there's no per-thread state in the kernel.

> This patch creates a place holder for envcfg CSR in `thread_info` and adds
> logic to save and restore on trap entry and exits. This allows such isa feature
> to be enabled on per thread basis.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/thread_info.h | 1 +
>  arch/riscv/kernel/asm-offsets.c      | 1 +
>  arch/riscv/kernel/entry.S            | 6 ++++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 574779900bfb..320bc899a63b 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -57,6 +57,7 @@ struct thread_info {
>  	long			user_sp;	/* User stack pointer */
>  	int			cpu;
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
> +	unsigned long envcfg;
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	void			*scs_base;
>  	void			*scs_sp;
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index a03129f40c46..cdd8f095c30c 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -39,6 +39,7 @@ void asm_offsets(void)
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> +	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>  #endif
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 54ca4564a926..a1d87013f15a 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -64,12 +64,14 @@ SYM_CODE_START(handle_exception)
>  	csrr s3, CSR_TVAL
>  	csrr s4, CSR_CAUSE
>  	csrr s5, CSR_SCRATCH
> +	csrr s6, CSR_ENVCFG
>  	REG_S s0, PT_SP(sp)
>  	REG_S s1, PT_STATUS(sp)
>  	REG_S s2, PT_EPC(sp)
>  	REG_S s3, PT_BADADDR(sp)
>  	REG_S s4, PT_CAUSE(sp)
>  	REG_S s5, PT_TP(sp)
> +	REG_S s6, TASK_TI_ENVCFG(tp)
>
>  	/*
>  	 * Set the scratch register to 0, so that if a recursive exception
> @@ -129,6 +131,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>  	addi s0, sp, PT_SIZE_ON_STACK
>  	REG_S s0, TASK_TI_KERNEL_SP(tp)
>
> +	/* restore envcfg bits for current thread */
> +	REG_L s0, TASK_TI_ENVCFG(tp)
> +	csrw CSR_ENVCFG, s0
> +
>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC2CC7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P6E8vZYtc8v/53kO44K7DD8D8s0uUhjoKwIFE9+vTso=; b=O8RbXkTMxcsBW7bK05I0qc0GrV
	uq/FdaNYCr1QhupF0oKp6X5jKl9l8+B+f1RrzlV0fLLNIKwlymZKI3FOi8m+DmSZyhrHFLs1UgMMr
	LoWtbV/j58jmbBX35Kszl4t4zYWbSgvUGB83vUmPl/dWpp+Wn352CgiEH1gHzTsykdFYuq+/zPA0m
	/QrhyHOYlqN0B2MZjtWdqYA0/HvaPT7I+UweRakyticX88S/HgvifeSJFZR3l5x+cfhC9cDs7/1Xw
	nCSrMdUtfU+7+BOHdx1pmwNqCL1kc/x5NnaVS1uJiL+Ty8FkEC1qSe2uyQR9jxKqraXdxC0Hycu7g
	HWR8DT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6t9-007qT9-1N;
	Wed, 17 May 2023 02:27:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6t6-007qPz-0U
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 02:27:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so2625005ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 19:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684290453; x=1686882453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oik51JQPg85IaF6uQeKdpJKlei3j8iZDbRMg5rmmh7k=;
        b=4691vsRStUZ7cla3scMb5+DYblLYZHI2qzQdQ7ryAOhVme9mLgXdr/vtIhW4wKJdja
         xQzJkktyr0YEtUZ4hTIVD+WSm5WaAk3m3job4GFjtqz1TDVyAEXrAmWJQ2ihY8ehxgus
         effhTMZSad7it1ApK89y5nZKghAvnfBCNDw7Q0/+b4+tJQk1z2QIRypYA+kQl9Cxz82X
         EcxIVKlDJFuQmlSggPt7kgKUmNO88M7rNxFgPDb+9Gg1ZZizRuxD0tvQspPJBStTRBAT
         XrUXxw3poKeqi8kQCFkCHGbFN9bngnXvpnGiGAdgdt9/VKXaDF2vKhlrJ2e0RwJsyC9B
         nLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684290453; x=1686882453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oik51JQPg85IaF6uQeKdpJKlei3j8iZDbRMg5rmmh7k=;
        b=eUHUq2Pil9Layzz/j08QuE2WrryfAMnq10IaIeHaZkkWcgU1EF5SE8xxDdSWvN4by5
         E9uf+BZAHHaM+74+qHWFWPxtb++I5LTuUZipnBMJYSYlOEPE9UtNasKmbQvIc33KoX9A
         7yyUVc9z53rErXW7WxkHd6gKTfvbh3gJUEsAvvoe49cltR8etX7Gntc7/ByoVnx1Xuog
         yJxSRPgX+4zwvC5A+prQyX6YgQdL/8SuzRk1Hb4X3Dubhz4Ete+rOKkbMnz5xicedCgQ
         W3tRcTJR7EA/Tv2qt6Abl0GjBo1ESXJrOKZVcUnr/WULuVol7XzdLh25l1lZg/0XFmqj
         6xXA==
X-Gm-Message-State: AC+VfDziocDmtiroH+XRZbJaoVqKZGMho2/4bzuLDRJwJWhIA41XYj5P
	HB0CV3VGMHoQZduqMUdRUo4SCQ==
X-Google-Smtp-Source: ACHHUZ7xnSzo8hUajddXxkMMocfQLHgcWqiSxO23+1j1Y3Df80Ett9H+/+KwgPF88AlNMHuidLewNQ==
X-Received: by 2002:a17:903:1103:b0:1ab:d89:5ef6 with SMTP id n3-20020a170903110300b001ab0d895ef6mr48820751plh.68.1684290452671;
        Tue, 16 May 2023 19:27:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b001a6388ce38bsm16192479plg.240.2023.05.16.19.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:27:32 -0700 (PDT)
Date: Tue, 16 May 2023 19:27:32 -0700 (PDT)
X-Google-Original-Date: Tue, 16 May 2023 19:27:05 PDT (-0700)
Subject: Re: [PATCH] irq_work: consolidate arch_irq_work_raise prototypes
In-Reply-To: <20230516200341.553413-1-arnd@kernel.org>
CC: mingo@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@armlinux.org.uk,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, guoren@kernel.org, mpe@ellerman.id.au,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  hca@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-b3a6013a-229c-4b21-b810-00c838d443f4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_192736_197225_A7A7CC3C 
X-CRM114-Status: GOOD (  19.04  )
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

On Tue, 16 May 2023 13:02:31 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The prototype was hidden on x86, which causes a warning:
>
> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_raise' [-Werror=missing-prototypes]
>
> Fix this by providing it in only one place that is always visible.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/include/asm/irq_work.h     | 2 --
>  arch/arm64/include/asm/irq_work.h   | 2 --
>  arch/csky/include/asm/irq_work.h    | 2 +-
>  arch/powerpc/include/asm/irq_work.h | 1 -
>  arch/riscv/include/asm/irq_work.h   | 2 +-

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

>  arch/s390/include/asm/irq_work.h    | 2 --
>  arch/x86/include/asm/irq_work.h     | 1 -
>  include/linux/irq_work.h            | 3 +++
>  8 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/include/asm/irq_work.h b/arch/arm/include/asm/irq_work.h
> index 3149e4dc1b54..8895999834cc 100644
> --- a/arch/arm/include/asm/irq_work.h
> +++ b/arch/arm/include/asm/irq_work.h
> @@ -9,6 +9,4 @@ static inline bool arch_irq_work_has_interrupt(void)
>  	return is_smp();
>  }
>
> -extern void arch_irq_work_raise(void);
> -
>  #endif /* _ASM_ARM_IRQ_WORK_H */
> diff --git a/arch/arm64/include/asm/irq_work.h b/arch/arm64/include/asm/irq_work.h
> index 81bbfa3a035b..a1020285ea75 100644
> --- a/arch/arm64/include/asm/irq_work.h
> +++ b/arch/arm64/include/asm/irq_work.h
> @@ -2,8 +2,6 @@
>  #ifndef __ASM_IRQ_WORK_H
>  #define __ASM_IRQ_WORK_H
>
> -extern void arch_irq_work_raise(void);
> -
>  static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return true;
> diff --git a/arch/csky/include/asm/irq_work.h b/arch/csky/include/asm/irq_work.h
> index 33aaf39d6f94..d39fcc1f5395 100644
> --- a/arch/csky/include/asm/irq_work.h
> +++ b/arch/csky/include/asm/irq_work.h
> @@ -7,5 +7,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return true;
>  }
> -extern void arch_irq_work_raise(void);
> +
>  #endif /* __ASM_CSKY_IRQ_WORK_H */
> diff --git a/arch/powerpc/include/asm/irq_work.h b/arch/powerpc/include/asm/irq_work.h
> index b8b0be8f1a07..c6d3078bd8c3 100644
> --- a/arch/powerpc/include/asm/irq_work.h
> +++ b/arch/powerpc/include/asm/irq_work.h
> @@ -6,6 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return true;
>  }
> -extern void arch_irq_work_raise(void);
>
>  #endif /* _ASM_POWERPC_IRQ_WORK_H */
> diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
> index b53891964ae0..b27a4d64fc6a 100644
> --- a/arch/riscv/include/asm/irq_work.h
> +++ b/arch/riscv/include/asm/irq_work.h
> @@ -6,5 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return IS_ENABLED(CONFIG_SMP);
>  }
> -extern void arch_irq_work_raise(void);
> +
>  #endif /* _ASM_RISCV_IRQ_WORK_H */
> diff --git a/arch/s390/include/asm/irq_work.h b/arch/s390/include/asm/irq_work.h
> index 603783766d0a..f00c9f610d5a 100644
> --- a/arch/s390/include/asm/irq_work.h
> +++ b/arch/s390/include/asm/irq_work.h
> @@ -7,6 +7,4 @@ static inline bool arch_irq_work_has_interrupt(void)
>  	return true;
>  }
>
> -void arch_irq_work_raise(void);
> -
>  #endif /* _ASM_S390_IRQ_WORK_H */
> diff --git a/arch/x86/include/asm/irq_work.h b/arch/x86/include/asm/irq_work.h
> index 800ffce0db29..6b4d36c95165 100644
> --- a/arch/x86/include/asm/irq_work.h
> +++ b/arch/x86/include/asm/irq_work.h
> @@ -9,7 +9,6 @@ static inline bool arch_irq_work_has_interrupt(void)
>  {
>  	return boot_cpu_has(X86_FEATURE_APIC);
>  }
> -extern void arch_irq_work_raise(void);
>  #else
>  static inline bool arch_irq_work_has_interrupt(void)
>  {
> diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
> index 8cd11a223260..136f2980cba3 100644
> --- a/include/linux/irq_work.h
> +++ b/include/linux/irq_work.h
> @@ -66,6 +66,9 @@ void irq_work_sync(struct irq_work *work);
>  void irq_work_run(void);
>  bool irq_work_needs_cpu(void);
>  void irq_work_single(void *arg);
> +
> +void arch_irq_work_raise(void);
> +
>  #else
>  static inline bool irq_work_needs_cpu(void) { return false; }
>  static inline void irq_work_run(void) { }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

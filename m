Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14F9E7106C
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dSPUCnmklPA4NE5VTAWkEpiF/I24r0kNARFRD2khv+U=; b=geU+TpaZFCU86OyGCweoB1dm1b
	b8vT4DEO9vy35pZCdeiySzoV1F5b7sU1EvgR0ZH2vFqW5P9597ZGlmD9pSIbrjjeNREqgiQcHQ6ru
	4XC0lYW0hg+SoSvONVOn6yeoKi+jfj0WdkQpHgswQxP8ApBNGEzt68XcwGCYna3grlp82R/0FC+vI
	AURWHP64aq/hVGyHOGWMDP9PL/M396lASQsRQwxbmi66RQWV9In0FPzLs9JmiCCHv75vi8+kZKovX
	BH3Mq2cRRWhetR+Ov/2PJqeRY6If31w0tsCQPR9pbEoUCFGPY8MT2DXeoLW7AE3E6JwEZ8XkEGj1d
	1LyUxFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJlS-0068UT-0u;
	Thu, 21 Sep 2023 13:30:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJlO-0068Si-39
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 13:30:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c39f2b4f5aso7301265ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695303029; x=1695907829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2WuKbsvAN9sA/j0wB2axPFPvBlW360v24lCRqdlRSo=;
        b=RpvxfawNTKhNSsIirPcgQ8t3KcxJoGxiWb1Mj5aG0xBZdmrPiEDC3SY+ph8/5CDSdt
         giJYckiF9Vi/ZU9cv9zMZKiN+kLbhl+97ZQRcq9yitP/68sWZrDfVNa2W3W96gA3pYbT
         tNf71hv3sfIhfCekbJcKDeKLnDSoW5XNdpoYZcc7GXJg2noGa/wmJDL7Nlum0c6CyOi6
         nb5dcz155OEEbuBHy/fZo43wuqzKva3DDv8Bz4AJeC+WYjpeE57aHX5MqTZVplwiBITQ
         zzHY8IHoCH1z3Q3xK/ZjIpyF2V8jHvNm9i9YOALi3kA+rKlDXiNG0w0AAg2avWvU2e2m
         7AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695303029; x=1695907829;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2WuKbsvAN9sA/j0wB2axPFPvBlW360v24lCRqdlRSo=;
        b=cSvu13zuf08banLuylfOr472nLvx8iaBLLKKPM3JFYjlPgdzGWFca6aA0gumI/BTNn
         WtRrkbpkDG9C5+ENzc7sKJkJ69127kzi1yeJ4752C80cwDJOsb2Tz3a1iT1HP2UzKby2
         GzIqmqEcGfuxUy6wjFjKkt3PFlLdxzzI0nPe1eqsCkbYtYkcnPvwCul6nCWwedSaOenQ
         UGLBGMWR925z3LYwd5GBxep6H5Fvqonn7/DFds9oPfM9/Lz4RXnEI2silPrZE3Pvdbq7
         /APsSdRTfFdoWLbZgXgJ3loZQTt6Qb4SRDXJgI2MxDlmzHwklRm9YbyUOCXtdWdeDhHB
         l+Tw==
X-Gm-Message-State: AOJu0YwLf6gRIqWiyTigwL2Tg9ZkwSJdJGGJmLCWgZ0mfAoRAWnADcyX
	n8VkxrUVz0PR0qlU31KQZiGCdjJGO8WK5jERiOtPTw==
X-Google-Smtp-Source: AGHT+IGBl/CZXRwk8PuRM6Eqv096ZP/F/aCDLQXFYBFCyUJTt8x7rD+rJNnv+SOGv4bKXXytZWTiQg==
X-Received: by 2002:a17:902:ab54:b0:1c0:bcbc:d64 with SMTP id ij20-20020a170902ab5400b001c0bcbc0d64mr4538535plb.51.1695303029156;
        Thu, 21 Sep 2023 06:30:29 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001bbfa86ca3bsm1462091plz.78.2023.09.21.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:30:28 -0700 (PDT)
Date: Thu, 21 Sep 2023 06:30:28 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Sep 2023 06:30:23 PDT (-0700)
Subject: Re: [PATCH v4 2/6] RISC-V: Enable cbo.zero in usermode
In-Reply-To: <20230918131518.56803-10-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com, xiao.w.wang@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-5a430e90-492e-4401-b7da-af0198a7d90c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_063039_242217_D16DEC99 
X-CRM114-Status: GOOD (  31.95  )
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

On Mon, 18 Sep 2023 06:15:21 PDT (-0700), ajones@ventanamicro.com wrote:
> When Zicboz is present, enable its instruction (cbo.zero) in
> usermode by setting its respective senvcfg bit. We don't bother
> trying to set this bit per-task, which would also require an
> interface for tasks to request enabling and/or disabling. Instead,
> permanently set the bit for each hart which has the extension when
> bringing it online.
>
> This patch also introduces riscv_cpu_has_extension_[un]likely()
> functions to check a specific hart's ISA bitmap for extensions.
> Prior to checking the specific hart's bitmap in these functions
> we try the bitmap which represents the LCD of extensions, but only
> when we know it will use its optimized, alternatives path by gating
> its call on CONFIG_RISCV_ALTERNATIVE. When alternatives are used, the
> compiler ensures that the invocation of the LCD search becomes a
> constant true or false. When it's true, even the new functions will
> completely vanish from their callsites. OTOH, when the LCD check is
> false, we need to do a search of the hart's ISA bitmap. Had we also
> checked the LCD bitmap without the use of alternatives, then we would
> have ended up with two bitmap searches instead of one.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/cpufeature.h |  1 +
>  arch/riscv/include/asm/csr.h        |  1 +
>  arch/riscv/include/asm/hwcap.h      | 16 ++++++++++++++++
>  arch/riscv/kernel/cpufeature.c      |  6 ++++++
>  arch/riscv/kernel/setup.c           |  4 ++++
>  arch/riscv/kernel/smpboot.c         |  4 ++++
>  6 files changed, 32 insertions(+)
>
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index d0345bd659c9..13b7d35648a9 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -31,5 +31,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
>
>  void check_unaligned_access(int cpu);
> +void riscv_user_isa_enable(void);
>
>  #endif
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 777cb8299551..5fba25db82d2 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -275,6 +275,7 @@
>  #define CSR_SIE			0x104
>  #define CSR_STVEC		0x105
>  #define CSR_SCOUNTEREN		0x106
> +#define CSR_SENVCFG		0x10a
>  #define CSR_SSCRATCH		0x140
>  #define CSR_SEPC		0x141
>  #define CSR_SCAUSE		0x142
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b7b58258f6c7..31774bcdf1c6 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -70,6 +70,7 @@
>  #ifndef __ASSEMBLY__
>
>  #include <linux/jump_label.h>
> +#include <asm/cpufeature.h>
>
>  unsigned long riscv_get_elf_hwcap(void);
>
> @@ -137,6 +138,21 @@ riscv_has_extension_unlikely(const unsigned long ext)
>  	return true;
>  }
>
> +static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
> +		return true;
> +
> +	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> +}
> +
> +static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
> +{
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
> +		return true;
> +
> +	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> +}
>  #endif
>
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f9ac2717bc7d..8ad6da03ee34 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -653,6 +653,12 @@ static int check_unaligned_access_boot_cpu(void)
>
>  arch_initcall(check_unaligned_access_boot_cpu);
>
> +void riscv_user_isa_enable(void)
> +{
> +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> +		csr_set(CSR_SENVCFG, ENVCFG_CBZE);

It looks like CBZE didn't actually get ratified?  The CMO extension says

    _The CMO extensions rely on state in {csrname} CSRs that will be defined in a
    future update to the privileged architecture. If this CSR update is not
    ratified, the CMO extension will define its own CSRs._

but the privileged spec says

    The definition of the CBZE field will be furnished by the forthcoming
    Zicboz extension. Its allocation within `senvcfg` may change prior to
    the ratification of that extension.

Is there some ratified spec that actually defines this?

> +}
> +
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
>   * Alternative patch sites consider 48 bits when determining when to patch
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index e600aab116a4..8fd6c02353d4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -26,6 +26,7 @@
>  #include <asm/acpi.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
> +#include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/early_ioremap.h>
>  #include <asm/pgtable.h>
> @@ -314,10 +315,13 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_fill_hwcap();
>  	init_rt_signal_env();
>  	apply_boot_alternatives();
> +
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
>  		riscv_noncoherent_supported();
>  	riscv_set_dma_cache_alignment();
> +
> +	riscv_user_isa_enable();
>  }
>
>  static int __init topology_init(void)
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 1b8da4e40a4d..d1b0a6fc3adf 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -25,6 +25,8 @@
>  #include <linux/of.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sched/mm.h>
> +
> +#include <asm/cpufeature.h>
>  #include <asm/cpu_ops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/irq.h>
> @@ -253,6 +255,8 @@ asmlinkage __visible void smp_callin(void)
>  			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
>  	}
>
> +	riscv_user_isa_enable();
> +
>  	/*
>  	 * Remote TLB flushes are ignored while the CPU is offline, so emit
>  	 * a local TLB flush right now just in case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

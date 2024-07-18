Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFECC3DA61
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 23:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJ9OK1BN7pcVISykeg/xL6XCmbuFiq83Gxna1kFeYPQ=; b=Z039Je0qVBoW/x
	PaY+MTmBeBjlfws4ymA+aJfq5V3mT+RZeSHRECDEZ/baZJ6jesWwooveWnARkPEBARHDyy8tj2E48
	CRF0gcH/Lxs5FjBaua5P3tMx+hILdZF57YXf1CCZHDzQxCLTYw+bKhDuD4MBSORmxnnriwpQKMJq5
	LdZjWU1S0C5cnuADqxMoQRXi1bNxZlcdw7Xk1sQ0C0mAh3bYAFKXHdF3woJZTg4bJ86WLv/1kIiEj
	3axoVtOfyhUblqcuYzXCp6tR7AouiKtdBfQolbn2n76dUW6zRZ3qzpRq8UKFFYCTOOgdlKReuGrVJ
	7rgps4llSLJG4KJlOExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUaek-00000000zuJ-31EG;
	Thu, 18 Jul 2024 23:35:26 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUaeh-00000000zsa-1aIV
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 23:35:24 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-39626aee4easo5510045ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721345722; x=1721950522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wuB824Hrye/65n89Susd5Qn8V22yeQN5eVpd+tL4OM=;
        b=GZyX5W9xzQDjKorbCCeWoqpz1xYLigiHZJ9Yyr7mBDVatD0fjBjI0IoyKdi2dcd7cL
         PrDWlGMN4pMQWIJKrfCr1K/xNmRK0+PLwyVws6tQ4h2jIFWhOm0r+qlXsEa336AXx1qK
         2Fpd94lPZCLNYzT96J/7OS5CCE3dZhi5B6F/YmOQiTsj+41NW57joLL3zhjmYVo2Oa92
         WWmskje7Rws4043MMwXtmRV0yDh3P/Y3GyL5FXyUo5cJLkRlTzQFc8SiR76pSioiJhh9
         NpFSoGMurRDKmRCGZp1AlDE2jGWHn0NDDpSnsC/jMs42Iz3aRAjhOK104378m8Zm0cXZ
         QrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721345722; x=1721950522;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wuB824Hrye/65n89Susd5Qn8V22yeQN5eVpd+tL4OM=;
        b=JGfhIVQd514om3pGXu/kYrl7a6G7Y+rdJbl8xhBwpe0fZrFPJAT2clCSkzj/X5gB08
         tLScg2N7S+ENQuv+vc59eE3G2BPOXXsTZBLzIUbIAcD4O18SWl5ADFz9u4bKF+fWnP+v
         pA+NcjpLBRDbKRMAErp69Z5m9bP2nlb5RKtsmRUXpXfgcDATYeznakbFlrSRwt4hA8jv
         qXGHh4NY22OhGBqvAA8S0AClk3HWnoQnOmVGmn/4XseIP+JsfLbkF9tUFAQs7kV7X7FC
         tBMeQOzggL6P8nECNZKkAsf7tkDLrgHlYm7SPecMbbCs0wCABXAat+V2qD2tcsJUgyOA
         EalA==
X-Forwarded-Encrypted: i=1; AJvYcCUedwb/hM3wYASQTlnAEWVbfyxZZLijpXM9EC5bBPhc/Q1P3mY+jfXkoF4SvvHoTjOeVp9s8m8H8NWE5ISurxXnfY8ShS5Xp3yopSHjKzVZ
X-Gm-Message-State: AOJu0YxonDgC5xo6Esg2hzxWnlwsQiMwOjeirV6vsF9UQiAY6FmamsKy
	MKAzPm5bLDrwBBvRCwWDpXZwM5rkvSGjuSFoFY3wdTSXvTop9u5Z0Vvd0W7SrmQ=
X-Google-Smtp-Source: AGHT+IFtVhVM9BDBi07vxZXR86hASuWPxepp8zLd6TCw6Ag6AJelMqPZkldzEt6k5/Z8Yqp4PAfVOw==
X-Received: by 2002:a05:6e02:168a:b0:37a:a9f0:f263 with SMTP id e9e14a558f8ab-39556e4ff57mr82165945ab.20.1721345722320;
        Thu, 18 Jul 2024 16:35:22 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-397f7efad1asm502335ab.76.2024.07.18.16.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 16:35:21 -0700 (PDT)
Message-ID: <c403de1d-cda8-45bc-a6a2-a92170ad8575@sifive.com>
Date: Thu, 18 Jul 2024 18:35:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] RISC-V: Add Svade and Svadu Extensions Support
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com,
 Jinyu Tang <tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Leonardo Bras <leobras@redhat.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-2-yongxuan.wang@sifive.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240712083850.4242-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_163523_633996_A157D78C 
X-CRM114-Status: GOOD (  28.49  )
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

Hi Yong-Xuan,

Two trivial comments below for if you send another version of the series.

On 2024-07-12 3:38 AM, Yong-Xuan Wang wrote:
> Svade and Svadu extensions represent two schemes for managing the PTE A/D
> bits. When the PTE A/D bits need to be set, Svade extension intdicates
> that a related page fault will be raised. In contrast, the Svadu extension
> supports hardware updating of PTE A/D bits. Since the Svade extension is
> mandatory and the Svadu extension is optional in RVA23 profile, by default
> the M-mode firmware will enable the Svadu extension in the menvcfg CSR
> when only Svadu is present in DT.
> 
> This patch detects Svade and Svadu extensions from DT and adds
> arch_has_hw_pte_young() to enable optimization in MGLRU and
> __wp_page_copy_user() when we have the PTE A/D bits hardware updating
> support.
> 
> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/csr.h     |  1 +
>  arch/riscv/include/asm/hwcap.h   |  2 ++
>  arch/riscv/include/asm/pgtable.h | 13 ++++++++++++-
>  arch/riscv/kernel/cpufeature.c   | 32 ++++++++++++++++++++++++++++++++
>  5 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0525ee2d63c7..3d705e28ff85 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -36,6 +36,7 @@ config RISCV
>  	select ARCH_HAS_PMEM_API
>  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_HW_PTE_YOUNG

These lines should be sorted alphabetically.

>  	select ARCH_HAS_SET_DIRECT_MAP if MMU
>  	select ARCH_HAS_SET_MEMORY if MMU
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 25966995da04..524cd4131c71 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -195,6 +195,7 @@
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
>  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e17d0078a651..35d7aa49785d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,8 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_SVADE             75

The number here should be aligned with tabs, like the surrounding lines.

Regards,
Samuel

> +#define RISCV_ISA_EXT_SVADU		76
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index aad8b8ca51f1..ec0cdacd7da0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -120,6 +120,7 @@
>  #include <asm/tlbflush.h>
>  #include <linux/mm_types.h>
>  #include <asm/compat.h>
> +#include <asm/cpufeature.h>
>  
>  #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
>  
> @@ -288,7 +289,6 @@ static inline pte_t pud_pte(pud_t pud)
>  }
>  
>  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> -#include <asm/cpufeature.h>
>  
>  static __always_inline bool has_svnapot(void)
>  {
> @@ -624,6 +624,17 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  	return __pgprot(prot);
>  }
>  
> +/*
> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> + * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> + * DT.
> + */
> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> +static inline bool arch_has_hw_pte_young(void)
> +{
> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +}
> +
>  /*
>   * THP functions
>   */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5ef48cb20ee1..b2c3fe945e89 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -301,6 +301,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> @@ -554,6 +556,21 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>  		}
>  
> +		/*
> +		 * When neither Svade nor Svadu present in DT, it is technically
> +		 * unknown whether the platform uses Svade or Svadu. Supervisor may
> +		 * assume Svade to be present and enabled or it can discover based
> +		 * on mvendorid, marchid, and mimpid. When both Svade and Svadu present
> +		 * in DT, supervisor must assume Svadu turned-off at boot time. To use
> +		 * Svadu, supervisor must explicitly enable it using the SBI FWFT extension.
> +		 */
> +		if (!test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +		    !test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			set_bit(RISCV_ISA_EXT_SVADE, isainfo->isa);
> +		else if (test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +			 test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			clear_bit(RISCV_ISA_EXT_SVADU, isainfo->isa);
> +
>  		/*
>  		 * All "okay" hart should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't
> @@ -619,6 +636,21 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  
>  		of_node_put(cpu_node);
>  
> +		/*
> +		 * When neither Svade nor Svadu present in DT, it is technically
> +		 * unknown whether the platform uses Svade or Svadu. Supervisor may
> +		 * assume Svade to be present and enabled or it can discover based
> +		 * on mvendorid, marchid, and mimpid. When both Svade and Svadu present
> +		 * in DT, supervisor must assume Svadu turned-off at boot time. To use
> +		 * Svadu, supervisor must explicitly enable it using the SBI FWFT extension.
> +		 */
> +		if (!test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +		    !test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			set_bit(RISCV_ISA_EXT_SVADE, isainfo->isa);
> +		else if (test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
> +			 test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
> +			clear_bit(RISCV_ISA_EXT_SVADU, isainfo->isa);
> +
>  		/*
>  		 * All "okay" harts should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

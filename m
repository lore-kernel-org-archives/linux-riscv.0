Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F55FC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhfOriQAgiwgEn47kBLOw7m8L08ATQpb9HZaw1LSUsg=; b=XmDpDa7iPs9+H2
	bUYrQAF/TG+kGja+2DqieBD/vMngBjodE8riUvxlpMdE1wU73M9zovTjdoAwnPEXx7fMhSsbPkLwR
	3iC9ZUDC6V8CKnOA7KUSNxx3huw7+GffqbpNJ4okfrcvDtdCjtMUYxe9oxikOWIGqNGzcamFvACk/
	LcaGr5/9s7jRb6//tKvk9g5otyjM7klOsU/FhCCthgzCKwcaiKeEdUN7orACYS0gTNha2J5Nc3kYy
	TF8k1158TxVPgHDLvPYHCpBsR3kML0XgfgRI2wjtWMi6QMLldve8O0lgXf6+1pDUltLd5IdSxG4D6
	h1lHJDb/xHgjfSBdFcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZsN-00000008OTk-0RsD;
	Fri, 21 Jun 2024 08:44:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZsI-00000008OQy-0Eh6
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 08:44:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a6f13dddf7eso211557466b.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718959440; x=1719564240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y0W/yXjQFyqiu4YF3eksrFfEO800rJtGZTMEqwAB9lw=;
        b=iMzUrUIeUKTtNyisq/L7b891y/0PQj1q8oWyS7D5R6pAJcL0YqGSYJPHZjf3+TSVnm
         MDvs9snVIS8ogITIbgc3qpLrRKpPik/wAzdXfUseY8+hlf+nGvbf/cMb5mwORjLa9YpB
         mhnyypXXL9WbPvDjLwFr/nH4BBlLGhGhocAy+jyoSQgyLxWg08W7kfdqgXQkbGuO8qHl
         o0GqsCKTXx92XL5S4tRvu6Ri5BAN4RoMPy2hbBXl3VvkuQ0CX5tKoSHTL9/Z0v4zOhYn
         9Q50Aw66N+PpMau1P2sRf5rfq/9bxU/uLmXIa62S0HwhTjaB0gBNcs3fjP8rTdTU3W6o
         6JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718959440; x=1719564240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0W/yXjQFyqiu4YF3eksrFfEO800rJtGZTMEqwAB9lw=;
        b=fXYkfz8aWfPphX0PHWdVsXmimNE2Q19BHpElIUDf4gUH4jiPAOXOCWnoNLs7tpcMtw
         r556Zk7KaYDBzIJi77juFItbpedY4xJZOjiXC1D+tHZi7yXX++5hk00cfHwgsQ+ZtCau
         ZZxWEHkWVSYavwgASIv6k3llzhruZzD9IHO8hbN+nOPDBInRQalyndvp+zwm3K2M89gi
         tGTKE5mA0yCSTE1rowtMnzU1YUbSIKJ4KmrcV3fpY0YuRJq1g7FfgRBnbrtC8FfOhl5F
         PGDMEYfpEdpDhoKpbSAAQYbJOpzO3lXHvd9PFC1Q3rSWS7CafcsSqSD00CqC5N7kbrDi
         DeEw==
X-Forwarded-Encrypted: i=1; AJvYcCUsd5KZiy9Ms7YugqvcbhI0tJlCjPwYHD+vX5KgDwXlC2heWeNjucARDlh+1bGQGFqRWjXE52WDB55hkYOHr8b+eDwy0hTLNaRSyO2CKXrF
X-Gm-Message-State: AOJu0Yw1KxZlRG7Yg1CBcHII40+T1QpwObXk2zgTa5LgiKblEzFWAyM6
	IaxYSkyCsjLbYNiphvqpXCy9qVvgqDty0stb52ub12Sbb98vD4Ycv5KAkMnI5kI=
X-Google-Smtp-Source: AGHT+IGCvv5/dIqWzwFU7HWVxrBDIamtXxsPzF9wPVhiKm9PMGOYERORN5v/XksMktGyjYh/7LB0lA==
X-Received: by 2002:a17:907:b9d2:b0:a6f:50ae:e06 with SMTP id a640c23a62f3a-a6fab778851mr473339566b.53.1718959439838;
        Fri, 21 Jun 2024 01:43:59 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428bb5sm59484866b.13.2024.06.21.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:43:59 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:43:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
Message-ID: <20240621-d1b77d43adacaa34337238c2@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605121512.32083-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_014402_183189_0E48C2CE 
X-CRM114-Status: GOOD (  26.24  )
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

On Wed, Jun 05, 2024 at 08:15:07PM GMT, Yong-Xuan Wang wrote:
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
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/csr.h     |  1 +
>  arch/riscv/include/asm/hwcap.h   |  2 ++
>  arch/riscv/include/asm/pgtable.h | 14 +++++++++++++-
>  arch/riscv/kernel/cpufeature.c   |  2 ++
>  5 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b94176e25be1..dbfe2be99bf9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -36,6 +36,7 @@ config RISCV
>  	select ARCH_HAS_PMEM_API
>  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_HW_PTE_YOUNG
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
> +#define RISCV_ISA_EXT_SVADU		76
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index aad8b8ca51f1..7287ea4a6160 100644
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
> @@ -624,6 +624,18 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
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
> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
> +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);

It's hard to guess what is, or will be, more likely to be the correct
choice of call between the _unlikely and _likely variants. But, while we
assume svade is most prevalent right now, it's actually quite unlikely
that 'svade' will be in the DT, since DTs haven't been putting it there
yet. Anyway, it doesn't really matter much and maybe the _unlikely vs.
_likely variants are better for documenting expectations than for
performance.

> +}
> +
>  /*
>   * THP functions
>   */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 5ef48cb20ee1..58565798cea0 100644
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
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

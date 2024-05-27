Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5562C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlapPlsUMIxnmnXSumHouloJp22FVzjxhjGxr0tc1HQ=; b=grdvTMiwcQtMhM
	3NW1z03QoCsshKj34CPLeauNdZfOjydpMye8ZLZDQ6/ig+pvLeoEP1EJysWcf171DO/4Q4qMpUQgt
	1EBnFhMRIHyMYVeDk/US3ktcrmmS+H+cP75QAt3zhpea5UKSJ+i5a24BDnaJoFv2vkM41g0nGbl6M
	R26/JrSitQSjStD1ExC1hMBz8DZElj3xlW6Q4xJVIOJd/OSD9PtvcMpP9/mpEexC6ztpRNtKM8Hel
	pKhhVEex5G/qrkIBG4cboFsgIrzQcP2hPfPgebTF0EQ5I58s2iLzntw8dsNhYdgHGaFeSqNG1C4za
	qFYHP6Xxw1DS+TKu+lNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdAb-0000000FqR4-2UND;
	Mon, 27 May 2024 16:25:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdAX-0000000FqOU-04Fr
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:25:55 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-529b22aabc1so1035201e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716827150; x=1717431950; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47CM+OohXZ/uj91laGtyNIW1WOIMEW/2BamLnhPhjLg=;
        b=DtMhJ5ifmX4l8sHw64JeBi4k+TH0w7c9zRsQBRsMFO9wEVD1ag+RZbZtSrhlAlMyvf
         xH/UcGUT/nV57Cv9bRnVoOnSqRUyCruONSP5uS+sYdcQobfTIu5RdFNV1XDE7ndQ4Wen
         9RuWmlXxHCft53tU7IaUfV4oMEjPk3yvRBarfPFfhnhBoJidXVE1hXvAoJzvowYcF4qU
         aY6+VH3R6S4NFksubrJPte36YrtaHavqF3LZsMX+UlC5ntQ/fDvyz1sXher5OZkbhGbG
         rilGdMl/evrMZFfr/4Rr1C4Sy6IlNn4Jcalxpbd4uehFDBJnbcBT2GVqEz2cp6d63R3G
         TTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827150; x=1717431950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47CM+OohXZ/uj91laGtyNIW1WOIMEW/2BamLnhPhjLg=;
        b=kdb9Up2d/Gx3o/uzWSAIVX7IIJ4DkTdByXCplN5OIVSJfMKitFtm/j+DlAA2FXYTHr
         BLnjx3S48xIXrqIQ/Ny4NDZmOTOmEqq1px6HmW1gD8MuVljfYvcysnP1ybQDyuYuMiWJ
         9sOWylwTIRt8fb7PngeJTwtAynzF8o0t63bDZ7cNAogNlGD1xkjLhSoQldm0VEPVNPFC
         1T2PrYAKMIBcHf3YQFCYq4qQGVeK/WB48qrKYxKTS2lJgDTMVn6iQc1yOViOV+DOKUo7
         eEdVtoRXmLDSQOtpoHI/fDoRdz98D7f0dHCUUPIfR0E77V0b1a4/zql69vy8uU5OJnsz
         8s3w==
X-Gm-Message-State: AOJu0YzdU2zBdUV4SxDv6OCAvJE1UCORCdePDZfTwdRMlSX20UEcmIvV
	ntKqsFLDvklZ/i1zeUHcPKNNvUCJx29Uj4wDhACVOOR0yZqDaJq2JcUcw1sUyzU=
X-Google-Smtp-Source: AGHT+IERUBuY75t+21Dh0Te3entq997PSVNxYrQiMf+uzfZwadVoSO9JlMdhr5Poe9kWJuTWdn1vkQ==
X-Received: by 2002:ac2:5ec6:0:b0:51e:147d:bd2d with SMTP id 2adb3069b0e04-52964eac421mr5508085e87.39.1716827150373;
        Mon, 27 May 2024 09:25:50 -0700 (PDT)
Received: from localhost ([176.74.158.132])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bb79esm5935351a12.92.2024.05.27.09.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:25:49 -0700 (PDT)
Date: Mon, 27 May 2024 18:25:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension
 Support
Message-ID: <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524103307.2684-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_092553_137875_9F0C577F 
X-CRM114-Status: GOOD (  23.90  )
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

On Fri, May 24, 2024 at 06:33:01PM GMT, Yong-Xuan Wang wrote:
> Svadu is a RISC-V extension for hardware updating of PTE A/D bits.
> 
> In this patch we detect Svadu extension support from DTB and enable it
> with SBI FWFT extension. Also we add arch_has_hw_pte_young() to enable
> optimization in MGLRU and __wp_page_copy_user() if Svadu extension is
> available.
> 
> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I think this patch changed too much to keep r-b's. We didn't have the
FWFT part before.

> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/csr.h     |  1 +
>  arch/riscv/include/asm/hwcap.h   |  1 +
>  arch/riscv/include/asm/pgtable.h |  8 +++++++-
>  arch/riscv/kernel/cpufeature.c   | 11 +++++++++++
>  5 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index be09c8836d56..30fa558ee284 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,6 +34,7 @@ config RISCV
>  	select ARCH_HAS_PMEM_API
>  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_HW_PTE_YOUNG
>  	select ARCH_HAS_SET_DIRECT_MAP if MMU
>  	select ARCH_HAS_SET_MEMORY if MMU
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 2468c55933cd..2ac270ad4acd 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -194,6 +194,7 @@
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
>  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e17d0078a651..8d539e3f4e11 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_SVADU		75
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9f8ea0e33eb1..1f1b326ccf63 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -117,6 +117,7 @@
>  #include <asm/tlbflush.h>
>  #include <linux/mm_types.h>
>  #include <asm/compat.h>
> +#include <asm/cpufeature.h>
>  
>  #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
>  
> @@ -285,7 +286,6 @@ static inline pte_t pud_pte(pud_t pud)
>  }
>  
>  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> -#include <asm/cpufeature.h>
>  
>  static __always_inline bool has_svnapot(void)
>  {
> @@ -621,6 +621,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  	return __pgprot(prot);
>  }
>  
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
> index 3ed2359eae35..b023908c5932 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -93,6 +93,16 @@ static bool riscv_isa_extension_check(int id)
>  			return false;
>  		}
>  		return true;
> +	case RISCV_ISA_EXT_SVADU:
> +		if (sbi_probe_extension(SBI_EXT_FWFT) > 0) {

I think we've decided the appropriate way to prove for SBI extensions is
to first ensure the SBI version and then do the probe, like we do for STA
in has_pv_steal_clock()

> +			struct sbiret ret;
> +
> +			ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET, SBI_FWFT_PTE_AD_HW_UPDATING,
> +					1, 0, 0, 0, 0);
> +
> +			return ret.error == SBI_SUCCESS;
> +		}
> +		return false;
>  	case RISCV_ISA_EXT_INVALID:
>  		return false;
>  	}
> @@ -301,6 +311,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_SUPERSET(svadu, RISCV_ISA_EXT_SVADU, riscv_xlinuxenvcfg_exts),

We do we need XLINUXENVCFG?

Thanks,
drew

>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

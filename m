Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B59DFA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPo68QMTZR/lIGW6gh/hkAjlzosb4QxzRuqvWOAkRsI=; b=Behin1vYgKWSvb
	Nek+ZTh73ZRo8COAOlrE9c8rSI2TceLPFqdp7R0xDauJllaN/adB2psifUDCJpD7gF26ALgnqyiFd
	tFqiVhv7ywcGs17QPmyhAWDrea5Tp3XkAj00To/hj9MiQQ6BtbRBtUH3yBbvG0Ikq4MMGcVC9F6wp
	EWC5nYB1sqOtzxqq1SKiBH5saDE1pvBWHW2F08NgumpAOVfr77U07R5JVJVFq7ZhqgDi9I/XYDprB
	ga/egOuHbR8j/6gG+7lph3bAjufOQa6TVIjqdIFB8c8MGby5sa2ngHyIpAu7Wtx5TVshYvc6aJG3G
	NHejYWEVrAU11tV3+C2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo4QP-00DxnW-Ma; Thu, 27 Oct 2022 15:04:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo4QK-00Dxky-QR; Thu, 27 Oct 2022 15:04:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo4QJ-0001Cu-1N; Thu, 27 Oct 2022 17:03:59 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Date: Thu, 27 Oct 2022 17:03:58 +0200
Message-ID: <5176908.GXAFRqVoOG@diego>
In-Reply-To: <20221027130247.31634-3-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_080400_897651_90ACD724 
X-CRM114-Status: GOOD (  27.37  )
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

Am Donnerstag, 27. Oktober 2022, 15:02:40 CEST schrieb Andrew Jones:
> Mostly follow the same pattern as Zicbom, but leave out the toolchain
> checks as we plan to use the insn-def framework for the cbo.zero
> instruction.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                  | 13 +++++++++++++
>  arch/riscv/include/asm/cacheflush.h |  3 ++-
>  arch/riscv/include/asm/hwcap.h      |  1 +
>  arch/riscv/kernel/cpu.c             |  1 +
>  arch/riscv/kernel/cpufeature.c      | 10 ++++++++++
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/cacheflush.c          | 23 +++++++++++++++--------
>  7 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b48a3ae9843..c20e6fa0c0b1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -433,6 +433,19 @@ config RISCV_ISA_ZICBOM
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOZ
> +	bool "Zicboz extension support for faster zeroing of memory"
> +	depends on !XIP_KERNEL && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZICBOZ
> +	   extension (cbo.zero instruction) and enable its usage.
> +
> +	   The Zicboz extension is used for faster zeroing of memory.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config FPU
>  	bool "FPU support"
>  	default y
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index f6fbe7042f1c..5b31568cf5e6 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -43,7 +43,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #endif /* CONFIG_SMP */
>  
>  extern unsigned int riscv_cbom_block_size;
> -void riscv_init_cbom_blocksize(void);
> +extern unsigned int riscv_cboz_block_size;
> +void riscv_init_cbo_blocksizes(void);
>  
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  void riscv_noncoherent_supported(void);
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5d6492bde446..eaa5a972ad2d 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -45,6 +45,7 @@
>  #define RISCV_ISA_EXT_ZIHINTPAUSE	29
>  #define RISCV_ISA_EXT_SSTC		30
>  #define RISCV_ISA_EXT_SVINVAL		31
> +#define RISCV_ISA_EXT_ZICBOZ		32
>  
>  #define RISCV_ISA_EXT_ID_MAX		RISCV_ISA_EXT_MAX
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fa427bdcf773..bf969218f609 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 18b9ed4df1f4..e13b3391de76 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -78,6 +78,15 @@ static bool riscv_isa_extension_check(int id)
>  			return false;
>  		}
>  		return true;
> +	case RISCV_ISA_EXT_ZICBOZ:
> +		if (!riscv_cboz_block_size) {
> +			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
> +			return false;
> +		} else if (!is_power_of_2(riscv_cboz_block_size)) {
> +			pr_err("cboz-block-size present, but is not a power-of-2\n");
> +			return false;
> +		}
> +		return true;
>  	}
>  
>  	return true;
> @@ -225,6 +234,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index a07917551027..26de0d8fd23d 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -296,7 +296,7 @@ void __init setup_arch(char **cmdline_p)
>  	setup_smp();
>  #endif
>  
> -	riscv_init_cbom_blocksize();
> +	riscv_init_cbo_blocksizes();
>  	riscv_fill_hwcap();
>  	apply_boot_alternatives();
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f096b9966cae..208e0d58bde3 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -91,6 +91,9 @@ void flush_icache_pte(pte_t pte)
>  unsigned int riscv_cbom_block_size;
>  EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
>  
> +unsigned int riscv_cboz_block_size;
> +EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
> +
>  static void cbo_get_block_size(struct device_node *node,
>  			       const char *name, u32 *blksz,
>  			       unsigned long *first_hartid)
> @@ -113,19 +116,23 @@ static void cbo_get_block_size(struct device_node *node,
>  	}
>  }
>  
> -void riscv_init_cbom_blocksize(void)
> +void riscv_init_cbo_blocksizes(void)
>  {
> +	unsigned long cbom_hartid, cboz_hartid;
> +	u32 cbom_blksz = 0, cboz_blksz = 0;
>  	struct device_node *node;
> -	unsigned long cbom_hartid;
> -	u32 probed_block_size;
>  
> -	probed_block_size = 0;
>  	for_each_of_cpu_node(node) {
> -		/* set block-size for cbom extension if available */
> +		/* set block-size for cbom and/or cboz extension if available */
>  		cbo_get_block_size(node, "riscv,cbom-block-size",
> -				   &probed_block_size, &cbom_hartid);
> +				   &cbom_blksz, &cbom_hartid);
> +		cbo_get_block_size(node, "riscv,cboz-block-size",

This is missing an entry in
	Documentation/devicetree/bindings/riscv/cpus.yaml
for the added riscv,cboz-block-size property.

Otherwise
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> +				   &cboz_blksz, &cboz_hartid);
>  	}
>  
> -	if (probed_block_size)
> -		riscv_cbom_block_size = probed_block_size;
> +	if (cbom_blksz)
> +		riscv_cbom_block_size = cbom_blksz;
> +
> +	if (cboz_blksz)
> +		riscv_cboz_block_size = cboz_blksz;
>  }
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

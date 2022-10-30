Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5655DC38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 20:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF3lUFrcvavrGfUEMZPBhI2Szm7mG4kiyGNHWgF0s6g=; b=H0z5w7MewQawB1
	puOVXyVz57jmw5DDjHXU13OuntG4eRsJeA4je4UXUCE/3VUAybxHgdk2qLga01bk5Ti5qop9kNpGz
	c5GPqqSbxJhg7eS6P28NfUeKBAA9agYx3tIY0/353b9IhbBspwCjhJJUuTA4U9VwZQggeZOo5o0K/
	kxehBpV233hDiRoU0o0uJbcOa79EQsajSmO/bDXSZ7wjShGC9Z0lwaybYByxdeV6ksvNIKZyKDOoJ
	j2fcEWOmmK1oHAPmcFClXytcYR/zpKLiCTt1aeHHD5Zgg9EhsF1XXbg3B366LS4RA9B1mvKbXOUUl
	r8C+u8eT3UaQhzz1ZQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFDp-003147-6e; Sun, 30 Oct 2022 20:47:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFDl-00312L-Ax; Sun, 30 Oct 2022 20:47:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FADB60F43;
	Sun, 30 Oct 2022 20:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED37C433C1;
	Sun, 30 Oct 2022 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667162872;
	bh=7pdxz8aNO3R3XDHOFSd4RjNygCMeIKOD+HBhJin0k8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssMmMJ4kYjLyVffGjHdI0ZsAdmRHKy6STrKo3C8m0ILfNAkI4UAHRm4AvVSkV59iS
	 /9dpfFQW+zEw3NGdoTOY8pbATl28UNUpdgsfgASR7MMMhxYscfrsfqYUZ0dRD8DFPo
	 Y6g9+2qEjz6E+NxtKXL/p6ZPfQxTdeHCi3wsir5fw7bWflwAXV83DQgjKOFGzllPMW
	 6vhbRtn4o54sDAgJlZ2dfqlCotxyszcrMCnMIaNqdTkC37gG6qXjsSY102tVdF7ahu
	 /CZeUofGzA/uvzf4S+QkZDEBJ2a03/UW3ibOLguRCJNIakqNDDc0mp0fFQ30ezIVoI
	 sX2Sgra8MY2iw==
Date: Sun, 30 Oct 2022 20:47:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Message-ID: <Y17i8sRf4KXLFkrK@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_134753_476017_FA0393F4 
X-CRM114-Status: GOOD (  30.20  )
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

On Thu, Oct 27, 2022 at 03:02:40PM +0200, Andrew Jones wrote:
> Mostly follow the same pattern as Zicbom, but leave out the toolchain
> checks as we plan to use the insn-def framework for the cbo.zero
> instruction.

nit: I'd prefer to see a commit message that stands on it's own without
relying on someone knowing how zicbom has been wired up.

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
> +				   &cboz_blksz, &cboz_hartid);
>  	}
>  
> -	if (probed_block_size)
> -		riscv_cbom_block_size = probed_block_size;
> +	if (cbom_blksz)
> +		riscv_cbom_block_size = cbom_blksz;

As in patch 1, can you stick with s/blksz/block_size/ please.
My poor OCD!!! Other than those minor things:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +
> +	if (cboz_blksz)
> +		riscv_cboz_block_size = cboz_blksz;
>  }
> -- 
> 2.37.3
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

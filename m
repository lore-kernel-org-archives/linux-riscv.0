Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1089ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsoZQdCCPqi8tUBgMXi32FjkpiAZA7rtptXJMdWtep4=; b=AfETUsj//kRAik
	r76ZhalCB+ffaziHnukvJdSXrM7XTu5NYiTYlGBl9FIpGsPcMlC2NK0PvcyrLWECdfzfdxxU5Bkck
	m3bxOv6U0h1uRi+WRPBUB8jPDnXO9/k+8dIEMV0OujlYlqcD12ge9hbpG2wmEpX1gu2ixDyYhdOTT
	oz5/iHRijM5551+ijiQ2s4JJhmK4JDgno5W6HfqwVNEGptCPwVzi8Jfvznktbh7ky/18UXsZqcU2t
	wNprx1ez/HjRgIOIdyMfmUh3nydQ/31LKlIbt1CcD3OrSCc1VzqVBZ0rUN0o3S+zakxzbP+mhQWqh
	tEilFDZSgF+kv1ntDbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVb4t-00FBKO-3a; Tue, 06 Sep 2022 16:05:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaab-00Eqv3-Fc
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 15:34:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D69DB81919;
	Tue,  6 Sep 2022 15:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49826C433D6;
	Tue,  6 Sep 2022 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662478450;
	bh=o/a49uaTfUrKZmJLCRxWqo1CBSpZaP5WXSyIaRv1VMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pdy5ifBOWkzESWcC4dowxoKvyj8IywBV7CQ4SRvqILh67zLNJe8FK41hRltawI280
	 oPJp+AOT73QiorIUyvMJCgFl+hCbaqh+8Fo3rLuJuITGyHjnhrNF2XQxLJ220g12RO
	 BTYgstLPjzgm+qFVNWxQIAQWRq44SvjbAd4y0aX/1L9WdikV5l/bbbv3jTK8jIioCy
	 /TNz9Zn82nbiGaz3r8PoAUXlGp6bSe9SdRBFJGP1nn02c+XEd6EJbAW+f9J+uDwAa3
	 GF82LslZWk07BaL+LgiJdzDoikUIruH4acd/z8d1AYiUf+/g/Hu5xB8p1nOFJGyf4Z
	 HVwcbfnUunsag==
Date: Tue, 6 Sep 2022 08:34:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Message-ID: <YxdocNmsC3hQGNhy@dev-arch.thelio-3990X>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <20220906074509.928865-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906074509.928865-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_083414_005256_F7F3C78C 
X-CRM114-Status: GOOD (  29.79  )
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

On Tue, Sep 06, 2022 at 09:45:09AM +0200, Andrew Jones wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This fixes two issues: I truncated the warning's hart ID when porting to
> the 64-bit hart ID code, and the original code's warning handling could
> fire on an uninitialized hart ID.
> 
> The biggest change here is that riscv_cbom_block_size is no longer
> initialized, as IMO the default isn't sane: there's nothing in the ISA
> that mandates any specific cache block size, so falling back to one will
> just silently produce the wrong answer on some systems.  This also
> changes the probing order so the cache block size is known before
> enabling Zicbom support.
> 
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> [Rebased on Anup's move patch and applied Conor Dooley's and Heiko
>  Stuebner's changes.]
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

I can confirm that that the second issue appears to be resolved, as I
no longer see the instance of -Wsometimes-initialized from clang:

https://github.com/ClangBuiltLinux/linux/issues/1689

Build-tested-by: Nathan Chancellor <nathan@kernel.org>

Hopefully this can be queued up for 6.0.

> ---
>  arch/riscv/errata/thead/errata.c |  1 +
>  arch/riscv/kernel/setup.c        |  2 +-
>  arch/riscv/mm/cacheflush.c       | 21 +++++++++++----------
>  arch/riscv/mm/dma-noncoherent.c  |  2 ++
>  4 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 202c83f677b2..96648c176f37 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -37,6 +37,7 @@ static bool errata_probe_cmo(unsigned int stage,
>  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>  		return false;
>  
> +	riscv_cbom_block_size = L1_CACHE_BYTES;
>  	riscv_noncoherent_supported();
>  	return true;
>  #else
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 95ef6e2bf45c..2dfc463b86bb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
>  	setup_smp();
>  #endif
>  
> -	riscv_fill_hwcap();
>  	riscv_init_cbom_blocksize();
> +	riscv_fill_hwcap();
>  	apply_boot_alternatives();
>  }
>  
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 336c5deea870..e5b087be1577 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -89,39 +89,40 @@ void flush_icache_pte(pte_t pte)
>  }
>  #endif /* CONFIG_MMU */
>  
> -unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +unsigned int riscv_cbom_block_size;
>  
>  #ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void)
>  {
>  	struct device_node *node;
> +	unsigned long cbom_hartid;
> +	u32 val, probed_block_size;
>  	int ret;
> -	u32 val;
>  
> +	probed_block_size = 0;
>  	for_each_of_cpu_node(node) {
>  		unsigned long hartid;
> -		int cbom_hartid;
>  
>  		ret = riscv_of_processor_hartid(node, &hartid);
>  		if (ret)
>  			continue;
>  
> -		if (hartid < 0)
> -			continue;
> -
>  		/* set block-size for cbom extension if available */
>  		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>  		if (ret)
>  			continue;
>  
> -		if (!riscv_cbom_block_size) {
> -			riscv_cbom_block_size = val;
> +		if (!probed_block_size) {
> +			probed_block_size = val;
>  			cbom_hartid = hartid;
>  		} else {
> -			if (riscv_cbom_block_size != val)
> -				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> +			if (probed_block_size != val)
> +				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>  					cbom_hartid, hartid);
>  		}
>  	}
> +
> +	if (probed_block_size)
> +		riscv_cbom_block_size = probed_block_size;
>  }
>  #endif
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index 3f502a1a68b1..d919efab6eba 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -74,5 +74,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  
>  void riscv_noncoherent_supported(void)
>  {
> +	WARN(!riscv_cbom_block_size,
> +	     "Non-coherent DMA support enabled without a block size\n");
>  	noncoherent_supported = true;
>  }
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

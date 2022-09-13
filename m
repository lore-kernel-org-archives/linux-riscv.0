Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F71C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIKY5mqtNjW4ivG5pe/SPgwvQgWSvpU6mGXvn9Kobcs=; b=RqHjRcNNBbM1jc
	wrX5u46q2qHRyiSKqz3S+qPqDbkxnyakN2etNvs1o85VZWo7XLoLz5q5O2bLnp3GWzvv+Q9wZao6a
	vkPmjFs0aKvpjIN/ua9zGKPPqyATvD7CnOIOc8frAjd0aaMRXPpe8v4CKIvFiypOglKXnw4Eetl0d
	2q2iwP7ohy7nLbEMpVYU7xmnGaxt2EJr4R/8PByDF8f1wi65XHhivyXyF8w+hffckGSuOzMayd72o
	iCrPa1Frgty5Nwnxp4cXOS9LbF3ZNwI58SQX0rIYWwvLSNx8POHpVNyFc25NvseuRQltyfZAQP3Dc
	GHZyD3Q5v84a53AgRMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2P7-005Mkk-Iz; Tue, 13 Sep 2022 09:40:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2P0-005MfY-Rk
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AA8E61345;
	Tue, 13 Sep 2022 09:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96028C433D6;
	Tue, 13 Sep 2022 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663062020;
	bh=S5297AxOJ/cGdOJl65TCvsOot0UAQTfb+PHlKU7tsnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRbZzgPme81/rIOg/ZnQDvjgNsMwG1Gum5zQCCfReapH+96ugjgTPTePrEoB3JIv1
	 BeRtLUSI82QKEwUkOwML1CCBKZ/bVDaes7nPvoNhWGrLXOmiyNktUp1Plu7ixGur0L
	 NTKAvgz6snmxKbq2cfgas7uNrd0Qf7lE1mnLP1Ahwc5TLY367zfaLwKhD0XH/UGsTy
	 6MpabUikag0gSwKWq1KAocJdFpudF+ZSZk51PzH1R71HOVoHaCM6qBOQaKF8dGnaEd
	 tYgM2bs4s7sHkiYbJPmbI8qdVtvf+Wzo0bbW/CHQlZN+t6Wh3PdnNYaSF3rI9HRB7L
	 2P05vsnM5ksfg==
Date: Tue, 13 Sep 2022 02:40:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: atishp@atishpatra.org, ajones@ventanamicro.com, anup@brainfault.org,
	conor.dooley@microchip.com, heiko@sntech.de, jrtc27@jrtc27.com,
	linux-riscv@lists.infradead.org, lkp@intel.com,
	mchitale@ventanamicro.com, palmer@rivosinc.com,
	stable@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Clean up the Zicbom block size probing
Message-ID: <YyBQASDHnbEd6aMq@dev-arch.thelio-3990X>
References: <20220912224800.998121-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220912224800.998121-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024023_001348_8BAE3A81 
X-CRM114-Status: GOOD (  32.79  )
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

On Mon, Sep 12, 2022 at 11:48:01PM +0100, Conor Dooley wrote:
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
> CC: stable@vger.kernel.org
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Heiko Stuebner <heiko@sntech.de>
> CC: Atish Patra <atishp@rivosinc.com>
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> [Conor: fixed the redefinition errors]
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Build-tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks a lot for continuing to chase this!

> ---
> Hey Palmer,
> w/ LPC etc I figure it's highly unlikely you'd have this respun
> in time to have it applied this week. I dropped all the tested
> and reviewed -by tags since this patch has been changed a fair
> bit back and forth since the tags were left. Checked it on my
> D1 to make sure nothing blew up.. if this could make this weeks
> rc, that'd be great so that the clang allmodconfig builds are
> working again.
> Conor.
> ---
>  arch/riscv/errata/thead/errata.c    |  1 +
>  arch/riscv/include/asm/cacheflush.h |  1 +
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/dma-noncoherent.c     | 23 +++++++++++++----------
>  4 files changed, 16 insertions(+), 11 deletions(-)
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
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a60acaecfeda..a89c005b4bbf 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -43,6 +43,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_RISCV_ISA_ZICBOM
> +extern unsigned int riscv_cbom_block_size;
>  void riscv_init_cbom_blocksize(void);
>  #else
>  static inline void riscv_init_cbom_blocksize(void) { }
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
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..e3f9bdf47c5f 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,7 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>  
> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +unsigned int riscv_cbom_block_size;
>  static bool noncoherent_supported;
>  
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -79,38 +79,41 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
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
>  
>  void riscv_noncoherent_supported(void)
>  {
> +	WARN(!riscv_cbom_block_size,
> +	     "Non-coherent DMA support enabled without a block size\n");
>  	noncoherent_supported = true;
>  }
> -- 
> 2.37.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

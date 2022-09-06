Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B886C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYvNg8mOPRbPn7J6vDa1MbYgEe+kjV1EKUEPeJfUQLc=; b=sJZ5NzPjosYGfV
	jB1Ky1XOB6LJkh7v/fy9NY3cyF1sry1cXhvjfOi89bmstt2z4HMhVwTK+BjJJn2TVRQuPJ5Jnve9w
	7tIzMirlBAi6qkdZE379aaAdguU8ptBIoUQLz0G6j+okSSl7KH3cXtQzeX7zM9bQec1UPuRjJ+hL6
	r0VgnKOFQpDpm5oca0/zaBa9ck+h1s6TEhKGWQqjcXmPTxny6M2HPKmmR2AAWq+rYuLy95Iz/Y0Bi
	nyeLdaJrLYy8ZjYzin0WIKtqwpfRV4fB66tCmFkWFOAgiRnXww11C/6Y3h0pp3EaIaycrE3HkS7Cr
	BkVVbtgHpJMoe7s0d6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVSE8-00ATa8-9s; Tue, 06 Sep 2022 06:38:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVSE0-00ATUP-IA
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 06:38:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id qh18so20933502ejb.7
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Ax6yJm6LatHF3n2b4lvN8fLPa9O4r8Hbx5X16qH6eo4=;
        b=G9WJ8/Q+fW7gVpv8wbCRg61Wee8eaR/gRZKz259RaL4DyJ/Z1iHwc22gUSmWZvmS/K
         52RizvPdzeMGPPn0LbrLk9hsllYNrdFZxOwME1TlN9xYubc3uIqljVOytbvIMLTz9ez/
         4UL93d9G7JhpvJlObSgtafjETEyUDeUO6iPmgI62njtgdzffYGtf+qOfBIdzhwq7uToc
         /xPfLNyd0EBEVh555IIYpAXQa/YgAolyftf3PJTOJ7HtCvWL7w5E+JwKYhOYwUqQFXX9
         npDcikLjFerjaTnQZ/LSw4b3S2IKe4hYOxXGcNt3/8YAUERDY6ixol7HUl5Q8X6G3gea
         IFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ax6yJm6LatHF3n2b4lvN8fLPa9O4r8Hbx5X16qH6eo4=;
        b=pMYp11tAsc9VEW8du1zaFZIFq2qp9nP5bOUsYNI3+Xohxj6xDfvs5AFE8U9cbEhCmY
         opgBiNxLzhEXIIcTjKRe8PvRd/ji2kfItOc9vNNDXoq6+eUoZsplIveoU/xJT3aaUXcT
         nE/nt0h+cavdjFUoQo0krZAi32k80Q/EtuYpqeOfpJUGJoIldIYZPeQFjLoxx9lbVnWr
         sXzRQnv1Gm04VSTt9cjZTJHfWhTEDFtPSEBQYU58OxycFEfkQcjGB/KCuXpmHH383uyj
         DvAumCrM7kBWTRp4V7oRCVgq4sapmwHuY2Wa9iBAvqQ11UUXLjYBM0WjE+APy6tB7vYR
         i7iw==
X-Gm-Message-State: ACgBeo0BL/wVMRIgcsmVj9/l7cWFqa+dMR3h15Gj1P/yJunIW8HUi1ZC
	Xw63usNx3yI5IWSs7NhQEH0HSt69kZkryw==
X-Google-Smtp-Source: AA6agR6Yh75VzHPeZLdsnZPvsCVBUJbGd44+5NvlNvQBlpiDx6l0JbWRZt5yZ5teOMPc6k5GEBYG/g==
X-Received: by 2002:a17:907:a058:b0:741:72ed:5606 with SMTP id gz24-20020a170907a05800b0074172ed5606mr28777081ejc.452.1662446297771;
        Mon, 05 Sep 2022 23:38:17 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0076f48f39512sm173624ejm.149.2022.09.05.23.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:38:17 -0700 (PDT)
Date: Tue, 6 Sep 2022 08:38:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor.Dooley@microchip.com,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] RISC-V: Clean up the Zicbom block size probing
Message-ID: <20220906063816.wyivlqenrh3ipdlg@kamzik>
References: <20220906062657.924852-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906062657.924852-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_233820_657013_D27C32ED 
X-CRM114-Status: GOOD (  26.81  )
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

On Tue, Sep 06, 2022 at 08:26:57AM +0200, Andrew Jones wrote:
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
> [Applied Conor Dooley's and Heiko Stuebner's changes.]
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/errata/thead/errata.c |  1 +
>  arch/riscv/kernel/setup.c        |  2 +-
>  arch/riscv/mm/dma-noncoherent.c  | 23 +++++++++++++----------
>  3 files changed, 15 insertions(+), 11 deletions(-)
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

Darn, of course this doesn't compile independently of Anup's move change.
I should have done the move first as Heiko suggested.

I'll try again by posting both Anup's move change and this patch
rebased on Anup's.

Thanks,
drew

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
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..8a49ea5ba01d 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,7 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>  
> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +static unsigned int riscv_cbom_block_size;
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
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

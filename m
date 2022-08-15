Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C20C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8L4CQmLLSWestwPe726rDsseJ1GGKjqR5WkSpxjHLE=; b=DuDc0g/XNXz3UV
	9jEiVIWxiEIe1dvrlrKktj5W3ywryIp898/ZjB8VBvfM19mJbPoHFLlugrO0K7emwFavg0eWLxP4b
	t1Yd1dA1L5zP8Fto4JKlRC/VbmBwrrkJ0EHQgQZx8vFlOZRH9zhRRZRocK2KLDA0XQMrmVeCiRwRv
	GbJDv3dnv/PiuC8Z5EGWVMX+iUU56BOu/cLX7jmVtjSquIrw30l+jDk31KcgK3IfSeFe76yTKXtaA
	lfvbYUVkI78RSreFjcIoajQZBGyJOA8iL1lKK4LwOlHTcGIM3tU3v/K7Q+04bLGA/KhLuB9edADEb
	FaVKNEErWnF8T+MFWcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcO8-0017GJ-51; Mon, 15 Aug 2022 15:52:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcCp-000zUS-JQ
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 15:40:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0DBD61119;
	Mon, 15 Aug 2022 15:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07BBC433D6;
	Mon, 15 Aug 2022 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660578041;
	bh=kPtbQ65lpd7sMhX39eVsqVHxLDidqIVwHkotLDx1XPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5HQKBFm0fsdUMTfIxpYuqF2OYeHy4WJcZyQxa3u+ZbfdEJFbsTUBWnB/a2ybNGx6
	 ZoSFWJamfiQape+4kAJSHqL+J0mkYF1S75EDtKPPnmwxJuNCZLu5DVIbo5UfoOKJTi
	 WDGz676NhzHeRxpAnbsnnemisYJ4rTC0hAalNGlpgiwSMU52S2gdR8go999TNZxyc/
	 zKeOrNNoQCDAE+cxzN50yGSGUHYZFH3Mng7x3JL8H9+XNlzUq/SbqGGqfD8Eq9GjSU
	 o1pkhFBSNUQPmrZVgrtMz9yEyod3oYMubjuPSW+FyvceNF0yKE8aGYT0fkPxGtPV7+
	 C1ujBBaQ3o9/g==
Date: Mon, 15 Aug 2022 08:40:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Message-ID: <Yvpo96wal40ROTsX@dev-arch.thelio-3990X>
References: <20220812154010.18280-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220812154010.18280-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_084043_773603_14340FD8 
X-CRM114-Status: GOOD (  30.24  )
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

Hi Palmer,

On Fri, Aug 12, 2022 at 08:40:10AM -0700, Palmer Dabbelt wrote:
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
> 
> ---
> 
> Changes since v1 <https://lore.kernel.org/all/20220812142400.7186-1-palmer@rivosinc.com/>:
> 
> * Everything but the unsigned long cbom_hartid.
> ---
>  arch/riscv/kernel/setup.c       |  2 +-
>  arch/riscv/mm/dma-noncoherent.c | 22 ++++++++++++----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
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
> index cd2225304c82..3aa3572715d6 100644
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
> @@ -80,37 +80,39 @@ void riscv_init_cbom_blocksize(void)
>  {
>  	struct device_node *node;
>  	int ret;
> -	u32 val;
> +	u32 val, probed_block_size;
>  
> +	probed_block_size = 0;
>  	for_each_of_cpu_node(node) {
> -		unsigned long hartid;
> -		int cbom_hartid;
> +		unsigned long hartid, cbom_hartid;
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
> +			if (probed_block_size != val)
>  				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",

                                                                  ^ %lu?

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
> +	WARN_ON(!riscv_cbom_block_size,
> +	        "Non-coherent DMA support enabled without a block size\n");
>  	noncoherent_supported = true;
>  }
> -- 
> 2.34.1

For what it's worth, while this should address the uninitialized
cbom_hartid at runtime (from the quick glance I gave it), it doesn't
address the compile time warning. I am not sure how to make it clear to
clang that the if statement will be executed during the first loop
iteration because probed_block_size is initialized to zero...
Additionally, it appears that WARN() is the right macro, not WARN_ON()
and an '#include <asm/bug.h>' is needed.

  arch/riscv/mm/dma-noncoherent.c:104:6: error: variable 'cbom_hartid' is uninitialized when used here [-Werror,-Wuninitialized]
                                          cbom_hartid, hartid);
                                          ^~~~~~~~~~~
  include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
          printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                             ^~~~~~~~~~~
  include/linux/printk.h:464:60: note: expanded from macro 'printk'
  #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                             ^~~~~~~~~~~
  include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
                  _p_func(_fmt, ##__VA_ARGS__);                           \
                                  ^~~~~~~~~~~
  arch/riscv/mm/dma-noncoherent.c:87:36: note: initialize the variable 'cbom_hartid' to silence this warning
                  unsigned long hartid, cbom_hartid;
                                                   ^
                                                    = 0
  arch/riscv/mm/dma-noncoherent.c:116:10: error: too many arguments provided to function-like macro invocation
                  "Non-coherent DMA support enabled without a block size\n");
                  ^
  include/asm-generic/bug.h:121:9: note: macro 'WARN_ON' defined here
  #define WARN_ON(condition) ({                                           \
          ^
  arch/riscv/mm/dma-noncoherent.c:115:2: error: use of undeclared identifier 'WARN_ON'
          WARN_ON(!riscv_cbom_block_size,
          ^
  3 errors generated.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

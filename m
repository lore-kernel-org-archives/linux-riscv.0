Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 02:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHih72YzG0DXHOivgluLv7RcGkQoqk42X6Odl9cQfwE=; b=zjLdDs6Ygs5T3X
	r9adZaRtsmttNTej1264KyNX+OJ1YwuZ0FPmC7hGhy2rYW8cwPOyp+goc+lP03/t5gfbCoX5adwEP
	DO3NU3R7z1o9swfzf3Og4FVXFhBzbCPzrfkm9QyWNgmehFeztUUfaPZVvqqbo37eMf8+3FRMr/JHG
	amS86izC8NQjoLHoxRQyy9Z196MXYuL8SiNiqDK+PhwclCHDhkIIIq9Tk6/UhDRdsb+e3Cv/XtnXP
	bU8SR/SlVdCDmFsRVPyHfD2dDtQoHfgwi7CQe1ghabNdUdYuAA61me1cbnP09Rz2UX79OHf4YQpKs
	uPyzU/j7WLojTEsJXSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhPF-004LSq-EJ; Fri, 21 Oct 2022 02:05:05 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhPC-004LRV-Ij
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 02:05:04 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-131dda37dddso1936043fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 19:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtW26tNJi2plHYwK2h9n3QRnfHabzcCc19G/v2p4e10=;
        b=SDBtb20oE8y7eKqRMh8riQue5ykaEPpFzIduhEOG1xlhPjssTLS35eiETvN5zIn39g
         lJgEzSfHFmzKThri/JX6BbyX4mF+xppuLtZZ808yuYxMmdQ8c5aw/jdHyhBcCITErkfM
         4a22nYzxS1uAjuvyF7lthy9J8MaDqA5ApRpJfR771wyKrMyKN0uqDVRO/lT5gyT1Nmyt
         Rh/MhlHDlKQS5h6TjnOQtaGA626WyvI2d54n0ByHRLvcm00OXWdVS56rWBIFw/YrvMSd
         kkMa4htnPbNNBgVZNd18ZcncbMET17cHwlGHc08FqqN4mk1Cchow24ZrObQAUWosHGz4
         jbXg==
X-Gm-Message-State: ACrzQf2T50hx6RZkxC9nsncVCwFJD3HfqxNk6FHPW/G58GYj3IyWLFbb
	6F3qYKlJ++MtyfK1XYqCoA==
X-Google-Smtp-Source: AMsMyM5LTuz/GmwOzCctHS9o8ZK1b/pNNGI4hDlv65UEoxwYHaOF+90LSP0uzUBQQtEaDH2FZicxEA==
X-Received: by 2002:a05:6870:eca0:b0:133:34b:ebdf with SMTP id eo32-20020a056870eca000b00133034bebdfmr10680784oab.14.1666317900416;
        Thu, 20 Oct 2022 19:05:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e1-20020a9d63c1000000b006618bbede10sm565732otl.53.2022.10.20.19.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 19:04:59 -0700 (PDT)
Received: (nullmailer pid 2171392 invoked by uid 1000);
	Fri, 21 Oct 2022 02:05:00 -0000
Date: Thu, 20 Oct 2022 21:05:00 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.co>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
Message-ID: <20221021020500.GA2157489-robh@kernel.org>
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_190502_658554_E6AB4708 
X-CRM114-Status: GOOD (  27.62  )
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

On Wed, Oct 19, 2022 at 11:02:42PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the AX45MP core, cache coherency is a specification option so it may
> not be supported. In this case DMA will fail. As a workaround, firstly we
> allocate a global dma coherent pool from which DMA allocations are taken
> and marked as non-cacheable + bufferable using the PMA region as specified
> in the device tree. Synchronization callbacks are implemented to
> synchronize when doing DMA transactions.
> 
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
> 
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
> 
> This patch adds support to configure the memory attributes of the memory
> regions as passed from the l2 cache node and exposes the cache management
> ops.
> 
> More info about PMA (section 10.3):
> http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> 
> This feature is based on the work posted [0] by Vincent Chen
> <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
> 
> [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/include/asm/cacheflush.h    |   8 +
>  arch/riscv/include/asm/errata_list.h   |   2 +
>  arch/riscv/mm/dma-noncoherent.c        |  20 ++
>  drivers/soc/renesas/Kconfig            |   5 +
>  drivers/soc/renesas/Makefile           |   4 +
>  drivers/soc/renesas/rzf/Kconfig        |   6 +
>  drivers/soc/renesas/rzf/Makefile       |   3 +
>  drivers/soc/renesas/rzf/ax45mp_cache.c | 431 +++++++++++++++++++++++++

How many cache drivers do we have around now? I've seen a few bindings 
go by. I'm guessing it is time to stop putting the drivers in the
drivers/soc/ dumping ground.
 
>  drivers/soc/renesas/rzf/ax45mp_sbi.h   |  29 ++
>  9 files changed, 508 insertions(+)
>  create mode 100644 drivers/soc/renesas/rzf/Kconfig
>  create mode 100644 drivers/soc/renesas/rzf/Makefile
>  create mode 100644 drivers/soc/renesas/rzf/ax45mp_cache.c
>  create mode 100644 drivers/soc/renesas/rzf/ax45mp_sbi.h
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index 8a5c246b0a21..40aa790be9a3 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -65,6 +65,14 @@ static inline void riscv_noncoherent_supported(void) {}
>  #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1UL
>  #define SYS_RISCV_FLUSH_ICACHE_ALL   (SYS_RISCV_FLUSH_ICACHE_LOCAL)
>  
> +#ifdef CONFIG_AX45MP_L2_CACHE
> +void ax45mp_cpu_dma_inval_range(void *vaddr, size_t end);
> +void ax45mp_cpu_dma_wb_range(void *vaddr, size_t end);
> +
> +#define ALT_CMO_OP(_op, _start, _size, _cachesize)	\
> +		   _op(_start, _size)
> +#endif
> +
>  #include <asm-generic/cacheflush.h>
>  
>  #endif /* _ASM_RISCV_CACHEFLUSH_H */
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 19a771085781..d9cbf60c3b65 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -89,6 +89,7 @@ asm volatile(ALTERNATIVE(						\
>  #define ALT_THEAD_PMA(_val)
>  #endif
>  
> +#ifdef CONFIG_ERRATA_THEAD_CMO
>  /*
>   * dcache.ipa rs1 (invalidate, physical address)
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> @@ -143,5 +144,6 @@ asm volatile(ALTERNATIVE_2(						\
>  	: "a0")
>  
>  #endif /* __ASSEMBLY__ */
> +#endif
>  
>  #endif
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index b0add983530a..5270acca6766 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -24,13 +24,25 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  
>  	switch (dir) {
>  	case DMA_TO_DEVICE:
> +#ifdef CONFIG_ERRATA_THEAD_CMO
>  		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +#elif CONFIG_AX45MP_L2_CACHE
> +		ALT_CMO_OP(ax45mp_cpu_dma_wb_range, vaddr, size, 0x0);
> +#endif

How do you support more than one platform in a build?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

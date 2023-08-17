Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7ACEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YT/dwLnu5LdTBhvcGDMhEBRI3IEMZ+S6BXJIKUly10c=; b=XxsOCsr1Ub0OG3
	1lkd85nuwcXAOwuQ7XGWy/mnKVqyE48r6M5x60HAFfAwo1BzNLzqAK4ZJmoVxiRyuz5AbaEEH3Lx1
	nKOHbU/WNGYp8/6tqQftbw72VGsk69Mqb2v1Ny5UNbnGP2sYW2pno5GXb2WKuBiGXpkS6LaLBqPD/
	EqWKDsFYTtBNCnnAN3+CJDwhqJqHt/OilKVZ5FX/8JMyZ8pCyU97PAAkZ/P3E7/ilg/ii+YAyPEqz
	33ggFWC4/MfpA9bTHRW+1MWDAe23VZAqRM3D9mxo7zX3HJO/ygvdrwmxDaVtj5fhOecym3NloKzrB
	9ufFGsy5EZ4j+Ts3xmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWae5-006DaY-1z;
	Thu, 17 Aug 2023 10:54:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWae1-006DYO-2h
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 10:54:28 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B6B23F20D
	for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692269660;
	bh=tfrBTn5aw9WBFpulIl2FkiiYeLCLcY+Q8liv0C3YyXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=q20P3mcXBddMpip/1zThvM8WsBohYqJaFpqQbo6mi05M8+e0Zsq0j2lxjlmbYBiQz
	 RcfJkz7GYjp/ncSAEMPowA4I/mNOGz5sw4A4qgW66KAM+XHF+QaouwIwmsI8tqrV4t
	 YAIhsjZ4aCmgCPqOstcZf8+wOCAlIJ9ffByrJpvi2TsmMeAOZn/A/6M2IbBrQCg/ic
	 udoR9y55joow3/S59mczmzKJegODwZ02Hg/v8PLdRJTA9BaLnQD907K9DdWCpxzFjE
	 zt7m+a8kpr3jyZm567h9+R4RncOBPFrQkGAy2crrqyf4ssrY5W8tI6hdwFCbUEhnCR
	 8H0xYtyyvQwuw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-40ff829c836so7207541cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 03:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692269659; x=1692874459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfrBTn5aw9WBFpulIl2FkiiYeLCLcY+Q8liv0C3YyXU=;
        b=hT3UWmr+q2mA3vBPBMmtSOiXARXLT41NPiFrzmGqzy7/kS2P6Au8gx5YkNKrtrnQa3
         eqJtD6nPqRdfAQy1Eh899BTCB5AUMsYU+IplO/WK2GtqCQhZGVWwQGsEOsKJmnw7+bCS
         8ZqJU7zUA3Iqf7hKG3hajzunHtaXW4qkge7oQ3k7/h3fFIEagWtDbiQYMicMZ6UVT0Je
         5Q1AY0CNWpmlnSNBNmA8SxeZCR8EVGY+f1GGGSfCXo5zaNRCn2uB8d4DNbMV/V7Sg25C
         4aNIg70G/ZbBCX759qYgOJ2jc5zOZKUuTQ7xhLkYt0eJnA3Qdhzalw/8uPecUz9t+v6E
         4qZA==
X-Gm-Message-State: AOJu0YwZ+S5PDrLwnW2IngxbMVOunAWv+QFDFVr4lMVGyjK9f6UXT1wT
	9Yu99yR4o/bzdm7wLCUgAsYrMYflb4UZ5nn5lpmYqJS4BJH9/rkJTKeXMPGvIfgXD1rOQuxgRBL
	q6XA+tM5MuvmwMMNJ9TmWZD3xr51jurDvab+X0RkUY+PlfDFkSWlagachVN6q4Q==
X-Received: by 2002:ac8:5bc2:0:b0:3fd:ed14:6eb9 with SMTP id b2-20020ac85bc2000000b003fded146eb9mr3260422qtb.11.1692269659672;
        Thu, 17 Aug 2023 03:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv1MnQZQeMPx3fkfoeGq/Y4/E4/RysIhE1Eje7mgubqeP/CrgeIQz2wuLw2UolItH+H3bHH+0hmKY17ztU+vA=
X-Received: by 2002:ac8:5bc2:0:b0:3fd:ed14:6eb9 with SMTP id
 b2-20020ac85bc2000000b003fded146eb9mr3260405qtb.11.1692269659432; Thu, 17 Aug
 2023 03:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230814205719.79647-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230814205719.79647-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230814205719.79647-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 17 Aug 2023 12:54:02 +0200
Message-ID: <CAJM55Z8mx5RNq5PVcBPqvw22qAqbJXjcYga_fvYdJe_LZynE3w@mail.gmail.com>
Subject: Re: [PATCH v11 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_035426_308751_A30C8754 
X-CRM114-Status: GOOD (  31.31  )
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

On Mon, 14 Aug 2023 at 23:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce support for nonstandard noncoherent systems in the RISC-V
> architecture. It enables function pointer support to handle cache
> management in such systems.
>
> This patch adds a new configuration option called
> "RISCV_NONSTANDARD_CACHE_OPS." This option is a boolean flag that
> depends on "RISCV_DMA_NONCOHERENT" and enables the function pointer
> support for cache management in nonstandard noncoherent systems.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
> ---
> v10 -> v11
> * Changed data type of size from unsigned long to size_t
> * Reworded doc for struct riscv_cache_ops
>
> v9 -> v10
> * Added __ro_after_init compiler attribute for noncoherent_cache_ops
> * Renamed clean -> wback
> * Renamed inval -> inv
> * Renamed flush -> wback_inv
>
> v8 -> v9
> * New patch
> ---
>  arch/riscv/Kconfig                       |  7 ++++
>  arch/riscv/include/asm/dma-noncoherent.h | 28 +++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c          | 43 ++++++++++++++++++++++++
>  arch/riscv/mm/pmem.c                     | 13 +++++++
>  4 files changed, 91 insertions(+)
>  create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f52dd125ac5e..a629d383affb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -269,6 +269,13 @@ config RISCV_DMA_NONCOHERENT
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>         select DMA_DIRECT_REMAP
>
> +config RISCV_NONSTANDARD_CACHE_OPS
> +       bool
> +       depends on RISCV_DMA_NONCOHERENT
> +       help
> +         This enables function pointer support for non-standard noncoherent
> +         systems to handle cache management.
> +
>  config AS_HAS_INSN
>         def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
>
> diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
> new file mode 100644
> index 000000000000..2fc43f73f766
> --- /dev/null
> +++ b/arch/riscv/include/asm/dma-noncoherent.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +#ifndef __ASM_DMA_NONCOHERENT_H
> +#define __ASM_DMA_NONCOHERENT_H
> +
> +#include <linux/dma-direct.h>
> +
> +/*
> + * struct riscv_nonstd_cache_ops - Structure for non-standard CMO function pointers

It seems you updated the name in this comment..

> + *
> + * @wback: Function pointer for cache writeback
> + * @inv: Function pointer for invalidating cache
> + * @wback_inv: Function pointer for flushing the cache (writeback + invalidating)
> + */
> +struct riscv_cache_ops {

..but not the actual struct. I don't have any opinion on which is the
best name, but they should probably match.

> +       void (*wback)(phys_addr_t paddr, size_t size);
> +       void (*inv)(phys_addr_t paddr, size_t size);
> +       void (*wback_inv)(phys_addr_t paddr, size_t size);
> +};
> +
> +extern struct riscv_cache_ops noncoherent_cache_ops;
> +
> +void riscv_noncoherent_register_cache_ops(const struct riscv_cache_ops *ops);
> +
> +#endif /* __ASM_DMA_NONCOHERENT_H */
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index b6a1e9cc9339..853446525a19 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -9,13 +9,26 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/mm.h>
>  #include <asm/cacheflush.h>
> +#include <asm/dma-noncoherent.h>
>
>  static bool noncoherent_supported __ro_after_init;
>
> +struct riscv_cache_ops noncoherent_cache_ops __ro_after_init = {
> +       .wback = NULL,
> +       .inv = NULL,
> +       .wback_inv = NULL,
> +};
> +
>  static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         void *vaddr = phys_to_virt(paddr);
>
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +       if (unlikely(noncoherent_cache_ops.wback)) {
> +               noncoherent_cache_ops.wback(paddr, size);
> +               return;
> +       }
> +#endif
>         ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  }
>
> @@ -23,6 +36,13 @@ static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
>         void *vaddr = phys_to_virt(paddr);
>
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +       if (unlikely(noncoherent_cache_ops.inv)) {
> +               noncoherent_cache_ops.inv(paddr, size);
> +               return;
> +       }
> +#endif
> +
>         ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  }
>
> @@ -30,6 +50,13 @@ static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
>  {
>         void *vaddr = phys_to_virt(paddr);
>
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +       if (unlikely(noncoherent_cache_ops.wback_inv)) {
> +               noncoherent_cache_ops.wback_inv(paddr, size);
> +               return;
> +       }
> +#endif
> +
>         ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
>  }
>
> @@ -49,6 +76,13 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>         void *flush_addr = page_address(page);
>
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +       if (unlikely(noncoherent_cache_ops.wback_inv)) {
> +               noncoherent_cache_ops.wback_inv(page_to_phys(page), size);
> +               return;
> +       }
> +#endif
> +
>         ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
>  }
>
> @@ -74,3 +108,12 @@ void riscv_noncoherent_supported(void)
>              "Non-coherent DMA support enabled without a block size\n");
>         noncoherent_supported = true;
>  }
> +
> +void riscv_noncoherent_register_cache_ops(const struct riscv_cache_ops *ops)
> +{
> +       if (!ops)
> +               return;
> +
> +       noncoherent_cache_ops = *ops;
> +}
> +EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
> diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
> index 089df92ae876..c5fc5ec96f6d 100644
> --- a/arch/riscv/mm/pmem.c
> +++ b/arch/riscv/mm/pmem.c
> @@ -7,15 +7,28 @@
>  #include <linux/libnvdimm.h>
>
>  #include <asm/cacheflush.h>
> +#include <asm/dma-noncoherent.h>
>
>  void arch_wb_cache_pmem(void *addr, size_t size)
>  {
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +       if (unlikely(noncoherent_cache_ops.wback)) {
> +               noncoherent_cache_ops.wback(virt_to_phys(addr), size);
> +               return;
> +       }
> +#endif
>         ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
>  }
>  EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
>
>  void arch_invalidate_pmem(void *addr, size_t size)
>  {
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +       if (unlikely(noncoherent_cache_ops.inv)) {
> +               noncoherent_cache_ops.inv(virt_to_phys(addr), size);
> +               return;
> +       }
> +#endif
>         ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
>  }
>  EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
> --
> 2.34.1
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA171C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7QXaP0keDL5WNI8iL3wXb8px1WMfCASYMm67v7A+kk=; b=L4We3MUfclHqKx
	9z6CsAldc0kBfpH16VZtyriO2bXoLutUws51SCzZ6b0VmbJC4jyoZAu819nOlnzHt2JshBkuQregu
	CSxZhry5wDLB5vHOCqmbuq0EDcrxDqQ5gueV7uKay/0eXZ9ggYDWzfgQc6RCExIvrlc1vfns8nN/m
	ohzkZvw/9vISrsphOFMj2d66NSJ70m+BAd6eoKcOhTiPT+F18PLrCKlesTnH4ZNBpZuh6FYdU9nmP
	+auPVbaMtYAlR5oMI6xptNvJfQAqKopx8JLO0wqL5AGueEAgv3kLXNF7z5fWyBbGy/kkYk2beoD3u
	n+Q2QUulUQK/HSzzvZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ9Zs-0034Xf-14;
	Thu, 24 Aug 2023 12:36:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ9Zn-0034UY-1I
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 12:36:43 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DD2403F22E
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692880594;
	bh=JoJT4a5LMoBewyzrwMs8F7Ht2z6jukDla6MBC2nVmeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tt9U8NCGH/ZEPWLDxP5ffsfAVEqkGIx39gAghSYjKbyfrnYh+r2U0xfZkVqIw5KMr
	 HfdBgoLDMj3hKMJG1OuIZpVqA8f+Tcuv5DSGwhrvCiNfzzMJKzkhtZmwG2dZ8AcPRU
	 J5vQQH5pcJ5tPIYOJmwcesohGKb8yifUsL8E0lpvQ5/lOapf3iJptZfLKyUhJtm+Jf
	 v15mw6iYEeO6gjWNqn8A+uLsB8Oj6XZr8JWygvBJjDhq0vFnWl4gghNrK7h3JFDLpe
	 DcOhsx+RfWiRMk1VxuOdN7dBa3WTktSCC9enWGvXkW66CP5W1ZM2Vj7+Q1KxLa4QX9
	 sTVfhQHgn02LQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-40ffb4530ddso70401401cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 05:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692880593; x=1693485393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoJT4a5LMoBewyzrwMs8F7Ht2z6jukDla6MBC2nVmeI=;
        b=fHXtTLP3632CnNhyeBocUgepL6ryd9nVzpkcd3fzJQJbzSCtagv46QGPF+UNzIiArC
         uF5yPtg14ePWfyTRdaI+N1zsR91Y44Bpk1bbXfBCkZvz0n9sfdQQ6/QJdYxuHSJOK3p7
         U8E3j7QsPjiF2+6WB6M+yytzAT29jLAz9o7w6VO6ewo7XKZzDEWrSgTr7e4mUou0m6YC
         VKff9qo3NMuiRB9otCJ4Ib2DZXwg6T+gQoBkVwW7EXf9W7d2omvi5kZmbPd/p/NAxNEN
         XLSAl3bWNPLfrvHR0ntqZSC5kra5pO8ofmFuoJqXjfkkUZH4bOVefSYP71Txvr0i0KEg
         UJXg==
X-Gm-Message-State: AOJu0Yw23ct6wINoRkAwU4pF91QGc9w16Q3272v89Msei5d6ARWDQc07
	t231gAkHCIbFC3V83/STQgGSqWspP8evIcVohf6RvZ6NOmpfjcwTJTATbPy6mk6PyoUrj7ckyWK
	T3MlFv9fBzzKyhT4MiRHXaSwhSmtscHFkDy4w6fF+PfdDE1idGlX5i5npdGSXOw==
X-Received: by 2002:a05:622a:2c2:b0:410:ac5a:e7b with SMTP id a2-20020a05622a02c200b00410ac5a0e7bmr5424885qtx.53.1692880593288;
        Thu, 24 Aug 2023 05:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+g+on5r/DtbY/oKVNkl5O7FS0UGCLx3I2RrRhwtFxoQDMeLCvtJe76K9ry9E2/afidK4c+yYzV7snrCuU6kQ=
X-Received: by 2002:a05:622a:2c2:b0:410:ac5a:e7b with SMTP id
 a2-20020a05622a02c200b00410ac5a0e7bmr5424861qtx.53.1692880592997; Thu, 24 Aug
 2023 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230818135723.80612-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230818135723.80612-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 24 Aug 2023 14:36:16 +0200
Message-ID: <CAJM55Z-9jUze3hjAeK+J1GQ1fSz0u3Lk=Y=cJfzi+wPHswsTHw@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] riscv: mm: dma-noncoherent: nonstandard cache
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
X-CRM114-CacheID: sfid-20230824_053639_787639_FC74420F 
X-CRM114-Status: GOOD (  28.52  )
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

On Fri, 18 Aug 2023 at 15:57, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
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

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com> #
on the StarFive JH7100

> ---
> v11 -> v12
> * Renamed struct riscv_cache_ops -> struct riscv_nonstd_cache_ops
>
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
> index 000000000000..312cfa0858fb
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
> + *
> + * @wback: Function pointer for cache writeback
> + * @inv: Function pointer for invalidating cache
> + * @wback_inv: Function pointer for flushing the cache (writeback + invalidating)
> + */
> +struct riscv_nonstd_cache_ops {
> +       void (*wback)(phys_addr_t paddr, size_t size);
> +       void (*inv)(phys_addr_t paddr, size_t size);
> +       void (*wback_inv)(phys_addr_t paddr, size_t size);
> +};
> +
> +extern struct riscv_nonstd_cache_ops noncoherent_cache_ops;
> +
> +void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops);
> +
> +#endif /* __ASM_DMA_NONCOHERENT_H */
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index 06b8fea58e20..a4f3f37859ae 100644
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
> +struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init = {
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
> @@ -95,6 +122,13 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
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
> @@ -120,3 +154,12 @@ void riscv_noncoherent_supported(void)
>              "Non-coherent DMA support enabled without a block size\n");
>         noncoherent_supported = true;
>  }
> +
> +void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops)
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=wXHl=NI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF44FC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 03:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59934600D3
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 03:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59934600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ2LvZybfgtbpaNwg+o6Eo8VbYUkaj7XUoUrAEIQuz0=; b=SggmOGAdM2G6Ja
	dPGPGla3QNFy5zeqNwjPdn4MVAdYNoOCasBOstw1iXbenfZesIwKB9as8zcoLQk2t60m1K7mJE2Cs
	sJkwsmBfPNgIFTEbKDQ2sNmRb3HXkrVbr8czmQPuE0FjWtv4Fnnbn4sNl1SgjPsQLJyg7UC41nl9b
	6+0idEPVgQg9zxHXtuuGh2DEQ3ZtsxdFKSpmKvKoxz4xGLdxjZiR2xf7m3hA8jqYaPxz94nRwq7ts
	YshTq/X453Wa3LJRolxsx4HBkGs6R0eciPC6VXmJT/Pc+cY8z0zKR9toIhNovDcIs6Zt+EkBWEsKk
	Xdt4nRjDEFWdNvJK0zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpxW-000yp0-LI; Tue, 17 Aug 2021 03:40:14 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFpiQ-000w9I-Ar
 for linux-riscv@lists.infradead.org; Tue, 17 Aug 2021 03:24:42 +0000
Received: by mail-yb1-xb29.google.com with SMTP id p4so36949619yba.3
 for <linux-riscv@lists.infradead.org>; Mon, 16 Aug 2021 20:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R7t78EbJ4SBQR4PW9PP+EHALfMTimXWJ4a8o/k9vg3E=;
 b=TvFFwtmlL3L2+ir/JLvkG9HSbp6wG0WN7eoWHjuvbqXI/776osypQlgOrDrJUXLFjL
 94vLmlXhpIhhPlKhhiwszEk5kK6XzKmgsMfM/A3jvpMEuqbVyeX3vxyGQeKdQZFR3yr3
 Ioj8WJTKLQsxO2rclDVfBKJYXSWlDN3Tu90wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R7t78EbJ4SBQR4PW9PP+EHALfMTimXWJ4a8o/k9vg3E=;
 b=hIhOtuxeEfQnR+qqZHct0R0Kjw33RDHiNv6cTLcpGbWJ7M9N11kC24kJW8nKm/GXuJ
 8LqRIfWhzbe7JhphR33zPoCF2QrQtsPbG+cohirZ/Q2c5FZ2NrctU0dU7LEbDOLkyGa7
 +ay2XF+wZlOsUBO4IQ3pT9glnQwdoA6UqI4+dHctH2xlLahlGIT+HgoH34a8VVzgwXIN
 MOHIcMdJTHbvXDhoiUKvjoiEz+cPF7J/3kIEo3nYneXo4shyowZaZnTcj6On/kpHubcL
 S2YINn0U4eXKKi4Ig82eDHx8aM+qAOP3cGNt71I8CPCnwHqUUXtfuISe8M+qV0Abul1Z
 x6YQ==
X-Gm-Message-State: AOAM5311I9Qhio0yv0vPtq9PKmXaAq13SwcWx++WKhwXH3YiHuUwYWlD
 7mj7bE2FM+OsKhdMFwkgjMTmxlOvyAmPXICh1YIx
X-Google-Smtp-Source: ABdhPJzKYOIuc7NAVJ7T2p4GvCqFkDmXaCHT1oHt/jMQX6BHv/wp7fy0gQ89E1PH6Sc5hPjbcFazBGEGNlpJr4nUvig=
X-Received: by 2002:a25:3f85:: with SMTP id m127mr1773427yba.21.1629170676840; 
 Mon, 16 Aug 2021 20:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-2-atish.patra@wdc.com>
 <CAJF2gTT+zS=ySrmQUzVe7hf56E2K7XoGjzMyeaH5oFPUNwFqZA@mail.gmail.com>
In-Reply-To: <CAJF2gTT+zS=ySrmQUzVe7hf56E2K7XoGjzMyeaH5oFPUNwFqZA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 16 Aug 2021 20:24:26 -0700
Message-ID: <CAOnJCU+Sebr-3zt-xy9F6hGb8qj30QsH_SQvEkrvWhw6sVmbcw@mail.gmail.com>
Subject: Re: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@linux.alibaba.com>, 
 Frank Rowand <frowand.list@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, 
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Tobias Klauser <tklauser@distanz.ch>, Robin Murphy <robin.murphy@arm.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_202438_495766_71E6F7F5 
X-CRM114-Status: GOOD (  33.25  )
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

On Mon, Aug 16, 2021 at 6:48 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Sat, Jul 24, 2021 at 5:40 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > To facilitate streaming DMA APIs, this patch introduces a set of generic
> > cache operations related dma sync. Any platform can use the generic ops
> > to provide platform specific cache management operations. Once the
> > standard RISC-V CMO extension is available, it can be built on top of it.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
> >  arch/riscv/mm/Makefile                   |  1 +
> >  arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
> >  3 files changed, 86 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
> >  create mode 100644 arch/riscv/mm/dma-noncoherent.c
> >
> > diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
> > new file mode 100644
> > index 000000000000..5bdb03c9c427
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/dma-noncoherent.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#ifndef __ASM_RISCV_DMA_NON_COHERENT_H
> > +#define __ASM_RISCV_DMA_NON_COHERENT_H
> > +
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +struct riscv_dma_cache_sync {
> > +       void (*cache_invalidate)(phys_addr_t paddr, size_t size);
> > +       void (*cache_clean)(phys_addr_t paddr, size_t size);
> > +       void (*cache_flush)(phys_addr_t paddr, size_t size);
> > +};
> I like the style like this than my previous patch which using
> sbi_call. The c906 has custom instructions that could be called in
> S-mode directly.
>

How are you going to include the custom instructions in the upstream kernel ?

> Hope the patch could be soon merged, after correct the
> DMA_FROM/TO_DEVICE/BIDIRECTIONAL and alternatives ops_set.
>
> > +
> > +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
> > +#endif
> > +
> > +#endif
> > diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> > index 7ebaef10ea1b..959bef49098b 100644
> > --- a/arch/riscv/mm/Makefile
> > +++ b/arch/riscv/mm/Makefile
> > @@ -27,3 +27,4 @@ KASAN_SANITIZE_init.o := n
> >  endif
> >
> >  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> > +obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > new file mode 100644
> > index 000000000000..2f6e9627c4aa
> > --- /dev/null
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * RISC-V specific functions to support DMA for non-coherent devices
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#include <linux/dma-direct.h>
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/libfdt.h>
> > +#include <linux/mm.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <asm/dma-noncoherent.h>
> > +
> > +static struct riscv_dma_cache_sync *dma_cache_sync;
> > +unsigned long riscv_dma_uc_offset;
> > +
> > +static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +       if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > +               dma_cache_sync->cache_invalidate(paddr, size);
> > +       else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > +               dma_cache_sync->cache_clean(paddr, size);
> > +       else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > +               dma_cache_sync->cache_flush(paddr, size);
> > +}
> > +
> > +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +       if (!dma_cache_sync)
> > +               return;
> > +
> > +       __dma_sync(paddr, size, dir);
> > +}
> > +
> > +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +       if (!dma_cache_sync)
> > +               return;
> > +
> > +       __dma_sync(paddr, size, dir);
> > +}
> > +
> > +void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> > +               const struct iommu_ops *iommu, bool coherent)
> > +{
> > +       /* If a specific device is dma-coherent, set it here */
> > +       dev->dma_coherent = coherent;
> > +}
> > +
> > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > +{
> > +       void *flush_addr = page_address(page);
> > +
> > +       memset(flush_addr, 0, size);
> > +       if (dma_cache_sync && dma_cache_sync->cache_flush)
> > +               dma_cache_sync->cache_flush(__pa(flush_addr), size);
> > +}
> > +
> > +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops)
> > +{
> > +       dma_cache_sync = ops;
> > +}
> > --
> > 2.31.1
> >
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

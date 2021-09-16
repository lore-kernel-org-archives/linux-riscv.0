Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E20EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 04:39:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A7060F70
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 04:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0A7060F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5O3oEeBJQ030DMCq5unv6+aPy4hW7Got89cxuZH/zo=; b=TS7YbUeOKWdOyl
	DBZBPZS7wrhZkaWwqhbV728z3nvZAZyYiBtBOLv5xx63TW6L9JoffHQ32P3mggNfOacseQcnRYDZ4
	4Kkb1gZrcuvJzKXB59RDz5jbvYE3FjXXuiHprkyDdnpv3OU4y/PiDPcKxGPlH4CNFzmHFFrVWON7u
	TpHBV4P+FM7/tNttGQRfaPJ1czJN91+WC++2M9zS1v86ySoR1BFS4rKxlYkKowrUw5CQ4CejHkATn
	nD99FSB3xfGtIvvItWfNEfIHxIFBxcB4t5xKytIMckyCIqFRnfnDeFk7ory1+F0PmAAF6NPhqZ4kg
	EDO7mrH+qU6bMu5c7LOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQjBU-00AJR8-LA; Thu, 16 Sep 2021 04:39:40 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQjBR-00AJPs-Tb
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 04:39:39 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id z18so10367420ybg.8
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ObPDTmZPpxAdnjCpIiAd46RqCXfB5lsbopxNimw2AIA=;
 b=N5t7V90qffEF/ZhejZl+iBxrOA9sHwERjgwzmWS5h7qdVdKU0pCnOwskRNvjv5IsAW
 t82nIlvBzHnlUO8WxoEYOy3aLivxLUC4VdaYWOQgbsfLaC9+idrFwDycT8PQHGfm4kYD
 baFSptL9j5MNf9Plt3p8I/WmjueldYPgLYwrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObPDTmZPpxAdnjCpIiAd46RqCXfB5lsbopxNimw2AIA=;
 b=LfMlCI+5ffUHCu1qVt7w3jfg51rvtmPHNDbPQGtcE3QNzm06v8ovLpRKYHDFNFI4sp
 Wf4e5PWQ9fqwLjOW2QBFBKjCOcpQrERFsNrBza57hj53JJKeYv+d12Kz5cvsLrKuqRRI
 wLlJCLypLexjVPfdEGt1XD52vUEoPAZZ0nFr0d7/3XN5qcGVlciHQdgo9lNMBz5QsH/M
 GR7LK+tQj/PSbmQHZwd7zf03YPtEZ3KdfDH3Dwq8yqUbXFO4ED6OZSMe592NGbr+LDH4
 7NTEpBOPbcNM5IcEuHoT6PbHTTJ+4Ax4lWEk66fRo3SstMSqGm6MAdHIVJiHC9b8xTdQ
 hDag==
X-Gm-Message-State: AOAM53004cm6GpVg18QxLH6IqSz9BOLsOqCNxE3B/XysysW2htM5bOPC
 6iUYOuondTgrYZKLy6QaK1Nst2hkiSrmGWTgIe3X
X-Google-Smtp-Source: ABdhPJz4i/E3+irjPi8Qhf59eg0o6TGq7n/Xy5hYwtrOOAatLAjPQqo3wDS945cVo/kelPy4rK20NZ9Vtvtmun2MIfE=
X-Received: by 2002:a25:1683:: with SMTP id 125mr4347701ybw.164.1631767170718; 
 Wed, 15 Sep 2021 21:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-4-guoren@kernel.org>
 <20210915074827.GC20024@lst.de>
 <CAJF2gTSZLieg1kYA6a0CPajPukHzwN0wvPuh4RQ-t45fciFOYA@mail.gmail.com>
In-Reply-To: <CAJF2gTSZLieg1kYA6a0CPajPukHzwN0wvPuh4RQ-t45fciFOYA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 15 Sep 2021 21:39:19 -0700
Message-ID: <CAOnJCULyEHdyr9=Ez-NxRGKow3_RbNym_wg9RcZGWv-vJ-0B9Q@mail.gmail.com>
Subject: Re: [RFC PATCH V4 3/6] RISC-V: Support a new config option for
 non-coherent DMA
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_213938_039646_A9DD869E 
X-CRM114-Status: GOOD (  24.87  )
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

On Wed, Sep 15, 2021 at 6:21 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Sep 15, 2021 at 3:48 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Sat, Sep 11, 2021 at 05:21:36PM +0800, guoren@kernel.org wrote:
> > > +     select DMA_GLOBAL_POOL
> > > +     select DMA_DIRECT_REMAP
> >
> > No need to select DMA_GLOBAL_POOL when DMA_DIRECT_REMAP is select.
> If we want to support PBMT & global_dma_pool both in riscv. Could they
> work together in arch/riscv with [1]?

We don't have to worry about it as the next version of my series will
use the simpler
dma_uncached functionality to support uncached window approach taken
by starlight socs.

I was supposed to send it sooner but got busy with PMU stuff and a bad flu :(.

>
> [1]: https://lore.kernel.org/lkml/20210818142715.GA10755@lst.de/T/
>
> >
> > Also a patch just to add a option that is not selected and won't build
> > if selected does not make sense.
> I just want to rebase on Atish's patch and append DMA_DIRECT_REMAP.
> Okay, DMA_DIRECT_REMAP & DMA_GLOBAL_POOL should be separated from the
> patch.
>
>
>
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -156,9 +156,14 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>
>   if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
>      !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
>      !dev_is_dma_coherent(dev))
>   return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
>
> + if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> +    !dev_is_dma_coherent(dev))
> + return dma_alloc_from_global_coherent(dev, size, dma_handle);
> +
>   /*
>   * Remapping or decrypting memory may block. If either is required and
>   * we can't block, allocate the memory from the atomic pools.
> @@ -255,11 +260,19 @@ void dma_direct_free(struct device *dev, size_t size,
>
>   if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
>      !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
>      !dev_is_dma_coherent(dev)) {
>   arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
>   return;
>   }
>
> + if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> +    !dev_is_dma_coherent(dev)) {
> + if (!dma_release_from_global_coherent(page_order, cpu_addr))
> + WARN_ON_ONCE(1);
> + return;
> + }
> +
> Here CONFIG_DMA_GLOBAL_POOL is independent from CONFIG_DMA_DIRECT_REMAP.
>
>   /* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>   if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
>      dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

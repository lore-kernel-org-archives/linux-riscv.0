Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B45C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 21:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7538060F59
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 21:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7538060F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu6QOUgqHMN4YB6Haism/8/WG23dguqnMM2/SZbMxog=; b=0hGD1mHTOu4bCL
	VPajwIvTDnK9wZEaCmGEZdF5Xwb94+yoxHrqyDxnnIj0FULuZLLK6sJRLc3ot18pvAMduHOfPCiv7
	XaTGag0u2HsUDnAzeTgfAL36HSwnX69No5qfDycJOAPIGOHD5MWAo4hN1S37K98+a8XEkhcZHWIIZ
	YLtEInukTGiqjtUw518TcS/r0XD2AyrqggQ1hpvWgiweXOgvTDIU8NEb1sAh2rgTsPzH1jpHKdH+o
	8/lWJmm+jg/jIGRYLRH+UfRZeGzZxOau3clz2EYgn5i2TGil4coWveZT/DalDCf/0/3E3vwIJDMWf
	W0ztU2/MKvPJdc1NOvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m88XC-00CWH7-VN; Mon, 26 Jul 2021 21:53:14 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m88X9-00CWGf-RS
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 21:53:13 +0000
Received: by mail-yb1-xb36.google.com with SMTP id f26so13642199ybj.5
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kBp8vg6yrbqOVIKTerlcVAvXP0g+WzVUYrd5yH/+QE=;
 b=XA6S+wcg4qscUKPhrHfs9id0ov3mJw7DOLhvASuXhtr999Q3C6XmfJvxjMDGwtF5yP
 /ROSFbhTi6Bo2WJ7XqA7thr54ZyRRqBxFGPRUUpQDwu5dtF1UF2mNn2XKy0/k6KPL5HO
 BWQQP5EMcW2boq2BtlUyF+Cwh1u74WAo1zqdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kBp8vg6yrbqOVIKTerlcVAvXP0g+WzVUYrd5yH/+QE=;
 b=YxdqMX21i22X2Dvtngl8tJOWmkSV2+B3EnnPbs7MhYnuFs8DAyu5+mCxNPYwvj+0jh
 stXQrZUKFD39DLkStQUCQbgNbwdMa/ZGag3UKGIbUoMVeCJKRp9x45F7a1zO7UVD+d6O
 rwukpMoy8yvNmOh7xUc36witHF0JHrEfDcx1h7uBvFn10yJFQEnJt2oXhdi23yUvuPjf
 b7ndIcDmRKSj0HHOispb6Ty0UnStqX/xecM8+yAYLmhkR4xMyJTAMTHBXtFzj15wVC2I
 9zjQwuybF478lozLOBrEqQHpLFvHZvRC8mYf/6ZaHp5FSv9rxfflPQbHWXWnGYZc9tTu
 5NTA==
X-Gm-Message-State: AOAM533c3RlAuNTTjLG+Wbkyi3K1NHJE8nUEc1Hct+wHxpb3Ecsa8pDm
 T2wEEv381d7tNJJUvPz4vCv+RjDWS2z7L+/NPjLL
X-Google-Smtp-Source: ABdhPJw1sNKFekdI1Ln5GFGtrd+fGGKvAqudNs0O/HZL6Z2vY9+JbXh7u0IWSx+tE6iFXOzqgaQ/prFDh7B5VuUxCDI=
X-Received: by 2002:a25:d015:: with SMTP id h21mr25548749ybg.202.1627336390145; 
 Mon, 26 Jul 2021 14:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-2-atish.patra@wdc.com>
 <20210726065657.GA9035@lst.de>
In-Reply-To: <20210726065657.GA9035@lst.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Jul 2021 14:52:59 -0700
Message-ID: <CAOnJCUJFOZsqC2F9sqJqYw5bLJK0fQS+w=Rp6PeM2ih=75Cxag@mail.gmail.com>
Subject: Re: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
To: Christoph Hellwig <hch@lst.de>
Cc: Atish Patra <atish.patra@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Tobias Klauser <tklauser@distanz.ch>, 
 Robin Murphy <robin.murphy@arm.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 iommu@lists.linux-foundation.org, Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_145311_985187_E22FB783 
X-CRM114-Status: GOOD (  21.05  )
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

On Sun, Jul 25, 2021 at 11:57 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +struct riscv_dma_cache_sync {
> > +     void (*cache_invalidate)(phys_addr_t paddr, size_t size);
> > +     void (*cache_clean)(phys_addr_t paddr, size_t size);
> > +     void (*cache_flush)(phys_addr_t paddr, size_t size);
> > +};
> > +
> > +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
> > +#endif
>
> As told a bunch of times before: doing indirect calls here is a
> performance nightmare.  Use something that actually does perform
> horribly like alternatives.  Or even delay implementing that until
> we need it and do a plain direct call for now.
>

I was initially planning to replace this with alternatives in the
future versions. But there is no point in doing it
until we have CMO spec finalized. We also don't have any other
platform using these apart from sifive l2
cache controllers for now.

I will change these to direct for now.

> static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > +{
> > +     if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > +             dma_cache_sync->cache_invalidate(paddr, size);
> > +     else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > +             dma_cache_sync->cache_clean(paddr, size);
> > +     else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > +             dma_cache_sync->cache_flush(paddr, size);
> > +}
>
> The seletion of flush types is completely broken.  Take a look at the
> comment in arch/arc/mm/dma.c above arch_sync_dma_for_device for a good
> explanation.
>

Thanks. I will fix it.

> > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > +{
> > +     void *flush_addr = page_address(page);
> > +
> > +     memset(flush_addr, 0, size);
>
> arch_dma_prep_coherent is not supposed to modify the content of
> the data.

Sorry. This was a leftover from some experimental code. It shouldn't
have been included.

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

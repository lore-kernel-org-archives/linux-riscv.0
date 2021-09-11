Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DA2C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:37:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B957610F8
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B957610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBvrk1TVCI7LT0mJ5fcFhlIMNE1dJHyzbHs8UNAoUGE=; b=nueP5jWGnhvObP
	xQD0WHCw9cLGbf8raNB8XCJN8G6eSvYJ6Tk+2sZWfn/Rd3F8/sdBnagM01s3DxZE3EFfAMQ2ykwRj
	icYR+n+ZmvD0Bhv6tkzd8EWKE06n0Zu+wCjrLPvRuRI1qpJIUGrTpnTZIwLMXIJ8bVMkwYAFGR7lJ
	KW210AiBj+uxQbf5MOa1OhDJaiCRIJrQIggDixMDTF8RO+MvcmrY5nTS78pGiJqmO8MsjwaKIcrwe
	30DN08iMOKZT+IQcgfkK1MzgqiJ7DihAUlpzvtIdICBdwodJzEdN3EjbHsc1vj3z0ouGadBiAtyx1
	vtDGRh9lWW0iv5ORvWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzS0-00EcXx-9E; Sat, 11 Sep 2021 09:37:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzRw-00EcXQ-07
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:37:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B274C61214
 for <linux-riscv@lists.infradead.org>; Sat, 11 Sep 2021 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631353047;
 bh=G18OV5FIIRNWI99pCWXNGoDPuX3uPGlDsnKN/RG9rWc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P/Y4Je1lPw0LK98KHXnCgi6HQWCPtAFmli2I+O860gkeqcXootKimbzSw8OZxH6T1
 O8N+iJWhCkea0vAVw6GHXJnlK5qL+L2H1Epa1qEozl9q4Hv787/cAtk8guWQrfO02F
 v3W8+Hy6zm5rd+5MNHJ7YvZF2F1CmlO0Jeqtb0G/aUyT0Zp0sMeCg86m4jVn4Z/Rvb
 1x9DlXQLAIroW+I3vYIg76GmYuyWRQt3aDXBYt+3sxIZ6pR/kVqJvM5BndgUqRHOz1
 UtPoNpnQA5eLlK7HGagpoCeaJZKeB81g8Qek2iRHK/29NMWRj0KU54XHZLiNMYtLSQ
 rudBsYBHMt5wA==
Received: by mail-lj1-f182.google.com with SMTP id y6so7456786lje.2
 for <linux-riscv@lists.infradead.org>; Sat, 11 Sep 2021 02:37:27 -0700 (PDT)
X-Gm-Message-State: AOAM533xeWyIVL7M4KtGvdZilWhchIpaOI4XngeJ/hshsAJjTue1q9cY
 /hLr8HzdLuhTUsE7s0+B4hN6SkTU1x4VYerZ5zk=
X-Google-Smtp-Source: ABdhPJz1oYKcutN4CfeiCO1gDO6d41MM4ga2i6X7G8mzRYyCg4UTUoPG7GsV4adhKwlbqQLgd9hxTargj+BFZ5i1K80=
X-Received: by 2002:a2e:3307:: with SMTP id d7mr1615329ljc.292.1631353046032; 
 Sat, 11 Sep 2021 02:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-2-atish.patra@wdc.com>
 <20210726065657.GA9035@lst.de>
 <CAOnJCUJFOZsqC2F9sqJqYw5bLJK0fQS+w=Rp6PeM2ih=75Cxag@mail.gmail.com>
In-Reply-To: <CAOnJCUJFOZsqC2F9sqJqYw5bLJK0fQS+w=Rp6PeM2ih=75Cxag@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Sep 2021 17:37:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT+LgLyYHpJ1dv595mF8M3OHshy8EHg3tk63Kov8+GU9g@mail.gmail.com>
Message-ID: <CAJF2gTT+LgLyYHpJ1dv595mF8M3OHshy8EHg3tk63Kov8+GU9g@mail.gmail.com>
Subject: Re: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
To: Atish Patra <atishp@atishpatra.org>
Cc: Christoph Hellwig <hch@lst.de>, devicetree <devicetree@vger.kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@linux.alibaba.com>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, 
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Tobias Klauser <tklauser@distanz.ch>, Robin Murphy <robin.murphy@arm.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_023728_117075_B5463859 
X-CRM114-Status: GOOD (  26.74  )
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

On Tue, Jul 27, 2021 at 5:53 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sun, Jul 25, 2021 at 11:57 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > > +struct riscv_dma_cache_sync {
> > > +     void (*cache_invalidate)(phys_addr_t paddr, size_t size);
> > > +     void (*cache_clean)(phys_addr_t paddr, size_t size);
> > > +     void (*cache_flush)(phys_addr_t paddr, size_t size);
> > > +};
> > > +
> > > +void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
> > > +#endif
> >
> > As told a bunch of times before: doing indirect calls here is a
> > performance nightmare.  Use something that actually does perform
> > horribly like alternatives.  Or even delay implementing that until
> > we need it and do a plain direct call for now.
> >
>
> I was initially planning to replace this with alternatives in the
> future versions. But there is no point in doing it
> until we have CMO spec finalized. We also don't have any other
> platform using these apart from sifive l2
> cache controllers for now.
>
> I will change these to direct for now.
I think alternatives' would be helpful, I've rebased on your patchset, thx.
https://lore.kernel.org/linux-riscv/20210911092139.79607-6-guoren@kernel.org/

>
> > static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > > +{
> > > +     if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > > +             dma_cache_sync->cache_invalidate(paddr, size);
> > > +     else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > > +             dma_cache_sync->cache_clean(paddr, size);
> > > +     else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > > +             dma_cache_sync->cache_flush(paddr, size);
> > > +}
> >
> > The seletion of flush types is completely broken.  Take a look at the
> > comment in arch/arc/mm/dma.c above arch_sync_dma_for_device for a good
> > explanation.
> >
>
> Thanks. I will fix it.
>
> > > +void arch_dma_prep_coherent(struct page *page, size_t size)
> > > +{
> > > +     void *flush_addr = page_address(page);
> > > +
> > > +     memset(flush_addr, 0, size);
> >
> > arch_dma_prep_coherent is not supposed to modify the content of
> > the data.
>
> Sorry. This was a leftover from some experimental code. It shouldn't
> have been included.
>
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
>
>
>
> --
> Regards,
> Atish
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

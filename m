Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF02C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 06:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21C5611C4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 06:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C21C5611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PuMhmG1/zr/h3A4h+W7P8a0BJJlVozbdEjHvjJW7hU=; b=krm8SvnPLynr2s
	4GbWnrztDrnrsdl9b8d6FV8mv8jSA6LyMBO0gM0+xIWCxu+0SqlgBMNP6nDV4r3m6ch6msD/h1DEe
	RpObwXFb9Vd72BMObcn7r7uNlseXvfXWet95OujKAsx1rRoD8Rv7bihBJuoQdZCd8WDCU2TEWI3Cn
	DpY0ww+w9Pw99c0cet913uiqq8gd0RsyO9IB4oweYUJSaDyfAW4bnZqCOyO+Sqn3tOy2MBD70UMyp
	nT/PTu/HgAt5LujSj/AqziopViC6FPZt9kKEyiEAL5r2LBhXjLvhP51DzgKk31WgbcOwtPaM9sekV
	vL68NI8BiaoGsgEFwewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQkam-00AP4j-B4; Thu, 16 Sep 2021 06:09:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQkai-00AP4E-PT
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 06:09:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34CEB611C8
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 06:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631772588;
 bh=WpCTyflIvR2GCah2tu1TLBIUfnLMEvfUIk5rmhHFD3M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LDvNNowUHWWkhpO5L9nq7efRWsTq9iSl+yV0Rf5J3BSRjKAT/kwIqyu8naFu/+mYR
 j2fSHCiUY5g9dGskbS5Nqj5H25OE0qGzpX2RKEUdUErUmNttyz1q10wxun422JmluE
 s1dEqLVu9XP37wlqAqNkbqS9vGpRrl4GPm1NLXfFNS/stX+WfFNgDL8iK73VTgMLEU
 7raRryO8CrP4kcKA2nwbssbj/d2oc3w+czKhFTrQQ/eVEQ3sBcSsd/WaP8FvCUw2mF
 ILsB6ay95t7hNs961Ar/D5uBTvPgqG+6greVXFYlVnLV2ok7MlTvxsWjRBq/ZkMVmU
 Uoz7uOz76n4EQ==
Received: by mail-lf1-f54.google.com with SMTP id k4so14073828lfj.7
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 23:09:48 -0700 (PDT)
X-Gm-Message-State: AOAM533Xa1IXi4kKbK6FEVQAB9EI7M3nP59C90nZPvL5i0Qh9y6c102z
 8BBPPedJV/VXYqq2vO5FW/qQTGJW2EkM07XwnmQ=
X-Google-Smtp-Source: ABdhPJyQKLWWyvgHdFEFDT/acgjD6ikFrjGMpQuRznVMMp6RoNUEL9fsKLoz+Yx0T6A5C1Hp4yPnF01bRX6yFhfDO0A=
X-Received: by 2002:a05:6512:22c9:: with SMTP id
 g9mr2060364lfu.637.1631772586518; 
 Wed, 15 Sep 2021 23:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-4-guoren@kernel.org>
 <20210915074827.GC20024@lst.de>
 <CAJF2gTSZLieg1kYA6a0CPajPukHzwN0wvPuh4RQ-t45fciFOYA@mail.gmail.com>
 <CAOnJCULyEHdyr9=Ez-NxRGKow3_RbNym_wg9RcZGWv-vJ-0B9Q@mail.gmail.com>
In-Reply-To: <CAOnJCULyEHdyr9=Ez-NxRGKow3_RbNym_wg9RcZGWv-vJ-0B9Q@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 16 Sep 2021 14:09:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRS=6i6zgdM8-WsdrzbiSrQkrmu+Xx-h6D4puKZqu1ruQ@mail.gmail.com>
Message-ID: <CAJF2gTRS=6i6zgdM8-WsdrzbiSrQkrmu+Xx-h6D4puKZqu1ruQ@mail.gmail.com>
Subject: Re: [RFC PATCH V4 3/6] RISC-V: Support a new config option for
 non-coherent DMA
To: Atish Patra <atishp@atishpatra.org>
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
X-CRM114-CacheID: sfid-20210915_230948_907637_09105E30 
X-CRM114-Status: GOOD (  28.14  )
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

On Thu, Sep 16, 2021 at 12:39 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Sep 15, 2021 at 6:21 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Wed, Sep 15, 2021 at 3:48 PM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > On Sat, Sep 11, 2021 at 05:21:36PM +0800, guoren@kernel.org wrote:
> > > > +     select DMA_GLOBAL_POOL
> > > > +     select DMA_DIRECT_REMAP
> > >
> > > No need to select DMA_GLOBAL_POOL when DMA_DIRECT_REMAP is select.
> > If we want to support PBMT & global_dma_pool both in riscv. Could they
> > work together in arch/riscv with [1]?
>
> We don't have to worry about it as the next version of my series will
> use the simpler
> dma_uncached functionality to support uncached window approach taken
> by starlight socs.
Sounds good, thx.

>
> I was supposed to send it sooner but got busy with PMU stuff and a bad flu :(.
Take good care of yourself and hope you feel better soon.

>
> >
> > [1]: https://lore.kernel.org/lkml/20210818142715.GA10755@lst.de/T/
> >
> > >
> > > Also a patch just to add a option that is not selected and won't build
> > > if selected does not make sense.
> > I just want to rebase on Atish's patch and append DMA_DIRECT_REMAP.
> > Okay, DMA_DIRECT_REMAP & DMA_GLOBAL_POOL should be separated from the
> > patch.
> >
> >
> >
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -156,9 +156,14 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >
> >   if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> >      !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > +    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> >      !dev_is_dma_coherent(dev))
> >   return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> >
> > + if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> > +    !dev_is_dma_coherent(dev))
> > + return dma_alloc_from_global_coherent(dev, size, dma_handle);
> > +
> >   /*
> >   * Remapping or decrypting memory may block. If either is required and
> >   * we can't block, allocate the memory from the atomic pools.
> > @@ -255,11 +260,19 @@ void dma_direct_free(struct device *dev, size_t size,
> >
> >   if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> >      !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > +    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> >      !dev_is_dma_coherent(dev)) {
> >   arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> >   return;
> >   }
> >
> > + if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
> > +    !dev_is_dma_coherent(dev)) {
> > + if (!dma_release_from_global_coherent(page_order, cpu_addr))
> > + WARN_ON_ONCE(1);
> > + return;
> > + }
> > +
> > Here CONFIG_DMA_GLOBAL_POOL is independent from CONFIG_DMA_DIRECT_REMAP.
> >
> >   /* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
> >   if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> >      dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

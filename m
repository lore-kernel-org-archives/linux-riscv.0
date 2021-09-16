Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E222BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 01:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C6260F51
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 01:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90C6260F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09PES4kmD8zaxjx9LjVw3h9otP32guhyK6HUVCVYTKQ=; b=dTYXzxbArnoaNj
	mtE59MY0cPn9Fii1Qp4Yl8guW7OETmvsavVZVU7xL154fdjR/zvDD/HwCjDIDRofReQjv5ucBje4I
	cAcwAPTzA3rK4a8aSBAqIV6giL6/FDIqCnsxza6rAW91mo2taI7HJR3kBKKxVnUFpRkPpmyzJysOa
	VVedWZ8e7oRZCqKkZyNAse2fTg0kDwo9IAuZ6LYjPriFWD1nrwzoYpJORjSCRBjMsyyYiPQU34bw8
	51ZBBvc2XHYwOjPHtHFQyTR4y19PGTUz7cHcVfVmcUS8vA+O7bvfGuayfiWZKrdu6xY2cUIScstLg
	WEt1hGGCgUasaAoj3KuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQg52-00AAXK-7g; Thu, 16 Sep 2021 01:20:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQg50-00AAX0-30
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 01:20:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8441961165
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 01:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631755245;
 bh=N8vdbjyf2kqAOWnVrEA55RFKSMKRgVPo8mZ596qmFTs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aCA9nZNVQ69O0f+yv/wo3D1I0gnuAseS7SrmlT9uFmDp4Vas95th0CZqUCQCAYsoE
 CTd8jk1mSUAARkLeGoMMgxyqSN4DA8ebpmteW2PCI4pP6tdzd+V9YOgT4gaMl5Se1w
 /bKTV5NcKG2KpZfaAhHXJFTOtRBXSp/b7l1+ex6yQx2o3pRZwoasJEoNUxQuWUszIG
 mD5fJXz/5k+d/4OBT3u4VtlURFEm9AyBHo62jCl1MmR//eLZ1BMAAw/mF0aMF6V2AJ
 m56ZvQQ56apZjYrr9k0frhQpss7qtRIJp+2wGN19n/Ntr2hMkR5v+cipoJLJT0rUBF
 WMRkU+MT1czyw==
Received: by mail-lf1-f46.google.com with SMTP id k4so11777990lfj.7
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 18:20:45 -0700 (PDT)
X-Gm-Message-State: AOAM530JovPOmEvkP6+sHLiasNe9nl51fzir4ctlqLDfK/FacHxjlAs+
 41L/S1Z+Vq6jEqfF8+oyz/YLi70cEe/kaujYsOc=
X-Google-Smtp-Source: ABdhPJz+GXHr4HX2v0FUy9aKwpP8QUXw8A79CVUhuNj8Hy1BRETa0saqeya2VTa2CI7/Bd1Vfz9vb5u3+LerP+oeraU=
X-Received: by 2002:a05:651c:1548:: with SMTP id
 y8mr2571362ljp.507.1631755243805; 
 Wed, 15 Sep 2021 18:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-4-guoren@kernel.org>
 <20210915074827.GC20024@lst.de>
In-Reply-To: <20210915074827.GC20024@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 16 Sep 2021 09:20:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSZLieg1kYA6a0CPajPukHzwN0wvPuh4RQ-t45fciFOYA@mail.gmail.com>
Message-ID: <CAJF2gTSZLieg1kYA6a0CPajPukHzwN0wvPuh4RQ-t45fciFOYA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 3/6] RISC-V: Support a new config option for
 non-coherent DMA
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_182046_207452_A3E161C4 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, Sep 15, 2021 at 3:48 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, Sep 11, 2021 at 05:21:36PM +0800, guoren@kernel.org wrote:
> > +     select DMA_GLOBAL_POOL
> > +     select DMA_DIRECT_REMAP
>
> No need to select DMA_GLOBAL_POOL when DMA_DIRECT_REMAP is select.
If we want to support PBMT & global_dma_pool both in riscv. Could they
work together in arch/riscv with [1]?

[1]: https://lore.kernel.org/lkml/20210818142715.GA10755@lst.de/T/

>
> Also a patch just to add a option that is not selected and won't build
> if selected does not make sense.
I just want to rebase on Atish's patch and append DMA_DIRECT_REMAP.
Okay, DMA_DIRECT_REMAP & DMA_GLOBAL_POOL should be separated from the
patch.



--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -156,9 +156,14 @@ void *dma_direct_alloc(struct device *dev, size_t size,

  if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
     !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
     !dev_is_dma_coherent(dev))
  return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);

+ if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
+    !dev_is_dma_coherent(dev))
+ return dma_alloc_from_global_coherent(dev, size, dma_handle);
+
  /*
  * Remapping or decrypting memory may block. If either is required and
  * we can't block, allocate the memory from the atomic pools.
@@ -255,11 +260,19 @@ void dma_direct_free(struct device *dev, size_t size,

  if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
     !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
+    !IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
     !dev_is_dma_coherent(dev)) {
  arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
  return;
  }

+ if (IS_ENABLED(CONFIG_DMA_GLOBAL_POOL) &&
+    !dev_is_dma_coherent(dev)) {
+ if (!dma_release_from_global_coherent(page_order, cpu_addr))
+ WARN_ON_ONCE(1);
+ return;
+ }
+
Here CONFIG_DMA_GLOBAL_POOL is independent from CONFIG_DMA_DIRECT_REMAP.

  /* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
  if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
     dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

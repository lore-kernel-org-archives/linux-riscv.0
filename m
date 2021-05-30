Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A6EC4708F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:26:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27739610FA
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27739610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KHsAa7sSSWOEy+GDbECMYiNOYxvXRLx4XBf5QW34/A=; b=swjWWTke4FMLUt
	zQsGnvA1v69vhUe928jxXN9AAR1R0LU7JJ75rxori+RgTUTLWCPc1i7PTRj0eQ+o0e1jCJRV3foIQ
	XOsy9wAtn1YqnrPCjwwnRkJRDuxkYA2AdL9LCvfH3ACJuD00L1vg5c5DEcQtRj9oCkKI9hmcVbCR1
	ZW+dhXCB69K2b06rI6s3Ct5t6xub3/lBfQGie1lDxeR1Z+AE5GNX7+hDp7wt1e2NHEhD3BRkrQJI5
	A7gZkqMQ6qtB35zr6YJ3e+0JmWGOXV/yWnbfnDKdmOnq7qRntHH7FHOuiHocAu6+N34iNkTm6KnYm
	qEjhWM4+nSceJKCJ55tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln9Ho-008flL-6Z; Sun, 30 May 2021 00:26:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln9Hm-008fkp-6m
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 00:26:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6CF361131
 for <linux-riscv@lists.infradead.org>; Sun, 30 May 2021 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622334392;
 bh=WO4AvDQOErMivEJBVOiXhGXr5BkKrXIWDEGphngSgbo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i/Pw+IYthyq+6HSTuiPvfqKj0VEF9TAJjD4ATVR0yZ0TtflaZ0n3IGq9ltH2zOTBF
 tajB4cUozkLkH3ZItczvs7cviBB4p+aT1GppQl25j1xVZc+HvUFR4A3qVgfxKT2nvu
 +BVQm0brOFXf92ZIS0o3wPp4W3+VLUX2MxnBDXWHKxqKyplUHGDp4wR3jqbfyjv+Kx
 HUo66HaMomE6mknJEBM9U0RC8Lk7RiK19GIIbJAh/DIvOIHkAmxQyW0U6NAc/Ue1XS
 y87nW3YwYHqm4hZLwwWOwcgwe9rbvvBXM7UU4TTU6xGdpx6JsWFm/ur1nfzK4cZrUc
 fJqJmuFxUv3NQ==
Received: by mail-lj1-f182.google.com with SMTP id 131so10091028ljj.3
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 17:26:32 -0700 (PDT)
X-Gm-Message-State: AOAM530mBSgo+wI9hTqieHX/Sh97ZIOcQt3vzB11p+KbS3jI2+Trs47c
 9/6TPhis7zdCbhmB4yISA2dK8buaxkSlF9KvBGk=
X-Google-Smtp-Source: ABdhPJzAv7KxOF4cW+l6E6gE3uAhvDSqrsRPGJzs6vvDaU7PttVLgVopNfDeoPAKiteBVSoM5AoDZDhtiWO9RVnzXQk=
X-Received: by 2002:a05:651c:2d0:: with SMTP id
 f16mr3853539ljo.18.1622334391183; 
 Sat, 29 May 2021 17:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <1621945234-37878-1-git-send-email-guoren@kernel.org>
 <mhng-93a12abf-0283-4ec3-a521-89b8d882654f@palmerdabbelt-glaptop>
In-Reply-To: <mhng-93a12abf-0283-4ec3-a521-89b8d882654f@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 May 2021 08:26:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTMYi-fr2kz5PHBtZ17iJdq0gN5UWT+eRV7ODwNfUcqrw@mail.gmail.com>
Message-ID: <CAJF2gTTMYi-fr2kz5PHBtZ17iJdq0gN5UWT+eRV7ODwNfUcqrw@mail.gmail.com>
Subject: Re: [PATCH] arch: Cleanup unused functions
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_172634_333585_56657C59 
X-CRM114-Status: GOOD (  22.65  )
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

On Sun, May 30, 2021 at 7:08 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Tue, 25 May 2021 05:20:34 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These functions haven't been used, so just remove them. The patch
> > has been tested with riscv, but I only use grep to check the
> > microblaze's.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Michal Simek <monstr@monstr.eu>
> > Cc: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/microblaze/include/asm/page.h |  3 ---
> >  arch/riscv/include/asm/page.h      | 10 ----------
> >  2 files changed, 13 deletions(-)
> >
> > diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> > index bf681f2..ce55097 100644
> > --- a/arch/microblaze/include/asm/page.h
> > +++ b/arch/microblaze/include/asm/page.h
> > @@ -35,9 +35,6 @@
> >
> >  #define ARCH_SLAB_MINALIGN   L1_CACHE_BYTES
> >
> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
> > -
> >  /*
> >   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
> >   * it is set to the kernel start address (aligned on a page boundary).
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 6a7761c..a1b888f 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -37,16 +37,6 @@
> >
> >  #ifndef __ASSEMBLY__
> >
> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
> > -
> > -/* align addr on a size boundary - adjust address up/down if needed */
> > -#define _ALIGN_UP(addr, size)        (((addr)+((size)-1))&(~((size)-1)))
> > -#define _ALIGN_DOWN(addr, size)      ((addr)&(~((size)-1)))
> > -
> > -/* align addr on a size boundary - adjust address up if needed */
> > -#define _ALIGN(addr, size)   _ALIGN_UP(addr, size)
> > -
> >  #define clear_page(pgaddr)                   memset((pgaddr), 0, PAGE_SIZE)
> >  #define copy_page(to, from)                  memcpy((to), (from), PAGE_SIZE)
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> It's generally easier if you split this sort of stuff up, as it'll be
> easier to merge if we don't have to coordinate between the trees.  I'm
> happy to take this, but I'd prefer an Ack from one of the microblaze
> folks first.
Em ... I'll separate it. Thx for reply.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

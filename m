Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D29C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 04:16:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4837561056
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 04:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4837561056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwJN+1gVmXl8yny2NcOCap87KcSZ2PFKadvXdvY8ITU=; b=nnXy6pAo7Us0dh
	QaB97dlzjiPqGNPzJwRMySps5Okl3KpDUrcSYB/NZcTcJ8WC3Ci+9rbfU83lNl7ddVrY8yw2cH1bx
	EYnVImZ/u1ZaUhRc+Nx1UZJJPudyTfrdzs1Kzt6Kj+NXU+RSF0Ai4YD4gMlLjUhWzSzXaNabu3dfo
	vwCMTazcCh112VNK6PKG9+xK4uczFTAPusDW0S7Yaxax4UV0A2tRz2t6FBC6H0edg/sL8qxG8meZi
	a7w/7FTx0vCo5BNptnWB1ZrPFBRk8kfwFYpXXMk27Avff3Mt8/mr2K418MqD9rIjaKjZHcthYX7Cc
	OSTjGlXxzjffppU59kdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwpV-006qPZ-7R; Thu, 28 Oct 2021 04:15:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwpR-006qOP-8j
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 04:15:50 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4863F3F17A
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 04:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635394541;
 bh=5LeZ4qJd1/I0CO3BOhH9jstVrpNoI/oz+UiYuO/v2Z4=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=M3QmDFDwvvxEKZsitSwgvH7RdmxBISRHqSZCqlCQnf2VVpw7vkRNELZT8dvSb82ot
 kb0G12MllAK4SCCWL/BhvSruPA/rvUzBEobwX034PZYfIH5omvdKcPeNPtl5ILNKRs
 PaYNfDx+8a2jnOA4hpHd4nvtb+650WhUpqst+sk5obgoCaUTc4oK+IG0ywIrIo4WDJ
 gBHwIncONMSSWHd+HhsLFjI7MdL6zdYykfM+wJSA/A0KFBQFLnKOe32SI+WjOzHZzN
 rdyzGrSJt/gsjEBAFreo7ak2PJQRrk1YrUweGPcii/U706dZJ3YGyqUpZMTlkl/mmP
 0VDnqirforEtw==
Received: by mail-ed1-f70.google.com with SMTP id
 w7-20020a056402268700b003dd46823a18so4299684edd.18
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 21:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LeZ4qJd1/I0CO3BOhH9jstVrpNoI/oz+UiYuO/v2Z4=;
 b=g0SLfajpaQzXamxiSyrzq5OcV4WOmAolM0EMkymILQmqrCO0fnxoJRYMAw5Arnzufk
 ey4bOVdfuXNvcT4i7WcJ0GR3an9Fo9GfONJojcERpzu9Gxxt3mm3vhHBHkWJPkQnbSAQ
 19KR6cpEt2+xSGs2WcpYydlGDHCyTQBXgbb2qDWS6QSirGTSZxisjlrbJ9DSjV0wu1xr
 Yn9ovMq7SeSJ4w2miyrGn0Oqshz9Ukk7plnM02u+N/khUafTSEEe4Zt7bsAscYJlrET7
 Ag6HDuPstfDI5clci8pNPFP5jw6LzlY6ZOLVl5iko9Akd62dexeDa3ePq34WtkMFwVbL
 P9qQ==
X-Gm-Message-State: AOAM532TdiY1bVtSjq07cHwgc5QXWLIwFFznkldtpZqRigoEi2JDtZDM
 vsn/V9F6megXn3WtZntNbl/e7gIQOSt+wsbS7MqSTEllQJgYLLLhhjZPlnv2uymGJg/YURKkljd
 Zy4G7r5e51PnQJKwtbetKDJybizshJobZeWfh9xmeJd6tIAFiCktzWJJIcKOQng==
X-Received: by 2002:a05:6402:cb8:: with SMTP id
 cn24mr2785992edb.190.1635394540861; 
 Wed, 27 Oct 2021 21:15:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZi39J2kwik0RQhOm5p9MLjprDz5OI4qGnklGMEHC/w9pQt4Nm/adBkMjvmLJBYtF/TOSO3uDCvbbjc4taCh8=
X-Received: by 2002:a05:6402:cb8:: with SMTP id
 cn24mr2785968edb.190.1635394540704; 
 Wed, 27 Oct 2021 21:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211027045843.1770770-1-alexandre.ghiti@canonical.com>
 <mhng-41b64d3e-5a5a-4d59-86fc-80f2148823e8@palmerdabbelt-glaptop>
In-Reply-To: <mhng-41b64d3e-5a5a-4d59-86fc-80f2148823e8@palmerdabbelt-glaptop>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 28 Oct 2021 06:15:28 +0200
Message-ID: <CA+zEjCuUCxqTtbox2K8c=ymHC8X97LV6CSO3ydJKgRR9cBXUEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, 
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, nathan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_211549_471729_F2AE49FD 
X-CRM114-Status: GOOD (  27.21  )
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

On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
> > Kconfig, it prevents asan-stack from getting disabled with clang even
> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
> > corresponding config.
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > ---
> >  arch/riscv/Kconfig             | 6 ++++++
> >  arch/riscv/include/asm/kasan.h | 3 +--
> >  arch/riscv/mm/kasan_init.c     | 3 +++
> >  3 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c1abbc876e5b..79250b1ed54e 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> >
> > +config KASAN_SHADOW_OFFSET
> > +     hex
> > +     depends on KASAN_GENERIC
> > +     default 0xdfffffc800000000 if 64BIT
> > +     default 0xffffffff if 32BIT
>
> I thought I posted this somewhere, but this is exactly what my first
> guess was.  The problem is that it's hanging on boot for me.  I don't
> really have anything exotic going on, it's just a defconfig with
> CONFIG_KASAN=y running in QEMU.
>
> Does this boot for you?

Yes with the 2nd patch of this series which fixes the issue
encountered here. And that's true I copied/pasted this part of your
patch which was better than what I had initially done, sorry I should
have mentioned you did that, please add a Codeveloped-by or something
like that.

Thanks,

Alex

>
> > +
> >  config ARCH_FLATMEM_ENABLE
> >       def_bool !NUMA
> >
> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> > index a2b3d9cdbc86..b00f503ec124 100644
> > --- a/arch/riscv/include/asm/kasan.h
> > +++ b/arch/riscv/include/asm/kasan.h
> > @@ -30,8 +30,7 @@
> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> >  #define KASAN_SHADOW_START   KERN_VIRT_START
> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> >
> >  void kasan_init(void);
> >  asmlinkage void kasan_early_init(void);
> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> > index d7189c8714a9..8175e98b9073 100644
> > --- a/arch/riscv/mm/kasan_init.c
> > +++ b/arch/riscv/mm/kasan_init.c
> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
> >       uintptr_t i;
> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
> >
> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> > +
> >       for (i = 0; i < PTRS_PER_PTE; ++i)
> >               set_pte(kasan_early_shadow_pte + i,
> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

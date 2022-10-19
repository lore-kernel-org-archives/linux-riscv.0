Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2D5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AunicnwCoEEFKQkvcOUSg2cL67FCKGWtzzS7feEDh7M=; b=nBmssJKyPeVtpc
	ojASk0HNDRbg5PFBj8jY52WM4LhlcNPMmoq0l1ssIaWKureZsg9fqKT2W8xtBdWf+S9R5QT7p1xed
	H1xYgUWBE19lBWw8ErQHZTcA5OoCy91Upnvgb0/xXWznPb67euvRqRCE5is2Aasr7zTs4WXDYVWHw
	hnHon3McgY+ojDiTlTAQfF5RY2AlJvRRx1xHp/pIMcbefP5Uo5qmSeStJiEEhZE5BBuoD8um0QPwj
	VH+vA29OCcTjZGK43xArMznOyYlAeSqaXO4c3HRcgNL/RdHCZ6kxEFRw3qRYAezRME+zKyBEEDERc
	SUYtxqBnfeSJCNbgZ6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBjZ-003qD7-Iy; Wed, 19 Oct 2022 16:15:57 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBey-003m1P-IW
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 16:11:14 +0000
Received: by mail-lj1-x22f.google.com with SMTP id a6so22817038ljq.5
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cTLtxH/9tdJ3MnfIXYFHnaBNfFAm0kUtsej9gwtGuyE=;
        b=F2oQw+wag08kfGzWVJaKgb49QMe1rpOTgK6Nol5ulhaVyYhJcvpCcNT4350XIn6DSj
         Bs6uM73Q+TxoED54v7UguROyJYkRGSZGM2VGzU1aSFAoezfkG1AnrtxClx7DQ35G1h5d
         caB5E9v1wOG/SGm1vAerSS1b5BEDgho6tBqs2V5DQF/1dOOnXeIHVcLIJUMMPLlj2AIi
         vedFbUqxu4uIM/IWy9qY4ADJvQRiHxAxOtLU0AUKVcXOYReDU1RWerQH/OkyzAipl6Az
         v+Qkq8HfJdx/NT9YbEuxU894EYsRjee4FcSy1HGilzbrBIlIgMKQK99b0jwSb90iSjSj
         SwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTLtxH/9tdJ3MnfIXYFHnaBNfFAm0kUtsej9gwtGuyE=;
        b=wUXt+oG42lBlr8ZYmU+Rbxybng+uScwM0ZTgpm/G78nOqrgpLfpBrUfnK65WTIV/f1
         sMSmvme0xpSvIeFo507DnKctDsmhW6gdE89dn3lg959HrzKerslAoQutfXkF+oAgCQAF
         LIJ/gYvK+vnKJjS9QR7Y2wjaPcIY3/qVkYXRxXNCRtE2TvUJrFpYw+zdUi11Cl/XeCXM
         3hDiU2EV7+S+SQ1DaB9W9/NyAp4lI1Ishc9Dw4+Te3DG7AMEQg50jGNh3UzogO9N4mMC
         e+BO4WWaJt8/z2mJxq7p6ox9N/2/bPlo/rxUxxchI4nZ8tm9JPGLjyJ2O+NPK9DigaRw
         zH2g==
X-Gm-Message-State: ACrzQf1I2OyMgzg04WE2XGV41fmX/Bwz5uaX2L8usHA6zT9JLk7gQzFE
	SIAHtTMeyJVV8r6UIQtRgpMGu3kDVphZ4GF4gNixDw==
X-Google-Smtp-Source: AMsMyM6N32QgZOyAH5TjUIjT2Lt4GP4WkBfbS6QjelNxdiiyxMTZ4TmiyTvPurhIkBzVUc7k17LE6fMazS3tXsald9U=
X-Received: by 2002:a2e:7808:0:b0:26f:c0c2:8a3e with SMTP id
 t8-20020a2e7808000000b0026fc0c28a3emr2976131ljc.260.1666195867358; Wed, 19
 Oct 2022 09:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221019131128.237026-1-apatel@ventanamicro.com>
 <20221019131128.237026-3-apatel@ventanamicro.com> <13122510.uLZWGnKmhe@phil>
In-Reply-To: <13122510.uLZWGnKmhe@phil>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 19 Oct 2022 21:40:56 +0530
Message-ID: <CAK9=C2WaoqAaVa2fo9E7cGXMy-MKpj-xLN6LoMHyq_g1psGLUQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_091113_335277_A9AD7D1A 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, Oct 19, 2022 at 7:49 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 19. Oktober 2022, 15:11:26 CEST schrieb Anup Patel:
> > Currently, all flavors of ioremap_xyz() function maps to the generic
> > ioremap() which means any ioremap_xyz() call will always map the
> > target memory as IO using _PAGE_IOREMAP page attributes. This breaks
> > ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
> > remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
> > page attributes.
> >
> > To address above (just like other architectures), we implement RISC-V
> > specific ioremap_cache() and ioremap_wc() which maps memory using page
> > attributes as defined by the Svpbmt specification.
> >
> > Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> > Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> Wasn't there discussion around those functions in general in v2?

Yes, there was discussion about a few drivers using ioremap_xyz()
which is discouraged and drivers should use memremap().

We still need the arch specific ioremap_xyz() functions/macros
added by this patch because these are required by the generic
kernel memremap() implementation (refer, kernel/iomem.c).

>
> In any case, the patch doesn't break anything on qemu and d1, so
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Regards,
Anup

>
>
> > ---
> >  arch/riscv/include/asm/io.h      | 10 ++++++++++
> >  arch/riscv/include/asm/pgtable.h |  2 ++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> > index 92080a227937..92a31e543388 100644
> > --- a/arch/riscv/include/asm/io.h
> > +++ b/arch/riscv/include/asm/io.h
> > @@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
> >  #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
> >  #endif
> >
> > +#ifdef CONFIG_MMU
> > +#define ioremap_wc(addr, size)               \
> > +     ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
> > +#endif
> > +
> >  #include <asm-generic/io.h>
> >
> > +#ifdef CONFIG_MMU
> > +#define ioremap_cache(addr, size)    \
> > +     ioremap_prot((addr), (size), _PAGE_KERNEL)
> > +#endif
> > +
> >  #endif /* _ASM_RISCV_IO_H */
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 7ec936910a96..346b7c1a3eeb 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
> >  #define PAGE_TABLE           __pgprot(_PAGE_TABLE)
> >
> >  #define _PAGE_IOREMAP        ((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
> > +#define _PAGE_IOREMAP_WC     ((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
> > +                              _PAGE_NOCACHE)
> >  #define PAGE_KERNEL_IO               __pgprot(_PAGE_IOREMAP)
> >
> >  extern pgd_t swapper_pg_dir[];
> >
>
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

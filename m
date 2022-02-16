Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5036AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 06:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88YQccS29xYRvOdB6DNzU7BSmAHNNCAIA0MwqjMyWO0=; b=pYMLBrhm1jcbZ9
	4vG6oO/3Yy6N3WY0LyjDHGjkL63TnWQenQ0wcuAUtehmsY/408hWwXDMVpse5Bn8ZkF/3EIJdB5Wm
	5QttIzjI0HWJPILTgtapkLTr/zwrYJNTo4oX3o/VMbiqfPtTVHQafY3kXmBK4XXAnfi1B5sPsanCb
	2QBjNaVYuKu+eeIEPXi6jW5JA+QBw3Piv1sOoC5eTNI3k6mZK8y8FvTStQiQ+tK31RkqKAHsUyk2a
	oIaBvvn0XadFh+6Q8kDr+wW0IFeZjPuZYaTnsSk9M1NH/cybdLrWQmp7Zvz931fY8E/Hslu0Y1fAH
	0sBEcEGBrhvlpJoTZByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKEAx-005ix7-2I; Wed, 16 Feb 2022 06:52:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKEAu-005iwc-FM
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 06:52:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id o2so2058417lfd.1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 22:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gjCi/HaXP+bc/Zw8WReu9bjIQ1k5GoBWpagMKd2Rfl0=;
 b=IgeglsV3Ccf40cqfZi33wnyMePOTDBS1Gj63ZrI9pUvFILQtGV9unvSUw8faEfUy7K
 kKoVrK5Wxjt/WSSaJhjW/Xmo1AKosOR6Mcy0NWvmAT/Hh3D2Mw8FiDGRRv2Hbmt3gZiU
 ESS5BZClYqWMuKOWKgJa6lrxHAeFFMfhFxla5BFuviqkVZJwZVFXZRg/U69ZwP84G6we
 CUBGkFGlnnuLpDwVoMrSlArTHFSrAqrXvmy9yaUpWtSEffK54ZAe5/5m5XsXwMfXwty6
 VIiAWTULGPYZmucLXgL8vYknVqPDEaHIT4bXnb6n5pwGkOEob4R6CV0OHLkXQcFv6QPC
 lDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gjCi/HaXP+bc/Zw8WReu9bjIQ1k5GoBWpagMKd2Rfl0=;
 b=I5uy/u1sbeXThLGSIVTtjjMmgCbaiQwQoIONCnogplBCXwV8Jnyd1nWBAa+sV0ul8z
 WeyeaeOuGnaiaEbOUbRfV2NOlvntYxGaY0TEEXD0MF0icB9T5FqCcyxzYkls4zs5t72p
 T8lrrIyaFr+wGx70agn5giQb6Qz5FLdOUtHbluG/AVCuM0QKm+2Nm9ytGzmOWZ2dNiIl
 Wsllt9imM+m7xqzO2GDxr8Or5Flm1eu/tDRRixdKXMq02IF++DRWtjhoSHV6QHfHFeta
 OTiNNOLhPlXdF0HYij/839fLkNEO1EBinRaga0PmTlx4vvDew9PblIkn6L2pUCYzkL/Z
 AMEQ==
X-Gm-Message-State: AOAM530Y4TS+52OZXFqjFXATmyA8ErVmaChO6ao0IBO4EDkR80VffuQT
 x/m410oFcZpirmHZA+qCootawOZrEb7nilRglJB0Pg==
X-Google-Smtp-Source: ABdhPJzRa2uVf64r3DqFR9UHw6YBgNGoCCYRwHItiwnl8QbxzQYuOmfiTBLUXZ0paSS6h6rWhZbscI5mfu3Fe6s3Rvc=
X-Received: by 2002:ac2:4e4a:0:b0:430:5dc2:3877 with SMTP id
 f10-20020ac24e4a000000b004305dc23877mr1062162lfr.116.1644994346088; Tue, 15
 Feb 2022 22:52:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644215230.git.zong.li@sifive.com>
 <df6c8d1c701b33fa735dd072de3cb585dc60f2c9.1644215230.git.zong.li@sifive.com>
 <YguXQJp/b/8SzjGX@matsya>
In-Reply-To: <YguXQJp/b/8SzjGX@matsya>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 16 Feb 2022 14:52:14 +0800
Message-ID: <CANXhq0p-Jv2HMNu9NaG=03yudanoqV6MH=LhiCspHbj5nTn+GQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_225228_590510_A017EE6E 
X-CRM114-Status: GOOD (  28.71  )
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

On Tue, Feb 15, 2022 at 8:06 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 07-02-22, 14:30, Zong Li wrote:
> > It currently assumes that there are always four channels, it would
> > cause the error if there is actually less than four channels. Change
> > that by getting number of channel from device tree.
> >
> > For backwards-compatibility, it uses the default value (i.e. 4) when
> > there is no 'dma-channels' information in dts.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 21 ++++++++++++++-------
> >  drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
> >  2 files changed, 16 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> > index f12606aeff87..2ae10b61dfa1 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
> >  static int sf_pdma_probe(struct platform_device *pdev)
> >  {
> >       struct sf_pdma *pdma;
> > -     struct sf_pdma_chan *chan;
> >       struct resource *res;
> > -     int len, chans;
> >       int ret;
> >       const enum dma_slave_buswidth widths =
> >               DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
> >               DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> >               DMA_SLAVE_BUSWIDTH_64_BYTES;
> >
> > -     chans = PDMA_NR_CH;
> > -     len = sizeof(*pdma) + sizeof(*chan) * chans;
> > -     pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > +     pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
> >       if (!pdma)
> >               return -ENOMEM;
> >
> > -     pdma->n_chans = chans;
> > +     ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > +                                &pdma->n_chans);
> > +     if (ret) {
> > +             dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
>
> This is useful for only debug i think, so dev_dbg perhaps
>

Thanks for your suggestion, let me change it in the next version.

> > +             pdma->n_chans = PDMA_MAX_NR_CH;
> > +     }
> > +
> > +     if (pdma->n_chans > PDMA_MAX_NR_CH) {
> > +             dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> > +             return -EINVAL;
> > +     }
> >
> >       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >       pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> > @@ -556,7 +562,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> >       struct sf_pdma_chan *ch;
> >       int i;
> >
> > -     for (i = 0; i < PDMA_NR_CH; i++) {
> > +     for (i = 0; i < pdma->n_chans; i++) {
> >               ch = &pdma->chans[i];
> >
> >               devm_free_irq(&pdev->dev, ch->txirq, ch);
> > @@ -574,6 +580,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> >
> >  static const struct of_device_id sf_pdma_dt_ids[] = {
> >       { .compatible = "sifive,fu540-c000-pdma" },
> > +     { .compatible = "sifive,pdma0" },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> > index 0c20167b097d..8127d792f639 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.h
> > +++ b/drivers/dma/sf-pdma/sf-pdma.h
> > @@ -22,11 +22,7 @@
> >  #include "../dmaengine.h"
> >  #include "../virt-dma.h"
> >
> > -#define PDMA_NR_CH                                   4
> > -
> > -#if (PDMA_NR_CH != 4)
> > -#error "Please define PDMA_NR_CH to 4"
> > -#endif
> > +#define PDMA_MAX_NR_CH                                       4
> >
> >  #define PDMA_BASE_ADDR                                       0x3000000
> >  #define PDMA_CHAN_OFFSET                             0x1000
> > @@ -118,7 +114,7 @@ struct sf_pdma {
> >       void __iomem            *membase;
> >       void __iomem            *mappedbase;
> >       u32                     n_chans;
> > -     struct sf_pdma_chan     chans[PDMA_NR_CH];
> > +     struct sf_pdma_chan     chans[PDMA_MAX_NR_CH];
>
> why waste memory allocating max, we know number of channels in probe,
> why not allocate runtime?
>

I kept it there because I'd like to do minimum change in this patch
set. You're right, let me change it in the next version.

> --
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

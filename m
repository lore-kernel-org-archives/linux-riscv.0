Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A32C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzqgeEaCumOD4VH+CziCp9yii9B8zynXGI0jEO+mlSo=; b=bBKsE2d3hURNlE
	C94fzN0p2LG6PmNs0pBOwxJQVFqasZ14E75eLOAPfWjKNL5i1GJ0dRF0pSjivMQePjL6BRyM9RTZ2
	3A0UBfwre/UMGpHoED63mNDHs7WH1ucg24LmVJOh+GIUkLu1dx0d2OJ/d0StdSF3fxxjWEbxtHrm0
	7B5F8JLHxjMQwjl9GdbLVbEHU5kw2lxCLM45iUBRa2ftnLVSOs0ddvd9/SNkDl3xveqqaPKG4Rj3a
	n/Js1tVX8cJZhawgldk/w6rr/4XARyCeZ/5NyL4JMlVASNnHAsDIUoocwUyT11tzEalQaTHremi23
	pKWuJvZqhKqB4kCuRQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ49m-009GYi-PX; Fri, 04 Mar 2022 09:23:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3fl-0098P6-2o
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 08:52:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id bu29so13077077lfb.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 00:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JVS7H4RjB5XseP/Xjap3fzMX0Z4jiKkznceF9UGo7Zs=;
 b=BC9k+77wH7iWvQo4xoNDRfhzbdUBsksudCgI5FMkYhI6yPGZsN5yG/cANwi/w3qP/P
 iHbEtuCTyne3zPZkM6BsdZYRudql0R2D1VkE0665hJT3Col8QNxjrKQs4Dt/O2lJT0bR
 bwyAPjoWWnKwpenXrZvwTRR5vdofYEb98Dj8Sq/eMrQ3xhtPdnHqBaMmXDxuOiRFLxrF
 yhaiQXv8M0A/AUqQfGc2zc54Mf9yNyg/TgDPxC72NwsANh94bSgeQBX8lZSeUPgDfAB5
 d6BPJpPT9rfW2XLl5E3qyeIVOdTuFgK6liM7anWH+pjz83wRo7YKloFvi3oD3ASnP3Ju
 BvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JVS7H4RjB5XseP/Xjap3fzMX0Z4jiKkznceF9UGo7Zs=;
 b=KxWIxbhR3jFHvdJ48G3bXp48c6+ywdZCs9luq+p7MyZDj+bFXAFK0nSl8Gi5AtQsLx
 zwxhzVlEYydLyKq7N/DjIR3Z9lKgxXL2j67pjhw6ruGpmtEWu4kXYbEUMwqvCSh6/erm
 KrwqFVwPNpNk6BKBhkaeKfWYkJFAo+IpoEyZjlsMmDhFVG+9zdFIo/zTOGQ+29fGIIE/
 kFosz+IkmJAQ0XanTaJqQDEjLD9zIA+HlqYZNZglgr5kfhcSg9swLnpz4RBnsxjtKVvL
 wnhodQljE8VHMrQ1d24YJsoWaUUGnnA034dAXDVFQ1WX/80WQ+cZ98IuCvLDKu4/ckzx
 q2lQ==
X-Gm-Message-State: AOAM531pNIYfXb6Gk52aFKAM3QTYT+/IvHHqDCXw8iYXplqkVfcuHEqb
 NTDWmEs7e0fEVHKTn+D6BGSXGrwoiDbuMhjs6AHTJg==
X-Google-Smtp-Source: ABdhPJziXGuvZzENri3frf+wrhfF9pwsHIxWKUsgNiKEGNqwpEsa/j3uYsWTAYwfR2t/w1cQqzDdrE/DKG99LbtagsU=
X-Received: by 2002:a05:6512:2387:b0:43d:165:b5d1 with SMTP id
 c7-20020a056512238700b0043d0165b5d1mr23767900lfv.510.1646383942830; Fri, 04
 Mar 2022 00:52:22 -0800 (PST)
MIME-Version: 1.0
References: <CANXhq0p-Jv2HMNu9NaG=03yudanoqV6MH=LhiCspHbj5nTn+GQ@mail.gmail.com>
 <mhng-956767d2-f9fc-4d96-8a05-f7a618e3a16b@palmer-ri-x1c9>
In-Reply-To: <mhng-956767d2-f9fc-4d96-8a05-f7a618e3a16b@palmer-ri-x1c9>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 4 Mar 2022 16:52:11 +0800
Message-ID: <CANXhq0o6=z0e18MGgTvVhWMP8pabV29pdJe-n=ey-p50krGZ8w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Vinod <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
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
X-CRM114-CacheID: sfid-20220304_005225_205484_E55C17DA 
X-CRM114-Status: GOOD (  37.82  )
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

On Fri, Mar 4, 2022 at 4:43 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 15 Feb 2022 22:52:14 PST (-0800), zong.li@sifive.com wrote:
> > On Tue, Feb 15, 2022 at 8:06 PM Vinod Koul <vkoul@kernel.org> wrote:
> >>
> >> On 07-02-22, 14:30, Zong Li wrote:
> >> > It currently assumes that there are always four channels, it would
> >> > cause the error if there is actually less than four channels. Change
> >> > that by getting number of channel from device tree.
> >> >
> >> > For backwards-compatibility, it uses the default value (i.e. 4) when
> >> > there is no 'dma-channels' information in dts.
> >> >
> >> > Signed-off-by: Zong Li <zong.li@sifive.com>
> >> > ---
> >> >  drivers/dma/sf-pdma/sf-pdma.c | 21 ++++++++++++++-------
> >> >  drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
> >> >  2 files changed, 16 insertions(+), 13 deletions(-)
> >> >
> >> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> >> > index f12606aeff87..2ae10b61dfa1 100644
> >> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> >> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> >> > @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
> >> >  static int sf_pdma_probe(struct platform_device *pdev)
> >> >  {
> >> >       struct sf_pdma *pdma;
> >> > -     struct sf_pdma_chan *chan;
> >> >       struct resource *res;
> >> > -     int len, chans;
> >> >       int ret;
> >> >       const enum dma_slave_buswidth widths =
> >> >               DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> >> > @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
> >> >               DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> >> >               DMA_SLAVE_BUSWIDTH_64_BYTES;
> >> >
> >> > -     chans = PDMA_NR_CH;
> >> > -     len = sizeof(*pdma) + sizeof(*chan) * chans;
> >> > -     pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> >> > +     pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
> >> >       if (!pdma)
> >> >               return -ENOMEM;
> >> >
> >> > -     pdma->n_chans = chans;
> >> > +     ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> >> > +                                &pdma->n_chans);
> >> > +     if (ret) {
> >> > +             dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> >>
> >> This is useful for only debug i think, so dev_dbg perhaps
> >>
> >
> > Thanks for your suggestion, let me change it in the next version.
>
> Not sure if I'm missing something, but I don't see a v6.  I'm going to
> assume that one will be sent, but the suggested changes look minor
> enough so
>

I have been sending the v6 patchset, thank you for the review.

> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> LMK if you guys were expecting this to go in via the RISC-V tree,
> otherwise I'll assume this aimed at the dmaengine tree.  Probably best to keep
> all three together, so feel free to take the DTS updates as well -- having some
> shared tag never hurts, but the DTs don't move that much so any conflicts
> should be straight-forward to just fix at merge time.
>

Yes, if the v6 version is good enough and you could pick them into
RISC-V tree, I'd appreciate that. Thanks!

> Thanks!
>
> >> > +             pdma->n_chans = PDMA_MAX_NR_CH;
> >> > +     }
> >> > +
> >> > +     if (pdma->n_chans > PDMA_MAX_NR_CH) {
> >> > +             dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> >> > +             return -EINVAL;
> >> > +     }
> >> >
> >> >       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> >       pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> >> > @@ -556,7 +562,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> >> >       struct sf_pdma_chan *ch;
> >> >       int i;
> >> >
> >> > -     for (i = 0; i < PDMA_NR_CH; i++) {
> >> > +     for (i = 0; i < pdma->n_chans; i++) {
> >> >               ch = &pdma->chans[i];
> >> >
> >> >               devm_free_irq(&pdev->dev, ch->txirq, ch);
> >> > @@ -574,6 +580,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> >> >
> >> >  static const struct of_device_id sf_pdma_dt_ids[] = {
> >> >       { .compatible = "sifive,fu540-c000-pdma" },
> >> > +     { .compatible = "sifive,pdma0" },
> >> >       {},
> >> >  };
> >> >  MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
> >> > diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> >> > index 0c20167b097d..8127d792f639 100644
> >> > --- a/drivers/dma/sf-pdma/sf-pdma.h
> >> > +++ b/drivers/dma/sf-pdma/sf-pdma.h
> >> > @@ -22,11 +22,7 @@
> >> >  #include "../dmaengine.h"
> >> >  #include "../virt-dma.h"
> >> >
> >> > -#define PDMA_NR_CH                                   4
> >> > -
> >> > -#if (PDMA_NR_CH != 4)
> >> > -#error "Please define PDMA_NR_CH to 4"
> >> > -#endif
> >> > +#define PDMA_MAX_NR_CH                                       4
> >> >
> >> >  #define PDMA_BASE_ADDR                                       0x3000000
> >> >  #define PDMA_CHAN_OFFSET                             0x1000
> >> > @@ -118,7 +114,7 @@ struct sf_pdma {
> >> >       void __iomem            *membase;
> >> >       void __iomem            *mappedbase;
> >> >       u32                     n_chans;
> >> > -     struct sf_pdma_chan     chans[PDMA_NR_CH];
> >> > +     struct sf_pdma_chan     chans[PDMA_MAX_NR_CH];
> >>
> >> why waste memory allocating max, we know number of channels in probe,
> >> why not allocate runtime?
> >>
> >
> > I kept it there because I'd like to do minimum change in this patch
> > set. You're right, let me change it in the next version.
> >
> >> --
> >> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

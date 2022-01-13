Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0E7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9DXUIKD1qur2CnJjF6ykQ+9iw7+S8egJFMEmzs/C2k=; b=QmAjj7oXRxoG+8
	ez/Wxgwos7OUSvBVFYKBxV1IW/QxRFIYI0c7qcLmf6IzmXBvS4Wfg52Sa5H6GmCArJA5d4bLMUnrj
	ynqqtiEZJXl3AdapHHTXhKPn8o7hDtl+17kQ3ykzeb6vt2D9eXBKdgGnaoQZnLtBOAY6ABHg0QtOw
	+yOLZItqEoXIycX1zRhJcb8HQIJ9lEzt4sk73EL3YIf76V+vEXKlA7Rf/csX4ZFWkho47wrAqJ/c3
	T5sCaM4QZ8LuywKMTcb2tAz78SCO7fF89w31iuCtbbYEEawd1Q8PCah60WJUWRmL6m2VZ4m4xoJuu
	MNEo/f9m1luS6ZEH8uzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7uUs-004ytC-4B; Thu, 13 Jan 2022 07:26:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7uUp-004yrq-34
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 07:26:08 +0000
Received: by mail-lf1-x12f.google.com with SMTP id s30so16425112lfo.7
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LqEz1tdi+Dd5kBFVgy7VzOmS5HR1fqUYps8D18GxVbY=;
 b=cINt8NPb6J2QETAMUVvusHlCVGnH2oeK/jZ+W0YX50kGkDXF01Wdu6JPkeqwhjLpSp
 YYji7kjsL7guNBXqSVodAvb32hBKB4e7XboR0VXXP37z1ABNQ8WhZYIWNal1LEWy6JRE
 9Qsn72zK951tYkCBa8jZelBOsNb9JEQcwHeMe85fiDcOkkRi+P2Khsu3kPtQSTnPCd+a
 7InBhMnmSBDqo0/0vYYAXTFjYMAMK6158NP32i8K/HSvpzzYS7rj2mms17rdquThvMeV
 9u+zKppd96fVmuu6Mo0kk4JecUzPrXD7rzjehpsCPNVZ3FTiIb7An6As+BP00yAHsIxE
 wj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LqEz1tdi+Dd5kBFVgy7VzOmS5HR1fqUYps8D18GxVbY=;
 b=e2vPNc6FW8lCCDCuWKu6px+SSJ/5gSLABVqvJTsg9C5pTYcFCvRsW8XCx6xEhka6HC
 cJSlxyVemd0Ts/6glhb8YG7dGTTPlMfIN8UOfQHUZXMqoOXiPNZfvL7IHJidyzq5Z6KR
 bZYX3/awDrW7eYbJiyC2f6Nyl2NiABVFbGTDXicFW5ckZt4B/Z2mhVYMvoxG4vg0wRr5
 yNzcUTKvrwlS+xLlZshjDRN4NQ6MTR43atsas75oA9N8kQ+FOrd9DUWTo7vvU+ChvVst
 msAO6ivuJpCFhEUx9uWC9Z55k3TgVAdlzhg5KTlJIdudeJBCY47SV8rTGbeVSLE0XtR+
 gBvQ==
X-Gm-Message-State: AOAM532GnrBYXLnCN1ILK8kELHcUdTB5bVSEKpDwx6uV95yhTlIc7T5d
 JjkoQ2iwTPtE3JXOOS46l8ZJMRJPwD1FeAnDkZyksQ==
X-Google-Smtp-Source: ABdhPJx45gF1826s11G22AXgxEBxocaiU3nnPiirOQSz78+oGy8yoaupoJL4uFZMsf60KHnBhTNzsVhUmkhYr5xXbCE=
X-Received: by 2002:a05:6512:ea9:: with SMTP id
 bi41mr2519011lfb.510.1642058765513; 
 Wed, 12 Jan 2022 23:26:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641890718.git.zong.li@sifive.com>
 <78cfa00a02cbd10202040058af22a73caa9c5ae8.1641890718.git.zong.li@sifive.com>
 <CAMuHMdUogbyjU=vBuvocxofGFCwzdQndk9OTnVdP+RNA8HEFZQ@mail.gmail.com>
 <CANXhq0qpkArvELBDqOT=bnVCwvR47cxHN7oH1hYKr1Yt7zaGOQ@mail.gmail.com>
In-Reply-To: <CANXhq0qpkArvELBDqOT=bnVCwvR47cxHN7oH1hYKr1Yt7zaGOQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 13 Jan 2022 15:25:54 +0800
Message-ID: <CANXhq0rKsAsm4oSvnVqy385shoY2uTQOGUSqYdf-D=2xJ5vgWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, Vinod <vkoul@kernel.org>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_232607_228622_D1700B95 
X-CRM114-Status: GOOD (  40.28  )
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

On Thu, Jan 13, 2022 at 2:53 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Wed, Jan 12, 2022 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Zong,
> >
> > On Tue, Jan 11, 2022 at 9:51 AM Zong Li <zong.li@sifive.com> wrote:
> > > It currently assumes that there are always four channels, it would
> > > cause the error if there is actually less than four channels. Change
> > > that by getting number of channel from device tree.
> > >
> > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > is no 'dma-channels' information in dts.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > > @@ -484,21 +484,24 @@ static int sf_pdma_probe(struct platform_device *pdev)
> > >         struct sf_pdma *pdma;
> > >         struct sf_pdma_chan *chan;
> > >         struct resource *res;
> > > -       int len, chans;
> > > -       int ret;
> > > +       int len, ret;
> > >         const enum dma_slave_buswidth widths =
> > >                 DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > >                 DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
> > >                 DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> > >                 DMA_SLAVE_BUSWIDTH_64_BYTES;
> > >
> > > -       chans = PDMA_NR_CH;
> > > -       len = sizeof(*pdma) + sizeof(*chan) * chans;
> > > +       len = sizeof(*pdma) + sizeof(*chan) * PDMA_MAX_NR_CH;
> >
> > Why is the last part added (yes, this is a pre-existing issue)?
> > struct sf_pdma already contains space for chans[PDMA_MAX_NR_CH].
> > Either drop the last part, or change sf_pdma.chans[] to a flexible
> > array member.
> >
> > BTW, you can use the struct_size() or flex_array_size() helper
> > to calculate len.
>
> Thanks for your suggestions, let me fix it in the next version.
>
> >
> > >         pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > >         if (!pdma)
> > >                 return -ENOMEM;
> > >
> > > -       pdma->n_chans = chans;
> > > +       ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > > +                                  &pdma->n_chans);
> > > +       if (ret) {
> > > +               dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> > > +               pdma->n_chans = PDMA_MAX_NR_CH;
> > > +       }
> > >
> > >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > >         pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> > > @@ -556,7 +559,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> > >         struct sf_pdma_chan *ch;
> > >         int i;
> > >
> > > -       for (i = 0; i < PDMA_NR_CH; i++) {
> > > +       for (i = 0; i < pdma->n_chans; i++) {
> > >                 ch = &pdma->chans[i];
> >
> > If dma-channels in DT > PDMA_NR_CH, this becomes an out-of-bound
> > access.
> >
>
> Okay, let me get the min() between pdma->chans and PDMA_MAX_NR_CH,
> please let me know if it isn't good to you.

Please allow me give more details on it, I would compare the value of
pdma->chans with PDMA_MAX_NR_CH in probe function, and set the
pdma->chans to PDMA_MAX_NR_CH if the value in DT is bigger than
PDMA_MAX_NR_CH.

>
> > >
> > >                 devm_free_irq(&pdev->dev, ch->txirq, ch);
> > > diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> > > index 0c20167b097d..8127d792f639 100644
> > > --- a/drivers/dma/sf-pdma/sf-pdma.h
> > > +++ b/drivers/dma/sf-pdma/sf-pdma.h
> > > @@ -22,11 +22,7 @@
> > >  #include "../dmaengine.h"
> > >  #include "../virt-dma.h"
> > >
> > > -#define PDMA_NR_CH                                     4
> > > -
> > > -#if (PDMA_NR_CH != 4)
> > > -#error "Please define PDMA_NR_CH to 4"
> > > -#endif
> > > +#define PDMA_MAX_NR_CH                                 4
> > >
> > >  #define PDMA_BASE_ADDR                                 0x3000000
> > >  #define PDMA_CHAN_OFFSET                               0x1000
> > > @@ -118,7 +114,7 @@ struct sf_pdma {
> > >         void __iomem            *membase;
> > >         void __iomem            *mappedbase;
> > >         u32                     n_chans;
> > > -       struct sf_pdma_chan     chans[PDMA_NR_CH];
> > > +       struct sf_pdma_chan     chans[PDMA_MAX_NR_CH];
> > >  };
> > >
> > >  #endif /* _SF_PDMA_H */
> > -
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

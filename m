Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rc3AWUX4PKbru0pZL8Ow4MTmcVcLrI3ttsUx5aHxiTE=; b=sQKwDDjeBV8iX4
	fFJGbFWgrGuIyXENF3BUN0G3yWu9z2bc+4gkXqGam/feWnVdCbUzOsOZ1DPd0BYaSq+aS/1kiFJDr
	sp84IYAA9Uuyjt6UmibNJmr8/wkqOdNu7fC8Cgehgkp5v0dyYxscukNAbkCZahIHerHO8EOBu+3Er
	gCtMLPG4QWUU8LL8GQQ0qxQUk3EnUdoEsBeJY6EQG/B2sRdkM34vCJqkXxVI9tLb9FRCVo1LzI44l
	UHnWtkg4bQbFUI8OvvZxyYwwsdBvcbv6Kp7kl05KC4GA53t5QvgrLUC3krsYsZby9vKAQSGTiNifD
	Yrm9pdR6z3bkgC2K6cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAjYG-00DdQk-PE; Fri, 21 Jan 2022 02:21:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAjYE-00DdQG-LS
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 02:21:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id m1so28744925lfq.4
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 18:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=90SUwfZKnXAN2kM8GActo5Koq5JSCVfHKRRzgtkh5Os=;
 b=k41BhGLhKcQl33sjtk33LyRdUWfPbdGkg2+xYsaQP1bZcwv6NvVelCFt09dvXXlM/E
 LR2VgnNKeXQnlubrwXg/fRlKBaiomOtFGb2upZd8Uc3pHkOOy1Nq6dnia7X+Lay85xTM
 GOKJ9KMsNIgvt3VE1PaHwh3vXNUZ8URxwiKJntcFTa60dzZS66aLQEdpup9SAhT24yTj
 UkpmilzA5C9FmX0W2IT1WW5yNuLaTu5hjsIzHhf2scfRXGabfT7astzzgPRRByydQbrQ
 jCSLlqjnLqLipVYhrEqnwiBT3TjRa9iWZxh4oXD7eTX6ysIpjgAVCXQ3E4kJwHfGmwVR
 RR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=90SUwfZKnXAN2kM8GActo5Koq5JSCVfHKRRzgtkh5Os=;
 b=WHUBFSK6qtJLEFWeXHQXai4Zd1kcSShSDefWzu79VaTB/10kz1EayvjtSTxcCxMCwf
 8NEXrt90omAsisAD72w8UqKqY98vwZ5YagaDmNjnTLqr8DafblftPMG0D51wGup1rVav
 kTMdDfkOp5jACC6DwU3hulErBQjCSJASGiw0dul4UIcjrIm7fyQXLpx4lnw+40AenmWG
 b3guTnV1Q6h33r/sAo9LKxyqmBl5rDvr8X34xVGPYtwI1LxSWocQC0aS1LyMPpUPU02y
 GaKRzxLh731p5xlJL/h8gfckWI6DQpseUBkJDHnzLDW210Ysr4N00yuwYaeYoekQTHMN
 ChiQ==
X-Gm-Message-State: AOAM531Pj+Bx+1Ze+wwah5ZgW6+4zhAjSXEo+8mZ4ucYuzPikkpyx8cx
 +ek1FbDM5AqcXdy7wNNv3BpSl1hnrB3dSGANBhSDtA==
X-Google-Smtp-Source: ABdhPJzdiyBatU0LrtK6uPQFcURsoMznYoQLlvhCGLJzKacKUwAKALkzsj/4DLWi17fzhN4g+L7w7jNO0lwJlq2yRAo=
X-Received: by 2002:a05:6512:1114:: with SMTP id
 l20mr1955215lfg.410.1642731676933; 
 Thu, 20 Jan 2022 18:21:16 -0800 (PST)
MIME-Version: 1.0
References: <0d0b0a3ad703f5ef50611e2dd80439675bda666a.1642383007.git.zong.li@sifive.com>
 <mhng-5b3e2596-3558-4534-9229-26885ee4cc5c@palmer-ri-x1c9>
In-Reply-To: <mhng-5b3e2596-3558-4534-9229-26885ee4cc5c@palmer-ri-x1c9>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 Jan 2022 10:21:05 +0800
Message-ID: <CANXhq0ruGxjO0WPUipzZ7QQM1oEapyHAvb_aVQ_CMqVxbjc_BQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>,
 Vinod <vkoul@kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_182118_782791_83182E69 
X-CRM114-Status: GOOD (  30.92  )
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

On Fri, Jan 21, 2022 at 2:52 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 16 Jan 2022 17:35:28 PST (-0800), zong.li@sifive.com wrote:
> > It currently assumes that there are always four channels, it would
> > cause the error if there is actually less than four channels. Change
> > that by getting number of channel from device tree.
> >
> > For backwards-compatible, it uses the default value (i.e. 4) when there
> > is no 'dma-channels' information in dts.
>
> Some of the same wording issues here as those I pointed out in the DT
> bindings patch.
>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 20 +++++++++++++-------
> >  drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
> >  2 files changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> > index f12606aeff87..1264add9897e 100644
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
> > +             pdma->n_chans = PDMA_MAX_NR_CH;
> > +     }
> > +
> > +     if (pdma->n_chans > PDMA_MAX_NR_CH) {
> > +             dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> > +             return -EINVAL;
>
> Can we get away with just using only the number of channels the driver
> actually supports?  ie, just never sending an op to the channels above
> MAX_NR_CH?  That should leave us with nothing to track.

It might be a bit like when pdma->n_chans is bigger than the maximum,
set the pdma->chans to PDMA_MAX_NR_CH, then we could ensure that we
don't access the channels above the maximum. If I understand
correctly, I gave the similar thought in the thread of v2 patch, and
there are some discussions on that, but this way seems to lead to
hard-to-track problems.

>
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
> >  };
> >
> >  #endif /* _SF_PDMA_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

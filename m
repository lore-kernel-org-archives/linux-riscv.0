Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35220C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5TikKcR72O5VpCDGbTRzqk/TN66X1JXe/j3ZlfdBl8=; b=AVUMo+iFxLSzOY
	jEvLKgQCBWxPoGv+gEXbztbCZFtaxjoPx1WWHl1jURw5UZlezebE9Bx1akqtGUPOKFIGpmnfRCqrm
	ovL28vODt0C3P58bRcfph8ugHO0ZEE/KN3yT0BCy7tNGIMcaQlhGkwKDdoUOTyzurYn+8OW2usSsX
	9r0uMIrAPxqR3eyi2MqPh2O6kbx0VtyHU19tx0Hzk43BNvgrkk7qZuFfqV2e+/pzVrw57MW6kD5ML
	vGLJ2V5wobL6q2izAqQ2U3Vf9U8ZCyViTrmTLICW1dlhpLT8Qw8FHV6b5EXyfnmwY4fYGPIXOW70j
	b9p3J7GlyTHs69JENMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nApMW-00EH3d-Tn; Fri, 21 Jan 2022 08:33:36 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nApMT-00EH2h-KN
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 08:33:35 +0000
Received: by mail-ua1-f46.google.com with SMTP id c36so15531673uae.13
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jan 2022 00:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n56f2PNNQdieA9k1jX9tvG8Cwk+6C0TIvBu9rWE3i4o=;
 b=C95gLQEPihbCqk2MRt9UcsIxTMh8ht8LwOpA33rCQZBx1hjMEdHuygQ7GmmGTUTNqJ
 AZu4j6JWx83Sm4PGxs6fEY+hgsrE5kfCcGLYICZEDud4kW/J8U4wFJI4SnYzqrH6k7w+
 v9yl3h6lXWSDnjMA270mwElZyFvb+0dswm4S+wMLOeCS7fIv7wJVyU4zVFruCAKKKoK4
 Q6p+CX92YLjTGAo1jZ9UceNz1MjqCYA5aDfdTD6XSBYYQ11f1m1yAEoYmyums2oEp3eE
 2NcvAgkjEQw+rw4EuXcdCTh6U4QYa6dKAdD03OhWypii0IWNJJPWXH/cbDOpbrauJ1B1
 hImg==
X-Gm-Message-State: AOAM532UgMMVjOQNPbbHjo3xP3paWaJ5ahnZNjSfwlRagNpJR/+Eax+t
 npH/jkRW1chBStbeb0ZpaMM8xh/4wT8S5w==
X-Google-Smtp-Source: ABdhPJwsZpQxLnlScClMp8dj0Fz+OhAcAAB4ZjaCWv/p82icHuS6HCV01IDrq1lMxXz20s1Uz0YJ4g==
X-Received: by 2002:a05:6102:3563:: with SMTP id
 bh3mr1320283vsb.47.1642754011537; 
 Fri, 21 Jan 2022 00:33:31 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id p8sm324908vkm.23.2022.01.21.00.33.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 00:33:31 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id z15so1908081vkp.13
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jan 2022 00:33:30 -0800 (PST)
X-Received: by 2002:a1f:5702:: with SMTP id l2mr1220320vkb.33.1642754010512;
 Fri, 21 Jan 2022 00:33:30 -0800 (PST)
MIME-Version: 1.0
References: <0d0b0a3ad703f5ef50611e2dd80439675bda666a.1642383007.git.zong.li@sifive.com>
 <mhng-5b3e2596-3558-4534-9229-26885ee4cc5c@palmer-ri-x1c9>
 <CANXhq0ruGxjO0WPUipzZ7QQM1oEapyHAvb_aVQ_CMqVxbjc_BQ@mail.gmail.com>
In-Reply-To: <CANXhq0ruGxjO0WPUipzZ7QQM1oEapyHAvb_aVQ_CMqVxbjc_BQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jan 2022 09:33:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh_cXpbUeOmr_1K0dOJwGHSO0Ao=W43j5mpgvOiNyV9w@mail.gmail.com>
Message-ID: <CAMuHMdVh_cXpbUeOmr_1K0dOJwGHSO0Ao=W43j5mpgvOiNyV9w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Bin Meng <bin.meng@windriver.com>, 
 Green Wan <green.wan@sifive.com>, Vinod <vkoul@kernel.org>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_003333_695240_D7425C34 
X-CRM114-Status: GOOD (  37.02  )
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

Hi Zong, Palmer,

On Fri, Jan 21, 2022 at 3:21 AM Zong Li <zong.li@sifive.com> wrote:
> On Fri, Jan 21, 2022 at 2:52 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Sun, 16 Jan 2022 17:35:28 PST (-0800), zong.li@sifive.com wrote:
> > > It currently assumes that there are always four channels, it would
> > > cause the error if there is actually less than four channels. Change
> > > that by getting number of channel from device tree.
> > >
> > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > is no 'dma-channels' information in dts.
> >
> > Some of the same wording issues here as those I pointed out in the DT
> > bindings patch.
> >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>

> > > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > > @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
> > >  static int sf_pdma_probe(struct platform_device *pdev)
> > >  {
> > >       struct sf_pdma *pdma;
> > > -     struct sf_pdma_chan *chan;
> > >       struct resource *res;
> > > -     int len, chans;
> > >       int ret;
> > >       const enum dma_slave_buswidth widths =
> > >               DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > > @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
> > >               DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> > >               DMA_SLAVE_BUSWIDTH_64_BYTES;
> > >
> > > -     chans = PDMA_NR_CH;
> > > -     len = sizeof(*pdma) + sizeof(*chan) * chans;
> > > -     pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > > +     pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
> > >       if (!pdma)
> > >               return -ENOMEM;
> > >
> > > -     pdma->n_chans = chans;
> > > +     ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > > +                                &pdma->n_chans);
> > > +     if (ret) {
> > > +             dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> > > +             pdma->n_chans = PDMA_MAX_NR_CH;
> > > +     }
> > > +
> > > +     if (pdma->n_chans > PDMA_MAX_NR_CH) {
> > > +             dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> > > +             return -EINVAL;
> >
> > Can we get away with just using only the number of channels the driver
> > actually supports?  ie, just never sending an op to the channels above
> > MAX_NR_CH?  That should leave us with nothing to track.

In theory we can...

> It might be a bit like when pdma->n_chans is bigger than the maximum,
> set the pdma->chans to PDMA_MAX_NR_CH, then we could ensure that we
> don't access the channels above the maximum. If I understand
> correctly, I gave the similar thought in the thread of v2 patch, and
> there are some discussions on that, but this way seems to lead to
> hard-to-track problems.

... but that would mean that when a new variant appears that supports
more channels, no error is printed, and people might not notice
immediately that the higher channels are never used.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

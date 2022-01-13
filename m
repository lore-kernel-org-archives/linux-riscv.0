Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB8FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFynAxl8gvCE0zahraI7Vt4FSKfUwD2QmD40GGGT1DI=; b=VzADL5N+umb7+p
	wjxQc0dO2Pq2L7M/eDKkdiU/006LyxWr8V6z5AxmLIXcZc6rbsF2s/JPHdKSkTMXTuPeEzJJh3kSh
	f9YTgxtcCJx6R7gLjIZHw4a7SAk/I2V8IFsqXZpiSnPCqFvSBvNrsOnJIWXVd7shcmYERdlBfdJXK
	Cn2yoSqPgec9v67xM5vw1QHDp5NBYdTZ9nCnd4RddlPSdTk0rEBPT19Nl85mHHX19z+jnDrW25bBt
	NU5zv2hJjOWYtwoA57TaztoR2K74PPRQYJV6gRviGCrZSHPmLAvLDIy+wtoJSIZKPnZoyJWXhN0DE
	ttX3UFOU/j72xAUY8deg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7vvn-005A06-DH; Thu, 13 Jan 2022 08:58:03 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7vvf-0059wy-27
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 08:57:56 +0000
Received: by mail-ua1-f51.google.com with SMTP id l15so9687562uai.11
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 00:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbBEPLACDWPlnwwenFhgzoqyYNOO9jVGdUxMfFLqZ1s=;
 b=Sgyosx+lHetweAqLZ1nPtDrNaKRY+ZbNMrYQ34ZSsIqokWWPIv+3jz2dNL0aJgkRNw
 q9v3XHKbV33xqfRDY3N0Cv4VS6eT5veukxAvftYnFnBtX0NVB6kmLFm+rPIrFRVVjII2
 SZ/OS7QbmLAKJGBc8XuY6cF8rUS4RIRChmbU9Lq5mfvbfQ/x4bmrT1AfmlNwJq4n37Bx
 TpWTw5s3StNikPL3JBzXKNYCrmiqN9gN157nMnQm4U3XrTNojUJINEF0+8/gJlqR6Wof
 puAkd9rPDST620DSwxwora0N+hqSiH8BkLQiv3WRc7rOhK5p6X6hYaEfw36JSNkW/nGv
 RAhA==
X-Gm-Message-State: AOAM530gFI0tEIyvqzmWERss9C6ZFKqMj6VC4y6Ul2GK/74Ps39sVXke
 G3nAYiNtDjRLhZZYsckwjZyKU2F/o4SOQtG7
X-Google-Smtp-Source: ABdhPJz+NZkOPQ6q45MKqxjK+vpXuO+7CbpD+qx1pKyqJD0G3UIZMhreqL4/YM6x9Gbdh1AIppYSlw==
X-Received: by 2002:a05:6102:e4e:: with SMTP id
 p14mr1675851vst.26.1642064273070; 
 Thu, 13 Jan 2022 00:57:53 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id v12sm1403889vsr.8.2022.01.13.00.57.51
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:57:51 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id r15so9804982uao.3
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 00:57:51 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id
 h1mr1708060vsu.5.1642064271439; 
 Thu, 13 Jan 2022 00:57:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641890718.git.zong.li@sifive.com>
 <78cfa00a02cbd10202040058af22a73caa9c5ae8.1641890718.git.zong.li@sifive.com>
 <CAMuHMdUogbyjU=vBuvocxofGFCwzdQndk9OTnVdP+RNA8HEFZQ@mail.gmail.com>
 <CANXhq0qpkArvELBDqOT=bnVCwvR47cxHN7oH1hYKr1Yt7zaGOQ@mail.gmail.com>
 <CANXhq0rKsAsm4oSvnVqy385shoY2uTQOGUSqYdf-D=2xJ5vgWg@mail.gmail.com>
In-Reply-To: <CANXhq0rKsAsm4oSvnVqy385shoY2uTQOGUSqYdf-D=2xJ5vgWg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jan 2022 09:57:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUa8VCyocHzXGrQevEHiMVs_-p+qGpw_5ZFdOT66pv=Q@mail.gmail.com>
Message-ID: <CAMuHMdXUa8VCyocHzXGrQevEHiMVs_-p+qGpw_5ZFdOT66pv=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Zong Li <zong.li@sifive.com>
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
X-CRM114-CacheID: sfid-20220113_005755_161378_271C85C8 
X-CRM114-Status: GOOD (  42.33  )
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

Hi Zong,

On Thu, Jan 13, 2022 at 8:26 AM Zong Li <zong.li@sifive.com> wrote:
> On Thu, Jan 13, 2022 at 2:53 PM Zong Li <zong.li@sifive.com> wrote:
> > On Wed, Jan 12, 2022 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Jan 11, 2022 at 9:51 AM Zong Li <zong.li@sifive.com> wrote:
> > > > It currently assumes that there are always four channels, it would
> > > > cause the error if there is actually less than four channels. Change
> > > > that by getting number of channel from device tree.
> > > >
> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > > is no 'dma-channels' information in dts.
> > > >
> > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > > > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > > > @@ -484,21 +484,24 @@ static int sf_pdma_probe(struct platform_device *pdev)
> > > >         struct sf_pdma *pdma;
> > > >         struct sf_pdma_chan *chan;
> > > >         struct resource *res;
> > > > -       int len, chans;
> > > > -       int ret;
> > > > +       int len, ret;
> > > >         const enum dma_slave_buswidth widths =
> > > >                 DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > > >                 DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
> > > >                 DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> > > >                 DMA_SLAVE_BUSWIDTH_64_BYTES;
> > > >
> > > > -       chans = PDMA_NR_CH;
> > > > -       len = sizeof(*pdma) + sizeof(*chan) * chans;
> > > > +       len = sizeof(*pdma) + sizeof(*chan) * PDMA_MAX_NR_CH;
> > >
> > > Why is the last part added (yes, this is a pre-existing issue)?
> > > struct sf_pdma already contains space for chans[PDMA_MAX_NR_CH].
> > > Either drop the last part, or change sf_pdma.chans[] to a flexible
> > > array member.
> > >
> > > BTW, you can use the struct_size() or flex_array_size() helper
> > > to calculate len.
> >
> > Thanks for your suggestions, let me fix it in the next version.
> >
> > >
> > > >         pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > > >         if (!pdma)
> > > >                 return -ENOMEM;
> > > >
> > > > -       pdma->n_chans = chans;
> > > > +       ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > > > +                                  &pdma->n_chans);
> > > > +       if (ret) {
> > > > +               dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> > > > +               pdma->n_chans = PDMA_MAX_NR_CH;
> > > > +       }
> > > >
> > > >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > >         pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> > > > @@ -556,7 +559,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> > > >         struct sf_pdma_chan *ch;
> > > >         int i;
> > > >
> > > > -       for (i = 0; i < PDMA_NR_CH; i++) {
> > > > +       for (i = 0; i < pdma->n_chans; i++) {
> > > >                 ch = &pdma->chans[i];
> > >
> > > If dma-channels in DT > PDMA_NR_CH, this becomes an out-of-bound
> > > access.
> > >
> >
> > Okay, let me get the min() between pdma->chans and PDMA_MAX_NR_CH,
> > please let me know if it isn't good to you.
>
> Please allow me give more details on it, I would compare the value of
> pdma->chans with PDMA_MAX_NR_CH in probe function, and set the
> pdma->chans to PDMA_MAX_NR_CH if the value in DT is bigger than
> PDMA_MAX_NR_CH.

Silently limiting "dma-channels" to PDMA_MAX_NR_CH is not a good idea,
as that may lead to hard-to-track problems.

Basically you have two options:
  1. Just use the value of "dma-channels" if present.
     This has the advantage that it will work automatically with
     future variants that have more channels, but allows the
     developer to trigger memory exhaustion by providing a very large value.
  2. Return -EINVAL if "dma-channels" is larger than PDMA_MAX_NR_CH.
     This is the safest, but requires driver changes for a future variant
      that has more channels.

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

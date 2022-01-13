Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D13C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jan 2022 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbDocZSi0SX1YuMPNu+Q799lSMipHU5yJbS6aqry+Is=; b=E45aHa+AZGIQT+
	ZdRBd1x1qRwbsy5OtqfJiHoE/Xa6qNyhno2feR2IlHo3rvKNQuolMxabhmJ3QDPu57e3LCIlIxJtC
	S+P2BFgvdg0HYCW9pnYKc8LR3/V2w5qkPLJIUwrcrMsmsjZskK7vs8Gh+aEoT/xTzs1WngjSwhRpX
	f5jnGK9fxberh7Bkufe7UXJVrk+e/GvJ8rwvziE3N/E2pj+7MBXB4aBDoySkl/2Iwa9zHx/dMgV8B
	p8DhRj/uftwG58BN6R+hCWLF3FkF82LWg1Def3gEf1d8iFdb5vSBfUX2LpGSEdguuOoMBM7Ssw8Dj
	O0ktiDtZGYsvlnfCsI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7wV9-005HQZ-DN; Thu, 13 Jan 2022 09:34:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7wV6-005HQF-QW
 for linux-riscv@lists.infradead.org; Thu, 13 Jan 2022 09:34:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id p27so5704249lfa.1
 for <linux-riscv@lists.infradead.org>; Thu, 13 Jan 2022 01:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BFaUjGoSq7CJXt63qYZ1DRgGRGveZoeVpigHF/5JHIs=;
 b=OZZ0AGhpKURBrrphAoZPlAwBk3kW6t6XYKMow4h8n9xldl+WbgIYjGY4KOcrl8dyak
 wWTf9L2Kr0ZolWIUnG1GqgGaSHYwWBNs/psu+cK2UyV29eL9fwKdu6l8ElJxm9M9Xjfd
 HWOuOgX+DSO1Ayi8QiZKn60Nmi69FZ3JDOxgeMahQE/t2/Jo4pIO2sIDfRE7iwZ8biDg
 JMixPoeCxyFgOoafKljyPT86K2L7Hwg0pktBE+Cn8vjHvpaWpIMRfmGUd5XbEzNffg2B
 MtmgN2pCTAXEOi3/ZMKr0MUGzSzKI/7K/h6SI800+57WHFAyM3dqErp4FivrRVa+G/9C
 Bsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BFaUjGoSq7CJXt63qYZ1DRgGRGveZoeVpigHF/5JHIs=;
 b=7MaleEci8J+wyT5268j0vTVnJ7yuH5TTVHwWBYKcEU/q9iOgPzfsN9xbWa2XGVym05
 uA1L712zld53DnFTaizu4cOrHCL9fr447ea9uGlOV1C0MLwU8Xk4qm828ADWotU8xvw2
 nIdYXES1nE9cVWzRZwDIGN1jaTk0f2p9LZsl3ql6WIzR8g47AUPUL3+BMzfYZItBhTuR
 KiHk3lrjilzeMvss5BfWlci8gCK7v1TOHlDurIanVc+XDLbuBzgDt15pYX3i21dzj7zR
 MX9QVCdcj044FbRCGzwLPhdzumk/fuFWfHm7Bz2kRMkXFVRvr7SnPqOPJWXkn0ypyh09
 6e0g==
X-Gm-Message-State: AOAM531Lf4KsNGOE5GtvBRyUvvZUdxQ7zGAgjRLjmOIgoBpvl0fuDpJ/
 WDMcKO5gmrj13C7wkGmGbElp+SXEedn3Ft4qPiebMA==
X-Google-Smtp-Source: ABdhPJyOFWmaizdavabg4PJIlZzvvNVJDR+WalBfCRioqzOdzZEfBNh1SRLA5SkHkSHF4xEe1l5bY0rbPT7Iu7+GQqs=
X-Received: by 2002:a05:6512:280c:: with SMTP id
 cf12mr2806560lfb.5.1642066471295; 
 Thu, 13 Jan 2022 01:34:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641890718.git.zong.li@sifive.com>
 <78cfa00a02cbd10202040058af22a73caa9c5ae8.1641890718.git.zong.li@sifive.com>
 <CAMuHMdUogbyjU=vBuvocxofGFCwzdQndk9OTnVdP+RNA8HEFZQ@mail.gmail.com>
 <CANXhq0qpkArvELBDqOT=bnVCwvR47cxHN7oH1hYKr1Yt7zaGOQ@mail.gmail.com>
 <CANXhq0rKsAsm4oSvnVqy385shoY2uTQOGUSqYdf-D=2xJ5vgWg@mail.gmail.com>
 <CAMuHMdXUa8VCyocHzXGrQevEHiMVs_-p+qGpw_5ZFdOT66pv=Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXUa8VCyocHzXGrQevEHiMVs_-p+qGpw_5ZFdOT66pv=Q@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 13 Jan 2022 17:34:19 +0800
Message-ID: <CANXhq0qzwj1XtLk2+D=HDu4ibpnT9AAhg2=F5m4th_D9M1Er1Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220113_013432_942519_D477BBD0 
X-CRM114-Status: GOOD (  45.81  )
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

On Thu, Jan 13, 2022 at 4:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Zong,
>
> On Thu, Jan 13, 2022 at 8:26 AM Zong Li <zong.li@sifive.com> wrote:
> > On Thu, Jan 13, 2022 at 2:53 PM Zong Li <zong.li@sifive.com> wrote:
> > > On Wed, Jan 12, 2022 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Jan 11, 2022 at 9:51 AM Zong Li <zong.li@sifive.com> wrote:
> > > > > It currently assumes that there are always four channels, it would
> > > > > cause the error if there is actually less than four channels. Change
> > > > > that by getting number of channel from device tree.
> > > > >
> > > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > > > is no 'dma-channels' information in dts.
> > > > >
> > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > > > > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > > > > @@ -484,21 +484,24 @@ static int sf_pdma_probe(struct platform_device *pdev)
> > > > >         struct sf_pdma *pdma;
> > > > >         struct sf_pdma_chan *chan;
> > > > >         struct resource *res;
> > > > > -       int len, chans;
> > > > > -       int ret;
> > > > > +       int len, ret;
> > > > >         const enum dma_slave_buswidth widths =
> > > > >                 DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > > > >                 DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
> > > > >                 DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> > > > >                 DMA_SLAVE_BUSWIDTH_64_BYTES;
> > > > >
> > > > > -       chans = PDMA_NR_CH;
> > > > > -       len = sizeof(*pdma) + sizeof(*chan) * chans;
> > > > > +       len = sizeof(*pdma) + sizeof(*chan) * PDMA_MAX_NR_CH;
> > > >
> > > > Why is the last part added (yes, this is a pre-existing issue)?
> > > > struct sf_pdma already contains space for chans[PDMA_MAX_NR_CH].
> > > > Either drop the last part, or change sf_pdma.chans[] to a flexible
> > > > array member.
> > > >
> > > > BTW, you can use the struct_size() or flex_array_size() helper
> > > > to calculate len.
> > >
> > > Thanks for your suggestions, let me fix it in the next version.
> > >
> > > >
> > > > >         pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > > > >         if (!pdma)
> > > > >                 return -ENOMEM;
> > > > >
> > > > > -       pdma->n_chans = chans;
> > > > > +       ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > > > > +                                  &pdma->n_chans);
> > > > > +       if (ret) {
> > > > > +               dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> > > > > +               pdma->n_chans = PDMA_MAX_NR_CH;
> > > > > +       }
> > > > >
> > > > >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > >         pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> > > > > @@ -556,7 +559,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
> > > > >         struct sf_pdma_chan *ch;
> > > > >         int i;
> > > > >
> > > > > -       for (i = 0; i < PDMA_NR_CH; i++) {
> > > > > +       for (i = 0; i < pdma->n_chans; i++) {
> > > > >                 ch = &pdma->chans[i];
> > > >
> > > > If dma-channels in DT > PDMA_NR_CH, this becomes an out-of-bound
> > > > access.
> > > >
> > >
> > > Okay, let me get the min() between pdma->chans and PDMA_MAX_NR_CH,
> > > please let me know if it isn't good to you.
> >
> > Please allow me give more details on it, I would compare the value of
> > pdma->chans with PDMA_MAX_NR_CH in probe function, and set the
> > pdma->chans to PDMA_MAX_NR_CH if the value in DT is bigger than
> > PDMA_MAX_NR_CH.
>
> Silently limiting "dma-channels" to PDMA_MAX_NR_CH is not a good idea,
> as that may lead to hard-to-track problems.
>
> Basically you have two options:
>   1. Just use the value of "dma-channels" if present.
>      This has the advantage that it will work automatically with
>      future variants that have more channels, but allows the
>      developer to trigger memory exhaustion by providing a very large value.
>   2. Return -EINVAL if "dma-channels" is larger than PDMA_MAX_NR_CH.
>      This is the safest, but requires driver changes for a future variant
>       that has more channels.

Many thanks for your tips on that. The second approach might be better
to me, because it is safer and it seems to me that we don't currently
have a plan to extend the channels in the pdma. I will modify it in
the next version.

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

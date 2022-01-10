Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA52C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6S9dyiURL23t6znd6YY3lBAhIMmOr5v2lO6oZaS08I=; b=Zi21YAIJfm8X3s
	81cXWM5eHDJH+vj0LNxv6eBTP0S6Fwe+Yb8k+3OQgcFl/YCXyopYRfzRtSvjHJD77S8cJGrMGSTkP
	hiSxOHB0I0vC06FD7uGZ8tcL8ZdF5oBU5NZzTaWZo3tn49TgcgOshdQkpi+twZ+ifuaHGCGBoZk5n
	e/RjqT0oJOZWvVW2zdt0gu2yXE7me79zv6JO8V0I2INnWlAWY6pXwf+9DEZVlWYCdl8P7ROIgiS3L
	gNpkG/l1c+wn/DG2RCgzH/6LFIeZfcq19Uc7SFXxigweAvz9Twet5dDL1BPzlhEangwtkEcFMtnVL
	r6HyixIIXkin5iUr8WQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rWa-00AfUw-E0; Mon, 10 Jan 2022 10:03:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rWY-00AfTi-1i
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 10:03:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id br17so11192615lfb.6
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HY6zdUgUPJS0rZ9Ot4PacGAg8YII4kCfsueCrIhKQWY=;
 b=H/hhv/x8EzQOjr1k+fLZF3B7CAvRRYEH7EnnulDR8KojIxjB3Jy0WngKqCnaEJZ9AQ
 H0GkrpL2uvxKCxiv9iD7NNtwqZK4YVSuHoJVJdMspvcmsT+bo4kHO6v/eQZsyHnwY+Fs
 /GaHP+eN37cXeJJuFzW3OOD83ivkpGLwLWRFZNUDArSPWECEbLmip/A2l6chRcAHZPnH
 pBMKhag9gnvjHeu7p/ayq/nrNISo2mwFLpZAAGkL8TYvQavMqmLQbQBuYbxj2cvkaeTN
 +m54X7JjzHOTo3nN7z++KMhjAvF+iIF4NeRpmSy1O3ono0RiDTCbqRt09gFtj5HYwh6a
 FwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HY6zdUgUPJS0rZ9Ot4PacGAg8YII4kCfsueCrIhKQWY=;
 b=IRWszX2nYTLkmOXHNVnSpuMF0mQvgiJT3W8OVHoypUmBmrfNLFnOiEt9TUHqVBfhYT
 ybWYNvRzrwQLC5r58D8a5Ng9LdezIZSqMw7kcC3MyofGj1WHt2hEPhBQf+YyQ7Dk99rB
 xdSlnl73TrkbX9wZ5r+uCybvBPz9HbplB7XAl34lexWTsqtbtzJPaEFc2Uqjuku0xAD9
 x5FjP1+g7p/s4yDFNWiOUaKp8TTxGXhfGgclD4wq98ajAPIOFZ3Rh29uBKZkIwbYaaIG
 9pj8DUmIoSYpwpY2nx6b4jf/bvN0k1jYZvCj1L0nYOzDFR2GVDEO/NYhTGbJ56rFNm41
 z86w==
X-Gm-Message-State: AOAM5321A2IEiFYZGutwpSifbQ3OPUIJnbeXCFT3cbRNhNEWGMVgaOEI
 Yt7vVLJnHH343adYn81xAIkbeo8922yfDz5dQ0FuRw==
X-Google-Smtp-Source: ABdhPJzuq0aXiUP/F1mE5uAGsEE58SDn3kREJFq3JcX7qKN8JgezJdqYacYS9Vtb1vlZzcgPK6y7ZO0Wf1//9XS4ewg=
X-Received: by 2002:a05:6512:260a:: with SMTP id
 bt10mr19060865lfb.223.1641809011771; 
 Mon, 10 Jan 2022 02:03:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641289490.git.zong.li@sifive.com>
 <5a7786cff08d55d0e084cd28bc2800565fa2dce7.1641289490.git.zong.li@sifive.com>
 <CAMuHMdV5gbeaaXPfJ4EuYur0NChp3iurdzNzC_UOLDrGP7rZNA@mail.gmail.com>
In-Reply-To: <CAMuHMdV5gbeaaXPfJ4EuYur0NChp3iurdzNzC_UOLDrGP7rZNA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 10 Jan 2022 18:03:20 +0800
Message-ID: <CANXhq0r_x=xW37SGJfQRs11-+VL1oJKRHe1fxk3QbT_Qzy6-dQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
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
X-CRM114-CacheID: sfid-20220110_020334_180324_B4F9D2AC 
X-CRM114-Status: GOOD (  29.97  )
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

On Mon, Jan 10, 2022 at 4:58 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Zong,
>
> On Wed, Jan 5, 2022 at 6:44 AM Zong Li <zong.li@sifive.com> wrote:
> > It currently assumes that there are four channels by default, it might
> > cause the error if there is actually less than four channels. Change
> > that by getting number of channel from device tree.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
>
> Thanks for your patch!
>
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -484,21 +484,24 @@ static int sf_pdma_probe(struct platform_device *pdev)
> >         struct sf_pdma *pdma;
> >         struct sf_pdma_chan *chan;
> >         struct resource *res;
> > -       int len, chans;
> > -       int ret;
> > +       int len, ret;
> >         const enum dma_slave_buswidth widths =
> >                 DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> >                 DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
> >                 DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> >                 DMA_SLAVE_BUSWIDTH_64_BYTES;
> >
> > -       chans = PDMA_NR_CH;
> > -       len = sizeof(*pdma) + sizeof(*chan) * chans;
> > +       len = sizeof(*pdma) + sizeof(*chan) * PDMA_MAX_NR_CH;
> >         pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> >         if (!pdma)
> >                 return -ENOMEM;
> >
> > -       pdma->n_chans = chans;
> > +       ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > +                                  &pdma->n_chans);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "failed to read dma-channels\n");
> > +               return ret;
>
> Note that this is not backwards-compatible with existing DTBs, which
> lack the "dma-channels" property.
> Perhaps you want to fallback to a default of 4 instead?
>

Thanks for your advice. I would set n_chans to 4 in failure condition
for backwards-compatible.

> > +       }
> >
> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         pdma->membase = devm_ioremap_resource(&pdev->dev, res);
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

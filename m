Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6C1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43URgqRHYEss9URR6gG7PlPPgxTig8P2PLBcomk1t0I=; b=ZMUGO5UobTbLgJ
	o+iI1uEfsREpbw3S/tLp7E0PbW6MLjM4BYltCmB/F2HaZY3iuyQtdjLqlt1OTwUilwXpA9BImmR3R
	/A80C2BmNSUg7Pjkk/LHnCAd6QoIK+RQRr0PXAoWhY3I5W3YnnGgAQJ6RZby2+j8Fy6b3QGZiRw+9
	mJaedcR+8cjCpgIZo17Vwno53+l0vBAx+yx7yI7VOCU72StTTrNB0RtqAUkxkhpbpz5ogOr40s7+j
	HoI0ZmHC1tz0Ot3V4RJPNId4euVXv9WvUAuGoK4k6Ab48g6FHHCpJ3GJ6h+h6pHdATSuym4Soe5XH
	0YdGhv7KCXkhoD+sob7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qy6-00AN4w-42; Mon, 10 Jan 2022 09:27:58 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qVD-00A6j7-52
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 08:58:08 +0000
Received: by mail-ua1-f52.google.com with SMTP id l15so10674775uai.11
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 00:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzvAQJe2veQdg4DaRkaqygFL5jyj5pSAthDAblQ6LsI=;
 b=qH6Ul6jA5Mn23d/Dj+L11hMED2C4biblF/RvyXhgvqXZ5kWMxNO5O7GgR5IgfgyUkY
 M4tE/RKwQAD3VlRjmfIZk4txRd9hPNJQzHofTinAM+CvG3th2aw05+bd1Q8Wt67HWRi3
 TWSEy8nW92BqLZw/sqqOr1ZjnKjMdxvM56itaiksXcdgIp7Y3wEqeUWc1bIv1lABRXR9
 Xytr5qs/SPsSCAKxcYIZZ9+OqknWNrX5+mm0i/H6HrqnbC2je2H8G2guUSW5m6pOHMBQ
 LRkFPxSkMSJEHe5q6Pflcl6hOOsh90lvjVonoxJGFu351jQR1Z93RxXqsTZlHoO1nOb3
 3ZFg==
X-Gm-Message-State: AOAM533lQ3jUIo9KUjpm6VO8CXgvd8y+alRyMKwy9XsG/KkfDjBTIBuC
 MNiDc8n7fcHEIkC6SEbsyBf5bfF/Yy70fw==
X-Google-Smtp-Source: ABdhPJzCLiAaYxU9VxKoxo+wvgdIutJaqrz++x/F+TNiDhGYrxynGKideS6ip5QIh8Zzpckn4dIezg==
X-Received: by 2002:ab0:7c5c:: with SMTP id d28mr1428155uaw.123.1641805084688; 
 Mon, 10 Jan 2022 00:58:04 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id l202sm2196081vkl.40.2022.01.10.00.58.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:58:03 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id l68so7685391vkh.4
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 00:58:02 -0800 (PST)
X-Received: by 2002:a1f:1bd0:: with SMTP id b199mr13248764vkb.33.1641805082754; 
 Mon, 10 Jan 2022 00:58:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641289490.git.zong.li@sifive.com>
 <5a7786cff08d55d0e084cd28bc2800565fa2dce7.1641289490.git.zong.li@sifive.com>
In-Reply-To: <5a7786cff08d55d0e084cd28bc2800565fa2dce7.1641289490.git.zong.li@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 09:57:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5gbeaaXPfJ4EuYur0NChp3iurdzNzC_UOLDrGP7rZNA@mail.gmail.com>
Message-ID: <CAMuHMdV5gbeaaXPfJ4EuYur0NChp3iurdzNzC_UOLDrGP7rZNA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Bin Meng <bin.meng@windriver.com>, 
 green.wan@sifive.com, Vinod <vkoul@kernel.org>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005807_237119_696E68B4 
X-CRM114-Status: GOOD (  26.30  )
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

On Wed, Jan 5, 2022 at 6:44 AM Zong Li <zong.li@sifive.com> wrote:
> It currently assumes that there are four channels by default, it might
> cause the error if there is actually less than four channels. Change
> that by getting number of channel from device tree.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks for your patch!

> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -484,21 +484,24 @@ static int sf_pdma_probe(struct platform_device *pdev)
>         struct sf_pdma *pdma;
>         struct sf_pdma_chan *chan;
>         struct resource *res;
> -       int len, chans;
> -       int ret;
> +       int len, ret;
>         const enum dma_slave_buswidth widths =
>                 DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
>                 DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
>                 DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
>                 DMA_SLAVE_BUSWIDTH_64_BYTES;
>
> -       chans = PDMA_NR_CH;
> -       len = sizeof(*pdma) + sizeof(*chan) * chans;
> +       len = sizeof(*pdma) + sizeof(*chan) * PDMA_MAX_NR_CH;
>         pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
>         if (!pdma)
>                 return -ENOMEM;
>
> -       pdma->n_chans = chans;
> +       ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> +                                  &pdma->n_chans);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to read dma-channels\n");
> +               return ret;

Note that this is not backwards-compatible with existing DTBs, which
lack the "dma-channels" property.
Perhaps you want to fallback to a default of 4 instead?

> +       }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         pdma->membase = devm_ioremap_resource(&pdev->dev, res);

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

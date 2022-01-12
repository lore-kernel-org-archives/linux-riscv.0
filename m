Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A1AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYPTVw9yPw6fMDF80L3fQ15547pntw6JxU0CZtbDiWk=; b=TQABZCCK2rYRGp
	erD2f247UoQxnCPS/ibrXN0P2pA5KQXZxJ7ke1M7dCZExTXIJ4NEZC+4IgCOE+UMbvP31CJ09wxrb
	n+rH7KygeAsITGuezcTmST3L9gb5GE+ATPAE1ffID/eYMLJ2asGyRkWF+6a99yElVTVNv5DGBmZT+
	8Gl1ZvZkIldLYIDOgZx4TT02MU2XFyHjjbEyYIYwHcCdoi/SQ7sg9/7b388NuAI+qgKz14RY9uo/J
	gvNjQueq//1We0xp3G0z8MgLf5GCzu5BFr8zN6KRU+Ezot8+A5Yve0BiorVIdTy+g45kX5jzilgd5
	jcX4fv1/B0g+keSaYWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Z0D-001WZE-QW; Wed, 12 Jan 2022 08:29:05 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yzp-001WNl-Ga
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 08:28:42 +0000
Received: by mail-vk1-f180.google.com with SMTP id 19so1170277vkl.2
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 00:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ICGbwIc6WQlKE/ioYvNigSD06lESIz/s7WepMycFiZo=;
 b=Nw3U9nDaYdiJXhOrgXFlDefsQtJMJgT+JwAzqVBhnuhsEpJslDrSkYSFZSmrr/CdeS
 XU2cUqwBsFJ3DAK3YGtkekwUGDKshaKir3szL3h5aa6k61TLORjtMgMVyqjOmk9JIoPy
 sRaxX5dIT+0UDdI+KU0Qx9qyiknZfLfG7tngH9FkPB35mtXeGHg0l/DTiT2Fau10Guyl
 dhAzB3kwyPgQw61/nl9sEZgOFCHnjByU24TzVfJf8t5TY8VMKeuSg11nHpzzQYHpCjR8
 zYv8E2i8hrM43PBLbxgzlgjWmRgCMq7ZHxCsIJM3DlcrMDet7ycxWeXx/6I+bDXN8FwT
 LA8Q==
X-Gm-Message-State: AOAM532cAgLvWOIVg7larTMX3UGHsALh65H+sJ6xcpKTELecOg7nfNoN
 s3CRF2Rn0wfSkvkNkOixnROjkj2RSazgLw==
X-Google-Smtp-Source: ABdhPJwA2h1yNIY3Mpg5M5SM+suzxcc5/FXodHjeeGCPvcUOLJgmUPx0+XGl+Lj14OvGj5G4jKGL6w==
X-Received: by 2002:a05:6122:1805:: with SMTP id
 ay5mr3814657vkb.5.1641976119766; 
 Wed, 12 Jan 2022 00:28:39 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id z8sm4800808vsi.15.2022.01.12.00.28.39
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:28:39 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id u6so3440146uaq.0
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 00:28:39 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr3660457vsg.57.1641976118915; 
 Wed, 12 Jan 2022 00:28:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641890718.git.zong.li@sifive.com>
 <78cfa00a02cbd10202040058af22a73caa9c5ae8.1641890718.git.zong.li@sifive.com>
In-Reply-To: <78cfa00a02cbd10202040058af22a73caa9c5ae8.1641890718.git.zong.li@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 09:28:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUogbyjU=vBuvocxofGFCwzdQndk9OTnVdP+RNA8HEFZQ@mail.gmail.com>
Message-ID: <CAMuHMdUogbyjU=vBuvocxofGFCwzdQndk9OTnVdP+RNA8HEFZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
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
X-CRM114-CacheID: sfid-20220112_002841_588949_23E0815E 
X-CRM114-Status: GOOD (  32.82  )
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

On Tue, Jan 11, 2022 at 9:51 AM Zong Li <zong.li@sifive.com> wrote:
> It currently assumes that there are always four channels, it would
> cause the error if there is actually less than four channels. Change
> that by getting number of channel from device tree.
>
> For backwards-compatible, it uses the default value (i.e. 4) when there
> is no 'dma-channels' information in dts.
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

Why is the last part added (yes, this is a pre-existing issue)?
struct sf_pdma already contains space for chans[PDMA_MAX_NR_CH].
Either drop the last part, or change sf_pdma.chans[] to a flexible
array member.

BTW, you can use the struct_size() or flex_array_size() helper
to calculate len.

>         pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
>         if (!pdma)
>                 return -ENOMEM;
>
> -       pdma->n_chans = chans;
> +       ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> +                                  &pdma->n_chans);
> +       if (ret) {
> +               dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> +               pdma->n_chans = PDMA_MAX_NR_CH;
> +       }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         pdma->membase = devm_ioremap_resource(&pdev->dev, res);
> @@ -556,7 +559,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
>         struct sf_pdma_chan *ch;
>         int i;
>
> -       for (i = 0; i < PDMA_NR_CH; i++) {
> +       for (i = 0; i < pdma->n_chans; i++) {
>                 ch = &pdma->chans[i];

If dma-channels in DT > PDMA_NR_CH, this becomes an out-of-bound
access.

>
>                 devm_free_irq(&pdev->dev, ch->txirq, ch);
> diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
> index 0c20167b097d..8127d792f639 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.h
> +++ b/drivers/dma/sf-pdma/sf-pdma.h
> @@ -22,11 +22,7 @@
>  #include "../dmaengine.h"
>  #include "../virt-dma.h"
>
> -#define PDMA_NR_CH                                     4
> -
> -#if (PDMA_NR_CH != 4)
> -#error "Please define PDMA_NR_CH to 4"
> -#endif
> +#define PDMA_MAX_NR_CH                                 4
>
>  #define PDMA_BASE_ADDR                                 0x3000000
>  #define PDMA_CHAN_OFFSET                               0x1000
> @@ -118,7 +114,7 @@ struct sf_pdma {
>         void __iomem            *membase;
>         void __iomem            *mappedbase;
>         u32                     n_chans;
> -       struct sf_pdma_chan     chans[PDMA_NR_CH];
> +       struct sf_pdma_chan     chans[PDMA_MAX_NR_CH];
>  };
>
>  #endif /* _SF_PDMA_H */
-
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

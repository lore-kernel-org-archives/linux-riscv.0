Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4232EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9xct8X9dVOic8F5f3BcKEWPLIctMXDiWhfJGBWcmN0=; b=UEAoOD4wfpnlj3
	Ulm83OyO1DwXlLkyWajgKy2i9WIRaLd1Nke6gaB/1T9TXH7K00W0ZTeEBkCx3eOpobib5YuQZPjzL
	EEhczsPm4rSKKv2aCs+dYwEIEu9Gm2LN7mcr2i8tdMYRlSF0fPLBerKUkD5nRD4wmyF+FMZSFQtCR
	c1IvmghwdGlt1WOjK6gBMUqqwRs/Kmf3zTl6PXfW6THBGO3Rcu8tZZrj4KBJFFRstPuw9DeDFxA2X
	3zAOB0AgAZrWEhVMkIae0sQG+1OpgTOvM73BSfz/HSHuoVpxnUk1AXADeccIiTAY1uq8Z4IqfyPOL
	7fakLwVakGHv7hldL1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nArAh-00EfDK-O8; Fri, 21 Jan 2022 10:29:31 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nArAe-00EfCI-68
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 10:29:29 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id l68so25683266ybl.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jan 2022 02:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8w6xWRpa7rbpkggVeukinLzBFh9GxZQwFDGtpRnC44=;
 b=m52NB69onp/zx9ahchIitMVkr5LhjxaNcYFjkdcinu6bnm9NAQJTjMrHBbkgeM9OfC
 HXftb2G62xf1sm5KLZvxgQ3rvesY+Sc/YcBdei2LGNQPra9qIgiu+UDhbDLA/VlfLBNt
 skF2g3Rsb9f2kPHcPaRq4sQv1t9DmTSjopwjSJ3rTiLL8Eua0dYVlPgXR0O7SbecPdOj
 6s2IrOUSUF9GNbarrDN+oMV7NtJ0sWXDzbFR7oEP8DyZq8+FHuynvTWwPi7p5nB5xNwS
 gYi+WSDxq/CnJBmKrW3oQXzXVfOQqViHni+3d2n5l4giZdSD6XLNDjEMoA6tfnqg5H1N
 /vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8w6xWRpa7rbpkggVeukinLzBFh9GxZQwFDGtpRnC44=;
 b=UD1fp4FmAYnnt4T6oliiTI6Ehnflh3VB7lZ6SZtnzAqqc4YZ4arDE35qySvAEfYjzh
 O/IVZjQTUMtecLQYzHs/IvhLrxPYnPZKp6YjXGrJKKOU256u4mXUN7m5whBh0NOi+hc2
 5GkYAHI6emfkJurH6Ue/TMoDrsu4hmZbPduj1YEmCq0PKey2JlJwFQ07N9kxBGGmoRCp
 q//vXJbGWhSxIa/3fKC3oz2cKWph+0/AgLzlBr+uDvnIX/0VHiMZL6IC1yD7EZv6jmoK
 Yowcw9KNdyZROUas1LlUKlmvinyGbsg0n44fWn6VIvrIdWbBdjDtCqKR97I8y6LQBtts
 UfaQ==
X-Gm-Message-State: AOAM531t1CvoHHun5Sec5XrfPS7CEvrFMiidG9D+sqgZfBncvfyAv7u/
 J+jD81HrzJ+EfVIz6A78lb0j1H4BcZiBuv0Pn2/gjA==
X-Google-Smtp-Source: ABdhPJxm744i+nISDqxOsYuvMp+v23wPfnB2Z/8fLa4of8nEAD0vpc980qigY5xY1bfcMU3/heJwA/3CEi3t6OXMJUQ=
X-Received: by 2002:a25:2507:: with SMTP id l7mr5166575ybl.526.1642760966773; 
 Fri, 21 Jan 2022 02:29:26 -0800 (PST)
MIME-Version: 1.0
References: <0d0b0a3ad703f5ef50611e2dd80439675bda666a.1642383007.git.zong.li@sifive.com>
 <mhng-5b3e2596-3558-4534-9229-26885ee4cc5c@palmer-ri-x1c9>
 <CANXhq0ruGxjO0WPUipzZ7QQM1oEapyHAvb_aVQ_CMqVxbjc_BQ@mail.gmail.com>
 <CAMuHMdVh_cXpbUeOmr_1K0dOJwGHSO0Ao=W43j5mpgvOiNyV9w@mail.gmail.com>
In-Reply-To: <CAMuHMdVh_cXpbUeOmr_1K0dOJwGHSO0Ao=W43j5mpgvOiNyV9w@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 Jan 2022 18:29:15 +0800
Message-ID: <CANXhq0oTrVMhY19odFHroJKXmW1dROdS5J5YR-osO9uwbr9GKA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dmaengine: sf-pdma: Get number of channel by
 device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20220121_022928_278304_7BD06165 
X-CRM114-Status: GOOD (  43.05  )
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

On Fri, Jan 21, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Zong, Palmer,
>
> On Fri, Jan 21, 2022 at 3:21 AM Zong Li <zong.li@sifive.com> wrote:
> > On Fri, Jan 21, 2022 at 2:52 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > On Sun, 16 Jan 2022 17:35:28 PST (-0800), zong.li@sifive.com wrote:
> > > > It currently assumes that there are always four channels, it would
> > > > cause the error if there is actually less than four channels. Change
> > > > that by getting number of channel from device tree.
> > > >
> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > > is no 'dma-channels' information in dts.
> > >
> > > Some of the same wording issues here as those I pointed out in the DT
> > > bindings patch.
> > >
> > > > Signed-off-by: Zong Li <zong.li@sifive.com>
>
> > > > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > > > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > > > @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
> > > >  static int sf_pdma_probe(struct platform_device *pdev)
> > > >  {
> > > >       struct sf_pdma *pdma;
> > > > -     struct sf_pdma_chan *chan;
> > > >       struct resource *res;
> > > > -     int len, chans;
> > > >       int ret;
> > > >       const enum dma_slave_buswidth widths =
> > > >               DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > > > @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
> > > >               DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> > > >               DMA_SLAVE_BUSWIDTH_64_BYTES;
> > > >
> > > > -     chans = PDMA_NR_CH;
> > > > -     len = sizeof(*pdma) + sizeof(*chan) * chans;
> > > > -     pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > > > +     pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
> > > >       if (!pdma)
> > > >               return -ENOMEM;
> > > >
> > > > -     pdma->n_chans = chans;
> > > > +     ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > > > +                                &pdma->n_chans);
> > > > +     if (ret) {
> > > > +             dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> > > > +             pdma->n_chans = PDMA_MAX_NR_CH;
> > > > +     }
> > > > +
> > > > +     if (pdma->n_chans > PDMA_MAX_NR_CH) {
> > > > +             dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> > > > +             return -EINVAL;
> > >
> > > Can we get away with just using only the number of channels the driver
> > > actually supports?  ie, just never sending an op to the channels above
> > > MAX_NR_CH?  That should leave us with nothing to track.
>
> In theory we can...
>
> > It might be a bit like when pdma->n_chans is bigger than the maximum,
> > set the pdma->chans to PDMA_MAX_NR_CH, then we could ensure that we
> > don't access the channels above the maximum. If I understand
> > correctly, I gave the similar thought in the thread of v2 patch, and
> > there are some discussions on that, but this way seems to lead to
> > hard-to-track problems.
>
> ... but that would mean that when a new variant appears that supports
> more channels, no error is printed, and people might not notice
> immediately that the higher channels are never used.
>

I guess people might need to follow the dt-bindings, so they couldn't
specify the number of channels to the value which is more than
maximum. But as you mentioned, if people don't notice that and specify
it more than maximum,  they wouldn't be aware that the higher channels
are never used. It seems to me that we could keep returning the error
there, or show a warning message and use PDMA_MAX_NR_CH in that
situation, both looks good to me.

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

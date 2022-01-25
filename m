Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F58C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIxJ4gLLxnRLXdIKnCYsK3wtsv9XIcIEG+gxuZ6TbKo=; b=0mV9/pElN9Z0ek
	Tf0PaSDbDOOSv9SPSB5jgrHxdY4fvNk7sK9xUj5Xy0RqOsjxzafJWWOhcRznGk2O0D8wYE5pz70rc
	iSGbE5az/z5OKKAM0MRQm6On/w/XVEqEP7UPmy6HE0emSKrD6TLt0GQwVbLT/3r60YbsVMtQeudGj
	Z52bHpxFMqfXetWwj9sTfzZPSZFvGT3o0i64KY5/OBLbBZ/GCu79G3si5QXt1f6HBSmkPS/hwE8Lm
	tjHTUSUVhUIziAo5tvS/KCrLWOu6QKJWnAJYiiX7CD65GrkCAA8JSiNv8a1+qAmNaBuWbpec5Whhx
	ViPxk1IKeTibh4c7UMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCE4K-006T6n-R9; Tue, 25 Jan 2022 05:08:36 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCE4I-006T6F-4u
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:08:35 +0000
Received: by mail-lj1-x232.google.com with SMTP id q22so6308465ljh.7
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GxSSyNnOqzCbDA/E9stdLnXQVVTk0qCNicklKSphmTE=;
 b=XEpVz6JCzRlwvzrVHSlio1hJXN0I7Jo6RUS5WdJB14stes+pFX/TT0467/drOAtV4F
 Fafx04YchRFLS+NrdBHCAVYSrZeyfGWQJgO4yCFWZ7TNS9nRbfOEXhHc0p8bLu2j1nGx
 DGm/hPyrHFSepZnu3ufjhHKobDXEsFymq0ySxjPE+KB27IFzhaSyGizFo5pl1Etijd0i
 0rWi31Vci8bBF2yteqOmvuMbBsxqQQm7x6M6rLK3Q1uvUO41150UWdvM2ZTZlf2m/5oH
 iYRqc5B2RKbZYDT2Qmx+L78jmyd89HwnG+Dkzh+HrKzMJRoZ8tp5y6Pa4i29N916vZwE
 xvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GxSSyNnOqzCbDA/E9stdLnXQVVTk0qCNicklKSphmTE=;
 b=mQICc5GDn1vl+2hbGZjNTlycXvM5a+vk+I8dLSFLVV+JoH1VPIlsbJ6IpHc64lf15W
 EHt9XFjajAQVizjodFjZ5mezvMCpew38K7RsdBbDmFL2wJ+bLYsYviyaiCGDPODlQ7wY
 gDnm7JsG09Cvy4WqxCKK11nhvs1KGAaCAvHqHUbPEfXY9g+BDBLJJu7F0czXpIjpKilG
 t2Z9HDIjezcap3XN2ckoCI/TAquJ5MGzQ3wYodMHTw8mDEA8frraJS7x0nWjom0Je6D2
 BjSBYh3Ddl/NE2Y7Jrfz2ApvypSLy34xPYn3gv3+r5rAiI62KhQ3Jr/mKKsWrKT5gziQ
 82fA==
X-Gm-Message-State: AOAM531kQo/F3/O3jmbAEmD/iuvqPsNxAWcaoPwXDIYjrFT5XREi2oo4
 Ae2eNTfAIuo5zjZyqv5nL897d5YtXuqKekT2WMQmPb6FcVpk0g==
X-Google-Smtp-Source: ABdhPJz8G5O7CyRA7YfvnePDrgsxGm48JXzLciOKTXj+4VHnx7wVcDu1IeHFxk8DtOhTpLN4KlQ+FL8pGOHi0tssC/U=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr13188020lja.52.1643087309734; 
 Mon, 24 Jan 2022 21:08:29 -0800 (PST)
MIME-Version: 1.0
References: <0d0b0a3ad703f5ef50611e2dd80439675bda666a.1642383007.git.zong.li@sifive.com>
 <mhng-5b3e2596-3558-4534-9229-26885ee4cc5c@palmer-ri-x1c9>
 <CANXhq0ruGxjO0WPUipzZ7QQM1oEapyHAvb_aVQ_CMqVxbjc_BQ@mail.gmail.com>
 <CAMuHMdVh_cXpbUeOmr_1K0dOJwGHSO0Ao=W43j5mpgvOiNyV9w@mail.gmail.com>
 <CANXhq0oTrVMhY19odFHroJKXmW1dROdS5J5YR-osO9uwbr9GKA@mail.gmail.com>
In-Reply-To: <CANXhq0oTrVMhY19odFHroJKXmW1dROdS5J5YR-osO9uwbr9GKA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 25 Jan 2022 13:08:18 +0800
Message-ID: <CANXhq0rODPACKVuUgz=7_S0JW0Rp+RGCQawPQ9ruYCQH87ZQoA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220124_210834_251632_C6E04115 
X-CRM114-Status: GOOD (  48.93  )
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

On Fri, Jan 21, 2022 at 6:29 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Fri, Jan 21, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Zong, Palmer,
> >
> > On Fri, Jan 21, 2022 at 3:21 AM Zong Li <zong.li@sifive.com> wrote:
> > > On Fri, Jan 21, 2022 at 2:52 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > > On Sun, 16 Jan 2022 17:35:28 PST (-0800), zong.li@sifive.com wrote:
> > > > > It currently assumes that there are always four channels, it would
> > > > > cause the error if there is actually less than four channels. Change
> > > > > that by getting number of channel from device tree.
> > > > >
> > > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > > > is no 'dma-channels' information in dts.
> > > >
> > > > Some of the same wording issues here as those I pointed out in the DT
> > > > bindings patch.
> > > >
> > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> >
> > > > > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > > > > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > > > > @@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
> > > > >  static int sf_pdma_probe(struct platform_device *pdev)
> > > > >  {
> > > > >       struct sf_pdma *pdma;
> > > > > -     struct sf_pdma_chan *chan;
> > > > >       struct resource *res;
> > > > > -     int len, chans;
> > > > >       int ret;
> > > > >       const enum dma_slave_buswidth widths =
> > > > >               DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
> > > > > @@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
> > > > >               DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
> > > > >               DMA_SLAVE_BUSWIDTH_64_BYTES;
> > > > >
> > > > > -     chans = PDMA_NR_CH;
> > > > > -     len = sizeof(*pdma) + sizeof(*chan) * chans;
> > > > > -     pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> > > > > +     pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
> > > > >       if (!pdma)
> > > > >               return -ENOMEM;
> > > > >
> > > > > -     pdma->n_chans = chans;
> > > > > +     ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
> > > > > +                                &pdma->n_chans);
> > > > > +     if (ret) {
> > > > > +             dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
> > > > > +             pdma->n_chans = PDMA_MAX_NR_CH;
> > > > > +     }
> > > > > +
> > > > > +     if (pdma->n_chans > PDMA_MAX_NR_CH) {
> > > > > +             dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
> > > > > +             return -EINVAL;
> > > >
> > > > Can we get away with just using only the number of channels the driver
> > > > actually supports?  ie, just never sending an op to the channels above
> > > > MAX_NR_CH?  That should leave us with nothing to track.
> >
> > In theory we can...
> >
> > > It might be a bit like when pdma->n_chans is bigger than the maximum,
> > > set the pdma->chans to PDMA_MAX_NR_CH, then we could ensure that we
> > > don't access the channels above the maximum. If I understand
> > > correctly, I gave the similar thought in the thread of v2 patch, and
> > > there are some discussions on that, but this way seems to lead to
> > > hard-to-track problems.
> >
> > ... but that would mean that when a new variant appears that supports
> > more channels, no error is printed, and people might not notice
> > immediately that the higher channels are never used.
> >
>
> I guess people might need to follow the dt-bindings, so they couldn't
> specify the number of channels to the value which is more than
> maximum. But as you mentioned, if people don't notice that and specify
> it more than maximum,  they wouldn't be aware that the higher channels
> are never used. It seems to me that we could keep returning the error
> there, or show a warning message and use PDMA_MAX_NR_CH in that
> situation, both looks good to me.
>

Hi all, thank you for the review, I'd like to prepare the next version
patch, if current implementation of this part is ok to you, I will
keep it in the next version. Please let me know if anything can be
improved. Thanks

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

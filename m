Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3605C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 22:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE8A2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 22:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ssOA8CFi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAz2RmJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE8A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEL7nwsUePrZnwUBXw/TAkgN9m4y1grkr3yaVC4zRIg=; b=ssOA8CFidENBmU
	ogjl49GyQAGUK/dWAVilS990xgtQkXm1NqTztoEGp5Ad42Iq8rwh1HUjG2fevy+STJUy2xxUCFZYh
	NHJRBIw91BPdmYMxusoHtY8MyNEizKw+12/NaDT7kjdeYLYp3bujqtDgsgkUfxsBQCzUDJBPJdkjR
	EmFg9ZTcGidmCu2YLYH3c7HB2LpsqAD3QWA43Hz2Zfx7IZqAH1IJQkd543rF+5YASmz0lP8hjpum1
	MxTJYBg8xghjK+nvOmqnxThRSxMzt/DGdT/TkSQDDpiHCDNH4PzE2eABZhFaVvQBC7uiO2s3b5yiZ
	uKyRDI+ZXBaGHyks8JeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzUOI-0008B0-ND; Thu, 28 Feb 2019 22:42:58 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzUOD-00089w-Eb
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 22:42:57 +0000
Received: by mail-lj1-x242.google.com with SMTP id d24so18384150ljc.12
 for <linux-riscv@lists.infradead.org>; Thu, 28 Feb 2019 14:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QzZ+n7IBdI2RXmQ15IzwcgP+pV0cSReqXSAMzq87oLo=;
 b=WAz2RmJbM6BkcX457lDuCbCQaYBv2DSxw7oZFusOuJIcAs3Qkd/3d0YbbaUq1dSw/z
 bsgUIILqV4bLOPkKuvVVMblM8H6LAmVrPi08swdxzggC4ATQV4xhpJE202H40EENr0vy
 PWeU1Rey5YERkN1Ru1wB0j+M7kX3YtsDQKBVKAa1maY2euDu4mI8zSWqfNbZgA9UutQk
 962aEQrwgHZsXx11rvnFuKSOwhU0FvwzNJ96/3A0+yMuC8++etRri7lPlgKiWaF0ijny
 0fZZqr0fX4xioS0GkO3PxFJF4Fj1uAt/FZmary9POSa3ayja233U/2InjmSBGeikkbjA
 P8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzZ+n7IBdI2RXmQ15IzwcgP+pV0cSReqXSAMzq87oLo=;
 b=Wub95AqwMkczJ2IyMkKYCAo/nAXE+57ogGQD9iPIW+hcQ7SHpsdSRLJnqFQxoOp0yb
 nmp5tfD+J3EgRUGY4MbbHm+tTkVxvXVrcTsyRdrm9Vp2Fo4W0dc9Pw+ZN7NICMN1/2ZB
 k3YfKmbFyAnVuzUtdW6y+Ykwc8KglCGOikMio9LVWHoJTa8bowcGEdBryZYLLuCXzMrl
 68UZIXhII2vN+SYnIBSIEKkmpH6NqfwS6rs2teGlfOsxgqesfFNPOA1FS4CLo9a4qR5m
 XTmVsfYhcJZm6jItr/pRmvOowld0x8e26Y4pmFtiB296tRI5M8CaELFPHwZbeSFK/9GG
 m9Hg==
X-Gm-Message-State: APjAAAWAEWQSFqP9jyB14ZPBXfjnVp8wSrN5Ykfh1edXfhZiCJAiqpyR
 ErxL2Z+ndRHKjYmE93bjbrk5WBEwALBoOogpgxI=
X-Google-Smtp-Source: APXvYqw22XZF5sRF2LYwx7g7BBpNP+uw03dtpHVz09/t+hQxIH6IvPRiwsh6xDfyE5SjgtTdGPoTGsuM2nHoVk1Z2Mc=
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr745123ljj.128.1551393770888; 
 Thu, 28 Feb 2019 14:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20190228223257.6189-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1902281437380.17965@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1902281437380.17965@viisi.sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Feb 2019 14:41:53 -0800
Message-ID: <CAKmqyKND0ruL+cTLoMzV2oG5BOdHDzAzWkKrW5eqLAP2Q6smvQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "of/device: Really only set bus DMA mask when
 appropriate"
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_144256_158448_D5B9E130 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 28, 2019 at 2:39 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Hello Alistair,
>
> On Thu, 28 Feb 2019, Alistair Francis wrote:
>
> > This reverts commit 6778be4e520959659b27a441c06a84c9cb009085.
> >
> > Reverting the commit fixes these error messages and an non-functioning
> > USB bus when attaching a USB to PCIe card to a RISC-V board:
> >     xhci_hcd 0000:03:00.0: Host took too long to start, waited 16000 microseconds.
> >     xhci_hcd 0000:03:00.0: startup error -19
> >     xhci_hcd 0000:03:00.0: USB bus 2 deregistered
> >     xhci_hcd 0000:03:00.0: WARNING: Host System Error
> >     xhci_hcd 0000:03:00.0: remove, state 1
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > I'm not sure if this is the correct fix, it's possible something else is
> > wrong, but I wanted to get some feedback.
> >
> > drivers/of/device.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index 3717f2a20d0d..8299f8055da7 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -149,11 +149,9 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
> >        * set by the driver.
> >        */
> >       mask = DMA_BIT_MASK(ilog2(dma_addr + size - 1) + 1);
> > +     dev->bus_dma_mask = mask;
> >       dev->coherent_dma_mask &= mask;
> >       *dev->dma_mask &= mask;
> > -     /* ...but only set bus mask if we found valid dma-ranges earlier */
>
> Does the DT data for the PCIe controller that you're using contain a
> dma-ranges node?

Ah, no it does not. It only has ranges and bus-range [1].

Any idea what the dma-ranges should be?

1: https://github.com/riscv/opensbi/blob/master/platform/sifive/fu540/HiFiveUnleashed-MicroSemi-Expansion.dts#L407

Alistair

>
> > -     if (!ret)
> > -             dev->bus_dma_mask = mask;
> >
> >       coherent = of_dma_is_coherent(np);
> >       dev_dbg(dev, "device is%sdma coherent\n",
>
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

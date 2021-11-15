Return-Path: <SRS0=clKS=QC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1242C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 16:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9514863215
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 16:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9514863215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB8eyP8JG7Troi5CTKHVwl0D6/h8Md5OMwRzTqv1/ZY=; b=ysB6Buser4yj2b
	u8de83NsHjHm76gTz/mH+AsjXhTLwf9WTHVRV3U+dpSbwnJDLLBL8IUwvxlBh/gNbtyQ6WGuQvx8b
	34LlBkOPD0vl4onDULwuXnu5GWGG62+4TyI1vECsQ4hCJ/HwOCOVz5AHz+ZCXtf0zEqSiDfGQHeyV
	lMCzykJeHCLrKgxW2jNU62j4hLHUzTsuuh1cZ3ZLPWqIay8KnsvgNsSOuVbStMsXxjWf7WjJFhgFH
	+oYjrX6RsbuIyn66hsVjXQ1fPDdk/xHCHnBBImv5bFavjtkcus6Scu/hBKc6Fr42JJni4OvzUrGzN
	cuwlEBCou2uau+F79Evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmemm-00GIjP-AG; Mon, 15 Nov 2021 16:24:48 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmegI-00GG5u-FM
 for linux-riscv@lists.infradead.org; Mon, 15 Nov 2021 16:18:08 +0000
Received: by mail-vk1-f181.google.com with SMTP id e64so9446395vke.4
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 08:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MzrpV0n9zVO9H1XuqgeVs7Q9WtEYC0pbJKOVtZbpaDc=;
 b=1PaaCcn2zDFngtpvcZwXidtar4eWH3tlSBfsGO5V2wmVybv//fqJRoBs8t3SMIGbl5
 tZ/p4vFbvmp+oSiTDA45ciTZ8eGgmNo/9DEMZ9teoHCsFGHkUrMi24F/6CAxEML8seLB
 9ZcStLOb96lv3K3XtSvy5jkaQwBqrXj3MHJZx9A6inwjeubA96tZW4l283h+EpLZolnW
 LCzREOr1t0J6nCi/BHVCEUxR++F3bNM4A1Mx1/5xJg6KiMT84gcTIQhmlurp2cb17LZB
 DFjKwvR577OJYrNx8YP3czIpnXGCjHrgaxNZeMLdYKDJphStd8T6y6d7kmeU2+Ni9dpo
 UxNw==
X-Gm-Message-State: AOAM533MLOd+wXcKevKvIglk6Y245cEYL3IiagOEk1+qEC0s60+uvohR
 u3aB1gIDrxRhQkLuWcCVscQIXlV2wb9egA==
X-Google-Smtp-Source: ABdhPJxBF6ewybVH7a2GbVT5diD7fISAMOl91Wf1AJih08rtJEOF8DIJAWX6MAI8JTRi9fvmG44kOg==
X-Received: by 2002:a1f:aa48:: with SMTP id t69mr60219275vke.2.1636993084631; 
 Mon, 15 Nov 2021 08:18:04 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id g21sm10090724vkd.26.2021.11.15.08.18.03
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:18:04 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id v3so35897224uam.10
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 08:18:03 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr44690576vsj.50.1636993083572; 
 Mon, 15 Nov 2021 08:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
 <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
 <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
In-Reply-To: <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Nov 2021 17:17:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
Message-ID: <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <Lewis.Hanly@microchip.com>, Daire.McNamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_081806_559227_D4E8C868 
X-CRM114-Status: GOOD (  33.66  )
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

Hi Conor,

On Mon, Nov 15, 2021 at 4:39 PM <Conor.Dooley@microchip.com> wrote:
> On 10/11/2021 14:58, Geert Uytterhoeven wrote:
> > On Wed, Nov 10, 2021 at 3:20 PM <Conor.Dooley@microchip.com> wrote:
> >> On 09/11/2021 09:04, Geert Uytterhoeven wrote:
> >>> On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> >>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>
> >>>> +&gpio2 {
> >>>> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT>;
> >>>
> >>> Why override interrupts in the board .dts file?
> >>> Doesn't this belong in the SoC .dtsi file?
> >> The interrupt setup for the gpio isnt fixed, there is an option to
> >> either connect the individual gpio interrupts to the plic *or* they can
> >> be connected to a per gpio controller common interrupt, and it is up to
> >> the driver to read a register to determine which interrupt triggered the
> >> common/NON_DIRECT interrupt. This decision is made by a write to a
> >> system register in application code, which to us didn't seem like it
> >> belonged in the soc .dtsi.
> >
> > So it is software policy? Then it doesn't belong in the board DTS either.
>
> The write (if was to be done) would be done by the bootloader, based on
> the bitstream written to the FPGA, before even u-boot is started. By
> application I meant the bootloader (or some other bare metal
> application), not a program running in userspace in case that's what you
> interpreted. Am I incorrect in thinking that if it is set up by the
> bootloader that Linux can take it for granted?

If it is to be provided by the boot loader, the boot loader should fill
in the interrupts property, just like it already does (or should do, if it
doesn't) for /memory and chosen/bootargs.

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

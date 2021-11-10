Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D71DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 15:05:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D80161051
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 15:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D80161051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd4eN1SWMCA2KW7CXLeEbmOSUu2cC/9jMw30c5Av1ac=; b=yq0r2QkJDRzFyo
	2Gv5P6KhnX/iGTnjJMlL8zpMwJbXtSuTxZRlus9cm63a1gEDfi/dH10+iHyGFOiOdW0QyvuoIaa0j
	U+k5PagWsTIw3GY/BYdhfEg2Pc+4wwCQe3EpmBxgexmqQCdJ7Nf8R5u5q+wXPPQij9qaBUODynhdR
	R3s8KSbz8TTH5DAonWFWqezU3gfJ6qcg43wztobDxmfbwprJ8AuebaX8xRjvMm7lzyTAJhY3CDE5h
	sDP/IpyzKJCA3A7UJbIHMrLnWZmWX47BoovVpXBTqPI15s9D97VVwLYweePdjAQw4THLJivO0bPNJ
	v1h8NMGjQFZDpdvcCIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkpAA-005gsE-Ag; Wed, 10 Nov 2021 15:05:22 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkp8p-005gUW-31
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 15:04:00 +0000
Received: by mail-qk1-f171.google.com with SMTP id bm28so2711024qkb.9
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 07:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOCA3CMBp0qlOJqLClVIbzJyqhqqK17pYfXIsSt5kCw=;
 b=rZBFmPAoifkvs8doBmYotDUsaGiF+fH206HrlbRHoUew6jk6KHKIgdHd18bobW9+9Z
 Z1e0ZCflDO+91Yj1pjDbSX82Uiz4bTiX2n95EMPPob/LJT0kk8CNS0AbakUMO6bas1si
 A1wHw9rD53huPimK7j9N5YcW++FrPR4sDvQhvO2uS5cmFCjJHGsf4Ot8MYez5EonMAkC
 1VpJtecnNBotQdDY0jdDBweA3dQ9hSTscGUT5quiWYV/MdSeMaXTwU6mhan1GIizkob7
 tX9AMj47Sr6n4BR1JK/eXYBz+mnbGOk1ElKID4j0Heh/uL8r8jnX2nAgkvQ1cQ2JBFK6
 bVHw==
X-Gm-Message-State: AOAM531Uh0RxHLCAnnoNNL563IFStBlVqlaByf0CKnQEM5P01DDHg3S+
 /W1VQZqboTHEib8GcfHxMqt9VKufw+bY2Q==
X-Google-Smtp-Source: ABdhPJzEiyDLWVmTAemFIA4E0vy/YmwqMlPqAN10zFtevirKHMDwGe2/VNEbti+tVc7qibW63g8msg==
X-Received: by 2002:a05:620a:4111:: with SMTP id
 j17mr302167qko.45.1636556634079; 
 Wed, 10 Nov 2021 07:03:54 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id n19sm82693qta.22.2021.11.10.07.03.53
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:03:53 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id v64so7186325ybi.5
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 07:03:53 -0800 (PST)
X-Received: by 2002:ab0:3154:: with SMTP id e20mr683424uam.14.1636556324638;
 Wed, 10 Nov 2021 06:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
In-Reply-To: <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Nov 2021 15:58:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
Message-ID: <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
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
 <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
 krzysztof.kozlowski@canonical.com, bin.meng@windriver.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_070359_172956_DBBD9334 
X-CRM114-Status: GOOD (  46.16  )
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

On Wed, Nov 10, 2021 at 3:20 PM <Conor.Dooley@microchip.com> wrote:
> On 09/11/2021 09:04, Geert Uytterhoeven wrote:
> > On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Update the device tree for the icicle kit by splitting it into a third part,
> >> which contains peripherals in the fpga fabric, add new peripherals
> >> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
> >> map which have been changed.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> As I said in the replies to another patch this is my first time doing
> any upstreaming of a device tree, i didnt realise that this would be a
> problem.

No problem, we're here to help you ;-)

> >> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> >> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> >> @@ -1,5 +1,5 @@
> >>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> -/* Copyright (c) 2020 Microchip Technology Inc */
> >> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> >>
> >>   /dts-v1/;
> >>
> >> @@ -13,72 +13,187 @@ / {
> >>          compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
> >>
> >>          aliases {
> >> -               ethernet0 = &emac1;
> >> -               serial0 = &serial0;
> >> -               serial1 = &serial1;
> >> -               serial2 = &serial2;
> >> -               serial3 = &serial3;
> >> +               mmuart0 = &mmuart0;
> >> +               mmuart1 = &mmuart1;
> >> +               mmuart2 = &mmuart2;
> >> +               mmuart3 = &mmuart3;
> >> +               mmuart4 = &mmuart4;
> >
> > Why? SerialN is the standard alias name.
> we changed the label to mmuart to match the microchip documentation.

The serialN aliases are standardized, so you cannot change them.

> would it make more sense to call mmuart but alias it to serial?
> ie serial0 = &mmuart0;

You can change the labels, so that's OK.

> >> +&spi1 {
> >> +       status = "okay";
> >
> > No slave devices specified?
> no, but its exposed

But without specifying slave devices first you cannot use the
controller anyway? While I2C supports instantiating slaves from
userspace by writing to the new_device file in sysfs, SPI doesn't
have that feature.

> >> +&gpio2 {
> >> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT>;
> >
> > Why override interrupts in the board .dts file?
> > Doesn't this belong in the SoC .dtsi file?
> The interrupt setup for the gpio isnt fixed, there is an option to
> either connect the individual gpio interrupts to the plic *or* they can
> be connected to a per gpio controller common interrupt, and it is up to
> the driver to read a register to determine which interrupt triggered the
> common/NON_DIRECT interrupt. This decision is made by a write to a
> system register in application code, which to us didn't seem like it
> belonged in the soc .dtsi.

So it is software policy? Then it doesn't belong in the board DTS either.

> Using the common interrupt for GPIO2 is the default on the
> polarfire-soc, there are only 38 per gpio line interrupts available of
> which 14 are connected to gpio0 and 24 to gpio1.

> >>                  plic: interrupt-controller@c000000 {
> >> -                       #interrupt-cells = <1>;
> >> -                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
> >> +                       compatible = "sifive,plic-1.0.0";
> >
> > Why drop the first one again?
> we felt it didnt make sense to have something that specifically
> references the fu540 in the device tree for this board.

That would be a revert of commit 73d3c44115514616 ("riscv: dts:
microchip: add missing compatibles for clint and plic"), which you
supplied an R-b tag for?

Is this the same plic as in the FU540 SoC? Or do we need a new
microchip,mpfs-plic compatible value?

> >> -               emac1: ethernet@20112000 {
> >> +               mac0: ethernet@20110000 {
> >>                          compatible = "cdns,macb";
> >> -                       reg = <0x0 0x20112000 0x0 0x2000>;
> >> +                       #address-cells = <1>;
> >> +                       #size-cells = <0>;
> >> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> >> +                       clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
> >> +                       clock-names = "pclk", "hclk";
> >>                          interrupt-parent = <&plic>;
> >> -                       interrupts = <70 71 72 73>;
> >> -                       local-mac-address = [00 00 00 00 00 00];
> >> -                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> >> +                       interrupts = <PLIC_INT_MAC0_INT
> >> +                               PLIC_INT_MAC0_QUEUE1
> >> +                               PLIC_INT_MAC0_QUEUE2
> >> +                               PLIC_INT_MAC0_QUEUE3
> >> +                               PLIC_INT_MAC0_EMAC
> >> +                               PLIC_INT_MAC0_MMSL>;
> >
> > Please group using angular brackets.
> >
> >> +                       mac-address = [56 34 12 00 FC 01];
> >
> > Please drop this.
> Is the problem here having mac-address instead of local-, having either
> at all or that we have populated it rather than just filling with 0s?

MAC addresses are supposed to be unique.

> We set it in u-boot anyway, so I think dropping entirely is okay.

Exactly.

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

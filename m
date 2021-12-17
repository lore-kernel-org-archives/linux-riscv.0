Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A09C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3sEmeFtVulDQyk+vfolUlQ8NmBfRrlX4noA4rLfiyY=; b=nwVB6OpdGpkzJw
	kS2w5MR0YQPYI+QJ40owSavyz/uvJzlljoPBX03X5LCohupVO+yubHYWcYxURuFd32Bign+CFCbRo
	mXCBQN1ndZ3THpLyke9xHve2Oz9wbn9trIkxzXUUoqeYLYBiO8JTUdk3IxG9THTBc8+Ljigv2Xkje
	PgO8mFVq2QbnfrMh+YHvSxFYbT8YrYVOxOCcno0Fsu9rFwlQDTJSqGiLQ2rH+bYV0pe4V8SxnXJh9
	UL2RqmJB15ov1tvW7vlSyWyHxAf3aMNZ6sL1jamsl6SP6EeNvtf3sNzxhtWAvFmnGK+LofAWIKWSk
	Jgoo9AX/3hkqkX9skAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myGG6-00BCze-0E; Fri, 17 Dec 2021 16:39:02 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFfU-00B37K-Qf
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 16:01:14 +0000
Received: by mail-vk1-f178.google.com with SMTP id u198so1812072vkb.13
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 08:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26SVdMAvextSC77CuMirCaLKRwkRmDU6eDmV5JlcvTE=;
 b=UJtEczsShQ+lNf+Wp0XHy0TD16wsjv6Z+yumRqEvcHL9WfE9LgWCFyMQNCBWprW3cf
 PwqJIe15pMjKojlr5EwKRR2k2/s+M/w++luv3On+sGCrX4Qy0wtZvUBSlXukQ/PlXAa6
 r46aLdbiLgBEFVs1wPu1H2twvXghXd97p/0+Vu+Birzm+y2/UV4675uuwpK0S+7lJ7Pz
 C7Kbjfv/Gus+xMjqgqDmrnWEg9+1zwYtCMh+WaQmhxir3nA8Rj3e+vPFIWJHwmOElOqw
 fpIWuqFauwReT89UH47bHVey2swe5E1w//12sLNfhnI6qINYhxRkczM5k62v77yHNay0
 gL8Q==
X-Gm-Message-State: AOAM533X7V07WWyQr3Q94CH66e6e5mad0R6saznCQw9AHwKnHhlhZ0ZY
 eKrSTG2INAEx6BjMg4VzwCIRtOMvIhm85w==
X-Google-Smtp-Source: ABdhPJz5Wkgw9jqPemOfNNnaYIWeC+lXKNvn/L7m4ibmGg2SGEp9w/8Dt1t/5j+Yz01DgyL7vKjPZA==
X-Received: by 2002:a05:6122:884:: with SMTP id 4mr1415768vkf.4.1639756871155; 
 Fri, 17 Dec 2021 08:01:11 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id t22sm1270058vsk.13.2021.12.17.08.01.09
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 08:01:10 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 30so5110935uag.13
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 08:01:09 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr1321684uar.14.1639756869466;
 Fri, 17 Dec 2021 08:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
 <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
 <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
In-Reply-To: <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 17:00:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiSnxmXFroHi1drcmkqkhshC+X=6mtw0_wFnS+P=O9Cw@mail.gmail.com>
Message-ID: <CAMuHMdUiSnxmXFroHi1drcmkqkhshC+X=6mtw0_wFnS+P=O9Cw@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Heiko Stuebner <heiko@sntech.de>, Lewis Hanly <Lewis.Hanly@microchip.com>, 
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com, 
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_080112_918761_56C8E9E5 
X-CRM114-Status: GOOD (  36.33  )
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

On Fri, Dec 17, 2021 at 4:32 PM <Conor.Dooley@microchip.com> wrote:
> On 17/12/2021 13:43, Geert Uytterhoeven wrote:
> > On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Split the device tree for the Microchip MPFS into two sections by adding
> >> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
> >> FPGA fabric.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> >> @@ -0,0 +1,13 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> >> +
> >> +/ {
> >> +       corePWM0: pwm@41000000 {
> >> +               compatible = "microchip,corepwm";
> >> +               reg = <0x0 0x41000000 0x0 0xF0>;
> >> +               microchip,sync-update = /bits/ 8 <0>;
> >> +               #pwm-cells = <2>;
> >> +               clocks = <&clkcfg CLK_FIC3>;
> >> +               status = "disabled";
> >> +       };
> >
> > I'm wondering if these should be grouped under a "fabric" subnode,
> > like we have an "soc" subnode for on-SoC devices? Rob?
> >
> > BTW, do you already have a naming plan for different revisions of
> > FPGA fabric cores?
> Not yet (assuming you mean specifically how we will handle it in the
> device tree) - although i was talking to someone about it yesterday.
> It's possible that we might handle that via a register, but if you have
> a suggestion or some precedence that you're aware of that would be useful.
>
> The actual naming convention of the IP cores themselves, yeah. I will
> dig it up for you on Monday.

I meant what if corepwm is enhanced, and how to detect that?

SiFive uses an integer version number, even for hard cores[1].
OpenCores uses an "-rtlsvnN" suffix (isn't svn dead? ;-)
No idea what e.g. LiteX and Microwatt are planning.

[1] Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt


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

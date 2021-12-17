Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A293AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yG4QG413d8JAN8Rq/dyxg1VmhccGJDWZPdQmh3wQA9A=; b=Hru7n9zl5WO9HJ
	3wYr5hwojGYsGiQhDKl9MxL9fLkxQ9hFDvew49IT0s09yn6vi2eDqysDZt09eWLsw/e3qSPVYybUv
	LQyo7GaF52qDZAS2Dem0zlLWbkVDcg3/WMyhQ0w1UvTuYYQevVpEbSoaqiYIe8HQDAfq4+pqnpQk0
	/igtIeQY3hd4RanKu1b3dhSgE9qG3WLlo7BbiKlnjNVdKD5Af7VqP+8vusipdfOQZ/F9yzDM7ox2y
	SotSgChK5woW0Ul2Q5drW7atq9iraxcn9BDHEHz1OYPdo9C9XzO5n0IxJXVxd+B5IiWd6GnYcMR7E
	TskH0twk+jEjIUxiiY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDTZ-00APxL-99; Fri, 17 Dec 2021 13:40:45 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDTW-00APwM-TO
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 13:40:44 +0000
Received: by mail-ua1-f46.google.com with SMTP id n7so4308691uaq.12
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtHDFTmA9jAujdChviftcLGAoCqoDrj9rbkqjCaVfPY=;
 b=PpHQnHd4edj/ZRPmBF6Ms/65BLR2vuPb7DZIW3CKoDtlDAzhGA9WoIkBOmiDkPtXLk
 xIDSe1Tw5ob1ns/M/CaX9K7xZSlCR0XOrWSZY95uR0fAkk0RFBY4kqhYn6zdI+9awKi6
 KrRh/DOHkRcjdtOTdQprE69Y7ug8a9MvktCYKRfNaaW3PLReh7hMfwafLxO4ZkMQmMie
 d8yX2EPy8ynZnfq6iU5IndbZOb00mPrWzy32ELjZFpVU6mLrhK6Fjixhq47JKKN3BFt3
 lFWxX6JMIPyL3Zwu4FU0Qt6/LI8wImV+iM7POdALMTYHngMukn4B0BxxgI/Q6S1WtOmD
 RWig==
X-Gm-Message-State: AOAM5321RVpn5T6kk/UGEgxTiuYwVXea9ZQykfHGKiS1cmNrS7l4QLdS
 Q0ZSSn+TuLnJSFkmzu7axEKoSdA0phmvmg==
X-Google-Smtp-Source: ABdhPJz516seMkKcCjdWFONgCZL4e9JQKSq3IKDVHVPYfk6m5YdgjvNVulPLukHITvsEBz1c8OfgjQ==
X-Received: by 2002:ab0:270b:: with SMTP id s11mr998736uao.98.1639748440940;
 Fri, 17 Dec 2021 05:40:40 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id y7sm1688497uad.2.2021.12.17.05.40.40
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:40:40 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 107so4338161uaj.10
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:40:40 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr949708vsg.57.1639748440025; 
 Fri, 17 Dec 2021 05:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-14-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-14-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 14:40:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYUEpU4bFobK=fpVDGzwAHQWJ=dvPVmp20DUTLSe+DRw@mail.gmail.com>
Message-ID: <CAMuHMdUYUEpU4bFobK=fpVDGzwAHQWJ=dvPVmp20DUTLSe+DRw@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] riscv: dts: microchip: use hart and clk defines
 for icicle kit
To: Conor Dooley <conor.dooley@microchip.com>
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
 Heiko Stuebner <heiko@sntech.de>, Lewis Hanly <lewis.hanly@microchip.com>, 
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, 
 Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_054042_975536_5BA53F1D 
X-CRM114-Status: GOOD (  27.35  )
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

Thanks for your patch!

On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Update the Microchip Icicle kit device tree by replacing interrupt and
> clock related magic numbers with their defined counterparts.

Usually we make a distinction between (a) numbers that can be looked
up easily in a datasheet, and (b) numbers that were made up because
we needed some mapping. Of course both types of numbers are fixed,
and cannot be changed.

For (a), we tend to use the hardcoded numbers in the DTS files, to
avoid reviewers having to go through another layer of indirection
(i.e. does the number for the define match the number in the
datasheet?).
For (b), we use the defines, as there is no other official place to
look up the numbers.

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -2,6 +2,8 @@
>  /* Copyright (c) 2020 Microchip Technology Inc */
>
>  /dts-v1/;
> +#include "dt-bindings/clock/microchip,mpfs-clock.h"

The clock numbers we're made-up, so they fall under (b).

> +#include "dt-bindings/interrupt-controller/riscv-hart.h"

I believe these are just the official CLIC interrupt IDs, so they
fall under (a)?

> @@ -165,11 +167,16 @@ cache-controller@2010000 {
>                 clint@2000000 {
>                         compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>                         reg = <0x0 0x2000000 0x0 0xC000>;
> -                       interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> -                                             <&cpu1_intc 3>, <&cpu1_intc 7>,
> -                                             <&cpu2_intc 3>, <&cpu2_intc 7>,
> -                                             <&cpu3_intc 3>, <&cpu3_intc 7>,
> -                                             <&cpu4_intc 3>, <&cpu4_intc 7>;
> +                       interrupts-extended = <&cpu0_intc HART_INT_M_SOFT>,
> +                                             <&cpu0_intc HART_INT_M_TIMER>,
> +                                             <&cpu1_intc HART_INT_M_SOFT>,
> +                                             <&cpu1_intc HART_INT_M_TIMER>,
> +                                             <&cpu2_intc HART_INT_M_SOFT>,
> +                                             <&cpu2_intc HART_INT_M_TIMER>,
> +                                             <&cpu3_intc HART_INT_M_SOFT>,
> +                                             <&cpu3_intc HART_INT_M_TIMER>,
> +                                             <&cpu4_intc HART_INT_M_SOFT>,
> +                                             <&cpu4_intc HART_INT_M_TIMER>;

Hence I'm not sure we want changes like this?

>                 };
>
>                 plic: interrupt-controller@c000000 {
         };
>
> @@ -210,7 +221,7 @@ serial0: serial@20000000 {
>                         interrupt-parent = <&plic>;
>                         interrupts = <90>;
>                         current-speed = <115200>;
> -                       clocks = <&clkcfg 8>;
> +                       clocks = <&clkcfg CLK_MMUART0>;

But this change is fine.

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

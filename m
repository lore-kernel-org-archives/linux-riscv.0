Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54468C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095762074D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095762074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=emaMCZ4/kGjqEcjOFOgsRsNKSfgfNvzxm1GrdC3QuD8=; b=ZOXfloTf0FbtaVBS3RY5Qi84j
	i8wHBcwxg2jPoA0kH3svcdCMAINhWm9sDi4M420zYZ9N9BVyWeGxFI3ykM3RNs0UV+aiDoxy86VET
	CQcGd1xqeZcAeLVlFDmpyAh3Kf6KslsUpjYSl4tUrpKYTz3rKJeZG746SucAgRn8t0YjN2Zf8l1iv
	b+NpHSmFxZ2mFVaX/XAEv67ZJTEk2vQeLiUXvJn9QYCr5kktqUCqPmpg7wUTB7Fr3GJF2eA8yzfOd
	2fd9iI44eFxRIGwKgr4k7XAJqUTEQ2ILG6c5jIQ0XHLkbHdmmJlOi144n2IJ9JSSRkLzcDC4e2mo4
	cV+qB33tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrLI-0008I8-0o; Mon, 28 Dec 2020 12:09:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrLE-0008Hc-CY
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:09:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 23so23363397lfg.10
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P02uQyjOYUJEP7Y3SPVduzao2ynhVahUnEgVQMCDEUw=;
 b=Od5um3vP9jYr7f0X0GDU04GIOfyvGhO90GKyuaz1+3pOo8qNmMQIEYUgp+tpzj4+pf
 kGaLwdQsab+YQkz7ZQSTGQW62/8C42qR05bduMbEHYhl6g6TW6iU7SD0Y/tRDiA+cJWJ
 inqk7YHlKkykDvbsHn2qZhqM1BYPhZgxj5Qe7o8YHgIUDyBA33rJ3YpGKEGPQ4kCWVTh
 4l30bX4nHog00eyzD6EZs8I56GsEyVMSChehjs2K8cxmk+jpKsqSKNXDMXiB+8egZmUv
 Ry4drp3fKCLyonV/4mA0Wa6JfgjXBjSO802s18x5v9PSEwDdhQhJDJHfinYYiTYYwMU2
 YY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P02uQyjOYUJEP7Y3SPVduzao2ynhVahUnEgVQMCDEUw=;
 b=CzgsvEaqtphl0TFhFPhMoN161QlBanvZ9lrujtWVgV7lSDY+XgnRD7KG2JGuNZ5vEF
 dYglw/O3eUuVbEY2OmLQHgEmr7ju6rsvMCE9qb0dYV9xZprIaFxeC1nOGFt7HXqTl9PW
 cUOm3XPYCfuL86Qbb46qdBiRhz44P9QynQcnATTMuQZTsrthXOf1WC28xLWs9YsPvDhI
 epnQMHis8PYCSYYjd70aPg6s5sKa5zgxgFhDYcpcNEqbq7B3nK2gsr5N2vs7Yi4fdlSF
 x3C9G66ZEgqr6deDrTQ9GHWaMrIA5EBFGY/i/XdKDWgj1XgEHBueNnedQZrWb4GW4jnp
 Zvzw==
X-Gm-Message-State: AOAM5307EamCtPWlXp+Sc6bM6gFbMgt0pr1p16DSaJ9vwg1pfIW5rQnI
 4bRKWH4GMRvn+O2pFYyBBWy+nn2xsxgrdPQJ17neqZi7RZh/mfso
X-Google-Smtp-Source: ABdhPJyN9dhlq72HmTDX0VxZ/iehtyRG2gwKNhJ3PwdzKCcNwhfAAjC9y6oMxlb5myDTrbmr1QZUrcqu2dY6wHbAMKA=
X-Received: by 2002:a05:6512:4d9:: with SMTP id
 w25mr17789796lfq.199.1609157375154; 
 Mon, 28 Dec 2020 04:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-20-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-20-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:39:23 +0530
Message-ID: <CAAhSdy3u0s_bMyxfr59KLzbbU6kvyzk2UwuPM644w7HSfmVx7g@mail.gmail.com>
Subject: Re: [PATCH v10 19/23] riscv: Add SiPeed MAIX GO board device tree
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_070936_442755_8473C6CA 
X-CRM114-Status: GOOD (  19.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 13, 2020 at 7:22 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add a device tree for the SiPeed MAIX GO board. This device tree
> enables buttons, LEDs, gpio, i2c and spi/mmc SD card devices.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_maix_go.dts | 237 ++++++++++++++++++++
>  1 file changed, 237 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_maix_go.dts b/arch/riscv/boot/dts/canaan/k210_maix_go.dts
> new file mode 100644
> index 000000000000..c3294dfaa3c6
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_maix_go.dts
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + */
> +
> +/dts-v1/;
> +
> +#include "k210.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       model = "SiPeed MAIX GO";
> +       compatible = "sipeed,maix-go", "canaan,kendryte-k210";
> +
> +       chosen {
> +               bootargs = "earlycon console=ttySIF0";
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       gpio-leds {
> +               compatible = "gpio-leds";
> +
> +               green {
> +                       gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               red {
> +                       gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               blue {
> +                       gpios = <&gpio1_0 6 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               up {
> +                       label = "UP";
> +                       linux,code = <BTN_1>;
> +                       gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               press {
> +                       label = "PRESS";
> +                       linux,code = <BTN_0>;
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               down {
> +                       label = "DOWN";
> +                       linux,code = <BTN_2>;
> +                       gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       sound {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,format = "i2s";
> +               status = "disabled";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai = <&i2s0 0>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai = <&mic>;
> +               };
> +       };
> +
> +       mic: mic {
> +               #sound-dai-cells = <0>;
> +               compatible = "memsensing,msm261s4030h0";
> +               status = "disabled";
> +       };
> +};
> +
> +&fpioa {
> +       pinctrl-0 = <&jtag_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       jtag_pinctrl: jtag-pinmux {
> +               pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
> +                        <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
> +                        <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
> +                        <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
> +       };
> +
> +       uarths_pinctrl: uarths-pinmux {
> +               pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
> +                        <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
> +       };
> +
> +       gpio_pinctrl: gpio-pinmux {
> +               pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
> +                        <K210_FPIOA(9, K210_PCF_GPIO1)>,
> +                        <K210_FPIOA(10, K210_PCF_GPIO2)>,
> +                        <K210_FPIOA(11, K210_PCF_GPIO3)>,
> +                        <K210_FPIOA(12, K210_PCF_GPIO4)>,
> +                        <K210_FPIOA(13, K210_PCF_GPIO5)>,
> +                        <K210_FPIOA(14, K210_PCF_GPIO6)>,
> +                        <K210_FPIOA(15, K210_PCF_GPIO7)>;
> +       };
> +
> +       gpiohs_pinctrl: gpiohs-pinmux {
> +               pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
> +                        <K210_FPIOA(17, K210_PCF_GPIOHS1)>,
> +                        <K210_FPIOA(21, K210_PCF_GPIOHS5)>,
> +                        <K210_FPIOA(22, K210_PCF_GPIOHS6)>,
> +                        <K210_FPIOA(23, K210_PCF_GPIOHS7)>,
> +                        <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
> +                        <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
> +                        <K210_FPIOA(32, K210_PCF_GPIOHS16)>,
> +                        <K210_FPIOA(33, K210_PCF_GPIOHS17)>,
> +                        <K210_FPIOA(34, K210_PCF_GPIOHS18)>,
> +                        <K210_FPIOA(35, K210_PCF_GPIOHS19)>;
> +       };
> +
> +       i2s0_pinctrl: i2s0-pinmux {
> +               pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
> +                        <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
> +                        <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
> +       };
> +
> +       dvp_pinctrl: dvp-pinmux {
> +               pinmux = <K210_FPIOA(40, K210_PCF_SCCB_SDA)>,
> +                        <K210_FPIOA(41, K210_PCF_SCCB_SCLK)>,
> +                        <K210_FPIOA(42, K210_PCF_DVP_RST)>,
> +                        <K210_FPIOA(43, K210_PCF_DVP_VSYNC)>,
> +                        <K210_FPIOA(44, K210_PCF_DVP_PWDN)>,
> +                        <K210_FPIOA(45, K210_PCF_DVP_HSYNC)>,
> +                        <K210_FPIOA(46, K210_PCF_DVP_XCLK)>,
> +                        <K210_FPIOA(47, K210_PCF_DVP_PCLK)>;
> +       };
> +
> +       spi0_pinctrl: spi0-pinmux {
> +               pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
> +                        <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
> +                        <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
> +                        <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
> +       };
> +
> +       spi1_pinctrl: spi1-pinmux {
> +               pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
> +                        <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
> +                        <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
> +                        <K210_FPIOA(29, K210_PCF_GPIOHS13)>; /* cs */
> +       };
> +
> +       i2c1_pinctrl: i2c1-pinmux {
> +               pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>,
> +                        <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;
> +       };
> +};
> +
> +&uarths0 {
> +       pinctrl-0 = <&uarths_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&gpio0 {
> +       pinctrl-0 = <&gpiohs_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&gpio1 {
> +       pinctrl-0 = <&gpio_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&i2s0 {
> +       #sound-dai-cells = <1>;
> +       pinctrl-0 = <&i2s0_pinctrl>;
> +       pinctrl-names = "default";
> +};
> +
> +&i2c1 {
> +       pinctrl-0 = <&i2c1_pinctrl>;
> +       pinctrl-names = "default";
> +       clock-frequency = <400000>;
> +       status = "okay";
> +};
> +
> +&dvp0 {
> +       pinctrl-0 = <&dvp_pinctrl>;
> +       pinctrl-names = "default";
> +};
> +
> +&spi0 {
> +       pinctrl-0 = <&spi0_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
> +
> +       panel@0 {
> +               compatible = "sitronix,st7789v";
> +               reg = <0>;
> +               reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
> +               dc-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
> +               spi-max-frequency = <15000000>;
> +               status = "disabled";
> +       };
> +};
> +
> +&spi1 {
> +       pinctrl-0 = <&spi1_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +
> +       slot@0 {
> +               compatible = "mmc-spi-slot";
> +               reg = <0>;
> +               voltage-ranges = <3300 3300>;
> +               spi-max-frequency = <25000000>;
> +               broken-cd;
> +       };
> +};
> +
> +&spi3 {
> +       spi-flash@0 {
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               m25p,fast-read;
> +               broken-flash-reset;
> +       };
> +};
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

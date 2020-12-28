Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F1FC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 031BE2074D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 031BE2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EqsZzdykOH4KC30vznLbnw14npvWdhKp7DQwQV2L5YU=; b=N7FfaI0Ylcd9fnhb5J2rmdsRi
	nketveFIJSo3pnJbJM34CCun3TQ3SGq3tVOLdZwjloULhkXqjXGRkFN6OsC7yNuMPNai4oJuHY7aU
	qU76cooN9nOPr1ZYJxkajRUlKJPPN2s25VyAkog62eYMV+3bMSSGZm7zNN02C4iOVw53RawnkvzF2
	K/HTXUuQdRnhwB09AezjgZn7n3qT2eRjhVbKwfxvjQUg9UaMozo7e5Jk5WRORIlAL+WxGXrRwVpzu
	qlQZthDOyuHLCLhxntUfgOBHCJJuEkls4zLlSIG/ikI14ZcC+8eG4/tT/dtxtQk0hZ13q31REBnjs
	iyJTpn+sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrM4-0008OW-P3; Mon, 28 Dec 2020 12:10:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrM1-0008Ns-2p
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:10:26 +0000
Received: by mail-lf1-x135.google.com with SMTP id b26so23391353lff.9
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/CNl1Zloh38hdZAZsu4K+FQB/bznGk06X5Zsg3eIrkw=;
 b=b3NQbMhT5B2DqPa8IiUyzriJvp6Wax4e6vSaXiGNGGcMlEOb0FOIQd5dVbC7f1s8iz
 xHTGjA5ZJYKMeI9BAKtMOeBIdqjelbJdAWYHVapSz2o10TLEh7d91t7AcjETdi5mE2zb
 YCn6JQao1Mb6yk4qyeUM7ix/nQ+mYqiUrf8q1pAo/O3ixRu3M4p6vHmoRJ1GnvCu6gUG
 3QUpI2ZlqiywDblEYjNS9VM23T2y4H8rGdyRdFWMm2cAFEGhRyMJ6j7GApZkgUupeiil
 OXaMc89ObpweSC8AL5JyyI9nqT8HZ5L8OrcKP7j3Hf+hH9nyZ6lmma0SnFSQ37f0hr3i
 CrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CNl1Zloh38hdZAZsu4K+FQB/bznGk06X5Zsg3eIrkw=;
 b=BoOZRB3FUcq5UqGRjGXCNaosX8PYTAtrVG+we1xqn8NOnqxC0sw1J4mEwjUjWUCAjf
 nvu8T6yVV+yk3vtVtA2UbRxwzdp8jrKhOsHnPZwanFfdd4k3i/5/VSz4hQP0anItwk0v
 G099jAc9aBhvfIF4x+0PMv+q74yLfEPWEwyG4OyU9X9GkrdWu4CJvWLiMLHPgQQjrqpv
 JhjPu9H4RJa/x2Y36vKfRk5ntpbpuktEaYSo21AtZPMj8F3sXmBIWnw7m/8gOMCelAhG
 hYxq+jnyv+C3HbRRim2kqbLi+XgGMjK4lja7RafPLQHutWEEBHTXEYpVUxiAwoW4hpUb
 pcTg==
X-Gm-Message-State: AOAM531Fy3IaNQyv9RtGWzy55F6YLPqGtg3esIfKZxw3hh6AQs0q19Xd
 mmvLrImmDRrodJc1eLFc4jbPVjEATUVubq+jS8hHCA==
X-Google-Smtp-Source: ABdhPJyKS1A8DXKYOXudCYpU2iKtW+BNmUm+PZIhDBtu/MgYlQbInb3rKQBrmobX6NG7s7rIFNcdIEojX7zmcO/FnA4=
X-Received: by 2002:a19:c5:: with SMTP id 188mr17884245lfa.511.1609157423381; 
 Mon, 28 Dec 2020 04:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-21-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-21-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:40:11 +0530
Message-ID: <CAAhSdy1F4vrCL72UrYiPyYi5ecD2JGcVu9fPvvYK4wUy_1_OqA@mail.gmail.com>
Subject: Re: [PATCH v10 20/23] riscv: Add SiPeed MAIXDUINO board device tree
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_071025_198387_0C91F565 
X-CRM114-Status: GOOD (  20.33  )
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
> Add a device tree for the SiPeed MAIXDUINO board. This device tree
> enables LEDs and spi/mmc SD card device. Additionally, gpios and i2c
> are also enabled and mapped to the board header pins as indicated on
> the board itself.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_maixduino.dts | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_maixduino.dts b/arch/riscv/boot/dts/canaan/k210_maixduino.dts
> new file mode 100644
> index 000000000000..681f12b46894
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_maixduino.dts
> @@ -0,0 +1,201 @@
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
> +       model = "SiPeed MAIXDUINO";
> +       compatible = "sipeed,maixduino", "canaan,kendryte-k210";
> +
> +       chosen {
> +               bootargs = "earlycon console=ttySIF0";
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               boot {
> +                       label = "BOOT";
> +                       linux,code = <BTN_0>;
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
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
> +       status = "okay";
> +
> +       uarths_pinctrl: uarths-pinmux {
> +               pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>, /* Header "0" */
> +                        <K210_FPIOA(5, K210_PCF_UARTHS_TX)>; /* Header "1" */
> +       };
> +
> +       gpio_pinctrl: gpio-pinmux {
> +               pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
> +                        <K210_FPIOA(9, K210_PCF_GPIO1)>;
> +       };
> +
> +       gpiohs_pinctrl: gpiohs-pinmux {
> +               pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,  /* BOOT */
> +                        <K210_FPIOA(21, K210_PCF_GPIOHS2)>,  /* Header "2" */
> +                        <K210_FPIOA(22, K210_PCF_GPIOHS3)>,  /* Header "3" */
> +                        <K210_FPIOA(23, K210_PCF_GPIOHS4)>,  /* Header "4" */
> +                        <K210_FPIOA(24, K210_PCF_GPIOHS5)>,  /* Header "5" */
> +                        <K210_FPIOA(32, K210_PCF_GPIOHS6)>,  /* Header "6" */
> +                        <K210_FPIOA(15, K210_PCF_GPIOHS7)>,  /* Header "7" */
> +                        <K210_FPIOA(14, K210_PCF_GPIOHS8)>,  /* Header "8" */
> +                        <K210_FPIOA(13, K210_PCF_GPIOHS9)>,  /* Header "9" */
> +                        <K210_FPIOA(12, K210_PCF_GPIOHS10)>, /* Header "10" */
> +                        <K210_FPIOA(11, K210_PCF_GPIOHS11)>, /* Header "11" */
> +                        <K210_FPIOA(10, K210_PCF_GPIOHS12)>, /* Header "12" */
> +                        <K210_FPIOA(3,  K210_PCF_GPIOHS13)>; /* Header "13" */
> +       };
> +
> +       i2s0_pinctrl: i2s0-pinmux {
> +               pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
> +                        <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
> +                        <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
> +       };
> +
> +       spi1_pinctrl: spi1-pinmux {
> +               pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
> +                        <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
> +                        <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
> +                        <K210_FPIOA(29, K210_PCF_GPIO2)>; /* cs */
> +       };
> +
> +       i2c1_pinctrl: i2c1-pinmux {
> +               pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>, /* Header "scl" */
> +                        <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;  /* Header "sda" */
> +       };
> +
> +       i2s1_pinctrl: i2s1-pinmux {
> +               pinmux = <K210_FPIOA(33, K210_PCF_I2S1_WS)>,
> +                        <K210_FPIOA(34, K210_PCF_I2S1_IN_D0)>,
> +                        <K210_FPIOA(35, K210_PCF_I2S1_SCLK)>;
> +       };
> +
> +       spi0_pinctrl: spi0-pinmux {
> +               pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
> +                        <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
> +                        <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
> +                        <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
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
> +               dc-gpios = <&gpio0 22 0>;
> +               spi-max-frequency = <15000000>;
> +       };
> +};
> +
> +&spi1 {
> +       pinctrl-0 = <&spi1_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio1_0 2 GPIO_ACTIVE_LOW>;
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

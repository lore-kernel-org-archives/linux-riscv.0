Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F20C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 833652074D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 833652074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9VWfkeChiY3jLQj5JrGQSlgCDMMVCzwoRfJuLjZgssg=; b=iN0s0zMznoV2izTHFQWmOuRvz
	7B9JZtlXKcvOKccQr9E9f8eep75i8gQ9HEjLyXZ+6B/bmsBxfWnlht00kQPiUGeVFrCTSFIXxIhvb
	Z+8BcjRwqTkl+hh5nWXWPHmb/+33wFcg6xjfVChsbvp2kYMs6g7LBwv6uxs5fvob9v+kU01T6JB45
	QAgJxJpseUS02/ysxnuEE/g+fFy4lzDgj2NM7Kkt+e4/gqjLiEzW3ZMk30p9PzKylDCz7QL4/2QVC
	LfUkvL6aMTjyBxiGVj88eL6icDGYoaZYat/ahOMAH9MOks59k+Nhpg8agHNCt81h/aiyozZlYK0fw
	UKwSh6ouQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrMc-0008TR-9T; Mon, 28 Dec 2020 12:11:02 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrMZ-0008SP-El
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:11:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id b26so23394480lff.9
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fUYmO1tw/O+juXMc2yeg5dNYcznom/SVzlxpkgZT/RY=;
 b=GekhsZd+yFFMId+Mb2j8dvJX4GaLVJF3CKTDNZJTSHKKbh5fOLgLTD2X/bvaDrBMHC
 IhpPVYeceYcHUBvDv5A1L+im9YIa63roF8t0mtiPzHtPMU2CB1R6nv9gDh4flSHLrRWT
 JVTzeR6PxxvDHN6pYQ471y+Wy1PLxIp9ThU1o5jYi4l+GNcCbtNLeJw13oQUTdTnC1nl
 c6Zrxy5QEzP7vwZeot5982p7r14DVibyjFvbAs0uCKUjajGIesY9cYjFVEtEhFOdLfRm
 TvlyGQR1B/mQaiAu6oCv4MijtVSu/eL5W4D6eAvtaRjtoj4FELaVfYb7Yhx16JtIcztO
 u24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fUYmO1tw/O+juXMc2yeg5dNYcznom/SVzlxpkgZT/RY=;
 b=PUfbO9xpsaAPJw89SQkBDiFbvCqpc61u+8ecsPNID9Pn6RdQYjGJnxEbdBJRpaR7nF
 FBPz8QY7ux0m1NKd6uGKnUCxJ4S/Vnjj6guPx+INn7kP5NygURzWFgEVPzwuXrP4vnkP
 teqJnQizOeUDp/YUcZtmEGqSaphSwhKtPzq8ZmiHmHzsd+7x2nh/aH61Efap8D7kSJB2
 U0UPaE0ONSq/YV4vFhPI2gnxC3tEhr+FjwvO4+JwmB87AN9Q8sNSQmbxn+z3YOpp6Cou
 g6KUjLfC+iy79XpLA2TydORkv46oNDs+Ef0xfHXq1PeZ3zjtZ5YvohMCyxj8OCT2co5P
 11wQ==
X-Gm-Message-State: AOAM5325cPz0vHPnZQc6FfLZ2pFkDUFfOUVAiAOvgL8/YCk5DSM9vW4T
 R1dZyQ20hw/d8X7IFPnO7hKytJhWNeiZOM3UlqeusQ==
X-Google-Smtp-Source: ABdhPJxsKrI8X/Sugqq1/jTN2bF5wLElO7QaQDpNU/Q4AdW3zyhX9LSeDDyDx7Z/TxrqUoruVx0bbtHCc4A12b2UJoM=
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr19737102ljk.83.1609157457807; 
 Mon, 28 Dec 2020 04:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-22-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-22-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:40:46 +0530
Message-ID: <CAAhSdy39-KQnsUGV=y0JYK3wMo+P6iJfZPopJRJpAPFfQ3+yqw@mail.gmail.com>
Subject: Re: [PATCH v10 21/23] riscv: Add Kendryte KD233 board device tree
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_071059_570598_760E7E4B 
X-CRM114-Status: GOOD (  19.87  )
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
> Add a device tree for the Canaan Kendryte KD233 development board.
> This device tree enables LEDs, some gpios and spi/mmc SD card device.
> The WS2812B RGB LED and the 10 position rotary dip switch present on
> the board are left undefined.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_kd233.dts | 178 ++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_kd233.dts b/arch/riscv/boot/dts/canaan/k210_kd233.dts
> new file mode 100644
> index 000000000000..44852a27df93
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_kd233.dts
> @@ -0,0 +1,178 @@
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
> +       model = "Kendryte KD233";
> +       compatible = "canaan,kendryte-kd233",
> +                    "canaan,kendryte-k210";
> +
> +       chosen {
> +               bootargs = "earlycon console=ttySIF0";
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       gpio-leds {
> +               compatible = "gpio-leds";
> +
> +               led0 {
> +                       gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led1 {
> +                       gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               key0 {
> +                       label = "KEY0";
> +                       linux,code = <BTN_0>;
> +                       gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
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
> +       spi0_pinctrl: spi0-pinmux {
> +               pinmux = <K210_FPIOA(6, K210_PCF_GPIOHS20)>,  /* cs */
> +                        <K210_FPIOA(7, K210_PCF_SPI0_SCLK)>, /* wr */
> +                        <K210_FPIOA(8, K210_PCF_GPIOHS21)>;  /* dc */
> +       };
> +
> +       dvp_pinctrl: dvp-pinmux {
> +               pinmux = <K210_FPIOA(9, K210_PCF_SCCB_SCLK)>,
> +                        <K210_FPIOA(10, K210_PCF_SCCB_SDA)>,
> +                        <K210_FPIOA(11, K210_PCF_DVP_RST)>,
> +                        <K210_FPIOA(12, K210_PCF_DVP_VSYNC)>,
> +                        <K210_FPIOA(13, K210_PCF_DVP_PWDN)>,
> +                        <K210_FPIOA(14, K210_PCF_DVP_XCLK)>,
> +                        <K210_FPIOA(15, K210_PCF_DVP_PCLK)>,
> +                        <K210_FPIOA(17, K210_PCF_DVP_HSYNC)>;
> +       };
> +
> +       gpiohs_pinctrl: gpiohs-pinmux {
> +               pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
> +                        <K210_FPIOA(20, K210_PCF_GPIOHS4)>, /* Rot. dip sw line 8 */
> +                        <K210_FPIOA(21, K210_PCF_GPIOHS5)>, /* Rot. dip sw line 4 */
> +                        <K210_FPIOA(22, K210_PCF_GPIOHS6)>, /* Rot. dip sw line 2 */
> +                        <K210_FPIOA(23, K210_PCF_GPIOHS7)>, /* Rot. dip sw line 1 */
> +                        <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
> +                        <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
> +                        <K210_FPIOA(26, K210_PCF_GPIOHS10)>;
> +       };
> +
> +       spi1_pinctrl: spi1-pinmux {
> +               pinmux = <K210_FPIOA(29, K210_PCF_SPI1_SCLK)>,
> +                        <K210_FPIOA(30, K210_PCF_SPI1_D0)>,
> +                        <K210_FPIOA(31, K210_PCF_SPI1_D1)>,
> +                        <K210_FPIOA(32, K210_PCF_GPIOHS16)>; /* cs */
> +       };
> +
> +       i2s0_pinctrl: i2s0-pinmux {
> +               pinmux = <K210_FPIOA(33, K210_PCF_I2S0_IN_D0)>,
> +                        <K210_FPIOA(34, K210_PCF_I2S0_WS)>,
> +                        <K210_FPIOA(35, K210_PCF_I2S0_SCLK)>;
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
> +&i2s0 {
> +       #sound-dai-cells = <1>;
> +       pinctrl-0 = <&i2s0_pinctrl>;
> +       pinctrl-names = "default";
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
> +               compatible = "ilitek,ili9341";
> +               reg = <0>;
> +               dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
> +               spi-max-frequency = <15000000>;
> +               status = "disabled";
> +       };
> +};
> +
> +&spi1 {
> +       pinctrl-0 = <&spi1_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
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

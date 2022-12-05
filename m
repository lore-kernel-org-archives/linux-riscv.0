Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D19FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v57OcOY0I+uHLRCLMZ51HxjWj+sJp6yFoO2tvjmGJ3A=; b=hBSt1Q4oaAw6FH
	yonyQS6Kdo+1m1mD/Q8BdsATfGQg/cM0mSL3CqykJvRhTA5qIGQnLdgtG8nRh2QVWs6ph9m2Ju0qV
	Ik1uG3qe0/U9a7jr+lK4O+kDc8QnCHK1LRTesg3nbw5WMaDm6/YrWX5rS1+BRuxV0VAJ1BrrleLwG
	uteN/sKbSkyadWcJQ9qDlrouKei0q0K75y+1eeYTfEwY5nCaM4T0sFwCfFraNQnBxK75xqOfc3xF8
	CZFHHJpQDt+7NBTB4EkIqtLGPS7dC57vVA7gvu03GBqUESMz37p2bGuZISlZ2N/+qWW/vgW25gXKX
	eDIkdZNDWjKslKtzAqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ILa-00AReS-L0; Mon, 05 Dec 2022 20:45:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ILX-00ARd7-Ov; Mon, 05 Dec 2022 20:45:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id qk9so1419909ejc.3;
        Mon, 05 Dec 2022 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdCzDmfj+PMHQDUvK9ErBKQf22vLpZFbnSwddzqkBTo=;
        b=p9fSY8XETv3RHePrGV3MDO2XyCRE1jd6mL34JSRpdOKhWD3WlJGQjGptXoF8VZuPEq
         dnbk9/32BH2Dj4nx6d2NcxQQKcggqztzcWAAsAx0ACYdji4tYQC3ZnU4Zvp6sKhenrNA
         bwZcYvqCt/8i3efoRfdKJVzPoks24Z/07I215moJvpGMJunrovVScmaLw9wke1o1im04
         4TldQ1LayCkorK/pKXE19/UrLm7N2kuCdy/R+iLLHbgiM1UrdASQBpAYAeLDS2/3i5vK
         K+ewL+hxFzSnTssJpYRCtjr3srglWfDi8Hnas4gLfFO883RXW5LX60VGGKMRxKcDiQaX
         1v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdCzDmfj+PMHQDUvK9ErBKQf22vLpZFbnSwddzqkBTo=;
        b=P30RePFD+ud6i9CsmXcLZhgXeR2cVu1flicgEBQ0jLClroZ1fUE2dFseB7jeE29e6/
         Fu9GUspy7pO2r7/GuDQT9h3+wl/wqW/lPqzKke2zEznuWpRXW4IAQThr+jyNGzvf/Xgm
         lSnDh1M0x7EWLKBoTo7EV803bXfksrKdkpl+CtkYsy/YaOnBaZDDOhaYnmK1euGj/tn+
         qyBlklRxy9/BD4fPQD9ur839fVeoSK4tvtauQCTg1YTkQG06C5gYAf7FigGAVR2apnc5
         C0OHiBUTRFjUtJg+h1H4AGilOshfCdHlq5RmxsGULb42AuNan6wMsHnFUkXOHGABlC5f
         ZSeA==
X-Gm-Message-State: ANoB5pkB9nuxNcyTrT8AD9/vps6xWBt865atCyJbx5SvfGgKXi1YXXJv
	t5/s7BHc6o1yAT/sA6ks8Kw=
X-Google-Smtp-Source: AA0mqf7nxYjWF996Pj53wpbOQnisfsFuRhfTWZwFDtA1zE5lRwBI0zRJz72CdbUiwigSZSlh9Gwbhg==
X-Received: by 2002:a17:907:b014:b0:7b4:86be:f3e3 with SMTP id fu20-20020a170907b01400b007b486bef3e3mr64798905ejc.741.1670273150394;
        Mon, 05 Dec 2022 12:45:50 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906314a00b007bfc5cbaee8sm6678374eje.17.2022.12.05.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:45:50 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
Date: Mon, 05 Dec 2022 21:45:48 +0100
Message-ID: <3389289.QJadu78ljV@kista>
In-Reply-To: <20221125234656.47306-10-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-10-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_124551_875627_49578D44 
X-CRM114-Status: GOOD (  20.37  )
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

Hi Samuel,

Dne sobota, 26. november 2022 ob 00:46:53 CET je Samuel Holland napisal(a):
> The 100ask Dongshan Nezha STU is a system-on-module that can be used
> standalone or with a carrier board. The SoM provides gigabit Ethernet,
> HDMI, a USB peripheral port, and WiFi/Bluetooth via an RTL8723DS chip.
> 
> The "DIY" carrier board exposes almost every pin from the D1 SoC to 0.1"
> headers, but contains no digital circuitry, so it does not have its own
> devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> (no changes since v1)
> 
>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>  .../sun20i-d1-dongshan-nezha-stu.dts          | 118 ++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100644
> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> 
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile
> b/arch/riscv/boot/dts/allwinner/Makefile index 2ed586fafaea..87f70b1af6b4
> 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-dongshan-nezha-stu.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts new file
> mode 100644
> index 000000000000..c549a1c5fbf0
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/dts-v1/;
> +
> +#include "sun20i-d1.dtsi"
> +#include "sun20i-common-regulators.dtsi"
> +
> +/ {
> +	model = "Dongshan Nezha STU";
> +	compatible = "100ask,dongshan-nezha-stu", "allwinner,sun20i-d1";
> +
> +	aliases {
> +		ethernet0 = &emac;
> +		mmc0 = &mmc0;

Sorry, I just noticed now, but why is there above alias? It's not sunxi 
practice to add mmc aliases.

Best regards,
Jernej

> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pio 2 1 GPIO_ACTIVE_HIGH>; /* PC1 
*/
> +		};
> +	};
> +
> +	reg_usbvbus: usbvbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usbvbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> +		enable-active-high;
> +		vin-supply = <&reg_vcc>;
> +	};
> +
> +	/*
> +	 * This regulator is PWM-controlled, but the PWM controller is not
> +	 * yet supported, so fix the regulator to its default voltage.
> +	 */
> +	reg_vdd_cpu: vdd-cpu {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-cpu";
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&reg_vcc>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_vdd_cpu>;
> +};
> +
> +&dcxo {
> +	clock-frequency = <24000000>;
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&emac {
> +	pinctrl-0 = <&rgmii_pe_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&ext_rgmii_phy>;
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&reg_vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&mdio {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc_3v3>;
> +	vqmmc-supply = <&reg_vcc_3v3>;
> +	pinctrl-0 = <&mmc0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb8_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
> +	usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +	usb0_vbus-supply = <&reg_usbvbus>;
> +	status = "okay";
> +};
> --
> 2.37.4



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

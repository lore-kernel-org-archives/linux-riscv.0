Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28CFC43217
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 00:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ogiwrVo/R8D+XadYmBHvcKnIKSwmBS/JWH+SrgA5i8=; b=uZLspfr4o+JCRh
	AOmT20FIlNlLmMcg5orWPXimF/P+mhdY3R6b8MQCoMvK7to9wC6ZQ5c+KZhs5Q8um+ngN5UZP4NFV
	5wA+KaTwwx+jwRIxFf37BFJGZPP5TUTOZlYRmnxmlCA3ullx7O30JvTG0zXDofs2VslanAFAXIdIS
	tNUJqTVeGfcp2FCorCS8y8xwgffJcCKL0dYzBiP4VwdYO5ehyAzARukDuNXlqicXEgr9f1HtqVoYy
	RjHNaCkYQq+d1WeLkG4mfI3pRdRQ8vCTEA7PVwloI1woJK/B5R4/0jMSpZOXYI/XPcQU6p3wj6Jzp
	huK3rJ/2GJK+D9qd0q+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyj19-0039d2-HV; Sat, 26 Nov 2022 00:26:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyj0o-0039P7-3B; Sat, 26 Nov 2022 00:25:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 38D10CE2FE3;
	Sat, 26 Nov 2022 00:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787C0C433D7;
	Sat, 26 Nov 2022 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669422337;
	bh=v1EAEdq/9XMPq4VdR6VbfxT4QOV2UU4TS9MCVch7vtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lfbfzuj2/Myn5D5nFNHvzorwfWA+auD8gXXE/558BrcgffXs2ZFVxJGedPJ96UUFT
	 JgZ3F6d6BU7nhp+h3MXml9ovKBRGqIrj7NH/tQ5PSRbQl/9CSXuhdltCG/Ux01doU2
	 KnIR0pfVoGvizULCu8yD3q64vikWPZZwt/DpN18KJBGbqFhUx/EV/3tUJvvq0v5y1U
	 2gEJU/CYreqSEiS9JZ4GhPU9IIC23IUl7txY7OODc15h7I/3xT5u0wGVW+R1Css9L4
	 bpzfQXbCmZ1CcCz6jBn/dW9DudlT6JjXwNtrlNA1QexTUOZTJlrGYWcRjAxlWGEwxW
	 QnzuxGlOaK5bg==
Received: by mail-ej1-f51.google.com with SMTP id vp12so12136042ejc.8;
        Fri, 25 Nov 2022 16:25:37 -0800 (PST)
X-Gm-Message-State: ANoB5plt2tq1FkAL74/pyYBBTmQOjepVOIYdxykS1YSfBA2jJHYCdWqA
	bjdiq2H9odseVCQ+33Xdhbs3tANfUtr7Zr35y08=
X-Google-Smtp-Source: AA0mqf5JKbQbdr4hooc6+KcGn5VrwQ+vQvRTuLKNt6Huqb0VVWdHuGzaN/EzMhexeWJy8Z8l10XpUPmceHZK5YzoKbg=
X-Received: by 2002:a17:906:19d7:b0:7b2:b782:e1df with SMTP id
 h23-20020a17090619d700b007b2b782e1dfmr30032927ejd.308.1669422335764; Fri, 25
 Nov 2022 16:25:35 -0800 (PST)
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-10-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-10-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:25:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRZg6uPXKQMdx6f1cj-SojwTkJ1X7X7y-HeGP2yy9taxA@mail.gmail.com>
Message-ID: <CAJF2gTRZg6uPXKQMdx6f1cj-SojwTkJ1X7X7y-HeGP2yy9taxA@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_162542_515401_28FEFD99 
X-CRM114-Status: GOOD (  22.70  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sat, Nov 26, 2022 at 7:47 AM Samuel Holland <samuel@sholland.org> wrote:
>
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
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
>
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> index 2ed586fafaea..87f70b1af6b4 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-dongshan-nezha-stu.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
> new file mode 100644
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
> +       model = "Dongshan Nezha STU";
> +       compatible = "100ask,dongshan-nezha-stu", "allwinner,sun20i-d1";
> +
> +       aliases {
> +               ethernet0 = &emac;
> +               mmc0 = &mmc0;
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-0 {
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_STATUS;
> +                       gpios = <&pio 2 1 GPIO_ACTIVE_HIGH>; /* PC1 */
> +               };
> +       };
> +
> +       reg_usbvbus: usbvbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usbvbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               gpio = <&pio 3 19 GPIO_ACTIVE_HIGH>; /* PD19 */
> +               enable-active-high;
> +               vin-supply = <&reg_vcc>;
> +       };
> +
> +       /*
> +        * This regulator is PWM-controlled, but the PWM controller is not
> +        * yet supported, so fix the regulator to its default voltage.
> +        */
> +       reg_vdd_cpu: vdd-cpu {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd-cpu";
> +               regulator-min-microvolt = <1100000>;
> +               regulator-max-microvolt = <1100000>;
> +               vin-supply = <&reg_vcc>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply = <&reg_vdd_cpu>;
> +};
> +
> +&dcxo {
> +       clock-frequency = <24000000>;
> +};
> +
> +&ehci0 {
> +       status = "okay";
> +};
> +
> +&emac {
> +       pinctrl-0 = <&rgmii_pe_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&ext_rgmii_phy>;
> +       phy-mode = "rgmii-id";
> +       phy-supply = <&reg_vcc_3v3>;
> +       status = "okay";
> +};
> +
> +&mdio {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <1>;
> +       };
> +};
> +
> +&mmc0 {
> +       broken-cd;
> +       bus-width = <4>;
> +       disable-wp;
> +       vmmc-supply = <&reg_vcc_3v3>;
> +       vqmmc-supply = <&reg_vcc_3v3>;
> +       pinctrl-0 = <&mmc0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&ohci0 {
> +       status = "okay";
> +};
> +
> +&uart0 {
> +       pinctrl-0 = <&uart0_pb8_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode = "otg";
> +       status = "okay";
> +};
> +
> +&usbphy {
> +       usb0_id_det-gpios = <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
> +       usb0_vbus_det-gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +       usb0_vbus-supply = <&reg_usbvbus>;
> +       status = "okay";
> +};
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

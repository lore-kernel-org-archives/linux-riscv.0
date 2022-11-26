Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA1C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 00:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsLTYeN89H6j2R1OyebLAcYTRZgGpnlYJDWkk/ymTlU=; b=ZeDErZkh1nI0zO
	Vem2zkHfFzp2ryRtEZ83kGT5J4r6evGn0GfhD/cIZNIX7oj0SUV9iU5jy4FUhKDdUIp6260aNHaaN
	Pc2tsAIPtYPte9fC7dsrIb3BFKu5XJUGEYAlN8Y/YmFwpSU6P59SRfv8/y/GjqGqN1aiNRchSasbT
	tFIX+RiGMaKNOxYwAbsuglw6ICrl7HgOi74VrqhbR41DcPC9+DIoEUamEvcdqXuzxdIh8ZOX3a/fu
	IttT/1P8aGxsoG+D8QVJq9pR8kdAsSAZeAXL+nFJIkqs6jrS/r/+uLUQ7BCEEXDFwFyW9cbjene9W
	t0Bt5AAcVv4YIAcqYNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyj1x-003A83-Gl; Sat, 26 Nov 2022 00:26:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyj1K-0039in-1k; Sat, 26 Nov 2022 00:26:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49EC7B82BD7;
	Sat, 26 Nov 2022 00:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFC1C43141;
	Sat, 26 Nov 2022 00:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669422370;
	bh=4NqNq+oQLioxqw2Ds8WybcMSRlhpEEQrSTl1t1QeXSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RkTAHaQ0TXV+8wMjPvUbxLH+CcZbUr5hFWwrCNhR4WaWbAyvJ4a4VOnVEHqT2y7tD
	 oz2DxQ4FdkmQQKJLWWplVYy6vmRPWcYELNmsX1SSUXwKPKoGepfOIhGY/rDp/+79gc
	 qZiiZNDGCLw5eYG2I1IjnUVrDXZv5b0VJiGdwTjwgzb8JLEGCfWueL0/mqo66nPnXx
	 uyZtH3VGdx6UDuFACVozegU/uOgoBtgsduzI+sv3s1RMu4CbeRs8b+a5lFDn8BBFnJ
	 +/0HWps+Joo3D5NAs9IZp+Kx5ADMK3iNzsIqjr3cp6VzeCVqF5NS6yPpHkcjafv48h
	 an4Bw2IYmOj0g==
Received: by mail-ej1-f51.google.com with SMTP id bj12so13358147ejb.13;
        Fri, 25 Nov 2022 16:26:10 -0800 (PST)
X-Gm-Message-State: ANoB5pmuOjJMLDKUByIW2HP/jfAoEHHKRbQzA/QUSTGu3IDwZD2tbCNY
	VG35l5Aaprib6b2L+oZnbROj3SmEl2fPQLpQjHU=
X-Google-Smtp-Source: AA0mqf5rj7jcgUfLhNXIG0TqAfUM9IYKmv+CjWTNjQ5iY22Fpirb1CubwF4ZNx/HRTFAr6hpmzQPOwWdJnE+T+QPcL4=
X-Received: by 2002:a17:907:cf84:b0:78d:4795:ff1f with SMTP id
 ux4-20020a170907cf8400b0078d4795ff1fmr35452882ejc.331.1669422368689; Fri, 25
 Nov 2022 16:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-9-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-9-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:25:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTbGiMQa__pudngh0R_BjPDO2ymvwaRFbbSpzJNgfiBRA@mail.gmail.com>
Message-ID: <CAJF2gTTbGiMQa__pudngh0R_BjPDO2ymvwaRFbbSpzJNgfiBRA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
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
X-CRM114-CacheID: sfid-20221125_162614_434738_62BFC5D0 
X-CRM114-Status: GOOD (  21.40  )
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
> The MangoPi MQ Pro is a tiny SBC with a layout compatible to the
> Raspberry Pi Zero. It includes the Allwinner D1 SoC, 512M or 1G of DDR3,
> and an RTL8723DS-based WiFi/Bluetooth module.
>
> The board also exposes GPIO Port E via a connector on the end of the
> board, which can support either a camera or an RMII Ethernet PHY. The
> additional regulators supply that connector.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> Changes in v2:
>  - Added LED (GPIO shared between onboard LED and backlight regulator)
>
>  arch/riscv/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 143 ++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
>
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> index f1c70b9dc9bf..2ed586fafaea 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -3,5 +3,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-480p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-86-panel-720p.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv-dock.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-lichee-rv.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-mangopi-mq-pro.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1-nezha.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1s-mangopi-mq.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> new file mode 100644
> index 000000000000..6d5897dc22e2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
> @@ -0,0 +1,143 @@
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
> +       model = "MangoPi MQ Pro";
> +       compatible = "widora,mangopi-mq-pro", "allwinner,sun20i-d1";
> +
> +       aliases {
> +               ethernet0 = &rtl8723ds;
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
> +                       color = <LED_COLOR_ID_BLUE>;
> +                       function = LED_FUNCTION_BACKLIGHT;
> +                       gpios = <&pio 3 18 GPIO_ACTIVE_HIGH>; /* PD18 */
> +               };
> +       };
> +
> +       reg_avdd2v8: avdd2v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "avdd2v8";
> +               regulator-min-microvolt = <2800000>;
> +               regulator-max-microvolt = <2800000>;
> +               vin-supply = <&reg_vcc_3v3>;
> +       };
> +
> +       reg_dvdd: dvdd {
> +               compatible = "regulator-fixed";
> +               regulator-name = "dvdd";
> +               regulator-min-microvolt = <1200000>;
> +               regulator-max-microvolt = <1200000>;
> +               vin-supply = <&reg_vcc_3v3>;
> +       };
> +
> +       reg_vdd_cpu: vdd-cpu {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vdd-cpu";
> +               regulator-min-microvolt = <1100000>;
> +               regulator-max-microvolt = <1100000>;
> +               vin-supply = <&reg_vcc>;
> +       };
> +
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               reset-gpios = <&pio 6 17 GPIO_ACTIVE_LOW>; /* PG17 */
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
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&mmc0 {
> +       bus-width = <4>;
> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +       disable-wp;
> +       vmmc-supply = <&reg_vcc_3v3>;
> +       vqmmc-supply = <&reg_vcc_3v3>;
> +       pinctrl-0 = <&mmc0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&mmc1 {
> +       bus-width = <4>;
> +       mmc-pwrseq = <&wifi_pwrseq>;
> +       non-removable;
> +       vmmc-supply = <&reg_vcc_3v3>;
> +       vqmmc-supply = <&reg_vcc_3v3>;
> +       pinctrl-0 = <&mmc1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       rtl8723ds: wifi@1 {
> +               reg = <1>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 */
> +               interrupt-names = "host-wake";
> +       };
> +};
> +
> +&ohci1 {
> +       status = "okay";
> +};
> +
> +&pio {
> +       vcc-pe-supply = <&reg_avdd2v8>;
> +};
> +
> +&uart0 {
> +       pinctrl-0 = <&uart0_pb8_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&uart1 {
> +       uart-has-rtscts;
> +       pinctrl-0 = <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       bluetooth {
> +               compatible = "realtek,rtl8723ds-bt";
> +               device-wake-gpios = <&pio 6 18 GPIO_ACTIVE_HIGH>; /* PG18 */
> +               enable-gpios = <&pio 6 15 GPIO_ACTIVE_HIGH>; /* PG15 */
> +               host-wake-gpios = <&pio 6 14 GPIO_ACTIVE_HIGH>; /* PG14 */
> +       };
> +};
> +
> +&usb_otg {
> +       dr_mode = "peripheral";
> +       status = "okay";
> +};
> +
> +&usbphy {
> +       usb1_vbus-supply = <&reg_vcc>;
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

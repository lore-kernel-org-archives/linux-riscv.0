Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0829C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 00:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ7KCeioe0PpjBZawyrJ9Yar36cBqORTKs2cg3GyC6I=; b=PhPx/Wrb0uiz/u
	/TGBMjMFC8ELNhD7wdvbz7P3JMyiiiVDMNxNisaJdPJDA2zrJ29iFCYmtKrxNgvPsPCVp2DCOWfNF
	/LC0jMrJkjOBlv8Dw82dbH5OG0KkybCC/byvJmgT33GfI7Th2NyhQ1aYdt/8CWKsrwrBEIHUU80M/
	5vBFrWmOZTsRn4nfR9IIGpTguitnykIsZ7PphvoD/4cRRMt9rrFGr6+aBLpqiCRWijIKvfBERTlxY
	4d1d99FPEEJfp6R8l/DMtb7+yWUU9eWM0uoDGbP6BgIWShZC1ArqhfvZDY7ANjUHcMU6NbuDAf3Hg
	wtAgUsRB80mi8nUN1KJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyivt-0037Rg-PY; Sat, 26 Nov 2022 00:20:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyivg-0037LZ-H8; Sat, 26 Nov 2022 00:20:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F48561013;
	Sat, 26 Nov 2022 00:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711B4C43470;
	Sat, 26 Nov 2022 00:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669422023;
	bh=OOEUFuq/lGcx5pNyP6gYHvWUv+2ek5XQSDRdwhndMDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KG0FrXcAUyDqd82nTxtbRlSrHuHsuZhP2G/zuYt9nElsGIKZh9Hdywe5IvZxFX5Sr
	 6a7zLOWR8XZ0kKa8MR1WyXipr7obL0uGGqgQvb5qoGRHI8qZ7ac+rsfONNYSt+WGhy
	 IL9vTWiODOA3PC8FbB/kk19JgAtpO+7y+iKcl7CI33lhqWW9dajfV2wkzNbUTW3Z1/
	 VYDNPwxmhK3ZVDs9c92obijGNThmWyVaxBaxpxHdWQNxPNSyVx7b//FbHlKkurwlMb
	 CG0jerfMdCKw+IUBj77flp4ICxex11NkQbClmq7l4Dmt7qKy9f4eBHO51aRl10Io9t
	 VSDvsVcLFNhcg==
Received: by mail-ed1-f51.google.com with SMTP id e13so8266718edj.7;
        Fri, 25 Nov 2022 16:20:23 -0800 (PST)
X-Gm-Message-State: ANoB5pnl1tf9Kz0gRQdHSw61vb5NQWEbfAmMmY3ju7cudc+OtjZphnnF
	Loftgr72IsIv06wXwA6CNeuMyOwnn/hrkjo9Zbo=
X-Google-Smtp-Source: AA0mqf6Vj7a+Tx/1dVxvI87lrsPNpNuUcoRMijQPgV0dbhxgQKTuEs/kJ1cBMX6/bw1sdQz5i9vV1PND/hxI5qGAAzk=
X-Received: by 2002:aa7:db91:0:b0:458:bd09:1b20 with SMTP id
 u17-20020aa7db91000000b00458bd091b20mr38282559edt.176.1669422021688; Fri, 25
 Nov 2022 16:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-6-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-6-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:20:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTyw-ysoi-30hXUqQd45Vv95j-qVz68QEK3P5CS_P+LJQ@mail.gmail.com>
Message-ID: <CAJF2gTTyw-ysoi-30hXUqQd45Vv95j-qVz68QEK3P5CS_P+LJQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] riscv: dts: allwinner: Add MangoPi MQ devicetree
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
X-CRM114-CacheID: sfid-20221125_162024_674058_1FC111FE 
X-CRM114-Status: GOOD (  24.01  )
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
> The MangoPi MQ is a tiny SBC built around the Allwinner D1s. Its
> onboard peripherals include two USB Type-C ports (1 device, 1 host)
> and RTL8189FTV WLAN.
>
> A MangoPi MQ-R variant of the board also exists. The MQ-R has a
> different form factor, but the onboard peripherals are the same.
>
> Most D1 and D1s boards use a similar power tree, with the 1.8V rail
> powered by the SoC's internal LDOA, analog domains powered by ALDO,
> and the rest of the board powered by always-on fixed regulators. To
> avoid duplication, factor out the regulator information that is
> common across boards.
>
> The board also exposes GPIO Port E via a FPC connector, which can
> support either a camera or an RMII Ethernet PHY. The additional
> regulators supply that connector.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> Changes in v2:
>  - New patch for v2
>
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/allwinner/Makefile        |   2 +
>  .../allwinner/sun20i-common-regulators.dtsi   |  35 +++++
>  .../dts/allwinner/sun20i-d1s-mangopi-mq.dts   | 135 ++++++++++++++++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..f292e31bdb2c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += allwinner
>  subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> new file mode 100644
> index 000000000000..2f2792594f7d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) += sun20i-d1s-mangopi-mq.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> new file mode 100644
> index 000000000000..de1adf2a2759
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +/ {
> +       reg_vcc: vcc {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +       };
> +
> +       reg_vcc_3v3: vcc-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc-3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               vin-supply = <&reg_vcc>;
> +       };
> +};
> +
> +&pio {
> +       vcc-pb-supply = <&reg_vcc_3v3>;
> +       vcc-pc-supply = <&reg_vcc_3v3>;
> +       vcc-pd-supply = <&reg_vcc_3v3>;
> +       vcc-pe-supply = <&reg_vcc_3v3>;
> +       vcc-pf-supply = <&reg_vcc_3v3>;
> +       vcc-pg-supply = <&reg_vcc_3v3>;
> +};
> +
> +&reg_ldoa {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       ldo-in-supply = <&reg_vcc_3v3>;
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> new file mode 100644
> index 000000000000..11b150182490
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/dts-v1/;
> +
> +#include "sun20i-d1s.dtsi"
> +#include "sun20i-common-regulators.dtsi"
> +
> +/ {
> +       model = "MangoPi MQ";
> +       compatible = "widora,mangopi-mq", "allwinner,sun20i-d1s";
> +
> +       aliases {
> +               ethernet0 = &rtl8189ftv;
> +               mmc0 = &mmc0;
> +               serial3 = &uart3;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial3:115200n8";
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-0 {
> +                       color = <LED_COLOR_ID_BLUE>;
> +                       function = LED_FUNCTION_BACKLIGHT;
> +                       gpios = <&pio 3 22 GPIO_ACTIVE_LOW>; /* PD22 */
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
> +       reg_vcc_core: vcc-core {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc-core";
> +               regulator-min-microvolt = <900000>;
> +               regulator-max-microvolt = <900000>;
> +               vin-supply = <&reg_vcc>;
> +       };
> +
> +       wifi_pwrseq: wifi-pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               reset-gpios = <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply = <&reg_vcc_core>;
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
> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
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
> +       rtl8189ftv: wifi@1 {
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
> +&reg_ldob {
> +       regulator-name = "vcc-dram";
> +       regulator-always-on;
> +       ldo-in-supply = <&reg_vcc_3v3>;
> +};
> +
> +&uart3 {
> +       pinctrl-0 = <&uart3_pb_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
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

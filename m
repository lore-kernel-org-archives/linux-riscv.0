Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5462BC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNCY7MlkOoYDFXS0e51xqq7n/pw9IwYh9UrZaondlik=; b=tWFbLqa/qQ5kXxRwHn8VjwEwj2
	pP5T1hzBpOA3FznBf+dGy1tjsOrLTq/8ccUdgqHKd/FELzaQChzboZXggk/8MVgzdbWLQc0unQ18e
	3QWNdt44Vg6OTLSicDqqoBYYjM0PWBc/37QM8en1ZnRhLDQ5LPygc5f4rN19nyzbxGo43t4jCAODY
	UYxImaURHt9St4/fyvTX9NprKvjF1A42sIffv0RSbzW8abegWeqH5BRL5UXtVvKVOywo4Sxpa/oFB
	yT5IeQ97jxah8Uq0HaAYPwKmnXj92FFpytDzFPLkL/4R9b/Urj0wPOTFzzcG4SjgPfYAu2Pl7R2Am
	ieBazzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDY1u-00FELV-1c; Thu, 05 Jan 2023 21:44:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV1P-00Dcxr-2p; Thu, 05 Jan 2023 18:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cLtJhJZB5nejLIzVybvU40f+sUT0Wy9doE8Een6Xuj4=; b=QgXN3wNzJ2/6L48JZZ/7+WcyNn
	EmFSskgAu640mcWWB5hYbhy6MbeH//HV63nhTsyQyWOO2oAr6uIL9pDaVIxcnKvKjvSIgQ6d7u9b9
	4TuZ0yOclGTCeSuH+cjUAru8BYVlQevzgQsehniDb3Ks7kYBcu1mGUisaVWKKAwsm+7q9urCKKSz6
	DOnjrvrRZKfBP5jVUJss8p5fTu2X38W3F9Dy1s6pmOQi6YvXivPOk8D4lSgaVijSTJa/7pNQimkmL
	6Zk1Z5kO5ovtSTNzaa1+3qMHCKj3cZruMdyFFQ6WqvmXKt4p1LTNH8QFI4sQf3ia9MK9GCDBxM6lB
	W1DIvPyA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDQii-001MVo-0B;
	Thu, 05 Jan 2023 13:55:51 +0000
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 18FD660014;
	Thu,  5 Jan 2023 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672926948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cLtJhJZB5nejLIzVybvU40f+sUT0Wy9doE8Een6Xuj4=;
	b=WCgcvthiwOKyphVExE0/osh3Ul2B3+0XjZxRWw5BijjKNWDo1JQmmJ7jf5bGqoqfN3qwXQ
	JjheN5sh7ULMfSMfq8SmIcG3iBQYti2rPTb7bm9g2GEgq1JFR97sY2ZltDz+Y294OjAOsb
	8RYcsUBbr9xWSoaRM4AnOiF3FX607QJiWp8uqVY4Xvf8gMqFoT1dyldLt49RaMzR3D22FB
	EvrGFKG4yG4PqtcWAzRLNjZDihA87RWoUggxRdqQiYMT5DoC6OhRoDHbEZrX/AOoEU5OiV
	OsKNTO3O8mC/7lFKVcIOs6oGTCsb7/Vi0Fgjvp60XxpSb1REDOgfIVdNjkyjeQ==
Date: Thu, 5 Jan 2023 14:55:43 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4 07/12] riscv: dts: allwinner: Add Sipeed Lichee RV
 devicetrees
Message-ID: <Y7bW32i3EUmGHqSK@aptenodytes>
References: <20221231233851.24923-1-samuel@sholland.org>
 <20221231233851.24923-8-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20221231233851.24923-8-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_135548_396557_DF88709D 
X-CRM114-Status: GOOD (  24.07  )
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
Content-Type: multipart/mixed; boundary="===============3551368384029640058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3551368384029640058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZzslqN1XBFOeLLZc"
Content-Disposition: inline


--ZzslqN1XBFOeLLZc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat 31 Dec 22, 17:38, Samuel Holland wrote:
> Sipeed manufactures a "Lichee RV" system-on-module, which provides a
> minimal working system on its own, as well as a few carrier boards. The
> "Dock" board provides audio, USB, and WiFi. The "86 Panel" additionally
> provides 100M Ethernet and a built-in display panel.
>=20
> The 86 Panel repurposes the USB ID and VBUS detection GPIOs for its RGB
> panel interface, since the USB OTG port is inaccessible inside the case.

Looks like the panel-enabled variants would better be described as device-t=
ree
overlays as they are not specific devices but are peripheral extensions.

What do you think?

Cheers,

Paul

> Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
> (no changes since v3)
>=20
> Changes in v3:
>  - Fix `make W=3D1 dtbs` warnings (missing reg properties)
>  - Drop mmc alias
>=20
> Changes in v2:
>  - Added DMIC sound card to Lichee RV dock and Lichee RV 86 Panel
>  - Removed LRADC (depends on analog LDOs)
>=20
>  arch/riscv/boot/dts/allwinner/Makefile        |   4 +
>  .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +++++
>  .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 ++
>  .../sun20i-d1-lichee-rv-86-panel.dtsi         | 119 ++++++++++++++++++
>  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  97 ++++++++++++++
>  .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  87 +++++++++++++
>  6 files changed, 346 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-=
panel-480p.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-=
panel-720p.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-=
panel.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-doc=
k.dts
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts=
/allwinner/Makefile
> index 277e59d1c907..f1c70b9dc9bf 100644
> --- a/arch/riscv/boot/dts/allwinner/Makefile
> +++ b/arch/riscv/boot/dts/allwinner/Makefile
> @@ -1,3 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun20i-d1-lichee-rv-86-panel-480p.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun20i-d1-lichee-rv-86-panel-720p.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun20i-d1-lichee-rv-dock.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun20i-d1-lichee-rv.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun20i-d1-nezha.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun20i-d1s-mangopi-mq.dtb
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-4=
80p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.d=
ts
> new file mode 100644
> index 000000000000..4df8ffb71561
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include "sun20i-d1-lichee-rv-86-panel.dtsi"
> +
> +/ {
> +	model =3D "Sipeed Lichee RV 86 Panel (480p)";
> +	compatible =3D "sipeed,lichee-rv-86-panel-480p", "sipeed,lichee-rv",
> +		     "allwinner,sun20i-d1";
> +};
> +
> +&i2c2 {
> +	pinctrl-0 =3D <&i2c2_pb0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	touchscreen@48 {
> +		compatible =3D "focaltech,ft6236";
> +		reg =3D <0x48>;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <6 14 IRQ_TYPE_LEVEL_LOW>; /* PG14 */
> +		iovcc-supply =3D <&reg_vcc_3v3>;
> +		reset-gpios =3D <&pio 6 15 GPIO_ACTIVE_LOW>; /* PG15 */
> +		touchscreen-size-x =3D <480>;
> +		touchscreen-size-y =3D <480>;
> +		vcc-supply =3D <&reg_vcc_3v3>;
> +		wakeup-source;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-7=
20p.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.d=
ts
> new file mode 100644
> index 000000000000..1874fc05359f
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include "sun20i-d1-lichee-rv-86-panel.dtsi"
> +
> +/ {
> +	model =3D "Sipeed Lichee RV 86 Panel (720p)";
> +	compatible =3D "sipeed,lichee-rv-86-panel-720p", "sipeed,lichee-rv",
> +		     "allwinner,sun20i-d1";
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.d=
tsi b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> new file mode 100644
> index 000000000000..6cc7dd0c1ae2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include "sun20i-d1-lichee-rv.dts"
> +
> +/ {
> +	aliases {
> +		ethernet0 =3D &emac;
> +		ethernet1 =3D &xr829;
> +	};
> +
> +	dmic_codec: dmic-codec {
> +		compatible =3D "dmic-codec";
> +		num-channels =3D <2>;
> +		#sound-dai-cells =3D <0>;
> +	};
> +
> +	dmic-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "DMIC";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg =3D <0>;
> +			format =3D "pdm";
> +			frame-master =3D <&link0_cpu>;
> +			bitclock-master =3D <&link0_cpu>;
> +
> +			link0_cpu: cpu {
> +				sound-dai =3D <&dmic>;
> +			};
> +
> +			link0_codec: codec {
> +				sound-dai =3D <&dmic_codec>;
> +			};
> +		};
> +	};
> +
> +	/* PC1 is repurposed as BT_WAKE_AP */
> +	/delete-node/ leds;
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		clocks =3D <&ccu CLK_FANOUT1>;
> +		clock-names =3D "ext_clock";
> +		reset-gpios =3D <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
> +		assigned-clocks =3D <&ccu CLK_FANOUT1>;
> +		assigned-clock-rates =3D <32768>;
> +		pinctrl-0 =3D <&clk_pg11_pin>;
> +		pinctrl-names =3D "default";
> +	};
> +};
> +
> +&dmic {
> +	pinctrl-0 =3D <&dmic_pb11_d0_pin>, <&dmic_pe17_clk_pin>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&emac {
> +	pinctrl-0 =3D <&rmii_pe_pins>;
> +	pinctrl-names =3D "default";
> +	phy-handle =3D <&ext_rmii_phy>;
> +	phy-mode =3D "rmii";
> +	phy-supply =3D <&reg_vcc_3v3>;
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	ext_rmii_phy: ethernet-phy@1 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <1>;
> +		reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +	};
> +};
> +
> +&mmc1 {
> +	bus-width =3D <4>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	vmmc-supply =3D <&reg_vcc_3v3>;
> +	vqmmc-supply =3D <&reg_vcc_3v3>;
> +	pinctrl-0 =3D <&mmc1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	xr829: wifi@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	uart-has-rtscts;
> +	pinctrl-0 =3D <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	/* XR829 bluetooth is connected here */
> +};
> +
> +&usb_otg {
> +	status =3D "disabled";
> +};
> +
> +&usbphy {
> +	/* PD20 and PD21 are repurposed for the LCD panel */
> +	/delete-property/ usb0_id_det-gpios;
> +	/delete-property/ usb0_vbus_det-gpios;
> +	usb1_vbus-supply =3D <&reg_vcc>;
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts b=
/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> new file mode 100644
> index 000000000000..52b91e1affed
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
> +// Copyright (C) 2022 Samuel Holland <samuel@sholland.org>
> +
> +#include <dt-bindings/input/input.h>
> +
> +#include "sun20i-d1-lichee-rv.dts"
> +
> +/ {
> +	model =3D "Sipeed Lichee RV Dock";
> +	compatible =3D "sipeed,lichee-rv-dock", "sipeed,lichee-rv",
> +		     "allwinner,sun20i-d1";
> +
> +	aliases {
> +		ethernet1 =3D &rtl8723ds;
> +	};
> +
> +	dmic_codec: dmic-codec {
> +		compatible =3D "dmic-codec";
> +		num-channels =3D <2>;
> +		#sound-dai-cells =3D <0>;
> +	};
> +
> +	dmic-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "DMIC";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg =3D <0>;
> +			format =3D "pdm";
> +			frame-master =3D <&link0_cpu>;
> +			bitclock-master =3D <&link0_cpu>;
> +
> +			link0_cpu: cpu {
> +				sound-dai =3D <&dmic>;
> +			};
> +
> +			link0_codec: codec {
> +				sound-dai =3D <&dmic_codec>;
> +			};
> +		};
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&pio 6 12 GPIO_ACTIVE_LOW>; /* PG12 */
> +	};
> +};
> +
> +&dmic {
> +	pinctrl-0 =3D <&dmic_pb11_d0_pin>, <&dmic_pe17_clk_pin>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	bus-width =3D <4>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	vmmc-supply =3D <&reg_vcc_3v3>;
> +	vqmmc-supply =3D <&reg_vcc_3v3>;
> +	pinctrl-0 =3D <&mmc1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	rtl8723ds: wifi@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	uart-has-rtscts;
> +	pinctrl-0 =3D <&uart1_pg6_pins>, <&uart1_pg8_rts_cts_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "realtek,rtl8723ds-bt";
> +		device-wake-gpios =3D <&pio 6 15 GPIO_ACTIVE_HIGH>; /* PG16 */
> +		enable-gpios =3D <&pio 6 18 GPIO_ACTIVE_HIGH>; /* PG18 */
> +		host-wake-gpios =3D <&pio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
> +	};
> +};
> +
> +&usbphy {
> +	usb1_vbus-supply =3D <&reg_vcc>;
> +};
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts b/arch=
/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> new file mode 100644
> index 000000000000..d60a0562a8b1
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Jisheng Zhang <jszhang@kernel.org>
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
> +	model =3D "Sipeed Lichee RV";
> +	compatible =3D "sipeed,lichee-rv", "allwinner,sun20i-d1";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_STATUS;
> +			gpios =3D <&pio 2 1 GPIO_ACTIVE_HIGH>; /* PC1 */
> +		};
> +	};
> +
> +	reg_vdd_cpu: vdd-cpu {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd-cpu";
> +		regulator-min-microvolt =3D <900000>;
> +		regulator-max-microvolt =3D <900000>;
> +		vin-supply =3D <&reg_vcc>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_vdd_cpu>;
> +};
> +
> +&dcxo {
> +	clock-frequency =3D <24000000>;
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width =3D <4>;
> +	disable-wp;
> +	vmmc-supply =3D <&reg_vcc_3v3>;
> +	vqmmc-supply =3D <&reg_vcc_3v3>;
> +	pinctrl-0 =3D <&mmc0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 =3D <&uart0_pb8_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&pio 3 21 GPIO_ACTIVE_HIGH>; /* PD21 */
> +	usb0_vbus_det-gpios =3D <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +	usb0_vbus-supply =3D <&reg_vcc>;
> +	status =3D "okay";
> +};
> --=20
> 2.37.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--ZzslqN1XBFOeLLZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmO21t8ACgkQ3cLmz3+f
v9GGLQf9HBkCr5oNpaskusphb6b0KAy20qcx5jsTbPu1DcU/9TU1+RZXY+n/ePbD
+GRVvPysHN7R8tptI+hAX/r3lwzbae6bKJUYh3/2zkdNVh7SBkll0bqTjqHncTw2
MN0ovPTUPETT/6EWQ2HZ0Pnu7KO5TlbCRZp4NJYQ69yxQhlMu9d4sSwatc8PvMQY
2lfaVaI6VCP5L7WEemne+uvI5vEyCEH29BIvnmbYhSJNpfiCSIWF1ZvbJLhm2FLE
Fnv7BTZAKYeTeqf4H3dBTON1RWcl1YOOI7kW6CT7aMgxjQUrBiRbL1N8ejV5m5ib
IfRdNCtMYIySf/4GQ62IWRAOEgKbAg==
=yeLh
-----END PGP SIGNATURE-----

--ZzslqN1XBFOeLLZc--


--===============3551368384029640058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3551368384029640058==--


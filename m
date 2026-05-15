Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62A7CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Psi6SM063QVvKe8wmhiNA3AdhCxntqt41nXxkC2RBaA=; b=3/S+koXUotwXjsFiOkYU2l6hoi
	bcX0wC1/2hMj3peyP5Tkj9BFMu9y/WKj5a+vuJ+Oe4vsSbboyINTTGMmUQGxX1rbMgbIcTSnQfP3g
	MzSTLpDixOT6vd9Eo0ZvUiKBroxNYiCBwpjyOvBBe9ONLTV4d6WjwPamHLYdd3sT/+vj455Xlozfk
	UNX3tg9AxO4MggmaS0a4lR0w2fZranI8ftZfM4vAfoIRT/rxTnOqB1LHDWxou0KSAG4TPJpOZnpVb
	3/lZ+re7oo7DUHC/EC7A0ticnav8ro/iPW1x6j0qPKlH4K09U3PN2pLC/4vh9OJf1FBKopzz7lvNb
	AISFUWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpnV-0000000832l-4Bej;
	Fri, 15 May 2026 10:29:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpnT-0000000832E-1rvT
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778840975; x=1810376975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkuM2Sf1wZOAgpLMQwczjxbbHxEBXV42mJs4czexDiM=;
  b=vrfDlSvSxlKOPpG47zOBD8rat4NOi9z0Xb47udcvg9i3tBZu3+tWwWg9
   dwwOijuOgf5nvfYYDm2OGyUjpsQWhnbT+UiY4/+x49ZSkTxJTqrXiE6gT
   I4rlSfmHjNoNl54xX4q9RuNvjL86JlKhh8dqoiPgqwxNNP9HcnfyWLWgP
   igkaRmFk5hRovfIh8e/ZTIcvIMJ3g1td7WE724tplPXZHs9Cif+BIzhST
   kVCzlZDLZpD7t2EuJkoCGuYhWjCDaXZrZmUZZ8GxrENSw0XAMAgQ7d2nM
   QMKzKddpPqX4MAcDU+6aUU7pvaOwS+senARh5VJWhqXQrPZ+bC2uYJAaB
   g==;
X-CSE-ConnectionGUID: 5N7ot1SSRMOKRGHqqa0i7w==
X-CSE-MsgGUID: A19Up0eVRFG9aIc9Wm+zBQ==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56789946"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:29:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:29:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:29:30 -0700
Date: Fri, 15 May 2026 11:28:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 7/9] riscv: dts: ultrarisc: add Rongda M0 board device
 tree
Message-ID: <20260515-frisbee-clench-4029b6dd8169@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032935_557549_F2FF5BEF 
X-CRM114-Status: GOOD (  17.17  )
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
Content-Type: multipart/mixed; boundary="===============5397783424945706660=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5397783424945706660==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zs1VOpITnaK5peJo"
Content-Disposition: inline

--zs1VOpITnaK5peJo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:18:03AM +0800, Jia Wang wrote:
> Rongda M0 is an mATX motherboard based on the UltraRISC DP1000 SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  arch/riscv/boot/dts/Makefile                       |   1 +
>  arch/riscv/boot/dts/ultrarisc/Makefile             |   2 +
>  .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++++++++++++++++
>  arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++++++++++++++=
++++++
>  4 files changed, 199 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 69d8751fb17c..702882974251 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -12,3 +12,4 @@ subdir-y +=3D spacemit
>  subdir-y +=3D starfive
>  subdir-y +=3D tenstorrent
>  subdir-y +=3D thead
> +subdir-y +=3D ultrarisc
> diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts=
/ultrarisc/Makefile
> new file mode 100644
> index 000000000000..d01a770d3cba
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ULTRARISC) +=3D dp1000-rongda-m0.dtb
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi =
b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> new file mode 100644
> index 000000000000..101b416b1079
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000.dtsi"
> +
> +&pmx0 {
> +	i2c0_pins: i2c0-pins {
> +		pins =3D "PA12", "PA13";
> +		function =3D "func0";

This is what I meant about func0 btw, and having this be "i2c" etc instead.
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts b/arch/ri=
scv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> new file mode 100644
> index 000000000000..6f72d60ad55e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000-rongda-m0-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model =3D "Rongda M0 Board";
> +	compatible =3D "rongda,m0", "ultrarisc,dp1000";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +		serial2 =3D &uart2;
> +		serial3 =3D &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	gpio-poweroff {
> +		compatible =3D "gpio-poweroff";
> +		gpios =3D <&gpio_b 0 GPIO_ACTIVE_HIGH>;
> +		active-delay-ms =3D <100>;
> +
> +		status =3D "disabled";

Why bother adding the nodes if they are disabled? What enables them?

> +	};
> +
> +	gpio-restart {
> +		compatible =3D "gpio-restart";
> +		gpios =3D <&gpio_b 1 GPIO_ACTIVE_HIGH>;
> +		active-delay =3D <100>;
> +
> +		status =3D "disabled";
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins>;
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pins>;
> +
> +	rtc@32 {
> +		compatible =3D "whwave,sd3078";
> +		reg =3D <0x32>;
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c3_pins>;
> +};
> +
> +&spi0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi0_pins>;
> +};
> +
> +&spi1 {
> +	num-cs =3D <1>;

Why is num-cs set at the board level here?

> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi1_pins>;
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins>;
> +};
> +
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>;
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2_pins>;
> +};
> +
> +&ethernet {
> +	phy-handle =3D <&phy0>;
> +	/*
> +	 * YT8531 RGMII timing on this board requires no PHY internal delays.
> +	 * Using "rgmii-id" together with rx/tx-internal-delay-ps results in RX=
 CRC
> +	 * errors and no usable traffic, so keep plain "rgmii" here.
> +	 */
> +	phy-mode =3D "rgmii";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: phy@0 {
> +			reg =3D <0x00>;
> +		};
> +	};
> +};
>=20
> --=20
> 2.34.1
>=20

--zs1VOpITnaK5peJo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagb1ZAAKCRB4tDGHoIJi
0o+fAQD9XS5KDJh/3QJQuSBXX+9SrfBNGTmsJNyM+6lvPdXtBAEA6pTrGaiA09d4
/FltcTWdd8tEr2ljtRwB4Uu0fWGGgQE=
=JFBV
-----END PGP SIGNATURE-----

--zs1VOpITnaK5peJo--


--===============5397783424945706660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5397783424945706660==--


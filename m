Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7733DC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TORSI4Ttdpx+HvrKGqiOzfACYIUNLK2i0SmoWAWCfGw=; b=YJiosqpsdOP1aZQcEtLFxzNqQU
	x1g49sprW7+H6zrgSRg+QyGZ8qTI8DcsEKeop3rPdCdzSP8hydogpsQnJjsP1vwTKQ/iCm02egBNb
	DvOGQE5vISVtk3pYNelzI6JJEBcMGPLsr3NrGy8Hnpu5ZUV33pg8kN+2s6nsESIPD7FRf/FAjoK1Z
	nv/JPkzrvlQa5MVjtJhknltAs5QxHuO9oH29tvyz71+qaf8wZvfQ4ALbGXEwAmse5CP/h2/CTMTQE
	JYxJAUUBKnB6vH/ZiVLL9RyXUHj7B/Q5s6Z0U0WuetVkrh7qQw78NK+QAd0eLJSCXmkkKSLL3UkXg
	Vq21AnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBec4-0000000G11l-41wF;
	Mon, 27 May 2024 17:58:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBec1-0000000G10Q-3qQE
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 17:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1266CE0F20;
	Mon, 27 May 2024 17:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1E5C2BBFC;
	Mon, 27 May 2024 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716832699;
	bh=gCXv+nHNnQD7augX4DlW+RaGEwwmei/GP6Fq18AYOB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEfnYxEWOIJJ8TcgU5mQLgdr25Lj3LkIbx2lb8YaKbc8P0mC1J6crboBXOLtFLA0S
	 0GtKjPYNS60L9jCAIXwTrafWDWT/3WgDPhvqx6mmh4CvZee/O4YMUvKfAfCAwzeFwp
	 rlBePPnxvXtin0XTLykd4ooP3UsnSQAavttFTZhvdJ7DPV8rG/mrORskIeUbYY1YZU
	 N7kXSxyb8v+rg1kc32vGwgm3xfvRECiodVyBW1MKuvlj+4jmxEA7V8bDqhE5agHw47
	 n9OIJyzHnFHQfaS9py2AwsnfR3346f85zlIdGdR+BOHx/Zn9uUpHeWqfs9A8V9aq8U
	 CbBC3tdALZ3Ww==
Date: Mon, 27 May 2024 18:58:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Henry Bell <dmoo_dv@protonmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2 v2] RISC-V: add Star64 board devicetree
Message-ID: <20240527-securely-crafter-17dd1dd3b765@spud>
References: <3Rwq1VegQtSiNjWbBny27eDBw9sCw4cXHBe_3FgihJ1i3dGI6rMS8xI32f2syRXKoa-XZubm7fMr2SED1haIWWygYWJA9azHqRzV6JSmTVo=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <3Rwq1VegQtSiNjWbBny27eDBw9sCw4cXHBe_3FgihJ1i3dGI6rMS8xI32f2syRXKoa-XZubm7fMr2SED1haIWWygYWJA9azHqRzV6JSmTVo=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_105822_344950_F2E8A630 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Type: multipart/mixed; boundary="===============1728740665634133064=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1728740665634133064==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9gaHJ4IdlRivnZAb"
Content-Disposition: inline


--9gaHJ4IdlRivnZAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 09:55:38PM +0000, Henry Bell wrote:
> The Pine64 Star64 is a development board based on the Starfive JH7110 SoC.
> The board features:
>=20
> - JH7110 SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x eMMC slot
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 2x 1Gbps Ethernet port
> - 1x HDMI port
> - 1x 4-lane DSI
> - 1x 2-lane CSI
> - 1x PCIe 2.0 x1 lane
>=20
> Signed-off-by: Henry Bell <dmoo_dv@protonmail.com>
> ---
>=20
> Changes since v1:
>=20
> - Fix indentation and issues with field ordering
> - Update Copyright
> - Move from patch 1 to patch 2
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../dts/starfive/jh7110-pine64-star64.dts     | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
>=20
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 2fa0cd7f31c3..7a163a7d6ba3 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7100-beaglev-starlight=
=2Edtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7100-starfive-visionfive-v1.dtb
> =20
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-milkv-mars.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch=
/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> new file mode 100644
> index 000000000000..fe7e5f3f7f23
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2024 Henry Bell <dmoo_dv@protonmail.com>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +
> +/ {
> +	model =3D "Pine64 Star64";
> +	compatible =3D "pine64,star64", "starfive,jh7110";
> +		aliases {
> +			ethernet1 =3D &gmac1;
> +		};

There was still some funky looking indentation here, so I fixed that up
on application.

Emil, shout if you spot something awry, it's gonna be at the top of the
branch for a while I bet so plenty of time to drop etc.

Thanks,
Conor.

> +};
> +
> +&gmac0 {
> +	starfive,tx-use-rgmii-clk;
> +	assigned-clocks =3D <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> +	assigned-clock-parents =3D <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +};
> +
> +&gmac1 {
> +	phy-handle =3D <&phy1>;
> +	phy-mode =3D "rgmii-id";
> +	starfive,tx-use-rgmii-clk;
> +	assigned-clocks =3D <&syscrg JH7110_SYSCLK_GMAC1_TX>;
> +	assigned-clock-parents =3D <&syscrg JH7110_SYSCLK_GMAC1_RMII_RTX>;
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "snps,dwmac-mdio";
> +
> +		phy1: ethernet-phy@1 {
> +			reg =3D <1>;
> +		};
> +	};
> +};
> +
> +&phy0 {
> +	rx-internal-delay-ps =3D <1900>;
> +	tx-internal-delay-ps =3D <1500>;
> +	motorcomm,rx-clk-drv-microamp =3D <2910>;
> +	motorcomm,rx-data-drv-microamp =3D <2910>;
> +	motorcomm,tx-clk-adj-enabled;
> +	motorcomm,tx-clk-10-inverted;
> +	motorcomm,tx-clk-100-inverted;
> +	motorcomm,tx-clk-1000-inverted;
> +};
> +
> +&phy1 {
> +	rx-internal-delay-ps =3D <0>;
> +	tx-internal-delay-ps =3D <300>;
> +	motorcomm,rx-clk-drv-microamp =3D <2910>;
> +	motorcomm,rx-data-drv-microamp =3D <2910>;
> +	motorcomm,tx-clk-adj-enabled;
> +	motorcomm,tx-clk-10-inverted;
> +	motorcomm,tx-clk-100-inverted;
> +};
> --=20
> 2.44.0
>=20
>=20

--9gaHJ4IdlRivnZAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlTJtwAKCRB4tDGHoIJi
0qu8AQCA9UW29IzxSz09cAmZHuac48ZMGd79RXS66A35/pXDYAD/WDL31TIu5Hzb
3hYNciS/mj7KD67rbeVCrRp6EtqPegk=
=H9/m
-----END PGP SIGNATURE-----

--9gaHJ4IdlRivnZAb--


--===============1728740665634133064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1728740665634133064==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D0C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEn7SXYvmecG2OAdS5eYR2k710nQjuuWvwK4OX1sOf8=; b=3pqu1F/1uIbGbr/28vzZ2hpK1l
	U6OI8kHEhQ9C+KyFZqNyMjxjWxIKw8KOg2+eYgVXGoxLZzhqWSzxxndiReAQtdTsVSS9B9ErOba/G
	7K4e2o+ZnbORjSnUEiJr0B7qaNtLI0t5p+WBrWd2+T68NkiqNJxogGoZSBszC6wiswCvd3PpFo8Xl
	dK/Tly7JrifZsUp+OFSlZBhHvokW4WvAARxpVJTPOk0DijVqT8ck2hCep8VHmRp786mFr36Pnq9gr
	duPsQXHFycYPMGzXwqYMzmvE8mCX7Quk5/sqd6gdfdvEL0I7rAL3GFSdZBASp8cT8NyVy1O+Pv62t
	c5oHRM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ8l-001Cjk-9O; Tue, 07 Mar 2023 15:22:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ3y-001AVA-B2
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 15:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678202234; x=1709738234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j1UFQoVc1KhmUlZmmX46JsVapFdQK4AzDjQXMSFxCc8=;
  b=xIwT4FFWqEEETdEB1xQ1IB3vbFqx8/Gk6MvUa5QT5IOpAeDwMd7FcC6C
   7tfTu3PJ+wNr/tFvAv2atfkmi9IabU9tXtLvYBpV25zhRgV55ttojvzfk
   6MS/BapouOl1rP+/yeBlZwAylFx99LjVM6472Zw408TyXQLD/yrCV31kU
   OmwZv3p5XYm8iQCq1+MO4WeoavM62urTe+IyaCCnl+CCMTIrBNPjs1E9p
   R8qVJ5lEq2DOlLTOOj3zVZ6SNNu6Cvmhbkv/7GQmGY2IRE/2vG3gqpgwI
   Wm1rToAIbtdHokZw8LGRhgploojwbrS4RNG6EJKcUTf6TZ4LxXNnrzkRA
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,241,1673938800"; 
   d="asc'?scan'208";a="140750219"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 08:16:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 08:16:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 08:16:46 -0700
Date: Tue, 7 Mar 2023 15:16:17 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 07/14] riscv: dts: microchip: add mpfs specific macb
 reset support
Message-ID: <a1be181e-d09f-4640-97a4-a209527f71fc@spud>
References: <20220909123123.2699583-1-conor.dooley@microchip.com>
 <20220909123123.2699583-8-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220909123123.2699583-8-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_071714_556879_7BE65E95 
X-CRM114-Status: GOOD (  17.51  )
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
Content-Type: multipart/mixed; boundary="===============7163936440066995408=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7163936440066995408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5b/Zg8OxUkflppoM"
Content-Disposition: inline

--5b/Zg8OxUkflppoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2022 at 01:31:16PM +0100, Conor Dooley wrote:
> The macb on PolarFire SoC has reset support which the generic compatible
> does not use. Add the newly introduced MPFS specific compatible as the
> primary compatible to avail of this support & wire up the reset to the
> clock controllers devicetree entry.
>=20
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Somehow I lost my own patch between the cracks..
I've gone and applied it now as v6.4 content:
https://git.kernel.org/conor/c/0e9b70c1e3623fa110fb6be553e644524228ef60

Cheers,
Conor.

> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dt=
s/microchip/mpfs.dtsi
> index 499c2e63ad35..ae5839534d9c 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -234,6 +234,7 @@ clkcfg: clkcfg@20002000 {
>  			reg =3D <0x0 0x20002000 0x0 0x1000>, <0x0 0x3E001000 0x0 0x1000>;
>  			clocks =3D <&refclk>;
>  			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
>  		};
> =20
>  		mmuart0: serial@20000000 {
> @@ -383,7 +384,7 @@ can1: can@2010d000 {
>  		};
> =20
>  		mac0: ethernet@20110000 {
> -			compatible =3D "cdns,macb";
> +			compatible =3D "microchip,mpfs-macb", "cdns,macb";
>  			reg =3D <0x0 0x20110000 0x0 0x2000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -392,11 +393,12 @@ mac0: ethernet@20110000 {
>  			local-mac-address =3D [00 00 00 00 00 00];
>  			clocks =3D <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
>  			clock-names =3D "pclk", "hclk";
> +			resets =3D <&clkcfg CLK_MAC0>;
>  			status =3D "disabled";
>  		};
> =20
>  		mac1: ethernet@20112000 {
> -			compatible =3D "cdns,macb";
> +			compatible =3D "microchip,mpfs-macb", "cdns,macb";
>  			reg =3D <0x0 0x20112000 0x0 0x2000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -405,6 +407,7 @@ mac1: ethernet@20112000 {
>  			local-mac-address =3D [00 00 00 00 00 00];
>  			clocks =3D <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
>  			clock-names =3D "pclk", "hclk";
> +			resets =3D <&clkcfg CLK_MAC1>;
>  			status =3D "disabled";
>  		};
> =20
> --=20
> 2.36.1
>=20
>=20

--5b/Zg8OxUkflppoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAdVQQAKCRB4tDGHoIJi
0g+qAP4qmdNBwd5h4ZXDqYoJdC/kw8z42IjJJaq/SKhaeExK+wEAzOK3Q5ORxwwE
P5myq6oC1hbQBpIoExbGIu7lnEqJVwM=
=ImiC
-----END PGP SIGNATURE-----

--5b/Zg8OxUkflppoM--


--===============7163936440066995408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7163936440066995408==--


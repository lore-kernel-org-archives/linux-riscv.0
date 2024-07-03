Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054A2C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT5J9Kbl36CGJ5jNkoY3dtidCAZZXTb1ejx2P9j7qSs=; b=HWwj0m0gOMTfxYDb9R+739xdNB
	1ZgdCb9TcspPHW9SpBLOfq3bn4KT227fUlpi38c20kTke9o65gOh5SgTkLhS4Lxpnfh3acAdZ3Sau
	J6GX/iYXovzEQLVEKCpyMUrB+jtja9ly8h0MudwSM6n5zjchZww+XFsOuPDrl8hRDboJlyB6OCgha
	3X6u01KtHpzIGpef5q6evbh+ET12Y6vOGSmPvGwmxNLfu16o/Q0H36NEQ6z/6Or6uYeIcP9kOSFsq
	NgLHWxHPW7RN8M/DyZXA+yXxap46k8yWN3RjYXwB7HBH5GNyg8rPheH3EgnzsPkslJmFqk6VFPgcE
	KqUivNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Ey-0000000AWXs-12iJ;
	Wed, 03 Jul 2024 14:45:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Eu-0000000AWXE-3WMg
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0210CE2C42;
	Wed,  3 Jul 2024 14:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB48C2BD10;
	Wed,  3 Jul 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720017942;
	bh=C1hp5OtfWDo1NBDzAqh5+Ao0b/WXKrQiv4nSCpB7aeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXDSquPEbH6E4gDpXPNceVYk4NfgJjjkKf6lhWPGRFtINzlja+3o/dlPjKO22lgbl
	 pN+AYHT9jvepE37qVi7RnVGDaBXfFdJ3uC5dxUiQX5dbmARy4L5jnuSwRgwv9Dj/vq
	 myLjqdbjqHB+E5NcsFEnQhC60ylLQMlvZAJL6WHy4rjh0LTwB7w9aDhkB2O20oqiWi
	 4Xro31n6wMCPEu7tp+NJNg1w/94PefmUE7VCkmhMyxslzEvFuFKL/Ev0mkWHYr2l/0
	 k4yHnFYajhU8/jw94qxL4qJMIu1XKmaelBZSK6wgkIpXcxloeFMHBBDM39RvxozyCb
	 Nw03sDXp7mbNA==
Date: Wed, 3 Jul 2024 15:45:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
Message-ID: <20240703-juice-refreeze-62c468a56ea5@spud>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-5-kanakshilledar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240701121355.262259-5-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_074545_251397_9B12F3BB 
X-CRM114-Status: GOOD (  22.29  )
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
Content-Type: multipart/mixed; boundary="===============6850238439002327438=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6850238439002327438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f3zpqVYbQthFURc0"
Content-Disposition: inline


--f3zpqVYbQthFURc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Kanak, Drew,

On Mon, Jul 01, 2024 at 05:43:54PM +0530, Kanak Shilledar wrote:
> created spi0 node with fixed clock. the spi0 node
> uses synopsis designware driver and has the following
> compatible "snps,dw-apb-ssi". the spi0 node is connected
> to a SPI NOR flash pad which is left unpopulated on the back
> side of the board.
>=20
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
> Changes in v2:
> - Separated from a single patch file
> ---
>  .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
>  .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
>  .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++

Didn't you say there was a flash on one of these two boards?

>  arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> index d9b4de9e4757..3103b74e0288 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -17,6 +17,7 @@ aliases {
>  		gpio1 =3D &gpio1;
>  		gpio2 =3D &gpio2;
>  		gpio3 =3D &gpio3;
> +		spi0 =3D &spi0;

"spi" would sort after "serial".

>  		serial0 =3D &uart0;
>  		serial1 =3D &uart1;
>  		serial2 =3D &uart2;
> @@ -52,6 +53,10 @@ &sdhci_clk {
>  	clock-frequency =3D <198000000>;
>  };
> =20
> +&spi_clk {
> +	clock-frequency =3D <396000000>;
> +};

I'm pretty sceptical about adding more of these fixed clocks, rather
than waiting for the clock driver. Drew, what do you think? Should we
just add one more to your fixup list or would you rather delay? Guess it
depends on how long more you think that clock driver is likely to take.

Thanks,
Conor.

> +
>  &uart_sclk {
>  	clock-frequency =3D <100000000>;
>  };
> @@ -79,3 +84,7 @@ &sdio0 {
>  &uart0 {
>  	status =3D "okay";
>  };
> +
> +&spi0 {
> +	status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arc=
h/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> index 1365d3a512a3..6939bd36560c 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> @@ -33,6 +33,10 @@ &sdhci_clk {
>  	clock-frequency =3D <198000000>;
>  };
> =20
> +&spi_clk {
> +	clock-frequency =3D <396000000>;
> +};
> +
>  &uart_sclk {
>  	clock-frequency =3D <100000000>;
>  };
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/ris=
cv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 9a3884a73e13..14b06dd81a9a 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -14,6 +14,7 @@ aliases {
>  		gpio1 =3D &gpio1;
>  		gpio2 =3D &gpio2;
>  		gpio3 =3D &gpio3;
> +		spi0 =3D &spi0;
>  		serial0 =3D &uart0;
>  		serial1 =3D &uart1;
>  		serial2 =3D &uart2;
> @@ -30,3 +31,7 @@ chosen {
>  &uart0 {
>  	status =3D "okay";
>  };
> +
> +&spi0 {
> +	status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index d2fa25839012..f962de663e7e 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -140,6 +140,12 @@ apb_clk: apb-clk-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	spi_clk: spi-clock {
> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "spi_clk";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	uart_sclk: uart-sclk-clock {
>  		compatible =3D "fixed-clock";
>  		clock-output-names =3D "uart_sclk";
> @@ -183,6 +189,16 @@ clint: timer@ffdc000000 {
>  					      <&cpu3_intc 3>, <&cpu3_intc 7>;
>  		};
> =20
> +		spi0: spi@ffe700c000 {
> +			compatible =3D "thead,th1520-spi", "snps,dw-apb-ssi";
> +			reg =3D <0xff 0xe700c000 0x0 0x1000>;
> +			interrupts =3D <54 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&spi_clk>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
>  		uart0: serial@ffe7014000 {
>  			compatible =3D "snps,dw-apb-uart";
>  			reg =3D <0xff 0xe7014000 0x0 0x100>;
> --=20
> 2.45.2
>=20

--f3zpqVYbQthFURc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVkEAAKCRB4tDGHoIJi
0mHfAQCerPGg22qWoM5kYr+419re8jFmyoGLS+eSi9/YXhbT0gD/Y/yGqGxidgOR
7mT2z8ntFGYVKwI8bpNr47Z0pS29hw0=
=uqCy
-----END PGP SIGNATURE-----

--f3zpqVYbQthFURc0--


--===============6850238439002327438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6850238439002327438==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8B7FEE4EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 15:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEaa1lXjRnRCarnKSiBjtZzn0vM/TcJx7S2H1oEn29U=; b=uFvqV9hXQlwBUPf/Ck+SiG4ehn
	SGVm8zkYq80zXlRtYT3/hL4Yty/Z1mrGJ7iI+JAAd3aox0db5bOQGVrPVhGIxslLZIOBiWTKgi9rW
	56RrbzWLhOhwZuibaebJ9tCjYxjpTy3MBrGBF/NUvVKfN5AVQ92jIRFNPZsGQIUSCg5Loq85xm+wk
	ZQp0sUsv5o/6gP0G9qDb2jdy92H2GQ5H+D7tsTuhIeS8oEWVTQMrgXDZVbYu7yXkLK4/VSrCGHNFx
	NQfbvccm2LQrZYCj0U3qERxuG2cM9QsBw2UVokj40JjS2kT7/fT3GqIcheRxPKtesgkWgsFuonDqQ
	W1uSCVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMPM-0000000A09p-1YFm;
	Sat, 28 Feb 2026 15:39:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMPK-0000000A09f-35HB
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 15:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1CF8600CB;
	Sat, 28 Feb 2026 15:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C61C116D0;
	Sat, 28 Feb 2026 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772293145;
	bh=RZ24zd2vtYiYR+Is5sPaHhlPzptzRZV6aZNyOrKUIVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnwKOAWDengg1oRY0dK5Fy+OeUeopzCcRU/T6Gp6kHFSbbT+nahq4oD9l+JO5iMQk
	 42JBLQ7WMwPlQHsHnea65r/cAl/SDK7pKCHBtuFcf9GCn2FlW60Zd7Gk2flVKhhYJF
	 j+EfqxigH/ZpnmKxImLF3CFLm8k4oShlCmTjKLxBhcMFsFsV3ejSrBIiQbIIAk/WI0
	 MnPIGZVaxPgqBhk9YwZ71mtS77SV4HCIjZz/Qkbalhsb0JWfDyvi2mdBEyHgfipwLZ
	 psyKw2HsToVjffGDun3BUAgb9HPiwK9QXYXJHtMXBJtOCbsKOdpxZgFdx0n+2QZ5n7
	 NQTU1LHsbCO8Q==
Date: Sat, 28 Feb 2026 15:39:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ron Economos <re@w6rz.net>, miquel.raynal@bootlin.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, wsa+renesas@sang-engineering.com
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
Message-ID: <20260228-defuse-extenuate-cf2a90ae66ea@spud>
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
 <aaL2WVO_7bl6vNp5@sirena.co.uk>
 <20260228-ragweed-theater-b02967937353@spud>
MIME-Version: 1.0
In-Reply-To: <20260228-ragweed-theater-b02967937353@spud>
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
Content-Type: multipart/mixed; boundary="===============8390305967409696965=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8390305967409696965==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vHElSr6IrLxck0/S"
Content-Disposition: inline


--vHElSr6IrLxck0/S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 02:23:00PM +0000, Conor Dooley wrote:
> On Sat, Feb 28, 2026 at 02:06:17PM +0000, Mark Brown wrote:
> > On Sat, Feb 28, 2026 at 05:54:06AM -0800, Ron Economos wrote:
> >=20
> > > I'm getting an SPI failure with Linux v7.0-rc1 on the VisionFive 2 RI=
SC-V board.
> >=20
> > > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is=
 still busy after 500ms timeout.
> > > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: detecte=
d FIFO depth (1) different from config (256)
> > > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is=
 still busy after 500ms timeout.
> > > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is=
 still busy after 500ms timeout.
> > > Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: operation failed w=
ith -110
> > > Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: probe with driver =
spi-nor failed with error -110
> >=20
> > FWIW confirmed on my system:
> >=20
> >    https://lava.sirena.org.uk/scheduler/job/2504026#L715
> >=20
> > (which I didn't notice as that was just buildroot and not running
> > kselftest-dt...).
>=20
> This probably constitutes random speculation, but I am curious if
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 6e56e9d20bb06..390fa87edbaf8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -873,9 +873,9 @@ qspi: spi@13010000 {
>  			      <0x0 0x21000000 0x0 0x400000>;
>  			interrupts =3D <25>;
>  			clocks =3D <&syscrg JH7110_SYSCLK_QSPI_REF>,
> -				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
> -				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
> -			clock-names =3D "ref", "ahb", "apb";
> +				 <&syscrg JH7110_SYSCLK_QSPI_APB>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_AHB>;
> +			clock-names =3D "ref", "apb", "ahb";
>  			resets =3D <&syscrg JH7110_SYSRST_QSPI_APB>,
>  				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
>  				 <&syscrg JH7110_SYSRST_QSPI_REF>;
> has any impact. Going from jh7110 specific code to bulk apis is an
> ordering change, right?

According to Ron, it had no impact.

--vHElSr6IrLxck0/S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaMMFQAKCRB4tDGHoIJi
0riuAP9pcpOeD4G8LIGxBhND9gcHitN47yk6s3A5aZEOIx8/oAD+LKck9tLQJDn6
CxytGbXbvq/03XGYg5BKaApP3uGaFQg=
=yy+n
-----END PGP SIGNATURE-----

--vHElSr6IrLxck0/S--


--===============8390305967409696965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8390305967409696965==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61007FEE4EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QN+Fui0QdI2nGFI/t4ygdHHvtrES37s/qxbvTwP315Y=; b=1irEu8eqbJ+tFSAv7BCYvODExm
	HFhtJY44I/9PgN7O4FcxdYWom5N00swcMhLdHBaQ39dRML6tHajCdhhiKv37/+2I8v6LrePlpDsb6
	eT25HYR0MzgBQpuH9XTUnKXafY+Oe7c1Jlt9T92/XP+/IcXd776Q6y+QHDF+13opa4rSxLHgfk2mP
	lmE4vWOni4BndSkSUM0n5QLGd31DgprAeOcjVbFPNt2+ByasZWjfiGuFllG9dEVxRehcCgJbBKlaW
	oIf9ZPSefyeM8c5nlWD4E6VK5GE4OY9pviB9Fw9T69HxJC3fOiGG6Ximw+qwkoFpX6Do1KT0VnItR
	ubpWQs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLDl-00000009vBb-1K4C;
	Sat, 28 Feb 2026 14:23:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLDh-00000009vA8-1j21
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 14:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6581C4448D;
	Sat, 28 Feb 2026 14:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCDCC19424;
	Sat, 28 Feb 2026 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772288580;
	bh=E29j3PXXVta4w6LHdGwWm4bPeP4mtQJEKrEXDi6leDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKao7JYyKjsxNVZ41dffrCBBuDFSPsL/pKV3yVYgkpIHJ/kEgvFqP/iwEpMzjtnRL
	 ukAPO/dLAP3jmPvZcuxuMi2f+B2DmPhsHwxzBkCrXvuLNxYC6iRn8KVwHdOUjYCCE9
	 xEAt5h+ZDjp4/v01ert0NjjQ8r2TcPnfNwJUGdoGUD+vG4MIVkaX6wfDzb41co4cCQ
	 vRe74HxwDa3bxN/Evv2LaFYrvmD3/EbC0YeMkq3Od2/Srpm7C4z/Vk2yhb2KFzjPgg
	 n1NhKyr0owlPSyG4Ul3diyVIyqIKgXwmQ6rauQ36GdtSUx8yM82VQD/aHGQQ8HAf7q
	 hbxI3hGDpLc+w==
Date: Sat, 28 Feb 2026 14:22:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ron Economos <re@w6rz.net>, miquel.raynal@bootlin.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, wsa+renesas@sang-engineering.com
Subject: Re: spi: Regression with v7.0-rc1 on VisionFive 2
Message-ID: <20260228-ragweed-theater-b02967937353@spud>
References: <a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net>
 <aaL2WVO_7bl6vNp5@sirena.co.uk>
MIME-Version: 1.0
In-Reply-To: <aaL2WVO_7bl6vNp5@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_062301_491747_17E7AE5D 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: multipart/mixed; boundary="===============1203526713994858238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1203526713994858238==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W5080Fu5H1v47UF5"
Content-Disposition: inline


--W5080Fu5H1v47UF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 02:06:17PM +0000, Mark Brown wrote:
> On Sat, Feb 28, 2026 at 05:54:06AM -0800, Ron Economos wrote:
>=20
> > I'm getting an SPI failure with Linux v7.0-rc1 on the VisionFive 2 RISC=
-V board.
>=20
> > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is s=
till busy after 500ms timeout.
> > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: detected =
FIFO depth (1) different from config (256)
> > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is s=
till busy after 500ms timeout.
> > Feb 28 00:29:33 visionfive kernel: cadence-qspi 13010000.spi: QSPI is s=
till busy after 500ms timeout.
> > Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: operation failed wit=
h -110
> > Feb 28 00:29:33 visionfive kernel: spi-nor spi1.0: probe with driver sp=
i-nor failed with error -110
>=20
> FWIW confirmed on my system:
>=20
>    https://lava.sirena.org.uk/scheduler/job/2504026#L715
>=20
> (which I didn't notice as that was just buildroot and not running
> kselftest-dt...).

This probably constitutes random speculation, but I am curious if
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts=
/starfive/jh7110.dtsi
index 6e56e9d20bb06..390fa87edbaf8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -873,9 +873,9 @@ qspi: spi@13010000 {
 			      <0x0 0x21000000 0x0 0x400000>;
 			interrupts =3D <25>;
 			clocks =3D <&syscrg JH7110_SYSCLK_QSPI_REF>,
-				 <&syscrg JH7110_SYSCLK_QSPI_AHB>,
-				 <&syscrg JH7110_SYSCLK_QSPI_APB>;
-			clock-names =3D "ref", "ahb", "apb";
+				 <&syscrg JH7110_SYSCLK_QSPI_APB>,
+				 <&syscrg JH7110_SYSCLK_QSPI_AHB>;
+			clock-names =3D "ref", "apb", "ahb";
 			resets =3D <&syscrg JH7110_SYSRST_QSPI_APB>,
 				 <&syscrg JH7110_SYSRST_QSPI_AHB>,
 				 <&syscrg JH7110_SYSRST_QSPI_REF>;
has any impact. Going from jh7110 specific code to bulk apis is an
ordering change, right?


--W5080Fu5H1v47UF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaL6QAAKCRB4tDGHoIJi
0kFhAPoCPebF/64V6tTerETc1p/3aNrGWY/eLrfG7sMraKTcWgD9EjA9vV4LOEhp
TztKNTybWwjf00xB3tli5R7BAyXslwM=
=LE7H
-----END PGP SIGNATURE-----

--W5080Fu5H1v47UF5--


--===============1203526713994858238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1203526713994858238==--


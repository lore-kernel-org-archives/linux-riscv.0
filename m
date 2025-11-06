Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544CBCCFA13
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFoCKFewt2o0+y8ty/+38PCcNSKQbAQmuJHhzuXwpTI=; b=x4SOpDwQcUo1bO42G2BcGjE3K4
	1BTwL8/l770KrmmqoRYUpznlte1PAXLjazMBSv6nsNQ0+8y735KZTkOZua0jH8NdnofYqzxn8P+mw
	JRcQNVRKXnbv77oJKfcjD0/xFdS0HTfIk6zycBY9RHiUFt/GXL+p8Mge8GpOpIg5Yh9seEZ5WMrjL
	lOw5PBejIVvnWznz4u8JkpuIXWkeGufX/9BSXtvB5GknVShBp3P+W5qR/uNMaOGp9e9svNLvjDoGZ
	AImvYv/L8fbdg5lVwCniROS4INXu2+2O7t6K6BWDMJcB/HTzdc0RdyHkuYUP8F3kIXV4yb2ZkcUHS
	y3XEfPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH480-0000000G3Wi-28wu;
	Thu, 06 Nov 2025 17:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH47z-0000000G3Wb-0Dby
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 17:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39C3D618FF;
	Thu,  6 Nov 2025 17:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE47C4CEF7;
	Thu,  6 Nov 2025 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762451429;
	bh=WjWTvbzua2LgYAaRJe9lhFBkACy3GRXIKF3t5etpTx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbP8H4uc4//Q3JD9skD/NmChmp1R2f45h81QKbBzJv8eP5/t8LI5jfVTixIJFk9A1
	 E9D9IKlGLveME0Myu4Sroc2KKth/rYvfaceRD165Zgm3N+MNJotluAJXyJNUgTwnMB
	 3vek/s3C/u0rg3xd7NuwmAA2MMzirKLcV3RccjBahJMzmJQuMZ+cyS2SKpLPvMEHcE
	 v5KGjPPOFAMOiiPuNVwNiO62+Jqq+leGtR69ZvVjtAR4DzdqNPLsfdQxBzakDCXW5k
	 OneQzIti6WpF69yRelVNW+PJ0t/XbOwaJBFCYWNUrbIyUbKALQZMgI83GsYe9F2gIT
	 ZVDuDx8UDODWQ==
Date: Thu, 6 Nov 2025 17:50:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>
Subject: Re: [PATCH v2 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <20251106-cable-generic-819b798c7068@spud>
References: <20251105152823.730422-1-prajna.rajendrakumar@microchip.com>
 <20251105152823.730422-4-prajna.rajendrakumar@microchip.com>
 <aQt41uGfmbs7Qa7x@finisterre.sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <aQt41uGfmbs7Qa7x@finisterre.sirena.org.uk>
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
Content-Type: multipart/mixed; boundary="===============6721794259223088857=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6721794259223088857==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wJgqZzsyNZ2n1zkq"
Content-Disposition: inline


--wJgqZzsyNZ2n1zkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2025 at 04:18:30PM +0000, Mark Brown wrote:
> On Wed, Nov 05, 2025 at 03:28:23PM +0000, Prajna Rajendra Kumar wrote:
>=20
> >  drivers/spi/Kconfig              |   9 +
> >  drivers/spi/Makefile             |   1 +
> >  drivers/spi/spi-microchip-core.c | 442 +++++++++++++++++++++++++++++++
> >  3 files changed, 452 insertions(+)
>=20
> > +config SPI_MICROCHIP_CORE
> > +	tristate "Microchip FPGA SPI controllers"
> > +	depends on SPI_MASTER
>=20
> Reusing the same filename and config symbol is almost certainly going to
> create issues and confusion for people upgrading their kernel or doing
> backports.  Perhaps CoreSPI instead?

The qspi driver (which is shared between SoC and FPGA IP) uses
SPI_MICROCHIP_CORE_QSPI, so probably SPI_MICROCHIP_CORE_SPI should be
used here. Prajna?

--wJgqZzsyNZ2n1zkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzf4QAKCRB4tDGHoIJi
0qy2AP0U27WzBNDqaqh1XmP2VC+xajyfZyfQNxJNz2WHKaXRgwEA1kY/wCnEvIlC
SYkV1jsJNg638yrXcon3wRQFmAch1Q0=
=FvLK
-----END PGP SIGNATURE-----

--wJgqZzsyNZ2n1zkq--


--===============6721794259223088857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6721794259223088857==--


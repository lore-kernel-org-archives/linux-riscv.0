Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D167EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo2pNk9IPCl2hZ/ePSQ6THUk9jdXyyP19Z4rfGA5IIc=; b=lrRAKUNnfHiSj40U/kMIWcen5d
	aT5GgDUXkqcDEruKGYC72Kz3QiOM18hUP8+Y5QpGAEFu0IB9qFNViSNyODTzo7DWUNW3fY+bqUpa9
	/fS2S+7iA6EgFSFzwcCuM42QWwT5DHUJP3rfz1jJ93Z3Xf0tyCJpHPwXgLBKGtHd9dUcfmPW3jpol
	50VTFUucAyY3xinyjOr/8R5kqeWJD1XZuPHfCcpWMnoXjPdpKk0zVUyBaiKdKjWm+PTQTBOOL/e+H
	18vJRHZU2xTcvhwA3nbqjsLt+tcBOOERYNCVvgW/oTZYpxaGWGgScxpeIt0I2g3kUuWhr5ZGxLVR1
	CR/r63CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9WYe-00Cb6E-37;
	Wed, 14 Jun 2023 19:53:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9WYa-00Cb4D-2w
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 19:53:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q9WYC-0000rI-PC; Wed, 14 Jun 2023 21:53:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q9WYB-007QQ6-O6; Wed, 14 Jun 2023 21:53:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q9WYA-00EI97-Gm; Wed, 14 Jun 2023 21:53:02 +0200
Date: Wed, 14 Jun 2023 21:53:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/8] PCI: microchip: enable building this driver as a
 module
Message-ID: <20230614195302.4oefoainw3bn6pmh@pengutronix.de>
References: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
 <20230614155556.4095526-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230614155556.4095526-4-daire.mcnamara@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_125328_944079_F3BB477A 
X-CRM114-Status: GOOD (  15.03  )
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
Content-Type: multipart/mixed; boundary="===============5355770530033309572=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5355770530033309572==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zkk5goccekctlxud"
Content-Disposition: inline


--zkk5goccekctlxud
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Daire,

On Wed, Jun 14, 2023 at 04:55:51PM +0100, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Enable building this driver as a module. The expected use case is the
> driver is built as a module, is installed when needed, and cannot be
> removed once installed.
>=20
> The remove() callback is not implemented as removing a driver with
> INTx and MSI interrupt handling is inherently unsafe.

The relevant thing here is not that there is no .remove callback (which
doesn't make the driver non-removable) but that the driver has
=2Esuppress_bind_attrs =3D true.
=20
With that properly mentioned in the changelog, the patch is fine for me.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zkk5goccekctlxud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSKGp0ACgkQj4D7WH0S
/k4HEwf/YK/Kh7Sjdv9pCpDMYW1gbkDfUssQC0nNSXYQDywPqo687VoR60lZCQ7L
ObykeoDwqVdJcUHQRomaMcW3tncNxLn7+1q+VVFaQgOMIvdfh7mkMmnuDyIx/sRa
JTRPN+JlC+4dur36CppUzKmCCDZvU/sJYBx8Vjb5bIXWtJlkhhGrPRI9JKH9I7xs
QCAmPlqpfGErf7b4N3oFD1ac4JWcTP4Bhh+3on09BcQEJh0kqRieH30z4A2CjJQ4
xKp1r4Tr2O2b7ks+9Y0I5mBw+dIN7QALIBzCa4PaR7605HPfQyQ49S9EbuW7NEdP
f3o2HFN/EPhZjuiQWlmr2FDRO9bOkw==
=UzMh
-----END PGP SIGNATURE-----

--zkk5goccekctlxud--


--===============5355770530033309572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5355770530033309572==--


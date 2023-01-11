Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2217EC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R7RGERFAHGMytr+uUhSHcmJis7ZceUX2E1WbTh3S3c=; b=SKGixRJJMN1HD9M4BdctRKeYx9
	7PHfklsP5A/YRfSk1KMIiyb5Pxut/KjldNgqcYXDcVzXgZJtC8eW0t7K4CuSNmbVsskDRcABGAmxZ
	f7/N6rA4zC6oDTkXDX36gbU8QgV0aTXJ95E7kRvbvhdPOEeXtz5w7Ex0+luIYmCROn2UzfHOuaC5U
	AzaX3Bsl6XCdY4sW+z/4PAAGn63boa0wpT8d9dTCDdET386N4GeUNZK4IkIwUS3GDDNPKx6crngNa
	qYU/mZjxXGfDGJQicQuLdTXxkEuJ5H+WeOcXnoPcCrK04vGmQoHpeKAmhZ5Y20bSmc287sWmbDx1D
	z3Mh2aWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFesG-00CPNj-Jj; Wed, 11 Jan 2023 17:26:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFerW-00COxj-Oj
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 17:26:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFer9-0002Xh-6S; Wed, 11 Jan 2023 18:25:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFer6-005M1d-0J; Wed, 11 Jan 2023 18:25:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFer5-00C1Yo-7Q; Wed, 11 Jan 2023 18:25:39 +0100
Date: Wed, 11 Jan 2023 18:25:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 03/11] PCI: microchip: enable building this driver as
 a module
Message-ID: <20230111172539.syrrxnghl5qwdcg6@pengutronix.de>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
 <20230111125323.1911373-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230111125323.1911373-4-daire.mcnamara@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092606_842424_42501E9C 
X-CRM114-Status: GOOD (  15.20  )
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
Content-Type: multipart/mixed; boundary="===============7708288234436592648=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7708288234436592648==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdzkzcp4mrdjbo6i"
Content-Disposition: inline


--qdzkzcp4mrdjbo6i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jan 11, 2023 at 12:53:15PM +0000, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Enable building this driver as a module. The expected use case is the
> driver is built as a module, is installed when needed, and cannot be
> removed once installed.
>=20
> The remove() callback is not implemented as removing a driver with
> INTx and MSI interrupt handling is inherently unsafe.

Note this is a misconception. Not providing a remove callback doesn't
prevent the driver from being unbound.

However the driver has

	.suppress_bind_attrs =3D true,

which prevents unbinding. (So the patch looks fine to me, just the
commit log could be improved.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qdzkzcp4mrdjbo6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO+8RAACgkQwfwUeK3K
7AkkbAf/X4viZiqE5wwHL4ML0OPl/vMba9lkh/d9F46mYh4tI/PTfLHXZevkebHH
bmTsNEqtMFwTNarNuMy6GGyJ5om5kStbfhOMaSHEI1xA12sSNydmD0Nb7kwfL5Fy
Y1fIPQ+cKRRN95qa1FO/mwZMeRDEkQWPG99jsylhCyw9odHdWwSPkkMf3Yt7NtaG
LtFTTCzSs5tKxyidItAxYxZsGSVAV5kaUC5KK9b/cLQVbcjJhjakxyOgxeadq2rP
8Twqr+zrx+8T834mlssCzvfKGauVfY8bm1yNBDLXEl+A26W5NYHNBb7PuzT48v1m
ukKeE5nVQLK3EvU8AMcppOG5i1TGnQ==
=syYC
-----END PGP SIGNATURE-----

--qdzkzcp4mrdjbo6i--


--===============7708288234436592648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7708288234436592648==--


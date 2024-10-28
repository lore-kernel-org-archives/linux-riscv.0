Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E29D3399B
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 15:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/tZKEHzvRublu+6nY30vfR6X5Zd7qkZp93dvJ7s8PU=; b=ZXEseBzcHpINyRHxZFhDYT8Lsz
	hhkATWZjflnUMdKG1ONQQZthXphq62uEIcewWKN5zPKd3zRUsQ9UBzYj9Mygo8g7SxlnGknSfzila
	A7Qrvn0nnmNkxkPyhjB4Yrq3oooAwtNU5cQ2AA0Bi/khON5weyQrOsMlrk3UWvnKTJbouqhXGfXza
	gbUGx9AaL2OfitlnQrCAfhkdjuHL4P+jNnlLmWeaeqypi8VORBheOgl9AeAI61nRSa2ZN8Kma0rz0
	+nELyr1dF5NmD2CiCHOdRNyqt5qVciZEdR2sHuGBLbQkw8Qfo9VVZgtwU57wmTjdZwdFZDNoAz14C
	MaIsy/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S4Q-0000000BNcI-1IyB;
	Mon, 28 Oct 2024 15:54:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rfu-0000000BJT4-1RXv
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 15:29:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5Rfj-0001p6-UH; Mon, 28 Oct 2024 16:28:47 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5Rfg-000sdb-1p;
	Mon, 28 Oct 2024 16:28:44 +0100
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2C35A360A41;
	Mon, 28 Oct 2024 15:28:44 +0000 (UTC)
Date: Mon, 28 Oct 2024 16:28:43 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	William Qiu <william.qiu@starfivetech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Message-ID: <20241028-delectable-fantastic-swine-3ab4dd-mkl@pengutronix.de>
References: <20240922-inquisitive-stingray-of-philosophy-b725d3-mkl@pengutronix.de>
 <ZQ2PR01MB1307D96BB8AC0B6BB78C97C9E64F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB1307D96BB8AC0B6BB78C97C9E64F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_082858_409239_56B24101 
X-CRM114-Status: GOOD (  21.04  )
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
Content-Type: multipart/mixed; boundary="===============5311616464797630682=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5311616464797630682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bayufuaqihhp4puc"
Content-Disposition: inline


--bayufuaqihhp4puc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
MIME-Version: 1.0

On 25.10.2024 01:45:30, Hal Feng wrote:
> On 9/23/2024 5:14 AM, Marc Kleine-Budde wrote:=20
> > On 22.09.2024 22:51:49, Hal Feng wrote:
> > > From: William Qiu <william.qiu@starfivetech.com>
> > >
> > > Add driver for CAST CAN Bus Controller used on StarFive JH7110 SoC.
> >=20
> > Have you read me review of the v1 of this series?
> >=20
> > https://lore.kernel.org/all/20240129-zone-defame-c5580e596f72-
> > mkl@pengutronix.de/
>=20
> Yes, I modify accordingly except using FIELD_GET() / FIELD_PREP(), using
> rx_offload helper and the shared interrupt flag. I found FIELD_GET() / FI=
ELD_PREP()
> can only be used when the mask is a constant,

Do you have a non constant mask?

> and the CAN module won't
> work normally if I change the interrupt flag to 0.

What do you mean by "won't work normally"?
It makes no sense to claim that you support shared interrupts, but
print an error message, if your IP core had no active interrupt.

> I will try to using rx_offload helper
> in the next version.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bayufuaqihhp4puc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcfragACgkQKDiiPnot
vG85Ygf9GrLJf5wV7bdgz9vs/sx2rKcJlxRbC5pFv5ebTX6WbvM9DlF2hVFYLukY
OVR12GIkefiKCKDW1cEYxZhba1VifqSaayUs8heOrhUjm8W4gq7/258tWSMuwDVS
OcRyTkEP/1UrCB78AHAFtUML+doEqstQArznjSIuzPbytCVQfbNAkrIwagtqLeiR
Xsj4tXKjJQcoIDNBwtMRGJAgNMLSWwt2y7JRj98ygicPFhcPSZVB+CwvXPA2XxqM
ipRmtWdT+pBJtZ3jdD4uhSKP46ROV9ggtZksy8v00ElJG/lu48rQHvKU4pKGkEK1
FwAZIHUmjawWlux4wTT8gRgosM4fcA==
=vCRm
-----END PGP SIGNATURE-----

--bayufuaqihhp4puc--


--===============5311616464797630682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5311616464797630682==--


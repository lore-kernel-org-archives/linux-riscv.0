Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C03C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK+PmuFMNvjezQVhH6TuRAguEAFld+dOoH7KIb6cc64=; b=hKsZ9rqCvgYls9GoPhL6vRPv89
	HllzxJsZG7oKeYcFyEbb/QKUMtx+B7DYyp9g3rqcsw0cvhOUjSh21Wbm8Iebzj15X/E8xPgwU73jm
	G85clilosJWBpeZI20DXZGZGGZ1XLNdbugNlgqLwm0WN9+G2KJRKwCTaLruxR+EDrDFgVhoQFy8D2
	aYzMnr2uIuI2UkAewtnBS1GtisRkLoYLpcUpc/7RYCIK8GyMZAcg+NrnUnHg4omWjozoEWL2rowC8
	KsIlRvipdskwKvWpAouZcI3mmy4ojfGIxaXy3UYrUE1vebHvUQcNlJoUod4eSkt6r5sKMXf7qnqiH
	K9uBGNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPra-0000000CPQ3-3XLv;
	Mon, 29 Jan 2024 11:31:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUPrX-0000000CPPE-3aYA
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 11:31:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUPrL-0006Kn-Aw; Mon, 29 Jan 2024 12:31:27 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUPrI-0039rt-4A; Mon, 29 Jan 2024 12:31:24 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A89FE280977;
	Mon, 29 Jan 2024 11:31:23 +0000 (UTC)
Date: Mon, 29 Jan 2024 12:31:23 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: RE: [PATCH v1 0/4] CAST Controller Area Network driver support
Message-ID: <20240129-boneless-herbicide-24966319a1e4-mkl@pengutronix.de>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
 <20240129-gills-excitable-01213b5b28eb-mkl@pengutronix.de>
 <ZQ0PR01MB1253323CA8F8173D98BDD3949F7EA@ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ0PR01MB1253323CA8F8173D98BDD3949F7EA@ZQ0PR01MB1253.CHNPR01.prod.partner.outlook.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_033139_938916_9C6F56F3 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Type: multipart/mixed; boundary="===============4342086867404946968=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4342086867404946968==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hdklyqubvughg56z"
Content-Disposition: inline


--hdklyqubvughg56z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 29.01.2024 08:07:49, William Qiu wrote:
> > Is there a public available data sheet for the IP core?
>=20
> We do have the data sheet, but I'm not sure if CAST is willing to make it
> public. I need to contact them first and then reply to you.
> Or you can contact them on their website, which is https://www.cast-inc.c=
om/.

I'll contact them via the website, but please ask them as well, as you
have probably a better, more direct contact to them.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--hdklyqubvughg56z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmW3jIgACgkQvlAcSiqK
BOiiCwf/eNLsL6NzPZwKlkK3NClJKuaLytTsBVxWnFSMs/IZehhGTbvC8ATFyqXM
IoRcuBQ6mMM4KO3nU5ytVMriTGbdIMRvGBgrO/YDNiRChk+vCxSRn+oJ5QUWkZpT
hLcJWXbpAYg4BKOCO9BEQUE6BpPKBxfgXYKO7RMhu5Qg8MZowYaUT/fx8UXibuEb
Hr0KlCJxWRlUZ5LXxtad90r03K2PaLF3V3ORyROLEE4f8uGIKGG/JsSlgRaOKtic
PHNm0K1J1Xxv+8X8rxgwbDhjt/kQznukqUJeOagX6ng6CVCo+qK5qSf1hbOdBm4h
dDJAw2btJHE7BR/CYNTMygV7gtfdqw==
=Mf4/
-----END PGP SIGNATURE-----

--hdklyqubvughg56z--


--===============4342086867404946968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4342086867404946968==--


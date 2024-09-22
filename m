Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C52CF9C6F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1oZMAt+NBdM7UAXxLL9SEQJq6LgVKdmT3YHOYndLtY=; b=LzIJa/tjBOyGLYs+1rWxDu2TJN
	KRf22NxLe7oqElHNjislm/U3G1fU2Fy831qDEa/aqqgm9u4xIfAzo817t7Vn046jyJ9+aCeLMLnNY
	qKZKwtmVOCN1xlA89Vmt/R0lQIhwBIrP2F3fUXTpD7xUo9jNFrGk4nswnbs1OvJfB0+AKK1kPijTn
	knkqZBg8SI6vf9INGdcyNqHOoJoZCMCuFDtTCQeNjcMNCbDA87SKE61uWf1v1LwUTjkNeZO3EdNFP
	7mYfs93V3UCi5NYDY3yyoXKRNqssnF/CxnoLADVyn7bLKEMBxCq1PurYLsrkioGZQ2MeXjm0Sr4Dk
	ALYvTDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssg67-0000000Gwkr-0N4H;
	Mon, 23 Sep 2024 10:15:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfzj-0000000GvcR-2l3A
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 10:08:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ssfzS-00006g-IR; Mon, 23 Sep 2024 12:08:22 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1ssfzN-000vje-Rt; Mon, 23 Sep 2024 12:08:17 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6D6CE340BDC;
	Sun, 22 Sep 2024 21:13:45 +0000 (UTC)
Date: Sun, 22 Sep 2024 23:13:44 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Message-ID: <20240922-inquisitive-stingray-of-philosophy-b725d3-mkl@pengutronix.de>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240922145151.130999-4-hal.feng@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030839_719662_19418B2E 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Type: multipart/mixed; boundary="===============1299086851671250043=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1299086851671250043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ynvekyrzzuwpg3ly"
Content-Disposition: inline


--ynvekyrzzuwpg3ly
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.09.2024 22:51:49, Hal Feng wrote:
> From: William Qiu <william.qiu@starfivetech.com>
>=20
> Add driver for CAST CAN Bus Controller used on
> StarFive JH7110 SoC.

Have you read me review of the v1 of this series?

https://lore.kernel.org/all/20240129-zone-defame-c5580e596f72-mkl@pengutron=
ix.de/

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ynvekyrzzuwpg3ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmbwiIUACgkQKDiiPnot
vG+1cAf+JRa6qiL+McRGaVYbwDK+5KafGW3568LC7Fz2J4e36IgRjTNWrK3zGdwR
lUQekR2f2bapcH5T72+S0KDjjyI0v28jzRcWZR/A1/FsKY+xFTeNzOG+6ODx2VRV
YMxZ58ZM2telOVS0SUtaGiLpXBrayzpz5nCOUxyymt1SdjjkdaVifDayKJI5vwvh
IT4lXhvNRgPy3Guw9C9YcSk0OyIZ/TFOosTB3Db3j4M9SxdL8HgIc2H5NkV1+4Tz
UmEmWzNKgZS0XDRPtpMe6DqR+zkm4IVm+9NNk6+0XRQ8aEZr77W7LQq946qSd/1O
EgLfQi6D50XAsIef/NFxmgOk9EUKAQ==
=udGo
-----END PGP SIGNATURE-----

--ynvekyrzzuwpg3ly--


--===============1299086851671250043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1299086851671250043==--


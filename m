Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A5C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Noly1PD+oUaOclF5e0jcYufDg/8AGsJJSOFupxmwSHg=; b=4XlVVTYeiAjuWGqvKfcoMF75rk
	jogBkumfSbrcibVAE1OJVLTZllmEH4nlUNNh3d64iyyIidtnrhP31UV1sqFoWe1TnH4RIf2T3QW6X
	EK212y2pYq5s4oXmDOhb14qytGwL/eEvK02K1Otbr4LidHVv3zOVnJNYf4tbgZwPJe+iQ42dEToQ3
	448MlEYabhpPE4DJ0EBPq9G6yOClj8o/5xXS07VHTRvlc3/xNfEq+wg+pvYBdWcgK3YYMpo+obPMW
	TZgFJFSaSNdw45TagxJfC0WyjHnl3yPxFHp2yI6JPv3jEdxPHVKRrVg1bsD989rVGX7ML33RLNIok
	XshXdQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuU7-00GLg1-33;
	Mon, 07 Aug 2023 07:16:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuU5-00GLew-1l
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 07:16:58 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qSuTs-0008Tg-09; Mon, 07 Aug 2023 09:16:44 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 192BD20588D;
	Mon,  7 Aug 2023 07:16:42 +0000 (UTC)
Date: Mon, 7 Aug 2023 09:16:41 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: John Watts <contact@jookia.org>, Maksim Kiselev <bigunclemax@gmail.com>,
	aou@eecs.berkeley.edu, conor+dt@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, edumazet@google.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org,
	wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller
 nodes
Message-ID: <20230807-denatured-gangrene-e6f37ba5f9ef-mkl@pengutronix.de>
References: <20230721221552.1973203-4-contact@jookia.org>
 <2690764.mvXUDI8C0e@jernej-laptop>
 <ZM8-yfRVscYjxp2p@titan>
 <4848155.31r3eYUQgx@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <4848155.31r3eYUQgx@jernej-laptop>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_001657_585131_792D48CB 
X-CRM114-Status: GOOD (  24.58  )
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
Content-Type: multipart/mixed; boundary="===============7798560563481412247=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7798560563481412247==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knn54obranxnvfa4"
Content-Disposition: inline


--knn54obranxnvfa4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06.08.2023 13:42:28, Jernej =C5=A0krabec wrote:
> Dne nedelja, 06. avgust 2023 ob 08:33:45 CEST je John Watts napisal(a):
> > On Sat, Aug 05, 2023 at 07:49:51PM +0200, Jernej =C5=A0krabec wrote:
> > > Dne sobota, 05. avgust 2023 ob 18:51:53 CEST je John Watts napisal(a):
> > > > On Sat, Aug 05, 2023 at 07:40:52PM +0300, Maksim Kiselev wrote:
> > > > > Hi John, Jernej
> > > > > Should we also keep a pinctrl nodes itself in alphabetical order?
> > > > > I mean placing a CAN nodes before `clk_pg11_pin` node?
> > > > > Looks like the other nodes sorted in this way...
> > > >=20
> > > > Good catch. Now that you mention it, the device tree nodes are sort=
ed
> > > > by memory order too! These should be after i2c3.
> > > >=20
> > > > It looks like I might need to do a patch to re-order those too.
> > >=20
> > > It would be better if DT patches are dropped from netdev tree and then
> > > post
> > > new versions.
> > >=20
> > > Best regards,
> > > Jernej
> >=20
> > Agreed. Is there a way to request that? Or will the maintainer just read
> > this?
>=20
> Hopefully it will.

I'm just catching up on last week's post (I had a long off-line
weekend).

I'll revert the DT changes and send a PR to net-next.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--knn54obranxnvfa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTQmlYACgkQvlAcSiqK
BOgEOAf/fUZfi2B2HANlxUlb4fdyka/TP5ZLHNHvg7p3zeXtN/14VVOHERsUPbXh
Kldv7yC7b/fwT8eNXA00kF7stor8jzf2pmRnH0O1Nq/OeOezlf6neZxWwzitGCbL
qWYirtSsJw5oN4Q/hxohHL2y9CX2jCXK9f6TQ3eMzr2vhXCrtDxLKPBaL0Abb1qv
vRdIDpQtXYpYWsXXlP1Fw9PArbvZ3mDVFDnBpYIri/nt7wX+TYveOjVOn1h8W+Im
dbFqaDjgwOe4SWL2oWpVMQAWOAs4gCM3af9aC/zcXbYXnEHZduRWlPs/g9kNo13L
IP3YMj70efZqX1eHk2reC0R/Ppf/Xw==
=TA6D
-----END PGP SIGNATURE-----

--knn54obranxnvfa4--


--===============7798560563481412247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7798560563481412247==--


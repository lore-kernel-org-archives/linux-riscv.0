Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE4C48285
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxOrayXNk4QWgZlNA8Xb31L6VwA1FDstettIQhrkdTw=; b=WT7K/zafVQhF3v2w4GMznDlszT
	beE3IIJoXFCCW2KouJhdW4C8j06IzbnVaQeyl5XikKkI6m4BmDsJONkvZekmcTpoLb0FkQTWqQ6zJ
	9N7OsV/1TLdzd7VV0UWzjPvIeU1Yqn0qru1wFNenBD9dTmMug2BVNoQJd2CN3rWxFKKrBm/KIl2YJ
	gaTpnI0Q8p24BZh7jlUo+WWOt/be5kfaDaBHbFEuZQfTymrs0i6RcaASRyC0xTohDh712mjp8Gj9F
	t7d5EBnb05muCaW8d5II98g97pm7qhWUazHNPIP6/TJ8ELbYe8j9KG/qFWPki6vA38R/XHcj9W7L5
	nqwNqkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnkD-0000000GmKw-0z9H;
	Tue, 30 Jan 2024 13:01:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnk9-0000000GmIg-02KY
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 13:01:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUnjk-0004RW-00; Tue, 30 Jan 2024 14:01:12 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUnji-003Phu-6h; Tue, 30 Jan 2024 14:01:10 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B2018281751;
	Tue, 30 Jan 2024 13:01:09 +0000 (UTC)
Date: Tue, 30 Jan 2024 14:01:09 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Message-ID: <20240130-fragrance-disinfect-22cc1911bf48-mkl@pengutronix.de>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
 <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
 <20240122-uncoated-cherub-a29cba1c0035@spud>
 <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
 <20240130-narrow-lyricism-8b25baac7bb2@wendy>
MIME-Version: 1.0
In-Reply-To: <20240130-narrow-lyricism-8b25baac7bb2@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_050137_083098_1A351A7A 
X-CRM114-Status: GOOD (  26.10  )
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
Content-Type: multipart/mixed; boundary="===============6219471320706595339=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6219471320706595339==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f4vw5ea6lcxcee4m"
Content-Disposition: inline


--f4vw5ea6lcxcee4m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.01.2024 12:11:44, Conor Dooley wrote:
> On Mon, Jan 22, 2024 at 04:31:32PM +0100, Marc Kleine-Budde wrote:
> > On 22.01.2024 14:56:09, Conor Dooley wrote:
>=20
> > > I think we already had this discussion on v1, where I said that the
> > > binding requires the clocks to be in that order, regardless of whether
> > > or not clock-names is provided. You feel more strongly about it than I
> > > do, so I will add them when I get around to sending a v3.
> >=20
> > Yes, this discussion sounded very familiar to me, never mind. Keep it as
> > is, and let's get this binding and the CAN driver upstream!
>=20
> BTW, I didn't see an ack on this nor do I see it in linux-next (yet).
> Are you expecting the patch to go with the rest via the clock tree,
> via the DT tree or will you be taking it with CAN stuff via netdev?
>=20
> I can resend this one patch with a netdev appropriate subject prefix
> if you like.

Feel free to take the whole series via the clock tree.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--f4vw5ea6lcxcee4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmW48xIACgkQvlAcSiqK
BOh05ggAtrkirkvFxfCZmmZ3aogx7JpH2jGUD/uWcu+/to8Esew52WV5+k+a3PFY
yxF+BD27a4/qjz5d6+KlUy58RrTj18KJIT0PoLwfFTXPUrdqBVD7MYok3u3eWVkR
Y5CIFBKQTCVBOCsnOPaEjrI6SIqpgJedEJeEhRm8hObb5a9EZR82GkYW2NSojYZj
8bhFtoSuUlgZ5Qiqo1DIZct1verZ0pTjbFsDTtGzlrOKQ5zxalbZKgr+Qpofpbfz
aSBQCch6ZW+m3fxuJP4S6V6NQIwI14HQIbR1xysbciRy5hn4I+PczwLPhHx+VgQr
5nBdDcwbEHBxlsqMSPbp/65xsStnYw==
=foUg
-----END PGP SIGNATURE-----

--f4vw5ea6lcxcee4m--


--===============6219471320706595339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6219471320706595339==--


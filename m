Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73740C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/zDxdmdlMsN3PCmhB0sq+9pS10u59O/04RNZqF1//E=; b=iTIi+mPBV+aF/NGjz41bRC1Whh
	d506t4loNMRiAxiXstEnjIOjBGODvvcBAEGVl+1eq8ip7074UcqKNuoMJ0BhQAPG0YJ5oKwVjHmLJ
	Q8xMBi2B6Fd/GlfjWIV5nm6qwh3JKGJCaZyFVt8cfi06+K4mgKbK9wq4wkQvX9FoVr65YthkRbyKt
	vjELCmLJl6pzkwstdfeiF2DM5KfQngWNMDa8dCAa+7K/tO5FehsNX1dOH1e94z0kyiQib3LjXqlQt
	KlO20uCql/wdlu60tOVHAC9xHQWXJaRJMyJfg38m52t7x5kYl/xdVndHscJrlIdzbbtQYpnxWvMi2
	K1kv05DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRwH9-00Cjfg-1U;
	Mon, 22 Jan 2024 15:31:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRwH6-00CjeG-38
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 15:31:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rRwGs-0001yO-Ae; Mon, 22 Jan 2024 16:31:34 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rRwGr-001d3P-D0; Mon, 22 Jan 2024 16:31:33 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E63BB27B74D;
	Mon, 22 Jan 2024 15:31:32 +0000 (UTC)
Date: Mon, 22 Jan 2024 16:31:32 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Wolfgang Grandegger <wg@grandegger.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Message-ID: <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
 <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
 <20240122-uncoated-cherub-a29cba1c0035@spud>
MIME-Version: 1.0
In-Reply-To: <20240122-uncoated-cherub-a29cba1c0035@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_073149_009000_F59A0A46 
X-CRM114-Status: GOOD (  34.75  )
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
Content-Type: multipart/mixed; boundary="===============8863171201332104513=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8863171201332104513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fzilfxiuysgrcoiy"
Content-Disposition: inline


--fzilfxiuysgrcoiy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.01.2024 14:56:09, Conor Dooley wrote:
> On Mon, Jan 22, 2024 at 03:46:04PM +0100, Marc Kleine-Budde wrote:
> > On 22.01.2024 14:21:04, Conor Dooley wrote:
> > > On Mon, Jan 22, 2024 at 02:13:16PM +0100, Marc Kleine-Budde wrote:
> > > > On 22.01.2024 12:19:50, Conor Dooley wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > >=20
> > > > > The CAN controller on PolarFire SoC has an AHB peripheral clock _=
and_ a
> > > > > CAN bus clock. The bus clock was omitted when the binding was wri=
tten,
> > > > > but is required for operation. Make up for lost time and add it.
> > > > >=20
> > > > > Cautionary tale in adding bindings without having implemented a r=
eal
> > > > > user for them perhaps.
> > > > >=20
> > > > > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs C=
AN controller")
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > ---
> > > > >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 =
++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/net/can/microchip,=
mpfs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-ca=
n.yaml
> > > > > index 45aa3de7cf01..01e4d4a54df6 100644
> > > > > --- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-ca=
n.yaml
> > > > > +++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-ca=
n.yaml
> > > > > @@ -24,7 +24,9 @@ properties:
> > > > >      maxItems: 1
> > > > > =20
> > > > >    clocks:
> > > > > -    maxItems: 1
> > > > > +    items:
> > > > > +      - description: AHB peripheral clock
> > > > > +      - description: CAN bus clock
> > > >=20
> > > > What about adding clock-names, so that the order can be checked
> > > > automatically?
> > >=20
> > > I don't personally care for doing so, but if your heart is set on hav=
ing
> > > them, then sure.
> >=20
> > Usually the CAN driver needs to have the clock rate of the clocks that
> > the basis for the CAN bus clock. Looking at the clocks description it's
> > probably the 2nd one.
> >=20
> > With clock-names we can automatically check that the 2nd clock is always
> > the CAN clock.
>=20
> I think we already had this discussion on v1, where I said that the
> binding requires the clocks to be in that order, regardless of whether
> or not clock-names is provided. You feel more strongly about it than I
> do, so I will add them when I get around to sending a v3.

Yes, this discussion sounded very familiar to me, never mind. Keep it as
is, and let's get this binding and the CAN driver upstream!

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fzilfxiuysgrcoiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmWuilEACgkQvlAcSiqK
BOhCkggAgyHW5AL32kouESoPfzIRkhef/gYpfWj8j5zEKyJ0Honmyt+im5UgOIjS
etZAqb+sORwDFrLXzPb+BIS4GXyCldkukOcvfgFxvfGAkaxf6ci+keV4UgyMpsgG
3/yXN/x2it5yA1idu/i8QdLjElTeq7Yoj18nfGbbSE7VzNK3Vh9PD/fR+Eq07wNE
x3bFsh1YaBU2PeiGYYK08pR6PkPcmQHYRQFOhMxgpWJ72NnPinG8MuQuNtHwlcLh
YnhmjeBgjEOUF35I+WSZ0056QeeAF7vbmrdAtWIUN2yygsVTbrvDGnZL45ynfFUC
Xlu+5O2ZopqsqunltpKOZTLJ6Prdbw==
=vqnx
-----END PGP SIGNATURE-----

--fzilfxiuysgrcoiy--


--===============8863171201332104513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8863171201332104513==--


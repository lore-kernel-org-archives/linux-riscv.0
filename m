Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC6AC47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOGIILE5BoDWh/PDDSz24b8c6dqzlVi/jJ76hVlIRvM=; b=toHlUALyJi+ZuNzTirHaT5zz7h
	UEOOHa/1C9eukbIt5RWYc0nqsG/HM8/KFM5LanJsUQohbU9NTzS5DOcFXs/H+GDAV4LbLF7QKMfHm
	ONW9tMR7RkWeoY/yunyqRSK0m9+y/agYKL0KUM/YEUz4TUNVABoTqnrkIATZeFV3KCTIkoYFxhERP
	qJClMTZQvhcLhiiRvtqml6XmEEAkt9YfZoSc5URo4LYDydWN36NTh6y72Y06FVw5LcnAk46VQBbkX
	6ZYpFG1baoIFapr7iARdS6YxpArHkLWnWJBKict+KrNpfolnSG70N81EWeMKOiGU+XCsjVw6kyqjN
	Mi9PZHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvZC-00CSxy-1p;
	Mon, 22 Jan 2024 14:46:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvZ8-00CSwd-0P
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 14:46:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rRvYt-0003ay-HO; Mon, 22 Jan 2024 15:46:07 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rRvYr-001cU3-Kp; Mon, 22 Jan 2024 15:46:05 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2DCE527B6A2;
	Mon, 22 Jan 2024 14:46:05 +0000 (UTC)
Date: Mon, 22 Jan 2024 15:46:04 +0100
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
Message-ID: <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
MIME-Version: 1.0
In-Reply-To: <20240122-cruelly-dainty-002081f0beb2@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_064622_160300_574503AF 
X-CRM114-Status: GOOD (  27.13  )
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
Content-Type: multipart/mixed; boundary="===============4025730827242909870=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4025730827242909870==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zuyztwmnpelwfpxf"
Content-Disposition: inline


--zuyztwmnpelwfpxf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.01.2024 14:21:04, Conor Dooley wrote:
> On Mon, Jan 22, 2024 at 02:13:16PM +0100, Marc Kleine-Budde wrote:
> > On 22.01.2024 12:19:50, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > The CAN controller on PolarFire SoC has an AHB peripheral clock _and_=
 a
> > > CAN bus clock. The bus clock was omitted when the binding was written,
> > > but is required for operation. Make up for lost time and add it.
> > >=20
> > > Cautionary tale in adding bindings without having implemented a real
> > > user for them perhaps.
> > >=20
> > > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN c=
ontroller")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 ++++=
--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs=
-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.ya=
ml
> > > index 45aa3de7cf01..01e4d4a54df6 100644
> > > --- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.ya=
ml
> > > +++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.ya=
ml
> > > @@ -24,7 +24,9 @@ properties:
> > >      maxItems: 1
> > > =20
> > >    clocks:
> > > -    maxItems: 1
> > > +    items:
> > > +      - description: AHB peripheral clock
> > > +      - description: CAN bus clock
> >=20
> > What about adding clock-names, so that the order can be checked
> > automatically?
>=20
> I don't personally care for doing so, but if your heart is set on having
> them, then sure.

Usually the CAN driver needs to have the clock rate of the clocks that
the basis for the CAN bus clock. Looking at the clocks description it's
probably the 2nd one.

With clock-names we can automatically check that the 2nd clock is always
the CAN clock.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zuyztwmnpelwfpxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmWuf6oACgkQvlAcSiqK
BOiCMwf+PILQdcoKYj1XmQD6oOg99QEnpCsTXRVcTpE6fUQPNRyfKH6+KYIhiXhn
bBp6u3rBJ6pnaJfTajjpdFrgjpD7QJBD88Eg37Elv8V9211/UtPLuVLRVQpQfREt
8vmqnVihZCubToC+pC3B/RadtYJCUb6uD2A0tvdmF154H9lwvpe+ojEmLp/6j9F1
fr/p52aGJcKdO+8VUx7dXpKlaghGwJoVcPIhTBxaa60hhJsSM8mNuVHx84GtZNBL
K+ELI4xCxy5U9gs3CAr9FiP2zbtetZhnj19rHAY8ndFGT6DVu9Hp/xgWGyO9pCUR
rwYkqH/u8YFRS0UmZmZG5A49oESIUQ==
=yo0x
-----END PGP SIGNATURE-----

--zuyztwmnpelwfpxf--


--===============4025730827242909870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4025730827242909870==--


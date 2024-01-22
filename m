Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2871AC47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYGfS2GsKbi/w8VDIMhqKY3DAytiZAYVpq14bjE9l54=; b=qWDN9L+BOhjnUo4OVBrZ5IyErl
	qgm7XBA5e2lSpDNnROtmr7XOAgd3e/Hwu0tu43qTF54mMZWCtvF1+QL+SpnE1cl7hRUEfKU+jjS/V
	sOK+zprhHl+R8xpxlQWhdpiyZfIAX7I9Gm4cB3pgGopVYPpViCF3zaO9NaIlVzE26E/3dBjulv2KG
	LUWQb7pXyOf2pS2DVqj+xshtAqIxUq9B+YRZ2dTcQrjY3zdi54bFq6fG8tP7J8DrRINKmmlgbo18D
	6YbgFGzgOaMCjtm9eAdGC+u0vG/VKs8BSnpnmVgSFNA+BYtZbiZA1x++pp/WAfH6jlnhlnKOYwFOo
	1dBsjwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvj2-00CUzV-0Z;
	Mon, 22 Jan 2024 14:56:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvii-00CUfk-2o
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 14:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1638A6150B;
	Mon, 22 Jan 2024 14:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6468C43390;
	Mon, 22 Jan 2024 14:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705935375;
	bh=aylFoYFUNFDwJsODArIOK0d6BnWENGefvOy/9zETano=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lF69lYdGrvMV1bT1hg/5DzxS20FbA4Ah7UaL9p1jiDmR1zA7PdY5nSrRaEyzMelNB
	 iB4igEA6RBKx5rP6sm4hLAQcsSElqObxT0lK/AjnxCDzSnGrHdgXSpyzhKFX7pls+/
	 SDyKfxIZF4FqNwVu+qH1o2NseSOD+QTlKJZJArLtdUJcrvPJfowgsNfvf5/+p1lJAO
	 K/EOe2UbqpTszK6Dci4ZCv44aUB/vLhvWUxqnmqqfAmjDkDwbseLtlKlB/xsZwaLpO
	 7Uot3P6JWc9O+KaPragbwuwW8aYwqOAGvhwyY9uHDMpzI7OL9BwmkOqbAW+6o4EtbA
	 kmBPqoS3P6zzQ==
Date: Mon, 22 Jan 2024 14:56:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Message-ID: <20240122-uncoated-cherub-a29cba1c0035@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
 <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_065616_996760_EC866502 
X-CRM114-Status: GOOD (  30.53  )
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
Content-Type: multipart/mixed; boundary="===============2542328752275570698=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2542328752275570698==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VZgP6gFILu/j/CyX"
Content-Disposition: inline


--VZgP6gFILu/j/CyX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 03:46:04PM +0100, Marc Kleine-Budde wrote:
> On 22.01.2024 14:21:04, Conor Dooley wrote:
> > On Mon, Jan 22, 2024 at 02:13:16PM +0100, Marc Kleine-Budde wrote:
> > > On 22.01.2024 12:19:50, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >=20
> > > > The CAN controller on PolarFire SoC has an AHB peripheral clock _an=
d_ a
> > > > CAN bus clock. The bus clock was omitted when the binding was writt=
en,
> > > > but is required for operation. Make up for lost time and add it.
> > > >=20
> > > > Cautionary tale in adding bindings without having implemented a real
> > > > user for them perhaps.
> > > >=20
> > > > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN=
 controller")
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 ++=
++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/can/microchip,mp=
fs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.=
yaml
> > > > index 45aa3de7cf01..01e4d4a54df6 100644
> > > > --- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.=
yaml
> > > > +++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.=
yaml
> > > > @@ -24,7 +24,9 @@ properties:
> > > >      maxItems: 1
> > > > =20
> > > >    clocks:
> > > > -    maxItems: 1
> > > > +    items:
> > > > +      - description: AHB peripheral clock
> > > > +      - description: CAN bus clock
> > >=20
> > > What about adding clock-names, so that the order can be checked
> > > automatically?
> >=20
> > I don't personally care for doing so, but if your heart is set on having
> > them, then sure.
>=20
> Usually the CAN driver needs to have the clock rate of the clocks that
> the basis for the CAN bus clock. Looking at the clocks description it's
> probably the 2nd one.
>=20
> With clock-names we can automatically check that the 2nd clock is always
> the CAN clock.

I think we already had this discussion on v1, where I said that the
binding requires the clocks to be in that order, regardless of whether
or not clock-names is provided. You feel more strongly about it than I
do, so I will add them when I get around to sending a v3.

Cheers,
Conor.

--VZgP6gFILu/j/CyX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6CCQAKCRB4tDGHoIJi
0pBqAP9YBmYf5WMQ1g9eFFxDgDvxgLL7NbWukSK4TuirCpfVHwD/Vdz4dl59G+UV
fpzZQ35NUAbACLJ4724ApN5rJRTBQQU=
=WsOe
-----END PGP SIGNATURE-----

--VZgP6gFILu/j/CyX--


--===============2542328752275570698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2542328752275570698==--


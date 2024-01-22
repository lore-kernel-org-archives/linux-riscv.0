Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA70C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdDw5HXCQb17eH1hLeueFhuZEh7mM09NMGezmjHAFHU=; b=0nXKKzBLCabizv8PwsdXAUJWpC
	91/Ry3EgMZNTfXho0FQ8WpmI5dYTIWmSCl/01FJfQ5FQaWd1J9LgO3EGNbGly6cE9st/cPNlEZKGy
	QkEBZ+w4PLCIDhT+FljtdxEpbP5Vax3HdTzA+tiwwo4uWsk1BRU02mUs0Ofj9CdZmf0tJV49gegav
	ceGu+ZCiGtFw3GWga4efLFjfxNbmQRFW6H2BVIlEo2KPAzBYV6N17BjeWSIp1XWZzQaKfJ3tD8SYt
	mzEYVpVEbi7NeRDA/I83w3MYQUDf/kG5bUZmUco2FwuQy0FTrfd6TrRUUkW0cQbXhSzyKlPNJME5w
	3gQ4bhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvAp-00CNRV-1L;
	Mon, 22 Jan 2024 14:21:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvAm-00CNQZ-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 14:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D54A160F4B;
	Mon, 22 Jan 2024 14:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F2FC43390;
	Mon, 22 Jan 2024 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705933270;
	bh=sx/SZLbzMQXRoEFA2HncNv0TFxOKZA5thjdd5ftlYe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aULTBvzOcVWXQIjlnSyRyEMNDtqOjd3XEOyS8vuVrbiYHUA7YtaRnRjRc9Z9d25Sg
	 CqrCc9VQ5U02axVUdBL8THASd0iD3CqiiczGwsv7P61HCxDSa06iAOLsKxkDi3rSsd
	 ZIzh1VlKgWGaVRF94JjyzQaeednEnO9saZS0FFK1SI2klZPrtrs5wa6hrfwEbmz3/q
	 kxGxwBcIBe7DQDGX/ASVUHH6GwMt/wcTDX4D9G6GpY+dVUV+761IJsAKRUVXec2mjb
	 GnO2zyWh5L/nRHdrDKXj0npYtFpVBowpgjCjlzqfJ0ZwAij3KGddkhl1l+C3/APBSZ
	 zplaUPlvFcPpA==
Date: Mon, 22 Jan 2024 14:21:04 +0000
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
Message-ID: <20240122-cruelly-dainty-002081f0beb2@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_062112_630366_2F6B8DE1 
X-CRM114-Status: GOOD (  20.97  )
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
Content-Type: multipart/mixed; boundary="===============4937371493231005966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4937371493231005966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DgDTawVh/uoBk6a9"
Content-Disposition: inline


--DgDTawVh/uoBk6a9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 02:13:16PM +0100, Marc Kleine-Budde wrote:
> On 22.01.2024 12:19:50, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
> > CAN bus clock. The bus clock was omitted when the binding was written,
> > but is required for operation. Make up for lost time and add it.
> >=20
> > Cautionary tale in adding bindings without having implemented a real
> > user for them perhaps.
> >=20
> > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN con=
troller")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-c=
an.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> > index 45aa3de7cf01..01e4d4a54df6 100644
> > --- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> > +++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> > @@ -24,7 +24,9 @@ properties:
> >      maxItems: 1
> > =20
> >    clocks:
> > -    maxItems: 1
> > +    items:
> > +      - description: AHB peripheral clock
> > +      - description: CAN bus clock
>=20
> What about adding clock-names, so that the order can be checked
> automatically?

I don't personally care for doing so, but if your heart is set on having
them, then sure.

Cheers,
Conor.

--DgDTawVh/uoBk6a9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa550AAKCRB4tDGHoIJi
0mG6AQCzkwjYc3ET9xROc6H+kOYEOP7ViMXoh/nf1GZddfy7NQD+Ny8uVB9lFx5n
5oK3FNCWB0tKkiI3fXCZswAn1hOjGA0=
=3HmK
-----END PGP SIGNATURE-----

--DgDTawVh/uoBk6a9--


--===============4937371493231005966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4937371493231005966==--


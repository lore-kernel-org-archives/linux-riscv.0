Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C3F1125863
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCv9V0OpdhN1I6neJYI1nWPH5AmRCkTOZ5F4GKpVuGc=; b=s2fTDhcpHuYykvFh9ilIBZrh37
	lfN1j7RxtUv+N1i/ZyM8UcjTZGirFTHrJo+Qio80Vl+8TKlvLXDVzULGNTH9uhSGEIM6hAFPVcRxR
	OrnhSy3+m8QYy54S0B7Hc63PYVXoVdDZ80tmF+rXSENNzrkeFsHowJoYpOLGSl12NdmMltSDf/zjD
	FUZHoU79B2R8kw3P4lvzCrvGmjc1ZedJgYBl//+HZjJJeubc/Uajr3WMDISpAiMSORnLJZ5vk6NAw
	hc0sqjeEzZo1zldJmFUTmIYL/46KxfeS+z3/+4bPU7C92k7fNk0eq53KWpYF6NezoMrxkx2M5W5zv
	/OpoYOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Nz9-0000000C7vr-2ahR;
	Wed, 11 Mar 2026 18:08:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Nz8-0000000C7vU-0KXv
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 18:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31DA960054;
	Wed, 11 Mar 2026 18:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96420C4CEF7;
	Wed, 11 Mar 2026 18:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773252519;
	bh=XawCcOA4Jr7tFQ8sqhyB8MmvC3bH5pq//7zAxd0ijr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqifVIMzkcLUNr5eejYjS4DCibDuyB1iPk/MbTV0vH9WPWCHf4nVLPCk6Xo7++oLY
	 8omBpNuWrxXeaC6IqZ117GSz4cPM6ltPSe4ELb7YtUGIqzV/TrTYUy8TYb9dudvoBc
	 b15x3U1yfssSmQtQFCd5VUcN66HFXisy4feR4VujfMbbR0OCvygTm1hupxKL2ClVz/
	 MwHvNzRHKx9c9AFurFEiCcwN5pBgx3yYXABVw3MZ6UCIjPZrC7scuqKhT9XqCvVEph
	 hv3CJ3lP+c4XWN/NbHemPNkwC6CnF+hNc4lrq9VI1bX1m7kTpfjsv8cUzxuPAVthuc
	 eU2fEtiVemVcQ==
Date: Wed, 11 Mar 2026 18:08:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com
Subject: Re: [PATCH net-next v3 03/10] dt-bindings: net: cdns,macb: replace
 cdns,refclk-ext with cdns,refclk-source
Message-ID: <20260311-rival-kerosene-81d12381d120@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
 <20260310-sneak-handclap-c150d8f1236b@spud>
 <20260311-horned-dexterous-caribou-3a46fb@quoll>
MIME-Version: 1.0
In-Reply-To: <20260311-horned-dexterous-caribou-3a46fb@quoll>
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
Content-Type: multipart/mixed; boundary="===============8232780029663999693=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8232780029663999693==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzbrZhLK2nJ/Peoo"
Content-Disposition: inline


--CzbrZhLK2nJ/Peoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 08:00:54AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 05:17:10PM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Ryan added cdns,refclk-ext with the intent of decoupling the source of
> > the reference clock on sama7g5 (and related platforms) from the
> > compatible. Unfortunately, the default for sama7g5-emac is an external
> > reference clock, so this property had no effect there, so that
> > compatibility with older devicetrees is preserved.
> > Replace cdns,refclk-ext with one that supports both default states and
> > therefore is usable for sama7g5-emac.
> >=20
> > For now, limit it to only the platforms that have USRIO controlled
> > reference clock selection, but this could be generalised in the future.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../devicetree/bindings/net/cdns,macb.yaml    | 39 ++++++++++++++++---
> >  1 file changed, 34 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Doc=
umentation/devicetree/bindings/net/cdns,macb.yaml
> > index cb14c35ba9969..a492357570edd 100644
> > --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> > +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> > @@ -120,12 +120,14 @@ properties:
> >    power-domains:
> >      maxItems: 1
> > =20
> > -  cdns,refclk-ext:
> > -    type: boolean
>=20
> This is already an implemented ABI, so you cannot drop it even if some
> devices works fine on default. Instead please deprecate it and keep
> drivers backwards compatible for whoever is using it.

The driver still will support it for those devices, but I don't see any
value in keeping the property about, even deprecated, when it doesn't
work properly. If you insist that it be kept and marked deprecated, it
needs conditional rules to only permit it on devices that it actually
does something. I'm surprised you even considered that I would drop
support for it from the driver!

> > +  cdns,refclk-source:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum:
> > +      - internal
> > +      - external
> >      description:
> > -      This selects if the REFCLK for RMII is provided by an external s=
ource.
> > -      For RGMII mode this selects if the 125MHz REF clock is provided =
by an external
> > -      source.
> > +      Select whether or not the refclk for RGMII or RMII is provided b=
y an
> > +      internal or external source. The default is device specific.
>=20
> Best regards,
> Krzysztof
>=20

--CzbrZhLK2nJ/Peoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabGvoAAKCRB4tDGHoIJi
0qYJAP9SsPtMLqsKLk3++GjsX/sVhVG2+UVwOXE5GD+tJz8eDQD+PEe3Z/ZeEbTq
g6twAbUPHM0gSKmKvD9509m1+an2Egs=
=PWoT
-----END PGP SIGNATURE-----

--CzbrZhLK2nJ/Peoo--


--===============8232780029663999693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8232780029663999693==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D69C48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 18:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1u+LUdnl/BDBey7PmwN7HgiRquZ33df8la44rhLKKQ=; b=F7qknw1dd95bnA/B202iNViSXg
	TRPQPoE+TqmuGxsYDQJWT5jKXeUjrH0Uml5qs9dhH2Ht0HHh/Rx09UltDHzh7j1lELsyNlbcmr1Gn
	M27SWdVNVHvu9Jbk7l1BBUPZBI0tN7FPhHoyHEVrunMK47oC4RfMo/X06eVKNa/PQCJFy1tfwoDHu
	wvjfPJyT1NWEvYZnHsGg3rp8MZX41ids/TGcvbklxdxCBIlrn3OslDuPcvVGjzFe47n1YzAX9RApb
	d7qdqpgHAnfy0gxbZguayjA4ch1p8lP3I378lDKA4TUjjJFmIdGpDWvNYDfeDR7j4/wXadMZ5RqoN
	9UmXJFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcHo-000000096TR-41sd;
	Thu, 01 Feb 2024 18:59:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcHk-000000096SC-3tvC;
	Thu, 01 Feb 2024 18:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7ED28CE2744;
	Thu,  1 Feb 2024 18:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9CEC43394;
	Thu,  1 Feb 2024 18:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706813977;
	bh=I1NNXAkgesc7dKK6HS2ID8NMVYdnGuoGc/8FPQaG/B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpD4ef5OrMVjIPscn4IEXS/9g9WKcBMmDKBFa3kyUooemnxgqmRn8spZZiz30At7n
	 3aJw/14Ac/p94rgwHvpllfDNQ1nhNMqA4a3+roejfSbXeUNyWW95jwwM/v+yPm24YN
	 A/GOS7G8pDrAb2fA1ruCCN4/wKa6ODQpYhm3b0Xh4Q1O9y48Xei1adx8QNl4GOwoUm
	 +w+vHuUOX+c9gDOlS6K2gLxXa6p0cg+TcciextdkDVNcZPL2qq6tQrKtQls0Ku+pm1
	 HS3kswBOIw2kP9KScsbUvLlQOzZWsf5znJVqftfRt1PthT+m9usgrDE+1Zc3hRUxr9
	 ttjEHh290bmKg==
Date: Thu, 1 Feb 2024 18:59:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20240201-numbing-reconcile-64d05bb88e9c@spud>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
 <20240131125920.2879433-2-privatesub2@gmail.com>
 <20240131145244.4f534bac@donnerap.manchester.arm.com>
 <20240131-renewably-glimpse-a80339e8ff81@spud>
 <20240201174851.62e74089@donnerap.manchester.arm.com>
MIME-Version: 1.0
In-Reply-To: <20240201174851.62e74089@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_105941_346404_A2CF7E4A 
X-CRM114-Status: GOOD (  41.09  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============5342057608356198128=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5342057608356198128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wPn/chEO+X1eK+Gn"
Content-Disposition: inline


--wPn/chEO+X1eK+Gn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 05:48:51PM +0000, Andre Przywara wrote:
> On Wed, 31 Jan 2024 21:22:06 +0000
> Conor Dooley <conor@kernel.org> wrote:
>=20
> Hi,
>=20
> > On Wed, Jan 31, 2024 at 02:52:44PM +0000, Andre Przywara wrote:
> > > On Wed, 31 Jan 2024 15:59:14 +0300
> > > Aleksandr Shubin <privatesub2@gmail.com> wrote:
> > >=20
> > > Hi,
> > >  =20
> > > > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > > > controller witch is different from the previous pwm-sun4i.
> > > >=20
> > > > The D1 and T113 are identical in terms of peripherals,
> > > > they differ only in the architecture of the CPU core, and
> > > > even share the majority of their DT. Because of that,
> > > > using the same compatible makes sense.
> > > > The R329 is a different SoC though, and should have
> > > > a different compatible string added, especially as there
> > > > is a difference in the number of channels.
> > > >=20
> > > > D1 and T113s SoCs have one PWM controller with 8 channels.
> > > > R329 SoC has two PWM controllers in both power domains, one of
> > > > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> > > >=20
> > > > Add a device tree binding for them.
> > > >=20
> > > > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++=
++++
> > > >  1 file changed, 88 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner=
,sun20i-pwm.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i=
-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > > new file mode 100644
> > > > index 000000000000..716f75776006
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.ya=
ml
> > > > @@ -0,0 +1,88 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Allwinner D1, T113-S3 and R329 PWM
> > > > +
> > > > +maintainers:
> > > > +  - Aleksandr Shubin <privatesub2@gmail.com>
> > > > +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: allwinner,sun20i-d1-pwm
> > > > +      - items:
> > > > +          - const: allwinner,sun20i-r329-pwm
> > > > +          - const: allwinner,sun20i-d1-pwm
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#pwm-cells":
> > > > +    const: 3
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Bus clock
> > > > +      - description: 24 MHz oscillator
> > > > +      - description: APB0 clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: bus
> > > > +      - const: hosc
> > > > +      - const: apb0
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  allwinner,pwm-channels:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: The number of PWM channels configured for this in=
stance
> > > > +    enum: [6, 9]
> > > > +
> > > > +allOf:
> > > > +  - $ref: pwm.yaml#
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: allwinner,sun20i-r329-pwm
> > > > +
> > > > +    then:
> > > > +      required:
> > > > +        - allwinner,pwm-channels
> > > > +
> > > > +    else:
> > > > +      properties:
> > > > +        allwinner,pwm-channels: false =20
> > >=20
> > > Do we really need to be that strict?
> > > If something compatible to D1 pops up in the future, just with a diff=
erent
> > > number of channels, we would need a new compatible string. =20
> >=20
> > Well, you would want to have a soc specific compatible anyway then,
> > right?
>=20
> So the idea would be to add any new (specific) compatible string to that
> list then, when we add them?
> I guess this would work, but strictly speaking any current driver would
> then only need to check this property for the R329 type? The Linux
> driver proposed in the next patch *always* honours the
> allwinner,pwm-channels property, which is IMHO the right way to implement
> this. And that's why I think the binding should reflect that, and not
> explicitly *forbid* the property for every one other than R329 (atm).
>=20
> With the current Linux driver, a potential new SoC using:
> 	"allwinner,sun20i-d2-pwm", "allwinner,sun20i-d1-pwm";
> 	allwinner,pwm-channels =3D <6>;
> would work without driver changes. A driver strictly written to this
> binding here might not, though, as it would be free to ignore the
> pwm-channels property.
>=20
> Does that make sense? So to encourage future compatibility, can we drop
> the "else" branch?

Oh true, I see what you mean now with the example you gave. I wouldn't
respin for this alone, since the else branch could be dropped when
another user showed up given the driver doesn't restrict things.
I'm okay with your suggestion though.

Cheer,
Conor.

--wPn/chEO+X1eK+Gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbvqEgAKCRB4tDGHoIJi
0isTAQDdFIn8101DHoxqtxIzz2mXhQfAvSLN9IhSEoRLYtQYEQEA1ZfnLAFf02Qr
FQmM5dsp/NBIxR7GwMaSW1en5yD5pgw=
=tg0K
-----END PGP SIGNATURE-----

--wPn/chEO+X1eK+Gn--


--===============5342057608356198128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5342057608356198128==--


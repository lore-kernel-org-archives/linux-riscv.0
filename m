Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E65C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GObxxTFBEC46BxHN2dKdQf148jnYo3F0hUUlceiPJZg=; b=zahRtYq27Ypw7x6Eo88vNOgzp+
	L5EChogDG8tmP6y7Y2oZDuZKkIXDL96hzLVSDYi8SQxKIkFca3jukyLtnIY6XEsEfN5X9vszxzgbp
	HgnRetf82ToEgecsGcWI/4LLRHdPdS7PZHum+8KMA2fqX4Lq+JIvsfMN75NLEe0sdqAElIBUSjWot
	RRAJC47j4Brv3pMTEicHLGM2OixAPQ0c6rBZFavUkew8bt4AeKPMyuMKGnFz1w4LUw87HeBqvOe+N
	p0HzyQWVP2WhNtOaeczYLoJIxbSKChEpQuIL1lymGP3f+kHYCQgTsUgD4iz9Hgt/kPp6ta/iHfH2f
	yt7odyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVI2E-00000005VfP-1baa;
	Wed, 31 Jan 2024 21:22:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVI2A-00000005Vdl-3Zi5;
	Wed, 31 Jan 2024 21:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49F1F619F8;
	Wed, 31 Jan 2024 21:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AA4C433C7;
	Wed, 31 Jan 2024 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706736134;
	bh=6/S3gn/MU54WmcTkqkBqwpun43sj6keFl/lVKEDYooU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8x09sGYO00YuYlSGlkT2akkv0shyGx869qM0+Nclutea46M8UdJZb/sudyW+01w3
	 Jicz2TGobc8mmXGtUcRO676xFf5CxWOa+rr3tiHFrVxliKJSUjU+ESbv/my7hu12XJ
	 Epun7n4H9pPPOm3amIXwK03nbrD1z9rMwAk623ucM6/AByBA+sy8d26F4V+3Df6WT5
	 3JUZm7wUEB+1M9GEh6bTCy784yonSr1hbrTs7VC8MH/9c9eAYCULOtp9g3n7KSzZmL
	 OP6X8RZVQ3PJD+aolPH6o2ZuKmj1B0asR2j5rKV1NVyNASsT8UjvMjYRCpcD6aGRY3
	 Y1uZup2ac2gKQ==
Date: Wed, 31 Jan 2024 21:22:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20240131-renewably-glimpse-a80339e8ff81@spud>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
 <20240131125920.2879433-2-privatesub2@gmail.com>
 <20240131145244.4f534bac@donnerap.manchester.arm.com>
MIME-Version: 1.0
In-Reply-To: <20240131145244.4f534bac@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_132215_002866_C13BDBEF 
X-CRM114-Status: GOOD (  33.50  )
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
Content-Type: multipart/mixed; boundary="===============2375873087485063064=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2375873087485063064==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lXyhdNnqG2jz+p5F"
Content-Disposition: inline


--lXyhdNnqG2jz+p5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 02:52:44PM +0000, Andre Przywara wrote:
> On Wed, 31 Jan 2024 15:59:14 +0300
> Aleksandr Shubin <privatesub2@gmail.com> wrote:
>=20
> Hi,
>=20
> > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > controller witch is different from the previous pwm-sun4i.
> >=20
> > The D1 and T113 are identical in terms of peripherals,
> > they differ only in the architecture of the CPU core, and
> > even share the majority of their DT. Because of that,
> > using the same compatible makes sense.
> > The R329 is a different SoC though, and should have
> > a different compatible string added, especially as there
> > is a difference in the number of channels.
> >=20
> > D1 and T113s SoCs have one PWM controller with 8 channels.
> > R329 SoC has two PWM controllers in both power domains, one of
> > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> >=20
> > Add a device tree binding for them.
> >=20
> > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun=
20i-pwm.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm=
=2Eyaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > new file mode 100644
> > index 000000000000..716f75776006
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > @@ -0,0 +1,88 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner D1, T113-S3 and R329 PWM
> > +
> > +maintainers:
> > +  - Aleksandr Shubin <privatesub2@gmail.com>
> > +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: allwinner,sun20i-d1-pwm
> > +      - items:
> > +          - const: allwinner,sun20i-r329-pwm
> > +          - const: allwinner,sun20i-d1-pwm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus clock
> > +      - description: 24 MHz oscillator
> > +      - description: APB0 clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: hosc
> > +      - const: apb0
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  allwinner,pwm-channels:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The number of PWM channels configured for this instan=
ce
> > +    enum: [6, 9]
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun20i-r329-pwm
> > +
> > +    then:
> > +      required:
> > +        - allwinner,pwm-channels
> > +
> > +    else:
> > +      properties:
> > +        allwinner,pwm-channels: false
>=20
> Do we really need to be that strict?
> If something compatible to D1 pops up in the future, just with a different
> number of channels, we would need a new compatible string.

Well, you would want to have a soc specific compatible anyway then,
right?

> If we would leave this else branch out, we could just specify some
> number differing from the default, and be good.

If it were compatible with the d1, then the "then:" branch would apply,
provided you used the fallback correctly. Although if the number of
channels were different, we'd likely end up with modifications here to
limit it to the correct values for each soc.

Cheers,
Conor.

> The number of channels really looks like a parameter to the IP, it's
> modelled like this in the manual (PCR: 0x0100 + 0x0000 + N * 0x0020).

--lXyhdNnqG2jz+p5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbq5/gAKCRB4tDGHoIJi
0m7lAQDMB3FXHeE2sd+nUCjULoFP3QBAMejcAL5DVTHwwcfoCwEAmITUfiKctPUZ
aRVAUnCJ7PvSkH3019Ou5tyacXCp1gY=
=b0st
-----END PGP SIGNATURE-----

--lXyhdNnqG2jz+p5F--


--===============2375873087485063064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2375873087485063064==--


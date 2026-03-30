Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743CD1061B0F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lveZv+A/D9r1Mh71bBP8vvh1n2TR3GSkdRsPDX1s6k=; b=scNl9kl7dIKUoXCKGIP4elmmVv
	IXlBSr5hSbvf0Vnb11dFCVovVsYx9uagw+hsCnDRD0cNlO0D6ZsoqDOGmsK6Xi0P1kIxPofWK5RW+
	nkRClrvMBWA3hdQUxWqHV4igot+uIBj9aSG6H6kTfwA/Uk2etSFi2Bl//kZG1iI6S+mYF50PWigR2
	GEKPySiqytjUULsqUfaH3+55Q9qipos6TMLhGlhfCyqZ8p42JuXKgQl7ifv20uqMUunA3ubDs7xw+
	19TDxFVLAgV7Mc7QZaMSUD8XwmKJ4XsW0dA9uYi6lPPrL3i7CPTnF8yqNyRHLkaUa2Sz7ktJHL0im
	ogNHrlhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FHq-0000000Bd4R-1OzS;
	Mon, 30 Mar 2026 16:16:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FHo-0000000Bd4I-3D2y
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 16:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 925E8600CB;
	Mon, 30 Mar 2026 16:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3848C4CEF7;
	Mon, 30 Mar 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774887378;
	bh=RNuQc1FXJX0gJoQdRCwM4KulnZVJtsA3YzsnFaTWbis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlOfYQHGvmyl+YASSPWeBu0+faicc1SdY23zADSiBarF8FLIkq/3nvTAfzS6RMqA/
	 UNO6MK+76XjCh353k+DyDZiUSDbIdpZJO1NKn2BehuNr7ndrDL1GwG06N+iyU25zBi
	 sbA04h0rmNiS18tfAFCGaelOPfdg6gqLZuwQ2fFYMEhjp20yVKlF+9p7cRPlHSe6kJ
	 Amr3FaucncVV4iaMMlWg91Itd+GRDVf+S5Adi7hgKpEC42PhhzmUeP5HQMhq5UnR6K
	 SKE3FdVZmPmKwXd4Ygar15vG3DXagjguCYgddHTQSUGwNddXcswSW5YMqKs3F28d8x
	 LJgKh3ZTkiTbw==
Date: Mon, 30 Mar 2026 17:16:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Perry <charles.perry@microchip.com>
Cc: Nick Hu <nick.hu@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20260330-relative-hardened-5ce35fe1ef57@spud>
References: <20250321083507.25298-1-nick.hu@sifive.com>
 <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
MIME-Version: 1.0
In-Reply-To: <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
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
Content-Type: multipart/mixed; boundary="===============6170223388355069510=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6170223388355069510==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4xEBCRS2Ch7EH1t"
Content-Disposition: inline


--j4xEBCRS2Ch7EH1t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 01:55:38PM -0700, Charles Perry wrote:
> On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> > Add compatible string and property for the SiFive CLINT v2. The SiFive
> > CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> > in their control methods.
>=20
> Hello Nick,
>=20
> Can you help me understand what is this different control method? I've
> found that both OpenSBI [1] and U-Boot [2] use the same match data in the=
ir
> clint driver which would indicate that they are compatible.

Hmm, good point. I didn't see that the drivers were not doing anything
different. I guess really the clintv2 should fall back to the clintv0,
and the difference in hardware should be elaborated on.

I think I also dropped the ball on sifive,fine-ctr-bits, and that should
be removed and the counter width determined from the compatible.
There's no users for that yet I think, and there's no valid users of the
clintv2 compatible /at all/ so maybe it can just get culled.

>=20
> Also, do you know if there's an easy way to tell if a sifive clint is a v0
> or v2?
>=20
> Thanks,
> Charles
>=20
> [1]: https://elixir.bootlin.com/opensbi/v1.8.1/source/lib/utils/timer/fdt=
_timer_mtimer.c#L163
> [2]: https://elixir.bootlin.com/u-boot/v2026.01/source/drivers/timer/risc=
v_aclint_timer.c#L86
>=20
> >=20
> > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > ---
> > - v3 changes:
> >   - Add the reason for the incompatibility between sifive,clint2 and
> >     sifive,clint0.
> > - v2 changes:
> >   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
> >   - Mark the sifive,fine-ctr-bits as the required property when
> >     the compatible includes the sifive,clint2
> >=20
> >  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml =
b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index 76d83aea4e2b..34684cda8b15 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -36,6 +36,12 @@ properties:
> >                - starfive,jh7110-clint   # StarFive JH7110
> >                - starfive,jh8100-clint   # StarFive JH8100
> >            - const: sifive,clint0        # SiFive CLINT v0 IP block
> > +      - items:
> > +          - {}
> > +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> > +        description:
> > +          SiFive CLINT v2 is the HRT that supports the Zicntr. The con=
trol of sifive,clint2
> > +          differs from that of sifive,clint0, making them incompatible.
> >        - items:
> >            - enum:
> >                - allwinner,sun20i-d1-clint
> > @@ -62,6 +68,22 @@ properties:
> >      minItems: 1
> >      maxItems: 4095
> > =20
> > +  sifive,fine-ctr-bits:
> > +    maximum: 15
> > +    description: The width in bits of the fine counter.
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: sifive,clint2
> > +then:
> > +  required:
> > +    - sifive,fine-ctr-bits
> > +else:
> > +  properties:
> > +    sifive,fine-ctr-bits: false
> > +
> >  additionalProperties: false
> > =20
> >  required:
> > --=20
> > 2.17.1
> >=20
> >=20

--j4xEBCRS2Ch7EH1t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqhzQAKCRB4tDGHoIJi
0pKhAQCapYKXxoh7wLs86sKi36P+NYNvUj+JVTLeJMg/NjRWRQD/beEA2e9dqea5
uOIwS0m2yYSUNtMrp2iaJ77+8nu8Kww=
=jl1X
-----END PGP SIGNATURE-----

--j4xEBCRS2Ch7EH1t--


--===============6170223388355069510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6170223388355069510==--


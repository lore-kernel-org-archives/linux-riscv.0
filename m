Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563CEC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF2SH4gmARbiX8smTlFRjsHbiUMxjK9FWF9OwYBrRCg=; b=hSIepgvrZTGpm48gTMl0duXLEj
	oyQ73Uahz37wfrBeV5zYzhCyrs4/7BuuiNI6o/D0r9HVINWL6yAm5uflPxUF6TXIW9fWNRkDNK9tQ
	KHa5Olv0I/tO0Qsu7b+7wdXEfMxozPHLvXtqufUeifMze+3uWxpJQW12uzdWJqMB0QorKWYWkkekf
	5xrV4IE/j4uhwRGrz3Abij8EMScfVY4j+VRiX4xMtZBOTtFjEo4U1Oem9O31+bawPU5LLkSUkC5KK
	mj+JLOoNIWN8SAAK3J09FvqXHT3XdMcF2lH+58P3YEenMsVDiNgD9gB0l5gLpVpPfnjbUHrkvROMN
	5AE9/TGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsr9z-0000000Cd5u-0Vc0;
	Thu, 13 Mar 2025 22:36:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsr7y-0000000CcpM-0iHn
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 22:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7643C5C5A79;
	Thu, 13 Mar 2025 22:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C15C4CEDD;
	Thu, 13 Mar 2025 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741905249;
	bh=OH8SKV3EpGTINOyp0l73k/e/saWtSYUO8XFQ+5bYqKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDrxNl7TfU3zY5HAqFwmGLsa5buw1ltxtr8qA+s3P5xsOUe5ymPLy4o9pCQTwx+nX
	 SF15AFE2kAq2hn62gwhQeGT8CVN1w3oRA3s3DOpk94feJKHx1YLw7HjfrYk823I07H
	 SQJhYFgkJkvXEaIMZyw2HQyDDaa1B7IN1S20AEC3HN28s7tY/quRoDhAQ6cEKhqPQC
	 crTeXyu4i0dyQ7VkpFyYOleqNgLrHZ1WP6WYWKVocuAGQY1a3GUnkZZf4sotCpYGie
	 PuMT4PcEbJzJAXf5W/LFwDfl4xCMIaQ+slWOdW1nHcWgtsKWIJ44iOxequfURRe+yM
	 I6SCV2Ywlnl8w==
Date: Thu, 13 Mar 2025 22:34:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Rob Herring <robh@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20250313-kimono-passport-496a312a849c@spud>
References: <20250311051903.3825-1-nick.hu@sifive.com>
 <20250311195953.GA14239-robh@kernel.org>
 <20250311-erasure-rival-f68525c21742@spud>
 <CAKddAkBwkVQS7UtVvXCdLxEz6bz1=_X1u1CGUPm-OHiyAD4Dsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKddAkBwkVQS7UtVvXCdLxEz6bz1=_X1u1CGUPm-OHiyAD4Dsw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_153410_295374_8ABB4E61 
X-CRM114-Status: GOOD (  31.07  )
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
Content-Type: multipart/mixed; boundary="===============9048510948896111546=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9048510948896111546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IrKm9n+XjpE4JIEJ"
Content-Disposition: inline


--IrKm9n+XjpE4JIEJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 03:58:05PM +0800, Nick Hu wrote:
> Hi Rob and Conor
>=20
> Thanks to all your feedback.
>=20
> On Wed, Mar 12, 2025 at 4:46=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Mar 11, 2025 at 02:59:53PM -0500, Rob Herring wrote:
> > > On Tue, Mar 11, 2025 at 01:19:03PM +0800, Nick Hu wrote:
> > > > Add compatible string and property for the SiFive CLINT v2.
> > > >
> > > > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > > > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > > > ---
> > > >  .../bindings/timer/sifive,clint.yaml          | 19 +++++++++++++++=
++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.y=
aml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > > index 76d83aea4e2b..93d74c504b5f 100644
> > > > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > > > @@ -36,6 +36,9 @@ properties:
> > > >                - starfive,jh7110-clint   # StarFive JH7110
> > > >                - starfive,jh8100-clint   # StarFive JH8100
> > > >            - const: sifive,clint0        # SiFive CLINT v0 IP block
> > >
> > > Notice that we don't allow clint0 by itself. We shouldn't start now.
> > >
> > > > +      - items:
> > >
> > > If you don't have a specific one yet, then add '- {}' for the first
> > > entry.
> > >
> Do you suggest something like the following?
>      - items:
>           - {}
>           - const: sifive,clint2        # SiFive CLINT v2 IP block
>         description: SiFive CLINT v2 is the HRT that supports the Zicntr
>=20
> > > > +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> > > > +        description: SiFive CLINT v2 is the HRT that supports the =
Zicntr
> > > >        - items:
> > > >            - enum:
> > > >                - allwinner,sun20i-d1-clint
> > > > @@ -62,6 +65,22 @@ properties:
> > > >      minItems: 1
> > > >      maxItems: 4095
> > > >
> > > > +  sifive,fine-ctr-bits:
> > > > +    description: The width in bits of the fine counter.
> > >
> > > maximum: 15
> > >
> > > Unless you know of a different maximum in which case why aren't you
> > > documenting that too?
> >
> You are right. It's my bad. The maximum width should always be 15 in
> sifive,clint2.
> I should update to:
>  sifive,fine-ctr-bits:
>     maximum: 15
>     description: The width in bits of the fine counter.
>=20
> if:
>   not:
>     properties:
>       compatible:
>         contains:
>           const: sifive,clint2
> then:
>   properties:
>     sifive,fine-ctr-bits: false

I think this should be inverted, to

if: properties: compatible: contains: const: sifive,clint2
then: required: - sifive,fine-counter-bits
else: sifive,fine-counter-bits: false

since the property has no default.

>=20
> > I'm curious why this is not something that can be discerned from the
> > compatible. It's max 15, but are there actually versions of this with a
> > less-than-15-bit width?
> >
> The width may be various on different platforms so it is possible to
> have a less-than-15-bit width.
>=20
> > >
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        const: sifive,clint2
> > > > +then:
> > > > +  properties:
> > > > +    sifive,fine-ctr-bits:
> > > > +      maximum: 15
> > > > +else:
> > > > +  properties:
> > > > +    sifive,fine-ctr-bits: false
> > > > +
> > > >  additionalProperties: false
> > > >
> > > >  required:
> > > > --
> > > > 2.17.1
> > > >
>=20
> Best Regards,
> Nick

--IrKm9n+XjpE4JIEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9NdXAAKCRB4tDGHoIJi
0g0uAPsEXt5V5cLEAAhBAZ5l7d6lhyvuUe5XiNi2ELaP0v6OPgEAzVJEkH+aXiak
nA/2l4YbUtpVYVh1j3dDZcrVq4FM4wE=
=SkWm
-----END PGP SIGNATURE-----

--IrKm9n+XjpE4JIEJ--


--===============9048510948896111546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9048510948896111546==--


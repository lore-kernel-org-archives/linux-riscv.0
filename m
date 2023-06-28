Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A356EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGUEZwmwIiVlCp9KJGtVB0uCSNr0fALrJpda+k+OuXg=; b=24ecZpMpm40Fx9ULvlI8aQKCsu
	7tXMwZnIzoTRsJeFlUijyo2GUJHC/sk1nhhXqB12MC68B1GQg/TYoxyzXPdJEIBR/MerCB+fytMLf
	yBg6jgxavf63VWpuBJByCV1QYNQj1paH1eDzIC5fCqR6haPsyG7x0U0YtzvWgBt/q7Wgf18bZBFuw
	/+uzB6DULdtL3NWJmbbYNF+6VJ15aPXHVm0gxk9GsSYUQZ1tCVbDSZdSjJSD14pPmEWHXFJmKyfHa
	x0orbtQ0WPp9MNiE1iCyCgq86HHBfvHCv7DFHEFat1/ir7q9+6TiUAMe+mE15n7SuNGpTdmIh4SGN
	uKTFTSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZ3V-00GIQo-2b;
	Wed, 28 Jun 2023 17:34:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZ3S-00GIQ7-13
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:34:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7CE26142F;
	Wed, 28 Jun 2023 17:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C965AC433C8;
	Wed, 28 Jun 2023 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687973649;
	bh=eQUSJ/UXw38WGA2n3EfRxEikZsIX5IenbbmsGSo1lQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noXT1R3GKk3Jb9Gw5xjR3GpKL3bo+mbyIHCFpq+y1u+gZj0HJJ0eJ/1bQ3Wmad95y
	 4G3MeZHex8pxEL+9c1iZL1SwFIHnAPllP577+nXiPRn/+Od7mAxiu5t5InRTmF4XAj
	 8TX3zZBTZZEonD87BKoBdUaY1QYEVrvI3CErSL9Kk6b0v/NjDFzXuGQh0biCPr6x0l
	 mfhoIxpp7D30HQFKpffAo5eRYV9LoNSZfi8rDNdeI3GLHiLGuQx9A0b3JXbNKsoskR
	 4d0OvqDspl5NWfw6y+XWDb211neWEdPyiswiZws6/2GgLo4tlgO8szncmha1k+XJwC
	 ESMlIW8u9yWMQ==
Date: Wed, 28 Jun 2023 18:34:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230628-affix-maverick-84a08905f05b@spud>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-3-xingyu.wu@starfivetech.com>
 <7e2d6bfe-5687-97c5-778b-c02e9c0894af@linaro.org>
 <a83c98ae-2f6c-00c4-5d05-fc304718e05a@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <a83c98ae-2f6c-00c4-5d05-fc304718e05a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_103410_446291_A2D712EA 
X-CRM114-Status: GOOD (  32.26  )
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
Content-Type: multipart/mixed; boundary="===============2853549801402623490=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2853549801402623490==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWsCuXQtkR2oS87D"
Content-Disposition: inline


--OWsCuXQtkR2oS87D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 02:44:10PM +0800, Xingyu Wu wrote:
> On 2023/6/14 2:31, Krzysztof Kozlowski wrote:
> > On 13/06/2023 14:58, Xingyu Wu wrote:
> >> From: William Qiu <william.qiu@starfivetech.com>
> >>=20
> >> Add documentation to describe StarFive System Controller Registers.
> >>=20
> >> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> ---
> >>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 62 +++++++++++++++++++
> >>  MAINTAINERS                                   |  7 +++
> >>  2 files changed, 69 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/sta=
rfive,jh7110-syscon.yaml
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,j=
h7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive=
,jh7110-syscon.yaml
> >> new file mode 100644
> >> index 000000000000..a81190f8a54d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-s=
yscon.yaml
> >> @@ -0,0 +1,62 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-sysco=
n.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive JH7110 SoC system controller
> >> +
> >> +maintainers:
> >> +  - William Qiu <william.qiu@starfivetech.com>
> >> +
> >> +description: |
> >> +  The StarFive JH7110 SoC system controller provides register informa=
tion such
> >> +  as offset, mask and shift to configure related modules such as MMC =
and PCIe.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: starfive,jh7110-sys-syscon
> >> +          - const: syscon
> >> +          - const: simple-mfd
> >> +      - items:
> >> +          - enum:
> >> +              - starfive,jh7110-aon-syscon
> >> +              - starfive,jh7110-stg-syscon
> >> +          - const: syscon
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clock-controller:
> >> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> >> +    type: object
> >> +
> >> +  "#power-domain-cells":
> >> +    const: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: starfive,jh7110-aon-syscon
> >> +    then:
> >> +      required:
> >> +        - "#power-domain-cells"
> >=20
> > Where did you implement the results of the discussion that only some
> > devices can have power and clock controller?
> >=20
> > According to your code all of above - sys, aon and stg - have clock and
> > power controllers. If not, then the code is not correct, so please do
> > not respond with what is where (like you did last time) but actually
> > implement what you say.
> >=20
>=20
> Hi Krzysztof, I need to modify the code to implement it.
> If I drop the 'clock-controller' and '"#power-domain-cells"' in properite=
s, and change to this:
>=20
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> @@ -29,28 +29,33 @@ properties:
>    reg:
>      maxItems: 1
> =20
> -  clock-controller:
> -    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> -    type: object
> -
> -  "#power-domain-cells":
> -    const: 1
> -
>  required:
>    - compatible
>    - reg
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-sys-syscon
> +    then:
> +      properties:
> +        clock-controller:
> +          $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +          type: object

Why do this?
Why not define the property has you have been doing, but only allow it
on the syscons that support it?
See the section starting at L205 of example-schema.yaml.

> +
>    - if:
>        properties:
>          compatible:
>            contains:
>              const: starfive,jh7110-aon-syscon
>      then:
> -      required:
> -        - "#power-domain-cells"
> +      properties:
> +        "#power-domain-cells":
> +          const: 1
> =20

> -additionalProperties: false
> +additionalProperties: true

Why do you need this?
Allowing "additionalProperties: true" sounds like you've got some prblem
that you are trying to hide...

> Would it be better to show that sys-syscon only has clock-controller and =
aon-syscon is power controller?

You should only permit the properties where they are valid, yes.

Cheers,
Conor.


--OWsCuXQtkR2oS87D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJxvCwAKCRB4tDGHoIJi
0tjQAP9pADun+GqeVqOgv5jm6U4HG5PohwpeIYYvSjn0hhv2RwD/f1ncpULXC5ZJ
fMsTacgJ5ATCXknFjmdw+LoxZKge5Qg=
=b8dO
-----END PGP SIGNATURE-----

--OWsCuXQtkR2oS87D--


--===============2853549801402623490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2853549801402623490==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70044C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAdQ8PDG8vPqno8O319YZHN9CQ+OPNB87/XS1QKR/sA=; b=4LtZtHMdyqtRt+AFrVu+P6B6Ko
	VPyxCTRMG7eihvYLLpwQlZwW1ikrpxmaKsAZOmRWm3/EEp2ShDLFuWVeYzg6RaobiFfmeGTbR1hCX
	YlAS1UjIHo+9dbUN7GoEspx2C7gu8RoT3Vm2dCUQ+UD8KZbbJ0HmelzzGCS0aIYuowcVdeoyQYIQe
	eEz9FHOfKUpvr1yJCMmzNZsbxtgtU5YVUOq6HZ2ddbe+SfxpEShxqJyke9wcgZrE+KW2mtGD8GS8s
	63W4A1EcA2ruTOlg7XSq03VzWCTijXRMwZcsq0hQCo9BTHDB/F0+LD/pJ32GKtFI+qx90oCh4cMmN
	TvRfkigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUVT1-0000000Djle-2F45;
	Mon, 29 Jan 2024 17:30:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUVSv-0000000Djjp-1GTX
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 17:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAEBA622BF;
	Mon, 29 Jan 2024 17:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E4CC433C7;
	Mon, 29 Jan 2024 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706549436;
	bh=OXQd1RnjO7UJeTnd9b35uKkSkUJf85ceg9kIDyszIk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+K69jKWZIF69OHl7PMAE41J0uqd1KVWsmsLishPqiVhnQXmGHaePGHbFCGBWgtDD
	 833c7oemkGkJ7LfpHyexjIZnfGU0Vi+PWWnI5YUWXbZFvOtRalWswI1jfLu4rjdSgu
	 MKoK5Jb7qx+divI6WtIGPx+HXtAm5mNGWi76TRKXD6ppuDCZF+9rNGt756SwvJa8iq
	 4VihGKgCQ/HeC700lCi7aVVw7ggiZVLsM+c0o6uXdcBp4Q1Cq1TMfg6Or0rd7fvQdf
	 WUQptqLE3iI4BMV63lNP9SahrI6VOONxYXfSFvWQrJEyA3aKs6EkrE10vJVDmwkeeE
	 GHa19xQe2PbLg==
Date: Mon, 29 Jan 2024 17:30:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
Message-ID: <20240129-magical-unclaimed-e725e2491ccb@spud>
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_093037_478626_AEDE50EE 
X-CRM114-Status: GOOD (  18.05  )
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
Content-Type: multipart/mixed; boundary="===============8148271016885699490=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8148271016885699490==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ygn/mpQIjskR0FcW"
Content-Disposition: inline


--Ygn/mpQIjskR0FcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 03:16:14PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document RZ/Five (R9A07G043F) IRQC bindings. The IRQC block on RZ/Five SoC
> is almost identical to one found on the RZ/G2L SoC with below differences,
> * Additional BUS error interrupt
> * Additional ECCRAM error interrupt
> * Has additional mask control registers for NMI/IRQ/TINT
>=20
> Hence new compatible string "renesas,r9a07g043f-irqc" is added for RZ/Five
> SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renes=
as,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/renesas,rzg2l-irqc.yaml
> index d3b5aec0a3f7..3abc01e48934 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2=
l-irqc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2=
l-irqc.yaml
> @@ -23,6 +23,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a07g043f-irqc   # RZ/Five
>            - renesas,r9a07g043u-irqc   # RZ/G2UL
>            - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
>            - renesas,r9a07g054-irqc    # RZ/V2L
> @@ -88,6 +89,12 @@ properties:
>        - description: GPIO interrupt, TINT30
>        - description: GPIO interrupt, TINT31
>        - description: Bus error interrupt
> +      - description: ECCRAM0 TIE1 interrupt
> +      - description: ECCRAM0 TIE2 interrupt
> +      - description: ECCRAM0 overflow interrupt
> +      - description: ECCRAM1 TIE1 interrupt
> +      - description: ECCRAM1 TIE2 interrupt
> +      - description: ECCRAM1 overflow interrupt
> =20
>    interrupt-names:
>      minItems: 41
> @@ -134,6 +141,12 @@ properties:
>        - const: tint30
>        - const: tint31
>        - const: bus-err
> +      - const: eccram0-tie1
> +      - const: eccram0-tie2
> +      - const: eccram0-ovf
> +      - const: eccram1-tie1
> +      - const: eccram1-tie2
> +      - const: eccram1-ovf

I think the restrictions already in the file become incorrect with this
patch:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - renesas,r9a07g043u-irqc
              - renesas,r9a08g045-irqc
    then:
      properties:
        interrupts:
          minItems: 42
        interrupt-names:
          minItems: 42
      required:
        - interrupt-names

This used to require all 42 interrupts for the two compatibles here
and at least the first 41 otherwise. Now you've increased the number of
interrupts to 48 thereby removing the upper limits on the existing
devices.

Given the commit message, I figure that providing 48 interrupts for
(at least some of) those devices would be incorrect?

Cheers,
Conor.

> =20
>    clocks:
>      maxItems: 2
> @@ -180,6 +193,20 @@ allOf:
>        required:
>          - interrupt-names
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043f-irqc
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 48
> +        interrupt-names:
> +          minItems: 48
> +      required:
> +        - interrupt-names
> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.34.1
>=20

--Ygn/mpQIjskR0FcW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfgtgAKCRB4tDGHoIJi
0oqzAQDRsNsMgRYlDd+DmTlEOCZC0GxDFYdGkW9k02+U2C2kUAD/Q+SgbLDfDyC8
+6lTLc/HCbiewN8LWm/xBVSaQNYbWwk=
=5vqQ
-----END PGP SIGNATURE-----

--Ygn/mpQIjskR0FcW--


--===============8148271016885699490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8148271016885699490==--


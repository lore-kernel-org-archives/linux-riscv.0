Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9331F31E31
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2Ch/4aJJeYpQlS19FsAGpnoh46OOZl1xnYU4js1wUo=; b=rgY5AUJ0Llz3nnVaLoPI/0ya4V
	bx0BSbqAuVtVsLXf4yUvi9om1mPhoRmL05jqEjfqnPnyhXZ6kskcDwFEENAUKywnhQNgIwrmSAaYs
	HjcbtVH0T9OLvKJW9sT1UTMRn4G4/kHxBUxTDiwEh7hpiqADSvBIqw6H9bIUyJtVsbhpBx9yccdDB
	gb3px/FRxote1WauKLECAexMZPTWeusxgKlDq5/sFPboISZwtdYRRL+e8mVjcc+sN+VgLK1HHQJBL
	0VhCa+p2hz4HWOPGEfiu5TNMNkzOjU+v4ajxY7a/pMJ6zTxoqAOMJ4EjHFqmO08eHdeQeeeJe0O/H
	pgFv61eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArVw-0000000Aoej-3J3Z;
	Thu, 09 Apr 2026 15:41:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArVu-0000000AoeB-1qo7
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 15:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8DCB4189C;
	Thu,  9 Apr 2026 15:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEF9C4CEF7;
	Thu,  9 Apr 2026 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775749309;
	bh=osskFND0gD7NhmG8a1qgihTn2NK1itGDCwQVH1cu8EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPF2pvnr2fSjiJLAMO6Bh4704uS8IM2kd4jIdmqJh9Kp3mr8aIgS9maEMa8S/y78v
	 LH7IIjy3xqgecHDnFGGUBj5+8PdSyfnTJvpQnVPN0Yqab+yKL4ViF/ouT35Mnv2jDS
	 5G5shg0YpHicJ2REZOgP7eWyN65ODI2QFSzA9/UqGx0UP6XL3S3Aix4UM/JbUR0Ya9
	 V/xFtEYPlTi/gjz9++HViNAHO7mkBxGDfCqr1Wezl8ooJcvEZpPlCP0TCT0UkJQ9S+
	 8wxkIcx0c/Ddt48BXco7b+FNdDtY5H7/7/FDtPBANKFLGu97Y7cUjN34VCWpdXQ9QT
	 AWYXRwY8V2TBw==
Date: Thu, 9 Apr 2026 16:41:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K3
 PWM support
Message-ID: <20260409-laboring-announcer-4a0f9ca152a1@spud>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
 <20260409-03-k3-pwm-drv-v1-1-1307a06fba38@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260409-03-k3-pwm-drv-v1-1-1307a06fba38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084150_541746_B7B1F7CF 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: multipart/mixed; boundary="===============5941979037020000756=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5941979037020000756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5LSQ/VAQK69bVtgG"
Content-Disposition: inline


--5LSQ/VAQK69bVtgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 12:45:11AM +0000, Yixun Lan wrote:
> The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
> generation, while the difference is that one additional bus clock is
> added.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml   | 53 ++++++++++++++++=
++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> index 8df327e52810..3427c8ef3945 100644
> --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> @@ -15,7 +15,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: spacemit,k1-pwm
> +            enum:
> +              - spacemit,k1-pwm
> +              - spacemit,k3-pwm
>      then:
>        properties:
>          "#pwm-cells":
> @@ -26,6 +28,38 @@ allOf:
>            const: 1
>            description: |
>              Used for specifying the period length in nanoseconds.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - spacemit,k3-pwm
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: func
> +            - const: bus

This condition here doesn't appear to do anything? It just repeats
what's already done unconditonally below?

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - spacemit,k3-pwm
> +    then:
> +      required:
> +        - clock-names
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> =20
>  properties:
>    compatible:
> @@ -36,7 +70,9 @@ properties:
>            - marvell,pxa168-pwm
>            - marvell,pxa910-pwm
>        - items:
> -          - const: spacemit,k1-pwm
> +          - enum:
> +              - spacemit,k1-pwm
> +              - spacemit,k3-pwm
>            - const: marvell,pxa910-pwm
> =20
>    reg:
> @@ -47,7 +83,18 @@ properties:
>      description: Number of cells in a pwm specifier.
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: The function clock
> +      - description: An optional bus clock
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    oneOf:
> +      - items:
> +          - const: func
> +          - const: bus
> =20
>    resets:
>      maxItems: 1
>=20
> --=20
> 2.53.0
>=20

--5LSQ/VAQK69bVtgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadfIuQAKCRB4tDGHoIJi
0vTwAQD8Zicv16Y94gH/9FvNtIYLGGbQLZjiTxnKjtWIjHV5kAEAkqvgTcnemFRq
wbBFrWGiCKv5Hfvy64V1KtjG8qjk+AE=
=qWVE
-----END PGP SIGNATURE-----

--5LSQ/VAQK69bVtgG--


--===============5941979037020000756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5941979037020000756==--


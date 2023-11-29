Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695E8C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xWuqeXzlzc6ZELKzyFf8MV//cmV9RGaQx85sgoTvRo=; b=nj7/PKabHYLuIXTE7IkA8xbu2H
	y0lAl+7u2hHWH2vntEfn3gDfjBORWwMEoCjthWZ1It5WcVth2MKN4SX44e5RUmUzNTdhwCHDuyj6a
	ZUKuMhBW93UKfMZBuNlP6zFo9o2rUE4+iCdf2U76DEtPL1luUfOLuCgO1n8yuYNPvDqO+zNnDCT1o
	zuDRkYDy+trB4CrO70DSpmj/u0jpVXHwF2mqZKvdzLAV7bu4oGA0nApu8Q8g+MMONVc3WHkOizn1Y
	neOTKYsVWo4YPv8nIMH7JgvkjzHknER3Q4rjRz0aS/I4LPLMMQWGyIppfQMM+usyCslDo9Qnbc5zD
	i7gf/JjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lcn-008dGH-0u;
	Wed, 29 Nov 2023 14:33:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lck-008dFR-2M
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 496D4B83D3B;
	Wed, 29 Nov 2023 14:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8878EC433C8;
	Wed, 29 Nov 2023 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701268388;
	bh=nCUBip91VJPgVyaRslm47tg3WMaKjh0DptQ7V1+aaG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKvcWnywP2uOCwGWoh/fP1tY3br+768+t7iK5/AZ4GIT9leS8LhJRzql7QKALNfgu
	 RpMq1oALiCXCTkejzxvkSrRJQOXq0zFSK4VPIaje+KdTwntmUubIdIAUb/nRPVyo0p
	 8QPYGbx3Q5TSc5ADZ2ylf2mOuQ3hP5EeFXfdpAhA+U/fQlrZ4RYWTt1J+DUrdXGBjT
	 w5OwbXD+MRpy5MgC4KnKWrnbkW1p8+XXefb+Jc+qpKSB5yO5dFUAyDWV7tw2Jj/Gym
	 +uQOWJuzDC9xhl8mCQEMU4yyTZSKba4BLEC86SIpz2m2yjOv1UtByqawi80aBojCUa
	 tOM1QGWgSP2Cw==
Date: Wed, 29 Nov 2023 14:33:03 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v8 1/4] dt-bindings: pwm: Add bindings for OpenCores PWM
 Controller
Message-ID: <20231129-chaplain-unseeing-e433ec830946@spud>
References: <20231129092732.43387-1-william.qiu@starfivetech.com>
 <20231129092732.43387-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231129092732.43387-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_063311_059459_D7BB8730 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Type: multipart/mixed; boundary="===============1635859005840703999=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1635859005840703999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sVewkJ1jWgEyqNJ1"
Content-Disposition: inline


--sVewkJ1jWgEyqNJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 05:27:29PM +0800, William Qiu wrote:
> Add bindings for OpenCores PWM Controller.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/pwm/opencores,pwm.yaml           | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> new file mode 100644
> index 000000000000..133f2cd417f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/opencores,pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenCores PWM controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description:
> +  OpenCores PTC ip core contains a PWM controller. When operating in PWM=
 mode,

nit: "The OpenCores PTC IP core"

> +  the PTC core generates binary signal with user-programmable low and hi=
gh
> +  periods. All PTC counters and registers are 32-bit.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jh7100-pwm
> +              - starfive,jh7110-pwm
> +          - const: opencores,pwm-v1

properties:
  compatible:
    items:
      - enum:
          - starfive,jh7100-pwm
          - starfive,jh7110-pwm
      - const: opencores,pwm-v1

Please use this form here instead.

Otherwise, this looks good to me now.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm@12490000 {
> +        compatible =3D "starfive,jh7110-pwm", "opencores,pwm-v1";
> +        reg =3D <0x12490000 0x10000>;
> +        clocks =3D <&clkgen 181>;
> +        resets =3D <&rstgen 109>;
> +        #pwm-cells =3D <3>;
> +    };
> --=20
> 2.34.1
>=20
>=20

--sVewkJ1jWgEyqNJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdLnwAKCRB4tDGHoIJi
0vPNAP4lxb47TExjCroRAbRfe1Mqkn9kvWfUqdQghEp5AktsygD/V4IHEgg4y71a
Q6fQO+IQS9o36EIZJ2aOmiys/FLW0gw=
=TUhN
-----END PGP SIGNATURE-----

--sVewkJ1jWgEyqNJ1--


--===============1635859005840703999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1635859005840703999==--


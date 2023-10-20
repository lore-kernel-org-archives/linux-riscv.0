Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2214CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ndLbSNT2dbJmBcw3Q3H8g2ggUmrIViXRay0XGTqZo4=; b=dp7WdqFhQYZWKn6DkR5e4FNtoN
	np2Ne7uSY+JAuVzNARWyUZk/ZHGTCYozCRdGqH7zNPy4BspreNiZqjsshXvmv0Qb6tg+yCwMubZ68
	E9nh7WxnWh1ay1wOjYLrfDiSsPu6sdjNPGsqKbxGMnsj1fmxrDDqP5NR+Son5V64+kjTukAdQJE3O
	S53u17/c44HGUiJJv1y7ZuKZ2IhG+MtUnwyoDBdbgBsyj2YEHEFdXqlxCnjUENlDOUqIT3GSaSdD8
	AEPrP+Q/BiI5mKl2bUjMJpJu3OAyi5gKoMjmb5AY3QTfOyn0Ws+FJeF6oqPxCb1ka5mW2g7z1X2TJ
	yRpRqKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqNS-002ThQ-0z;
	Fri, 20 Oct 2023 14:21:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqNP-002TgI-18
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 14:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5948ACE388B;
	Fri, 20 Oct 2023 14:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFABC433C7;
	Fri, 20 Oct 2023 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697811680;
	bh=Sec4O0KSkSkahb8ChGos0WpVoRI0WMt1czHDEPGpGl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fk1B4SIJRfOw6CSnTzkzYMkE/x3c54CLHy1M83x5hJJ5ZfslOTX1kXRRSOvLHJQO/
	 jgxu4wkEJu8lU78QW8/QNbFbw22eIloRiTiDupXbkJlfTI+gwvMd7D51AiTgkTtCId
	 7jL9cNcC6jSDWDo+yYAqx2NoQMC89OpGL997DufNCox/0GYQvcSKpMPSlwg2UT09gw
	 +4pY6+5LfIZGrvRhMmQvOi1xE68es+XFGsnAW/ZD9w6QVtR6lXqj4QTQnCQL6JLUhu
	 Zr+ftbCPS/R7MTC+bCcIdefvZk2xc0SBSAU2M2sajUZEfOGjNOKn0uj7j1ZJA2xtGa
	 QHmEnqWalNKTg==
Date: Fri, 20 Oct 2023 15:21:15 +0100
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
Subject: Re: [PATCH v6 1/4] dt-bindings: pwm: Add OpenCores PWM module
Message-ID: <20231020-barley-rosy-92c3688cd515@spud>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231020103741.557735-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_072123_739851_A4DA2176 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Type: multipart/mixed; boundary="===============3182756518001231587=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3182756518001231587==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c0ct6Bl9DHRpBcKH"
Content-Disposition: inline


--c0ct6Bl9DHRpBcKH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Krzysztof, William,

On Fri, Oct 20, 2023 at 06:37:38PM +0800, William Qiu wrote:
> Add documentation to describe OpenCores Pulse Width Modulation
> controller driver.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/pwm/opencores,pwm-ocores.yaml    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm-o=
cores.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.y=
aml b/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
> new file mode 100644
> index 000000000000..0f6a3434f155
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/opencores,pwm-ocores.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenCores PWM controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description:
> +  OpenCores PTC ip core contains a PWM controller. When operating in PWM=
 mode, the PTC core
> +  generates binary signal with user-programmable low and high periods. A=
ll PTC counters and
> +  registers are 32-bit.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - opencores,pwm-ocores

What does the extra "ocores" suffix add, when it just repeats the vendor
prefix?

> +      - starfive,jh71x0-pwm

Krzysztof, did you approve this generic compatible?

And the whole thing looks like it should really be something like

items:
  - enum:
      - starfive,jh7100-pwm
      - starfive,jh7110-pwm
  - const: opencores,pwm

Cheers,
Conor.

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
> +        compatible =3D "opencores,pwm-ocores";
> +        reg =3D <0x12490000 0x10000>;
> +        clocks =3D <&clkgen 181>;
> +        resets =3D <&rstgen 109>;
> +        #pwm-cells =3D <3>;
> +    };
> --=20
> 2.34.1
>=20

--c0ct6Bl9DHRpBcKH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTKM2wAKCRB4tDGHoIJi
0mtkAQDneqmAMFoF4jU76TZRB8bFE0/YWyssA6R28Jn1s3HuawEAiae3jINyrJHZ
FyfmraP/Nbf35vRKjhrVBRmITylgPQs=
=uBpZ
-----END PGP SIGNATURE-----

--c0ct6Bl9DHRpBcKH--


--===============3182756518001231587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3182756518001231587==--


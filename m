Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6D7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B25Utmu42fI8LZuu9hGxtXOknudPV0PtFU7TU7B7dQ=; b=EgKSZa53RMM0l+68B54UdS3C6V
	KsX14NtOuBbpkUz1/MxKQsC14qbtMM55FLYDE72DGh9BztoWbzAxkFY+5GG1BpOq3qTyOE5uk0GKh
	ohIrrabIENVkBZ5yoQOaDZadZfJqv+TkTfGbpjIxjI6M39yVxYkjzhMkHcVAlYqH0N16kDQOINTbZ
	RklZF/HT+8hSSD43NJbh4DU+6ud4hTO22pwe8YfExeEpFQVOnUKPLwCxsWHupH+KCkF4xhXfgE5li
	zsQT0IsfhnAagL0+59Ps082t9kXYwTZNHI7HY0/HmyBc82sFE6Lwh5eBx73Ve4lQPM797pHNWuMbF
	CqZlL2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBc6P-00FnMO-0M;
	Fri, 08 Dec 2023 14:45:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBc6L-00FnLg-24
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 14:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10A28B82D54;
	Fri,  8 Dec 2023 14:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B30BC433C7;
	Fri,  8 Dec 2023 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702046711;
	bh=alMIVXtN0++wgPE7Yj1ylmvd8+9QvE9E1C3+NnY8d9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5T0C5dxahWbKqUUR68JF6jiGuJfU32NXq04SIiPNtveDTAmklWwhM9kqhQLhF93g
	 xXy7na58IPtgGZs+h5f4LZf+NwJUBFmPKAzBzcRLEkucfRe64wTFtVcFwjE8gmk+Ke
	 YlyS0mcbhOeti4H1RbEIpXVgCzeGf+wKV8El+Xseu9eliukVW8HUr7BOV/uHs1FMJr
	 kRnyF+XAb+qj3xcVRSYbzNxVlEPyAGwEahd3cdOFbsGbh9U30ReR4C/ruk5D80clvo
	 uQt6HakEIDFikQ+bfiUpqQadc+1XoFEmAD9nlj66/xow3E5jxXPQcxojob0BXtWYqr
	 Ocgb7MItOM27A==
Date: Fri, 8 Dec 2023 14:45:05 +0000
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
Subject: Re: [PATCH v9 1/4] dt-bindings: pwm: Add bindings for OpenCores PWM
 Controller
Message-ID: <20231208-stunned-ploy-2a9e73933ae8@spud>
References: <20231208094209.1910934-1-william.qiu@starfivetech.com>
 <20231208094209.1910934-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231208094209.1910934-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_064513_968544_50CA623F 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: multipart/mixed; boundary="===============1074177592652986179=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1074177592652986179==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VqHdBtEYxkgaGrmF"
Content-Disposition: inline


--VqHdBtEYxkgaGrmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 05:42:06PM +0800, William Qiu wrote:
> Add bindings for OpenCores PWM Controller.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/pwm/opencores,pwm.yaml           | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/opencores,pwm.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/D=
ocumentation/devicetree/bindings/pwm/opencores,pwm.yaml
> new file mode 100644
> index 000000000000..0b85dd861dfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> @@ -0,0 +1,55 @@
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
> +  The OpenCores PTC ip core contains a PWM controller. When operating in=
 PWM
> +  mode, the PTC core generates binary signal with user-programmable low =
and
> +  high periods. All PTC counters and registers are 32-bit.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7100-pwm
> +          - starfive,jh7110-pwm
> +      - const: opencores,pwm-v1
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

--VqHdBtEYxkgaGrmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXMr7gAKCRB4tDGHoIJi
0n1/AQCqxJkSJDrOMIPKQae1c1CejkKWCIbkI6ee1RCIAcEtZgEA6Qa1IO1dkM4G
cYL6KMxjp8nbExzyXKIz4dUJ1XNNZAE=
=1aUw
-----END PGP SIGNATURE-----

--VqHdBtEYxkgaGrmF--


--===============1074177592652986179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1074177592652986179==--


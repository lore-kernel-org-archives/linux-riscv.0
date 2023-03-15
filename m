Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FFDC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noaEvM1RknecQ8r4SyswRufZHkbJ14NYI1hlXuR4/78=; b=Y3HIRuPIsFaaMmoxdVzsSTfjrA
	rMiXPqw2iUAdVREASFlSwkaw52ATbPSL2w5/AAs6MfMWvU+FDIAs0qFQKYnEFLe9aeU6HEg/UyVTz
	hE40AmEosbVjRzBlnSz/gOP6Pqso5JK3buSXaArsBCPxMPaSV2dyEO/1xNXLryGboQi/0s8Vxmi92
	KDv38NtD1WNgImphpjnAZhtDYv72Y9F/FnYRBCmko60Ir2qL+MAMrVLvyaA95U88ZMuDZVr5hvI2r
	3RXkYTCY7EzYzHMj8MuvkxJbIew3IPznnbfXPb/P9q6kTYvCzFE3WwpMdnm8Wy2EQin0jRGMWh2iN
	tuDCbX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcWMr-00EHc8-2x;
	Wed, 15 Mar 2023 19:00:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcWMh-00EHWf-1I
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 19:00:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AB969B81F02;
	Wed, 15 Mar 2023 19:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85A7C433D2;
	Wed, 15 Mar 2023 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678906836;
	bh=m/Dz2eAH8r1EV3V2rwIMfNhkNPorhKim7P/EDMsa3YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+P1b+XcKWZKOJGHvyC9nle6hIYaAvxJ4CMKvXS9yhO19Kt6ZvfoUxsRfAbrWiHFB
	 fy9U5Ndnm/2kit/ILOFcKkafM6HXGsf3Z53Osxsp1z2773fCGWydPdfmUUbZTbF+1I
	 kY9Nqs20jHCQzXABamSFNrqdNJgyZa6N3c1tKYeZ2zwpeD9eSNnxi/xzmtR3xD5Zc6
	 KoFKAJbhXO/BeJAdTvsAsv5l7M1+Lsnc1EFX8ngLDVhktqkggSMj2TR0BZAbGoj/S3
	 YyjGkVF+ijjxXOLIhJ/yhU2qYSYCNHmMx3G2//lieY6gR0UGhtR/wuGk0NMM4432zj
	 fslsVc4SJN3sg==
Date: Wed, 15 Mar 2023 19:00:32 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Message-ID: <043a859e-76fb-436b-9ce1-bc03aeb62ad0@spud>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230315055813.94740-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_120053_883468_0012ADCE 
X-CRM114-Status: GOOD (  19.56  )
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
Content-Type: multipart/mixed; boundary="===============4487930073247910743=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4487930073247910743==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MvUt9aa5WIR6VgtF"
Content-Disposition: inline


--MvUt9aa5WIR6VgtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 01:58:12PM +0800, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

I thought I'd already left an R-b tag against this, but w/e, here it is
again:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'll pick this one up once either Krzysztof or Rob have reviewed it.

Cheers,
Conor.

> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfi=
ve,jh7110-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh71=
10-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh=
7110-syscon.yaml
> new file mode 100644
> index 000000000000..ae7f1d6916af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |
> +  The StarFive JH7110 SoC system controller provides register informatio=
n such
> +  as offset, mask and shift to configure related modules such as MMC and=
 PCIe.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-aon-syscon
> +          - starfive,jh7110-stg-syscon
> +          - starfive,jh7110-sys-syscon
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible =3D "starfive,jh7110-stg-syscon", "syscon";
> +        reg =3D <0x10240000 0x1000>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 958b7ec118b4..fdad60cc9f2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19964,6 +19964,11 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/rng/starfive*
>  F:	drivers/char/hw_random/jh7110-trng.c
>=20
> +STARFIVE JH7110 SYSCON
> +M:	William Qiu <william.qiu@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon=
=2Eyaml
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> --
> 2.34.1
>=20

--MvUt9aa5WIR6VgtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBIV0AAKCRB4tDGHoIJi
0ncRAP9N8OlC2y/fRbeW1DcwuUBENLFl90G1z5d28plldK4JLQD9GCVw2YMd1xU0
xL5j+vQM1pgeWmLjKkA8I9ZcBKzyrgg=
=f5ML
-----END PGP SIGNATURE-----

--MvUt9aa5WIR6VgtF--


--===============4487930073247910743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4487930073247910743==--


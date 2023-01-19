Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E74C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QksUNVF4hfGbkr7vozP0tZ9Jf7O6eR6KN5q2VeKgfaI=; b=N+Ad/Txne0Rf5wB/plPIDaHTQb
	yjABBdv3uwr2cTTP63oip0h+6MmvkeBCH4GSXR7NWfC9vPXMAYqc1NZLGir3s3Qw2UENMYffL+oj7
	+AGd0Vp7WLuyJdLoLC+467r7c6+kzLhHm/p1dleFo8+NgvC96NvY/iEyPYN3683BNNra3kvGyDwDO
	JSkkM9XuFZUguAT6pAs9tEDJ0Fvlz1HGu6g++tiTN5cUnprNUHQ/pPh5g1y0vzJwrtxd2iydwUvKD
	/DiO0dyOjoKIDdwLhbM28gVA17OcvfwptOsvqGwxoyk99eAUF+PVGkZitrBuqEjU+il0ZXj/MWXBP
	4C0Xbehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITX0-004flo-1j; Thu, 19 Jan 2023 11:56:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITWR-004fU4-JV
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 11:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674129359; x=1705665359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/yQNfHAxcljG2Q5aMUQijjlsJyFUg3zCw6doKyi/Ds=;
  b=TJFNWpiakh5tcDxnR//bzerj57/dbEs86dThJRxSqjnB/jESminAj2PE
   W2locdpbx6+wsycxdqm10FCxzF05lRHv8vd0xD8MiowS9EtBf1qNlR2Kc
   zwb1ut9UK/i7KxgMVmb18TxnAYs1Xum7d/WIJWeGHO2h3DX8yP43SUJz3
   y4BoL1qum41kp0Tol84VJcbjHdoTpO0Ltj4xzHqUrp+1YDsFqUlz+ABTJ
   wOjJt0gPc5KQybhpM/5aps4AfS1OGKMpVJG+J1v5pNa9UMRp0O1FiPsaL
   Clp1/y9fdZABBAm+xBsYJDozIsFVUhOsqDrqoG8GrhY+xgb6Us+02xOG7
   g==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669100400"; 
   d="asc'?scan'208";a="196514152"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:55:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:55:55 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 19 Jan 2023 04:55:53 -0700
Date: Thu, 19 Jan 2023 11:55:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Heiko =?iso-8859-1?Q?St=FCbner?=
	<heiko@sntech.de>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: Add starfive,jh7110-pmu
Message-ID: <Y8kvoBY61p7ZX1UP@wendy>
References: <20230119094447.21939-1-walker.chen@starfivetech.com>
 <20230119094447.21939-2-walker.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230119094447.21939-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_035559_896572_A2BD8DB9 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Type: multipart/mixed; boundary="===============3499670536305635142=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3499670536305635142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KtqlIoRlabMqvssE"
Content-Disposition: inline

--KtqlIoRlabMqvssE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Walker,

On Thu, Jan 19, 2023 at 05:44:46PM +0800, Walker Chen wrote:
> Add bindings for the Power Management Unit on the StarFive JH7110 SoC.
>=20
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Just FYI, an R-b given against the cover letter can usually be applied
to all patches in the series, unless otherwise stated.
So here's mine from v3:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Whenever you re-submit the dts patch, you can send that with my R-b
already applied there too.
I'll give this a day or two for the build bots to look at it before
applying it.

Thanks,
Conor.

> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml   | 45 +++++++++++++++++++
>  .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71=
10-pmu.yaml
>  create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h
>=20
> diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.=
yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> new file mode 100644
> index 000000000000..98eb8b4110e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/starfive,jh7110-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Power Management Unit
> +
> +maintainers:
> +  - Walker Chen <walker.chen@starfivetech.com>
> +
> +description: |
> +  StarFive JH7110 SoC includes support for multiple power domains which =
can be
> +  powered on/off by software based on different application scenes to sa=
ve power.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7110-pmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwrc: power-controller@17030000 {
> +        compatible =3D "starfive,jh7110-pmu";
> +        reg =3D <0x17030000 0x10000>;
> +        interrupts =3D <111>;
> +        #power-domain-cells =3D <1>;
> +    };
> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt=
-bindings/power/starfive,jh7110-pmu.h
> new file mode 100644
> index 000000000000..132bfe401fc8
> --- /dev/null
> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
> +#define __DT_BINDINGS_POWER_JH7110_POWER_H__
> +
> +#define JH7110_PD_SYSTOP	0
> +#define JH7110_PD_CPU		1
> +#define JH7110_PD_GPUA		2
> +#define JH7110_PD_VDEC		3
> +#define JH7110_PD_VOUT		4
> +#define JH7110_PD_ISP		5
> +#define JH7110_PD_VENC		6
> +
> +#endif
> --=20
> 2.17.1
>=20
>=20

--KtqlIoRlabMqvssE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8kvoAAKCRB4tDGHoIJi
0v8aAQD5NmwXm053OEW5Y+vl6nJVhbEcYexgIv681j8R3EHB4gEA6Gz2eE/sUgsd
nSoL8cY+awMny85fIl0xH64nT8kloAs=
=K8tD
-----END PGP SIGNATURE-----

--KtqlIoRlabMqvssE--


--===============3499670536305635142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3499670536305635142==--


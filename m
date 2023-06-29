Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC8CEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47ni++JShyiFmS15l9UFbf6p1/waEPg2OxbW4gLo4H4=; b=1XldyZZcarhU+VwCs2MczYSg2C
	P7BDtr/22eN2+7U5a4lIyBU7aGHwC/VMJ/RE0024oqvWjcQdTZPLwBsu2zGnYfDSrWLRNXALann0d
	0fJxPKksWGc+l60kiiH2L3AlVn1iAnWpXEEeczmcETir/QziedoGKrSveil5DrxKCAOSimY7JRZ60
	KF+/QFmxGhGqRstmEQ+Ah/ziJyNLp4eLnaz8b4t88mXmP5LywMTEF1HUfv1ntRjFdHKcZbubjILmc
	jq4sD/GUnhR6lnSJ87hGKdXxyd4T+qx5lm9FLd+i+9Jwu2UaYdeNJ2EpvusyFF68c3DNiHn3WmhuZ
	lRVsT9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEnX5-000UfF-2O;
	Thu, 29 Jun 2023 09:01:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEnX3-000UeO-0b
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 09:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688029301; x=1719565301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3S5KyMzhn3eCt7uu2HW5CUsu9QGVcQK3sBOL7pJmvU=;
  b=nk9GZ6VKSMhHfYwnXaznXAPf9OSBK473WD/tVB+bHCjEljkGgSUUHpT6
   /w4pQu9cOMvLneXnVb2Zf0iILzqYlvcNlfiGTHluU7ET7ar9fmh5zMbkW
   auR2liX6OU+RGJXLQbxq8BI8v0SkE0Bwuq5KLET/P8lSxS209utq0QWFM
   s4EiPUpk/DoCfIExwnDpusbqW6GVbmK9tRqcti44ILzRFO8id7krJUERx
   HEZfHE/fgBZnX5wOP7uaA5LpoQ4Xqd5e2vWW+keDOposw4Owg3P6qV8Df
   qbSdOr1uwk1hT9QEk60IzteP0fnMhDPGhVA/rseIpas0l4Y819ew9ry70
   g==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="asc'?scan'208";a="218159678"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 02:01:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 02:01:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 02:01:36 -0700
Date: Thu, 29 Jun 2023 10:01:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230629-throng-creation-a33bbd191c1a@wendy>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-3-xingyu.wu@starfivetech.com>
 <7e2d6bfe-5687-97c5-778b-c02e9c0894af@linaro.org>
 <a83c98ae-2f6c-00c4-5d05-fc304718e05a@starfivetech.com>
 <20230628-affix-maverick-84a08905f05b@spud>
 <2270fd7f-1751-066a-0da5-e35cdd59fd2f@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <2270fd7f-1751-066a-0da5-e35cdd59fd2f@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_020141_433575_51088D48 
X-CRM114-Status: GOOD (  19.88  )
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
Content-Type: multipart/mixed; boundary="===============4593184920344192705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4593184920344192705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dyYLTwA1dVYqX1L9"
Content-Disposition: inline

--dyYLTwA1dVYqX1L9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 02:42:39PM +0800, Xingyu Wu wrote:
> On 2023/6/29 1:34, Conor Dooley wrote:
> > On Wed, Jun 28, 2023 at 02:44:10PM +0800, Xingyu Wu wrote:
> >> On 2023/6/14 2:31, Krzysztof Kozlowski wrote:
> >> > On 13/06/2023 14:58, Xingyu Wu wrote:
> >> >> From: William Qiu <william.qiu@starfivetech.com>

> >> >> +allOf:
> >> >> +  - if:
> >> >> +      properties:
> >> >> +        compatible:
> >> >> +          contains:
> >> >> +            const: starfive,jh7110-aon-syscon
> >> >> +    then:
> >> >> +      required:
> >> >> +        - "#power-domain-cells"
> >> >=20
> >> > Where did you implement the results of the discussion that only some
> >> > devices can have power and clock controller?
> >> >=20
> >> > According to your code all of above - sys, aon and stg - have clock =
and
> >> > power controllers. If not, then the code is not correct, so please do
> >> > not respond with what is where (like you did last time) but actually
> >> > implement what you say.

> Yeah, following your advice, I modified the codes and there are two optio=
ns:
>=20
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> @@ -41,6 +41,16 @@ required:
>    - reg
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-sys-syscon
> +    then:
> +      required:
> +        - clock-controller
> +      properties:
> +        "#power-domain-cells": false
>    - if:
>        properties:
>          compatible:
>            contains:
>              const: starfive,jh7110-aon-syscon
>      then:
>        required:
>          - "#power-domain-cells"
> +      properties:
> +        clock-controller: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-stg-syscon
> +    then:
> +      properties:
> +        clock-controller: false
> +        "#power-domain-cells": false
> =20
>  additionalProperties: false
>=20
> Or :
>=20
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> @@ -41,6 +41,17 @@ required:
>    - reg
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-sys-syscon
> +    then:
> +      required:
> +        - clock-controller
> +    else:
> +      properties:
> +        clock-controller: false
>    - if:
>        properties:
>          compatible:
>            contains:
>              const: starfive,jh7110-aon-syscon
>      then:
>        required:
>          - "#power-domain-cells"
> +    else:
> +      properties:
> +        "#power-domain-cells": false
> =20
>  additionalProperties: false
>=20
> Which one is better? Thanks.

This second one looks better to me, as it achieves the same thing in a
simpler way.

Cheers,
Conor.

--dyYLTwA1dVYqX1L9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ1IUwAKCRB4tDGHoIJi
0p+VAP0VjZDVhCo7waX9fMh6nsZdgK3duJg4TOoQ68hNJoD8xgEAvalmj5FLOA7Y
XHTX3ksOnF8f5wfr2yjAkNY6DmfAng0=
=bcF5
-----END PGP SIGNATURE-----

--dyYLTwA1dVYqX1L9--


--===============4593184920344192705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4593184920344192705==--


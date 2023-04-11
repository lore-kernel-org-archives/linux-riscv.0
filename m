Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14629C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 20:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weM2VaNAq3ptFYRYzystQwa/YebjmRIrBp4MrgsJMjY=; b=Pa0cargGINQ5KmM3t5GILkYbC2
	Kuv3+2Z4Q+B4CvZiDQ3hLd0ltwVLgZcgGfx1rcVuQ4+V3MmiHuGylbDiGu8iYf9zz4MR/+q2N0Kjl
	YjPT5rGp3LOVFuLXdCEJiYJB+bQGRjolP9oG45FY2FLLItW+9vxTVttfPK5xugLUALIMASHIJARaV
	8ynXaY3m2ThVSrwGgNlosM/v/WEKNAO2MfsrUnHlIwQRUpE4Gsgzb+9h+x+kf8sl47DdQPPhKyCvy
	DRZocsrogm8aEjID2WvT1F2aax2PyCHlgYeHRRmTATaG6kyQ8+obT9MvE2SM75YZB/RM289i3lRGe
	lyPNyU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKMq-0014Oa-2L;
	Tue, 11 Apr 2023 20:13:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKMn-0014Nx-36
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 20:13:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 514A762605;
	Tue, 11 Apr 2023 20:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72034C433D2;
	Tue, 11 Apr 2023 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681244004;
	bh=ZviwcxpDXgrZT/ibODx/e4RR16fW2UhiiAY8a0mCX/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fb7j/HV3N5lz+blyj9ONW8umWsdCHpIahlIQEArhLEBw5NK/DabCD+fnxocqJOXgg
	 WlF4oK6xnC/Pt4aDGT8exjZNlW1D3R3CNww08QYeNJDM8VxYgw45ZrG1wYs9s2knE+
	 ckfSl4N8DlzeD48puuYhvDlRAkxcXCjkOA+WPIsYhPgwL/bVo3RlCrhlvsGR1702LA
	 hCOiNg/5ySIz+mZGIN6g2T6F/o/usbTYxcj3+y/7KoMdx83GIW/v8Ms7TxWtOpKqNa
	 oyTLGY2xcVxdZY+oTx1QR03sWQ1q2BuDjtwoeeice8B6cNSOC5VEpbuNuURtdM0kE/
	 TU/yC9tbRBElw==
Date: Tue, 11 Apr 2023 21:13:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Message-ID: <20230411-vitality-exodus-f7e5d2e8576c@spud>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411064743.273388-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_131326_075767_F3A3FCFB 
X-CRM114-Status: GOOD (  18.16  )
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
Content-Type: multipart/mixed; boundary="===============0174453935630950397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0174453935630950397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="woEVfFYCRgC7kFh0"
Content-Disposition: inline


--woEVfFYCRgC7kFh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 11:47:37PM -0700, Changhuang Liang wrote:
> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
> interrupts properties.

Please write a commit message explaining why this is needed.
The commit message as-is is insufficient, but also IMO wrong incorrect.
I think it would more accurately be "...: add jh7110 dphy pmu support" or
similar & the body should explain why this particular PMU has no
reg/interrupts.

Cheers,
Conor.

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml        | 14 ++++++++++++--
>  include/dt-bindings/power/starfive,jh7110-pmu.h    |  3 +++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.=
yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> index 98eb8b4110e7..ffb4406c2e56 100644
> --- a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> +++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> @@ -8,6 +8,7 @@ title: StarFive JH7110 Power Management Unit
> =20
>  maintainers:
>    - Walker Chen <walker.chen@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> =20
>  description: |
>    StarFive JH7110 SoC includes support for multiple power domains which =
can be
> @@ -17,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - starfive,jh7110-pmu
> +      - starfive,jh7110-pmu-dphy
> =20
>    reg:
>      maxItems: 1
> @@ -29,10 +31,18 @@ properties:
> =20
>  required:
>    - compatible
> -  - reg
> -  - interrupts
>    - "#power-domain-cells"
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: starfive,jh7110-pmu
> +then:
> +  required:
> +    - reg
> +    - interrupts
> +
>  additionalProperties: false
> =20
>  examples:
> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt=
-bindings/power/starfive,jh7110-pmu.h
> index 132bfe401fc8..0bfd6700c144 100644
> --- a/include/dt-bindings/power/starfive,jh7110-pmu.h
> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
> @@ -14,4 +14,7 @@
>  #define JH7110_PD_ISP		5
>  #define JH7110_PD_VENC		6
> =20
> +#define JH7110_PD_DPHY_TX	0
> +#define JH7110_PD_DPHY_RX	1
> +
>  #endif
> --=20
> 2.25.1
>=20

--woEVfFYCRgC7kFh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDW/XwAKCRB4tDGHoIJi
0rfMAQCEY1sOSuX+9PUExrhZ16C87WAg2z6vDj6OdcqFSKbWtQEAhVtayEho0Gc3
dyCQ/hZf9AkaJDiBG33vffX1VnYxaQk=
=/A68
-----END PGP SIGNATURE-----

--woEVfFYCRgC7kFh0--


--===============0174453935630950397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0174453935630950397==--


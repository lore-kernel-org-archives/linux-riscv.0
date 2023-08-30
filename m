Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E45C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BE8mPg0eokaU97UzgCtYtyV6Ye/5R1KvBMDwZzUm4vQ=; b=k18N+CWDo5cWyQOaW2CPSmEjVI
	JLvn4pgcZLHoHz/Cas4lAHilC6B4G5fU2nxkyEcTxpcXzkwAau08BzCbUIZNmZYR/o0buCWzXPC1F
	H/+Ll/Jrguvo46gQam58qd7XLFncnY+DRrMQe8qKQw8p/e42FpDx9kxLbx4SDJSgFUK/+aniIddRF
	z9Qh5bFnm/AhnPXt83pQzm7z2jYMYrs/7d+jWznitgaEiN58b/BqU2G44+O6e5GyjOFuKbHHsDIZ9
	rKqHFZ08XnGIkH7sNfZPMk9w++g06VDMfUeplRqJJWMHz31tkeHdsHjQEO/PKZEzoN9byw2aPeNux
	zQFh0YOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbF38-00CwZh-1r;
	Wed, 30 Aug 2023 06:51:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbF36-00CwZM-18
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 06:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693378292; x=1724914292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJiqQM/21AbbfFTBJGuHIq/kCZ7VDhCQMZ/MLtlN5jI=;
  b=2Qmh3SFIXzCiecrkvR+sdB3gPxYlfiSJqx9z1Nm3Aseo45f4cDFPrUyO
   mrStAst2lxeoRSmnD7WHEiD/1defdCfdDi2A3m3u6Z18pM3ZuQ9Bl8AdB
   DMJdXwll0pdZ0QjFTONvH76fn1oo1fuMTAXGljBF2eVawv3hznedlWQY5
   xuXRxd5WFgGVbOncuKNS1tjb6SUphRA62YMx0nO+C2P7pQXfY/koPz8zo
   9Ip1MatD1+y8QeG/vIRDUkoWFM1FpDyB1ZpXZFgJzzBnVx7R1Bj0b8MTW
   y/2a85kd2gN1OORXrc78smKLLRJZQNxNUt+uXv5TQgDqVy1hx/2CAD1ra
   A==;
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="asc'?scan'208";a="169011728"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2023 23:51:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 29 Aug 2023 23:51:22 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 29 Aug 2023 23:51:20 -0700
Date: Wed, 30 Aug 2023 07:50:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: William Qiu <william.qiu@starfivetech.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Message-ID: <20230830-commence-trickery-40eaa193cb15@wendy>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230830031846.127957-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_235132_582848_EDA120F7 
X-CRM114-Status: GOOD (  15.79  )
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
Content-Type: multipart/mixed; boundary="===============8041482550090923396=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8041482550090923396==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VGI59nk8mzz/pDkD"
Content-Disposition: inline

--VGI59nk8mzz/pDkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
> Due to the change of tuning implementation, it's no longer necessary to
> use the "starfive,sysreg" property in dts, so drop the relevant
> description in dt-bindings here.

How does changing your software implantation invalidate a description of
the hardware?

>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../bindings/mmc/starfive,jh7110-mmc.yaml         | 15 ---------------
>  1 file changed, 15 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.ya=
ml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> index 51e1b04e799f..10df41941331 100644
> --- a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> @@ -36,26 +36,12 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> -  starfive,sysreg:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      - items:
> -          - description: phandle to System Register Controller syscon no=
de
> -          - description: offset of SYS_SYSCONSAIF__SYSCFG register for M=
MC controller
> -          - description: shift of SYS_SYSCONSAIF__SYSCFG register for MM=
C controller
> -          - description: mask of SYS_SYSCONSAIF__SYSCFG register for MMC=
 controller
> -    description:
> -      Should be four parameters, the phandle to System Register Controll=
er
> -      syscon node and the offset/shift/mask of SYS_SYSCONSAIF__SYSCFG re=
gister
> -      for MMC controller.
> -
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
>    - interrupts
> -  - starfive,sysreg
> =20
>  unevaluatedProperties: false
> =20
> @@ -73,5 +59,4 @@ examples:
>          fifo-depth =3D <32>;
>          fifo-watermark-aligned;
>          data-addr =3D <0>;
> -        starfive,sysreg =3D <&sys_syscon 0x14 0x1a 0x7c000000>;
>      };
> --=20
> 2.34.1
>=20

--VGI59nk8mzz/pDkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZO7mswAKCRB4tDGHoIJi
0j0ZAPoD8g3POZOxVjU8MHAqAQsVrGSXh9a5G6ibHoCJuX5zqQD+OwU3VEu8ihr1
DsPdiiCV8fgivVirHHYW8sFlFgF+jQg=
=iZHY
-----END PGP SIGNATURE-----

--VGI59nk8mzz/pDkD--


--===============8041482550090923396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8041482550090923396==--


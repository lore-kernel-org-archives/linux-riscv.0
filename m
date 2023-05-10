Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1375C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 07:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gD56i+Bum/7Yfw+WHqjaxVW6Yt1zjZyGLrNaNzz5p6E=; b=tVLVlZNeX0b9cAtFahqL4JFGWe
	D9rI8Fh0R0jMPPvbZem9n2Kpa1PwO4G4xRahQDrQS60+QNpBktz7E7rIZmb2COizlgATPM6qYtOwN
	rUg5/4uVFbsP8ivhi5nYYHEWnq/wHW3l3tLEaC1uLjH2KZ27mthlErMxOWgNpqKP5sGqVyW5kBapl
	vLWVsvXb52yt2G+dAf4Otf+aeYaPpF8PxyNp/bXZr+W+I5m5sEYmz/LVyPoAOU9nOX9zKr+13tr0R
	SqOfs/zyPwFniws3n2jXLPRrUuQBnXhY9E16vi+7QqWEuhbvduI9wpKqNQalGEuJ+U0yLhqtGH74x
	mzc5Iftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwduh-005LWT-2T;
	Wed, 10 May 2023 07:07:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdue-005LVK-2m
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 07:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683702420; x=1715238420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+8dv/brKBQt1wPqiVrN9ewc+Fk5nJ8ddNHlReu2K9z4=;
  b=j0a+s0OH4HpIaJmVlxjTjgroWS5navjPI01u51t36thrtMEf6Lrec9Jt
   myiwuqfGRWRQqeMuMYb/eMfl7g3hvTNKAW3h7gbthOTFo1RwWpjm0fnQ2
   UNa1wLoHkmONtLEU+etPV5Zoqy701hU86DUOPBOnS67ViaeA2ecOFudGR
   dc94sQ12ltyIi6ZVfSDyLVsq7QyI/l61GhD6a/omWAUeoafod18zZ6Ftg
   P2eLxTGZ6vMhgTECnNpTg0yO31vhpdjnzM3hFgL0ZOgcOF7MmUn3hd1pd
   35EDL5bg0+0We+ImlSghG9orpezHTTsjSLi862bR/tLJ0KCbdx0y4bYeu
   w==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="224659027"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 00:06:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 00:06:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 00:06:45 -0700
Date: Wed, 10 May 2023 08:06:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230510-cloning-clapping-e262f00a94e8@wendy>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
 <20230510015311.27505-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230510015311.27505-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_000700_911834_53C4C188 
X-CRM114-Status: GOOD (  16.86  )
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
Content-Type: multipart/mixed; boundary="===============8707483358593900587=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8707483358593900587==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E1sIU8pcpx5FtKdh"
Content-Disposition: inline

--E1sIU8pcpx5FtKdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 06:53:07PM -0700, Changhuang Liang wrote:
> Add AON PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY
> rx/tx power switch, and it don't need the property of interrupts. It
> also can use syscon operation.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml   | 28 +++++++++++++++++--
>  .../dt-bindings/power/starfive,jh7110-pmu.h   |  5 +++-
>  2 files changed, 29 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.=
yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> index 98eb8b4110e7..0591a4e9db6c 100644
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
> @@ -15,8 +16,13 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - starfive,jh7110-pmu
> +    oneOf:
> +      - enum:
> +          - starfive,jh7110-pmu
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +          - const: syscon

Unfortunately, this is not what was wanted.
This syscon, of which power domain control is just one of the things that
it can do, should be documented in
Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
alongside it's brethern "starfive,jh7110-sys-syscon" &
"starfive,jh7110-stg-syscon".

Thanks,
Conor.

--E1sIU8pcpx5FtKdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFtCZAAKCRB4tDGHoIJi
0hrGAP45+4QtUN3O67mViY6Se2nDCL4YzvmakMHafqtLg1oFTAD+I/zW+xPAB+gH
Ql2h5U3oPdpEOUYmunmawFTjoUiHNgE=
=DRst
-----END PGP SIGNATURE-----

--E1sIU8pcpx5FtKdh--


--===============8707483358593900587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8707483358593900587==--


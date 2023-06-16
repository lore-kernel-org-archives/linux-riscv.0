Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305C8EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IchnMwNXBiEt09Lv0hUxzYyL67WXrGoNO814bmJXZDo=; b=NC/hyIc2u5Ad/UWRtDnm+jM2Mt
	uXpMc6jMYiaVrUHfebSFdhQMjqU46iUtfn6BIIRQEovZz7W/N+Pt7LuyJ5LjbQ8qiTJmCvDY+0h51
	XG4i935fsLCqaYy7H9uDWMmzs8FN72+hvNU7pGQm0qNR/L8IAUOVbKP0TeAY1OIsZlV8Pm+bH7Ofb
	PAxYk3K/8hcCidhwmxBvsABswtN3JffHjPEelyMhOpFYJ2w/BwJDtTuGbBAPix6/hHbs2201uB3Go
	GCFQRqfHNHEyfGHfsugNZ7Sw8zdQgCRQw5rULhiLClg1Un1eSWfXWxrsHwyKs6r/AkZ9nl51BXXX/
	2cNodS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6R3-00HZcc-1J;
	Fri, 16 Jun 2023 10:12:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6R0-00HZaV-09
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686910321; x=1718446321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8PTgZpEiLPMpSVSdcmzuYsdAeMPqe+xF/Qpo/bvYr4c=;
  b=VYNB0u79Ljbix7baFuX1RulcTJWIVhfxnubVEOdAVfNr0ZSKP4gFmTL/
   2fvKrYXgS/JboOV4hcQx1mE1NVYsrPt3azdtdWABFl9t+y3tiIZSxnqmg
   OfSnfgDqu42Z+WLoSK45e12ciEzdHLZjEpK4PqJ22QjqbbEKsqt1YvCLy
   TowiF/ba4Ox/tUbgmz0F+JFuKvhyxV7rhOgjK81ntR3k6g/dfrmfrpO/g
   KumeYgfhEWH6m80e5YjQROQjvA3l2ANkD3gRDw3ZCvxkfi0NHLUjeCfhj
   lXG9YzBReI4ZELb2ePWiQMrPjbASEJHobn6/RW9sISfmlA44BYLlsDpxE
   g==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="157251664"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 03:11:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 03:11:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 03:11:00 -0700
Date: Fri, 16 Jun 2023 11:10:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric Lin <eric.lin@sifive.com>
CC: <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <maz@kernel.org>,
	<chenhuacai@kernel.org>, <baolu.lu@linux.intel.com>, <will@kernel.org>,
	<kan.liang@linux.intel.com>, <nnac123@linux.ibm.com>,
	<pierre.gondois@arm.com>, <huangguangbin2@huawei.com>, <jgross@suse.com>,
	<chao.gao@intel.com>, <maobibo@loongson.cn>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dslin1010@gmail.com>, Zong Li
	<zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230616-renovate-country-12b9873b4494@wendy>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230616063210.19063-4-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_031202_199442_7F87A61F 
X-CRM114-Status: GOOD (  18.11  )
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
Content-Type: multipart/mixed; boundary="===============5213252123712949964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5213252123712949964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ssNWi0cU4z5MFoHT"
Content-Disposition: inline

--ssNWi0cU4z5MFoHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Eric,

On Fri, Jun 16, 2023 at 02:32:10PM +0800, Eric Lin wrote:
> This add YAML DT binding documentation for SiFive Private L2
> cache controller
>=20
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Nick Hu <nick.hu@sifive.com>

Firstly, bindings need to come before the driver using them.

> ---
>  .../bindings/riscv/sifive,pL2Cache0.yaml      | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive,pL2Cac=
he0.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yam=
l b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
> new file mode 100644
> index 000000000000..b5d8d4a39dde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml

Cache bindings have moved to devicetree/bindings/cache.

> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2023 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sifive,pL2Cache0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Private L2 Cache Controller
> +
> +maintainers:
> +  - Greentime Hu  <greentime.hu@sifive.com>
> +  - Eric Lin      <eric.lin@sifive.com>

Drop the alignment here please.

> +
> +description:
> +  The SiFive Private L2 Cache Controller is per hart and communicates wi=
th both the upstream
> +  L1 caches and downstream L3 cache or memory, enabling a high-performan=
ce cache subsystem.
> +  All the properties in ePAPR/DeviceTree specification applies for this =
platform.

Please wrap before 80 characters.

> +
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sifive,pL2Cache0
> +          - sifive,pL2Cache1

Why is this select: required?

> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - sifive,pL2Cache0
> +          - sifive,pL2Cache1

What is the difference between these? (and drop the caps please)

Should this also not fall back to "cache"?

> +
> +  cache-block-size:
> +    const: 64
> +
> +  cache-level:
> +    const: 2
> +
> +  cache-sets:
> +    const: 512
> +
> +  cache-size:
> +    const: 262144
> +
> +  cache-unified: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  next-level-cache: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - cache-block-size
> +  - cache-level
> +  - cache-sets
> +  - cache-size
> +  - cache-unified
> +  - reg
> +
> +examples:
> +  - |
> +    pl2@10104000 {

cache-controller@

Cheers,
Conor.

> +        compatible =3D "sifive,pL2Cache0";
> +        cache-block-size =3D <64>;
> +        cache-level =3D <2>;
> +        cache-sets =3D <512>;
> +        cache-size =3D <262144>;
> +        cache-unified;
> +        reg =3D <0x10104000 0x4000>;
> +        next-level-cache =3D <&L4>;
> +    };
> --=20
> 2.40.1
>=20

--ssNWi0cU4z5MFoHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIw1GgAKCRB4tDGHoIJi
0gNOAQCIJoftwKLE7w2VWLh+kuM2k8LgVXAVjLDyCKgmSzTT0AD/deRzPJgKXPwV
MMGvlTkxTrxIz9e+3MVzNEw/6+WpHQY=
=Q4Dq
-----END PGP SIGNATURE-----

--ssNWi0cU4z5MFoHT--


--===============5213252123712949964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5213252123712949964==--


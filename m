Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4909CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoO/dh1UDFhAKvT+o+uzP/tY25xDg5upt4BmjxBtXuk=; b=bbEWVGmNpnjnhHSUCG0giEzXee
	nz29T6ZAQNSdwEq7RbQSq6Aw+xB4mLWSlGaACrAJc3AmHjwHZtcsn1nJvl0ioKWV1VMRheXbHwVjA
	PdtkUd0w86qtmDOBKDqxN24jC15U5llAZUIjb64o39CckSc2nZRYqRGpeNVd9qw01toA2Y3LgtbO+
	Y6W/tfUOad8d2bnT5lJ6iJQJygmRFrVKOOMZA0ugEqeANCewv01fO0hqLg9xC30anorGEPR9C3yN6
	pPfNJQzokf7BcwO/+au64mBJfwI8H0U9om1caDhT8ZnyiqKWg2V4T3kDhwslf2Cej4sx4tmXOlK0i
	ebLks8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisUr-002Gny-1c;
	Wed, 20 Sep 2023 08:23:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisUp-002Gn4-09
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695198223; x=1726734223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h8v+kPqS+HjJo2h9d2NO6MN5S7urQThJPL5oA0y2o4A=;
  b=UXolwu6iJuUYJdNpCVur6lxODrQ+OcND+g0+Au8rqf9XHNfHpPrLXgDz
   Leomqpw7ey6YX35ZbX3ZtVveMII0M7CBbbJkLiVUQYrLhMvyR9Te40KS5
   K9jRJD2+aKEIfmZeVyMli+WLBufee3YABlxuoy38RRXYqOL1JnXYFL9PB
   WXbA6nmLN6k+qBFiK9oko6Nr931hU5x7G56fhVEpHmaPbfZQllWE0tK/w
   qNM6HHnmEKQocwGV8jMuVncrQmONdXJ31FcB+uEn+ZUOlk6usgnyeFJ67
   rNyjOotWDGalm9Uyk8FLRI9aso5/QgLgK9UMZOw+fHf7q1bIoKe8lzaSO
   w==;
X-CSE-ConnectionGUID: 447RiIfjRayIHUjMe4w4Kg==
X-CSE-MsgGUID: AttvSdqhTIu+lS3BC2Ba3A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5613544"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:23:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:23:01 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:22:58 -0700
Date: Wed, 20 Sep 2023 09:22:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 02/11] dt-bindings: vendor-prefixes: add milkv/sophgo
Message-ID: <20230920-unable-impish-373fd26b7d16@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <dbd7d823a73d8a9484efcd55f6616f5392daf608.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <dbd7d823a73d8a9484efcd55f6616f5392daf608.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012343_091958_3FB41133 
X-CRM114-Status: GOOD (  13.35  )
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
Content-Type: multipart/mixed; boundary="===============3525129392125469126=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3525129392125469126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SwIF3I7rfx1hXsx3"
Content-Disposition: inline

--SwIF3I7rfx1hXsx3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Sep 20, 2023 at 02:37:28PM +0800, Chen Wang wrote:
> Add new vendor strings to dt bindings.
> These new vendor strings are used by
> - Sophgo SG2042 SoC [1]
> - Milk-V Pioneer board [2], which uses SG2042 chip.
>=20
> [1]: https://en.sophgo.com/product/introduce/sg2042.html
> [2]: https://milkv.io/pioneer

If you resend, make these link tags please. Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 573578db9509..fcca9e070a9a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -863,6 +863,8 @@ patternProperties:
>      description: MikroElektronika d.o.o.
>    "^mikrotik,.*":
>      description: MikroTik
> +  "^milkv,.*":
> +    description: MilkV Technology Co., Ltd
>    "^miniand,.*":
>      description: Miniand Tech
>    "^minix,.*":
> @@ -1273,6 +1275,8 @@ patternProperties:
>      description: Solomon Systech Limited
>    "^sony,.*":
>      description: Sony Corporation
> +  "^sophgo,.*":
> +    description: Sophgo Technology Inc.
>    "^sourceparts,.*":
>      description: Source Parts Inc.
>    "^spansion,.*":
> --=20
> 2.25.1
>=20

--SwIF3I7rfx1hXsx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqr0QAKCRB4tDGHoIJi
0uyKAPsHIRY81qzmFLxN6FMUw75lAg98PudIOjgADw5xJjpEIAD/cyrHv5LAaY6t
yPmwkTQt4gexHGLZEQIyIf/v7yfSnwc=
=W+PQ
-----END PGP SIGNATURE-----

--SwIF3I7rfx1hXsx3--


--===============3525129392125469126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3525129392125469126==--


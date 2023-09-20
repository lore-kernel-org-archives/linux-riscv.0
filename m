Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D90CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iTP7HzCiAlYm2DVMq+lfqqQ6/tgN1cXLLjVvihRjKc=; b=tRocPAdwn29cPU8SrOAGb345j6
	lll+Jm8udIIziyz1ywYnz62VJshEEeTBvu4md0Zymkqg9t+C3Cpf4iE+2toiyj7h3mNDKmpJtZSp9
	ZXa1TR/QkyZOKNQUNH0+1pfJ+zXusaCvrHonNHa5RyPdRohmoW6emf/ZtxHF/kYCXIWSFAwQhREZc
	wNU/hCJpFEMuyek9HZlivFHw9H3QUXQiPAMO+cPz2vlPyHdWcURrz0Uwg11Ag4qZJ8UjryDxrV/2c
	oQxPXvIMXTJnxtOjKpzYwr4a+pKToZqmdyU9W1QcDK8Bt8CnKeV4BgUKxfP8vUYOuIS6uwctAxBAB
	m1Fv+h5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiswP-002LBJ-0y;
	Wed, 20 Sep 2023 08:52:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiswL-002LAT-2u
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695199930; x=1726735930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e0y+zzC1lKT4sTShU69YLMFMHB7gGsBqYxoxrKdJeyc=;
  b=Funq50FY2wq/TcmRabUc1BRvtp9CMfXFSYeGX8Nz7ERNvZCx3WVE/zGK
   N0aeEHbpAltxyL0zRiClDXtwxtAeMw5abNXcr+HU/1L10aGgFbhMXgy9I
   3tr4DhZ1jUBdWsNFl2Thq84jrBgy1LacrPSSnL5LfWp8pFfKvzEzOsdwP
   1EUkb++usfid/tZfwTI7K5APqdbM8/4bFnP9BiGZj9QSnA159PdjTWnyB
   l7vWVShGHv9YnIJKUbOqxK3DCSbLvxaZaxHMCVG6ReZVKSQsBb0n+Rhza
   BMi2gAziM0YqM1gh26Nh+3KKt3z8UDgxyZ1JkfTwRE+L7X6xW1RcDqjx9
   w==;
X-CSE-ConnectionGUID: 9BLpBBcZRkmEPkTUW5H17w==
X-CSE-MsgGUID: O0olU429SFGVPipcG7Riew==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5617288"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:52:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:51:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:51:10 -0700
Date: Wed, 20 Sep 2023 09:50:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Inochi Amaoto <inochiama@outlook.com>, Chen Wang
	<wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230920-recount-chili-f80d5dc125e8@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <55865e1ce40d2017f047d3a9e1a9ee30043b271f.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_015210_053752_60156F98 
X-CRM114-Status: GOOD (  18.60  )
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
Content-Type: multipart/mixed; boundary="===============8423348597873724975=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8423348597873724975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fICEAUDlyhHZKV1g"
Content-Disposition: inline

--fICEAUDlyhHZKV1g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 02:39:39PM +0800, Chen Wang wrote:
> From: Inochi Amaoto <inochiama@outlook.com>
>=20
> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
> the timer and ipi device separately, and do not allow c900-clint as the
> fallback to avoid conflict.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>

Have you ignored Krzysztof's comments on this? I don't see a response or
a reaction to his comments about the compatibles on the last version.
Additionally, where is the user for these? I don't see any drivers that
actually make use of these.

Why do you need to have 2 compatibles (and therefore 2 devices) for the
clint? I thought the clint was a single device, of which the mtimer and
mswi bits were just "features"? Having split register ranges isn't a
reason to have two compatibles, so I must be missing something here...

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a0185e15a42f..ae69696c5c75 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -39,6 +39,14 @@ properties:
>                - allwinner,sun20i-d1-clint
>                - thead,th1520-clint
>            - const: thead,c900-clint
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-clint-mtimer
> +          - const: thead,c900-clint-mtimer
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-clint-mswi
> +          - const: thead,c900-clint-mswi
>        - items:
>            - const: sifive,clint0
>            - const: riscv,clint0
> --=20
> 2.25.1
>=20

--fICEAUDlyhHZKV1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqybQAKCRB4tDGHoIJi
0nwMAPsHcRyrWcK5/HTKz0z1+wSi6SzgoFsbknGrh6a5jYYlHgD+JU7YFyCCprIB
/hGbNjowzWOK2ytKYAuzXOWtxM5cLww=
=0tNZ
-----END PGP SIGNATURE-----

--fICEAUDlyhHZKV1g--


--===============8423348597873724975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8423348597873724975==--


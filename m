Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B334CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HlCc1oHFFBu73ZIOz/QHl/fWm3u6aTqeSCvGCaXWYg=; b=eJRVMWDkY+LNTH7lY/kIxkxAAD
	ikCnz+n4nittRue0S6pxl55AEngc+hi9ys1FrTbMn6X2R5ZpGH0TkV2IcTUtVgrCcrpbo6YUaMAmW
	ay5wcjcqDq1qGieqdoBfqmbNVx1Cerohtqrkm25HHS+Z8zna0CqQWo/1cDn1lv3NPpE6Qu0W0aU9I
	nKQmwLEtMynutRXdntCx97qi5frZlvoH8Hqvr0R3O8kPxn8CvaxTlL7CGka8ejJ+YDJ2J8Qy8X87V
	MhMm20uE6cJ7hxj0HsCB27fz2ZxfLtZgC/1rZ123OodCENaMvhD6RCC/WGTCMqf5JK7XzJzFClZx/
	QhuYU2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisas-002I0D-2P;
	Wed, 20 Sep 2023 08:29:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisao-002HzK-2o
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695198595; x=1726734595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nyMKVu9vod9tNMEmwyx3gSYtbDoMLOt3M1Rr2sZH2zY=;
  b=Tp56sofqIAWLGP/s+1yaGd0wyoEE6n/tABOIHCLmkJW5RqDyr45gOFCo
   ULP5IntOwDhPCGgzS7Vj5d7YCmlGqfcWGqOQUW4+g0iDgh8M2UvlXy/Ev
   bjgmjqnFHynw4Y05OyFBt/C33peeGqgoSi8U7hr97HUrsvvkHo9rKhAj1
   jnGKWf4000CXlAHJzfeGXTYHVDRGVaK3Z5GsPpDseEfgZUjhuCfK1AGGw
   YPsxUeYMDkXv9Hp6ylfX1PTJqwCF/OrKue4o3TCqgxMTMrSXr4I/zfMVr
   kmkE7iM9lvstFZXNB/C2fhen5xxAKXqiFGV4umVT3oDErxDpP8HGBxoEF
   g==;
X-CSE-ConnectionGUID: uwDtgCTUQZG+cAIvzWJn1g==
X-CSE-MsgGUID: DsTy1ZruSpOnLkBUCMULjg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5614623"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:29:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:29:11 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:29:08 -0700
Date: Wed, 20 Sep 2023 09:28:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
Message-ID: <20230920-arrival-bonanza-e335686420f4@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012954_921171_0E28CEEB 
X-CRM114-Status: GOOD (  22.92  )
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
Content-Type: multipart/mixed; boundary="===============1050065138201495794=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1050065138201495794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BSKPLc4VDpVkP4tV"
Content-Disposition: inline

--BSKPLc4VDpVkP4tV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Sep 20, 2023 at 02:37:51PM +0800, Chen Wang wrote:
> Add DT binding documentation for the Sophgo SG2042 Soc [1] and the
> Milk-V Pioneer board [2].
>=20
> [1]: https://en.sophgo.com/product/introduce/sg2042.html
> [2]: https://milkv.io/pioneer

Again, link tags please.

> Acked-by: Chao Wei <chao.wei@sophgo.com>
> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>  .../devicetree/bindings/riscv/sophgo.yaml     | 28 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docume=
ntation/devicetree/bindings/riscv/sophgo.yaml
> new file mode 100644
> index 000000000000..82468ae915db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SoC-based boards
> +
> +maintainers:
> +  - Chao Wei <chao.wei@sophgo.com>
> +  - Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> +
> +description:
> +  Sophgo SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - milkv,pioneer
> +          - const: sophgo,sg2042
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..b74d505003e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20063,6 +20063,13 @@ F:	drivers/char/sonypi.c
>  F:	drivers/platform/x86/sony-laptop.c
>  F:	include/linux/sony-laptop.h
> =20
> +SOPHGO DEVICETREES
> +M:	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> +M:	Chao Wei <chao.wei@sophgo.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/sophgo.yaml

> +F:	arch/riscv/boot/dts/sophgo/

Firstly, this directory does not exist at the time of this patch, so it
should not be added here, but rather at the time that you create it.

Secondly, are Xiaoguang Xing and Chao Wei going to monitor the lists &
apply patches for these files? If so, you should add a git tree here
that they will apply patches to & add to linux-next. Also, I'd really
like to see some on-list signs of life from these people, otherwise
I'd rather see your name here instead of theirs.

If they don't intend reviewing/testing/applying patches, I can do it as
a last resort but I would rather that someone who specifically cares for
this hardware does it.

Thanks,
Conor.

> +
>  SOUND
>  M:	Jaroslav Kysela <perex@perex.cz>
>  M:	Takashi Iwai <tiwai@suse.com>
> --=20
> 2.25.1
>=20

--BSKPLc4VDpVkP4tV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqtQwAKCRB4tDGHoIJi
0kX5AQC4Zna3sLu7uodE0Rg/tTR8wp1R00Rc2DIyQwE7eP7W9AD/e7Tbt/dZgoiG
JeTq2cnENLxGBlOD25GciTqNY1C4XQ8=
=T5sB
-----END PGP SIGNATURE-----

--BSKPLc4VDpVkP4tV--


--===============1050065138201495794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1050065138201495794==--


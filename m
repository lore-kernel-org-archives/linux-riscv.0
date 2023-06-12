Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E361C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 07:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1gXRZOT24gRLbaI3GU5S8brzRHZXo+yIwF74q/agVo=; b=nPRw9yFn6H6pyB+JacLSu7z5CJ
	D9IsLBJlOjXsYtb47SCkf5geEY4Ho3p5jixmAwA37bmaV3XNkCKfRhAr6MGHSveUdasCYRTNfICDO
	IxVI9iQKkVKd4jEV07vRs1OCZHqzHnVxNorSDY6DOlB9ooOlJVLjoNn9EZNwD2sHj5HqcaaUMhZDg
	oi23/WbN25C5BvWGhLeKLZ4h9OlxXbA2dm0KGXOfEzTvBMnmWnYBEx7tRoeiZMFaQ8wjfHgHm8uuK
	Ea7U8VXvq7v8aItmR/zB8tw3/0pN4a+NrLDXClaIaasmFkiUM63lH3p6ztpPjmJis6v9CbhQeIZLL
	CUVA46hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8cOQ-002zCV-0k;
	Mon, 12 Jun 2023 07:55:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8cOM-002zBR-1M;
	Mon, 12 Jun 2023 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686556510; x=1718092510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jA7o0JwUUEMJ7PGR+QxIapP6oJQeu3JEWSvSB5PLVFc=;
  b=sqrK6XO8/GjGhkokmlEFu5nE9MJ6RbEyYO3mZ6vYmYIrZUVknUTv4r6c
   CJsoCPrkZA8TvwYHHt0M/9CItpRIggJRKKkmbC0a4SeNHpmAnZdYgyRYO
   LjKitkMtRNKoVDeqRdiSkhfMNlOAb+lX7ntCBh1yDAiW2zqaXzMahoOuh
   RfFfOXQ8dmz8cpPs0TNU5YOqoAWUz6ESVFhLBF94fxmQDabfhrCbNe5yt
   I2nkJRg3k5PZZtzGwrq8rdNZ7p0dAnKse/8rMxiLPTDPKH6AuqL7o8+30
   0n3ML8DmWGE8nC4IU52P3AmPYB7Rgr2ZvlKpKFPBDR8eknPpuvijT8rj5
   A==;
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="asc'?scan'208";a="229595197"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2023 00:55:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 12 Jun 2023 00:55:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 12 Jun 2023 00:55:02 -0700
Date: Mon, 12 Jun 2023 08:54:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
Message-ID: <20230612-wriggle-remindful-89d5105c94ee@wendy>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230612063429.3343061-4-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_005510_666137_99454F9A 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============2169317414334199774=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2169317414334199774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VdbpNF3ZZ/nmLTbI"
Content-Disposition: inline

--VdbpNF3ZZ/nmLTbI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 09:34:19AM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> This patch adds a thermal sensor controller node for the D1/T113s.
> Also it adds a THS calibration data cell and thermal zone.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

The RISC-V patchwork automation is complaining about this patch while
running dtbs_check:
arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: thermal-zones: cpu=
-thermal: 'trips' is a required property
	From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml


Cheers,
Conor.

--VdbpNF3ZZ/nmLTbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIbPPAAKCRB4tDGHoIJi
0ibyAQCc2Wg5AsmDCSijdOu5bt0CIG4+oV84B4Zg3GCvq/B54QEAxeQLtUBX8gk3
dSYcrQQGLBN0lJ0DSEYtSDsFq2awGQU=
=36LZ
-----END PGP SIGNATURE-----

--VdbpNF3ZZ/nmLTbI--


--===============2169317414334199774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2169317414334199774==--


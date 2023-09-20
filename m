Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2755CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZGgPRnf5bHWAHRrmHnuSggxNPbG682cvb2Qj/4apcY=; b=tHUJwBCMbptC2gkSgOEkw9GdQG
	3wd/O2hJTwU9S7DZeU24kp0kpwHZkZjv4zZykZ72L+/vcJlAI5vGJCYhzQf7zfTL9Mj1nLzA3J4Sy
	5QM7KtTpKTsBg8f0k1eDNNBuuYtA+dnVRzwa58SPwHbqdSDUtjEjBL0L6/nNu7M4xQ04J+Y1cS/2a
	MEDKAMXqQM1HiCZvb4frc9obLN/j48ttrG/7wAsPRqX88ARjwv7RykpgnyzxigDW2G763dr+1QIAB
	niekP89IPn6/I+KVTpRs4DDhN8vxi3LZtjDuiLTrICVHhLvoehK6Ky7/KoO4yb5H2FZ4tbX6HtnFX
	Pb1zBfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisPI-002Fox-1E;
	Wed, 20 Sep 2023 08:18:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisPE-002FnO-2c
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695197876; x=1726733876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uscGBvmgvNEc+s+JZQTVBQ0oYKPyV4d4IvX6BfOqdrY=;
  b=Vz7tsd1t2maN06k3klZ2h2vnPTaweja7LR68lKNDLu+sl1bev3iDnjj8
   nB5AD4iNCpJ1FX9wijmiYOXkMMiN17SBTv/NA+Ye4pk5LZP1qK67vOJAS
   63JydekcRDfnnMZRjzDCzZ7Xh2YUh5oCIlu4lXPnsjyYmg91m1KCiqbAo
   Vkd24nVSseqZ7rLrCzHb94MqBLtpCfbzQLIN07eKkNYIUstd2tC4DlYmT
   eSGkSQq0/aGGnwlBp8HF3ouNCAZzi+HRY+NVNJQOb1GsiFeHwMHgAPUn5
   sO0ffn0hdegbisbkcHPtYjO6fNWNK6Hk2tP7l284R3TDJ+ucwzNqqlICx
   w==;
X-CSE-ConnectionGUID: G6ieCjkyQ2aMLIcShOg63A==
X-CSE-MsgGUID: fFvmlZASSraejIWgrHECZg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5607864"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:17:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:17:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:17:10 -0700
Date: Wed, 20 Sep 2023 09:16:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 10/11] riscv: dts: sophgo: add Milk-V Pioneer board
 device tree
Message-ID: <20230920-papyrus-corned-e121fb9dd7b1@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <e9ff83e4fac9a9ebd217ef10e5f8d3260342102b.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <e9ff83e4fac9a9ebd217ef10e5f8d3260342102b.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_011756_911218_FCF6A8CD 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: multipart/mixed; boundary="===============4464577085876058974=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4464577085876058974==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKUtOVTQQHokYjGs"
Content-Disposition: inline

--DKUtOVTQQHokYjGs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Sep 20, 2023 at 02:40:53PM +0800, Chen Wang wrote:
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON
> SG2042 in a standard mATX form factor.

> It is a good
> choice for RISC-V developers and hardware pioneers to
> experience the cutting edge technology of RISC-V.

I'd rather we didn't put advertising into commit messages.

> Currently only support booting into console with only uart
> enabled, other features will be added soon later.
>=20
> [1]: https://milkv.io/pioneer

Make this a link tag please

Link: https://milkv.io/pioneer [1]
> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/Makefile                  |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |  3 +++
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 19 +++++++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
>=20
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index f60a280abb15..94788486f13e 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -6,5 +6,6 @@ subdir-y +=3D renesas
>  subdir-y +=3D sifive
>  subdir-y +=3D starfive
>  subdir-y +=3D thead
> +subdir-y +=3D sophgo

Alphanumerical order please.

Thanks,
Conor.

> =20
>  obj-$(CONFIG_BUILTIN_DTB) :=3D $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/so=
phgo/Makefile
> new file mode 100644
> index 000000000000..5a471b19df22
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
> +
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/r=
iscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> new file mode 100644
> index 000000000000..d6e8c0285d1e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +#include "sg2042.dtsi"
> +
> +/ {
> +	model =3D "Milk-V Pioneer";
> +	compatible =3D "milkv,pioneer", "sophgo,sg2042";
> +
> +	chosen: chosen {
> +		stdout-path =3D "serial0";
> +	};
> +};
> +
> +&uart0 {
> +	status =3D "okay";
> +};
> --=20
> 2.25.1
>=20

--DKUtOVTQQHokYjGs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqqagAKCRB4tDGHoIJi
0kvOAP9pT8N0unm3d9107Xii5Hc5v6uDLVvVjIg3qUcN0aE6swD/ZyuhzMbHo9vI
DVlBtRVexx2a45InVtBHxBpRyfyUrQ0=
=pTAC
-----END PGP SIGNATURE-----

--DKUtOVTQQHokYjGs--


--===============4464577085876058974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4464577085876058974==--


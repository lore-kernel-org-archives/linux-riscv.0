Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5ADCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isUmqyOA0toFC3YiJyKpwXygjwOcHfZpmt+2DGQoWFk=; b=WwdH6rkluY+N8VSUGqb9br9ajQ
	94NO3+zhkvshW86c54o31mNjjrnAW2cOqlG+MYhbO2srmfhAsG2g64omoFD07AcCJRAEv+M47Hghg
	/zmZDahBbzYFJyx1YkGzK0gOtrzVTcLl7XYPeCK8us+b1wFptjsCPJBH2MGJnfBhRIcSVosk6CC3A
	AifDkDdEK/EuD9O94i8REjLjTJLtJNArp7DKua3qGTwQPZ8hZG1Rc4Zf8PX6M+ZrRKkii/rzwXh5P
	Ifh12SMUiJ3zWPdIhSNXBJyu+czyYO0/OcsNcOyM/1pNW2LTmUYjAbRzbvpksNOR8e4R4OCPfhxtM
	IbZXhxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qit26-002MJR-00;
	Wed, 20 Sep 2023 08:58:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qit22-002MIj-2y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695200283; x=1726736283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ed1d9cM1BcvoxV6ZxRjorOLdWZ1sqA4oBf0iYlijwgQ=;
  b=OPmjtkpaMz36YFQPmlXDf0miST4x+5AiKMWK6g49OAc6tVGCZFpLJg7R
   4gxX/f50nWOri7Fr1SyJhsTSHPV1Ht9BLKAoamkCUriKSY/UdMrXp0rSP
   wb9qAkuPRImYqrvSptlo3iMpOBKA3uNUi9NhP+53PnOqcRwYrr98eLVt3
   HyUAQRqAA8mnLYRgZYKKcPeN53cX08SaVZRr/ylYhSH/lKiXTD3uiRw1b
   hcJh/PDkmsmGgHSLrvx3aRMPe00/DWzN6rTGgU3KoBBpVewbqGYU8Oy1Y
   IOl3U6sFoqgr1fiIHFgG+nkmLoWXHGRieXyVgmmX33Diu4H3V/N/JbKCr
   A==;
X-CSE-ConnectionGUID: R1yzmRi2QEWRsOAKowPHkA==
X-CSE-MsgGUID: 5+C1f7NjS82xAa2HU/yskA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5617987"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:58:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:57:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:57:26 -0700
Date: Wed, 20 Sep 2023 09:57:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>, Inochi
 Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 09/11] riscv: dts: add initial SOPHGO SG2042 SoC
 device tree
Message-ID: <20230920-financial-declared-7b4b4baae517@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <ffe6a61a8879232aea7b86ff8aee5d681c6bd287.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_015802_969643_036569C7 
X-CRM114-Status: GOOD (  18.76  )
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
Content-Type: multipart/mixed; boundary="===============3832843400439054154=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3832843400439054154==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZOXOKx9qGwNBd5Ai"
Content-Disposition: inline

--ZOXOKx9qGwNBd5Ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Sep 20, 2023 at 02:40:32PM +0800, Chen Wang wrote:
> Milk-V Pioneer motherboard is powered by SOPHON's SG2042.
>=20
> SG2042 is server grade chip with high performance, low power
> consumption and high data throughput.
> Key features:
> - 64 RISC-V cpu cores which implements IMAFDC

That's not quite true though, is it?

> - 4 cores per cluster, 16 clusters on chip
> - ......

What's a "....."? ;)

>=20
> More info is available at [1].
>=20
> [1]: https://en.sophgo.com/product/introduce/sg2042.html

Link: please.

> Currently only support booting into console with only uart,
> other features will be added soon later.
>=20
> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>

There are 4 sign-offs here. Surely some of these should be
co-developed-bys?

> +		cpu0: cpu@0 {
> +			compatible =3D "thead,c920", "riscv";
> +			device_type =3D "cpu";
> +			riscv,isa =3D "rv64imafdc";

Please also add riscv,isa-base & riscv,isa-extensions.

> +			reg =3D <0>;
> +			i-cache-block-size =3D <64>;
> +			i-cache-size =3D <65536>;
> +			i-cache-sets =3D <512>;
> +			d-cache-block-size =3D <64>;
> +			d-cache-size =3D <65536>;
> +			d-cache-sets =3D <512>;
> +			next-level-cache =3D <&l2_cache0>;
> +			mmu-type =3D "riscv,sv39";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};

> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2042.dtsi
> new file mode 100644
> index 000000000000..747fd9764c95
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT

You should add () around the GPL-2.0 OR MIT.

> +/*
> + * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#include "sg2042-cpus.dtsi"
> +
> +#define SOC_PERIPHERAL_IRQ(nr) (nr)

Why? What does this do? Where was it copied from?

> +
> +/ {
> +	compatible =3D "sophgo,sg2042";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	dma-noncoherent;
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	/* the mem node will be updated by ZSBL. */

huh? So these are random numbers below? Either put something useful here
or delete it please.

> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x00000000 0x00000000 0x00000000>;
> +	};
> +
> +	memory@1 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x00000001 0x00000000 0x00000000>;
> +	};
> +
> +	memory@2 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x00000002 0x00000000 0x00000000>;
> +	};
> +
> +	memory@3 {
> +		device_type =3D "memory";
> +		reg =3D <0x00000000 0x00000003 0x00000000 0x00000000>;
> +	};

> +	soc: soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		clint_mswi: interrupt-controller@7094000000 {
> +			compatible =3D "sophgo,sg2042-clint-mswi", "thead,c900-clint-mswi";
> +			reg =3D <0x00000070 0x94000000 0x00000000 0x00004000>;

& nak to this without further explanation!

Thanks,
Conor.


--ZOXOKx9qGwNBd5Ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqz5QAKCRB4tDGHoIJi
0ntAAQCP/bCm4Ud/m4b/gAZNgI4UwvzEvGzO+vz8teg8pJvQJgEAuiewViY0aMdM
BOvZtgLKHwMi7BpWG3Z0sEWR2p7/WA4=
=NGiv
-----END PGP SIGNATURE-----

--ZOXOKx9qGwNBd5Ai--


--===============3832843400439054154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3832843400439054154==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FB1CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGwmREthRMEdNnViw5hicSBpJTo7oJKbGOo5gWOkWvA=; b=2nYA4Pm72WlpDxKb/UCEBzzZR0
	dPmvjFQAIFga05md8PflspS6qQWUxlHI/kJyfRULSSj86HaUVfmGqHUV04AIrkSA03jtebKXZ0xSy
	ni2szQIG8RXhl9Jf0kZFeA+1M6k7/vXtA/ZBeav0GHJJZWM+YalMKtKq9D/sct9qMcRaqpd6Pcoaz
	U2YVXKPDjBhfOkH6OykfZ7g+gEcpEXpPH/hWSBsOESTPE6wqrkYEUPhnbNsfClQEOXplE7qMuO5Tj
	FFOOcK/jnkagFpfuTTc4EUWPwlXG65IXI1t5fVCMIpg4SxPgj1hyoqtJhE/g0I8hGn6xUy4Fi80wv
	I46EKnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsCZ-000QTH-1J;
	Thu, 12 Oct 2023 09:41:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsCV-000QSM-08
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 09:41:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C5CE6169F;
	Thu, 12 Oct 2023 09:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A3AC433C7;
	Thu, 12 Oct 2023 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697103710;
	bh=nAvxg4KzDTsOzbMCukymkltoz6OpLA5eAEmEqSLDeDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6ukDJkjIGjg/RETfSZR34lITrSLkGjMTs10FWMidORsXst2UcwuhUKktEpHVw/x4
	 KE8uL0+mYE715Q7Njw5fsFQE0Hi5RHgHZB56P+t0h4gKQp7u17NugHvRF6b0gGP2VA
	 PPE+wUXxwnHB/7tLGOVpNta73TM2Z5Z3PWVr3oUsRkmjIxwhEGJSTxy/Wn+mUBaCOS
	 tO9mT4OjYk6y0RjiJ7b+vztMPyu0oSKq0PG5jLxqzNc4go2IwKTS7dEek3Esu6hynr
	 M6ynK6gTSNbbEQoDoqVTKhbLUAeIKiP/y29XFrnrpEY/eiRoHPWgLT56PHV56koSzh
	 yGDofdIX1v2tA==
Date: Thu, 12 Oct 2023 10:41:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] riscv: dts: sophgo: add initial CV1812H SoC
 device tree
Message-ID: <20231012-gratuity-siesta-b9e06b11be43@spud>
References: <MA0P287MB03321A9E3F3D8415DB9552B5FECDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953AD81686694CEA4F5FC6ABBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953AD81686694CEA4F5FC6ABBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_024151_168359_0C985D59 
X-CRM114-Status: GOOD (  20.59  )
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
Content-Type: multipart/mixed; boundary="===============4531581831113152287=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4531581831113152287==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FbIlMY2V77DRQAG0"
Content-Disposition: inline


--FbIlMY2V77DRQAG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 03:53:54PM +0800, Inochi Amaoto wrote:
> >On 2023/10/9 19:26, Inochi Amaoto wrote:
> >> Add initial device tree for the CV1812H RISC-V SoC by SOPHGO.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> ---
> >>   arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 36 +++++++++++++++++++++++=
++
> >>   1 file changed, 36 insertions(+)
> >>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> >>
> >> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot=
/dts/sophgo/cv1812h.dtsi
> >> new file mode 100644
> >> index 000000000000..3864d34b0100
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> >> @@ -0,0 +1,36 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/*
> >> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >This include is not required.
>=20
> Thx.

I can drop this include on application. Is the rest of the series okay
with you Chen Wang?

Thanks,
Conor.

>=20
> >> +#include "cv180x.dtsi"
> >> +
> >> +/ {
> >> +    compatible =3D "sophgo,cv1812h";
> >> +
> >> +    memory@80000000 {
> >> +        device_type =3D "memory";
> >> +        reg =3D <0x80000000 0x10000000>;
> >> +    };
> >What's this defined for , I see this is different against cv1800b.
>=20
> CV1812h have a embedded 256MB RAM. The cv1800b is 64MB, This is why the
> size is different. I write this node here because the RAM is embedded
> and fixed size, and leave it in the board DT is unnecessary.
>=20
> >> +
> >> +    soc {
> >> +        interrupt-parent =3D <&plic>;
> >> +
> >> +        plic: interrupt-controller@70000000 {
> >> +            compatible =3D "sophgo,cv1812h-plic", "thead,c900-plic";
> >> +            reg =3D <0x70000000 0x4000000>;
> >> +            interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> >> +            interrupt-controller;
> >> +            #address-cells =3D <0>;
> >> +            #interrupt-cells =3D <2>;
> >> +            riscv,ndev =3D <101>;
> >> +        };
> >> +
> >> +        clint: timer@74000000 {
> >> +            compatible =3D "sophgo,cv1812h-clint", "thead,c900-clint";
> >> +            reg =3D <0x74000000 0x10000>;
> >> +            interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> >> +        };
> >> +    };
> >> +};
> >> --
> >> 2.42.0
> >>
> >

--FbIlMY2V77DRQAG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSe/WQAKCRB4tDGHoIJi
0v+pAP4ikxNXQFMmYKQCRI/ErSVgvlUuINpu2o2hajLuAX07cgEArhvqcOM2wd87
QPOM8fdmk7XQQ2hWX5EpJjl9qMH89gQ=
=JHNn
-----END PGP SIGNATURE-----

--FbIlMY2V77DRQAG0--


--===============4531581831113152287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4531581831113152287==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3827E7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JI1RYujcHt/oCRBgcKu3Of6Dc16v2wRV+Hrz5LO/11g=; b=snsKy6e+prmjCRSU5gfbhynKZC
	vD2ZLG7RrP7uVb1Y5mhO3QduBh1dPeozY1oZW12XpexSUvpe/TQq5TRsexLoSsUYcC2RcQ4imFKQc
	0fSMHS4VC9VF4bugXYUsjziHaD/KnDhv8j12oENYPKz/9RCzPygRnrpfH23d3ISShkKs3Spm43cVm
	VnpKf//pv4IfbhYMfMrLfjxkSn6knG3we4q5scGG/cl52Pq/pZUt2DS8o7q8mJ6YyudBdxibfEcGt
	as4TJ0O370RQZcCmxULmVPRfgejd9qF0+AtdY/nPbKCAfZi3kEQFDug7SmD8yCdn05yQkA8cFdlu0
	ofx5UwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkm-00CfyL-1B;
	Mon, 02 Oct 2023 12:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHk9-00CexP-18
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D68260DFC;
	Mon,  2 Oct 2023 12:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D81DC433C9;
	Mon,  2 Oct 2023 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696248583;
	bh=XF2JWUI7upFEWvpMLleiS+AFi4n6n/o2bBoXGwL6lk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BecpC1VYEdSlAGMnwJk1z8khG//CgJLN0SwRus9GT82CKiB7g/tbumWSmDLt0FJke
	 oLiLsb8Vb4QWoTjlHWfOrKu7z5MGtTb086eMcu1FWrGG+Sio6gs18EwlMaHt0aG0Hj
	 bwXKNTQuOsAjQ6aBI4WQYiuZiUGZeKKSYu4mfMVEXgPMxXazT5mm77UwSV4L40cEbh
	 Htp754cmmiGJoyjKjbiwPisxe6JPTbpXHD1KNI1fBF0goFDGAs2tLAExKbsstW99U1
	 nu6BrQyyDn/M7NR7BM2SqqRcUNWhqGtLONpWzVVbODbuslYRijBSqz/s2JUNbMPq7r
	 6CaR5wQk84OOA==
Date: Mon, 2 Oct 2023 13:09:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Message-ID: <20231002-pessimism-sycamore-a854a098cf43@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230930123937.1551-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050945_579559_4AF9FD66 
X-CRM114-Status: GOOD (  19.01  )
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
Content-Type: multipart/mixed; boundary="===============3482898664578516044=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3482898664578516044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ADpDYkm6P9PW77/"
Content-Disposition: inline


--7ADpDYkm6P9PW77/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 08:39:36PM +0800, Jisheng Zhang wrote:
> Add initial device tree for the CV1800B RISC-V SoC by SOPHGO.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 117 ++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dt=
s/sophgo/cv1800b.dtsi
> new file mode 100644
> index 000000000000..8829bebaa017
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible =3D "sophgo,cv1800b";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus: cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		timebase-frequency =3D <25000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "thead,c906", "riscv";
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <512>;
> +			d-cache-size =3D <65536>;
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <128>;
> +			i-cache-size =3D <32768>;
> +			mmu-type =3D "riscv,sv39";
> +			riscv,isa =3D "rv64imafdc";
> +			riscv,isa-base =3D "rv64i";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> +					       "zifencei", "zihpm";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#address-cells =3D <0>;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};
> +	};
> +
> +	osc: oscillator {
> +		compatible =3D "fixed-clock";
> +		clock-output-names =3D "osc_25m";
> +		#clock-cells =3D <0>;
> +	};

Is this a stub that will later be replaced by a real clock controller
node, or is this actually a fixed oscillator? If it is the former, could
you add it to the commit message if there is a respin?

Thanks,
Conor.

--7ADpDYkm6P9PW77/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRqzAQAKCRB4tDGHoIJi
0pUpAQCeg85iTvHhxt7N5JpBUouXbz8728VXeHIyIz55IAQEtQEAgvB4/xg9EGuu
tvn8dqb7SzCgq/xW6fGN6uoZFBmJUQI=
=Jjvq
-----END PGP SIGNATURE-----

--7ADpDYkm6P9PW77/--


--===============3482898664578516044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3482898664578516044==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E610C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkhvXHIsSAgSHV4C1O7mCq4U//R4h3maeEOMhbDC51g=; b=UiQDyKCbOtgWh2wcO88UXWXmFz
	vUXbq3KXdOYCZpFUr8mLCxiQ4q47Bj8LyNKkTq2dZTl8KPEoum+K7XikhwNwvIsiNBt+cx7ewLKfW
	VYQnCTGo/IylSRDHrxWePgurVysOJ7ztcyddjLj42IJvA4nILc8FN5aO2n5uaXZIfaBYmGSFBE/Et
	Iq/E4RV2t1VzwUj7smX56Z18Y08nuaHZREBUnymnG5Jbra/G0wtMUojv7Ok9PXuizpaV/5jHL6CBy
	dPY04KpFidQe0ZLbGME6OHsLffNHiEAkGITje5Po7fr56ZrTB8xdyDCnMku43EOeTrW62RWCK+2sz
	zHkPNNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3Hk-0000000162p-3x6A;
	Thu, 25 Jan 2024 17:13:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3Hi-0000000161C-0GkA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3C414CE3420;
	Thu, 25 Jan 2024 17:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020FAC433F1;
	Thu, 25 Jan 2024 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706202779;
	bh=P8twLiBk8195NVVkVBNtmDPSljomu/5qIfayjD6vnKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffDXEQ6xe5Oc09Q0Ks5MWZFNjI/ryOga9U0VvRre4UlZEsa4bu1C1FXVa6Kf3v4qP
	 P8E/TALOBWSYRQd5NsV2L5zUqy4jO7BVVip0OWlmeyLMgqtw55dnQGKSOpNFTFMqqR
	 Fp8KqNxBzSziJSwDZdZEx7JJUL12SiHu9misY+GkRJBqdgG1zwLfsSeOWHkTeFNexM
	 Ahi5B3AJZf0vRBV3NRRn4YuJ5SB+VZqA0fRwsWGfJVi2hH8UJ7JFTSwvnye1xjr+BO
	 yg5sTt5RbpjbV9x6hUkNkW1WDlzfJIZqyudzyT/UtsrbgL+5xT0If1FURMZAkirwTy
	 Pc9SwmnCEFYtA==
Date: Thu, 25 Jan 2024 17:12:54 +0000
From: Conor Dooley <conor@kernel.org>
To: AnnanLiu <annan.liu.xdu@outlook.com>
Cc: chao.wei@sophgo.com, unicorn_wang@outlook.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add timer dt node for CV1800
Message-ID: <20240125-rosy-folk-976dd297e32f@spud>
References: <DM6PR20MB23167ABF18C1F004A5710D4FAB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR20MB23167ABF18C1F004A5710D4FAB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_091302_319340_335AFF81 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Type: multipart/mixed; boundary="===============0552586087020425047=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0552586087020425047==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U7ZAB6TpsVs6HOXN"
Content-Disposition: inline


--U7ZAB6TpsVs6HOXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 05:46:23PM +0800, AnnanLiu wrote:
> Add the timer device tree node to CV1800 SoC.
>=20
> Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> ---
> This patch depends on the clk driver and reset driver.
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR2=
0MB4953.namprd20.prod.outlook.com/
> Reset driver link:
> https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/
>=20
> Changes since v1:
> - Change the status of the timer from disabled to okay.
> v1 link:
> https://lore.kernel.org/all/DM6PR20MB23167E08FCA546D6C1899CB1AB9EA@DM6PR2=
0MB2316.namprd20.prod.outlook.com/
>=20
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 73 +++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dt=
s/sophgo/cv1800b.dtsi
> index aec6401a467b..aef7970af2b8 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2024 Annan Liu <annan.liu.xdu@outlook.com>
>   */
> =20
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -113,6 +114,78 @@ plic: interrupt-controller@70000000 {
>  			riscv,ndev =3D <101>;
>  		};
> =20
> +		timer0: timer@030a0000 {
> +			compatible =3D "snps,dw-apb-timer";
> +			reg =3D <0x030a0000 0x14>;
> +			interrupts =3D <79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc>;
> +			resets =3D <&rst RST_TIMER0>;
> +			status =3D "okay";

Do these really have no interface clock? I'd expect something that
is almost certainly sitting on a apb (or similar) interface to have one.

Thanks,
Conor.

--U7ZAB6TpsVs6HOXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKWlgAKCRB4tDGHoIJi
0vpGAP9NN4LPvUxivpiccMxrAPRFKuRn7nj+iQE9H6tZd0YdzAEAjWezQmZEkdEt
fL6gE5liQ4NsH5TG4cdJc7SJ9zAU2gk=
=yJSK
-----END PGP SIGNATURE-----

--U7ZAB6TpsVs6HOXN--


--===============0552586087020425047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0552586087020425047==--


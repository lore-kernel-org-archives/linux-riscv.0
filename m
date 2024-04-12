Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E29BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhG7EOEbTPSqd8WqRR/sWCcKO0vHnBAbXnjDY28l5gI=; b=pkTWlZHd5lasEeIOUE09EddmSg
	xit0rIG5FuE4J6dnrsygsQjApOr7/mvQlf6PUbfGveaXDabzN+5mNX0xfB/WVJat4Lj+Uhp2LGCOA
	e8ycpcEoxom+pp6ZK08+S605vBrzRDcqz12T3XxPJx658rz5BgCKjNCoE/AelLl992i4Fkq4hZD7P
	nzcZjam3Pr2h93vvxjvb+DqX+A3VV0hOdqN+0jxdkDMGrdwp0whkUuS3omEl4DNb2Ayy625/hBT2D
	JoWSCVYcvIm/KeOGu94XhZxFia46c1Rm4HNbDbyD7m0/y5zux5ZhmP+eTuhwSxZOHpDct5ggkud/q
	ue+QmdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF8X-0000000GwBN-1rgN;
	Fri, 12 Apr 2024 11:32:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF8T-0000000Gw9r-28m8;
	Fri, 12 Apr 2024 11:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712921521; x=1744457521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BzJrqDFA6AyqBMFADduzWLtGiHXrJzqR3kUA+iQC510=;
  b=hToX5BP4SXoVMNvZRVi/Ay/pxg591xwePZJ7/MAzhm2s4jqZ920kP/f+
   3Iu28KTiGaFX94vqs1C1gMK/DvHdOAVDOKRLI/hR/8LBUOYHuT2MN4JpY
   0+9nC81MiU8+FidMEi2F2VzZCey2++hjmbEebHTaMRemtUGY36D27g7Sn
   FZ/YlM6bzPm3PMNaDowVXJA/XGdwhztRhrrNKY8M/G2BMUxj1chh0zGEd
   6cOS7LkolPn4uQ3KvdD0z3tH8plkHNSD+5auPAgs4FgwoT53xNUmqz5yf
   fLC5MVSh1AaHkme6IDXAxiB5EPHMBq5bOH44w/90qW7mwX9GJM/A8iGl5
   w==;
X-CSE-ConnectionGUID: VphaOc2hTpGpkTSDHvpbiw==
X-CSE-MsgGUID: V1pgwBcRSfihNzKAqHlD4Q==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20733274"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 04:32:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 04:31:27 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 04:31:23 -0700
Date: Fri, 12 Apr 2024 12:30:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <20240412-thirty-sacrament-db052c7fe6fe@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_043201_611597_421B6085 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Type: multipart/mixed; boundary="===============2514903551697878473=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2514903551697878473==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zwcSHVZLwjxefjz8"
Content-Disposition: inline

--zwcSHVZLwjxefjz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> These definitions didn't fit anywhere nicely, so create a new file to
> house various xtheadvector instruction encodings.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/a=
sm/xtheadvector.h
> new file mode 100644
> index 000000000000..348263ea164c
> --- /dev/null
> +++ b/arch/riscv/include/asm/xtheadvector.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an old=
er
> + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> + * vsetvli	t4, x0, e8, m8, d1
> + */
> +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> +
> +/*
> + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> + * the call resulting in a different encoding and then using a value for
> + * the "mop" field that is not part of vector-0.7.1
> + * So encode specific variants for vstate_save and _restore.

This wording seems oddly familiar to me, did Heiko not write this?

> + */
> +#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
> +#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
> +#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
> +#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
> +#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
> +#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
> +#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
> +#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
>=20
> --=20
> 2.44.0
>=20

--zwcSHVZLwjxefjz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkbWAAKCRB4tDGHoIJi
0nL6AQCJkh59MUri2maEyaJ1kO+VFKtPc14IkIZHwM9bajqXywD+Jf+vDHMGA2cu
5IE2w9WyYjd8dq+NtRxdy9fp8qwtqQE=
=mofk
-----END PGP SIGNATURE-----

--zwcSHVZLwjxefjz8--


--===============2514903551697878473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2514903551697878473==--


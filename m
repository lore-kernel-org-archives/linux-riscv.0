Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AE0C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRg6d2WmRpnEOJGF2yjPeVTiHAbgluDaS7Enu5CFyHU=; b=vzG2EzipPkOns4oVx4d4rbTLgY
	jqQnIAJfkTnfrMQZHxP+KZKheOIclLH3obURQx8HuCITzVY5HjlnrYbPsFJpLqrxkfLYaXCk7sUSg
	vrdEBdPC6WEzmpbQ5d+KB7rDjLHC21qfM+8LQCSNNS73FmKPz17ZV1/fdCGqxyLtun5J/gT9CdgDm
	pmbbxqkWmkXFl2m8665NudBcNGNVfWlWypuXbfRqfFL0PTMjvfS3jsIyKHBL0wyD/dcj10nE3QV7z
	XKENaiAKrnWbu28QE3/qTxDR2P8fWTwmOhl+z5adVLNXnFCzrXpARSqsUXPeunXxaWGphTgymFcsS
	l19fjWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFEm-0000000Gyhw-1nmK;
	Fri, 12 Apr 2024 11:38:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFEi-0000000GyfM-1D1H;
	Fri, 12 Apr 2024 11:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712921908; x=1744457908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aWPWXWwePYJ7mcthXXcnh6W3EMOk6ujdepGmdYxSc0c=;
  b=B4ybTsXFVrSB7obR05QAb5IRs7584qdbH4++gFBdVj1o6VZ1GfDS8Irv
   ePwPuu8FILMnb3ZHUU+FAnj/rvxWpr6TGXCL48kFh73NFnNGXWNRErmgw
   DFPE+XUOoVsl9f1hajG8b9N47NMY8JVfslhQcs70iCuqzLIANti+pLrkQ
   BH7d6NeZCu68DKm3qih8nDAx5Y+E0IXTbRr27q5iAF7pKBnxTv91dktKU
   BBbZjnsR4cF6DXhPBFGlSJGM0E4lul8NbajMJIzeCTpi1BNZciYjNZFvv
   mX9zvcFKwFQauGWYd5XPAYDskpGoXSwQnLr2o+zCctuVpKn6Gpzvhrcq9
   Q==;
X-CSE-ConnectionGUID: ++lz7ARxTeyfeBIEUobjog==
X-CSE-MsgGUID: KH8PpH+1RGyAV72cISUUNA==
X-IronPort-AV: E=Sophos;i="6.07,196,1708412400"; 
   d="asc'?scan'208";a="20734020"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 04:38:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 04:38:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 04:37:59 -0700
Date: Fri, 12 Apr 2024 12:37:08 +0100
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
Subject: Re: [PATCH 15/19] riscv: hwcap: Add v to hwcap if xtheadvector
 enabled
Message-ID: <20240412-thrill-amnesty-019897f21466@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-15-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-15-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_043828_395905_DBF7664C 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Type: multipart/mixed; boundary="===============4452045972515715044=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4452045972515715044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibtP5+Ck2kdPiHYk"
Content-Disposition: inline

--ibtP5+Ck2kdPiHYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:21PM -0700, Charlie Jenkins wrote:
> xtheadvector is not vector 1.0 compatible, but it can leverage all of
> the same save/restore routines as vector plus
> riscv_v_first_use_handler(). vector 1.0 and xtheadvector are mutually
> exclusive so there is no risk of overlap.

I think this not okay to do - if a program checks hwcap to see if vector
is supported they'll get told it is on T-Head system where only the 0.7.1
is.

>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 41a4d2028428..59f628b1341c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -647,9 +647,13 @@ static void __init riscv_fill_hwcap_from_isa_string(=
unsigned long *isa2hwcap)
>  		 * Many vendors with T-Head CPU cores which implement the 0.7.1
>  		 * version of the vector specification put "v" into their DTs.
>  		 * CPU cores with the ratified spec will contain non-zero
> -		 * marchid.
> +		 * marchid. Only allow "v" to be set if xtheadvector is present.
>  		 */
> -		if (acpi_disabled && this_vendorid =3D=3D THEAD_VENDOR_ID &&
> +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
> +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> +			this_hwcap |=3D isa2hwcap[RISCV_ISA_EXT_v];
> +			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> +		} else if (acpi_disabled && this_vendorid =3D=3D THEAD_VENDOR_ID &&
>  		    this_archid =3D=3D 0x0) {
>  			this_hwcap &=3D ~isa2hwcap[RISCV_ISA_EXT_v];
>  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> @@ -776,6 +780,15 @@ static int __init riscv_fill_hwcap_from_ext_list(uns=
igned long *isa2hwcap)
> =20
>  		of_node_put(cpu_node);
> =20
> +		/*
> +		 * Enable kernel vector routines if xtheadvector is present
> +		 */
> +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
> +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> +			this_hwcap |=3D isa2hwcap[RISCV_ISA_EXT_v];
> +			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> +		}
> +
>  		/*
>  		 * All "okay" harts should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't.
>=20
> --=20
> 2.44.0
>=20

--ibtP5+Ck2kdPiHYk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkc5AAKCRB4tDGHoIJi
0gKCAP4v+esN57jD+BTAcXXG/qusYjMQbk1rVAldJniCgV0x0gEAibLnaoOuNXqF
Pa0786aCvAvHYTWbBfJ/ykNix6NyKQI=
=b/XX
-----END PGP SIGNATURE-----

--ibtP5+Ck2kdPiHYk--


--===============4452045972515715044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4452045972515715044==--


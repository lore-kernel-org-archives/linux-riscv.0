Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1BEC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8dNmvo/4EkAK31rTLxjhbu21IIgHngcx9tNiyZHz0E=; b=nfwvDhDg7oSoAwawgGIq+f2k4C
	yf+b3VfilaWPXYudwsrnYSTb6ze4+IasU44qrBJUaYWOleywDd54/BxM5ZgHeIIL8/aNh8cvfmEdn
	F6hkwyU0QG++8LJ6fc6bZhQGoColIjWMAcAxWxSbe+E+BHbj0//MMNc4daVidxU+EmNnZL/K5DQ/h
	MMzXfYuyE+NIScwguVrTRlzq226neS989OvZzDAIc7owdtOTJ2AzJiJtmIXn9A+ov0+2FcYVZU4lZ
	3WT8vaRu664LHLGWqxU9FKpP1ffsOlzaHdzZjDlgBYcgJqCg6L7Pt5yBgjHB0VmvkNXHAYoFTBAde
	vLjHTUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvENE-0000000GlIo-18q4;
	Fri, 12 Apr 2024 10:43:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvEM7-0000000Gksk-3Syg;
	Fri, 12 Apr 2024 10:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712918524; x=1744454524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/p/ft+IL0tus7dW1yBsZJutmsAr0uojLmY1LWYjZes=;
  b=GJNxqNCOgW14345HFh2W//scsLVA5YXzVszRvY5ns/CCFepjKdJ2fyK4
   jRN00EWC47Y3OQcvTDu++GS0E8OQ+q9Z3uMa789dHSCLAGi7YQsZ06ndy
   kbljM56PtNzPcdVWhf9d4xxkXsJf4IiyCexleQhs59Ava6+UG8KhfDTnN
   gKR8+7m9oG09u/RZx1gfEbYy/d2VrYOzvg81llx8IOwLaz6pgesBLKxKW
   hupzj1RqqWVDusfd2C9vJFZ6eg1D+ZkHBO+D1mKFiAHZW0QDNfortM35R
   jbbkEhrwBcNanlSikW/7BvC+yrSjynU2t/eSvFy2NXHALA3nlec62dlhk
   g==;
X-CSE-ConnectionGUID: tAWyHYMtQVGntX8nk/B7jA==
X-CSE-MsgGUID: 13SAqUUaRYm44u3/FKnbdQ==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20728192"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 03:42:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 03:41:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 03:41:29 -0700
Date: Fri, 12 Apr 2024 11:40:38 +0100
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
Subject: Re: [PATCH 07/19] riscv: Optimize
 riscv_cpu_isa_extension_(un)likely()
Message-ID: <20240412-aerosol-heritage-cec1eca172fb@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-7-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-7-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_034204_073770_7ECA8B9D 
X-CRM114-Status: GOOD (  17.25  )
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
Content-Type: multipart/mixed; boundary="===============8214154448078375214=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8214154448078375214==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YUt35LWoARaS+0kq"
Content-Disposition: inline

--YUt35LWoARaS+0kq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:13PM -0700, Charlie Jenkins wrote:
> When alternatives are disabled, riscv_cpu_isa_extension_(un)likely()
> checks if the current cpu supports the selected extension if not all
> cpus support the extension. It is sufficient to only check if the
> current cpu supports the extension.
>=20
> The alternatives code to handle if all cpus support an extension is
> factored out into a new function to support this.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---

>  static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, co=
nst unsigned long ext)
>  {
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikel=
y(ext))
> -		return true;
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> +			   "ext must be < RISCV_ISA_EXT_MAX");
> =20
> -	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && __riscv_has_extension_unlik=
ely_alternatives(ext))
> +		return true;
> +	else
> +		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>  }

static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const u=
nsigned long ext)
{
	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext=
))
		return true;

	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
}

This is the code as things stand. If alternatives are disabled, the if
statement becomes if (0 && foo) which will lead to the function call
getting constant folded away and all you end up with is the call to
__riscv_isa_extension_available(). Unless I am missing something, I don't
think this patch has any affect?

Thanks,
Conor.


--YUt35LWoARaS+0kq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkPpgAKCRB4tDGHoIJi
0gSNAQC+oMqT7zoEL9RxUhkl7uImpatcHajgjd6QJ8PnV2xTcgD/YMRe1XytJnd7
9pJBNiy2EcDN51fcQvf7s4vI9GM9Awc=
=Tq3D
-----END PGP SIGNATURE-----

--YUt35LWoARaS+0kq--


--===============8214154448078375214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8214154448078375214==--


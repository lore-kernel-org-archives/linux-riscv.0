Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AEEC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktq7Q1Y66TxEsnHKhpDq65ldyBOmpsOpqoAeCWg9ugg=; b=n08pTSm0qZ8Arqr7dj0J3ddKtu
	BzbmyYZfOElP7CeLH2b7qNS1b6JDGg35dQ94V83gaVypW3A5cYM0IBfaectFIYNhVr4XM7d+Ny+vh
	ZABpWsOB4kdH5YsYE4HJqLLmo6VrhoWKwoWy4d2V2fXTJQvvsnYucnF25DhAqy+5f0XAHiPm2W6rz
	lFjbc3pCxbN0xVflFBsy/gIWUBdg1BNoJSzwVhp4IFcctsYKXKuyzFGYPCissSeG8yUt64eLA8G6Y
	nkozHWeNA0iFyInPx5Ca3JaN1A+4vcz2yrkO/rlR/d7LiocGKtnAbkQU2+01jyZfY96FpUs3PJLxg
	ZZ04kK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryq5b-0000000Cw1F-19es;
	Mon, 22 Apr 2024 09:35:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryq5Y-0000000Cw0a-2oSp;
	Mon, 22 Apr 2024 09:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713778552; x=1745314552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=677JTIwL5UswqAMre8oBa/Ouum0+FEfuPU/W+YYnR/8=;
  b=rS/PaR6fwFAObfBQW1P5kIff1ACrDyPi+Zd+eVQCuduSOPji1dCO0tfx
   gDktEKO0QsuPj1ZWmNmuYAnG2it71Mk5UfsA56Yp9/cgm4/P22RsDLG+Y
   5tfFa0v9KkGBXl6Tq7zC7euAklfowe5sFkHWgScl62N8l3EoXaOmLYzpR
   HZNQdNQ7BFkf6amqOcGwVp5VlBiM+3pNhZDECBccdA6Sps6+D+tENNMeu
   IuUdZsCYzeUMhw7g+5nAKALXFRbm8KzdzIXT8GR7ukjn+gEMS7GdVSN4o
   hEmmfuyVJ3tfhkTzBhmggpOX2fiZMC5oEjY4oW2Ty9a7ZWab7kjvrErlb
   A==;
X-CSE-ConnectionGUID: pUtzPF9AQeyO8Y9fcaMWRA==
X-CSE-MsgGUID: RbrRuDOgRGGKP/iBnvhOVQ==
X-IronPort-AV: E=Sophos;i="6.07,220,1708412400"; 
   d="asc'?scan'208";a="22042204"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Apr 2024 02:35:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 02:35:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Apr 2024 02:35:37 -0700
Date: Mon, 22 Apr 2024 10:35:21 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel
	<anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, Atish Patra
	<atishp@atishpatra.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240422-daylight-sassy-ff3b0d867fef@wendy>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
 <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_023552_924601_E8E26F9E 
X-CRM114-Status: GOOD (  21.17  )
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
Content-Type: multipart/mixed; boundary="===============5984138321105285722=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5984138321105285722==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qeeS7kj0r9HsIAfv"
Content-Disposition: inline

--qeeS7kj0r9HsIAfv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 10:53:10AM +0200, Cl=E9ment L=E9ger wrote:
> On 19/04/2024 17:51, Conor Dooley wrote:
> > On Thu, Apr 18, 2024 at 02:42:27PM +0200, Cl=E9ment L=E9ger wrote:
> >> The Zc* standard extension for code reduction introduces new extension=
s.
> >> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> >> are left out of this patch since they are targeting microcontrollers/
> >> embedded CPUs instead of application processors.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/include/asm/hwcap.h | 4 ++++
> >>  arch/riscv/kernel/cpufeature.c | 4 ++++
> >>  2 files changed, 8 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/h=
wcap.h
> >> index 543e3ea2da0e..b7551bad341b 100644
> >> --- a/arch/riscv/include/asm/hwcap.h
> >> +++ b/arch/riscv/include/asm/hwcap.h
> >> @@ -82,6 +82,10 @@
> >>  #define RISCV_ISA_EXT_ZACAS		73
> >>  #define RISCV_ISA_EXT_XANDESPMU		74
> >>  #define RISCV_ISA_EXT_ZIMOP		75
> >> +#define RISCV_ISA_EXT_ZCA		76
> >> +#define RISCV_ISA_EXT_ZCB		77
> >> +#define RISCV_ISA_EXT_ZCD		78
> >> +#define RISCV_ISA_EXT_ZCF		79
> >> =20
> >>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >> =20
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufea=
ture.c
> >> index 115ba001f1bc..09dee071274d 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> >> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> >> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> >> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> >> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> >>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> >>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> >=20
> > Ye, this looks exactly like what I "feared".
>=20
> Ok but for instance, Qemu actually set Zc* based on C/F/D. So the ISA
> string containing theses dependencies should actually also be allowed.
> So should we simply ignore them in the ISA string and always do our own
> "post-processing" based on C/F/D?

I'm not familiar with the contents of all of these extensions, but I
assume the reasoning for splitting them out is that you can implement
them but not maybe not implement C (or something similar)? If that's the
case, you cannot always imply.

--qeeS7kj0r9HsIAfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiYvWQAKCRB4tDGHoIJi
0tQCAP9mC34KZI4RlzykLZZJcqOkhj2mcUcNSSr/RaK9eFBoxQEA2vpvtlw6ZDsy
MIBjOz/mpW/guSx4/dUBlp9zwuIycAA=
=vD9i
-----END PGP SIGNATURE-----

--qeeS7kj0r9HsIAfv--


--===============5984138321105285722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5984138321105285722==--


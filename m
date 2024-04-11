Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E077CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGMoTvbcFYB1IcqiYCKyPJmMzwzMoVSeKv8HQYLB+oE=; b=OWlZe3XDR+9mJq3pG5FLvxFQO4
	KMyDZKT6fMEkB1UT8XU2hQJJo755XGZBJ0+61o+biLiQy+iNiJdk2/F+4HIx8U8wLq3flmAk/5GKN
	n8B32eQEbseD5YiiBobDoBA7g2FsnupVVykd0pa3leVhoCuu9VaufC8kv0BloY1Z2CJS60SJZhtiF
	S1QYUTNOqrcG6UBY6NDZ+P/iFkTdgyjLi4qTcZZDlHXd/h5CVX1w2M9KdwAwKnp7/cRwhyZGt0eSM
	z33hbwGQmLQtLOSZdq1ya462atJpINOHlSZDpVsYyXcvBU8vXpVQSz8fsh9M+6v3Dxwo/dV9+yenl
	0Z9nPNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqLo-0000000BE5o-1lBo;
	Thu, 11 Apr 2024 09:04:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqLl-0000000BE4K-3zIr;
	Thu, 11 Apr 2024 09:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712826246; x=1744362246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6TmusjUX3vnMkNQepVsH4u+5hT3VrOI3o3ZMH1yhilU=;
  b=iQAXbpI65hAUCmj7EDK6SmAQz3XXURaq7fKT6rNSapjXXtHJ/YMPDENR
   1GHmAFrr+ARx7RvBn1SRWa9l6kB0qU0LxZhbL1cVxP21Xt4ofV/SxrV1w
   jEQDRCrxx6HKHc1eVpxZ4tPBEw7opPa/2biOb+UBntE9m+s7z8Z0ypVDV
   eWtXHE9JXYS2V1hktsjcomH9+HBul7NM0i6Hr6rCTyhc4WlXsjpyC7tWm
   ooIjxIUZ/dGobpq3MAimti6Hs/mry4BAqrnL3sP4AJ2t61V5CFLX7XCjD
   fsE0KnHsdf2X46WDXte2qNpJL3gJZPhMWu36FqrVb2pf+gDEiRey5HpvE
   w==;
X-CSE-ConnectionGUID: sBUxEcpYQIqblsPw1hMyfQ==
X-CSE-MsgGUID: 6LquUSg4QDGyfAHGclQ3bA==
X-IronPort-AV: E=Sophos;i="6.07,193,1708412400"; 
   d="asc'?scan'208";a="21080514"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2024 02:04:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 02:03:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 02:03:53 -0700
Date: Thu, 11 Apr 2024 10:03:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, Shuah
 Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <20240411-superglue-errant-b32e5118695f@wendy>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_020406_052254_8B56D7E5 
X-CRM114-Status: GOOD (  29.44  )
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
Content-Type: multipart/mixed; boundary="===============6479014909214162830=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6479014909214162830==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4EMZ8FslzLz1hx5z"
Content-Disposition: inline

--4EMZ8FslzLz1hx5z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:25:06AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 11/04/2024 00:32, Deepak Gupta wrote:
> > On Wed, Apr 10, 2024 at 11:27:16PM +0100, Conor Dooley wrote:
> >> On Wed, Apr 10, 2024 at 11:16:11PM +0100, Conor Dooley wrote:
> >>> On Wed, Apr 10, 2024 at 02:32:41PM -0700, Deepak Gupta wrote:
> >>> > On Wed, Apr 10, 2024 at 11:11:00AM +0200, Cl=E9ment L=E9ger wrote:
> >>> > > Add parsing for Zcmop ISA extension which was ratified in commit
> >>> > > b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
> >>> > >
> >>> > > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >>> > > ---
> >>> > > arch/riscv/include/asm/hwcap.h | 1 +
> >>> > > arch/riscv/kernel/cpufeature.c | 1 +
> >>> > > 2 files changed, 2 insertions(+)
> >>> > >
> >>> > > diff --git a/arch/riscv/include/asm/hwcap.h
> >>> b/arch/riscv/include/asm/hwcap.h
> >>> > > index b7551bad341b..cff7660de268 100644
> >>> > > --- a/arch/riscv/include/asm/hwcap.h
> >>> > > +++ b/arch/riscv/include/asm/hwcap.h
> >>> > > @@ -86,6 +86,7 @@
> >>> > > #define RISCV_ISA_EXT_ZCB=A0=A0=A0=A0=A0=A0=A0 77
> >>> > > #define RISCV_ISA_EXT_ZCD=A0=A0=A0=A0=A0=A0=A0 78
> >>> > > #define RISCV_ISA_EXT_ZCF=A0=A0=A0=A0=A0=A0=A0 79
> >>> > > +#define RISCV_ISA_EXT_ZCMOP=A0=A0=A0=A0=A0=A0=A0 80
> >>> > >
> >>> > > #define RISCV_ISA_EXT_XLINUXENVCFG=A0=A0=A0 127
> >>> > >
> >>> > > diff --git a/arch/riscv/kernel/cpufeature.c
> >>> b/arch/riscv/kernel/cpufeature.c
> >>> > > index 09dee071274d..f1450cd7231e 100644
> >>> > > --- a/arch/riscv/kernel/cpufeature.c
> >>> > > +++ b/arch/riscv/kernel/cpufeature.c
> >>> > > @@ -265,6 +265,7 @@ const struct riscv_isa_ext_data
> >>> riscv_isa_ext[] =3D {
> >>> > >=A0=A0=A0=A0 __RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> >>> > >=A0=A0=A0=A0 __RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> >>> > >=A0=A0=A0=A0 __RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> >>> > > +=A0=A0=A0 __RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
> >>> >
> >>> > As per spec zcmop is dependent on zca. So perhaps below ?
> >>> >
> >>> > __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP,
> >>> RISCV_ISA_EXT_ZCA)
> >>>
> >>> What's zicboz got to do with it, copy-pasto I guess?
> >=20
> > Yes, copy-pasta :-)
> >=20
> >>> If we're gonna imply stuff like this though I think we need some
> >>> comments explaining why it's okay.
> >>
> >> Also, I'm inclined to call that out specifically in the binding, I've
> >> not yet checked if dependencies actually work for elements of a string
> >> array like the do for individual properties. I'll todo list that..
> >=20
> > Earlier examples of specifying dependency on envcfg actually had functi=
onal
> > use case.
> > So you are right, I am not sure if its actually needed in this
> > particular case.
>=20
> I actually saw that and think about addressing it but AFAICT, this
> should be handled by the machine firmware passing the isa string to the
> kernel (ie, it should be valid). In the case of QEMU, it takes care of
> setting the extension that are required by this extension itself.
>=20
> If we consider to have potentially broken isa string (ie extensions
> dependencies not correctly handled), then we'll need some way to
> validate this within the kernel.

No, the DT passed to the kernel should be correct and we by and large we
should not have to do validation of it. What I meant above was writing
the binding so that something invalid will not pass dtbs_check.

--4EMZ8FslzLz1hx5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhenRgAKCRB4tDGHoIJi
0ntrAP0Tj4WJ1c21e2spkfDS6PwV7wHiJYoWI9/4CiHZwAQORAEApMmTK1BWuikT
fiLbYMmFEHJbe4+ND/jrK1UaiylnyQ8=
=p9pA
-----END PGP SIGNATURE-----

--4EMZ8FslzLz1hx5z--


--===============6479014909214162830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6479014909214162830==--


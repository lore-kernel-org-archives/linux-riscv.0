Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5497C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKAMsKIqWz+1s/d3ZEd7zt4DzmSCZycNxRyba9pkm4I=; b=QIV9BjQldgWOTSUt7BXdUnFJ2g
	2eN63t97BJk8tdc7pflgr40UfRXHdIXR0s0qMmi8zsEX2Hms6y20cU++tEePCsLA+7IbHRXCrcWbS
	IV+sPgWfqrtCphyd+KNiQ4yHmmpJcqGl8HTvNnET29axQFtP/MTZSPfv+FYLL+Z96Gu2hOhy+Alnq
	sfDLWXcPclyasfh83+vWlD0bsRzzgQDNQ3gMzECdfEiBJOM0K5pWdApTl0EGSKwiqa5I6p7JBi+DU
	RPN6pRsUp/fBaePEYsygMw/Ps4V/VMgdULh1cn2IsFN/+mFDEHwMord9vSucciRR6DE9B5PcomAg0
	/isc02Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR5lX-004BBx-1T;
	Wed, 02 Aug 2023 06:55:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR5lV-004BBM-0y
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 06:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690959325; x=1722495325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hb6CE2J/7siYpXeRApw5gdYJame1jDnCoPajhlfdJug=;
  b=mZ4t1Y/aF+VvIVqOY3eOJmdgVb9W6tI0fVwlIM4P8MjReYqRC+Q07z0T
   Cd8pvWrHpMcXRqJxJS0S6ahWUOU1YcCLBgFaNzlwFLWjjs6MFmmRlk7vb
   1NXprfLVc3EwdYPg4Avg7tiBcg0On6GzqQMLU+6dHETti/92dTzAwFPTb
   Bi65cM0Nu+a7xgjTIWO8tu4/Jky3x7mx5qgNjKCeEI/Bpm+MzIUIu5R4d
   l6rWvcr0wj8SuH/UYBFC7fSijonylc5gLQwvf9Es26kTsH4WipsqLktQu
   /aUm1PX+f0YvaIGTLeimNQmZ9HHHg80/jDn8b6qU05X++V+hSIi/P34S8
   A==;
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="asc'?scan'208";a="227517169"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Aug 2023 23:55:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 1 Aug 2023 23:55:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 1 Aug 2023 23:55:11 -0700
Date: Wed, 2 Aug 2023 07:54:35 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Dao Lu <daolu@rivosinc.com>, Heiko
 Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace
 zihintpause
Message-ID: <20230802-sharpness-spoon-f9b8804fb66f@wendy>
References: <20230802064215.31111-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230802064215.31111-1-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_235525_539777_B1260EA0 
X-CRM114-Status: GOOD (  18.75  )
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
Content-Type: multipart/mixed; boundary="===============3414276819875810676=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3414276819875810676==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FVNaThGgTV3kObRx"
Content-Disposition: inline

--FVNaThGgTV3kObRx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Minda,

On Wed, Aug 02, 2023 at 02:42:15PM +0800, Minda Chen wrote:
> Actually it is a part of Conor's
> commit aae538cd03bc ("riscv: fix detection of toolchain
> Zihintpause support").
> It is looks like a merge issue.

Yup, spot on.

> Samuel's
> commit 0b1d60d6dd9e ("riscv: Fix build with
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy") do not base on Conor's commit and
> revert to __riscv_zihintpause. So this patch can fix it.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Did you actually manage to trigger this, or was this by inspection?
clang-15 + binutils 2.35 was, IIRC, how we spotted this because that's
what the clang-built-linux CI uses to test the LTS kernels from before
LLVM's IAS was supported for RISC-V. Seemingly all that needs to be
satisfied there is that zihintpause doesn't appear in -march so this has
gone unnoticed.

Fixes: 3c349eacc559 ("Merge patch "riscv: Fix build with CONFIG_CC_OPTIMIZE=
_FOR_SIZE=3Dy"")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include=
/asm/vdso/processor.h
> index 14f5d27783b8..96b65a5396df 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -14,7 +14,7 @@ static inline void cpu_relax(void)
>  	__asm__ __volatile__ ("div %0, %0, zero" : "=3Dr" (dummy));
>  #endif
> =20
> -#ifdef __riscv_zihintpause
> +#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
>  	/*
>  	 * Reduce instruction retirement.
>  	 * This assumes the PC changes.
> --=20
> 2.17.1
>=20

--FVNaThGgTV3kObRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMn9ngAKCRB4tDGHoIJi
0hxdAQDFRoolcE1ZciJySVnzfJ0A7cPaXejOwC5uLjAsT0671AEAmAQgIFMO/NXx
QEYAk2a7x7wm2TOTAaDFHFgWbGPK9wQ=
=CujL
-----END PGP SIGNATURE-----

--FVNaThGgTV3kObRx--


--===============3414276819875810676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3414276819875810676==--


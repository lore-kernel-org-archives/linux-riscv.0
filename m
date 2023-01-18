Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28490C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKiGw6lnYrXsSzG7EcAghYoFQqURFqN0UQZZPfTFLeA=; b=t3v+Ianf6jFXcnd2TE1GFBoCha
	QB+fAnrdOZXFg+CTUJPjbVsOUHtKYA27S3D4IxQOm4MY8imjys7SwqxBOH5qoYrJT+Xw5fusU1O5x
	Tcgp+nwJqS0+AIjEBCn+f3kZmCnQUXeJ0lLoJGQfJW1KULq579wkqv4NTZiKgteYDGqiscKSnjcKj
	CSxVDUPhAb8c4UkGH2mssL8GJzFo+nBxKguGx1Ad0z6LgWZbkaWRT/tdHVH4DCmMa5gRcGGbGv3Cf
	L3vwABfuFQlpZFwSywg65goOPuZZ1B2EXnt3ywmtq5VigC673Te0b9RQ5rtXpVK7OXUIST9fUVxkc
	ygo2ACIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGl4-002qIV-8g; Wed, 18 Jan 2023 22:18:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGl1-002qHu-Dn; Wed, 18 Jan 2023 22:18:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD515619E5;
	Wed, 18 Jan 2023 22:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D857C433D2;
	Wed, 18 Jan 2023 22:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674080290;
	bh=OXPGiUZ4pwYxZy+VWAnIylIre/fE0IeCBH5Rt/zzbso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ayu1+rIsdsFAO+vgB7460xeODdc0u9LDm3VB+lTV9RVxpihcqQE6MGoywCdRmVp/v
	 cvQj1a0wQHAtJGHwmAyLkHZB0xxRqTQ4TmLi8LeBShjs3A6jxaxzbYjq7WPg2NTO0o
	 8jkVOYSY2A3P+J0XHtWDDNYln+o/d+HugHhekRngFybMrrmc1AVTmLfSlwxwtXKVGh
	 Bqiga5YfDRKneLVt1p3VjReM2IZrktJ881Fyy+lme/lbWyDWqZBoMi7maCDt+nXs/v
	 sTuOPXDXCwuD+v6UpAuNjbrbDKTUZRJ2MfCIbm8lMJsHgjM3LZPrSikKH8vD48MCRy
	 FM+z70t4d+ZOw==
Date: Wed, 18 Jan 2023 22:18:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 06/13] riscv: introduce
 riscv_has_extension_[un]likely()
Message-ID: <Y8hwHbvtgw5bW3lC@spud>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-7-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230115154953.831-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_141811_568115_AC1CCF3C 
X-CRM114-Status: GOOD (  29.75  )
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
Content-Type: multipart/mixed; boundary="===============4426158921502603090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4426158921502603090==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tsh+vw9Kkt0iE9EC"
Content-Disposition: inline


--Tsh+vw9Kkt0iE9EC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 11:49:46PM +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, so a hart's features won't change after booting. This
> chacteristic makes it straightforward to use a static branch to check
> if a specific ISA extension is supported or not to optimize
> performance.
>=20
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
>=20
> Basically, for ease of maintenance, we prefer to use static branches
> in C code, but recently, Samuel found that the static branch usage in
> cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> Samuel pointed out, "Having a static branch in cpu_relax() is
> problematic because that function is widely inlined, including in some
> quite complex functions like in the VDSO. A quick measurement shows
> this static branch is responsible by itself for around 40% of the jump
> table."
>=20
> Samuel's findings pointed out one of a few downsides of static branches
> usage in C code to handle ISA extensions detected at boot time:
> static branch's metadata in the __jump_table section, which is not
> discarded after ISA extensions are finalized, wastes some space.
>=20
> I want to try to solve the issue for all possible dynamic handling of
> ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> riscv_has_extension_*() helpers, which work like static branches but
> are patched using alternatives, thus the metadata can be freed after
> patching.
>=20
> Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@s=
holland.org/ [1]
> Link: https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-m=
ark.rutland@arm.com/ [2]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I think I just didn't leave an R-b last time because of the ongoing
discussion & the functions naming.
Given the conversation I attempted to summarise at [1], I'm satisfied
that we're not just introducing something that'd conflict with trying
to use this mechanism for non-extension capabilities:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

1 - https://lore.kernel.org/linux-riscv/Y8hqptFcUgjhns4F@spud/
> ---
>  arch/riscv/include/asm/hwcap.h | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 09a7767723f6..1767a9ce1a04 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -8,6 +8,7 @@
>  #ifndef _ASM_RISCV_HWCAP_H
>  #define _ASM_RISCV_HWCAP_H
> =20
> +#include <asm/alternative-macros.h>
>  #include <asm/errno.h>
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
> @@ -97,6 +98,42 @@ static __always_inline int riscv_isa_ext2key(int num)
>  	}
>  }
> =20
> +static __always_inline bool
> +riscv_has_extension_likely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> +			   "ext must be < RISCV_ISA_EXT_MAX");
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
> +	:
> +	: [ext] "i" (ext)
> +	:
> +	: l_no);
> +
> +	return true;
> +l_no:
> +	return false;
> +}
> +
> +static __always_inline bool
> +riscv_has_extension_unlikely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> +			   "ext must be < RISCV_ISA_EXT_MAX");
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
> +	:
> +	: [ext] "i" (ext)
> +	:
> +	: l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> =20
>  #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
> --=20
> 2.38.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--Tsh+vw9Kkt0iE9EC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8hwHAAKCRB4tDGHoIJi
0mPWAQDp9Xg+dw4SJ1uKG3EHoxsZNjoaSkE7qWtOkI+lJXFysgEAmiWO4UEYdPA4
2X07QMBRd1wVUcth/t2sQgBu+yhYugE=
=zMjo
-----END PGP SIGNATURE-----

--Tsh+vw9Kkt0iE9EC--


--===============4426158921502603090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4426158921502603090==--


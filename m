Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FECC27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJlkTQUBDWGiNltXjG7tPFMb1MPkvC5+YZVm6I2f9Fo=; b=pD3QmiXV+pZC5T58qZEz5SjPR5
	3x0OqxDkLQyBLP4IetXAgfMWvJS6Cw7E7RsmQMnP+dYlnh2lyywQk4lmGyYpxQD1VNHlRyqywLcDD
	WgXOlkkPOc2GljV03eDlWdIPq18gNWuV8+qr0eTchwtc7XZTkxgjxPBKr90xl1nzRX5RTMSDgmGu+
	MxLsZKFUaX6O/cvr/X9DSAQzw2/iyPcS5aVCLylT1TW51KHWCHCiDn8+5ZZ74JZcx0cWX9CdKfMkM
	kN/KOuRe+AbpT/P2gpKu0S9XgVX70sL04wOdT0+3fn6VRWU07VP0ugMrKpfFqJ/TbZhPHFzp6VDeG
	H6N+LlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFI5l-0000000AzV8-2rG0;
	Thu, 06 Jun 2024 18:44:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFI5h-0000000AzUX-3a2W
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 18:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EFC81CE1932;
	Thu,  6 Jun 2024 18:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75618C2BD10;
	Thu,  6 Jun 2024 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717699439;
	bh=53jnQieg28uN+Jr1SxbOZfAYrGKD3bK16dUDxYAgWx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSXH9NEJZ7GsMdXuWi87ZX4CdxD7G3HASISeEQ88kPN4e27kq2yXBDY1xqSAt2NJd
	 KafTUoJSdiVY78nKg1okxVRX4duwvo/QVxv3naYOYGKtOOxpBhKuKLYneVxZu4vP9k
	 yuDkhMP0b7UXIqUxv3FE20o/1+JXYNX0opla2kwMIN/nxwJnjyLHXukXaOg8Mi9WH4
	 HimyFdq1HoCE5RnRalLyRf2+SU4/miqdnIph6TUmMXZGv2EsVYEnRgClvYwz0E7mEU
	 O5+7/ktbTRdoUHei393qNlBXkdqljR1y/uGANP4BZ7gNRkpSWZw8IfI3JfkG9V5XfB
	 Q2X2bH/01M+9g==
Date: Thu, 6 Jun 2024 19:43:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] RISC-V: Add Zicclsm to cpufeature and hwprobe
Message-ID: <20240606-acetone-whisking-af2ba796238f@spud>
References: <20240606183215.416829-1-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240606183215.416829-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_114402_287429_7858D636 
X-CRM114-Status: GOOD (  27.35  )
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
Content-Type: multipart/mixed; boundary="===============1690823319486128116=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1690823319486128116==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1NCbJLZCivnUGaW/"
Content-Disposition: inline


--1NCbJLZCivnUGaW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 02:32:13PM -0400, Jesse Taube wrote:
> > Zicclsm Misaligned loads and stores to main memory regions with both
> > the cacheability and coherence PMAs must be supported.
> > Note:
> > This introduces a new extension name for this feature.
> > This requires misaligned support for all regular load and store
> > instructions (including scalar and vector) but not AMOs or other
> > specialized forms of memory access. Even though mandated, misaligned
> > loads and stores might execute extremely slowly. Standard software
> > distributions should assume their existence only for correctness,
> > not for performance.
>=20
> Detecing zicclsm allows the kernel to report if the
> hardware supports misaligned accesses even if support wasn't probed.
>=20
> This is useful for usermode to know if vector misaligned accesses are
> supported.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  4 files changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e17d0078a651..8c0d0b555a8e 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_ZICCLSM		75
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 2902f68dc913..060212331a03 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -59,6 +59,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
>  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> +#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 36)

Missing an update to hwprobe.rst.

>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3ed2359eae35..863c708f2f2e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -305,6 +305,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> +	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),

Please read the ordering comment above this structure!
Also, you're missing dt-binding documentation for the extension.

>  };
> =20
>  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 8cae41a502dd..b286b73e763e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -125,6 +125,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  			EXT_KEY(ZVKT);
>  			EXT_KEY(ZVFH);
>  			EXT_KEY(ZVFHMIN);
> +			EXT_KEY(ZICCLSM);

Order looks off here too, I think this should be added in in the same
order as to riscv_isa_ext, although the requirement isn't hard here,
just that adding to the end of a list means it's annoying to check for
what's missing.

Thanks,
Conor.

>  		}
> =20
>  		if (has_fpu()) {
> --=20
> 2.43.0
>=20
>=20

--1NCbJLZCivnUGaW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmIDaAAKCRB4tDGHoIJi
0g3hAPwNVeSLKAyopibUGHTyx98GbKVXAzBEoWZpWftw+5T5JAEA8hWOi1FbPtsY
8amGAdonpZ3KOn3n1mS+Jw5kqOSYxwE=
=pCmy
-----END PGP SIGNATURE-----

--1NCbJLZCivnUGaW/--


--===============1690823319486128116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1690823319486128116==--


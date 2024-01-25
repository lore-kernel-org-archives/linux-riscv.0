Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F9C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjoEftOjx3WvmjJgYegcR+Rco+1eyzeTujqW0u5xCrU=; b=DuEZYvg48C9mGKwYurzCfuZZzR
	HQxH7L9K22pnMGyCIuj0Lqcla4XP5IN8zFAxjbMgmh5y8jtoBr7BSCv3WOVnZN2IZ4Ad29pa65xL+
	mvL0cd/n//VNzkerJbLWF+vvpJmflV66uWdFOOEJQQJ7SJMc7f/WQTR5Av7SGzyt+AxhbaeyYWrx+
	84XuI7ah5lF8joIjl17w8nwDf79Vu4Om8KQPYL2g8cgsaUseG0z0gX09j5maAo+Rv+ncIRgsUiCq5
	GooGbMf6Vmj6LvNi9dgi0R8wYUA9mSjp+c4KHHleQTmpDcbyTSYdCCNi9SU/myPDGJ/B726MV9qe8
	bWcVRyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT40t-00000001Epj-2L48;
	Thu, 25 Jan 2024 17:59:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT40q-00000001Eo9-1wZZ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73B4C622A8;
	Thu, 25 Jan 2024 17:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0DDC433F1;
	Thu, 25 Jan 2024 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205579;
	bh=rC+Q88vkvvSk69dujsUhGZueJ/t7Kyjxb3QFEdgOIJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyAlRKVuBCdCsxLTOqTqSdCeK/5SYgNvOoA3HyrTyOGXHWKWVH7aBanPrtSRIxVIk
	 Y149mNGvNZ1J1PSJ6yBB85ggKz+qBB0Pd/asIXEEsZrVpj6EpjtcmRV/Q05YrW+wZh
	 J2seaDdIXlIf5/w46PnlThKYxvad+h8w+C/L7Hs7EK0NAZRU0oTdqcq9ZaqpLilvSo
	 5RfrqumEvErBVFDhuC4P0/uwxjx7AGB4lbwzbrNOBB14T7jFBrBZ88i07XPRzAns36
	 cBi8U/5Hzcb0zby68VrjcnwkH3i3E1IFK/I6wH54MogiPMaidzrHF/IyP5HdNqMmFp
	 aTxYOHfemvtmQ==
Date: Thu, 25 Jan 2024 17:59:24 +0000
From: Conor Dooley <conor@kernel.org>
To: debug@rivosinc.com
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 05/28] riscv: zicfiss/zicfilp enumeration
Message-ID: <20240125-unscathed-coeditor-31f04e811489@spud>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-6-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240125062739.1339782-6-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_095940_649115_3289EE4F 
X-CRM114-Status: GOOD (  24.66  )
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
Content-Type: multipart/mixed; boundary="===============1857165589238941630=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1857165589238941630==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OJe+q/A6ibDUlSdl"
Content-Disposition: inline


--OJe+q/A6ibDUlSdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

Series is RFC, so not gonna review it in depth, just wanted to comment
on this particular patch.

On Wed, Jan 24, 2024 at 10:21:30PM -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
>=20
> This patch adds support for detecting zicfiss and zicfilp. zicfiss and zi=
cfilp
> stands for unprivleged integer spec extension for shadow stack and branch
> tracking on indirect branches, respectively.
>=20
> This patch looks for zicfiss and zicfilp in device tree and accordinlgy l=
ights
> up bit in cpu feature bitmap. Furthermore this patch adds detection utili=
ty
> functions to return whether shadow stack or landing pads are supported by
> cpu.
>=20
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h | 18 ++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h      |  2 ++
>  arch/riscv/include/asm/processor.h  |  1 +
>  arch/riscv/kernel/cpufeature.c      |  2 ++
>  4 files changed, 23 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index a418c3112cd6..216190731c55 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -133,4 +133,22 @@ static __always_inline bool riscv_cpu_has_extension_=
unlikely(int cpu, const unsi
>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>  }
> =20
> +static inline bool cpu_supports_shadow_stack(void)
> +{
> +#ifdef CONFIG_RISCV_USER_CFI

In passing, I don't see any reason for not using IS_ENABLED() here.

> +	return riscv_isa_extension_available(NULL, ZICFISS);
> +#else
> +	return false;
> +#endif
> +}
> +
> +static inline bool cpu_supports_indirect_br_lp_instr(void)
> +{
> +#ifdef CONFIG_RISCV_USER_CFI
> +	return riscv_isa_extension_available(NULL, ZICFILP);
> +#else
> +	return false;
> +#endif
> +}
> +
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 06d30526ef3b..918165cfb4fa 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -57,6 +57,8 @@
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
>  #define RISCV_ISA_EXT_ZICOND		44
> +#define RISCV_ISA_EXT_ZICFISS	45
> +#define RISCV_ISA_EXT_ZICFILP	46
> =20
>  #define RISCV_ISA_EXT_MAX		64
> =20
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index f19f861cda54..ee2f51787ff8 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -13,6 +13,7 @@
>  #include <vdso/processor.h>
> =20
>  #include <asm/ptrace.h>
> +#include <asm/hwcap.h>
> =20
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 98623393fd1f..16624bc9a46b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -185,6 +185,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(zicfiss, RISCV_ISA_EXT_ZICFISS),
> +	__RISCV_ISA_EXT_DATA(zicfilp, RISCV_ISA_EXT_ZICFILP),

Anything you add to this array, you need to document in a dt-binding.
Also, you added these in the wrong place. There's a massive comment
before the array describing the order entries must be in, please take a
look.

Thanks,
Conor.


>  };
> =20
>  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--OJe+q/A6ibDUlSdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKhfAAKCRB4tDGHoIJi
0m8PAP9eIW7UlxuUyWUsg6MGHXlv8ZtcBNP6yzYdPsHu14VjBgEA1jfEe577oIh+
woT0/0AyxBO9r6aPBEj0oGlTA2l5WAI=
=Oe9E
-----END PGP SIGNATURE-----

--OJe+q/A6ibDUlSdl--


--===============1857165589238941630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1857165589238941630==--


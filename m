Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD8C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3G1Fj565zefwZJ4xC//6i6B6G2bkd6aCWmBsJlpQSB8=; b=p8yBqNFP+QGeAyysgH0S0AN37s
	z8duQvD+X1O7KrXNDc3hRXCJq9baOt6jkclOuqzKipQvuX98o5zP9djoO2LLIIxSUq5rlXyfGESlu
	aLMHYyLNOsoV7TtE202DUabHScnJhEznlgr3TmbzyrjW8q/MjI53bGWW6UpNpySjvKHzImqteRQ2z
	yyDxKJRNrinrzjWdCvhKNe6OVFPev6T+n7hqUo6Oru32bLgfhxJhiOlKOh1MQkbQ+VuzlOETQ6PjT
	MXBuWEmkFbfNEeDrmx8VpgKIOS0dbqzi4i+huzMh+Q/wyj3caK8ULHQR+8o+uVZ98FnRqgG9+Z64a
	od2ePoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmwz-008nQd-St; Wed, 25 Jan 2023 21:04:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKmwv-008nOc-VJ; Wed, 25 Jan 2023 21:04:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E34BBB81BA0;
	Wed, 25 Jan 2023 21:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7DAC433D2;
	Wed, 25 Jan 2023 21:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674680690;
	bh=5XgIUsKQQfnJqmrJCF1Ci6vFUC+8ejjb8Ltko66AhdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nj1pO4t16aTOFuGuZ7TSeefZfsF8eqqi44PedPJ5/hJf45UnJzobGr+D7VnlO85AJ
	 Ded5+078L02E5qvIHARMMPCN79F6DRhz9u9mC+8a1b+u37npcELVAJVhJvax0/b9iV
	 sNWFPCR3i43WjhvCi27BxeiO/ydEkzP35sapJgkj2V3CUgxYiQW9mhqbzqXYWkIMs4
	 Ss2yD0ivce40sRHbaSka3/KnovHZBt23pWEekz7bQgy4q8gbAQqdy5SQO/13MBr3BN
	 JXZABfSmVduBbnX0yiE0X7XE4o+qb72nv8kstxe+l06+XoAHJZMivz1kLHOHknf1T4
	 xbyEuyC6MLBXA==
Date: Wed, 25 Jan 2023 21:04:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
Message-ID: <Y9GZbVrZxEZAraVu@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-20-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_130454_345989_3DA0A50D 
X-CRM114-Status: GOOD (  28.00  )
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
Content-Type: multipart/mixed; boundary="===============1139559387024197132=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1139559387024197132==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lkDM2IpOgivVn4g+"
Content-Disposition: inline


--lkDM2IpOgivVn4g+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

Thanks for respinning this, I think a lot of people will be happy to see
it!

On Wed, Jan 25, 2023 at 02:20:56PM +0000, Andy Chiu wrote:

> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 12d91b0a73d8..67411cdc836f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -52,6 +52,13 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
>  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> +
> +ifeq ($(CONFIG_RISCV_ISA_V), y)
> +ifeq ($(CONFIG_CC_IS_CLANG), y)
> +        riscv-march-y +=3D -mno-implicit-float -menable-experimental-ext=
ensions
> +endif
> +endif

Uh, so I don't think this was actually tested with (a recent version of)
clang:
clang-15: error: unknown argument: '-menable-experimental-extensions_zicbom=
_zihintpause'

Firstly, no-implicit-float is a CFLAG, so why add it to march?
There is an existing patch on the list for enabling this flag, but I
recall Palmer saying that it was not actually needed?
Palmer, do you remember why that was?

I dunno what enable-experimental-extensions is, but I can guess. Do we
really want to enable vector for toolchains where the support is
considered experimental? I'm not au fait with the details of clang
versions nor versions of the Vector spec, so take the following with a
bit of a pinch of salt...
Since you've allowed this to be built with anything later than clang 13,
does that mean that different versions of clang may generate vector code
that are not compatible?
I'm especially concerned by:
https://github.com/riscv/riscv-v-spec/releases/tag/0.9
which appears to be most recently released version of the spec, prior to
clang/llvm 13 being released.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..f4299ba9a843 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -416,6 +416,16 @@ config RISCV_ISA_SVPBMT
> =20
>  	   If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on GCC_VERSION >=3D 120000 || CLANG_VERSION >=3D 130000

Are these definitely the versions you want to support?
What are the earliest (upstream) versions that support the frozen
version of the vector spec?

Also, please copy what has been done with "TOOLCHAIN_HAS_FOO" for other
extensions and check this support with cc-option instead. Similarly,
you'll need to gate this support on the linker being capable of
accepting vector:
/stuff/toolchains/gcc-11/bin/riscv64-unknown-linux-gnu-ld: -march=3Drv64i2p=
0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zihintpause2p0_zve32f1p0_zve32x1p0_zve64d1p=
0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0: prefixed ISA extensio=
n must separate with _
/stuff/toolchains/gcc-11/bin/riscv64-unknown-linux-gnu-ld: failed to merge =
target specific data of file arch/riscv/kernel/vdso/vgettimeofday.o

> +	default n

I forget, but is the reason for this being default n, when the others
are default y a conscious choice?
I'm a bit of a goldfish sometimes memory wise, and I don't remember if
that was an outcome of the previous discussions.
If it is intentionally different, that needs to be in the changelog IMO.

> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZICBOM

^ you can use this one here as an example :)

I'll reply here again once the patchwork automation has given the series
a once over and see if it comes up with any other build issues.
Thanks,
Conor.


--lkDM2IpOgivVn4g+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9GZbQAKCRB4tDGHoIJi
0vxmAQC/ka5xvUwWRzYCMdL2d95EkAC0HKbR302kC5upl5J6owEAlSoDmFq8aDwQ
55BjL9+qD28qiZowz0+jc9GBpGCDYwE=
=bYeS
-----END PGP SIGNATURE-----

--lkDM2IpOgivVn4g+--


--===============1139559387024197132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1139559387024197132==--


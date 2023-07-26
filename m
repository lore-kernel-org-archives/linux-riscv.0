Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5489DC001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caAmvh/PQZNapp2/V54VM7m5mSY8v0ewSaDugikV0Qc=; b=BrYCYBxqtOv9gygeYPgeBlIPEp
	UHd048SAhNyNLDh6lVm0RGNo2PPSsQOJoLdn8O5YXm1+EOHjby610tXEsCu1CeQ0gbDfiZx42OBqY
	uA7k4suzNYtWY/3ttsmLTc0AO/9IpbLw+JO50kiMlVrAwit+FKcTqfFp3cb4KCULP2G+TFFV9+F9y
	6E+rf5def7UJNmsvzQgvv6EQFOrwgXmQN368MIUKy3TYxKCtWpTyCjATs5tNoK4BWT3eg01rfAEl1
	d2hCLOHTJ2ZBxP3mHllE9UUgFzpixozE9ppKBBTsJPoAAq8MZjqgKY6/dZl31/soC6e1m6Pkh3dl4
	iL2XYmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiqU-00BEft-25;
	Wed, 26 Jul 2023 18:02:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiqQ-00BEfF-3B
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 18:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A17F61C1E;
	Wed, 26 Jul 2023 18:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4799CC433C7;
	Wed, 26 Jul 2023 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690394561;
	bh=ZuEBFKvfvWvmo7RjmoDN0IFVptnWEiaCxWHx7e3scdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRZb+vSdMaDrEDii2mqaKfhC/axpTjFGGcq/anbalORnGsHk6wpre5hOHR7uDoIc7
	 fVQLRH3RQZjibGwjweDJJAQI7GBqxNXjoNe2eKK57v5o5lJcuU4QL8aHvUezuWzyZx
	 rJsq3Rdr4RAZJdMyLKtsQyDouD3QDh9sWFsl2PTwcNeG0RGXEVKrFmpv7Ciyhqhphd
	 5Y3+70q3IVKS4GJ+EpIEF9OfVPMTrvA2/PO1uaTFTgdQMa5pUeW9AWtaHNQSwS80S3
	 AdwpA1VTAcGbBVVgAV3lwY8mb5k/mAvBS9Exee15tqIbRnpnzFsalAyXf2nGvb3iGt
	 wqJLsyvJkYc8g==
Date: Wed, 26 Jul 2023 19:02:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230726-outclass-parade-2ccea9f6688a@spud>
References: <20230726174524.340952-1-xingmingzheng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230726174524.340952-1-xingmingzheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_110243_109457_2E5ECE26 
X-CRM114-Status: GOOD (  28.14  )
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
Content-Type: multipart/mixed; boundary="===============0383972310147550125=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0383972310147550125==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UtMXT2cLyqU/RCBj"
Content-Disposition: inline


--UtMXT2cLyqU/RCBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 01:45:24AM +0800, Mingzheng Xing wrote:
> Binutils-2.38 and GCC-12.1.0 bump[0] default ISA spec to newer version
> 20191213 which moves some instructions from the I extension to the
> Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
> that version, we should turn on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> to cope with the new changes.
>=20
> The case of clang is special[1][2], where older clang versions (<17) need
> to be rolled back to old ISA spec to fix it. And the less common case,
> since older GCC versions (<11.1.0) did not support zicsr and zifencei

Can you provide a link to explain why this is 11.1.0 in particular?

> extension for -march, also requires a fallback to cope with it.
>=20
> For more information, please refer to:
> commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
> commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang a=
nd binutils")
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D98416dbb0a62579=
d4a7a4a76bab51b5b52fec2cd [0]
> Link: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.o=
rg [1]
> Link: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org=
 [2]

> Link: https://lore.kernel.org/all/20230725170405.251011-1-xingmingzheng@i=
scas.ac.cn

This shouldn't be here, you don't link to your old patches.

> Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>

This is still broken for:
CONFIG_CLANG_VERSION=3D0
CONFIG_AS_IS_GNU=3Dy
CONFIG_AS_VERSION=3D23500
CONFIG_LD_IS_BFD=3Dy
CONFIG_LD_VERSION=3D23500

Please don't post a v2 while there is still ongoing discussion on the
v1. I'll try to reply here tomorrow with a diff you can fold in to fix
the problem.

Thanks,
Conor.

> ---
>=20
> v2:
> - Update the Kconfig help text and commit message.
> - Add considerations for low version gcc case.
>=20
> Sorry for the formatting error on my mailing list reply.
>=20
>  arch/riscv/Kconfig | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..08afd47de157 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -570,24 +570,27 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
>  config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>  	def_bool y
>  	# https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Daed44=
286efa8ae8717a77d94b51ac3614e2ca6dc
> -	depends on AS_IS_GNU && AS_VERSION >=3D 23800
> +	# https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D98416dbb0a62579d4=
a7a4a76bab51b5b52fec2cd
> +	depends on GCC_VERSION >=3D 120100 || (AS_IS_GNU && AS_VERSION >=3D 238=
00)
>  	help
> -	  Newer binutils versions default to ISA spec version 20191213 which
> -	  moves some instructions from the I extension to the Zicsr and Zifencei
> -	  extensions.
> +	  Binutils-2.38 and GCC-12.1.0 bump default ISA spec to newer version
> +	  20191213 which moves some instructions from the I extension to the
> +	  Zicsr and Zifencei extensions.
> =20
>  config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>  	def_bool y
>  	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>  	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4=
498694e15bf8a16
> -	depends on CC_IS_CLANG && CLANG_VERSION < 170000
> +	# https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Db03be74bad08c382d=
a47e048007a78fa3fb4ef49
> +	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || \
> +		   (CC_IS_GCC && GCC_VERSION < 110100)
>  	help
> -	  Certain versions of clang do not support zicsr and zifencei via -march
> -	  but newer versions of binutils require it for the reasons noted in the
> -	  help text of CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. This
> +	  Certain versions of clang (or GCC) do not support zicsr and zifencei =
via
> +	  -march but newer versions of binutils require it for the reasons noted
> +	  in the help text of CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. T=
his
>  	  option causes an older ISA spec compatible with these older versions
> -	  of clang to be passed to GAS, which has the same result as passing zi=
csr
> -	  and zifencei to -march.
> +	  of clang (or GCC) to be passed to GAS, which has the same result as
> +	  passing zicsr and zifencei to -march.
> =20
>  config FPU
>  	bool "FPU support"
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--UtMXT2cLyqU/RCBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMFfvAAKCRB4tDGHoIJi
0qoeAQDp3ypoQuZjQevaA9Hr4AFTnPXwwDMwgAo89yt9uZDNRgD/XaPIQrd0555E
aPpCSI4Ukz489022i+qI1s80u07U0AI=
=UaXr
-----END PGP SIGNATURE-----

--UtMXT2cLyqU/RCBj--


--===============0383972310147550125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0383972310147550125==--


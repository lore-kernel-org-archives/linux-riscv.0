Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52819E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uCp1VDRg4d+Aa2dWaJE+Z71hFeqcSNWZKj0PkamG8M=; b=aJjbfrT+i9WoLatyYensAlXIHZ
	UxjFKD9818AMSfuEMoKJBFR4v/pW533BhbQxgLQS3rUMRZyVLGzygFus6KwoMz26AFK3dGrhUJc0R
	pF9bbKRK1qC6CYt0zSrNc5NZTdvaSn3dsKIw0P6W0h1PtJfChM43M/GHqeZI/UBgkFENDIdk5h1dy
	Smhkz9y0AxoRt8tRpkbEZm791gS4mwA1vhM8VrVHweCBqBZLn9I+/ZV/id7b8oefNCTsF8Ja7R3P2
	iaWKqqZyTc8YgUMEqe/6mdlJUAsu5TwwzYHG9QlAYpPGfvDXqgTgby1MPLJYQQI5DkPtPmdi39Aqw
	Gr0XNAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvlk-0000000Gyt9-39fW;
	Wed, 18 Dec 2024 15:15:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvlG-0000000Gykw-2EYn
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 15:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 184B0A42090;
	Wed, 18 Dec 2024 15:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CA9C4CECD;
	Wed, 18 Dec 2024 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734534893;
	bh=SjNt+XDqcRtFHMkrR6DiTUZbGYdJRYJjVJCsdb9bxhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJUNGrrD92LbfAoykCRLgv4ue8/TQpJT+ZSjc4y0+QtjHMVeqodSTtGy68pavPYpn
	 7otipDC35WXX4JW0z0ruRtK60POtL8s39akaRRmceo96gHferykcsnG4fyBicw8PV4
	 zQ4kWMq0kDgrymMA2EuSu0ZYDIzaDRP5NiwpRzperRw/nx+RzHcyaPYC5zP8YviM3c
	 cSxv2hGTZ/3MnOxN3hf9Iq7b8IzYriLLiMwWCrkIEmAlWxIG/DznT7dXRim2wPDLVx
	 W13UxjbMxcgktTohq5MQGZ/I+EvK7fRwj0bSmiCjA/WY02raeDO7JxsE2M3W8MOJUW
	 oxEBf6ZoYgIbg==
Date: Wed, 18 Dec 2024 15:14:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Check version of objdump
Message-ID: <20241218-sandfish-hence-5fa18539f7ca@spud>
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-1-b75962660a9b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071454_709458_B5718480 
X-CRM114-Status: GOOD (  25.56  )
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
Content-Type: multipart/mixed; boundary="===============1047407611682951385=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1047407611682951385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b/GWEQJsBut7jlmV"
Content-Disposition: inline


--b/GWEQJsBut7jlmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 03:12:51PM -0800, Charlie Jenkins wrote:
> Similar to ld-version, add a way to check the version of objdump. This
> should most of the time end up being the binutils version or the llvm
> version.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

This fails for allmodconfig and rv32_defconfig with clang. 19.1.1
according to Bjorn :)

Cheers,
Conor.

> ---
>  init/Kconfig               | 10 +++++++
>  scripts/Kconfig.include    |  6 ++++
>  scripts/objdump-version.sh | 69 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 85 insertions(+)
>=20
> diff --git a/init/Kconfig b/init/Kconfig
> index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..0b5d36f939e1de89c12ebdd61=
e4815015314d4f1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -60,6 +60,16 @@ config LLD_VERSION
>  	default $(ld-version) if LD_IS_LLD
>  	default 0
> =20
> +config OBJDUMP_IS_GNU
> +	def_bool $(success,test "$(objdump-name)" =3D objdump)
> +
> +config OBJDUMP_IS_LLVM
> +	def_bool $(success,test "$(objdump-name)" =3D llvm-objdump)
> +
> +config OBJDUMP_VERSION
> +	int
> +	default $(objdump-version)
> +
>  config RUSTC_VERSION
>  	int
>  	default $(rustc-version)
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 33193ca6e8030e659d6b321acaea1acd42c387a4..cb3e2d2564fea8cce780adb3b=
e672c9596b7ccf2 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -58,6 +58,12 @@ $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comm=
a) this linker is not supp
>  ld-name :=3D $(shell,set -- $(ld-info) && echo $1)
>  ld-version :=3D $(shell,set -- $(ld-info) && echo $2)
> =20
> +# Get the objdump name, version, and error out if it is not supported.
> +objdump-info :=3D $(shell,$(srctree)/scripts/objdump-version.sh $(OBJDUM=
P))
> +$(error-if,$(success,test -z "$(objdump-info)"),Sorry$(comma) this objdu=
mp is not supported.)
> +objdump-name :=3D $(shell,set -- $(objdump-info) && echo $1)
> +objdump-version :=3D $(shell,set -- $(objdump-info) && echo $2)
> +
>  # machine bit flags
>  #  $(m32-flag): -m32 if the compiler supports it, or an empty string oth=
erwise.
>  #  $(m64-flag): -m64 if the compiler supports it, or an empty string oth=
erwise.
> diff --git a/scripts/objdump-version.sh b/scripts/objdump-version.sh
> new file mode 100755
> index 0000000000000000000000000000000000000000..fa24f8dc2d3c42fd1195fceb3=
c96b27f7127db25
> --- /dev/null
> +++ b/scripts/objdump-version.sh
> @@ -0,0 +1,69 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the objdump name and its version in a 5 or 6-digit form.
> +# Also, perform the minimum version check.
> +
> +set -e
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +get_canonical_version()
> +{
> +	IFS=3D.
> +	set -- $1
> +
> +	# If the 2nd or 3rd field is missing, fill it with a zero.
> +	#
> +	# The 4th field, if present, is ignored.
> +	# This occurs in development snapshots as in 2.35.1.20201116
> +	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> +}
> +
> +orig_args=3D"$@"
> +
> +# Get the first line of the --version output.
> +IFS=3D'
> +'
> +set -- $(LC_ALL=3DC "$@" --version)
> +
> +# Split the line on spaces.
> +IFS=3D' '
> +set -- $1
> +
> +min_tool_version=3D$(dirname $0)/min-tool-version.sh
> +
> +if [ "$1" =3D GNU -a "$2" =3D objdump ]; then
> +	shift $(($# - 1))
> +	version=3D$1
> +	min_version=3D$($min_tool_version binutils)
> +	disp_name=3D"GNU objdump"
> +else
> +	while [ $# -gt 1 -a "$1" !=3D "LLVM" ]; do
> +		shift
> +	done
> +
> +	if [ "$1" =3D LLVM ]; then
> +		version=3D$3
> +		min_version=3D$($min_tool_version llvm)
> +		disp_name=3D"llvm-objdump"
> +	else
> +		echo "$orig_args: unknown objdump" >&2
> +		exit 1
> +	fi
> +fi
> +
> +version=3D${version%%[!0-9.]*}
> +
> +cversion=3D$(get_canonical_version $version)
> +min_cversion=3D$(get_canonical_version $min_version)
> +
> +if [ "$cversion" -lt "$min_cversion" ]; then
> +	echo >&2 "***"
> +	echo >&2 "*** objdump is too old."
> +	echo >&2 "***   Your $disp_name version:    $version"
> +	echo >&2 "***   Minimum $disp_name version: $min_version"
> +	echo >&2 "***"
> +	exit 1
> +fi
> +
> +echo objdump $cversion
>=20
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--b/GWEQJsBut7jlmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2Lm5gAKCRB4tDGHoIJi
0u/lAP9kRzDD4E/btOPSi7N3eOmgjKUrMlMEji8jDYxIKzyTmAD/XIfHvCTvc6cx
cqbHAgzjJzYiJ5hNBr8W+Qg7PTaoEwA=
=4kd8
-----END PGP SIGNATURE-----

--b/GWEQJsBut7jlmV--


--===============1047407611682951385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1047407611682951385==--


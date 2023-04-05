Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F95C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpArKwMgCN8oEG84zqTisXYDvaFySChJ51VvKwr5xm8=; b=IkB4QXFcpjci3xbCZvq7aG2kBt
	0JLYS+OIQdHbN32vah7UVZF6AejweyJ9y4Yl5m6Wtp53ibkshaWy2QcYbpZK6oncTQK23f8uYJoQZ
	D52u1ed8KDhtePqksBQixXaTmrKCFS1ShpbkwghPHiACaj9O8eS5M7W0cCbZBXSNVkiNje7ow8uGY
	BYBV/4zlButzA9pS4QkonXtL5P1JO3VuDy15VPX20qduynzf51lm66PgFLARlH8uPk4+ITY/1EuPR
	T3v050TD53GNlZQiSYxnWc9kh5B/yR/YWfdaeBMGYcHETOUsv+qdzW8rKOW7e/6W1jSxvLTd2diYv
	bWUw1RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk7NJ-005JdA-2B;
	Wed, 05 Apr 2023 17:56:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk7NG-005JcZ-0f
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 17:56:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 880C4627FF;
	Wed,  5 Apr 2023 17:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E091C433D2;
	Wed,  5 Apr 2023 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680717400;
	bh=jVAC+4ymjcbvNsupEft+6hBzdRCfnsofg1xrrfqn2EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VtGkj96fnXFRhZOFW35CsBKWfZ1/hZZH22iSRV99oWKoubYmnccIzXR0hKMt3LRNV
	 YCF7wADFu0UjIdtw/et1GgDXbcfonja4xyX97aUkHEKffk/VbfeJrwEGwyflIiYqjP
	 o4cYJ3hrSJp695Jkk7u6UuuKeZHM8oXWOP7v78C9PsmpY6/AC190FdW57Wk7WXAszk
	 zgBUnuWdUR/s57car2zRtQIuxBJJvuCy4njGmveVwu/Yc/YLRDD3qG1gam/ol7JgTj
	 xnMEaLC/V3zH1VtaAcytv1ZReq7Q5Du3WPmo9CHK5xcuBupoB3YC3KLYlv6RlOnQw2
	 eTCAQCaIkYZBg==
Date: Wed, 5 Apr 2023 18:56:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ndesaulniers@google.com, trix@redhat.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] riscv: Adjust dependencies of HAVE_DYNAMIC_FTRACE
 selection
Message-ID: <20230405-dejected-unending-28e29d89f206@spud>
References: <20230404-riscv-dynamic-ftrace-checks-clang-v1-1-0ce296b7d423@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230404-riscv-dynamic-ftrace-checks-clang-v1-1-0ce296b7d423@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_105646_324454_C26D9CAE 
X-CRM114-Status: GOOD (  23.68  )
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
Content-Type: multipart/mixed; boundary="===============0998688316921192989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0998688316921192989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y/qRivkW8sHyiGgn"
Content-Disposition: inline


--Y/qRivkW8sHyiGgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 01:34:21PM -0700, Nathan Chancellor wrote:
> When building allmodconfig with clang and its integrated assembler and
> linking with a version of GNU ld prior to 2.36, the following link error
> occurs:
>=20
>   riscv64-linux-gnu-ld: .init.data has both ordered [`__patchable_functio=
n_entries' in init/main.o] and unordered [`.init_array.0' in kernel/trace/t=
race_benchmark.o] sections
>   riscv64-linux-gnu-ld: final link failed: bad value
>=20
> This is the same error addressed by commit 45bd8951806e ("arm64: Improve
> HAVE_DYNAMIC_FTRACE_WITH_REGS selection for clang") for arm64. See that
> changelog for a full description of why this error occurs with this
> combination of tools.
>=20
> In a similar manner as that change, restrict the
> CONFIG_HAVE_DYNAMIC_FTRACE selection to combinations of tools known to
> work so that there are no errors.
>=20
> Link: https://github.com/ClangBuiltLinux/linux/issues/1817
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/Kconfig | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eb7f29a412f8..4b82838ac870 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -136,12 +136,23 @@ config RISCV
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select UACCESS_MEMCPY if !MMU
>  	select ZONE_DMA32 if 64BIT
> -	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatch=
able-function-entry=3D8)
> +	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYN=
AMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> =20
> +config CLANG_SUPPORTS_DYNAMIC_FTRACE
> +	def_bool CC_IS_CLANG
> +	# https://github.com/llvm/llvm-project/commit/6ab8927931851bb42b2c93a00=
801dc499d7d9b1e
> +	depends on CLANG_VERSION >=3D 130000
> +	# https://github.com/ClangBuiltLinux/linux/issues/1817
> +	depends on AS_IS_GNU || (AS_IS_LLVM && (LD_IS_LLD || LD_VERSION >=3D 23=
600))
> +
> +config GCC_SUPPORTS_DYNAMIC_FTRACE
> +	def_bool CC_IS_GCC
> +	depends on $(cc-option,-fpatchable-function-entry=3D8)

I thought about merging these, but I think you just end up with
something that is difficult to grok. Explanation in the arm64 is pretty
good & the change follows.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--Y/qRivkW8sHyiGgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC22VAAKCRB4tDGHoIJi
0p76AP9x5WZy9i0kDAHbGvogZ6rJrVgolnqAW0uZIAwGqZdHPAD8Ds6dJzr3hChp
JMo2BHpHOC9Dn+Zzu8NxlXecUBFqAgc=
=4TDW
-----END PGP SIGNATURE-----

--Y/qRivkW8sHyiGgn--


--===============0998688316921192989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0998688316921192989==--


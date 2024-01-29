Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3741EC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qz1mz4U1UC/Kk3z7VatDIessOfUgrGldiTI58jucaMc=; b=wH3gI4vbpFtwTJM0oKm/RoVdhH
	gxrY65gR95BVeXxwK6VI7pWpNzbRmP7zuFgilQISa+g7bhE47ayt9UWWgVrAY7qlbOjbuBW7flmCA
	vRCosrylL9jCSw0t1T3W7LiL4Ft5tXlPB7u7HYOHIM99MuHBhxN2pewIDjMkM7Mzf0yCi7OAbM35x
	99iQ6NfPLy372LdM+xKQECbG9Dg1QgbYDZWPfuDW/fhUf0sP8kQpivaMdM3kffZJN2N327k0SLgG0
	+2xKDPvZ+a3NvGHAe++p51ZhFQcHbuMh55RklM1kSwozR8kqu9L8miu1J2A8sTwgbqe5G9ciiWpCE
	jvAHXjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTt8-0000000DNDv-2PN8;
	Mon, 29 Jan 2024 15:49:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTt6-0000000DNCd-1Lrj
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C371622B3;
	Mon, 29 Jan 2024 15:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4B4C433F1;
	Mon, 29 Jan 2024 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706543371;
	bh=e0ESeQsRk5SoTUCa6RZLB/A935snlZkD/TqcBFtYBfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klRqlMJkd+WDOpLV4juXYlgk8v3HtObx4BTF0uw+i6uMJ2Ukbl/AnHkgvlzC3Fbeh
	 6/k0AZzH8diBnwhlxKgNtvAV1pnyzv4YX5C8n2D8jRsHUGxqz7zRFU0SuVB3wnLab9
	 IFHbOYbi4/huqwPcpPd4nWnzstOvOF0xQQnUjlNgiLC8Q+qxfpU59I8TnfR3mIHCz/
	 pNpoXRsCLig/7qtUkzPbEMZkSD6AWncpltomFPmywI3UZeEQzN6/7AK8D8wYxWoOiP
	 XEmSj7BUmVDzGjaXikIqMFY1lMv/0F6lECM2o63uF4fnm05hwo4nrnQJUzJVN91/hn
	 c3++kX5OZ/raQ==
Date: Mon, 29 Jan 2024 15:49:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
	llvm@lists.linux.dev, Brandon Wu <brandon.wu@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] RISC-V: fix check for zvkb with tip-of-tree clang
Message-ID: <20240129-always-nurture-f5fe831b8bb2@spud>
References: <20240127090055.124336-1-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240127090055.124336-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_074932_549372_A5EB61B0 
X-CRM114-Status: GOOD (  19.77  )
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
Content-Type: multipart/mixed; boundary="===============3181417619565596399=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3181417619565596399==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EL2F3hYGXg3SLtEB"
Content-Disposition: inline


--EL2F3hYGXg3SLtEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 01:00:54AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>=20
> LLVM commit 8e01042da9d3 ("[RISCV] Add missing dependency check for Zvkb
> (#79467)") broke the check used by the TOOLCHAIN_HAS_VECTOR_CRYPTO
> kconfig symbol because it made zvkb start depending on v or zve*.  Fix
> this by specifying both v and zvkb when checking for support for zvkb.

Seems like a reasonable change on the part of LLVM.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49016bb5077b..912fff31492b9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -581,21 +581,21 @@ config TOOLCHAIN_HAS_ZBB
>  	default y
>  	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zbb)
>  	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zbb)
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
>  	depends on AS_HAS_OPTION_ARCH
> =20
>  # This symbol indicates that the toolchain supports all v1.0 vector cryp=
to
>  # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these a=
t once.
>  # binutils added all except Zvkb, then added Zvkb.  So we just check for=
 Zvkb.
>  config TOOLCHAIN_HAS_VECTOR_CRYPTO
> -	def_bool $(as-instr, .option arch$(comma) +zvkb)
> +	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>  	depends on AS_HAS_OPTION_ARCH
> =20
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
>  	depends on TOOLCHAIN_HAS_ZBB
>  	depends on MMU
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Adds support to dynamically detect the presence of the ZBB
>=20
> base-commit: cb4ede926134a65bc3bf90ed58dace8451d7e759
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--EL2F3hYGXg3SLtEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfJBwAKCRB4tDGHoIJi
0gPKAP4wBaV9cReJkJDl06WUVEYJxyYVr3Il1OGMyQgDVaCHKAD+L7LWWskK+HJW
fTp58Q6g61eD/wtV2oyASlZrEQ8f2g4=
=khU5
-----END PGP SIGNATURE-----

--EL2F3hYGXg3SLtEB--


--===============3181417619565596399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3181417619565596399==--


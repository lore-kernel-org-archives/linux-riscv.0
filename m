Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14397C64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlmDiP4NXhrfshoCybVopukKLanklXEn2zlbcKV6eFk=; b=17i7tVUZQeY9Op+chb807xOiFU
	hhlDNF7KFzvRH7IyABGywwGSyOKf2VRQTmee6GuX0CpBIbO91S/X8Td+Q/NFvdjWqBhaZlvk8O+1F
	ZQVY6gwJch/mptDi0DstXndfJq3BCAqInIaI1YR4jWDg1PHNKnpY/LlQFuLbxl5gd6a2n4eeGG+FJ
	/wktYXo6g9rKq0szn58gLjl0s5edgUvLUWYJ97a770UNOp3QeGgXjCQoYTPgzKRJT5OLA57V46v/u
	NVbMJ8RiW5PnDvDjnXkKwtH9ENf5IfKsOqBWlZI3IdnFgSavb5E/vA9ErfC6lR/12yHpp4yKOsHKm
	Tyv6NqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKWc-000YGg-TO; Thu, 23 Feb 2023 22:57:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKWa-000YFP-5r
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 22:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF66EB81B5B;
	Thu, 23 Feb 2023 22:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D388AC433EF;
	Thu, 23 Feb 2023 22:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677193031;
	bh=CMvWVh79X+f6eowRbYQfLJ0sjzc/tzuVUcjI0SOdTF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESdSDv3pHsfuCWRbsu5n/qFfD//FH8tbzjK2+QgMAzTE1SGEp68HQ5yx/1ORKnhH7
	 nN1ArrRR1KYovuQWsTy3qPE7Ml3raHLKTDIut+jZ5RC5lH0GBCcPFplvcukKrDIqwK
	 EkIUfMozeH9Fffji/kGsEMaIKAgrfOOaanfOB3TRaah+n7jnXZdl37XtTHoFT3bbl/
	 K9QHtOIEUBNltnZ2EG/1N8K8wDZW2toYrzDgWGs93RIRMZgpILOt+RNjhQvt1o5UOs
	 Mlsjj3+aqnxx0HusTYees9OQ0OD3FINOzyhek0Fzi7vCpA5YkfyQTsqebndJaVBwpg
	 eNOZzReidxpsA==
Date: Thu, 23 Feb 2023 22:57:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Stop emitting attributes
Message-ID: <Y/fvRHUzFKy6ZS6i@spud>
References: <20230223224605.6995-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230223224605.6995-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_145716_515700_A46FC9D6 
X-CRM114-Status: GOOD (  20.64  )
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
Content-Type: multipart/mixed; boundary="===============8894041330750452330=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8894041330750452330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zWCjUAMLD4CuVc41"
Content-Disposition: inline


--zWCjUAMLD4CuVc41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 02:46:05PM -0800, Palmer Dabbelt wrote:
> The RISC-V ELF attributes don't contain any useful information.  New
> toolchains ignore them, but they frequently trip up various older/mixed
> toolchains.  So just turn them off.

+cc: stable, yeah?

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Fixes the build for me w/ my awful config w/ gcc-13 + 2 different
binutils versions:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

I still see issues with llvm-17, LLVM=3D1 & ld-2.35 in both purgatory and
regular modules:
  LD      arch/riscv/purgatory/purgatory.ro
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: Invalid or unknown z ISA extension: '=
zifencei'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/sha256.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: Invalid or unknown z ISA extension: '=
zifencei'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/string.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: Invalid or unknown z ISA extension: '=
zifencei'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/ctype.o
make[6]: *** [/stuff/linux/arch/riscv/purgatory/Makefile:95: arch/riscv/pur=
gatory/purgatory.ro] Error 1

So probably still need to pick up some variant of my series I posted
earlier unfortunately:
https://lore.kernel.org/linux-riscv/20230223220546.52879-1-conor@kernel.org/

Thanks!

> ---
> Changes since v1 <20230223195112.10489-1-palmer@rivosinc.com/>:
>=20
> * Add the attributes to both KBUILD_CFLAGS and KBUILD_AFLAGS, so
>   assembly files build without attributes.
> * Set COMPAT_CFLAGS so the compat VDSO builds without attributes.
> ---
>  arch/riscv/Makefile                    | 7 +++++++
>  arch/riscv/kernel/compat_vdso/Makefile | 4 ++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 76989561566b..7b53f0be56b2 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -81,6 +81,13 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
>          KBUILD_CFLAGS +=3D -fno-omit-frame-pointer
>  endif
> =20
> +# The RISC-V attributes frequently cause compatibility issues and provid=
e no
> +# information, so just turn them off.
> +KBUILD_CFLAGS +=3D $(call cc-option,-mno-riscv-attribute)
> +KBUILD_AFLAGS +=3D $(call cc-option,-mno-riscv-attribute)
> +KBUILD_CFLAGS +=3D $(call as-option,-Wa$(comma)-mno-arch-attr)
> +KBUILD_AFLAGS +=3D $(call as-option,-Wa$(comma)-mno-arch-attr)
> +
>  KBUILD_CFLAGS_MODULE +=3D $(call cc-option,-mno-relax)
>  KBUILD_AFLAGS_MODULE +=3D $(call as-option,-Wa$(comma)-mno-relax)
> =20
> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/c=
ompat_vdso/Makefile
> index 260daf3236d3..7f34f3c7c882 100644
> --- a/arch/riscv/kernel/compat_vdso/Makefile
> +++ b/arch/riscv/kernel/compat_vdso/Makefile
> @@ -14,6 +14,10 @@ COMPAT_LD :=3D $(LD)
>  COMPAT_CC_FLAGS :=3D -march=3Drv32g -mabi=3Dilp32
>  COMPAT_LD_FLAGS :=3D -melf32lriscv
> =20
> +# Disable attributes, as they're useless and break the build.
> +COMPAT_CC_FLAGS +=3D $(call cc-option,-mno-riscv-attribute)
> +COMPAT_CC_FLAGS +=3D $(call as-option,-Wa$(comma)-mno-arch-attr)
> +
>  # Files to link into the compat_vdso
>  obj-compat_vdso =3D $(patsubst %, %.o, $(compat_vdso-syms)) note.o
> =20
> --=20
> 2.39.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--zWCjUAMLD4CuVc41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/fvRAAKCRB4tDGHoIJi
0oaDAP4inmATtdXlu5kBRBTZKtLSMWkwBlY0Z9J1nk3OroAuFwEA13n79VenSUAg
66z3UdzRDWD7eDYg4ZZKzz7aaSTWJA4=
=R/OB
-----END PGP SIGNATURE-----

--zWCjUAMLD4CuVc41--


--===============8894041330750452330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8894041330750452330==--


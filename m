Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40471C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 21:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sI7jeneVZf8qHkYLRFZn25Lezx1hT8IJtPv3inPVWWU=; b=JQ9VTEfh/7aar6re4gKdkUdsnB
	fC3XMkTSirKyDXXexrrXQ72lunFbVmjYiSlBKW8BOIIbJbVETKYxqP+anPlJl1pFBcaBJnRrTpQ+c
	S4tUDW++EoetFLtY9IGgmbwsdVqvCBu54sxfJWs3o2Qw8BJG6odeF6YSxa/sjnDegYDCC36GsaCr0
	5GKjPNaMZxlku9QNx3nj5kUcvv6hzjiRLhYGO0isjNiJcjGWqdys7pnl8smRH4FaKU3B7tecqBOqA
	Gyds/a4LCQ/vxdRWdy+ZCwknL2svi0Y6pzixTdrJpcZUK2HGbZ0TGeRuetBBYaDtT6GGT42jp5wXa
	Gz6gGosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVIyf-000N0O-Q4; Thu, 23 Feb 2023 21:18:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVIyc-000MzL-8y
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 21:18:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5044C6179C;
	Thu, 23 Feb 2023 21:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9C8C4339C;
	Thu, 23 Feb 2023 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677187084;
	bh=ryMScYPKgcG2y/dIoerUES8vyJI6dI87YEw1j2E6dSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geW8yMwU8qnT+6fGz/aR8NCnI0FKkOGMfAakDGnxakPoKvBD2GgpDyS/aOKrK7FKZ
	 SmmX0ejzAaNKriODryQvJFRXam9xHPudpYvFOAsZvDLQudiEVR1VhaLsPESRlIPrBz
	 SQjnKWXK3rEHO4gYS+bMVX/23Mr0Btknh4pEJ+Eq1sZMb/Rq+MxjWq2VVouLVJmJRf
	 4bUtl0X1RRRAmtxvdIvmP/UMpg7vmC3WrpM9u/NXiTieQl9pfU72YD9M8oXl80dzL1
	 pSwh6xvEMqn52Y5dXRMGJOzHStpLX2AubHppI1NLbyn1J2mFbHupotuqlXYWu9r1kS
	 azdqpbpuuPeAA==
Date: Thu, 23 Feb 2023 21:18:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Stop emitting attributes
Message-ID: <Y/fYCbcHByowuhD1@spud>
References: <20230223195112.10489-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230223195112.10489-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_131806_434196_D419EEDD 
X-CRM114-Status: GOOD (  16.22  )
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
Content-Type: multipart/mixed; boundary="===============8405679380621118821=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8405679380621118821==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c1vsZHsT+lu3/Lpd"
Content-Disposition: inline


--c1vsZHsT+lu3/Lpd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 11:51:12AM -0800, Palmer Dabbelt wrote:
> The RISC-V ELF attributes don't contain any useful information.  New
> toolchains ignore them, but they frequently trip up various older/mixed
> toolchains.  So just turn them off.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 76989561566b..1fc504e2b85e 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -81,6 +81,11 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
>          KBUILD_CFLAGS +=3D -fno-omit-frame-pointer
>  endif
> =20
> +# The RISC-V attributes frequently cause compatibility issues and provid=
e no
> +# information, so just turn them off.
> +KBUILD_CFLAGS +=3D $(call cc-option,-mno-riscv-attribute)
> +KBUILD_CFLAGS +=3D $(call as-option,-Wa$(comma)-mno-arch-attr)
> +
>  KBUILD_CFLAGS_MODULE +=3D $(call cc-option,-mno-relax)
>  KBUILD_AFLAGS_MODULE +=3D $(call as-option,-Wa$(comma)-mno-relax)

As requested, the build issues I see w/ this patch applied & ld 2.35:
  LD      arch/riscv/purgatory/purgatory.ro
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/memcpy.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/memset.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/strcmp.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/strlen.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/purgatory/strncmp.o
  CHECK   /stuff/linux/ipc/ipc_sysctl.c
make[6]: *** [/stuff/linux/arch/riscv/purgatory/Makefile:95: arch/riscv/pur=
gatory/purgatory.ro] Error 1
make[6]: Target 'arch/riscv/purgatory/' not remade because of errors.
make[5]: *** [/stuff/linux/scripts/Makefile.build:504: arch/riscv/purgatory=
] Error 2
  CC      arch/riscv/mm/dma-noncoherent.o
  AR      arch/riscv/kernel/probes/built-in.a
  CHECK   /stuff/linux/lib/zlib_inflate/inffast.c
  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
  VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/kernel/vdso/getcpu.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/kernel/vdso/flush_icache.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv64i2p0=
_m2p0_a2p0_f2p0_d2p0_c2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zm=
mul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/kernel/vdso/note.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv32i2p0=
_m2p0_a2p0_f2p0_d2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/kernel/compat_vdso/getcpu.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv32i2p0=
_m2p0_a2p0_f2p0_d2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/kernel/compat_vdso/flush_icache.o
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=3Drv32i2p0=
_m2p0_a2p0_f2p0_d2p0_zmmul1p0: Invalid or unknown z ISA extension: 'zmmul'
/stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge t=
arget specific data of file arch/riscv/kernel/compat_vdso/note.o
  OBJCOPY arch/riscv/kernel/compat_vdso/compat_vdso.so
  OBJCOPY arch/riscv/kernel/vdso/vdso.so
riscv64-unknown-linux-gnu-objcopy: 'arch/riscv/kernel/compat_vdso/compat_vd=
so.so.dbg': No such file
riscv64-unknown-linux-gnu-objcopy: 'arch/riscv/kernel/vdso/vdso.so.dbg': No=
 such file
make[7]: *** [/stuff/linux/arch/riscv/kernel/compat_vdso/Makefile:48: arch/=
riscv/kernel/compat_vdso/compat_vdso.so] Error 1

Specifically this is what I am running:
CONFIG_CC_VERSION_TEXT=3D"riscv64-unknown-linux-gnu-gcc (ge4703bd0e15-dirty=
) 13.0.1 20230122 (experimental)"
CONFIG_CC_IS_GCC=3Dy
CONFIG_GCC_VERSION=3D130001
CONFIG_AS_IS_GNU=3Dy
CONFIG_AS_VERSION=3D24050
CONFIG_LD_IS_BFD=3Dy
CONFIG_LD_VERSION=3D23500

Cheers,
Conor.


--c1vsZHsT+lu3/Lpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/fYBQAKCRB4tDGHoIJi
0oyeAP46jUFW2mUS3M2/YC1ohjbAG8pWDUyKgrn2zaNGQ7ADMQEAsms2+WRe+0j6
0rgAzg+efjAzWceORpjswfX5VrpeMAI=
=0B/X
-----END PGP SIGNATURE-----

--c1vsZHsT+lu3/Lpd--


--===============8405679380621118821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8405679380621118821==--


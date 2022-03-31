Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5247BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVpulpO4EeY0rM0ixq2dhmyjPosEZlHHM++dCdcVjEo=; b=GkDsG+8tZQAhI51/ZGt1MWIkwF
	M/DUSYpXgdfuXnmQq8agXFiQUJ9hdvGWEWUmCTAcbL0evbgkHNdIejpWvJMw7U+O34fPcCPJCye/m
	Lc1B/pa2XuXDBiwQLdAoc4KmCSiy9Zinw+FS9hEXHkD2F9IcOeeMu4VvbKBU2N5wpHR1W1W6rAW6m
	noasgMM80N+C9Sr0fBbJlTdf66viNOGsV7IxW2vtsf74LBLwu2T9x9eZMUzrZkUaHrDcKZks7MiK4
	rknpoMK96JkA5mt7ni55iMiCmhT0M9TnVNBrl695XgzCsqDtdF8nSWMDDzZyypAxw8/BaaEs/pzgE
	I9pHKUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZs6v-001riI-2z; Thu, 31 Mar 2022 10:33:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZs6s-001rht-0h
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 10:33:00 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1nZs6k-000591-1J; Thu, 31 Mar 2022 12:32:50 +0200
Received: from pengutronix.de
 (2a03-f580-87bc-d400-ffcf-bd2e-518f-8dbf.ip6.dokom21.de
 [IPv6:2a03:f580:87bc:d400:ffcf:bd2e:518f:8dbf])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id A858C57B54;
 Thu, 31 Mar 2022 10:32:47 +0000 (UTC)
Date: Thu, 31 Mar 2022 12:32:47 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
Message-ID: <20220331103247.y33wvkxk5vfbqohf@pengutronix.de>
References: <20220126171442.1338740-1-aurelien@aurel32.net>
MIME-Version: 1.0
In-Reply-To: <20220126171442.1338740-1-aurelien@aurel32.net>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_033258_098188_2671D56B 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: multipart/mixed; boundary="===============4805422832958951090=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4805422832958951090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vglrjwx3za2fhczz"
Content-Disposition: inline


--vglrjwx3za2fhczz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26.01.2022 18:14:42, Aurelien Jarno wrote:
> From version 2.38, binutils default to ISA spec version 20191213. This
> means that the csr read/write (csrr*/csrw*) instructions and fence.i
> instruction has separated from the `I` extension, become two standalone
> extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> this causes the following build failure:
>=20
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler mess=
ages:
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unre=
cognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unre=
cognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unre=
cognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unre=
cognized opcode `csrr a5,0xc01'
>=20
> The fix is to specify those extensions explicitely in -march. However as
> older binutils version do not support this, we first need to detect
> that.
>=20
> Cc: stable@vger.kernel.org # 4.15+
> Cc: Kito Cheng <kito.cheng@gmail.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 8a107ed18b0d..7d81102cffd4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -50,6 +50,12 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
>  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> +
> +# Newer binutils versions default to ISA spec version 20191213 which mov=
es some
> +# instructions from the I extension to the Zicsr and Zifencei extensions.
> +toolchain-need-zicsr-zifencei :=3D $(call cc-option-yn, -march=3D$(riscv=
-march-y)_zicsr_zifencei)
> +riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $(riscv-march-y)_zicsr=
_zifencei
> +
>  KBUILD_CFLAGS +=3D -march=3D$(subst fd,,$(riscv-march-y))
>  KBUILD_AFLAGS +=3D -march=3D$(riscv-march-y)

I'm on current linus/master, this change breaks on current Debian
testing with:

| make: Leaving directory 'linux'
|   SYNC    include/config/auto.conf.cmd
|   GEN     Makefile
|   GEN     Makefile
|   CC      scripts/mod/empty.o
|   CHECK   linux/scripts/mod/empty.c
| invalid argument to '-march': '_zicsr_zifencei'

Used components:

| $ riscv64-linux-gnu-gcc -v
| Using built-in specs.
| COLLECT_GCC=3D/usr/bin/riscv64-linux-gnu-gcc
| COLLECT_LTO_WRAPPER=3D/usr/lib/gcc-cross/riscv64-linux-gnu/11/lto-wrapper
| Target: riscv64-linux-gnu
| Configured with: ../src/configure -v --with-pkgversion=3D'Debian 11.2.0-9=
' --with-bugurl=3Dfile:///usr/share/doc/gcc-11/README.Bugs --enable-languag=
es=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-majo=
r-version-only --program-suffix=3D-11 --enable-shared --enable-linker-build=
-id --libexecdir=3D/usr/lib --without-included-gettext --enable-threads=3Dp=
osix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --enable-clocale=
=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --with-defaul=
t-libstdcxx-abi=3Dnew --enable-gnu-unique-object --disable-libitm --disable=
-libquadmath --disable-libquadmath-support --enable-plugin --enable-default=
-pie --with-system-zlib --enable-libphobos-checking=3Drelease --without-tar=
get-system-zlib --enable-multiarch --disable-werror --disable-multilib --wi=
th-arch=3Drv64imafdc --with-abi=3Dlp64d --enable-checking=3Drelease --build=
=3Dx86_64-linux-gnu --host=3Dx86_64-linux-gnu --target=3Driscv64-linux-gnu =
--program-prefix=3Driscv64-linux-gnu- --includedir=3D/usr/riscv64-linux-gnu=
/include --with-build-config=3Dbootstrap-lto-lean --enable-link-serializati=
on=3D2
| Thread model: posix
| Supported LTO compression algorithms: zlib zstd
| gcc version 11.2.0 (Debian 11.2.0-9)=20
| $ riscv64-linux-gnu-ld -v
| GNU ld (GNU Binutils for Debian) 2.38

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--vglrjwx3za2fhczz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJFg0wACgkQrX5LkNig
010Pvgf/ZoWGG7K/5FYXrD6DqvRxaZGgXBUeIVFePKiNNRXC82F6VNIytbqSEg09
9LcT0qzh51lGHAI9n+ur77Hmiit//P0M3GYLxigpabDMtBoYN5iWwZpobYMP42ox
DCZ4ECYfzj/Hhtm++McTEGMW+EMCaKOf+53R3hS6Z7vmgfltDoT/Y6bmTNs9Vjue
bvxT9UN8iVhNiPgSwmA4VVaNAHoTyzYS+Axck6ndKq2qWLh6Rbu45MYaNMtWgz7l
Qfptz5E9TOaGItBnV47952dz2U6tsIvqNZBXdsqgQ501oeZMfk3jTvP+agrekeal
GDu+6B+/oPYD13DvqdchERnZaYNJLw==
=Jfvd
-----END PGP SIGNATURE-----

--vglrjwx3za2fhczz--


--===============4805422832958951090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4805422832958951090==--


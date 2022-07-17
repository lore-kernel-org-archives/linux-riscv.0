Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E15DC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5gqa1Wk7na4JKYqi+PpQob0Aj+IpO+c1MyJh/m7VDI=; b=pNKtkT5A8YTIvobJPEPU6p4Sne
	fZXQKbWwq62Hn1r0ZqLuQuMcS1ajlt8a61suz9KpmB/pLmX0vMY7YxZF52CgKAUEyrPQvsSekCHt9
	cHRqW9UhmE6YEb4i5pVtWXVT19sa+Tmq8ZwogNCjkD6iw8IlPryXH/iMKCg7Q85sbVmDtY4xfQz4O
	uAbUi5UNu6jpBMQ3MFWLBOteZgo3Nr0zgVjCWxN32HL+6QEmgLFrAt8pddfL5q2NB34IJx+RAjcmq
	yNSjvQ6h+7b1wYQ991W8wcDuJecspw6nJjAET7x0e2djecYHP5Dc36SJPv5Fy14yzZ7ugx7ZSGL1t
	DpCffpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD6AU-007c2Y-Ew; Sun, 17 Jul 2022 15:26:50 +0000
Received: from maynard.decadent.org.uk ([95.217.213.242])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD6AR-007c21-8b
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 15:26:49 +0000
Received: from [91.187.115.177] (helo=deadeye)
	by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ben@decadent.org.uk>)
	id 1oD6AH-0000dN-NF; Sun, 17 Jul 2022 17:26:37 +0200
Received: from ben by deadeye with local (Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1oD6AH-006iIL-0M;
	Sun, 17 Jul 2022 17:26:37 +0200
Message-ID: <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
From: Ben Hutchings <ben@decadent.org.uk>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Date: Sun, 17 Jul 2022 17:26:32 +0200
In-Reply-To: <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
	 <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
User-Agent: Evolution 3.44.2-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.187.115.177
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_082647_502884_423B7473 
X-CRM114-Status: GOOD (  18.83  )
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
Content-Type: multipart/mixed; boundary="===============6680536474309963998=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6680536474309963998==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tMaz2C8QiK6rYT14V6Ol"


--=-tMaz2C8QiK6rYT14V6Ol
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2022-07-17 at 22:31 +0800, Guo Ren wrote:
> On Thu, Jul 14, 2022 at 7:21 PM Ben Hutchings <ben@decadent.org.uk> wrote=
:
> >=20
> > The recipe for vdso_install in arch/riscv/Makefile invokes targets of
> > the same name in arch/riscv/kernel/vdso and .../compat_vdso, but the
> > target in the latter is called compat_vdso_install.  Change the
> > recipe to use the right target name.
> >=20
> > Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code ..=
.")
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > ---
> >  arch/riscv/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 34cf8a598617..ee763562895c 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -110,7 +110,7 @@ PHONY +=3D vdso_install
> >  vdso_install:
> >         $(Q)$(MAKE) $(build)=3Darch/riscv/kernel/vdso $@
> >         $(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> > -               $(build)=3Darch/riscv/kernel/compat_vdso $@)
> > +               $(build)=3Darch/riscv/kernel/compat_vdso compat_vdso_in=
stall)
> Good catch, but what's the problem you've met?

It broke the Debian package build
<https://buildd.debian.org/status/fetch.php?pkg=3Dlinux&arch=3Driscv64&ver=
=3D5.19%7Erc6-1%7Eexp1&stamp=3D1657777338&raw=3D0>:

[...] /usr/bin/make [...] -C debian/build/build_riscv64_none_riscv64 vdso_i=
nstall INSTALL_MOD_PATH=3D'/<<PKGBUILDDIR>>'/debian/linux-image-5.19.0-rc6-=
riscv64-dbg/usr/lib/debug
make[3]: Entering directory '/<<PKGBUILDDIR>>/debian/build/build_riscv64_no=
ne_riscv64'
[...]
/usr/bin/make -f /<<PKGBUILDDIR>>/scripts/Makefile.build obj=3Darch/riscv/k=
ernel/vdso vdso_install
[...]
   gcc-11 -Wp,-MMD,arch/riscv/kernel/vdso/.vgettimeofday.o.d -nostdinc -I/<=
<PKGBUILDDIR>>/arch/riscv/include -I./arch/riscv/include/generated -I/<<PKG=
BUILDDIR>>/include -I./include -I/<<PKGBUILDDIR>>/arch/riscv/include/uapi -=
I./arch/riscv/include/generated/uapi -I/<<PKGBUILDDIR>>/include/uapi -I./in=
clude/generated/uapi -include /<<PKGBUILDDIR>>/include/linux/compiler-versi=
on.h -include /<<PKGBUILDDIR>>/include/linux/kconfig.h -include /<<PKGBUILD=
DIR>>/include/linux/compiler_types.h -D__KERNEL__ -DCC_USING_PATCHABLE_FUNC=
TION_ENTRY -fmacro-prefix-map=3D/<<PKGBUILDDIR>>/=3D -Wall -Wundef -Werror=
=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshor=
t-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit=
-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -mabi=3Dlp64 -=
march=3Drv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=3D0x=
ff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-pointer -mstrict-align -=
fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -W=
no-format-overflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-=
races -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplicit-fallth=
rough=3D5 -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-variable=
 -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-prote=
ction -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function=
-type -Wno-stringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-ma=
ybe-uninitialized -Wno-alloc-size-larger-than -fno-strict-overflow -fno-sta=
ck-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointe=
r-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -g -fdebug-prefix=
-map=3D/<<PKGBUILDDIR>>/=3D -fno-stack-protector -fPIC -include /<<PKGBUILD=
DIR>>/lib/vdso/gettimeofday.c -I /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso -I=
 ./arch/riscv/kernel/vdso    -DKBUILD_MODFILE=3D'"arch/riscv/kernel/vdso/vg=
ettimeofday"' -DKBUILD_BASENAME=3D'"vgettimeofday"' -DKBUILD_MODNAME=3D'"vg=
ettimeofday"' -D__KBUILD_MODNAME=3Dkmod_vgettimeofday -c -o arch/riscv/kern=
el/vdso/vgettimeofday.o /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso/vgettimeofd=
ay.c =20
[...]
  /<<PKGBUILDDIR>>/scripts/check-local-export arch/riscv/kernel/vdso/vgetti=
meofday.o
  if nm arch/riscv/kernel/vdso/vgettimeofday.o 2>/dev/null | grep -q __ksym=
tab; then  gcc-11 -E -D__GENKSYMS__ -Wp,-MMD,arch/riscv/kernel/vdso/.vgetti=
meofday.o.d -nostdinc -I/<<PKGBUILDDIR>>/arch/riscv/include -I./arch/riscv/=
include/generated -I/<<PKGBUILDDIR>>/include -I./include -I/<<PKGBUILDDIR>>=
/arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I/<<PKGBUIL=
DDIR>>/include/uapi -I./include/generated/uapi -include /<<PKGBUILDDIR>>/in=
clude/linux/compiler-version.h -include /<<PKGBUILDDIR>>/include/linux/kcon=
fig.h -include /<<PKGBUILDDIR>>/include/linux/compiler_types.h -D__KERNEL__=
 -DCC_USING_PATCHABLE_FUNCTION_ENTRY -fmacro-prefix-map=3D/<<PKGBUILDDIR>>/=
=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-al=
iasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-decla=
ration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-security -s=
td=3Dgnu11 -mabi=3Dlp64 -march=3Drv64imac_zicsr_zifencei -mno-save-restore =
-DCONFIG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame=
-pointer -mstrict-align -fno-delete-null-pointer-checks -Wno-frame-address =
-Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -=
O2 -fno-allow-store-data-races -Wframe-larger-than=3D2048 -fstack-protector=
-strong -Wimplicit-fallthrough=3D5 -Wno-main -Wno-unused-but-set-variable -=
Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-cal=
ls -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-poi=
nter-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-overf=
low -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -fno=
-strict-overflow -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Wer=
ror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wno-packed-not-=
aligned -g -fdebug-prefix-map=3D/<<PKGBUILDDIR>>/=3D -fno-stack-protector -=
fPIC -include /<<PKGBUILDDIR>>/lib/vdso/gettimeofday.c -I /<<PKGBUILDDIR>>/=
arch/riscv/kernel/vdso -I ./arch/riscv/kernel/vdso    -DKBUILD_MODFILE=3D'"=
arch/riscv/kernel/vdso/vgettimeofday"' -DKBUILD_BASENAME=3D'"vgettimeofday"=
' -DKBUILD_MODNAME=3D'"vgettimeofday"' -D__KBUILD_MODNAME=3Dkmod_vgettimeof=
day /<<PKGBUILDDIR>>/arch/riscv/kernel/vdso/vgettimeofday.c | scripts/genks=
yms/genksyms   -r /dev/null >> arch/riscv/kernel/vdso/.vgettimeofday.o.cmd;=
 fi
  ld -melf64lriscv  -shared -S -soname=3Dlinux-vdso.so.1 --build-id=3Dsha1 =
--hash-style=3Dboth --eh-frame-hdr -T arch/riscv/kernel/vdso/vdso.lds arch/=
riscv/kernel/vdso/rt_sigreturn.o arch/riscv/kernel/vdso/vgettimeofday.o arc=
h/riscv/kernel/vdso/getcpu.o arch/riscv/kernel/vdso/flush_icache.o arch/ris=
cv/kernel/vdso/note.o -o arch/riscv/kernel/vdso/vdso.so.dbg.tmp && objcopy =
 -G __vdso_rt_sigreturn  -G __vdso_vgettimeofday  -G __vdso_getcpu  -G __vd=
so_flush_icache arch/riscv/kernel/vdso/vdso.so.dbg.tmp arch/riscv/kernel/vd=
so/vdso.so.dbg && rm arch/riscv/kernel/vdso/vdso.so.dbg.tmp
  cp arch/riscv/kernel/vdso/vdso.so.dbg /<<PKGBUILDDIR>>/debian/linux-image=
-5.19.0-rc6-riscv64-dbg/usr/lib/debug/lib/modules/5.19.0-rc6-riscv64/vdso/v=
dso.so
  :
/usr/bin/make -f /<<PKGBUILDDIR>>/scripts/Makefile.build obj=3Darch/riscv/k=
ernel/compat_vdso vdso_install
[...]
make[4]: *** No rule to make target 'vdso_install'.  Stop.
make[3]: *** [/<<PKGBUILDDIR>>/arch/riscv/Makefile:112: vdso_install] Error=
 2
make[3]: Leaving directory '/<<PKGBUILDDIR>>/debian/build/build_riscv64_non=
e_riscv64'
make[2]: *** [debian/rules.real:513: install-image-dbg_riscv64_none_riscv64=
] Error 2
make[2]: *** Waiting for unfinished jobs....

Ben.

>=20
> >=20
> >  ifeq ($(KBUILD_EXTMOD),)
> >  ifeq ($(CONFIG_MMU),y)
>=20
>=20
>=20

--=20
Ben Hutchings
This sentence contradicts itself - no actually it doesn't.

--=-tMaz2C8QiK6rYT14V6Ol
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmLUKigACgkQ57/I7JWG
EQl5tRAAkp4zpCvNcYJwHB76BEEoMXhKGQu+dl5CWZtVfDU8PrNgWdGE8tCRyQXe
mSXT5g+f2cRt1osSqfM0BBQzHqmGkPgVUrE8cUGwlJuoifJdvBEY+WBeKvwHkppV
ByKZwLSgbCVY8GvCm1s3t6+Xa1gAoGny0tXI/lV4/K+LXVMaZ0TyRkuO75lhvcf2
noVzlC9nWhLvpoNPQC0O4DH5gPyE25uqrdWyojr8Ng7ZqOpiZO5a4iPmXSiF5ZmA
yCvuTldgOv7Lf7kN/x5V3OFeXVDm8Q1O5FPiffPwDn7E+OihSJQ6wjd1oT56l/ik
Mfr5ZzxSdJKqzbOejJXoX4HbUuyminNd+wzsXlI6yYdkjYCrOnH3U7kKNKztNt2i
MaouuR7rUivVgqwmbN6GW6EwIATP1abYMKOPWG7korarThD63a7WOSdZ9fB+E5PO
qzlffNF4a3T/fZ9HuQRXfWEuw++N2pQjReRqoxAmEFLrMXwfpcVsKOdymEyQhK42
uMfHNQwlE/DsPB2s2O0YBJ1HkN+S8FfmCKKYt/YsAdpTwC/IA+uEVBjNOW4g6Atm
PGynVR/Ir4rZxR0AVZwlMa6aDlasqMQVJN0+qDhCh+Ey4X3/qg4A85J82HqB7d0r
j7EC+a1+0lDr7a1II4u6pWSVztBBFro+owLd5LKlqKJbQZXqc1A=
=2McV
-----END PGP SIGNATURE-----

--=-tMaz2C8QiK6rYT14V6Ol--


--===============6680536474309963998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6680536474309963998==--


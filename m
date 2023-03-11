Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC02C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMTgw/p2eL+cyegVBAk0pwNGI79gLXYW2sTJSFBMU1g=; b=Y08VZgYSYuXUyJRf60165qDd6F
	aiCqDA0F28AWklIrcR3unTCHFqP2vO1taofpZ/LWGk2I38OxspPvU1BSDjrVKMplvfF9ErlpvyrTN
	zWk1tLN2+Aq4ozSy2nEq8gQ1E59z1oi4Pk1GZAxuiyR6SygnmUZXekkLOE0lZc7SzktgLwn3Ob+o3
	O6UJ9PsEjfEkQdR9VPTaaeRV7MfCk5S3EuNBmTjtnoWIb4F9nbUnz61WHhBw+YoU7J1ROWSh0//IQ
	+FDTxkVYWdYJTJ13s53y8vVDofjXIAn+cqLXZy78HMvWsakDxS4u+LKjDkilzULK2KutoV8QH+OyG
	TYRlt7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pawrp-000Bvc-0R; Sat, 11 Mar 2023 10:54:25 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pawrl-000Bv4-NE
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 10:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jnao2BJNTLUPlddy9ca6gWQanZGg0OEymJg6+c3d6Wc=; b=qwtrJqY5FLFG6oDdhWU6seZdcd
	C7sj69zek64KIVL/HXLgM3vxAD5FlmpBXwi70WZin0NkgY2xzbpL9Xb1Hoq8whAI4SGfRMOpmuO35
	XAQQFhYFjoigT+X2fhTp/j6xK0sRYEuBEMXwBycQ5exzcChuadr5pP5pEobEGDz8ve5Z4I5/8xBoE
	JI1wCCif4q7ZfCdfmKhfJqYEZP8TtpKRQ/eF+O4Mpn9jEtOg5C7VBmSK7tM59mQiYkJhJnlZOYkI5
	IstPH46emQMV9J6Q/fH/vCdhaeBQVazpcmvFFTcbTwSw/eQ75FD2m7BTTHD2xfLT2S8zu285qRkdQ
	2VUfZbtA==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1pawrj-00BkHU-9I; Sat, 11 Mar 2023 11:54:19 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1pawri-00AAK8-22;
	Sat, 11 Mar 2023 11:54:18 +0100
Date: Sat, 11 Mar 2023 11:54:18 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Conor Dooley <conor@kernel.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	naresh.kamboju@linaro.org, nathan@kernel.org,
	ndesaulniers@google.com, palmer@dabbelt.com, palmer@rivosinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
Message-ID: <ZAxd2q4YNk1gdBFp@aurel32.net>
References: <20230308220842.1231003-1-conor@kernel.org>
 <20230310150754.535425-1-bmeng.cn@gmail.com>
 <CAEUhbmWcfcSmuU6VnbTdLoErT113RZPgHSK3c+3M5kU0Wsv1pg@mail.gmail.com>
 <243c92f1-c1e0-428b-ab31-3d9c9088b2c2@spud>
 <ZAxT7T9Xy1Fo3d5W@aurel32.net>
 <88fadde1-27eb-40c6-b90e-881ebf9690df@spud>
MIME-Version: 1.0
In-Reply-To: <88fadde1-27eb-40c6-b90e-881ebf9690df@spud>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_025421_923943_68301C3D 
X-CRM114-Status: GOOD (  51.80  )
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
Content-Type: multipart/mixed; boundary="===============0353721521530594439=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0353721521530594439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ttwf3n8SQWrJ17vf"
Content-Disposition: inline


--ttwf3n8SQWrJ17vf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023-03-11 10:40, Conor Dooley wrote:
> On Sat, Mar 11, 2023 at 11:11:57AM +0100, Aurelien Jarno wrote:
> > On 2023-03-10 16:40, Conor Dooley wrote:
> > > On Fri, Mar 10, 2023 at 11:35:57PM +0800, Bin Meng wrote:
> > > > On Fri, Mar 10, 2023 at 11:07=E2=80=AFPM Bin Meng <bmeng.cn@gmail.c=
om> wrote:
> > > > >
> > > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > > >
> > > > > > The spec folk, in their infinite wisdom, moved both control and=
 status
> > > > > > registers & the FENCE.I instructions out of the I extension int=
o their
> > > > > > own extensions (Zicsr, Zifencei) in the 20190608 version of the=
 ISA
> > > > > > spec [0].
> > > > > > The GCC/binutils crew decided [1] to move their default version=
 of the
> > > > > > ISA spec to the 20191213 version of the ISA spec, which came in=
to being
> > > > > > for version 2.38 of binutils and GCC 12. Building with this too=
lchain
> > > > > > configuration would result in assembler issues:
> > > > > >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> > > > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Asse=
mbler messages:
> > > > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: E=
rror: unrecognized opcode `csrr a5,0xc01'
> > > > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: E=
rror: unrecognized opcode `csrr a5,0xc01'
> > > > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: E=
rror: unrecognized opcode `csrr a5,0xc01'
> > > > > >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: E=
rror: unrecognized opcode `csrr a5,0xc01'
> > > > > > This was fixed in commit 6df2a016c0c8 ("riscv: fix build with b=
inutils
> > > > > > 2.38") by Aurelien Jarno, but has proven fragile.
> > > > > >
> > > > > > Before LLVM 17, LLVM did not support these extensions and, as s=
uch, the
> > > > > > cc-option check added by Aurelien worked. Since commit 22e199e6=
afb1
> > > > > > ("[RISCV] Accept zicsr and zifencei command line options") howe=
ver, LLVM
> > > > > > *does* support them and the cc-option check passes.
> > > > > >
> > > > > > This surfaced as a problem while building the 5.10 stable kerne=
l using
> > > > > > the default Tuxmake Debian image [2], as 5.10 did not yet suppo=
rt ld.lld,
> > > > > > and uses the Debian provided binutils 2.35.
> > > > > > Versions of ld prior to 2.38 will refuse to link if they encoun=
ter
> > > > > > unknown ISA extensions, and unfortunately Zifencei is not suppo=
rted by
> > > > > > bintuils 2.35.
> > > > > >
> > > > > > Instead of dancing around with adding these extensions to march=
, as we
> > > > > > currently do, Palmer suggested locking GCC builds to the same v=
ersion of
> > > > > > the ISA spec that is used by LLVM. As far as I can tell, that i=
s 2.2,
> > > > > > with, apparently [3], a lack of interest in implementing a flag=
 like
> > > > > > GCC's -misa-spec at present.
> > > > > >
> > > > > > Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAG=
S when
> > > > > > GCC is used & remove the march dance.
> > > > > >
> > > > > > As clang does not accept this argument, I had expected to encou=
nter
> > > > > > issues with the assembler, as neither zicsr nor zifencei are pr=
esent in
> > > > > > the ISA string and the spec version *should* be defaulting to a=
 version
> > > > > > that requires them to be present. The build passed however and =
the
> > > > > > resulting kernel worked perfectly fine for me on a PolarFire So=
C...
> > > > > >
> > > > > > Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.p=
df [0]
> > > > > > Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/a=
E1ZeHHCYf4 [1]
> > > > > > Link: https://lore.kernel.org/all/CA+G9fYt9T=3DELCLaB9byxaLW2Qf=
4pZcDO=3DhuCA0D8ug2V2+irJQ@mail.gmail.com/ [2]
> > > > > > Link: https://discourse.llvm.org/t/specifying-unpriviledge-spec=
-version-misa-spec-gcc-flag-equivalent/66935 [3]
> > > > > > CC: stable@vger.kernel.org
> > > > > > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > ---
> > > > > > I think Aurelien's original commit message might actually not b=
e quite
> > > > > > correct? I found, in my limited testing, that it is not the def=
ault
> > > > > > behaviour of gas that matters, but rather the toolchain itself?
> > > > > > My binutils versions (both those built using the clang-built-li=
nux
> > > > > > tc-build scripts which do not set an ISA spec version, and one =
built
> > > > > > using the riscv-gnu-toolchain infra w/ an explicit 20191213 spe=
c version
> > > > > > set) do not encounter these issues.
> > > > >
> > > > > I am unable to reproduce the build failure as reported by commit =
6df2a016c0c8
> > > > > ("riscv: fix build with binutils 2.38") by Aurelien Jarno using k=
ernel.org
> > > > > pre-built GCC 11.3.0 [1] which includes binutils 2.38.
> > > > >
> > > > > [1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin=
/x86_64/11.3.0/x86_64-gcc-11.3.0-nolibc-x86_64-linux.tar.xz
> > > > >
> > > > > The defconfig of v5.16 kernel (commit 6df2a016c0c8 lands in v5.17=
) builds fine
> > > > > for me. Anything I am missing?
> > > > >
> > > >=20
> > > > Some further note:
> > > >=20
> > > > After I switched to kernel.org pre-built GCC 12.2.0 [1] which inclu=
des
> > > > binutils 2.39, I was able to reproduce the exact same build failure=
 of
> > > > v5.16 kernel as described in the commit 6df2a016c0c8 ("riscv: fix
> > > > build with binutils 2.38") by Aurelien Jarno.
> > > >=20
> > > > To verify the commit message of 6df2a016c0c8 is accurate or not, I
> > > > built a GAS from binutils 2.37 and replaced the GAS 2.39 in the
> > > > kernel.org package, surprisingly kernel v5.16 did not build with the
> > > > same build failure.
> > > >=20
> > > > So it seems that it's GCC that caused the build failure instead of =
GAS
> > > > from binutils??
> > >=20
> > > Right, that's what I was getting at in the bit below the --- line in =
my
> > > patch. I think Aurelien was misled by the failure message and your em=
ail
> > > ([1] in my links above) which claimed that binutils would default to
> > > the 20191213 spec.
> >=20
> > No I was not misled by that, at that time GCC 11.3 and GCC 12 were not
> > released.
> >=20
> > binutils definitely defaults to 20191213 if you do not use the
> > --with-isa-spec with a different value when configuring it.
>=20
> I specifically built binutils without that flag, and had no issues
> building the kernel with clang, which is the source of my confusion here
> really.
> I'd have expected that to fail
>=20
> > > It appears (and I'm not a tc person) that GCC must call GAS with the
> > > --misa-spec argument, and in GCC 12 the value used is 20191213.
> > > Either GCC 11 must pass --misa-spec=3D2.2 to binutils, or it passes
> > > nothing, leading binutils to be permissive about what -march=3Drv64i
> > > means.
> >=20
> > GCC 11.1 and 11.2 pass nothing to binutils, hence the issue I reported
> > and the patch fixing that. Basic support for misa-spec has been
> > backported to GCC 11.3, with a default to --misa-spec=3D2.2, hence the
> > "permissive" behaviour you observe.
> >=20
> > > The permissive option would "seem" to be correct, as building with cl=
ang
> > > (that to my knowledge doesn't pass --misa-spec to GAS) and with
> > > -march=3Drv64i has no issues assembling.
> >=20
> > The "permissive" way only work if we drop support for GCC 11.1 and 11.2,
> > which sounds acceptable to me.
>=20
> I don't think that we can do that.
>=20
> > > It'd appear to me that binutils is a *player* in this issue, but is n=
ot
> > > the culprit of the issue Aurelien sought to fix.
> >=20
> > I *disagree*. At the time the commit has been merged, binutils was the
> > only culprit.
>=20
> Okay, fair enough! I was only going off my observations with
> current-day, and clearly you remember well the situation that you
> encountered this with!
>=20
> > With more recent versions of GCC 11.3 and GCC 12 released
> > in the meantime, the situation is way more complex.
>=20
> This patch is going to be problematic w/ versions of gcc that do not
> understand -misa-spec + binutils 2.38 then, isn't it.
> Based on what Jess has said, pursuing this approach seems ill-advised
> anyway.

It appears that while GCC 11.1 and GCC 11.2 do not pass -misa-spec=3D2.2
by default to as (contrary to GCC 11.3), they do accept getting called
with that option and correctly pass it to as. That way your patch works
fine with all GCC 11 and GCC 12 versions.

That said I found various discussions on IRC from that time, and forcing
an old ISA instead of enabling additional extensions was discouraged.
=46rom what I understand, it might create some incompatibilities in the
future when new extensions are added (IOW enabling an extension could be
incompatible with an old ISA spec).

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

--ttwf3n8SQWrJ17vf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUryGlb40+QrX1Ay4E4jA+JnoM2sFAmQMXdgACgkQE4jA+Jno
M2u9/w//YSdkeJ3Qz6Wfnwd58BcvzoIZZmXqSSdv3Uu2vIrcfjPU0rgemyrsNZzV
Xizo77HCLMtCK+qbQRNUwafivaZUprGuS/bhtNOzQqlOa/m0h0EBsPqZs2oknJAN
6VlwjsxQSN63sx10JTqey2YF+SsEUsKd6VwUpj0X4XDJF8yUlkn/EvGZipSsKFNK
xZ6rrTA+GnAiiGtidZXcSHzJCb0WAYeVSwZWjAW+GA5HzlRv2LqOrs0Vn/UcPcN3
hu1Wj+m7/nUDolDSKF3CZddBzPqlrzASLGlrahuft/VEPQQVf/z92LsO7hXVzSda
I4JdAarREVs1hmt0GrVgwV47eGA6ElCrUXg0BsBOS6EGazmcMAeLdlS8k8Mt7kKa
dDKq1HCzeW3LX+gPHcP4hv0tB73vtyFBunW6SkmXjrBREmpLHEBqSvwA6eoNBYsA
QnzXWwRvorK43kKNW+Z2vY8TZQ7o3IFQXuL+K6k13umjbxBkHG0J/WgpT9ZK1vIp
zMWrlTH7suPhfaGvSzn6pG7KHAKrVupHqvyuPo6jJ96tk+BPRCF2ECdA7ETtCE7G
xIqdUzkHP/kTTX7UfOdkQSUPTBpsTt3XiM4tumiZRlynW4xzytxyVg9yFfsCjjzR
7boKTrRPry/df0Kl6+OmhElmveZgzn0WjjaBqLlLjJZ8/E9Ut1Y=
=trE9
-----END PGP SIGNATURE-----

--ttwf3n8SQWrJ17vf--


--===============0353721521530594439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0353721521530594439==--


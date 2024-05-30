Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A50C27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnaRhpCgE5AXjveOti/ykDjsR0d0NA1Y+lZ/2mAeI4w=; b=lJbCKwCkQpRyOkHMYZ8C/cy1po
	A1QI1+K6PKcQYWvtfw5diP82n2+5x81K7Zu3K/ZzfOYSLS7AV47SvxE85K7PQt1hQqrZ1lsA/yE4J
	slU+U4QXCfBb+INNjAKSoB+h7D/AmX12YyVNwbOPc2/O92r7yyQmae1PlNcdv8Zfgtr78+mrLmkHN
	3mltRTH+v9t4vyXyhRv6Fxqusej6fsJCLOOmfzI3rQ+nPct0LdpOdK5vyBlZ/+0i24jJoL32ePvTx
	9QNaJzeVpO5YtoELiIEhAS+SIGfHpFqUJn507mnqUL/xKCMHsYfqBrkM+TksK0q1rlfqIdlqPa7OM
	y2ranwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgzx-00000007aAi-2NuA;
	Thu, 30 May 2024 14:43:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgzu-00000007aA3-46DN
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF50462803;
	Thu, 30 May 2024 14:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCAFC2BBFC;
	Thu, 30 May 2024 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717080197;
	bh=e1+5dT8+B+5U3e3Q8tyccbJPxgYrjn+AJggCEUN5eR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMqCm59jdJJs3oe/iUw0G8iGrR/MRYfg69+6CWrnvOzeO0sSmDV/qSTn4JOsREbqt
	 ioiNo2ilbyZh2ide5ehezgb6vZaOkWF82CKYvPEk5i6M55/5BCCZMuPRdlIyrVyrRX
	 YnJv3AAYzvK4+bMCdvVwWHIg/iNW94vqH0BBKJ/MoiHh/DtXB65jEuzVvptnjsD/q8
	 7OFIehwtJih9AEKdH/Tv/6a6wQGuaoKogH2S6gikRrqW1sELiWG43d5N+1ANytAD7M
	 L1PRhAtMU3r7ZJg78e95yOCCDzx5IK+r970c2em+lQesDcVAMygRm2c0R1U+GFTzJZ
	 RW2gQ1yTRFwZw==
Date: Thu, 30 May 2024 15:43:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 1/7] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240530-swear-espresso-563e3a19d7e7@spud>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-2-alexghiti@rivosinc.com>
 <20240528-repaint-graffiti-ec4f0e038e5a@spud>
 <CAHVXubjk-2EAJ0U08p7uATkJM1_La94SVcVNLO5yieGbfqUGYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubjk-2EAJ0U08p7uATkJM1_La94SVcVNLO5yieGbfqUGYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_074319_316165_F5B8C0F5 
X-CRM114-Status: GOOD (  32.92  )
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
Content-Type: multipart/mixed; boundary="===============7455952328360969796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7455952328360969796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z9kbXMXV8iYZ4uhg"
Content-Disposition: inline


--z9kbXMXV8iYZ4uhg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 02:20:33PM +0200, Alexandre Ghiti wrote:
> On Tue, May 28, 2024 at 5:34=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Tue, May 28, 2024 at 05:10:46PM +0200, Alexandre Ghiti wrote:

> > >  config TOOLCHAIN_HAS_ZBB
> > >       bool
> > >       default y
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 5b3115a19852..d5b60b87998c 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -78,6 +78,17 @@ endif
> > >  # Check if the toolchain supports Zihintpause extension
> > >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y=
)_zihintpause
> > >
> > > +# Check if the toolchain supports Zacas
> > > +ifdef CONFIG_AS_IS_LLVM
> > > +# Support for experimental Zacas was merged in LLVM 17, but the remo=
val of
> > > +# the "experimental" was merged in LLVM 19.
> > > +KBUILD_CFLAGS +=3D -menable-experimental-extensions
> > > +KBUILD_AFLAGS +=3D -menable-experimental-extensions
> > > +riscv-march-y :=3D $(riscv-march-y)_zacas1p0
> > > +else
> > > +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) :=3D $(riscv-march-y)_zacas
> > > +endif
> >
> > I'm almost certain that we discussed this before for vector and it was
> > decided to not enable experimental extensions (particularly as it is a
> > global option), and instead require the non-experimental versions.
> > This isn't even consistent with your TOOLCHAIN_HAS_ZACAS checks, that
> > will only enable the option for the ratified version.
>=20
> Zacas was ratified, hence the removal of "experimental" in LLVM 19.
> But unfortunately Zabha lacks such changes in LLVM, so that will make
> this inconsistent (ratified extension but still experimental).
>=20
> I'll remove the enablement of the experimental extensions then so that
> will fail for LLVM < 19. And for Zabha, I'll try to push the removal
> of experimental from LLVM.

Ye, as Nathan mentioned there may yet be some time. It'd be great if you
could.

> > I think we should
> > continue to avoid enabling experimental extensions, even if that imposes
> > a requirement of having a bleeding edge toolchain to actually use the
> > extension.
>=20
> Would it make sense to have a
> CONFIG_RISCV_LLVM_ENABLE_EXPERIMENTAL_EXTENSIONS or similar? So that
> people who want to play with those extensions will still be able to do
> so without patching the kernel?

Maybe, but I think something like that should depend on BROKEN and only
be done when the extension hasn't had its experimental status removed by
a released version of LLVM and is not supported by a release of GCC.
Given we only allow frozen extensions into the kernel, actually having to
do this would be rather rare.

I think we should also reserve the right to drop support for the
experimental version as soon as it does get its status changed, and
depending on BROKEN would let us do that without any regressions in terms
of toolchain version support.

Yes, making the option depend on BROKEN would require patching a Kconfig
file but this would be a facility for kernel developers to test prior to
the release of a toolchain that actually supports the extension, and the
"hard" part in the Makefile to hook it up would already be done. I think
if you're capable of messing about with experimental extensions in the
kernel you're capable of also modifying a Kconfig file locally ;)

Cheers,
Conor.

--z9kbXMXV8iYZ4uhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZliQgAAKCRB4tDGHoIJi
0meaAP4hpp+ON/+4CUCouNiEU6Wr4S461QKuus3DdOd3JDRNQwEAr3sv/LmPdRsa
sUgsKALjJuli5YHzz/dQq7PlVqqiyw4=
=WxZU
-----END PGP SIGNATURE-----

--z9kbXMXV8iYZ4uhg--


--===============7455952328360969796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7455952328360969796==--


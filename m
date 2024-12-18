Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE51E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI5zI6fHFh7XfFwaz0Kf2g0Y3AuQAymAjsZp/IkEkdY=; b=dh8yiB4iy9JdHH35pleBJOoFz/
	KYz5HSRYR3b5O//qncuNnp1MiIBhEWzaZhASLpAGyoLdEHXIiMbh9oc5/7FhcA7CpEwhFaN8FzITS
	y/dyi+UhUJpU/dwOvVJ/1ZIZws0QYhDVyP+Awfk3n4ylA8pzVyTb+TzoBdOtbdnIWonuSMhxZAOQH
	L+fHeKaM7T0Bj3AwSD6EPw5CqNK6rmWgy+MXPMXNlg4sM+wUtZv7MfbIc+rd50aRqCnLzYXqoymcm
	wstxUB/YDOnUlozc14ltoxwrUC1YPt/tORPpHlxBeI7KrcsJwuWCf/uN9PhDld1IvWlRvFb8HklDs
	jX0FYQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvgL-0000000Gxah-44rg;
	Wed, 18 Dec 2024 15:09:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvfE-0000000GxLy-2ZcC;
	Wed, 18 Dec 2024 15:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37A0F5C61EC;
	Wed, 18 Dec 2024 15:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A23C4CECE;
	Wed, 18 Dec 2024 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734534519;
	bh=dsz8257D+6as1uUtKCRNXMXuyupbAqskFTKy5dqOl5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOFYmV/OC+pxzzSN2F3KRoWuPa3RBYPTcC/zoOH2NCKjp1MeXanV999doe0z17HZ9
	 kZeRFu9n52HpxIYfDvjY68cwj2dFjby7xXYHkkhE6r1WCfyp9XvKDBOdii0weYJCm+
	 9xKCOdfjiu4YgHKWSLJx0oNXIh9y/gozVqQ4FgrGJap66A/Q1lO5Vt/tWoIGECJlWH
	 Rp7OGHr4sDQ+63bPykzZvg4/ERY2JHbLdJSx7PfB1jdfh7ai0OGgoE0GCVZHUb6g+l
	 lHS+ibQI7IPTVeyzL3d/9mjIO74XkR3qFvTP3HJ4GhKXpeqZidOrYIhtpJAdAEabhd
	 m0OkMY0OfPMpw==
Date: Wed, 18 Dec 2024 15:08:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241218-action-matchbook-571b597b7f55@spud>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_070840_744162_A55FEFAB 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Type: multipart/mixed; boundary="===============2177177190523467522=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2177177190523467522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fu8z2+BbmIxUgToy"
Content-Disposition: inline


--fu8z2+BbmIxUgToy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Wei=DFschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
>=20
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/Kconfig                                 |  3 +-
>  arch/riscv/include/asm/vdso.h                      |  2 +-
>  .../include/asm/vdso/{time_data.h =3D> arch_data.h}  |  8 +-
>  arch/riscv/include/asm/vdso/gettimeofday.h         | 14 +---
>  arch/riscv/include/asm/vdso/vsyscall.h             |  9 ---
>  arch/riscv/kernel/sys_hwprobe.c                    |  3 +-
>  arch/riscv/kernel/vdso.c                           | 90 +---------------=
------
>  arch/riscv/kernel/vdso/hwprobe.c                   |  6 +-
>  arch/riscv/kernel/vdso/vdso.lds.S                  |  7 +-
>  9 files changed, 18 insertions(+), 124 deletions(-)

Fails to build:
Patch 7/17: Test 1/12: .github/scripts/patches/tests/build_rv32_defconfig.sh
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: de=
claration of 'struct riscv_hwprobe' will not be visible outside of this fun=
ction [-Wvisibility]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: de=
claration of 'struct riscv_hwprobe' will not be visible outside of this fun=
ction [-Wvisibility]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:37: error: call=
 to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do=
 not support implicit function declarations [-Wimplicit-function-declaratio=
n]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:31: error: inco=
mpatible integer to pointer conversion initializing 'const struct vdso_arch=
_data *' with an expression of type 'int' [-Wint-conversion]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:22:36: error: arit=
hmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:30:40: error: inco=
mplete definition of type 'const struct vdso_arch_data'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:31:24: error: inco=
mpatible pointer types passing 'struct riscv_hwprobe *' to parameter of typ=
e 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:7: error: call =
to undeclared function 'riscv_hwprobe_key_is_valid'; ISO C99 and later do n=
ot support implicit function declarations [-Wimplicit-function-declaration]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:35: error: inco=
mplete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:5: error: incom=
plete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:18: error: inco=
mplete definition of type 'const struct vdso_arch_data'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:44: error: inco=
mplete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:39:5: error: incom=
plete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:40:5: error: incom=
plete definition of type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:43:4: error: arith=
metic on a pointer to an incomplete type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: de=
claration of 'struct riscv_hwprobe' will not be visible outside of this fun=
ction [-Wvisibility]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:37: error: call=
 to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do=
 not support implicit function declarations [-Wimplicit-function-declaratio=
n]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:31: error: inco=
mpatible integer to pointer conversion initializing 'const struct vdso_arch=
_data *' with an expression of type 'int' [-Wint-conversion]
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:55:36: error: arit=
hmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:61: error: inco=
mplete definition of type 'const struct vdso_arch_data'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:29: error: use =
of undeclared identifier 'RISCV_HWPROBE_WHICH_CPUS'
  /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:72:24: error: inco=
mpatible pointer types passing 'struct riscv_hwprobe *' to parameter of typ=
e 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
  fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Might be a clang thing, allmodconfig with clang doesn't build either.

--fu8z2+BbmIxUgToy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2LlbAAKCRB4tDGHoIJi
0n2PAQDyBQBbIhWl4PuPh0Arh+dY5o5V02LpT/vyZTOInKNMcgEAqZD+a5hkxJEH
lFXI4u2esepSVEUEOeQQYFauBervVQc=
=gqd2
-----END PGP SIGNATURE-----

--fu8z2+BbmIxUgToy--


--===============2177177190523467522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2177177190523467522==--


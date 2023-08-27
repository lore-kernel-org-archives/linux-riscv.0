Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C62C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE7u0ribRl6yXI1zrQ8b7EDzAqxT1D8hg2ZgLHSWBEY=; b=XXYLCXd2Jqe8JoWjOuyNLMS1lF
	PjeX7858qyiASD9QPQvU0I+mureovDWLIUTFu4U96DG1Dag0ptdRUMwqgcFwC+oWChGaZSVEZTlES
	wl1ulO7UanggxngAiS06VCyGUnPPLIfDV+5VTX2BfwVFowE8bELA30BKQTXh+WOYxqC3dA3ngRTU4
	beKXEv7aBIsCD1xv3SxaaaXIA3EaNul9GiilFxZ674DFX7ODUSasZJAUag3vJk1XE3xyDfYTfQtbh
	ic1wiew/nNIpPsbsTst5YwDdHPtMrLSq5yXhog/AYQO82Pc7r3A5f9CBxH0hUGd8U3MR0Yn73wJuR
	zCd2jLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaD0c-007wKa-1z;
	Sun, 27 Aug 2023 10:28:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaD0Y-007wKE-2q
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:28:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3810060D57;
	Sun, 27 Aug 2023 10:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8D0C433C8;
	Sun, 27 Aug 2023 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693132117;
	bh=VCG/lKxz6xFP9yhWzWpgPb4VnA0Vl8bZ832W0pQNc7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksqaj2to+5sCEyxd9C6LVawgeUb3fiwlm8/aP2YSNQskAPFvoQwHNuMTxjlUzKXde
	 Wt/6UeRYHk4xtbxlhkkc2Ff9bg6JNTPuqYLfluMZZQx5/2KD3OsfDGnQ+k9PNmpKfp
	 N0FumRQ7bU6RVbSalsWA2dWUEv/DnbBrAo007cqKTrNoLBDMzq83gUlgQvIcOT4p5q
	 QksPYC2YuzA7lofDXAd2+qc2WoE9Y5F982Ee7ta39cAQNLzNdSRwoAl5Ls3DlKVOX4
	 aEXSX2enIImq604SHqUk8oXF3RpIbu0Y++ytG7TV+ztwseBAUylVtWyQNUiq0WX1LY
	 Zyz/sUnrHiwiw==
Date: Sun, 27 Aug 2023 11:28:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: charlie@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/5] riscv: Checksum header
Message-ID: <20230827-primer-conceal-b6f24b29e692@spud>
References: <20230827-turf-parched-b965bc697882@spud>
 <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_032839_029804_F6111D08 
X-CRM114-Status: GOOD (  36.43  )
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
Content-Type: multipart/mixed; boundary="===============1402025608381443537=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1402025608381443537==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IZjq3miflH4Y1Jwu"
Content-Disposition: inline


--IZjq3miflH4Y1Jwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 07:00:47PM -0700, Palmer Dabbelt wrote:
> On Sat, 26 Aug 2023 18:42:41 PDT (-0700), Conor Dooley wrote:
> > On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
> > > Provide checksum algorithms that have been designed to leverage riscv
> > > instructions such as rotate. In 64-bit, can take advantage of the lar=
ger
> > > register to avoid some overflow checking.
> > >=20
> > > Add configuration for Zba extension and add march for Zba and Zbb.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/Kconfig                | 23 +++++++++++
> > >  arch/riscv/Makefile               |  2 +
> > >  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++++=
++++++++++
> > >  3 files changed, 111 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 4c07b9189c86..8d7e475ca28d 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> > >  	  If you don't know what to do here, say Y.
> > > +config TOOLCHAIN_HAS_ZBA
> > > +	bool
> > > +	default y
> > > +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zba)
> > > +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zba)
> > > +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
> > > +	depends on AS_HAS_OPTION_ARCH
> > > +
> > > +config RISCV_ISA_ZBA
> > > +	bool "Zba extension support for bit manipulation instructions"
> > > +	depends on TOOLCHAIN_HAS_ZBA
> > > +	depends on MMU
> > > +	depends on RISCV_ALTERNATIVE
> > > +	default y
> > > +	help
> > > +	   Adds support to dynamically detect the presence of the ZBA
> > > +	   extension (basic bit manipulation) and enable its usage.
> > > +
> > > +	   The Zba extension provides instructions to accelerate a number
> > > +	   of bit-specific address creation operations.
> > > +
> > > +	   If you don't know what to do here, say Y.
> > > +
> > >  config TOOLCHAIN_HAS_ZBB
> > >  	bool
> > >  	default y
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 6ec6d52a4180..51fa3f67fc9a 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> > >  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> > >  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> > >  riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> > > +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:=3D $(riscv-march-y)_zba
> > > +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:=3D $(riscv-march-y)_zbb
> >=20
> > AFAICT, this is going to break immediately on any system that enables
> > RISCV_ISA_ZBA (which will happen by default) but does not support the
> > extension. You made the option depend on RISCV_ALTERNATIVE, but I do
> > not see any use of alternatives in the code to actually perform the
> > dynamic detection of Zba.
>=20
> I guess we kind of have an ambiguity here: for stuff like C we just
> unconditionally use the instructions, but for the rest we probe first.  We
> should probably have three states for each extension: disabled, dynamical=
ly
> detected, and assumed.

You mean, just add some comments to the makefile surrounding each
section or to some rst documentation?

> > Note that for fd & v, we add it to riscv-march-y, but then immediately
> > remove it again before passing to the compiler, only allow them in
> > AFLAGS:
> > 	# Remove F,D,V from isa string for all. Keep extensions between "fd" a=
nd "v" by
> > 	# matching non-v and non-multi-letter extensions out with the filter (=
[^v_]*)
> > 	KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/=
(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> >=20
> > What am I missing?
>=20
> FD and V both have state that can be saved lazily, so we can't let arbitr=
ary
> code use them.  The extensions formally known as B don't add state, so th=
ey
> are safe to flip on in arbitrary places (aside from the issues you pointed
> out above).

I probably went about this badly since you missed the point. I was
trying to point out that for anything other than the compressed
extensions in the block above that we only pass them in march to the
assembler, and not to the compiler, in contrast to this patch which just
always passes them. I should have pointed to how we handled the
in-kernel Zbb stuff & asked how this was any different, would probably
have been clearer.


--IZjq3miflH4Y1Jwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOslPwAKCRB4tDGHoIJi
0i3KAQC3H7/EX9Dbjc6SYrXeibAqPlgdx9efAHciZTbr3OzbzQD/bMwpyyam9eQ7
bul395QFj4PzLaIo0/yjxbQ/Jgza7wg=
=t3zg
-----END PGP SIGNATURE-----

--IZjq3miflH4Y1Jwu--


--===============1402025608381443537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1402025608381443537==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC0C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XafOggaRsXbITrOhdqF7MosiEwFkiUlabPKHA69vf2U=; b=iHhgmbRHNHGWL+KR3DDz3QcPCA
	NVMMH2RsiGeCwk0hDNJFBww4XnfnpQrTA98TqaWb/NSZAr3AGKPVEBPbYvsaIFbm/dksC3XfC+X4j
	X13Qpt3Ydx+dzGxr92sHeKJ13EA96Mex3d67TFIrnAqP7ij0AeYhDigqpPgM2ILgyQah4q0YqaRrC
	YUOkY63DnZbdMUm1f9M0sjLwRVK5fvPlgok7FgYwf37sipV+lMOHqK3c6BgfXF/9OdVCTpkiRf5o8
	NadzvkOpVCOVL2I7MJ9kDGppJ5eZXJI8vElvk8KBx852oIIBWwH6v2XdELwIfVcpvagRb5NOaa084
	/LjjmNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEpi-0081YS-3A;
	Sun, 27 Aug 2023 12:25:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEpg-0081Y7-0h
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 12:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD5760F1A;
	Sun, 27 Aug 2023 12:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1388C433C8;
	Sun, 27 Aug 2023 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693139131;
	bh=gWBD25YGbafxzuj8LPvQV/VC/mRmts2LVFfAY0OVJw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfVuoT1iL3JG05GyxvV1o259eIdVYUtdkf8nMaFI3SxRnh48iWzHbDqHBZJ6l44GM
	 mzuveZvSZg3z3as/fAmEi5m6kZUdkPos7ZhzCgUsgVmxxbYwsLaoeBKQfVKC5b20/2
	 MwzwI7mJg1WeYCf1P9wl40kApGPWDCwBSR7BjTJbmRLfQCc4E6xzBNiF9yDLz6eM9Z
	 nM4IgYFpInz0jIeCrWYGTcGRoj1vtNDHipGYvX+828BaF7dqd6+/PH+T7IjhIqpoyi
	 D9sndQq1hm8fnapqsuF5iytemuVo4AyIcrQ/boE4rWNQ331JGSazy2+x6IjvB1q+tr
	 dUDUJchi7Yy8A==
Date: Sun, 27 Aug 2023 13:25:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: charlie@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/5] riscv: Checksum header
Message-ID: <20230827-divisive-happy-cf93058c49bf@spud>
References: <20230827-turf-parched-b965bc697882@spud>
 <mhng-d43dc0a3-7985-4195-9611-5ca0c38390e7@palmer-ri-x1c9>
 <20230827-primer-conceal-b6f24b29e692@spud>
MIME-Version: 1.0
In-Reply-To: <20230827-primer-conceal-b6f24b29e692@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_052532_365336_98E046DB 
X-CRM114-Status: GOOD (  45.24  )
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
Content-Type: multipart/mixed; boundary="===============6831074168192973360=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6831074168192973360==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gPdLKgpeAtAzc5UV"
Content-Disposition: inline


--gPdLKgpeAtAzc5UV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 11:28:33AM +0100, Conor Dooley wrote:
> On Sat, Aug 26, 2023 at 07:00:47PM -0700, Palmer Dabbelt wrote:
> > On Sat, 26 Aug 2023 18:42:41 PDT (-0700), Conor Dooley wrote:
> > > On Sat, Aug 26, 2023 at 06:26:06PM -0700, Charlie Jenkins wrote:
> > > > Provide checksum algorithms that have been designed to leverage ris=
cv
> > > > instructions such as rotate. In 64-bit, can take advantage of the l=
arger
> > > > register to avoid some overflow checking.
> > > >=20
> > > > Add configuration for Zba extension and add march for Zba and Zbb.
> > > >=20
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/Kconfig                | 23 +++++++++++
> > > >  arch/riscv/Makefile               |  2 +
> > > >  arch/riscv/include/asm/checksum.h | 86 +++++++++++++++++++++++++++=
++++++++++++
> > > >  3 files changed, 111 insertions(+)
> > > >=20
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 4c07b9189c86..8d7e475ca28d 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -507,6 +507,29 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> > > >  	  If you don't know what to do here, say Y.
> > > > +config TOOLCHAIN_HAS_ZBA
> > > > +	bool
> > > > +	default y
> > > > +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zb=
a)
> > > > +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_z=
ba)
> > > > +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
> > > > +	depends on AS_HAS_OPTION_ARCH
> > > > +
> > > > +config RISCV_ISA_ZBA
> > > > +	bool "Zba extension support for bit manipulation instructions"
> > > > +	depends on TOOLCHAIN_HAS_ZBA
> > > > +	depends on MMU
> > > > +	depends on RISCV_ALTERNATIVE
> > > > +	default y
> > > > +	help
> > > > +	   Adds support to dynamically detect the presence of the ZBA
> > > > +	   extension (basic bit manipulation) and enable its usage.
> > > > +
> > > > +	   The Zba extension provides instructions to accelerate a number
> > > > +	   of bit-specific address creation operations.
> > > > +
> > > > +	   If you don't know what to do here, say Y.
> > > > +
> > > >  config TOOLCHAIN_HAS_ZBB
> > > >  	bool
> > > >  	default y
> > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > index 6ec6d52a4180..51fa3f67fc9a 100644
> > > > --- a/arch/riscv/Makefile
> > > > +++ b/arch/riscv/Makefile
> > > > @@ -61,6 +61,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> > > >  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> > > >  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> > > >  riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBA)	:=3D $(riscv-march-y)_zba
> > > > +riscv-march-$(CONFIG_RISCV_ISA_ZBB)	:=3D $(riscv-march-y)_zbb
> > >=20
> > > AFAICT, this is going to break immediately on any system that enables
> > > RISCV_ISA_ZBA (which will happen by default) but does not support the
> > > extension. You made the option depend on RISCV_ALTERNATIVE, but I do
> > > not see any use of alternatives in the code to actually perform the
> > > dynamic detection of Zba.
> >=20
> > I guess we kind of have an ambiguity here: for stuff like C we just
> > unconditionally use the instructions, but for the rest we probe first. =
 We
> > should probably have three states for each extension: disabled, dynamic=
ally
> > detected, and assumed.
>=20
> You mean, just add some comments to the makefile surrounding each
> section or to some rst documentation?

Also, the code here doesn't build w/
	warning: invalid argument to '-march': '_zba_zbb_zicsr_zifencei_zihintpaus=
e'
so there's something else wrong with TOOLCHAIN_HAS_ZBA :)

>=20
> > > Note that for fd & v, we add it to riscv-march-y, but then immediately
> > > remove it again before passing to the compiler, only allow them in
> > > AFLAGS:
> > > 	# Remove F,D,V from isa string for all. Keep extensions between "fd"=
 and "v" by
> > > 	# matching non-v and non-multi-letter extensions out with the filter=
 ([^v_]*)
> > > 	KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed -E '=
s/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> > >=20
> > > What am I missing?
> >=20
> > FD and V both have state that can be saved lazily, so we can't let arbi=
trary
> > code use them.  The extensions formally known as B don't add state, so =
they
> > are safe to flip on in arbitrary places (aside from the issues you poin=
ted
> > out above).
>=20
> I probably went about this badly since you missed the point. I was
> trying to point out that for anything other than the compressed
> extensions in the block above that we only pass them in march to the
> assembler, and not to the compiler, in contrast to this patch which just
> always passes them. I should have pointed to how we handled the
> in-kernel Zbb stuff & asked how this was any different, would probably
> have been clearer.
>=20



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--gPdLKgpeAtAzc5UV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOtAtwAKCRB4tDGHoIJi
0ovGAQD5tPTlJKuHpmzVRUHMC7MyFC1N3oggFyu8NgQNXc/E6gEAigWJImPu2Dle
TAjKRa6pT2ooxBhgB4qIpLqwJO2Mzgk=
=DB4f
-----END PGP SIGNATURE-----

--gPdLKgpeAtAzc5UV--


--===============6831074168192973360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6831074168192973360==--


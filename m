Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4B1C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItWEsbG9CURwOSIZc7jsqSHvHIZ92zr8/qRAQsZmKo0=; b=fi41vHqv9rs/dtvijROEUDtvXP
	wjn1jMcaX7zYtfOTiHLmXOMbARrWecEhPPMc4orFi675YRlYiLo9euVJmhLHLQs57oYrVp1/dfFc4
	CTx+/4rBioXKcT0KpwJ5xhuKdesY6g3Pxk0RJpVP9I1DHLJfhhfv2k6fraO6DEo8EDS+jox3A+gfF
	z7TAvqWxt+9r/+lZvKc3mlf/S2yvkLiLdSvYO7bHBK+hRTvVZgAR6rhM0D0FpztI8kF1DPIxnIszR
	bswYTJpQaBpc9v9vrKYDOeQeqHt6b8DCPRbqXPjg3uTb6bRCHh5FSfKZF5MxtJM9ZtYPl6XfLlYYt
	uYlntRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWe2N-009sta-Fs; Mon, 27 Feb 2023 13:59:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWe2K-009ssq-Fk; Mon, 27 Feb 2023 13:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677506368; x=1709042368;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=v6O37f445n4RLV5R6biUlsJ/PrWMXyEC/3FIJ00LLK0=;
  b=HBy90/xf4bcmV9RFMtNa5WblFUProXwazaU+SEsX+wOs9OeX78ZnOeFe
   Um8xFBE0GYytNylm1Qgt1zUAhM8SEJmtkwyNePJJf2pu9In2dPyKKLePf
   /cuoj57/Wkbqm74wWpSMF16cmlgTB2OmS5wTiq21k12rMr1tGqmuZztBb
   +t97FFzkIUfid6tkGwxPa7j4+DBxEBwvrGkhdXym+VJTKEAsx4dOzHTSt
   PQTcs9zJo8os1lMJ+t6bYDGLGn+msisSf9noLo/PlZ3vp+0fzh30Bp7EU
   +77Lqp5OiC3JNEQkOBlP3cxhHMykA+zrQxLoPNEc/Shb+24RfujMK9w5U
   g==;
X-IronPort-AV: E=Sophos;i="5.98,332,1673938800"; 
   d="asc'?scan'208";a="198933742"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 06:59:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 06:59:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 06:59:20 -0700
Date: Mon, 27 Feb 2023 13:58:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
Message-ID: <Y/y3HbZJa8zQwivc@wendy>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-20-andy.chiu@sifive.com>
 <Y/yDeurep0ZBnLdR@wendy>
 <Y/yy3sDX2AxvBD0f@bruce.bluespec.com>
MIME-Version: 1.0
In-Reply-To: <Y/yy3sDX2AxvBD0f@bruce.bluespec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_055928_614403_4D413DBD 
X-CRM114-Status: GOOD (  31.37  )
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
Content-Type: multipart/mixed; boundary="===============4303784514673369681=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4303784514673369681==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NHHGYGTcCF3WT1JP"
Content-Disposition: inline

--NHHGYGTcCF3WT1JP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 08:40:46AM -0500, Darius Rad wrote:
> On Mon, Feb 27, 2023 at 10:18:34AM +0000, Conor Dooley wrote:
> > On Fri, Feb 24, 2023 at 05:01:18PM +0000, Andy Chiu wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >=20
> > > This patch adds a config which enables vector feature from the kernel
> > > space.
> > >=20
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> > > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> >=20
> > At this point, you've basically re-written this patch and should be
> > listed as a co-author at the very least!
> >=20
> > > ---
> > >  arch/riscv/Kconfig  | 18 ++++++++++++++++++
> > >  arch/riscv/Makefile |  3 ++-
> > >  2 files changed, 20 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 81eb031887d2..19deeb3bb36b 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -418,6 +418,24 @@ config RISCV_ISA_SVPBMT
> > > =20
> > >  	   If you don't know what to do here, say Y.
> > > =20
> > > +config TOOLCHAIN_HAS_V
> > > +	bool
> > > +	default y
> > > +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64iv)
> > > +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32iv)
> > > +	depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
> > > +
> > > +config RISCV_ISA_V
> > > +	bool "VECTOR extension support"
> > > +	depends on TOOLCHAIN_HAS_V
> > > +	select DYNAMIC_SIGFRAME
> >=20
> > So, nothing here makes V depend on CONFIG_FPU...
> >=20
> > > +	default y
> > > +	help
> > > +	  Say N here if you want to disable all vector related procedure
> > > +	  in the kernel.
> > > +
> > > +	  If you don't know what to do here, say Y.
> > > +
> > >  config TOOLCHAIN_HAS_ZBB
> > >  	bool
> > >  	default y
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 76989561566b..375a048b11cb 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
> > >  riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> > >  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> >=20
> > ...but march only contains fd if CONFIG_FPU is enabled...
> >=20
> > >  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> > > +riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> > > =20
> > >  # Newer binutils versions default to ISA spec version 20191213 which=
 moves some
> > >  # instructions from the I extension to the Zicsr and Zifencei extens=
ions.
> > > @@ -65,7 +66,7 @@ riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $=
(riscv-march-y)_zicsr_zifencei
> > >  # Check if the toolchain supports Zihintpause extension
> > >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y=
)_zihintpause
> > > =20
> > > -KBUILD_CFLAGS +=3D -march=3D$(subst fd,,$(riscv-march-y))
> > > +KBUILD_CFLAGS +=3D -march=3D$(subst fdv,,$(riscv-march-y))
> >=20
> > ...so I think this will not work if !CONFIG_FPU && RISCV_ISA_V.
> > IIRC, vector uses some floating point opcodes, but does it (or Linux's
> > implementation) actually depend on having floating point support in the
> > kernel?
>=20
> Yes.
>=20
> "The V extension requires the scalar processor implements the F and D
> extensions", RISC-V "V" Vector Extension, Section 18.3. V: Vector Extensi=
on
> for Application Processors.

Thanks, I should probably just have gone and read the spec!

> > If not, this cannot be done in a oneliner. Otherwise, CONFIG_RISCV_ISA_V
> > should explicitly depend on CONFIG_FPU.

Since it does depend on F & D, the Kconfig symbol should explicitly
depend on CONFIG_FPU.
The oneliner like that still doesn't work, as V is added to march after
C, leading (for clang-15 allmodconfig) to: -march=3Drv64imafdcv_zihintpause
Doing it as a oneline also breaks the case where CONFIG_FPU &&
!RISCV_ISA_VECTOR, which ends up with: -march=3Drv64imafdc_zihintpause.

Cheers,
Conor.


--NHHGYGTcCF3WT1JP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/y3HQAKCRB4tDGHoIJi
0vzxAQDx81kk349JUaKSa+IA5L5Pdfs39KahgQMLQ/Er425CQgEA5pE+edwmzKof
XW/CvkKd4pIK2J6fETt/gxnc1CC/vgY=
=JzC8
-----END PGP SIGNATURE-----

--NHHGYGTcCF3WT1JP--


--===============4303784514673369681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4303784514673369681==--


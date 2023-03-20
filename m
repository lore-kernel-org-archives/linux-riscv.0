Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D68C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSLULfTXdNu8MKjs0DHUr/v+FqA9h4O0iKW1J78MuCM=; b=KSi1L1Ccv2mpqjO+T2mAFpmYM2
	dvXbXg39UndypMicx7589UrpEJ/5DmITYsQkiYfS/1iKNRSOA/zIxZcTgiUZfhVto+IpBAo48MUCN
	1PGR/9m40wTo3SW3UoAH4R35bDA0JjzWoy5dqbvoamRslt2S9SVPBkNPUmHOOPZ7APcxPcwWSkdzU
	PbwZmthf9nC5YnDTvgSP5N1wVm2fdwAUx4IWTuYYjUJ6KK9mdv3RRBiz48KVucuuuwCqxU7RY2w6i
	Rxfh8QzopKKItHzunb34SnLp0aXc/FrBxjeJxb94/73eIQT+q4V+fQWclOtmSvt8ffIGfPEK6rzTc
	hJMG8NJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFs9-009EYs-0i;
	Mon, 20 Mar 2023 13:48:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFs6-009EY8-0F;
	Mon, 20 Mar 2023 13:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679320102; x=1710856102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Es3rcXxN/lX7M6BwzyQcaHplOsJJasp3CCy7wc6zULU=;
  b=UqGCU+apfBbOQxhun/1cj/GxkF4+IC/VDiVpSHbl+8BZbgaH7FOcNF3W
   EF4WFBZkblFWf1Y4DmieYG+p8JXnAWivws6NqaXbpVGvOieRCFMSxzVZ4
   EBZr7qAx7GWfMEOXO6ckubpYc1nXy0oE9Ty8mppCICbGZfAFlf1aFjsKg
   L/f9QdhMKOiFRsnGZXjPTLM68SkTkq7a9C28JmymhAEF3LoFmg3tAEsGE
   IEc2dx9rDCW82kEVfNPpcvKvolYw3GhzwaYiI1WVskxvWJMe6/Q6UghJM
   AOKpUciM5dlbZUq54tyIW6sw/ZnMfzUzc0PKVfyeWuEIwCJBZBVjUWcsB
   w==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="205909853"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 06:48:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 06:48:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 06:48:18 -0700
Date: Mon, 20 Mar 2023 13:47:48 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Nathan Chancellor <nathan@kernel.org>, Andy Chiu <andy.chiu@sifive.com>
CC: Andy Chiu <andy.chiu@sifive.com>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Nick Desaulniers <ndesaulniers@google.com>, Tom
 Rix <trix@redhat.com>
Subject: Re: [PATCH -next v15 19/19] riscv: Enable Vector code to be built
Message-ID: <8dba167d-5b68-472c-992f-05b80404f557@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-20-andy.chiu@sifive.com>
 <20230317154658.GA1122384@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20230317154658.GA1122384@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_064822_118948_7498B9A7 
X-CRM114-Status: GOOD (  37.08  )
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
Content-Type: multipart/mixed; boundary="===============3112070490952064310=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3112070490952064310==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QnGsS1xIKGouiNsN"
Content-Disposition: inline

--QnGsS1xIKGouiNsN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 08:46:58AM -0700, Nathan Chancellor wrote:
> On Fri, Mar 17, 2023 at 11:35:38AM +0000, Andy Chiu wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >=20
> > This patch adds a config which enables vector feature from the kernel
> > space.
> >=20
> > Support for RISC_V_ISA_V is limited to GNU-assembler for now, as LLVM
> > has not acquired the functionality to selectively change the arch option
> > in assembly code. This is still under review at
> >     https://reviews.llvm.org/D123515
> >=20
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > ---
> >  arch/riscv/Kconfig  | 20 ++++++++++++++++++++
> >  arch/riscv/Makefile |  6 +++++-
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c736dc8e2593..bf9aba2f2811 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -436,6 +436,26 @@ config RISCV_ISA_SVPBMT
> > =20
> >  	   If you don't know what to do here, say Y.
> > =20
> > +config TOOLCHAIN_HAS_V
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64iv)
> > +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32iv)
> > +	depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
> > +	depends on AS_IS_GNU
>=20
> Consider hoisting this 'depends on AS_IS_GNU' into its own configuration
> option, as the same dependency is present in CONFIG_TOOLCHAIN_HAS_ZBB
> for the exact same reason, with no comment as to why. By having a shared
> dependency configuration option, we can easily update it when that
> change is merged into LLVM proper and gain access to the current and
> future options that depend on it. I imagine something like:
>=20
> config AS_HAS_OPTION_ARCH
>     bool
>     default y
>     # https://reviews.llvm.org/D123515
>     depends on AS_IS_GNU
>=20
> config TOOLCHAIN_HAS_ZBB
>     bool
>     default y
>     depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zbb)
>     depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zbb)
>     depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
>     depends on AS_HAS_OPTION_ARCH
>=20
> config TOOLCHAIN_HAS_V
>     bool
>     default y
>     depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64iv)
>     depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32iv)
>     depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
>     depends on AS_HAS_OPTION_ARCH
>=20
> It would be nice if it was a hard error for LLVM like GCC so that we
> could just dynamically check support via as-instr but a version check is
> not the end of the world when we know the versions.

Yah, this is a good idea Nathan, since we may end up having to do the
same thing for a decent number of extensions going forward. Could you
please implement this Andy?

> > +config RISCV_ISA_V
> > +	bool "VECTOR extension support"
> > +	depends on TOOLCHAIN_HAS_V
> > +	depends on FPU
> > +	select DYNAMIC_SIGFRAME
> > +	default y
> > +	help
> > +	  Say N here if you want to disable all vector related procedure
> > +	  in the kernel.
> > +
> > +	  If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZBB
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 6203c3378922..84a50cfaedf9 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
> >  riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> >  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> >  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> > +riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> > =20
> >  # Newer binutils versions default to ISA spec version 20191213 which m=
oves some
> >  # instructions from the I extension to the Zicsr and Zifencei extensio=
ns.
> > @@ -65,7 +66,10 @@ riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $(=
riscv-march-y)_zicsr_zifencei
> >  # Check if the toolchain supports Zihintpause extension
> >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y)_=
zihintpause
> > =20
> > -KBUILD_CFLAGS +=3D -march=3D$(subst fd,,$(riscv-march-y))
> > +# Remove F,D,V from isa string for all. Keep extensions between "fd" a=
nd "v" by
> > +# keep non-v and multi-letter extensions out with the filter ([^v_]*)
> > +KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed  -E 's=
/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
                                                                 ^
Is the extra space here intentional?

It's a shame that this had to become so complicated, but thanks for
adding a comment so that the rationale behind the complexity can be
understood.
Perhaps there's a case to be made for removing fd & v separately to make
things more understandable, but I think the removal of v is going to
look complex in both cases.
I'm happy with doing it like this now, but if, in the future, we need to
account for possibly having q too, I might advocate for the split rather
than adding more complexity.

With Nathan's suggestion of AS_HAS_OPTION_ARCH:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> > +
> >  KBUILD_AFLAGS +=3D -march=3D$(riscv-march-y)
> > =20
> >  KBUILD_CFLAGS +=3D -mno-save-restore
> > --=20
> > 2.17.1
> >=20
>=20

--QnGsS1xIKGouiNsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhkBAAKCRB4tDGHoIJi
0p0AAP9vHKk++cVD6wJwjmlgy447P7odQwr5lgPkEZaW+wELCwD+KY9JofoNOmD6
cLAhoKLTib3V2C/U9BKT1m1/WIvyxQk=
=+x6z
-----END PGP SIGNATURE-----

--QnGsS1xIKGouiNsN--


--===============3112070490952064310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3112070490952064310==--


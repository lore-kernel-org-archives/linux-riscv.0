Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C981C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKXlmp+hFo1YRoMFRpp2w1E5quzzgkGUUp4OxDU53ew=; b=aLPHP1/1Du4fXQjGUMU5C0YQjj
	Msy05MB8911x52pWZjQ8XY7bCtsZwg4N5JpK6kZoeJeHxWPrDq7w6XSOx7wYTPGXEBjbIFLZUshOc
	ZY0Mk7Hnl1+NS2VNitYtWlk9wBX2BYRNkEpdpWg72e4jprdMUuu5EQf+z1/KvalZbgzqZnpO3E0eR
	NbVD4I3to8Y3d3JF3C+o7lmS19RZVQ/1iblZ4jxBuUFJG7rPdDr4FgOi0iMRfIY540HFE/d7rb/wU
	uAubf18b+/MITyuYs5qHKAOfSsk6v5wVSRtjli+SnE/evCB9uAjMeIYb0+s761An5QaIGLS61DesY
	1tlk4JOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZze-002yLG-DP; Fri, 24 Feb 2023 15:28:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZza-002yJl-Ti
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677252494; x=1708788494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=poxQTqgWSLciAThNe/zOfrINHkOB6ILahmpb3aOL6ts=;
  b=Ac7qkE6WFbagKvbsRBgpUdGRD1BbpHRMSLcHd7Sc7aLhGQrQUC5WtHBx
   H1XQKM6N6wtuqQj9ngPNQ0EZm8HP9oXnqlaeJ+JgV0EYyRolWazoKnVov
   Zv34Z/vKH4q6wN5E3Qz7I39mir140jgs56wu2Z3bsjkHOb6ICx4/LJhEX
   kVpJyiFcGSiQIva2NeoMvDwTLNLoOk2AYJ9kPXTRvYIxv2p1wfkf3w+2h
   IxSm63RlW6v7SzLsOzYCyUxWZBwnj+2SlZNZibVmEb6s7odYbY3QiUdWf
   t0V+8iYHFFe0zMShKMGO6BnMCXlyjA8Vtg1X+ySZv2vMDo6Kk0gc95lre
   g==;
X-IronPort-AV: E=Sophos;i="5.97,325,1669100400"; 
   d="asc'?scan'208";a="202114504"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 08:28:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 08:28:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 08:28:06 -0700
Date: Fri, 24 Feb 2023 15:27:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	<rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
Message-ID: <Y/jXayJucRFxzJGA@wendy>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
 <20230224135044.2882109-3-conor.dooley@microchip.com>
 <Y/jQSUpXH5XwQTqg@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <Y/jQSUpXH5XwQTqg@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_072815_029861_E36CE55E 
X-CRM114-Status: GOOD (  22.50  )
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
Content-Type: multipart/mixed; boundary="===============3549718754874790631=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3549718754874790631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z2lFv5ndM+uKjjaZ"
Content-Disposition: inline

--z2lFv5ndM+uKjjaZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 07:57:13AM -0700, Nathan Chancellor wrote:
> Hi Conor,
>=20
> On Fri, Feb 24, 2023 at 01:50:44PM +0000, Conor Dooley wrote:
> > From: Miguel Ojeda <ojeda@kernel.org>
> >=20
> > The rust modules work on 64-bit RISC-V, with no twiddling required.
> > Select HAS_RUST and provide the required flags to kbuild so that the
> > modules can be used.
> > 32-bit is broken in core rust code, so support is limited to 64-bit
> > only: ld.lld: error: undefined symbol: __udivdi3
> >=20
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  Documentation/rust/arch-support.rst | 2 ++
> >  arch/riscv/Kconfig                  | 1 +
> >  arch/riscv/Makefile                 | 3 ++-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/a=
rch-support.rst
> > index 6982b63775da..197919158596 100644
> > --- a/Documentation/rust/arch-support.rst
> > +++ b/Documentation/rust/arch-support.rst
> > @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAIN=
ERS`` file.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  Architecture  Level of support  Constraints
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +``riscv``     Maintained        ``rv64`` only.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  ``x86``       Maintained        ``x86_64`` only.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 81eb031887d2..73174157212d 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -115,6 +115,7 @@ config RISCV
> >  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> >  	select HAVE_REGS_AND_STACK_ACCESS_API
> >  	select HAVE_RSEQ
> > +	select HAVE_RUST if 64BIT
>=20
> Just a small drive by comment, you have 'if 64BIT' here...
>=20
> >  	select HAVE_STACKPROTECTOR
> >  	select HAVE_SYSCALL_TRACEPOINTS
> >  	select IRQ_DOMAIN
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 76989561566b..0d6fc4e25221 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -29,8 +29,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
> > =20
> >  	KBUILD_CFLAGS +=3D -mabi=3Dlp64
> >  	KBUILD_AFLAGS +=3D -mabi=3Dlp64
> > -
> >  	KBUILD_LDFLAGS +=3D -melf64lriscv
> > +	KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dgeneric-rv64
> >  else
> >  	BITS :=3D 32
> >  	UTS_MACHINE :=3D riscv32
> > @@ -38,6 +38,7 @@ else
> >  	KBUILD_CFLAGS +=3D -mabi=3Dilp32
> >  	KBUILD_AFLAGS +=3D -mabi=3Dilp32
> >  	KBUILD_LDFLAGS +=3D -melf32lriscv
> > +	KBUILD_RUSTFLAGS +=3D -Ctarget-cpu=3Dgeneric-rv32
>=20
> but also add KBUILD_RUSTFLAGS for the !64BIT case. Seems like one of
> those can be removed.

Yeah & it's ditto for the rv32 handling in 1/2 as well. Ideally there
wouldn't be implicit 64-bit division and the "if 64BIT" could go
away. I just left things as-lifted, but I'll go drop anything 32-bit
related if this series looses the RFC prefix ;)

--z2lFv5ndM+uKjjaZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/jXawAKCRB4tDGHoIJi
0pNGAP4zIxU9hWDGRLAc9v31P3IiCujj/BIkSl5SxfXQyqJseAD/VlqTDGyws2G0
0Yvnyz+H9GhDgw8F2jUNxhK9REZOLgM=
=Stuu
-----END PGP SIGNATURE-----

--z2lFv5ndM+uKjjaZ--


--===============3549718754874790631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3549718754874790631==--


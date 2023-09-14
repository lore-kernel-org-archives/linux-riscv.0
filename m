Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1142EEEAA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hs3U1f4WPczv0So/352d/heI1VOxD/miNvrSG4wxv8=; b=ESAf7MpABaU4Ar4j6TVabE/bZG
	UfWeWdaGwudM/1dRf6d2acCS/2r9ZANI0zSzuAmhVpf1U53rvCx4tnHLYhjCKhaS7ZadQCpXoxvsw
	1OTMuMlWufOGfyNeAhvbiosdUThZo6fmbDK1iRENB+9sGo1SS0ROXRAUoZyoMWfeV63Yfqmy+VguK
	HeVTmbbAAU8tj2oWkw/j1F1ZmBDm3LMyBzBNYr3Yf0PI4w3KIjGFAdNfZI6d90OYflUUl6vMTqVUV
	8AmHelw+21+c2Do8Y3qMngRYgHwxV+RHPJu3Mx7nESD4UGbVhsNagW12YhSQ1aS8H7LsDIZqgr+jF
	2p5C7QiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqGp-00908Q-0H;
	Thu, 14 Sep 2023 17:36:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqGl-00907q-2o
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 17:36:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C71861E40;
	Thu, 14 Sep 2023 17:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A87BC433BB;
	Thu, 14 Sep 2023 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694713007;
	bh=MfTowFu0cgVxPtElLh6QEI0r8tSGdg78qyoRUAdeEaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUAFiqE4/C5R84NREb7Doj230NMDGpAT8Ddt2r0Ha6Er2OJJtzjj4h6fi0QVZf1Sp
	 Bex4tDKYwdEscrRY8UvrRTIKmsGAo9FTHxqnEwLbZsrb9D1BuGyT3r8i9mTb/4RJ0g
	 Qzt35R0HA/rqhO6moslvuC7bbSSQSqXjVM7rwrCr60NHsi4X5/w3/6HooY6YY29ns+
	 uFyCLep6/VBZACYKM61/o8uh2Hzos6YSm2J8Fz9YQ8c5uv2QMfgZ2d5JE9TlcqOhMy
	 WCsOSWe2+uHxz10ADY9N8g870415uRQtSQajyz5GdJBINMEfQNLIuo94hZov1IZut+
	 57p8K1bIwf3tg==
Date: Thu, 14 Sep 2023 18:36:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 4/5] riscv: Vector checksum library
Message-ID: <20230914-scrawny-aviation-03ec222a46b2@spud>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
 <20230914-pennant-obligate-db3adf056281@wendy>
 <ZQMxWPczYeDMCokP@ghost>
 <20230914-hardiness-uninjured-6818bfb40b4f@spud>
 <ZQNC7mAYKfuWLUVr@ghost>
MIME-Version: 1.0
In-Reply-To: <ZQNC7mAYKfuWLUVr@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_103647_999036_7BF4B732 
X-CRM114-Status: GOOD (  43.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4374657324816120822=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4374657324816120822==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hdzLaaOULK3RtUdD"
Content-Disposition: inline


--hdzLaaOULK3RtUdD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 01:29:18PM -0400, Charlie Jenkins wrote:
> On Thu, Sep 14, 2023 at 05:29:29PM +0100, Conor Dooley wrote:
> > On Thu, Sep 14, 2023 at 12:14:16PM -0400, Charlie Jenkins wrote:
> > > On Thu, Sep 14, 2023 at 01:46:29PM +0100, Conor Dooley wrote:
> > > > On Mon, Sep 11, 2023 at 03:57:14PM -0700, Charlie Jenkins wrote:
> > > > > This patch is not ready for merge as vector support in the kernel=
 is
> > > > > limited. However, the code has been tested in QEMU so the algorit=
hms
> > > > > do work. This code requires the kernel to be compiled with C vect=
or
> > > > > support, but that is not yet possible. It is written in assembly
> > > > > rather than using the GCC vector instrinsics because they did not
> > > > > provide optimal code.
> > > > >=20
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > ---
> > > > >  arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++=
++++++++++++++
> > > > >  1 file changed, 92 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > > > > index 47d98c51bab2..eb4596fc7f5b 100644
> > > > > --- a/arch/riscv/lib/csum.c
> > > > > +++ b/arch/riscv/lib/csum.c
> > > > > @@ -12,6 +12,10 @@
> > > > > =20
> > > > >  #include <net/checksum.h>
> > > > > =20
> > > > > +#ifdef CONFIG_RISCV_ISA_V
> > > > > +#include <riscv_vector.h>
> > > >=20
> > > > What actually includes this header, I don't see it in either Andy's
> > > > in-kernel vector series or Bjorn's blake2 one.
> > > > Can you link to the pre-requisites in your cover letter please.
> > > >=20
> > > > Thanks,
> > > > Conor.
> > >=20
> > > It is defined here:
> > > https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-=
intrinsic-spec.adoc.
> > > The header is for the vector intrinsics that are supported by llvm and
> > > gcc.
> >=20
> > Well, whatever you're doing with it does not work, producing 3600 or so
> > fatal errors during compilation, all saying:
> > ../arch/riscv/include/asm/checksum.h:14:10: fatal error: riscv_vector.h=
: No such file or directory
> >=20
> > Do you have some makefile hack somewhere that's not part of this
> > patchset? Also, I'm dumb, but can you show me where are the actual
> > intrinsics are being used in this patch anyway? I just seem some
> > types & asm.
> >=20
> > Thanks,
> > Conor.
> >=20
>=20
> Intrinsics are needed for the vector types. Vector types are needed to
> get the inline asm to select vector registers at compile time. I could
> manually select vector registers to use but that is not ideal. In order
> to get this to work, vector has to be enabled in the compiler. This
> patch will not compile right now, but since people are working on vector
> I was hoping that it would be possible in the future. Palmer recommended
> that I just put up this patch for now since I had the code, but only the
> non-vector versions should be candidates for release for now.

I see. I was pretty unclear to me anyway what the craic was, you should
probably note that the build failures from here onwards are
known-broken. If you want that header, I guess you probably need to
have v set in -march?
If so, the in-kernel vector patches that have been posted do not do that.
Oh-so-far from an expert on what is a safe way to do these kinda things
though, sadly.

--hdzLaaOULK3RtUdD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQNEqgAKCRB4tDGHoIJi
0vGnAQDdLVtUPskYP22nyMgFg01pnHFouvzBVON1b/5dYKCfWgEAhVTJTZTVePAi
YoE3ZHxR2PNtYY+65BhcEqkil9Wg4gE=
=lz5p
-----END PGP SIGNATURE-----

--hdzLaaOULK3RtUdD--


--===============4374657324816120822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4374657324816120822==--


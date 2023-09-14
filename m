Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152D0EEAA57
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lb4ENjhyPNDTcl2buv0+wmibzvWwYlw1+csnUrSYfR0=; b=l7VVpGCosVzl+Z0A2rYPiEaDGK
	n0ly3xNXtDzxTgADFg4CCi8UIngRSFtRWr072X75u8SEeG83ndza0SdjBUybmv9fPZv6cKgQysDmx
	C7soOA02oCPpD52RBZhH7T+/XYZ84mZ38HCN+WExbL9DlGVDckAeal+/FSjvwoAOo+/0kZAH23j31
	YMVBknOjoPiR24eW8CApROO489N5HwqSeVBsTo+thp5LSLSHHMIl4jWN/HmDbKXKwnOgt0IUjNNAK
	q6a7AV4LgaPQSMwya2ZxRVbPusXBuz7A+upb+kU/DmR1dqxXxXcrMBISp2orB8OIUK3fy/v2bslxl
	FeIIdtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpDn-008udF-2P;
	Thu, 14 Sep 2023 16:29:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpDk-008ucM-1s
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:29:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7EF1AB82643;
	Thu, 14 Sep 2023 16:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C41C433C7;
	Thu, 14 Sep 2023 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694708973;
	bh=H33byKpeFMjVP9Sa7iH9ab3sgake7AuLJWHEwU6i/zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq92Ma924rZPbjERas1Von9mhS2Qc15dxZ5mE6S3FhJouTcZTuxmUC2EJGYXGUGtM
	 8rTu0DKEDtw7xnY9HZt95xIaXGR0FJsXwJOSWowfK0h/t1eNG2h1NThrAR78fy8Sje
	 FNxBYyhQ7Xz2WMyO6+9ksnLXb51wvboSwQCZc5yv3HFmluurTXTAkWrG3DIaJ0kzE3
	 84WbzKntmWk2j9TjXKKHcjbnEC16zKeZRxLNCgGZ1a8l6BdCszSrr5cHG0mlfNtm5l
	 jRxpjTYladGg/UvCBmU4djrfJtUOh99RiMlg5RMY/Mt91HbGOIztX+1YK1jzuc4jAt
	 FbEWoOTj3ho3A==
Date: Thu, 14 Sep 2023 17:29:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 4/5] riscv: Vector checksum library
Message-ID: <20230914-hardiness-uninjured-6818bfb40b4f@spud>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
 <20230914-pennant-obligate-db3adf056281@wendy>
 <ZQMxWPczYeDMCokP@ghost>
MIME-Version: 1.0
In-Reply-To: <ZQMxWPczYeDMCokP@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_092936_921290_0899206B 
X-CRM114-Status: GOOD (  30.14  )
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
Content-Type: multipart/mixed; boundary="===============3162460687155069549=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3162460687155069549==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vACo4KyzGOkrlLwY"
Content-Disposition: inline


--vACo4KyzGOkrlLwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 12:14:16PM -0400, Charlie Jenkins wrote:
> On Thu, Sep 14, 2023 at 01:46:29PM +0100, Conor Dooley wrote:
> > On Mon, Sep 11, 2023 at 03:57:14PM -0700, Charlie Jenkins wrote:
> > > This patch is not ready for merge as vector support in the kernel is
> > > limited. However, the code has been tested in QEMU so the algorithms
> > > do work. This code requires the kernel to be compiled with C vector
> > > support, but that is not yet possible. It is written in assembly
> > > rather than using the GCC vector instrinsics because they did not
> > > provide optimal code.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 92 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > > index 47d98c51bab2..eb4596fc7f5b 100644
> > > --- a/arch/riscv/lib/csum.c
> > > +++ b/arch/riscv/lib/csum.c
> > > @@ -12,6 +12,10 @@
> > > =20
> > >  #include <net/checksum.h>
> > > =20
> > > +#ifdef CONFIG_RISCV_ISA_V
> > > +#include <riscv_vector.h>
> >=20
> > What actually includes this header, I don't see it in either Andy's
> > in-kernel vector series or Bjorn's blake2 one.
> > Can you link to the pre-requisites in your cover letter please.
> >=20
> > Thanks,
> > Conor.
>=20
> It is defined here:
> https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-intr=
insic-spec.adoc.
> The header is for the vector intrinsics that are supported by llvm and
> gcc.

Well, whatever you're doing with it does not work, producing 3600 or so
fatal errors during compilation, all saying:
=2E./arch/riscv/include/asm/checksum.h:14:10: fatal error: riscv_vector.h: =
No such file or directory

Do you have some makefile hack somewhere that's not part of this
patchset? Also, I'm dumb, but can you show me where are the actual
intrinsics are being used in this patch anyway? I just seem some
types & asm.

Thanks,
Conor.


--vACo4KyzGOkrlLwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQM06AAKCRB4tDGHoIJi
0mdwAP40Q0oxsDF3wBoaGgdhytSmQcfrEYVaDIb9xbFef+wnGgD/Xg6SCr64B3S9
O5MiMctRJdwO8l41VhuCdOxSlG7qkgE=
=r45z
-----END PGP SIGNATURE-----

--vACo4KyzGOkrlLwY--


--===============3162460687155069549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3162460687155069549==--


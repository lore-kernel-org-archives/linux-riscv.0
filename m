Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxrEVzdyFhsObb7wXbsfuBm7uaHTFFhXaU0V0tHG7tg=; b=pzYSGf4piLUbXfBlyNFw4gxduA
	EjYaz4BpvstFg2vQxY6yxkIDfVAR80r/+u9NDrhVVXgXXrueF2V9C4de5qPzr3pQJvaW2dchu846G
	U/1edEyIwKYWBOAT03HGwOtLufaV62txD2bfkNXqpFJiUxrpO1aM8qQfYbENF/+ZwzoIfTWKBuphM
	selNOxZBAp0o0mwwzL9YFTIVobDHAfcPqyVm0J/X1l5J/lmHn4yg7VibS0tlu91MBFucRjGf/y7NB
	G7W+RRJ853uC6fhGg/OQVtivt9GnK/usGj27ecBL9qiNEa3i6MjhbdJ1r/ZQStycKNH3Yv3DQjwA0
	oYfS3Clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZsD3-001skZ-1d; Thu, 31 Mar 2022 10:39:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZsD0-001sje-AI
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 10:39:19 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1nZsCx-0005oA-6P; Thu, 31 Mar 2022 12:39:15 +0200
Received: from pengutronix.de
 (2a03-f580-87bc-d400-ffcf-bd2e-518f-8dbf.ip6.dokom21.de
 [IPv6:2a03:f580:87bc:d400:ffcf:bd2e:518f:8dbf])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id CF48457B6A;
 Thu, 31 Mar 2022 10:39:13 +0000 (UTC)
Date: Thu, 31 Mar 2022 12:39:13 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
Message-ID: <20220331103913.2vlneq6clnheuty6@pengutronix.de>
References: <20220126171442.1338740-1-aurelien@aurel32.net>
 <20220331103247.y33wvkxk5vfbqohf@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220331103247.y33wvkxk5vfbqohf@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_033918_392303_9457C26C 
X-CRM114-Status: GOOD (  22.12  )
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
Content-Type: multipart/mixed; boundary="===============3673095603325904955=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3673095603325904955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2k7afhkrbbvlet4x"
Content-Disposition: inline


--2k7afhkrbbvlet4x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.03.2022 12:32:47, Marc Kleine-Budde wrote:
> On 26.01.2022 18:14:42, Aurelien Jarno wrote:
> > From version 2.38, binutils default to ISA spec version 20191213. This
> > means that the csr read/write (csrr*/csrw*) instructions and fence.i
> > instruction has separated from the `I` extension, become two standalone
> > extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> > this causes the following build failure:
> >=20
> >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler me=
ssages:
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: un=
recognized opcode `csrr a5,0xc01'
> >=20
> > The fix is to specify those extensions explicitely in -march. However as
> > older binutils version do not support this, we first need to detect
> > that.
> >=20
> > Cc: stable@vger.kernel.org # 4.15+
> > Cc: Kito Cheng <kito.cheng@gmail.com>
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 8a107ed18b0d..7d81102cffd4 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -50,6 +50,12 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
> >  riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> >  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
> >  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
> > +
> > +# Newer binutils versions default to ISA spec version 20191213 which m=
oves some
> > +# instructions from the I extension to the Zicsr and Zifencei extensio=
ns.
> > +toolchain-need-zicsr-zifencei :=3D $(call cc-option-yn, -march=3D$(ris=
cv-march-y)_zicsr_zifencei)
> > +riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $(riscv-march-y)_zic=
sr_zifencei
> > +
> >  KBUILD_CFLAGS +=3D -march=3D$(subst fd,,$(riscv-march-y))
> >  KBUILD_AFLAGS +=3D -march=3D$(riscv-march-y)
>=20
> I'm on current linus/master, this change breaks on current Debian
> testing with:
>=20
> | make: Leaving directory 'linux'
> |   SYNC    include/config/auto.conf.cmd
> |   GEN     Makefile
> |   GEN     Makefile
> |   CC      scripts/mod/empty.o
> |   CHECK   linux/scripts/mod/empty.c
      ^^^^^
It's actually "sparse" that breaks
     =20
> | invalid argument to '-march': '_zicsr_zifencei'

| $ sparse --version
| 0.6.4 (Debian: 0.6.4-2)

Compiling without "C=3D1" for now.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--2k7afhkrbbvlet4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJFhM8ACgkQrX5LkNig
010hXwf/T/1eEthuho2MKoBL39szMK72TGK25V3LPzdwspQ7zz7B7iSo+SrwSeJl
19WvjPgJvbqx0m9h4gQw+p/S5bUDOWAQMW+Jp/XaZi6/5+JhlKqKkaM4ylu8XjCV
wAqbielmo2SwrW7gIFsIZOSukW2W5twi8SzSCywsLSR9JgWtMVFGxhyNlWnzYrU0
iojtrHFhZsU/rMqkf3EdlWOHCcI4F5j48yWiscXV4afI0CmJxuRH2ed6oby8BzzL
DMUahAh6pb6y0m1ql92kYPu+5ILaeTueP5HzNoT/cYMmgeF1dsBX9JB2rpWNfTF2
MmtQWlhTUjwBBemCsTOsC3ivjcAAtA==
=Zz4Y
-----END PGP SIGNATURE-----

--2k7afhkrbbvlet4x--


--===============3673095603325904955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3673095603325904955==--


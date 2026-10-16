Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BDECC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 19:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15ISfVLdXGqH6tQO5U4/u2Dzry3tzp7fZCtzyWNvQrc=; b=IPU8UsbN0Xb+Eoj9Q8VA7g6ESe
	mtfYiwr18a+EYJm0yd4v7Bld4UmBf5mI2h7RQ5OhKLvE6ZFEAD+SZhksvbrEz2zIMM14dDk3jRbBU
	T7QUxXzj+lMxoVzo8sdFlwASsR62GaBDx0LMz/Ws7eJHUqbQlReFdI7Y2IjAK+f1YlK2tv7oZTpPd
	H8NiXy8p0nP9JCHDg/5CGTM/HpAtWTMBHAYPoPrNABsgUcKpNVDtoodof7RRElMjHMzrm0DCdrKxu
	R0DVHUMrrlY5IIlPpjpHnU+/RFA0J/le6SNnGhFZHYls59URGxgnV+MIsI06QHsfNPPPH2+j33ZJU
	h+UGSLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnVi-00000003sXa-2jvq;
	Fri, 16 Oct 2026 19:22:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnVg-00000003sWh-1Bmp
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 19:22:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B33241932;
	Fri, 16 Oct 2026 19:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF281F000C4;
	Fri, 16 Oct 2026 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792178551;
	bh=yzuXTFpptabPr0X+uuZGLG2dByB7F1Z3TMushnTW8P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o2qWyWnJ9YBXDyfcsHIklPWW3iewVUKHBjV9K3vuzwqiTzRWAhTaUIER1SC4X5Zle
	 YOJlOaGp4XAD0IAjz3dydDThXgjveUxK9Qy3lFDJysvoTnQIqWwLgVrb1gkyqeomFQ
	 7JpTY9be8E+zaBPhQbl4okHT9yF41H58XkJLH3+7UHs4DbGvUD93VHYj48JYWrrlB6
	 zIpDBBzAkDq8P8H5dl1aywywWBFOjPKcXLzT9y4L0AyqWd4RxPIMt5NnoePXIl3mXj
	 xeVMjPXE7JtZ+sanMiGX/2t35kJMULX24ICucId+r4vTsWRQmEly9tM9mghMO3GERW
	 eYPw8sNMSdVAQ==
Date: Fri, 16 Oct 2026 20:22:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
Message-ID: <20261016-uncanny-faculty-222732ee77e6@spud>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker>
 <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
 <atC9jZIF1T1x0w1X@xhacker>
 <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXkzgE7=n7MJ1-QS10y=f75vO7OribUgM3wb134LN+5kQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1108917875778260466=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1108917875778260466==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5XIbLBFUyP01GSIf"
Content-Disposition: inline

--5XIbLBFUyP01GSIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 02:24:42PM +0200, Geert Uytterhoeven wrote:
> Hi Jisheng,
>=20
> On Thu, 15 Oct 2026 at 14:08, Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Thu, Oct 15, 2026 at 09:43:40AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrot=
e:
> > > > On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > > > > These options are irreleant for nommu systems.
> > > > >
> > > > > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RIS=
CV_ISA_SV57")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/arch/riscv/Kconfig
> > > > > +++ b/arch/riscv/Kconfig
> > > > > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> > > > >
> > > > >  config RISCV_ISA_SV48
> > > > >       bool "Page-Based 48-bit Virtual-Memory System"
> > > > > -     depends on 64BIT
> > > > > +     depends on 64BIT && MMU
> > > > >       default y
> > > > >       help
> > > > >         Add support for the Page-Based 48-bit Virtual-Memory Syst=
em.
> > > > > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> > > > >
> > > > >  config RISCV_ISA_SV57
> > > > >       bool "Page-Based 57-bit Virtual-Memory System"
> > > > > -     depends on 64BIT
> > > > > +     depends on 64BIT && MMU
> > > >
> > > > hmm, I think we also need to make RISCV_ISA_SV57 depend on
> > > > RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> > > > !RISCV_ISA_SV48. Human won't make this wrong combination, but
> > > > the random config can.
> > >
> > > Is that really an issue?
> > > If I build a kernel for an SV57-system, do I really need to enable
> > > support for SV48, too? It builds fine without...
> >
> > This is to align with the spec:
> > "implementations that support Sv57 must also support Sv48"
>=20
> IMO that is something different.

I think you're right Geert, "implementation" here surely refers to the
device. If someone wants to make their kernel for sv57 capable hardware
only, I think that's fine.

--5XIbLBFUyP01GSIf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatJ5XAAKCRB4tDGHoIJi
0igdAQCKgcI5SOiV/Vh4z2myL/uKgchv/bePjysKWFMegwimwgD+Mml3OTyzodPD
nGVgI4JGnxSB3Yq11kMS70qNGxjMcQ8=
=+FMG
-----END PGP SIGNATURE-----

--5XIbLBFUyP01GSIf--


--===============1108917875778260466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1108917875778260466==--


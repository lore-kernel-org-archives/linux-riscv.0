Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357BBC5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFgsvJgrIGW0I9xi9pCg4G62vzVVNLR7Drfgsbv8EWQ=; b=UMkLl7SclKlFRFcDUWwWlwjaq7
	yL+vuY7NWPrYPalrHSIYQM+1/gD8GfXkLFEQXB8CiBRQRcA6tsymuSsGVz96Lvs2DD1/nh49TEEjJ
	QSB/pNvEXP4S2sFlh8cCNfHDF1yFtSGUYFN0veiRIIiDS4LO8fJnuS+AfTMnmhcyfqVrzm0xF4SMk
	9XuX4gayNmx4vD3L9hEyYVot2IdiVUlSr7IXAwOElhbKy9St6PkqUb4+oEjOnGajS7dwHgfr909L5
	gNM1vBsBBlMtqO/DeAxvTiWQO8k0vPTO3h+U8PYX7m2Mfb56tg9wxjIliqnKpOBBBHJmG1bS8JV+N
	Q+ZRlK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgBt-00000004nOI-0Rkw;
	Mon, 09 Jun 2025 17:21:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfBD-00000004dYn-1GZU
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 16:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DB724A03C;
	Mon,  9 Jun 2025 16:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2198EC4CEEB;
	Mon,  9 Jun 2025 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485818;
	bh=BDt+EnSMyugovQvGy6Ubv/cuTr+b0OgRnccv/d6A2/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KshWZfNMecvaiHnkIONsQ50d9Yp5Qe+bnB8MKfIB/q5aURqIFP3bjcUTeNxjGErt9
	 K+htwKahgSnFQaU8QGtS5ABs5RLYweIQd+Zt1neCy15lWSYdtfuInB/uvzAXqTIj29
	 7kSRDAF5ZEHFIdaoivavseD1gw/u0AGS7nmpWN2igTcS+I/YVqe41PB1kyUeumUhAA
	 jFHaqNEOcpHdVx5fBu7C/KWrYFITvXYNCfPsHafgbXosLAc06Rct3i/1GxPOkRc23W
	 YMTT7eyLnNF+SRTHAbdkTr8uz+0gDXNVDGnKaIKpGFy2SIwoXesIcoqy6EN+y4vt1t
	 jMowmX8qLG2vw==
Date: Mon, 9 Jun 2025 17:16:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250609-donut-oozy-4dcc8b8a292d@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
MIME-Version: 1.0
In-Reply-To: <aEbOLztcBsKs84pn@atctrx.andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_091659_390870_E7F20C52 
X-CRM114-Status: GOOD (  22.14  )
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
Content-Type: multipart/mixed; boundary="===============8945646356773426850=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8945646356773426850==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iCuGkXnhoBvf8BTy"
Content-Disposition: inline


--iCuGkXnhoBvf8BTy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 08:06:07PM +0800, Ben Zong-You Xie wrote:
> On Fri, Jun 06, 2025 at 05:00:06PM +0100, Conor Dooley wrote:
> > [EXTERNAL MAIL]
>=20
> > Date: Fri, 6 Jun 2025 17:00:06 +0100
> > From: Conor Dooley <conor@kernel.org>
> > To: Ben Zong-You Xie <ben717@andestech.com>
> > Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
> >  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.or=
g,
> >  tglx@linutronix.de, daniel.lezcano@linaro.org,
> >  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
> >  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> >  tim609@andestech.com
> > Subject: Re: [PATCH v5 0/8] add Voyager board support
> >=20
> > On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> > > The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form factor de=
velopment board
> > > including Andes QiLai SoC. This patch series adds minimal device tree
> > > files for the QiLai SoC and the Voyager board [1].
> > >=20
> > > Now only support basic uart drivers to boot up into a basic console. =
Other
> > > features will be added later.
> > >=20
> > > [1] https://www.andestech.com/en/products-solutions/andeshape-platfor=
ms/qilai-chip/
> >=20
> > Ball is in your court now, after rc1 make a tree and get it in
> > linux-next, and then send a pr to soc@kernel.org with this new content.
> > Perhaps the defconfig should go separately, I can take that one if you
> > want.
> >=20
> > Cheers,
> > Conor.
>=20
> Hi Conor,
>=20
> Thanks for your guidance on these patches. I will send a PR to
> soc@kernel.org as you suggested.
>=20
> For the defconfig patch, I'm happy for you to handle it. Just let me
> know if there's anything specific you'd like me to include.

Okay, I picked it up on the basis that you'll send this all to Arnd for
6.17

--iCuGkXnhoBvf8BTy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcI9QAKCRB4tDGHoIJi
0v76AQChF8SXV3tPX9YUO2D246RCtAdeJqY1xijoKS4uH+krRwD+PdF1c5ekrJ8O
9gc3f3JiiaRzFrvpTMdcP+Li/L8lSAg=
=sY/T
-----END PGP SIGNATURE-----

--iCuGkXnhoBvf8BTy--


--===============8945646356773426850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8945646356773426850==--


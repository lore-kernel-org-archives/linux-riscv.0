Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F1CC61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hegCeKwhl11Gpj+aWAarKeAuVOeX3IksN0Q4yywXdI=; b=26ozi7tOKTQ4d/oMOUtAFfmb/s
	P1qbhNK2vRaEjHHfA1M7Ep+qI07k9emNziroo2qGhqK79bypNejX5r0usLNqamSTzfOHxFg2jYhkN
	V43NigUXcC0Fn1dgEnClUk6Hsr5UhohnO0nQkP227ERGJ99v49mJBVidFYOqcGPiq8zOFGsMVHg8a
	2YDEHje8g+yslSg+FHtXjPh+U06enFkQ7qOBhoav6/xr5XUWAicZYmuNQsZcDuIl4/3eywqUlcCXA
	VvK9LdYquNnjkl2dHgK6mqfAuESmAkn4mo1l86OeqlIPWcfSZ9paHICmpgZIU0/D+KMUos+5LY4mi
	8Z7mj07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgBt-00000004nOf-30OA;
	Mon, 09 Jun 2025 17:21:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfC7-00000004dj4-3xxw
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 16:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0C445C270C;
	Mon,  9 Jun 2025 16:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F85C4CEEB;
	Mon,  9 Jun 2025 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485875;
	bh=VU0ezmyeQJzFia/lWEe/vXWrCvKWaOlWYTkg8Kfuy9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlAIOFGcbDC+m0wddJJr+b3+9hmh2x082s8zs/caxZPjEEPbXWrcsNF4PIm13ubwu
	 bwoawW+9It7BSEVHTx8LJKONYvTQna6C09uW3FytqWrNPUucMyIK6FwUC90YbZCZDm
	 6YORhIaKCKpDVjYQvNjJXI663IlhaOiFwaa8Mm4yoHagnwnXBlnWHDMYqZyDbDbqZY
	 Pg2HMquPvSsUSTr7bJHZthfJVGW4fgCbA0Gw/E7L8vpeVxUViHjz9YF6mgCMxMK4Mq
	 rrRLyR6OHckA1E0DpqE6PR5OKfv42YOVqxh81WJIDk+O3A4dTtDzclkgXOm2MJzSQL
	 6znZHVTDn8Ccw==
Date: Mon, 9 Jun 2025 17:17:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250609-twiddling-clamp-eaa0dd2b1cad@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
 <aEbOLztcBsKs84pn@atctrx.andestech.com>
 <20250609-donut-oozy-4dcc8b8a292d@spud>
MIME-Version: 1.0
In-Reply-To: <20250609-donut-oozy-4dcc8b8a292d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_091756_070142_F4F7ECFF 
X-CRM114-Status: GOOD (  24.58  )
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
Content-Type: multipart/mixed; boundary="===============4572499930352022925=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4572499930352022925==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KEnw/+reIV1mgEnt"
Content-Disposition: inline


--KEnw/+reIV1mgEnt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:16:54PM +0100, Conor Dooley wrote:
> On Mon, Jun 09, 2025 at 08:06:07PM +0800, Ben Zong-You Xie wrote:
> > On Fri, Jun 06, 2025 at 05:00:06PM +0100, Conor Dooley wrote:
> > > [EXTERNAL MAIL]
> >=20
> > > Date: Fri, 6 Jun 2025 17:00:06 +0100
> > > From: Conor Dooley <conor@kernel.org>
> > > To: Ben Zong-You Xie <ben717@andestech.com>
> > > Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.e=
du,
> > >  alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.=
org,
> > >  tglx@linutronix.de, daniel.lezcano@linaro.org,
> > >  prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
> > >  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
> > >  tim609@andestech.com
> > > Subject: Re: [PATCH v5 0/8] add Voyager board support
> > >=20
> > > On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> > > > The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form factor =
development board
> > > > including Andes QiLai SoC. This patch series adds minimal device tr=
ee
> > > > files for the QiLai SoC and the Voyager board [1].
> > > >=20
> > > > Now only support basic uart drivers to boot up into a basic console=
=2E Other
> > > > features will be added later.
> > > >=20
> > > > [1] https://www.andestech.com/en/products-solutions/andeshape-platf=
orms/qilai-chip/
> > >=20
> > > Ball is in your court now, after rc1 make a tree and get it in
> > > linux-next, and then send a pr to soc@kernel.org with this new conten=
t.
> > > Perhaps the defconfig should go separately, I can take that one if you
> > > want.
> > >=20
> > > Cheers,
> > > Conor.
> >=20
> > Hi Conor,
> >=20
> > Thanks for your guidance on these patches. I will send a PR to
> > soc@kernel.org as you suggested.
> >=20
> > For the defconfig patch, I'm happy for you to handle it. Just let me
> > know if there's anything specific you'd like me to include.
>=20
> Okay, I picked it up on the basis that you'll send this all to Arnd for
> 6.17

Sorry, I think that was really poorly worded. I picked it up on the
basis that you're going to send the other patches in the series to Arnd
for 6.17.

--KEnw/+reIV1mgEnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcJLgAKCRB4tDGHoIJi
0h0gAQDoR2UYOM0WmjHCTYmKE7o6YujCEbz5BvotuMzHNQnVwAEA0Tu9ckL5FowB
Pxmih3qNPbs68Scaha+XM10tTZOe2A8=
=xlgg
-----END PGP SIGNATURE-----

--KEnw/+reIV1mgEnt--


--===============4572499930352022925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4572499930352022925==--


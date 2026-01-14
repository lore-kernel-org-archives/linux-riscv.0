Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52251D3901A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdb3B6aNXBPpnTX8SgoaW9o97TSm25TGm7QI0/wdnew=; b=pL6zVNdLlgTRlpfvnBl8g9mYhN
	KqLP3xAeaMXme5Eya8fO9SR01xU2RV9LY559JF2wWVBgej32WyJL8e4CFbH4bkxl65CTOwX9fUtbH
	yu0LPnRYy4VrzDf/IfXFF6P3BWzDEYDd5CarrNulhW46ylcshLMdNwwmUfsRuOuvTsS8zl6rj2EQp
	va6BGo/RDx7NcaddGWfMEQuy66aKXCAnuhcpL/FYLF7OI1+bKiuAlNg+C+luiqm8BYt4hjdO1P+Dj
	rMj4aCNR23gDEqlH4tTm5008jg6sawCXj8rbCWXDYl53wQ7vvwOT/CY7GEIXCvOdDZsfwrpSdy9yi
	XEyLqCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7ha-0000000AfSG-11bJ;
	Wed, 14 Jan 2026 20:42:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7hY-0000000AfRx-18Ix
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 20:42:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4AC760051;
	Wed, 14 Jan 2026 20:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E95C4CEF7;
	Wed, 14 Jan 2026 20:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768423367;
	bh=pgnq+h4lcaecFQm8g3LERlvcaCOaQlkNzhkCzWyD7/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifzLZ/+G9uQ8yxnhdPHPfY5Z3W/SS5WrG1uTYHIi2nApxWMAcupS1fyKtKNEqWnrJ
	 DHMgKB5jp4B4973L8g/CEvBlVcpsLVIx++SWWNCb1L2/qdBFtcPhOsBE+1SxHCCoMq
	 tJFrOKF/UP+jPXT0ySS1INraAJODE640a4I5WRLIfO9zQNjmx0wyxvcDSzPVLeopR6
	 bY0xVFxSmH0e3IVp2PjdFT7aQtCbFIbvqMBPEXNm/4m72aN12bWuTT6pGUa8aypdpq
	 Y9ceXzl129WMVO8Z2EXAs8ALJQH0gpaprAwp0i8jHy/2z54/o1UCTDdgiZH4q0DFqF
	 I3Kly4Wb+9Ukg==
Date: Wed, 14 Jan 2026 20:42:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Message-ID: <20260114-evergreen-gluten-b1c8558e7684@spud>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com>
 <20260113075339-GYA25466@gentoo.org>
 <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMarzrZJ072iyAQthB-i-LHFCSJ+tZLx6HcWiVcUrQeafw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0147338366375432824=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0147338366375432824==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZDthVf/8OEPBoP0Y"
Content-Disposition: inline


--ZDthVf/8OEPBoP0Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 10:33:34AM +0800, Guodong Xu wrote:
> Hi, Conor, Yixun
>=20
> On Tue, Jan 13, 2026 at 3:53=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Guodong,
> >
> >
> > On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> > > "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> > > (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> > > checking rule is now enforced, which requires that when zba, zbb, and=
 zbs
> > > are all specified, "b" must be added as well. Failing to do this will
> > > cause dtbs_check schema check warnings.
> > >
> > > According to uabi.rst, as a single-letter extension, "b" should be ad=
ded
> > > after "c" in canonical order.
> > >
> > > Update existing devicetree files to conform to this rule. Line balanc=
ing
> > > is performed where needed to improve readability.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
> > >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++----=
----------
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
> > >  3 files changed, 147 insertions(+), 146 deletions(-)
> > please have separated patch for different SoCs, so they can go via
>=20
> Understand your concern.
>=20
> > their own SoC tree.. thanks
>=20
> Conor, is it possible to take this as one patch instead?
>=20
> It fixes the same dtbs_check warnings from riscv/extensions.yaml across t=
hree
> SoCs. Keeping them together maintains readability and clear tracking, IMH=
O.
>=20
> Happy to split if needed, but wanted to check first.

I'd rather you split it, sorry.

--ZDthVf/8OEPBoP0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWf/wQAKCRB4tDGHoIJi
0g2OAP41lDTLoHw2ey77+Zb0hIinJHKWR1OGlwRDWsqQC8dG1QEAuQ5DjAncDZ8e
aSAgVSyVjvbWxg0rBa1e7p4ORk0iWww=
=XHL2
-----END PGP SIGNATURE-----

--ZDthVf/8OEPBoP0Y--


--===============0147338366375432824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0147338366375432824==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2EECD6E57
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWcNJ6zXVI1LIWiLKtnnkrV3qZwR8Z2xgsb/2qtUo60=; b=lDgmrMQ4ykeYRIf9EIEeHc8nay
	cumvljTUH7e2Ny4caj8qa5e/MKaz25BRUmtUIhmgZ/VM6oGTmhFXQn0wEwTWz5omEJ2Un0vk65lWx
	hQ5ymscMfXPDAkw0QMggfREDLWeBN2n/ZBTOFdxovOxebZzJV/QYyeUyrqaW0woDJb2tBq42mVYME
	ww15TpkefA4ACUGxfZTjlY4CimtqmRnH9PQjvW8RLlfWC9eY+Q8QPJdYSQO0qhzI/o1JA3pnh2+RQ
	cBw+aagcu/tprl6YXw6pemOVvoyvylHfcLJhrtfy8+tJeIOcmz5sJb6fNEefAV5C4uFcpGs+A/fQs
	VuZsc7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4aS-0000000GWJ5-3R87;
	Thu, 04 Jun 2026 09:42:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4aS-0000000GWIz-0AAV
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 09:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 920A942E0F;
	Thu,  4 Jun 2026 09:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85471F00893;
	Thu,  4 Jun 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780566123;
	bh=PdkT1gMgK/k1OUC1BUUe4CIQhhGo5gs8p6KKMU4rRss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1JCHr8aCrEzGxHDzPWADjYC7WWcCKGw5ss+i4g939YaCi+IA5ziit6VGfY0oulA+
	 dUmIKQM0o+MO6OeVwn4zc0jx53bESpH66fOW5i0Boy/Q3eZ6qrWarHFh/jglO9GyZR
	 kxioGbj6Tjb/FcESZH7pw4cT8Qw67Q4ZJjN2b8gPT/y0No5dNxUfZghLD4kbyOsbZe
	 lQtX/kx6jVLr+Z7sh77ns75Jh1PHMC/bhU+EYNyhtBlEKI3B8cTQ/hcscYYB1ccURN
	 RRuIxFL1ZO2EcFs5yTrJqW2MaxwIBK3ZDAU5YnQiLrJKfQQ17DIYvBVzDvcUJ+Nh/9
	 JO940UXuiCsxA==
Date: Thu, 4 Jun 2026 10:41:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH] riscv: defconfig: thead: enable PCA953X GPIO driver
Message-ID: <20260604-moonbeam-alfalfa-6f97dd25d3f8@spud>
References: <CGME20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c@eucas1p1.samsung.com>
 <20260603082132.3200787-1-m.szyprowski@samsung.com>
 <aiCC21nUsYIp1l3M@gen8>
MIME-Version: 1.0
In-Reply-To: <aiCC21nUsYIp1l3M@gen8>
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
Content-Type: multipart/mixed; boundary="===============7962448554810679386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7962448554810679386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KP7FtYY+m7wuc76P"
Content-Disposition: inline


--KP7FtYY+m7wuc76P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 12:39:07PM -0700, Drew Fustini wrote:
> On Wed, Jun 03, 2026 at 10:21:32AM +0200, Marek Szyprowski wrote:
> > Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> > LicheePi4a board.
> >=20
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 08445df56006..a51a423d53f4 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=3Dy
> >  CONFIG_GPIO_DWAPB=3Dy
> >  CONFIG_GPIO_SIFIVE=3Dy
> >  CONFIG_GPIO_SPACEMIT_K1=3Dy
> > +CONFIG_GPIO_PCA953X=3Dy
> > +CONFIG_GPIO_PCA953X_IRQ=3Dy
> >  CONFIG_POWER_RESET_GPIO_RESTART=3Dy
> >  CONFIG_SENSORS_SFCTEMP=3Dm
> >  CONFIG_CPU_THERMAL=3Dy
> > --=20
> > 2.34.1
> >=20
>=20
> Reviewed-by: Drew Fustini <fustini@kernel.org>
>=20
> Paul/Conor: what is the right tree for a arch/riscv/configs/defconfig
> patch like this?

I dunno, in arm land the various platform maintainers take care of this
kind of thing for their own platforms. That hasn't happened (yet?) for
riscv. I've probably taken most SoC support things like this recently.

--KP7FtYY+m7wuc76P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiFIZwAKCRB4tDGHoIJi
0nFbAPwOhb9cxwRg3NOPulNXQVwKo5BCUa0MWTpx//wKHr1dkwD9E6N123ZS2N4C
jw1xrn+IbjV1Uhkanrbt1i7NUbXl5w4=
=ybAz
-----END PGP SIGNATURE-----

--KP7FtYY+m7wuc76P--


--===============7962448554810679386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7962448554810679386==--


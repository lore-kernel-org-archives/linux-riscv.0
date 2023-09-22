Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1ADE7D0D2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUYq1VF07JP1iwmQCjuNpwZyzD1UCirnVfV/MUJvOHo=; b=1ccrJQ1O72KNH97PAfchMQz4/R
	8rx/D/YrsiYEnpCe09mzFurVi9c9jHwNkwSiSaD1YTsus+QsGmajW4+REpyfb1/25xgJt968uvUt5
	hnyQiLzt7Me9xrhG0OnDoEkLH/DKOmzR/U7lgxMpUsrihJJFvB3gZEXYawzJIRwbyyVMPw5IQ+UhU
	nn1uhdj9+b+rgWEOizkeEVMlZZf25SUHDeHah9REsiHiP1Ni3PjsK8DHVHgzOvjo26HC0a3pp20F3
	IMs3JqqwvCK92SJQIx5tFM9Znm4sVLDdWjVUjdOO6wNEwpMerDtmmyzVZmnoKy8wjJqPQLg91bcEw
	WLo3gt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZwr-0085CL-1V;
	Fri, 22 Sep 2023 06:47:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZwo-0085Af-1H
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 06:47:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qjZwR-0004KT-P2; Fri, 22 Sep 2023 08:47:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qjZwN-0086Rh-Ok; Fri, 22 Sep 2023 08:47:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qjZwN-003oy9-DY; Fri, 22 Sep 2023 08:47:03 +0200
Date: Fri, 22 Sep 2023 08:47:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: John Watts <contact@jookia.org>
Subject: Re: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <20230922064704.hlytxjyjo4rekjux@pengutronix.de>
References: <20230824114038.891493-1-privatesub2@gmail.com>
 <ZPfn-0OAL7-3DCmt@titan>
 <20230921212736.nw6ctlimtrxfksbu@pengutronix.de>
 <ZQy3F_VtOL3XWcl0@titan>
MIME-Version: 1.0
In-Reply-To: <ZQy3F_VtOL3XWcl0@titan>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_234730_432135_1D2842D4 
X-CRM114-Status: GOOD (  27.99  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: multipart/mixed; boundary="===============7953655796408086399=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7953655796408086399==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bww26scqrw5ezmb2"
Content-Disposition: inline


--bww26scqrw5ezmb2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey John,

On Fri, Sep 22, 2023 at 07:35:19AM +1000, John Watts wrote:
> On Thu, Sep 21, 2023 at 11:27:36PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hi John,
> >=20
> > On Wed, Sep 06, 2023 at 12:46:19PM +1000, John Watts wrote:
> > > On Thu, Aug 24, 2023 at 02:40:24PM +0300, Aleksandr Shubin wrote:
> > > > This series adds support for PWM controller on new
> > > > Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> > > > provides basic functionality for control PWM channels.
> > >=20
> > > I have tested this patch and earlier versions successfully on a Mango=
 Pi MQ
> > > Dual and verified it outputs a PWM signal.
> >=20
> > If you want that documented, the usual thing to do is to include a
> > Tested-by: tag in your reply.
>=20
> That's a good idea! I'll take a closer look under a scope and against the=
 data
> sheet and give another tested-by then when I can. I'm not sure how close =
that
> gets to a reviewed-by but I don't have the experience in driver developme=
nt to
> know if something is off in the design.

Tested-by has little to nothing to do with development or review. If you
tested that patch and it worked for you, that's enough to give such a
tag.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bww26scqrw5ezmb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUNOGcACgkQj4D7WH0S
/k5rHwf/WlCqmSa7FGJOCv1iloPyW8uz1VP/sNtNI2shOtERwNwaZ4iocMFo/o8I
LMITmzxh2ZgB34KBWh96Qy5i3BvvnU7Fzjy6t3OpR0+hjVCy7/LvgKtlA7q9VEb/
tpenCJ38H4rWdTPUsX2OnWOeCfVIvc6Lh7HzUwX/01ekwVbni3MxczQ12CsV3/yC
DIWTheVJrpQHYT9a7qNlzFDralW3MeJrthV04iWvoOpyLMvmx7d0vN5KwlWrMwb2
bPqgcVOmHnUj3lYPjFVQh8cb4E4DGd0P1QNS8S4gfosRfcMkWq16ymwUVOgSB8+/
w6DynP75YpVgCXDeg6SYfoL4HF1iTQ==
=v75W
-----END PGP SIGNATURE-----

--bww26scqrw5ezmb2--


--===============7953655796408086399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7953655796408086399==--


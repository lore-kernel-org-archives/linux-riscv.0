Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B0AC46467
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 08:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBZqql7QdKZyWPppVEaR8piTvbaIZxUu5A7/2w9Wzn0=; b=W0qxZ75nQh+NeNjqGIsG2mO/hH
	Bn7OzHLhNzZtHMgCGzAz2aHJefBwHznZi2os7GoT1U58l+v/YapMDpb35/dEHdSJfegfmDXRxCsYL
	HxtBVfDga4oURt7A+uPW1Sz82LDKGl1jlKfeKGvblGwFEZ5wPbhEDTAdpecVOCnTkqVkvsfp4U+YQ
	BiTl6mmG8XEh/9nXc3iE11rAlNhh3tGgGEnTCTe8y8RvGO+yY10zdIAKfJfrq5EjexrpIM5xct8aC
	WQ2Hh9n5EnvS6sw2q5Xz7z6vRIlN37hT9bTniFq3onG8CaHnxXFWE1ctv/S3RHAbEVcyDUT+eb+w3
	zBwMaHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZRc-000C8Q-N5; Mon, 28 Nov 2022 08:24:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZRY-000C45-Fn
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 08:24:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ozZRS-0005PL-St; Mon, 28 Nov 2022 09:24:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ozZRR-000mOL-0D; Mon, 28 Nov 2022 09:24:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ozZRR-000sND-57; Mon, 28 Nov 2022 09:24:41 +0100
Date: Mon, 28 Nov 2022 09:24:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: sifive: Always let the first pwm_apply_state
 succeed
Message-ID: <20221128082441.wsqcpuxqk6cynako@pengutronix.de>
References: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
 <20221109120102.ylnseq2w33rvt7fz@pengutronix.de>
 <CAJM55Z-EVXB6FTWwh_vY_B3LoVv+b7TCQCE7asB8G8wkEwui_g@mail.gmail.com>
 <20221109153311.cszr7fgfmyelwra3@pengutronix.de>
 <CAJM55Z8vpJ0XtQqnsFMLE4rkyV11ePbNjtYx0u4pgM9-MT=Kvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z8vpJ0XtQqnsFMLE4rkyV11ePbNjtYx0u4pgM9-MT=Kvg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_002448_582697_E6523B61 
X-CRM114-Status: GOOD (  20.14  )
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
Content-Type: multipart/mixed; boundary="===============3762047980275174605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3762047980275174605==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kaygonhhwcbbtokq"
Content-Disposition: inline


--kaygonhhwcbbtokq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 16, 2022 at 06:41:06PM +0100, Emil Renner Berthing wrote:
> On Wed, 9 Nov 2022 at 16:33, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Wed, Nov 09, 2022 at 01:45:43PM +0100, Emil Renner Berthing wrote:
> > > How about we merge this bug fix that can easily be backported first
> > > and then look at how it should be handled properly?
> >
> > I thought it wouldn't be that hard to do it right from the start,
> > but I admit it's harder than I expected to get right. My prototype looks
> > as follows:
>=20
> This works for me (modulo the two extra {'s). I'd still prefer merging

Yeah, didn't even try to compile it.

> the simpler version and then this on top for ease of backporting, but
> as long as the race is fixed I'm fine. Will you send a cleaned up
> version of this?

I'd let Thierry decide what he want here. Depending on his choice I can
clean up my suggestion (inclusive compile test) on the then relevant
state of the driver.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kaygonhhwcbbtokq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOEcEUACgkQwfwUeK3K
7AnD8gf/dT+Idh5F//NM08TsmrSjFwGL4iPC9RfTbR+drkH+TzqExwotU0ZXtyez
PP7g1a7fBGQyKwwXxmk56rPjoxw4XQIHKdnodzgu8PajwgKKdjTNBhd3HZHUx8I+
2vA+/X60pzU/HBAuXkHm8wLj0BoShsgQYEclABI92tJKbUiM+46D0bTQjAXgrFcf
xT4HrrftNnRB1cdjyD2DJdBSgVZBkr62NJf1LVklhnxMtmwXPHtROWfJqOZsIJBc
drH9DgITkhN6r5oIQtpQ+idbxKYdU137CNSbGbWIFDgwAeammcyPqxXjeVQnk9oT
RcGUSJSsXZ7y5O2nm4FJtqsgl1qjMQ==
=cKDE
-----END PGP SIGNATURE-----

--kaygonhhwcbbtokq--


--===============3762047980275174605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3762047980275174605==--


Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1617C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZEIYVl5bfYrFDszmD5pruTqW4sag5NHhjkrgGKUDP0=; b=SXlnap7IRg5Rmgf6PcWtSOV/Tz
	Jjw9D1T4tY1dOMVOxR67Rt5w/Rn5EHI6TuqfTi9P1TNVHOm9lFS+88GjcmE3W9D+g5bRZ/cAUrX9D
	dm1PrS64kMGUYriamxmEsyq4KwpVSj0lbKUIk/XB73Gpg44xsUhImG50ljhXAr726ayMuHhAS7oFk
	Fxo908tKRHQTR6L7hs5joi2KrGtxEXmfkpj2t32Nq8wNaE5bq5MjcQz614+mg7smyt0HlOABAGsdV
	rLIlg3aVWGQDjVmapnKU8ObSfZtDHhxdgXFdu9nXegKg8qpo5N/gKcNG/Ue3WpM/Pnk1Yy869bVWG
	vENStn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAE6-007AdB-Bs; Fri, 03 Mar 2023 18:33:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYAE3-007Abj-7B
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 18:33:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYADr-0003f5-7F; Fri, 03 Mar 2023 19:33:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYADq-001cPW-9m; Fri, 03 Mar 2023 19:33:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYADp-001udf-FE; Fri, 03 Mar 2023 19:33:37 +0100
Date: Fri, 3 Mar 2023 19:33:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 67/87] spi: sifive: Convert to platform remove callback
 returning void
Message-ID: <20230303183331.kcb5itikq4cdhqo3@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
 <20230303172041.2103336-68-u.kleine-koenig@pengutronix.de>
 <1f3f97a1-f335-45c0-980b-b0847cd8ad90@spud>
MIME-Version: 1.0
In-Reply-To: <1f3f97a1-f335-45c0-980b-b0847cd8ad90@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_103351_297372_F788CFAC 
X-CRM114-Status: GOOD (  19.37  )
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
Content-Type: multipart/mixed; boundary="===============0988005198882327555=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0988005198882327555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t7t5nu352axyhkxy"
Content-Disposition: inline


--t7t5nu352axyhkxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Fri, Mar 03, 2023 at 05:46:11PM +0000, Conor Dooley wrote:
> On Fri, Mar 03, 2023 at 06:20:21PM +0100, Uwe Kleine-K=F6nig wrote:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is (mostly) ignored
> > and this typically results in resource leaks. To improve here there is a
> > quest to make the remove callback return void. In the first step of this
> > quest all drivers are converted to .remove_new() which already returns
> > void.
> >=20
> > Trivially convert this driver from always returning zero in the remove
> > callback to the void returning variant.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> This one landed in my mailbox too, so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I have ~2000 of such patches pending in my tree that wait for
submission. If you want a Cc: for each of them, just tell me :-)

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t7t5nu352axyhkxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQCPW8ACgkQwfwUeK3K
7Am1Agf8CfTjWviZwbfrUV0Vn9WyI1ErNhxF9ixhVeOt2bSWfLIy88wzWKHff3l4
P4jAkxYQ0pk7/AvIIDUtOteZY4NMM5qs+c6CHiveNGbdGlumofjHfD91+Y7yYDBg
JveWdR0UTV219gFPUVLPUrp9PVY1S0qMZThEItr+Cc+WiOhH9vcKLVIfqEVTbX81
iU2uVcyUcqNXR5B76bziF+CzLaNiU8O9codnvc7PeIWCxMJ9Tn8TBubE5MNsmFh0
JI+d7U1o3G5HRIIeidi8S5oIg/gvQJRC2yve7hqFooAvwONrHkeATqNJi5xyMzyq
AFHk/329ttyS6ptpnY2JgFvLAKKktA==
=A4Yl
-----END PGP SIGNATURE-----

--t7t5nu352axyhkxy--


--===============0988005198882327555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0988005198882327555==--


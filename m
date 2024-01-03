Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F15C47074
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ld7qw2WLWZyP0MwB8xXSugvL8DSOif8H4ebg74/wqRA=; b=wXepf+TqteTV9ETzFLu8rIVPZz
	FtXtEeFlys/twAq+LFry+GB7fP8V+/71MvpdyIMlh3BYyGnipNNskHY19fdd7sd+Z2tl+wMhOoiKE
	c7CsTxIW4jAkgzvwT8aqda5Jjwdi6cB0eyTTKRc8Km3dNzwlJn5Uk3heeJtDQdrT8rV2FnTVyvnH2
	jikZ3kvP95ey+X/449MoQcYekNgD95KyIJ0Rm8LDBMbn3q/blW4FH+1xlWCzr7oaOEE8HXvJTQbnv
	aljGIErQjxL8e6FxeOINIWSgaan/kkTZfF7Xx5mM8UNnEoq06b+J8EgfgkwdKLXjr6YynuAOjVwS3
	EW0g1n2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0GW-00AnrA-0w;
	Wed, 03 Jan 2024 12:22:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0GQ-00AnoX-1j
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 12:22:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rL0GL-00043N-Mm; Wed, 03 Jan 2024 13:22:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rL0GE-00074J-Ti; Wed, 03 Jan 2024 13:22:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rL0GE-003Lb5-2e;
	Wed, 03 Jan 2024 13:22:14 +0100
Date: Wed, 3 Jan 2024 13:22:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 2/4] pwm: opencores: Add PWM driver support
Message-ID: <sl3np65yohjs2hyz3d2mfbs3ewdfpaisdlgle7dcqudpecgipl@pxccptubrguc>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-3-william.qiu@starfivetech.com>
 <b1a44192-4e7d-46c2-b9cf-969795208839@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <b1a44192-4e7d-46c2-b9cf-969795208839@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_042226_618123_C8612126 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Type: multipart/mixed; boundary="===============1971109804091442583=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1971109804091442583==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ei7ppzofy2gte56m"
Content-Disposition: inline


--ei7ppzofy2gte56m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello William,

On Wed, Jan 03, 2024 at 03:15:31PM +0800, William Qiu wrote:
> Could you please help me review this patch series to see if there is
> anything that needs to be modified? If not, could you help me integrate
> this patch into the main line? Thanks.
> Thanks for taking time to review this patch series.

It's on my radar. Actually your patch set is on the top of my list. I
won't promise a timely review, but I plan to do it this week.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ei7ppzofy2gte56m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWVUXUACgkQj4D7WH0S
/k4Wrgf9H2xWkjQYexVF/+Fqnk0YZUI6HXVnF+6vhwtoU8wskh1hVETaDfAsA1ca
TNI/mS1aYYaukikrpbprbR0MjwI2dRjvwm54xZgvZLTZx61Gl69FNH2KMlnPCjha
9Vw++IAFa+HrzV55Yl/fmY1/W4i7sHZTDY+px2IgD51sxy4SLZq7D0S9NurCGx7J
PbGHBBNWdSxWjP6klQdnA2C7A6ivG3nkhVmcqKXlmwpdacEEUh8kfyJVQ/n4QRZi
15sCY0nt9D6IOC9v1z2mvPocCrTMkefG0gkraiOVf6Xh5kIFHVUNAj2NTnQb7F2R
7FFOt3V+xcAO+F9jVsSfZymQ+t9Mbg==
=Lp3F
-----END PGP SIGNATURE-----

--ei7ppzofy2gte56m--


--===============1971109804091442583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1971109804091442583==--


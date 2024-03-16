Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BCCC54E60
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Mar 2024 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWs+fvZRSRwnpjzsIRrQNICbi6gNMZQlYpym1gx2/f8=; b=I8jAwgCfHoI5bHb9W+9xn7z5AN
	xIMxLnHPYwrAbvR+QcohVYWW4keuv1/kjxA+0jR8xENsUdZaKUyp2IPVFY08mdWyP7Y1Lq4HOlkxJ
	gcCWjDlpJC4e7qsISF2koSITzbWFAcOanHGaYZ4Csx2+xqCzzU8ixMMFfiHM8IGrJwfVSzflOczp3
	WhoLhq7vezwGxa9LIbrGtSP3G9CmROoA7QkyBamjazrV6Kxh2jIM0YBpgTgNqYnLmKSlce1BD6r5e
	NlJFOPB3nIUFy8mxP/xYQxv2qSrQK8f7Ilhwy3GEosA9y7PjixXWU6eu87fODGZsWOe+HdHis8h0r
	reblOPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlONC-00000002b6B-2myL;
	Sat, 16 Mar 2024 07:22:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlON8-00000002b5K-34MA
	for linux-riscv@lists.infradead.org;
	Sat, 16 Mar 2024 07:22:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rlOMq-00023s-Gk; Sat, 16 Mar 2024 08:22:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rlOMn-006eVy-Fd; Sat, 16 Mar 2024 08:22:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rlOMn-0079PS-1F;
	Sat, 16 Mar 2024 08:22:05 +0100
Date: Sat, 16 Mar 2024 08:22:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
Subject: Re: [PATCH v5 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
Message-ID: <jtqqbpr4qeo4m5oetmmusf2hy2wy6hnpstl344p2hu62vbbqrk@tefqeoqf37jh>
References: <20240314100131.323540-1-qiujingbao.dlmu@gmail.com>
 <20240314100131.323540-3-qiujingbao.dlmu@gmail.com>
 <ZfT42gzJhVd1NQzd@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZfT42gzJhVd1NQzd@xhacker>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_002226_795424_C2EBD854 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: multipart/mixed; boundary="===============2778922017354775291=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2778922017354775291==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4lgqmjnyk5h5zzy"
Content-Disposition: inline


--s4lgqmjnyk5h5zzy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Mar 16, 2024 at 09:41:46AM +0800, Jisheng Zhang wrote:
> On Thu, Mar 14, 2024 at 06:01:31PM +0800, Jingbao Qiu wrote:
> > +static void cv1800_pwm_set_oe(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> > +			      u32 mode)
>=20
> Did you get any information about the capture support pwm controller?

Instead of adding capture support to this pwm driver, I'd rather see
support added to the counter subsystem. That's more versatile.

See https://lore.kernel.org/linux-pwm/Y3aze3B6%2Fe5uWS%2FH@fedora for
some more context.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--s4lgqmjnyk5h5zzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmX1SJwACgkQj4D7WH0S
/k6F+ggAks6uSCJiH1mbc45Emop15Wur2v3K91t2QJSqBoijti/USWld2/ZtveTC
EcqQzoSjZP4QrYxr+jQybwfgNad47KtT/+IEOiq7Fhg8trvMiBTr5IUJUiQl3aSl
qy3Iz49T0pBsm9FVzYcc9MB2B8I12hl1MHHAM+nh0p2gGeuwu3p89aFHCKgfnD08
3qikAnMFFVotItY+XhhQ6lgYw7PW89bD8HFbpEirHukSpzjuTA9SzAjcNXc+AC0T
N64SQHAl/N37RGUdUiABy/Md3WrMxY4CD3+/cllXgSzj5P+QyT75RMzSrjDtlKaI
IEHPm8ZLCn756hNE8bCRBy4BxQU6zg==
=3u2N
-----END PGP SIGNATURE-----

--s4lgqmjnyk5h5zzy--


--===============2778922017354775291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2778922017354775291==--


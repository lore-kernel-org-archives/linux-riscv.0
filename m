Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19878C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3aydTV7JxoxuQakjpjI09XHTEDwn90l2TK3k9gcM8U=; b=sTUdQIDfpnFoNj3j+MBKpIuGJn
	91wiURtcmQW7p6u9P3PeMuDTVJ1+ZFDrTHNiXwrsxvP/AT8Ew7ZcmEFSvC7xs2br3P1z1SNrTzPJp
	IVEgCl28DO/WWtB07krtbfkdtf4ZD5RedaNbT+29fgwsdfLHdjg+vHRkHHcuoeE5ijJlbzOeu9CO1
	qLBcIhP20zkbQDxoPNVDoHXUl9lwUu3POOp4V5eMONg9EJO/bYtHU8QSUEBa4SZDr8UQdbUiEjzq4
	I9Kj00C2WOjsmSmfh4WM9P3vk2TdodidbV36nQ2qXkN7nSRQ0gMVjLCn51Dfwo8QIt+oS3fTvAxqW
	hDKkt1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GDI-004sxD-Ox; Fri, 01 Jul 2022 12:57:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GCh-004sdk-3f
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 12:57:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7GCT-0001xb-7p; Fri, 01 Jul 2022 14:56:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7GCO-003muO-9Q; Fri, 01 Jul 2022 14:56:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o7GCR-002Jys-03; Fri, 01 Jul 2022 14:56:43 +0200
Date: Fri, 1 Jul 2022 14:56:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Message-ID: <20220701125639.3sbafn7hsfsi6e7y@pengutronix.de>
References: <20220617114442.998357-1-conor.dooley@microchip.com>
 <20220617114442.998357-3-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220617114442.998357-3-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_055659_231752_16B92BC3 
X-CRM114-Status: GOOD (  16.74  )
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
Content-Type: multipart/mixed; boundary="===============3147454824918115756=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3147454824918115756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fny2pvyg3zhnbzkv"
Content-Disposition: inline


--fny2pvyg3zhnbzkv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 17, 2022 at 12:44:43PM +0100, Conor Dooley wrote:
> Add the newly introduced pwm driver to the existing PolarFire SoC entry.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1b4b77daa5f..d0b39fa4f309 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17091,6 +17091,7 @@ L:	linux-riscv@lists.infradead.org
>  S:	Supported
>  F:	arch/riscv/boot/dts/microchip/
>  F:	drivers/mailbox/mailbox-mpfs.c
> +F:	drivers/pwm/pwm-microchip-core.c
>  F:	drivers/soc/microchip/
>  F:	include/soc/microchip/mpfs.h

The change looks okish to me, but it doesn't make sense without patch
1/2. So I'm discarding this one from our patchwork instance, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fny2pvyg3zhnbzkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK+7wQACgkQwfwUeK3K
7An84Qf/T4slkYPXeMf/DX0QXgxmtPj+FdfqZK/7rmnnSvlyWYAgAbSNoAuEppwu
jZLUtt9oLIb+5RHyrPG5Pq7cfjQ/7Mx1nsqx+Zy++zX84vzArIOINxbFg3xkr60k
zO51xsBX0pR4xG8HOVus17ABkZK9FBhr1fjQ4WHDKn2nhRfhto+yR/pfaGjE8F9s
u/y1Kg9djPrZHHPHV1/OjahHCnTdq/jNn9kHARpoNBZ5XpHiEIf53/E3Uoptafln
R09YGYo2Z4Rw+ysJgZSFMNd41cUOSYEAUAZVHInPEFf86DFh4bn4uc1jeXXJsofi
tqvBvNkk5ME5m3YDvMLOZo5KGoE8pA==
=jHZQ
-----END PGP SIGNATURE-----

--fny2pvyg3zhnbzkv--


--===============3147454824918115756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3147454824918115756==--


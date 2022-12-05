Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8DDC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 18:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy9vWuqzXBw3C6twoz1ESshTFJ9dSaIXFQL9fXFWxvc=; b=R97Z5rDBQLzP7WXRVNF/+vB42d
	7jgZSQP/Cd7LA0d/9X31xD5Jkm4IArKKlcUh6qIM0mq3QJcuEh9ZL0o0DY5bL+hDy5/dCYbBBkTKN
	igss1BMogwJdotWA4ayCjLinJzUAGXETwJC8AtNtd78fb3Xi8o9xlV4Hu4rweG1TrqzpAu/gCky/B
	mk/lAjcotCBX2GuJ7Us0tjV52/nBwMIrGjmANGr655hSMeGrH3gbrSmV7uKb7MUbkI8KHp8U/StaS
	Msuxk8AbCpXQvEvULihQga6ingTisWMuaDe6NbpDoBMgUI0omhvK1tUNF3FScIey+2HKODqteR5us
	C6YytbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Fyj-008Hb8-G8; Mon, 05 Dec 2022 18:14:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Fyg-008HD5-Iy
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 18:14:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2FyS-0002ph-5Y; Mon, 05 Dec 2022 19:13:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2FyO-002Wur-Ea; Mon, 05 Dec 2022 19:13:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p2FyO-002qP9-DL; Mon, 05 Dec 2022 19:13:48 +0100
Date: Mon, 5 Dec 2022 19:13:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20221205181348.3bvugpjr7xgf6uk5@pengutronix.de>
References: <20221117164950.cssukd63fywzuwua@pengutronix.de>
 <Y3Zxkt3OSPQc46Q2@spud>
 <20221117210433.n5j7upqqksld42mu@pengutronix.de>
 <Y3avobkvYK3ydKTS@spud>
 <Y3uZY5mt/ZIWk3sS@wendy>
 <Y4coL74qQX80TNaT@wendy>
 <20221130103755.lhil2jaw3oufr2sf@pengutronix.de>
 <Y44Mk2nGu1Zeq7QQ@wendy>
 <20221205160328.wn4rcs6uxuuaxftd@pengutronix.de>
 <Y44mxp9Wr/aEdaxE@spud>
MIME-Version: 1.0
In-Reply-To: <Y44mxp9Wr/aEdaxE@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_101406_649006_0EAD7E98 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Type: multipart/mixed; boundary="===============5774159625454902698=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5774159625454902698==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjxhhs4q4yv2cfmm"
Content-Disposition: inline


--kjxhhs4q4yv2cfmm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Mon, Dec 05, 2022 at 05:13:42PM +0000, Conor Dooley wrote:
> Figured I was better off doing something quickly & asking rather than
> polishing only to find out it was disliked ;)

:-)

> >  - in .apply() check the current time, add the current period and store
> >    the result to ddata->updatetimestamp
> >  - in .get_state do:
> >      if (current_time >=3D ddata->updatetimestamp)
> >        process fine
> >      else:
> >        timeout (or wait until ddata->updatetimestamp?)
> >=20
> > Actually I'd prefer to wait instead of -ETIMEOUT.
>=20
> Prefer to wait in get_state() or in both it & apply()?

Prefer to wait where it's necessary ...

> Depending on how far away updatetimestamp is, would we still not want to
> time out if it is going to be a long time, no?

I'd prefer a slow but right value over a quick error.

The sun4i driver has in its .apply():

        /* We need a full period to elapse before disabling the channel. */
        delay_us =3D DIV_ROUND_UP_ULL(cstate.period, NSEC_PER_USEC);
        if ((delay_us / 500) > MAX_UDELAY_MS)
                msleep(delay_us / 1000 + 1);
        else
                usleep_range(delay_us, delay_us * 2);

so it's at least not new in general to have a waiting time in O(period).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kjxhhs4q4yv2cfmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOONNkACgkQwfwUeK3K
7AmE2wgAk2sWVpLdReSy1pSzeYCZ6ioUVHCTzslq0tljPK15BnT/FAMYPMhSozRS
I6ZEmm3iRyJ4TiOgFbUVYIpNIe4UUvrAA8kfQ5zViM3mKKL9zXdpRXaG+cQPwl+p
RM8KE2Yzd9wJWFCwx951zMBGxCfIqj2I06vCnBbi2rbBUzZbMy5dzFiyw/IKaMiv
u8ylSqijubQSOQQ7gsZbp2MqpZO2ZH1IAdFyCslAeIoIUo6I9UnGLJS0fYG6fmLX
2iMjTiml+SfLnob6YfDQiwTLv+WOOVPhDwmx0f/FCeugOftF5jyJyVIy+TJ9EB9m
/c9nw3rglCUesb6zI6guMd7nlr5ZqQ==
=OBsk
-----END PGP SIGNATURE-----

--kjxhhs4q4yv2cfmm--


--===============5774159625454902698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5774159625454902698==--


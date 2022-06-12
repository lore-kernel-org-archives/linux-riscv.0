Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C63C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jun 2022 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVUbcca6eon6ivAyu0S5RHoPiffeBCjLeHFoA/I5VaM=; b=JK00pjpqK9LioBp/5uNf6bS8fU
	DXig8g1VkQGgp20GZyW+FvotM6wEmSUqWPkxNOGbmGIFPn8/xniERcf/kB/vvrU6f477KVxO/1nAd
	+atxuZgw+lXd13z2jbMQuAnDEbwVwE3gWxoI+Z4dEWJFiCCUxsTmCRvTRwIzZ+zK9URhZ7DCHMI6m
	dVUaIlkWyBxUcRNWUf66MpAalR69Yi2mjZymOKfekatdS2dbx4IaDxqu6ItStn6MMhRNLJ6TEgCkw
	X8qbwjD9DluvLORxKGAC+Ck9204LHL9x1lJXlX+o5WleugJgXHmF8SO2o7aTBtT+AiYg3I6gcJz35
	eD0M5ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Uxe-000B64-Mz; Sun, 12 Jun 2022 21:17:30 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Uxc-000B4a-0j
	for linux-riscv@lists.infradead.org; Sun, 12 Jun 2022 21:17:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o0UxA-0005xS-DG; Sun, 12 Jun 2022 23:17:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o0Ux9-000AsY-HR; Sun, 12 Jun 2022 23:16:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o0Ux8-00FuSK-B9; Sun, 12 Jun 2022 23:16:58 +0200
Date: Sun, 12 Jun 2022 23:16:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor.Dooley@microchip.com
Cc: thierry.reding@gmail.com, lee.jones@linaro.org,
	Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20220612211656.eoqutfa36ngu734a@pengutronix.de>
References: <20220607084551.2735922-1-conor.dooley@microchip.com>
 <20220607084551.2735922-2-conor.dooley@microchip.com>
 <20220607200755.tgsrwe4ten5inw27@pengutronix.de>
 <eefc366e-1d32-7565-0d6d-243b8addc381@microchip.com>
 <20220608151308.ym6ls3ku6ukhtly6@pengutronix.de>
 <149da575-7ff9-9897-ce13-37c0f061b63e@microchip.com>
MIME-Version: 1.0
In-Reply-To: <149da575-7ff9-9897-ce13-37c0f061b63e@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_141728_095657_92602170 
X-CRM114-Status: GOOD (  23.07  )
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
Content-Type: multipart/mixed; boundary="===============8657448945704063123=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8657448945704063123==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wncvypjdbe7brpnu"
Content-Disposition: inline


--wncvypjdbe7brpnu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2022 at 01:00:53PM +0000, Conor.Dooley@microchip.com wrote:
> Hey Uwe, one last one for ya..
>=20
> On 08/06/2022 16:13, Uwe Kleine-K=F6nig wrote:
> > Hello Conor,
> >=20
> > On Wed, Jun 08, 2022 at 12:12:37PM +0000, Conor.Dooley@microchip.com wr=
ote:
> >> On 07/06/2022 21:07, Uwe Kleine-K=F6nig wrote:
> >>> On Tue, Jun 07, 2022 at 09:45:51AM +0100, Conor Dooley wrote:
> >>>> Add a driver that supports the Microchip FPGA "soft" PWM IP core.
> >>>>
> >>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>>> ---
> ---8<---
> >>>> +struct mchp_core_pwm_registers {
> >>>> +	u8 posedge;
> >>>> +	u8 negedge;
> >>>> +	u8 period_steps;
> >>>> +	u8 prescale;
> >>>
> >>> these are the four registers for each channel, right? Can you add a
> >>> short overview how these registers define the resulting output wave.
> >>
> >> Ehh, only the edges are per channel. Does that change anything about
> >> your feedback?
> >> I'll add an explanation for each, sure.
> >=20
> > So the channels share the same period? If so you'll have to keep track
> > of which PWM channels are enabled and only change the period if no other
> > running channel is affected.
>=20
> When I am capping the period (or not allowing it to be changed in this ca=
se
> here) should I correct the duty cycle so that the the ratio is preserved?

No, the thing to do is: Pick the biggest possible period not bigger
than the requested period. For that period pick the biggest possible
duty_cycle not bigger than the requested duty_cycle.

The focus here is to do something somewhat sensible and simple.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wncvypjdbe7brpnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKmV8YACgkQwfwUeK3K
7AmuQgf/esrFdmgkAoLjyqIsxyXenbDBgm/QoJrnjeFiCoHaCmEYUuNJDi4ykUUy
ahr3+eaXLsAEXNItWMTjDGIBNlatVnncgXDqNWXshpyjItm7LGSjJqUTNyMzJlOB
xq+4EN5VEz8UcnOJzG+zZ2nX4Fnm0CZio1O+JqDc/zwoagBQkHvceVH4X03GP0jv
smeehKQGxuxXZEsde1xb4G3Ss47wJeEFtfJWGwo6QEWEz5VLj0JH+cDjtfUZMcAC
DXqqCEN2WBKNRB/R6JsLStZn3VWoVW/yFyQ9VLHxd0aK9HGRobHOj+ew1Tse+tg7
liDPu+MBPJdyPgYQOyFY8kG54AI94A==
=y/r8
-----END PGP SIGNATURE-----

--wncvypjdbe7brpnu--


--===============8657448945704063123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8657448945704063123==--


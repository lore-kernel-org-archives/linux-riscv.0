Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMIo7H/aL/rNwDimWUdkKCd4qac04v5TVblmAP9C18w=; b=MlSJxy2acKgLB8s36y+9/XbzP1
	Pe4/DWqSV4YMXH1I45lazCSVC1n8qB5dKQYsIat8QgxLpdtKyK4l6EfkwJ0RHh8IAk9Ra/MUy0q/O
	wCKJmi77CKcySbTtpmxATnNaBEEI03jk8cKAO0eACA3Vnh6DIfOpN0I9cUiKkYno5f4WB9/Hzc79O
	O9NFckqaY1qX/LmxGPz6sqduooyr9av0NtOJPJD9pT2ZqJqBK0hbErjvos1DPGXEXPNuZcCzzAoPL
	tta3SrnkloJ9C1zOAtjXwrjHoaF4SM/FxlhdOUaPQ1vH9njka4SQ7eNdCIb+G3YNrBdfJHSXtBg4L
	2n7lXjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeGFA-009RYq-SY; Fri, 30 Sep 2022 13:39:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeGF8-009RXU-M9
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 13:39:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oeGEp-0004vB-IS; Fri, 30 Sep 2022 15:39:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oeGEp-003oPC-LV; Fri, 30 Sep 2022 15:39:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oeGEn-004g8M-Gs; Fri, 30 Sep 2022 15:39:33 +0200
Date: Fri, 30 Sep 2022 15:39:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <20220930133933.br5kanbh3clvahvr@pengutronix.de>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
 <YyhmZBmfJvJ9/vBg@wendy>
 <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
 <Yyh8v+MtHuc0LLf0@wendy>
 <20220930091316.kdkf4oeu6uvxzqa6@pengutronix.de>
 <Yza61MO9hbuFytmM@wendy>
MIME-Version: 1.0
In-Reply-To: <Yza61MO9hbuFytmM@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_063954_742644_27270BE6 
X-CRM114-Status: GOOD (  30.54  )
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
Content-Type: multipart/mixed; boundary="===============9208686454873000123=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9208686454873000123==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtjav5n2d7kuyppr"
Content-Disposition: inline


--rtjav5n2d7kuyppr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 10:45:56AM +0100, Conor Dooley wrote:
> On Fri, Sep 30, 2022 at 11:13:16AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Sep 19, 2022 at 03:29:19PM +0100, Conor Dooley wrote:
> > > Hey Uwe,
> > >=20
> > > On Mon, Sep 19, 2022 at 03:50:08PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > On Mon, Sep 19, 2022 at 01:53:56PM +0100, Conor Dooley wrote:
> > > > > Because I was running into conflicts between the reporting here a=
nd some
> > > > > of the checks that I have added to prevent the PWM being put into=
 an
> > > > > invalid state. On boot both negedge and posedge will be zero & th=
is was
> > > > > preventing me from setting the period at all.
> > > >=20
> > > > I don't understood that.
> > >=20
> > > On startup, (negedge =3D=3D posedge) is true as both are zero, but th=
e reset
> > > values for prescale and period are actually 0x8. If on reset I try to
> > > set a small period, say "echo 1000 > period" apply() returns -EINVAL
> > > because of a check in the pwm core in pwm_apply_state() as I am
> > > attempting to set the period to lower than the out-of-reset duty cycl=
e.
> >=20
> > You're supposed to keep the period for pwm#1 untouched while configuring
> > pwm#0 only if pwm#1 already has a consumer. So if pwm#1 isn't requested,
> > you can change the period for pwm#0.
>=20
> I must have done a bad job of explaining here, as I don't think this is
> an answer to my question.
>=20
> On reset, the prescale and period_steps registers are set to 0x8. If I
> attempt to set the period to do "echo 1000 > period", I get -EINVAL back
> from pwm_apply_state() (in next-20220928 it's @ L562 in pwm/core.c) as
> the duty cycle is computed as twice the period as, on reset, we have
> posedge =3D negedge =3D 0x0. The check of state->duty_cycle > state->peri=
od
> fails in pwm_apply_state() as a result.

So set duty_cycle to 0 first?

A problem of the sysfs interface is that you can only set one parameter
after the other. So there you have to find a sequence of valid
pwm_states that only differ in a single parameter between the initial
and the desired state.

That's nothing a "normal" pwm consumer would be affected by. (IMHO we
should have a userspace API that benefits from the properties of
pwm_apply().)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rtjav5n2d7kuyppr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmM28ZIACgkQwfwUeK3K
7AmJ0Af/Uo5rO+tFoSMofiW5sgL/QaXfTixAJCtvamJAfhQDDzksiQLoyMz9Evj9
vPB281oL3yRgjSiLxTRl9jW51jJclF05muLkOkC/yHZgBRKjrrvuPNPsInDLDF3W
VLjCvv9F3So7LFQwWkdgbFiGnQcuBGkVvj2DgWPKRUfxmW71J3BV9DLM+aLTIWnl
/OTIxdiVtA29+G7Hm00gkbC/d1glG4bC8fHZ15l06457Ab76SDlzy/0z9Pa9/wlZ
bJ/HcBPOZNJO5R4C1x1YKGz2HLCRRmaRxnO5aSLorzwlLoGDu3sTZ72JCNSb4mqt
09gY/rxyEwV5Enqk7Ud+OS4XgGOlCA==
=BB3H
-----END PGP SIGNATURE-----

--rtjav5n2d7kuyppr--


--===============9208686454873000123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9208686454873000123==--


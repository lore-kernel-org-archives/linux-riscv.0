Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A3AC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDrLSOhFzX4tbiIqzqwAb/FCQJ2khrQhsAlq4vra44I=; b=W5zHERJ1/c9qtVKuTbLI1fUCIV
	sSGdSHkYwIWbyaS907Wvidm5U9vKp0Caa1pSUbghrLZ0evk9nt6XEk+nMfl0Xv+DHqV/jyWAbU0oN
	1g4ipC61IfqpV9o8wKG7Eb9pcn/vhNkiCFV99U5PdK+U3T0t5nLZ7lwP+X0yMr31oYe6wuRVzvGeb
	NUbl2gd5NUxayc47ESe937SGm1X8p5wOFVeaXOfuBhplFx/kje35fiwj6n4STeKJbmQWP7Z/jK1UG
	63UGX6Y3I3fD4xeaAE8PZkL2yeWZemT4EnoREHnD//yPrmbwLfSQBqM4Sa43psSAd5+GPLl1kUR0A
	Dj8uLELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0KTm-00FV9S-S3; Wed, 30 Nov 2022 10:38:14 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0KTi-00FV7m-R4
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 10:38:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0KTV-00036q-PK; Wed, 30 Nov 2022 11:37:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0KTT-001Hkv-Ua; Wed, 30 Nov 2022 11:37:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0KTU-001SCa-1g; Wed, 30 Nov 2022 11:37:56 +0100
Date: Wed, 30 Nov 2022 11:37:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20221130103755.lhil2jaw3oufr2sf@pengutronix.de>
References: <20221110093512.333881-1-conor.dooley@microchip.com>
 <20221110093512.333881-2-conor.dooley@microchip.com>
 <20221117164950.cssukd63fywzuwua@pengutronix.de>
 <Y3Zxkt3OSPQc46Q2@spud>
 <20221117210433.n5j7upqqksld42mu@pengutronix.de>
 <Y3avobkvYK3ydKTS@spud>
 <Y3uZY5mt/ZIWk3sS@wendy>
 <Y4coL74qQX80TNaT@wendy>
MIME-Version: 1.0
In-Reply-To: <Y4coL74qQX80TNaT@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_023811_061462_05D6E0FD 
X-CRM114-Status: GOOD (  65.17  )
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
Content-Type: multipart/mixed; boundary="===============0426337128817032766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0426337128817032766==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eijrjeuha55mqmvj"
Content-Disposition: inline


--eijrjeuha55mqmvj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Wed, Nov 30, 2022 at 09:53:51AM +0000, Conor Dooley wrote:
> On Mon, Nov 21, 2022 at 03:29:39PM +0000, Conor Dooley wrote:
> > On Thu, Nov 17, 2022 at 10:03:13PM +0000, Conor Dooley wrote:
> > > On Thu, Nov 17, 2022 at 10:04:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > On Thu, Nov 17, 2022 at 05:38:26PM +0000, Conor Dooley wrote:
> > > > > On Thu, Nov 17, 2022 at 05:49:50PM +0100, Uwe Kleine-K=F6nig wrot=
e:
> > > > > > Hello Conor,
> > > > >=20
> > > > > Hello Uwe,
> > > > >=20
> > > > > > On Thu, Nov 10, 2022 at 09:35:12AM +0000, Conor Dooley wrote:
> > > > > > > [...]
> > > > > > > +
> > > > > > > +static void mchp_core_pwm_enable(struct pwm_chip *chip, stru=
ct pwm_device *pwm,
> > > > > > > +				 bool enable, u64 period)
> > > > > > > +{
> > > > > > > +	struct mchp_core_pwm_chip *mchp_core_pwm =3D to_mchp_core_p=
wm(chip);
> > > > > > > +	u8 channel_enable, reg_offset, shift;
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * There are two adjacent 8 bit control regs, the lower reg=
 controls
> > > > > > > +	 * 0-7 and the upper reg 8-15. Check if the pwm is in the u=
pper reg
> > > > > > > +	 * and if so, offset by the bus width.
> > > > > > > +	 */
> > > > > > > +	reg_offset =3D MCHPCOREPWM_EN(pwm->hwpwm >> 3);
> > > > > > > +	shift =3D pwm->hwpwm & 7;
> > > > > > > +
> > > > > > > +	channel_enable =3D readb_relaxed(mchp_core_pwm->base + reg_=
offset);
> > > > > > > +	channel_enable &=3D ~(1 << shift);
> > > > > > > +	channel_enable |=3D (enable << shift);
> > > > > > > +
> > > > > > > +	writel_relaxed(channel_enable, mchp_core_pwm->base + reg_of=
fset);
> > > > > > > +	mchp_core_pwm->channel_enabled &=3D ~BIT(pwm->hwpwm);
> > > > > > > +	mchp_core_pwm->channel_enabled |=3D enable << pwm->hwpwm;
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Notify the block to update the waveform from the shadow =
registers.
> > > > > > > +	 * The updated values will not appear on the bus until they=
 have been
> > > > > > > +	 * applied to the waveform at the beginning of the next per=
iod. We must
> > > > > > > +	 * write these registers and wait for them to be applied be=
fore
> > > > > > > +	 * considering the channel enabled.
> > > > > > > +	 * If the delay is under 1 us, sleep for at least 1 us anyw=
ay.
> > > > > > > +	 */
> > > > > > > +	if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
> > > > > > > +		u64 delay;
> > > > > > > +
> > > > > > > +		delay =3D div_u64(period, 1000u) ? : 1u;
> > > > > > > +		writel_relaxed(1U, mchp_core_pwm->base + MCHPCOREPWM_SYNC_=
UPD);
> > > > > > > +		usleep_range(delay, delay * 2);
> > > > > > > +	}
> > > > > >=20
> > > > > > In some cases the delay could be prevented. e.g. when going fro=
m one
> > > > > > disabled state to another. If you don't want to complicate the =
driver
> > > > > > here, maybe point it out in a comment at least?
> > > > >=20
> > > > > Maybe this is my naivity talking, but I'd rather wait. Is there n=
ot the
> > > > > chance that we re-enter pwm_apply() before the update has actuall=
y gone
> > > > > through?
> > > >=20
> > > > My idea was to do something like that:
> > > >=20
> > > > 	int mchp_core_pwm_apply(....)
> > > > 	{
> > > > 		if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
> > > > 			/*
> > > > 			 * We're still waiting for an update, don't
> > > > 			 * interfer until it's completed.
> > > > 			 */
> > > > 			while (readl_relaxed(mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD)=
) {
> > > > 				cpu_relax();
> > > > 				if (waited_unreasonably_long())
> > > > 					return -ETIMEOUT;
> > > > 			}
> > > > 		}
> > > >=20
> > > > 		update_period_and_duty(...);
> > > > 		return 0;
> > > > 	}
> >=20
> > So I was doing some fiddling, and the following works reasonably well:
> > 	if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
> > 		u32 delay =3D MCHPCOREPWM_TIMEOUT_US;
> > 		u32 sync_upd;
> > 		int ret;
> >=20
> > 		writel_relaxed(1u, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
> >=20
> > 		ret =3D read_poll_timeout(readl, sync_upd, !sync_upd, delay/100, dela=
y,
> > 					false, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
> > 		if (ret)
> > 			dev_dbg(mchp_core_pwm->chip.dev,
> > 				"timed out waiting for shadow register sync\n");
> > 	}
> >=20
> > but...
> >=20
> > > > This way you don't have to wait at all if the calls to pwm_apply() =
are
> > > > infrequent. Of course this only works this way, if you can determin=
e if
> > > > there is a pending update.
> > >=20
> > > Ah I think I get what you mean now about waiting for completion &
> > > reading the bit. I don't know off the top of my head if that bit is
> > > readable. Docs say that they're R/W but I don't know if that means th=
at
> > > an AXI read works or if the value is actually readable. I'll try
> > > something like this if I can.
> >=20
> > ...it does not implement what I think you suggested & comes with the
> > drawback of inconsistent behaviour depending on whether the timeout is
> > hit or not.
> >=20
> > Instead, waiting in apply(), as you suggested, & get_state() looks to b=
e the
> > better option, using the same sort of logic as above, say:
> > static int mchp_core_pwm_wait_for_sync_update(struct mchp_core_pwm_chip=
 *mchp_core_pwm,
> > 					      unsigned int channel)
> > {
> > 	int ret;
> >=20
> > 	/*
> > 	 * If a shadow register is used for this PWM channel, and iff there is
> > 	 * a pending update to the waveform, we must wait for it to be applied
> > 	 * before attempting to read its state, as reading the registers yields
> > 	 * the currently implemented settings, the new ones are only readable
> > 	 * once the current period has ended.
> > 	 *
> > 	 * Rather large delays are possible, in the seconds, so to avoid waiti=
ng
> > 	 * around for **too** long - cap the wait at 100 ms.
> > 	 */
> > 	if (mchp_core_pwm->sync_update_mask & (1 << channel)) {
> > 		u32 delay =3D MCHPCOREPWM_TIMEOUT_US;
> > 		u32 sync_upd;
> >=20
> > 		writel_relaxed(1u, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
> >=20
> > 		ret =3D read_poll_timeout(readl, sync_upd, !sync_upd, delay/100, dela=
y,
> > 					false, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
> > 		if (ret)
> > 			return -ETIMEDOUT;
> > 	}
> >=20
> > 	return 0;
> > }
> >=20
> > I think that strikes a good balance? We return quickly & don't blocker
> > the caller, but simultaneously try to prevent them from either trying to
> > apply new settings or get the current settings until the last request
> > has gone though?
> >=20
> > get_state() returns void though, is it valid behaviour to wait for the
> > timeout there?

There was an approach to change that, see
https://lore.kernel.org/linux-pwm/20220916151506.298488-1-u.kleine-koenig@p=
engutronix.de

I need to send a v2.

> > I had a check in the core code and found some places where the call in
> > looks like:
> > 	struct pwm_state s1, s2;=20
> > 	chip->ops->get_state(chip, pwm, &s1);
> > In this case, exiting early would leave us with a completely wrong
> > idead of the state, if it was to time out.
> >=20
> > Either way, it seems like either way we would be misleading the caller
> > of get_state() - perhaps the way around that is to do the wait & then
> > just carry on with get_state()?
> > In that scenario, you'd get the new settings where possible and the old=
 ones
> > otherwise.
> > Returning if the timeout is hit would give you the new settings where p=
ossible
> > & otherwise you'd get whatever was passed to get_state().
> > I'm not really sure which of those two situations would be preferred?

Hmm, .get_state should not return the old state. We really want
=2Eget_state to return an error code. Maybe postpone that question until
we have that?

> Apologies for bumping this, I was wondering if any thoughts on the
> above? I'm not sure which is the lesser evil here (or if I have
> misunderstood something).

That's fine. I'm sorry to be not more responsive. This development cycle
is somehow crazy and there are so many open mails in my inbox ... :-\

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eijrjeuha55mqmvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOHMoAACgkQwfwUeK3K
7Anx8Af8Cs73DQbW+PgcuSL43lYFkch5awN30zQZLmc/yv6s7sENoUBQBhKUtC6M
dQbXyzAlaKsWU33NcetAS9wq/EH71By9Zk5NG2FIJjtrMBqU9TIxKFgeFVOykVnl
UZCzrfvsYkU5hvTr058vWBPDW3nv+zhFlRc90sv973tPhYzgosJ2AXe7G8rifNxy
21aoYGAO6jMDyN8tUEl2C0QewXzGkVHJdxKqIXAkNRyEd4F3a/Z24GFWpmSGJEAx
PgiFF9ZYo7vHevtbBuEi7R3PkzDHhuupZvknJrBxEzxXUBrxQAWUpLMVbEotCySp
UlpNNyjniIrsSnoTkGQ5nGYyovUD4g==
=W9wM
-----END PGP SIGNATURE-----

--eijrjeuha55mqmvj--


--===============0426337128817032766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0426337128817032766==--


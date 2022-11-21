Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA129C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yef2R6aqWTR97Jz1b3Lq0yVLvbhC4bsCKmdEBma+kmY=; b=AoStPz53CFXAZ0
	cMnA0iTZgd538EsUFSjO4b5jCDagajGeWRG9pdfKm1VwIKFFk89WqBm+Z4Ay8b0F6DcMJQsgSUO0G
	wWVRa2EnpzPJi8n74GwtARDxBGOUeF0L8KoB8zesU2YF5B23vj4XWgk2c1B1MFXm7KKwnwRwIJO9R
	FJzI2yXMngHWglrgWKEHMRZp7oV2Vil5K7MbTtPdeO08fejKEMUyurmM9mHSw79y3VtkILwt1NowT
	+SPpbXotT2QecRWTjjONCQS89BPw0Kx5QTLuUSU8PPxTFU1w0zSBMkp/n57AvNyMn2a33i6TWDZlZ
	aaq9rGBUcy7KwmfcEejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8oB-00FFF0-KO; Mon, 21 Nov 2022 15:34:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8kE-00FCPa-0m
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 15:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669044602; x=1700580602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NJfSeDq4t7eXJ+r8Flfm6fvOs6zAa043c4LOLwT19p4=;
  b=zFH6Fn7Ph0Or/Lo/AR4S61X6CXFq2poKOW9CRy+co6ZwLL+kZKLdxBcb
   cGceq5t53v2olaqQ3eL7y5OROlohDQmo9Y1VviSWFnGqzakj/Xg9BGftV
   O3T4pG7ue68qVZBqdd0S6PhneQPsJKWinGY/mme/W5Chfm64WwX8T36A4
   oRvPtSwy71isvWzVXFw0C/F4k4aat5ZfRmFbCcCDOCn6kfCb+Gg8+NXeH
   BeXX5Gp8CQOSwxoPPa5rIg3MGBE2fFtz4Tz47Ff3uFupCcKJ5340D2Xy2
   CCa5TGdlpBREmeDojG03BEGnr13dFUBiZJueN+z+Xwv0X7AXk0RGqyVT1
   w==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="184498651"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 08:30:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 08:29:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 21 Nov 2022 08:29:56 -0700
Date: Mon, 21 Nov 2022 15:29:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v12 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <Y3uZY5mt/ZIWk3sS@wendy>
References: <20221110093512.333881-1-conor.dooley@microchip.com>
 <20221110093512.333881-2-conor.dooley@microchip.com>
 <20221117164950.cssukd63fywzuwua@pengutronix.de>
 <Y3Zxkt3OSPQc46Q2@spud>
 <20221117210433.n5j7upqqksld42mu@pengutronix.de>
 <Y3avobkvYK3ydKTS@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3avobkvYK3ydKTS@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_073002_199607_496D1FC2 
X-CRM114-Status: GOOD (  47.20  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 17, 2022 at 10:03:13PM +0000, Conor Dooley wrote:
> On Thu, Nov 17, 2022 at 10:04:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Nov 17, 2022 at 05:38:26PM +0000, Conor Dooley wrote:
> > > On Thu, Nov 17, 2022 at 05:49:50PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > Hello Conor,
> > > =

> > > Hello Uwe,
> > > =

> > > > On Thu, Nov 10, 2022 at 09:35:12AM +0000, Conor Dooley wrote:
> > > > > [...]
> > > > > +
> > > > > +static void mchp_core_pwm_enable(struct pwm_chip *chip, struct p=
wm_device *pwm,
> > > > > +				 bool enable, u64 period)
> > > > > +{
> > > > > +	struct mchp_core_pwm_chip *mchp_core_pwm =3D to_mchp_core_pwm(c=
hip);
> > > > > +	u8 channel_enable, reg_offset, shift;
> > > > > +
> > > > > +	/*
> > > > > +	 * There are two adjacent 8 bit control regs, the lower reg con=
trols
> > > > > +	 * 0-7 and the upper reg 8-15. Check if the pwm is in the upper=
 reg
> > > > > +	 * and if so, offset by the bus width.
> > > > > +	 */
> > > > > +	reg_offset =3D MCHPCOREPWM_EN(pwm->hwpwm >> 3);
> > > > > +	shift =3D pwm->hwpwm & 7;
> > > > > +
> > > > > +	channel_enable =3D readb_relaxed(mchp_core_pwm->base + reg_offs=
et);
> > > > > +	channel_enable &=3D ~(1 << shift);
> > > > > +	channel_enable |=3D (enable << shift);
> > > > > +
> > > > > +	writel_relaxed(channel_enable, mchp_core_pwm->base + reg_offset=
);
> > > > > +	mchp_core_pwm->channel_enabled &=3D ~BIT(pwm->hwpwm);
> > > > > +	mchp_core_pwm->channel_enabled |=3D enable << pwm->hwpwm;
> > > > > +
> > > > > +	/*
> > > > > +	 * Notify the block to update the waveform from the shadow regi=
sters.
> > > > > +	 * The updated values will not appear on the bus until they hav=
e been
> > > > > +	 * applied to the waveform at the beginning of the next period.=
 We must
> > > > > +	 * write these registers and wait for them to be applied before
> > > > > +	 * considering the channel enabled.
> > > > > +	 * If the delay is under 1 us, sleep for at least 1 us anyway.
> > > > > +	 */
> > > > > +	if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
> > > > > +		u64 delay;
> > > > > +
> > > > > +		delay =3D div_u64(period, 1000u) ? : 1u;
> > > > > +		writel_relaxed(1U, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
> > > > > +		usleep_range(delay, delay * 2);
> > > > > +	}
> > > > =

> > > > In some cases the delay could be prevented. e.g. when going from one
> > > > disabled state to another. If you don't want to complicate the driv=
er
> > > > here, maybe point it out in a comment at least?
> > > =

> > > Maybe this is my naivity talking, but I'd rather wait. Is there not t=
he
> > > chance that we re-enter pwm_apply() before the update has actually go=
ne
> > > through?
> > =

> > My idea was to do something like that:
> > =

> > 	int mchp_core_pwm_apply(....)
> > 	{
> > 		if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
> > 			/*
> > 			 * We're still waiting for an update, don't
> > 			 * interfer until it's completed.
> > 			 */
> > 			while (readl_relaxed(mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD)) {
> > 				cpu_relax();
> > 				if (waited_unreasonably_long())
> > 					return -ETIMEOUT;
> > 			}
> > 		}
> > =

> > 		update_period_and_duty(...);
> > 		return 0;
> > 	}

So I was doing some fiddling, and the following works reasonably well:
	if (mchp_core_pwm->sync_update_mask & (1 << pwm->hwpwm)) {
		u32 delay =3D MCHPCOREPWM_TIMEOUT_US;
		u32 sync_upd;
		int ret;

		writel_relaxed(1u, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);

		ret =3D read_poll_timeout(readl, sync_upd, !sync_upd, delay/100, delay,
					false, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
		if (ret)
			dev_dbg(mchp_core_pwm->chip.dev,
				"timed out waiting for shadow register sync\n");
	}

but...

> > This way you don't have to wait at all if the calls to pwm_apply() are
> > infrequent. Of course this only works this way, if you can determine if
> > there is a pending update.
> =

> Ah I think I get what you mean now about waiting for completion &
> reading the bit. I don't know off the top of my head if that bit is
> readable. Docs say that they're R/W but I don't know if that means that
> an AXI read works or if the value is actually readable. I'll try
> something like this if I can.

...it does not implement what I think you suggested & comes with the
drawback of inconsistent behaviour depending on whether the timeout is
hit or not.

Instead, waiting in apply(), as you suggested, & get_state() looks to be the
better option, using the same sort of logic as above, say:
static int mchp_core_pwm_wait_for_sync_update(struct mchp_core_pwm_chip *mc=
hp_core_pwm,
					      unsigned int channel)
{
	int ret;

	/*
	 * If a shadow register is used for this PWM channel, and iff there is
	 * a pending update to the waveform, we must wait for it to be applied
	 * before attempting to read its state, as reading the registers yields
	 * the currently implemented settings, the new ones are only readable
	 * once the current period has ended.
	 *
	 * Rather large delays are possible, in the seconds, so to avoid waiting
	 * around for **too** long - cap the wait at 100 ms.
	 */
	if (mchp_core_pwm->sync_update_mask & (1 << channel)) {
		u32 delay =3D MCHPCOREPWM_TIMEOUT_US;
		u32 sync_upd;

		writel_relaxed(1u, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);

		ret =3D read_poll_timeout(readl, sync_upd, !sync_upd, delay/100, delay,
					false, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
		if (ret)
			return -ETIMEDOUT;
	}

	return 0;
}

I think that strikes a good balance? We return quickly & don't blocker
the caller, but simultaneously try to prevent them from either trying to
apply new settings or get the current settings until the last request
has gone though?

get_state() returns void though, is it valid behaviour to wait for the
timeout there?
I had a check in the core code and found some places where the call in
looks like:
	struct pwm_state s1, s2; =

	chip->ops->get_state(chip, pwm, &s1);
In this case, exiting early would leave us with a completely wrong
idead of the state, if it was to time out.

Either way, it seems like either way we would be misleading the caller
of get_state() - perhaps the way around that is to do the wait & then
just carry on with get_state()?
In that scenario, you'd get the new settings where possible and the old ones
otherwise.
Returning if the timeout is hit would give you the new settings where possi=
ble
& otherwise you'd get whatever was passed to get_state().
I'm not really sure which of those two situations would be preferred?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

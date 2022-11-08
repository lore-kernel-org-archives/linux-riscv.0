Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE434C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aW5iEUt9Josn/XdAXK6o27dJNAJ+E9FIEHMaB9F/+ek=; b=pFaq49LYI+EQDk
	jEv0LXBGzlUzFKzm19w2ZdNNDP6KFyncK82Ned/WeCL9UZc6Zjno0B+pJa8f1B/p7Sb4+0tEiKPRb
	IbGhrwbMRaFBIobITId0LQB2qmC7VnHyURRXKRE2uXPGfgGOGd5GM+RfoAMKjWOOEbHexT2jxlfT4
	N2/z8KhdxNePsdFoi57hQb+xmr1HMY5KN22oCoflR+rvNoyTrP48KyuQ/OGVYSrd/z5M+xBI6Wb/e
	cEOU4GIvqy+Pm+kswGkaRvpKD+4YzAJn1ql5Fy1Pwo7n9jJPzJsHQI+9XQp2MuoTmtRewmP8GWiI8
	/+9b8ILVkrV7ShdnTM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTOy-007VTw-1X; Tue, 08 Nov 2022 18:32:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTOt-007VRW-Eh
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 18:32:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E199FB81BDE;
	Tue,  8 Nov 2022 18:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF60C433D6;
	Tue,  8 Nov 2022 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667932359;
	bh=icGd5GPv/GdZwBY/786e7bQnWud2lRKv3P3CCjaRWwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/QCsyZVFIsh05wFYGWDM5HvOPRftrE/fzPySxFQ1QLZO5vPvCQzLjemwA6U40rDN
	 6eRue9wigTFnq1mnUKNWvYJbTvuPk5+oxl7fu1l41VXw54zXZ58d/ohmgRHKXllanJ
	 rsHfhvV4RwTTky8/LlBWWA+b0PMg0Mm7Z2JsJTtkq+6WLSSNaYFTbuRM2lndXwwaqk
	 VCZCJ/Bedf3tFCCzc0auvYy3jA7hvxazGUvCG+KnFEECTFdx5GZ6YEKT4OYmeqk+bE
	 2P8ZsA4FJPAsOmqkUFhsx4XuDXmIX+yllRNvCE1ec0m5bEwsatB7mpn8brQXTLgUN2
	 609wVqoWlAMSQ==
Date: Tue, 8 Nov 2022 18:32:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <Y2qgw2wAezkHSgg5@spud>
References: <20221007113512.91501-1-conor.dooley@microchip.com>
 <20221007113512.91501-4-conor.dooley@microchip.com>
 <20221108155041.t4oppot5wy77jzgd@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108155041.t4oppot5wy77jzgd@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_103243_822393_CCF53B94 
X-CRM114-Status: GOOD (  33.03  )
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

On Tue, Nov 08, 2022 at 04:50:41PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,

Hello! Thanks for the review Uwe :)

> On Fri, Oct 07, 2022 at 12:35:12PM +0100, Conor Dooley wrote:

> > +static int mchp_core_pwm_apply_locked(struct pwm_chip *chip, struct pw=
m_device *pwm,
> > +				      const struct pwm_state *state)
> > +{
> > +	struct mchp_core_pwm_chip *mchp_core_pwm =3D to_mchp_core_pwm(chip);
> > +	struct pwm_state current_state =3D pwm->state;
> > +	bool period_locked;
> > +	u64 duty_steps;
> > +	u16 prescale;
> > +	u8 period_steps;
> > +
> > +	if (!state->enabled) {
> > +		mchp_core_pwm_enable(chip, pwm, false, current_state.period);
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * If the only thing that has changed is the duty cycle or the polari=
ty,
> > +	 * we can shortcut the calculations and just compute/apply the new du=
ty
> > +	 * cycle pos & neg edges
> > +	 * As all the channels share the same period, do not allow it to be
> > +	 * changed if any other channels are enabled.
> > +	 * If the period is locked, it may not be possible to use a period
> > +	 * less than that requested. In that case, we just abort.
> > +	 */
> > +	period_locked =3D mchp_core_pwm->channel_enabled & ~(1 << pwm->hwpwm);
> > +
> > +	if (period_locked) {
> > +		u16 hw_prescale;
> > +		u8 hw_period_steps;
> > +
> > +		mchp_core_pwm_calc_period(chip, state, &prescale, &period_steps);
> > +		hw_prescale =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRES=
CALE);
> > +		hw_period_steps =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_=
PERIOD);
> > +
> > +		if ((period_steps + 1) * (prescale + 1) <
> > +		    (hw_period_steps + 1) * (hw_prescale + 1))
> > +			return -EINVAL;
> > +
> > +		/*
> > +		 * It is possible that something could have set the period_steps
> > +		 * register to 0xff, which would prevent us from setting a 100%
> > +		 * or 0% relative duty cycle, as explained above in
> > +		 * mchp_core_pwm_calc_period().
> > +		 * The period is locked and we cannot change this, so we abort.
> > +		 */
> > +		if (hw_period_steps =3D=3D MCHPCOREPWM_PERIOD_STEPS_MAX)
> > +			return -EINVAL;
> > +
> > +		prescale =3D hw_prescale;
> > +		period_steps =3D hw_period_steps;
> > +	} else {
> > +		int ret;
> > +
> > +		ret =3D mchp_core_pwm_calc_period(chip, state, &prescale, &period_st=
eps);
> > +		if (ret)
> > +			return ret;
> > +
> > +		mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
> > +	}
> > +
> > +	duty_steps =3D mchp_core_pwm_calc_duty(chip, pwm, state, prescale, pe=
riod_steps);
> =

> Both mchp_core_pwm_calc_period and mchp_core_pwm_calc_duty call
> clk_get_rate(), I suggest call this only once and pass the rate to these
> two functions.

Sure. I think the signatures of both of those functions could be reduced
in the process which would be nice.

> Both branches of the if above start with calling
> mchp_core_pwm_calc_period, this could be simplified, too.

	ret =3D mchp_core_pwm_calc_period(chip, state, &prescale, &period_steps);
	if (ret)
		return ret;

	period_locked =3D mchp_core_pwm->channel_enabled & ~(1 << pwm->hwpwm);

	if (period_locked) {
		u16 hw_prescale;
		u8 hw_period_steps;

		hw_prescale =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
		hw_period_steps =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PERIO=
D);

		if ((period_steps + 1) * (prescale + 1) <
		    (hw_period_steps + 1) * (hw_prescale + 1))
			return -EINVAL;

		/*
		 * It is possible that something could have set the period_steps
		 * register to 0xff, which would prevent us from setting a 100%
		 * or 0% relative duty cycle, as explained above in
		 * mchp_core_pwm_calc_period().
		 * The period is locked and we cannot change this, so we abort.
		 */
		if (hw_period_steps =3D=3D MCHPCOREPWM_PERIOD_STEPS_MAX)
			return -EINVAL;

		prescale =3D hw_prescale;
		period_steps =3D hw_period_steps;
	} else {
		mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
	}

	duty_steps =3D mchp_core_pwm_calc_duty(chip, pwm, state, prescale, period_=
steps);

I'll aim for something like the (absolutely untested) above then when I
respin.

> (Hmm, in
> exactly one of them you check the return code, wouldn't that be sensible
> for both callers?)

Been messing with rust a bit of late, I love the #[must_use] attribute.
Looks to be an oversight since it's only going to return an error if the
clock rate exceeds what the FPGA is actually capable of.

Thanks again,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

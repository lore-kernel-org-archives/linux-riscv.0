Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF86DC54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6DKUtjJcVmJ0Zlh8LH+ogzPPvp2sp1UKRM6jaHG4Xs=; b=tZxkjZVv2a6D3c
	mre+VRS8lX99C03ZR9P+hVhVzwka2cul1QfKgSieMicWj7gxyst+WCXg0BaHLzXigU7DH/pjtUzyv
	ICfRdCWPsnMGLC0Fn46HbPtg/OXhFl/e2mxZuJtMVP+oFq0yaLy94Rgc3nVuAbbQs4Phz5GZaDt/R
	FK9LxudgJr/AX4bTm10tkx1sATkvzxGy2gYn0WWIjWf1XZVJbaouhMbocm+27xCTBF/VzWkIqT+hr
	l7RWcWpgvpQ/P5wrQSpuMaaYqDrBoi5JPNKgeLoT/6sL0ExyBNMmghUumBXP4XWh0O8FIlUEt8TKs
	Un24PQfpbclZ+gv+I3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGIe-00BlIN-E7; Mon, 19 Sep 2022 12:55:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGIa-00BlFn-DE
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 12:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663592096; x=1695128096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pDHnGJ052zacw3HgtgxHVNxxjkrdU96eZo13SUq3dME=;
  b=1EQAxZ2JvPtjTFDV80fVIEJydmqZOwbpjQW3JRaAvQW8y6I7TaGQM6dD
   k8Y5XVeTOMU449tIm8auLk2cBhZS4GixJOKykEc5nGSQ75qrj4+d2mACR
   8lPlncHQQzIcmuWX1/m+z7qr93DY5Jfc1w6GytiAUFQsiwbaqwFlv1VSk
   GITvNCMyR64mx+w4QRFho0LqhPX//JBH4HOGO7r9YjboOjNTQfBxQjGZL
   2oTF3MKSyeSd3fBLbzwIhpmTRWJj/LRIXlu/664sdQaGGLLjnxlMv7nQc
   /USoXV7ibFM0EPFIwcBHCx+SvQ/7v1g/3yvb/BG/RaIRs0swkTQHMZ5FL
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="114339675"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Sep 2022 05:54:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 19 Sep 2022 05:54:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 19 Sep 2022 05:54:16 -0700
Date: Mon, 19 Sep 2022 13:53:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <YyhmZBmfJvJ9/vBg@wendy>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220915072152.y346csakn7wetpz5@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_055456_607329_ECC0B297 
X-CRM114-Status: GOOD (  57.91  )
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

Hey Uwe,
Thanks (as always). I've switched up my email setup a bit so I hope
that I've not mangled anything here.

On Thu, Sep 15, 2022 at 09:21:52AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Wed, Aug 24, 2022 at 10:12:14AM +0100, Conor Dooley wrote:
> > Add a driver that supports the Microchip FPGA "soft" PWM IP core.
> > =

> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/pwm/Kconfig              |  10 +
> >  drivers/pwm/Makefile             |   1 +
> >  drivers/pwm/pwm-microchip-core.c | 402 +++++++++++++++++++++++++++++++
> >  3 files changed, 413 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-microchip-core.c
> > =


> > +static int mchp_core_pwm_apply(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> > +			       const struct pwm_state *state)
> > +{
> > +	struct mchp_core_pwm_chip *mchp_core_pwm =3D to_mchp_core_pwm(chip);
> > +	struct pwm_state current_state =3D pwm->state;
> > +	bool period_locked;
> > +	u64 duty_steps;
> > +	u16 prescale;
> > +	u8 period_steps;
> > +	int ret;
> > +
> > +	mutex_lock(&mchp_core_pwm->lock);
> > +
> > +	if (!state->enabled) {
> > +		mchp_core_pwm_enable(chip, pwm, false, current_state.period);
> > +		mutex_unlock(&mchp_core_pwm->lock);
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
> > +		mchp_core_pwm_calc_period(chip, state, (u8 *)&prescale, &period_step=
s);
> =

> Huh, if (u8 *)&prescale works depends on endianness.

Big endian? What's that? ;)
I think the cast can just be dropped and the u16 used directly instead.

> =

> > +		hw_prescale =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRES=
CALE);
> > +		hw_period_steps =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_=
PERIOD);
> > +
> > +		if ((period_steps + 1) * (prescale + 1) <
> > +		    (hw_period_steps + 1) * (hw_prescale + 1)) {
> > +			mutex_unlock(&mchp_core_pwm->lock);
> > +			return -EINVAL;
> > +		}
> > +
> > +		/*
> > +		 * It is possible that something could have set the period_steps
> =

> My German feel for the English language says s/could have/has/

What I wrote is _fine_ but the could is redudant given the possible.
I'll change it over.

> > +		 * register to 0xff, which would prevent us from setting a 100%
> =

> For my understanding: It would also prevent a 0% relative duty, right?

Yeah, I guess the comment could reflect that.

> =

> > +		 * duty cycle, as explained in the mchp_core_pwm_calc_period()
> =

> s/duty/relative duty/; s/the //
> =

> > +		 * above.
> > +		 * The period is locked and we cannot change this, so we abort.
> > +		 */
> > +		if (period_steps =3D=3D MCHPCOREPWM_PERIOD_STEPS_MAX) {
> =

> Don't you need to check hw_period_steps =3D=3D MCHPCOREPWM_PERIOD_STEPS_M=
AX
> here?

D'oh.

> =

> > +			mutex_unlock(&mchp_core_pwm->lock);
> > +			return -EINVAL;
> > +		}
> > +
> > +		prescale =3D hw_prescale;
> > +		period_steps =3D hw_period_steps;
> > +	} else if (!current_state.enabled || current_state.period !=3D state-=
>period) {
> > +		ret =3D mchp_core_pwm_calc_period(chip, state, (u8 *)&prescale, &per=
iod_steps);
> =

> ret is only used in this block, so the declaration can go into here,
> too.
> =

> > +		if (ret) {
> > +			mutex_unlock(&mchp_core_pwm->lock);
> > +			return ret;
> > +		}
> > +		mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
> > +	} else {
> > +		prescale =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRESCAL=
E);
> > +		period_steps =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PER=
IOD);
> > +		/*
> > +		 * As above, it is possible that something could have set the
> > +		 * period_steps register to 0xff, which would prevent us from
> > +		 * setting a 100% duty cycle, as explained above.
> > +		 * As the period is not locked, we are free to fix this.
> > +		 */
> =

> Are you sure this is safe? I think it isn't. Consider:
> =

> 	pwm_apply_state(mypwm, { .duty =3D 0, .period =3D A, .enabled =3D true, =
});
> 	pwm_apply_state(mypwm, { .duty =3D 0, .period =3D B, .enabled =3D false,=
 });
> 	pwm_apply_state(mypwm, { .duty =3D 0, .period =3D B, .enabled =3D true, =
});
> =

> Then you have in the third call prescale and period_steps still
> corresponding to A because you didn't update these registers in the 2nd
> call as you exited early.

Riiight. I think I am a little confused here - this comment does not
refer to my comment but rather to the whole logic I have?

As in, what you're concerned about is the early exit if the state is
disabled & that I take the values in the hardware as accurate?

What makes sense to me to do here (assuming I understood correctly)
is to compare state->period against what is in the hardare rather than
against what the pwm core thinks?
Or else I could stop exiting early if the pwm is to be disabled &
instead allow the period and duty to be set so that the state of the
hardware is as close to the pwm core's representation of it as possible.

Keeping the core's interpretation as close to correct as possible seems
like a good idea to me - my only concern is that the apply() will fail.
But if I have read & understand the core code correctly, the core will
not update pwm->state from {.duty =3D 0, .period =3D A, .enabled =3D true}
if callying apply with {.duty =3D 0, .period =3D B, .enabled =3D false}
fails?

> =

> > +		if (period_steps =3D=3D MCHPCOREPWM_PERIOD_STEPS_MAX) {
> > +			period_steps -=3D 1;
> > +			mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps);
> > +		}
> > +	}
> > +
> > +	duty_steps =3D mchp_core_pwm_calc_duty(chip, pwm, state, prescale, pe=
riod_steps);
> > +
> > +	/*
> > +	 * Because the period is per channel, it is possible that the request=
ed
> > +	 * duty cycle is longer than the period, in which case cap it to the
> > +	 * period, IOW a 100% duty cycle.
> > +	 */
> > +	if (duty_steps > period_steps)
> > +		duty_steps =3D period_steps + 1;
> > +
> > +	mchp_core_pwm_apply_duty(chip, pwm, state, duty_steps, period_steps);
> > +
> > +	mchp_core_pwm_enable(chip, pwm, true, state->period);
> > +
> > +	mutex_unlock(&mchp_core_pwm->lock);
> > +
> > +	return 0;
 =

> Locking could be a bit simplified by doing:
 =

> The diffstat is negative, so maybe that's subjective.

Much simplier at the cost of 4 lines sounds objective to me!
 =

> > +}
> > +
> > +static void mchp_core_pwm_get_state(struct pwm_chip *chip, struct pwm_=
device *pwm,
> > +				    struct pwm_state *state)
> > +{
> > +	struct mchp_core_pwm_chip *mchp_core_pwm =3D to_mchp_core_pwm(chip);
> > +	u16 prescale;
> > +	u8 period_steps, duty_steps, posedge, negedge;
> > +
> > +	mutex_lock(&mchp_core_pwm->lock);
> > +
> > +	if (mchp_core_pwm->channel_enabled & (1 << pwm->hwpwm))
> > +		state->enabled =3D true;
> > +	else
> > +		state->enabled =3D false;
> > +
> > +	prescale =3D PREG_TO_VAL(readb_relaxed(mchp_core_pwm->base + MCHPCORE=
PWM_PRESCALE));
> > +
> > +	period_steps =3D PREG_TO_VAL(readb_relaxed(mchp_core_pwm->base + MCHP=
COREPWM_PERIOD));
> > +	state->period =3D period_steps * prescale * NSEC_PER_SEC;
> =

> This is broken on 32 bit archs (here: arm):
> =

> $ cat test.c
> #include <inttypes.h>
> #include <stdio.h>
> #include <stdlib.h>
> =

> int main(int argc, char *argv[])
> {
> 	uint8_t period_steps =3D atoi(argv[1]);
> 	uint16_t prescale =3D atoi(argv[2]);
> 	uint64_t period;
> =

> 	period =3D period_steps * prescale * 1000000000L;
> =

> 	printf("period_steps =3D %" PRIu8 "\n", period_steps);
> 	printf("prescale =3D %" PRIu16 "\n", prescale);
> 	printf("period =3D %" PRIu64 "\n", period);
> =

> 	return 0;
> }
> =

> $ make test
> cc     test.c   -o test
> =

> $ ./test 255 65535
> period_steps =3D 255
> prescale =3D 65535
> period =3D 18446744073018591744
> =

> The problem is that the result of 16711425 * 1000000000L isn't affected
> by the type of period and so it's promoted to L which isn't big enough
> to hold 16711425000000000 where longs are only 32 bit wide.

I don't think this is ever going to be hit in the wild, since prescale
comes from the hardware where it is limited to 255 - but preventing the
issue seems trivially done by splitting the multiplication so no reason
not to. Thanks for providing the test program btw :)

> =

> > +	state->period =3D DIV64_U64_ROUND_UP(state->period, clk_get_rate(mchp=
_core_pwm->clk));
> > +
> > +	posedge =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_POSEDGE(p=
wm->hwpwm));
> > +	negedge =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_NEGEDGE(p=
wm->hwpwm));
> > +
> > +	if ((negedge =3D=3D posedge) && state->enabled) {
> =

> Why do you need that state->enabled?

Because I was running into conflicts between the reporting here and some
of the checks that I have added to prevent the PWM being put into an
invalid state. On boot both negedge and posedge will be zero & this was
preventing me from setting the period at all.

> =

> > +		state->duty_cycle =3D state->period;
> > +		state->period *=3D 2;
> > +	} else {
> > +		duty_steps =3D abs((s16)posedge - (s16)negedge);
> > +		state->duty_cycle =3D duty_steps * prescale * NSEC_PER_SEC;
> > +		state->duty_cycle =3D DIV64_U64_ROUND_UP(state->duty_cycle,
> > +						       clk_get_rate(mchp_core_pwm->clk));
> =

> Micro optimisation: Call clk_get_rate() only once.
> =

> > +	}
> > +
> > +	state->polarity =3D negedge < posedge ? PWM_POLARITY_INVERSED : PWM_P=
OLARITY_NORMAL;
> > +
> > +	mutex_unlock(&mchp_core_pwm->lock);
> =

> You could release the lock a bit earlier.
> =


Sure, I'll move it after the last register access.

Thanks,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

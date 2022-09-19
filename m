Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F53DECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg2iW6AbV5L/o9OeDx4gnemO1CBY2p/+aa8Wihg50as=; b=tZfdMbLQUho+5A
	SqqSk0ir8FmXN8elECjW0RFThWr7//TBDOpe+I7ztQ6RjIv+WvKW2tnUEtzAfEBwtIpD7LDb1ZIJz
	2FuwnYn6xgU+n9jB/rH8ofNLE1AdRHG6+YjWhl8BKYsppkj67G3pVEyXJw9hhSDlInPvcLGDawwEA
	vmiPCRiGh29M1wXiC7YSh7ybbrLJuMsK0PqTB80n3IShy5xe+ahJ4lQBekCJ+7NRQ5P6XbgJFSnMb
	q6KpZxCKpenv6itJooZutTJbNGVnsLKa26r0X0QmemwodU8v0o4hHpyj001+YvlaDdgTkcPbd6Fod
	r6IJ6mzYPfZHhfwLx0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHmP-00C60S-9f; Mon, 19 Sep 2022 14:29:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHmL-00C5x7-8S
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 14:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663597785; x=1695133785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IsiSELyQZHXzhmHlKNVp/4AhfXD4NvYslEVAsWis7tk=;
  b=ACShBjZZHRA3eAevE29L8YoS+CRD02+Kjr3PzI+LJBO4tvkvpYPLEwx3
   CzQjZ/ZH2/qzK0B8yl+XBjup0Rxyrq7GvEx5X305vGBJEsgi/iPh2FMUA
   yKT/dKAOiGy1hVNqni0PWqjTy10fYEajRknT/Tx55byhqgX9vfhn2EdBc
   5iWQpPbJx7DegDgUFzFWOo+hAp4LBhTlhU93b6fRiwXioHdzXhNuNlKMB
   LdW2ZUU3JysKArKR5WsEkvtqOzFH92id9eEowsrMGmmimtwwIpoTaED24
   h9bNznWFFshxySD9IfjpuEyF19rj7lmawV7zODTPwFHG4ShJJBEvN/92d
   A==;
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="181099035"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Sep 2022 07:29:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 19 Sep 2022 07:29:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 19 Sep 2022 07:29:39 -0700
Date: Mon, 19 Sep 2022 15:29:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Thierry Reding <thierry.reding@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <Yyh8v+MtHuc0LLf0@wendy>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
 <YyhmZBmfJvJ9/vBg@wendy>
 <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_072945_379710_4F63CA5A 
X-CRM114-Status: GOOD (  68.82  )
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

On Mon, Sep 19, 2022 at 03:50:08PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Sep 19, 2022 at 01:53:56PM +0100, Conor Dooley wrote:
> > Hey Uwe,
> > Thanks (as always). I've switched up my email setup a bit so I hope
> > that I've not mangled anything here.
> > =

> > On Thu, Sep 15, 2022 at 09:21:52AM +0200, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > > =

> > > On Wed, Aug 24, 2022 at 10:12:14AM +0100, Conor Dooley wrote:
> > > > Add a driver that supports the Microchip FPGA "soft" PWM IP core.
> > > > =

> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  drivers/pwm/Kconfig              |  10 +
> > > >  drivers/pwm/Makefile             |   1 +
> > > >  drivers/pwm/pwm-microchip-core.c | 402 +++++++++++++++++++++++++++=
++++
> > > >  3 files changed, 413 insertions(+)
> > > >  create mode 100644 drivers/pwm/pwm-microchip-core.c
> > > > =

> > =

> > > > +static int mchp_core_pwm_apply(struct pwm_chip *chip, struct pwm_d=
evice *pwm,
> > > > +			       const struct pwm_state *state)
> > > > +{
> > > > +	struct mchp_core_pwm_chip *mchp_core_pwm =3D to_mchp_core_pwm(chi=
p);
> > > > +	struct pwm_state current_state =3D pwm->state;
> > > > +	bool period_locked;
> > > > +	u64 duty_steps;
> > > > +	u16 prescale;
> > > > +	u8 period_steps;
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&mchp_core_pwm->lock);
> > > > +
> > > > +	if (!state->enabled) {
> > > > +		mchp_core_pwm_enable(chip, pwm, false, current_state.period);
> > > > +		mutex_unlock(&mchp_core_pwm->lock);
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * If the only thing that has changed is the duty cycle or the po=
larity,
> > > > +	 * we can shortcut the calculations and just compute/apply the ne=
w duty
> > > > +	 * cycle pos & neg edges
> > > > +	 * As all the channels share the same period, do not allow it to =
be
> > > > +	 * changed if any other channels are enabled.
> > > > +	 * If the period is locked, it may not be possible to use a period
> > > > +	 * less than that requested. In that case, we just abort.
> > > > +	 */
> > > > +	period_locked =3D mchp_core_pwm->channel_enabled & ~(1 << pwm->hw=
pwm);
> > > > +
> > > > +	if (period_locked) {
> > > > +		u16 hw_prescale;
> > > > +		u8 hw_period_steps;
> > > > +
> > > > +		mchp_core_pwm_calc_period(chip, state, (u8 *)&prescale, &period_=
steps);
> > > =

> > > Huh, if (u8 *)&prescale works depends on endianness.
> > =

> > Big endian? What's that? ;)
> > I think the cast can just be dropped and the u16 used directly instead.
> > =

> > > =

> > > > +		hw_prescale =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_=
PRESCALE);
> > > > +		hw_period_steps =3D readb_relaxed(mchp_core_pwm->base + MCHPCORE=
PWM_PERIOD);
> > > > +
> > > > +		if ((period_steps + 1) * (prescale + 1) <
> > > > +		    (hw_period_steps + 1) * (hw_prescale + 1)) {
> > > > +			mutex_unlock(&mchp_core_pwm->lock);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		/*
> > > > +		 * It is possible that something could have set the period_steps
> > > =

> > > My German feel for the English language says s/could have/has/
> > =

> > What I wrote is _fine_ but the could is redudant given the possible.
> > I'll change it over.
> > =

> > > > +		 * register to 0xff, which would prevent us from setting a 100%
> > > =

> > > For my understanding: It would also prevent a 0% relative duty, right?
> > =

> > Yeah, I guess the comment could reflect that.
> > =

> > > =

> > > > +		 * duty cycle, as explained in the mchp_core_pwm_calc_period()
> > > =

> > > s/duty/relative duty/; s/the //
> > > =

> > > > +		 * above.
> > > > +		 * The period is locked and we cannot change this, so we abort.
> > > > +		 */
> > > > +		if (period_steps =3D=3D MCHPCOREPWM_PERIOD_STEPS_MAX) {
> > > =

> > > Don't you need to check hw_period_steps =3D=3D MCHPCOREPWM_PERIOD_STE=
PS_MAX
> > > here?
> > =

> > D'oh.
> > =

> > > =

> > > > +			mutex_unlock(&mchp_core_pwm->lock);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		prescale =3D hw_prescale;
> > > > +		period_steps =3D hw_period_steps;
> > > > +	} else if (!current_state.enabled || current_state.period !=3D st=
ate->period) {
> > > > +		ret =3D mchp_core_pwm_calc_period(chip, state, (u8 *)&prescale, =
&period_steps);
> > > =

> > > ret is only used in this block, so the declaration can go into here,
> > > too.
> > > =

> > > > +		if (ret) {
> > > > +			mutex_unlock(&mchp_core_pwm->lock);
> > > > +			return ret;
> > > > +		}
> > > > +		mchp_core_pwm_apply_period(mchp_core_pwm, prescale, period_steps=
);
> > > > +	} else {
> > > > +		prescale =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_PRE=
SCALE);
> > > > +		period_steps =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM=
_PERIOD);
> > > > +		/*
> > > > +		 * As above, it is possible that something could have set the
> > > > +		 * period_steps register to 0xff, which would prevent us from
> > > > +		 * setting a 100% duty cycle, as explained above.
> > > > +		 * As the period is not locked, we are free to fix this.
> > > > +		 */
> > > =

> > > Are you sure this is safe? I think it isn't. Consider:
> > > =

> > > 	pwm_apply_state(mypwm, { .duty =3D 0, .period =3D A, .enabled =3D tr=
ue, });
> > > 	pwm_apply_state(mypwm, { .duty =3D 0, .period =3D B, .enabled =3D fa=
lse, });
> > > 	pwm_apply_state(mypwm, { .duty =3D 0, .period =3D B, .enabled =3D tr=
ue, });
> > > =

> > > Then you have in the third call prescale and period_steps still
> > > corresponding to A because you didn't update these registers in the 2=
nd
> > > call as you exited early.
> > =

> > Riiight. I think I am a little confused here - this comment does not
> > refer to my comment but rather to the whole logic I have?
> > =

> > As in, what you're concerned about is the early exit if the state is
> > disabled & that I take the values in the hardware as accurate?
> =

> No, the thing I'm concerned about is assuming MCHPCOREPWM_PRESCALE and
> MCHPCOREPWM_PERIOD correspond to state->period. So I'd drop the last
> block use the 2nd last instead without further condition.

So, if the period isn't locked always re-configure it. Makes life easier
for me.

> =

> > What makes sense to me to do here (assuming I understood correctly)
> > is to compare state->period against what is in the hardare rather than
> > against what the pwm core thinks?
> > Or else I could stop exiting early if the pwm is to be disabled &
> > instead allow the period and duty to be set so that the state of the
> > hardware is as close to the pwm core's representation of it as possible.
> =

> exiting early is fine.
>  =

> > > > [...]
> > > > +	period_steps =3D PREG_TO_VAL(readb_relaxed(mchp_core_pwm->base + =
MCHPCOREPWM_PERIOD));
> > > > +	state->period =3D period_steps * prescale * NSEC_PER_SEC;
> > > =

> > > This is broken on 32 bit archs (here: arm):
> > > =

> > > $ cat test.c
> > > #include <inttypes.h>
> > > #include <stdio.h>
> > > #include <stdlib.h>
> > > =

> > > int main(int argc, char *argv[])
> > > {
> > > 	uint8_t period_steps =3D atoi(argv[1]);
> > > 	uint16_t prescale =3D atoi(argv[2]);
> > > 	uint64_t period;
> > > =

> > > 	period =3D period_steps * prescale * 1000000000L;
> > > =

> > > 	printf("period_steps =3D %" PRIu8 "\n", period_steps);
> > > 	printf("prescale =3D %" PRIu16 "\n", prescale);
> > > 	printf("period =3D %" PRIu64 "\n", period);
> > > =

> > > 	return 0;
> > > }
> > > =

> > > $ make test
> > > cc     test.c   -o test
> > > =

> > > $ ./test 255 65535
> > > period_steps =3D 255
> > > prescale =3D 65535
> > > period =3D 18446744073018591744
> > > =

> > > The problem is that the result of 16711425 * 1000000000L isn't affect=
ed
> > > by the type of period and so it's promoted to L which isn't big enough
> > > to hold 16711425000000000 where longs are only 32 bit wide.
> > =

> > I don't think this is ever going to be hit in the wild, since prescale
> > comes from the hardware where it is limited to 255 - but preventing the
> > issue seems trivially done by splitting the multiplication so no reason
> > not to. Thanks for providing the test program btw :)
> =

> Even 255 * 255 * 1000000000 overflows. With a maintainer's hat on, it is
> very valuable to prevent such issues because your driver might be used
> as a template for the next driver.
> =

> > > > +	state->period =3D DIV64_U64_ROUND_UP(state->period, clk_get_rate(=
mchp_core_pwm->clk));
> > > > +
> > > > +	posedge =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_POSED=
GE(pwm->hwpwm));
> > > > +	negedge =3D readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_NEGED=
GE(pwm->hwpwm));
> > > > +
> > > > +	if ((negedge =3D=3D posedge) && state->enabled) {
> > > =

> > > Why do you need that state->enabled?
> > =

> > Because I was running into conflicts between the reporting here and some
> > of the checks that I have added to prevent the PWM being put into an
> > invalid state. On boot both negedge and posedge will be zero & this was
> > preventing me from setting the period at all.
> =

> I don't understood that.

On startup, (negedge =3D=3D posedge) is true as both are zero, but the reset
values for prescale and period are actually 0x8. If on reset I try to
set a small period, say "echo 1000 > period" apply() returns -EINVAL
because of a check in the pwm core in pwm_apply_state() as I am
attempting to set the period to lower than the out-of-reset duty cycle.

I considered zeroing the registers, but if something below Linux had
been using the PWM I felt that may not be the right thing to do. Can I
continue to check for the enablement here or would you rather I did
something different?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

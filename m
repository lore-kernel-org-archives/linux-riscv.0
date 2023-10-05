Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C2E7C4F4
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S+Th9fzONnAC6EhZTvwiGoGDNZS3uI0O7LDrWNhIDM=; b=IwKi2ZkrJW0Gzw
	6Uj42b0GYzCdCS+x1fID9kH5LR7rJ2h/Zq6WPLZYn95jDG4eXjp9BW2UGiy6I8vYlm+cjLK7i7cAg
	IZR2FPnW3TI0ybzmg7ftANi8QhEipKABjW6wCtLY2Dpws/MjCotezMk0qOLrp8MgG0KG7vQKphM44
	8w1Xm7Mby87l9mpuG9z2FIgblJsvGGNl0HQBPLq3pdNkeBBWvb2m2bFcx4y6dpwnL7gGXzzkrZ8Rd
	8k4Ml9KyTttOB2dVZ7LJn17CRa6BaMgGy01BoADuzjofJS8DDwGfITlsqBuyglvS9A9JHlsmeRRFb
	eXwqorHDDV4Zg0UPvJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJkr-001gFf-0G;
	Thu, 05 Oct 2023 08:30:45 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJkm-001gE6-2I;
	Thu, 05 Oct 2023 08:30:42 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id EFC201007F6; Thu,  5 Oct 2023 09:30:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1696494632; bh=yTqM0lOviMpVtY3gEC2fnjg+lpnZmaa/xqOOO1oFjzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hM4/6PU/BVCUmsjcFfLAZHOdsLJZBPi+IERfvAziz3nfnEK4C7KS4IvaOhQF74oUa
	 pm/jySTmFQfMxdTKCSDifYiz+6AUgqHrAipeZA/gPtdfM+zALHVTx2Zc3etj0F8Uvj
	 Z+6+P3UfUXB4S+dg6826xd+d4QJrSOPKQf4pOCA+1cpbIPfgjobt3K8v8W29gu2XFf
	 EozsFhCZzdMkmYxxlZzWuHs3+awRG8hRctGYRXzu5lggSBZ9V8y5NfKjZIp5utFREo
	 m8TSihVOCaoYFaigu8xqW/v53d8h8T2slqaY2mkHTgDaQkYnFk+bb6M8VNQI8mAzW8
	 t0IV4IH911NYA==
Date: Thu, 5 Oct 2023 09:30:32 +0100
From: Sean Young <sean@mess.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pwm@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic
 context
Message-ID: <ZR50KCVNzhlLooLW@gofer.mess.org>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_013040_893328_268F84E4 
X-CRM114-Status: GOOD (  26.61  )
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

Hello Uwe,

On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=F6nig wrote:
> On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index dc66e3405bf5..d9679ae5b2be 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const s=
truct pwm_state *state)
> >  	 * is a bad idea. So make it explicit that calling this function might
> >  	 * sleep.
> >  	 */
> > -	might_sleep();
> > +	might_sleep_if(pwm_can_sleep(pwm));
> >  =

> >  	if (!pwm || !state || !state->period ||
> >  	    state->duty_cycle > state->period)
> =

> I'd like to have a mechanism to catch drivers that missed to set
> .can_sleep. The best idea I currently have for that is to disable
> preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
> .apply() is running.

If we have pwm_apply_state_atomic(), then CONFIG_DEBUG_ATOMIC_SLEEP will
catch them, but only in that code path of course.

How about using non_block_start() and non_block_end() if can_sleep is
not set?

> > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > index b7c6045c5d08..b8b9392844e9 100644
> > --- a/drivers/pwm/pwm-fsl-ftm.c
> > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *pd=
ev)
> >  =

> >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> >  	fpc->chip.dev =3D &pdev->dev;
> > +	fpc->chip.can_sleep =3D true;
> =

> As .apply() being callable in non-sleepable context only depends on
> .apply() I think a better place for this property is in struct pwm_ops.

That makes sense.

> Also I wonder if the distinction between atomic and sleeping
> pwm_state_apply() should be more explicit. For GPIOs you have a sleeping
> variant gpiod_set_value_cansleep() that allows to immediately determine
> the intended context in the caller. This would allow that programming
> a PWM stays a preemption point (if possible/desired) even if the
> underlying hardware/driver is atomic. To not have to touch all consumer
> drivers, maybe the pair for pwm should better be
> =

> 	pwm_apply_state()
> 	pwm_apply_state_atomic()

Do we need pwm_config_atomic(), pwm_enable_atomic(), and pwm_disable_atomic=
()
too? These are just convenience functions, so we can probably do without th=
em.

> instead of a "cansleep" suffix for the sleeping variant? Or maybe it's
> better to accept touching all consumer drivers to get semantics similar
> to gpio? I couldn't decide quickly what I really like better here, so
> that's your chance to comment and influence the outcome :-)

If you expect to have more parameters for pwm_apply_state() then a flags
argument makes sense.

TBH I like the pwm_apply_state_atomic() option.


Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

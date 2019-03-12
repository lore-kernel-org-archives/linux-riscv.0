Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA69C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 07:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AA12147C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 07:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XiSJfIq7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AA12147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pb/vGGI7Sh2p4fRJ+ITCm+rG+8mZZ6/eHoSNVlYkNq0=; b=XiSJfIq7UByTbd
	c+G+jC7dKNUhkRUugbFthwNS2APmkmEY9/LQ48mDqLijll0OE/nM1Mi8Qn+vtOCidbfLvW7+TF7fR
	wmb4YNEClwpbTfmoxbvFXiZ4iaF7Gp4Uv7iiOAzkKtANHshL+PNPHiLrWGsEqE43eo0Yvr4WeIHh6
	v/WRKm3K6hJbTogoj9/QA65h+Y6of6qQqzLCagXpqRRSbm43Y2OJXPjRjvsEkAXgzBQTIqdDBN/Ml
	xDrFKJtZKJlOgn/Zi8MuCiE1fwwOwFg/MEYluWmdxrscZRMiM/72KIZeBjtM17ThLJJkM+vsWL8iJ
	b6mmEyl0alLWlX42CdtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3bp0-0002wq-GY; Tue, 12 Mar 2019 07:27:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3box-0002wO-Vl
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 07:27:33 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3bov-0007H9-W7; Tue, 12 Mar 2019 08:27:29 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3bou-0003XE-Qq; Tue, 12 Mar 2019 08:27:28 +0100
Date: Tue, 12 Mar 2019 08:27:28 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190312072728.dy26cg4cateumuug@pengutronix.de>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
 <20190207101657.rfzcq6xdv6ocvubg@pengutronix.de>
 <20190213123703.GE647@ulmo>
 <20190214155903.7h3b7v3nbhj57uy2@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190214155903.7h3b7v3nbhj57uy2@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_002732_340244_EB1BD8A7 
X-CRM114-Status: GOOD (  19.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Thu, Feb 14, 2019 at 04:59:03PM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Feb 13, 2019 at 01:37:03PM +0100, Thierry Reding wrote:
> > On Thu, Feb 07, 2019 at 11:16:57AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
> > [...]
> > > > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> > [...]
> > > > +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> > > > +
> > > > +	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 + dev->hwpwm * SIZE_P=
WMCMP);
> > > > +
> > > > +	val &=3D ~(1 << PWM_SIFIVE_PWMCFG_DEGLITCH);
> > > > +	writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> > > > +
> > > > +	pwm_sifive_get_state(chip, dev, state);
> > > =

> > > Thierry: This changes the pwm_state. Is this how this should be done?
> > =

> > Yes, I think that's fine. The PWM state should always reflect the
> > current hardware state. If the configuration that we program does not
> > reflect the state that was requested, that should be reflected in the
> > PWM state.
> =

> I'm not sure you blessed what is really done here. If I do:
> =

> 	state.duty_cycle =3D state.period;
> 	pwm_apply_state(pwm, &state);
> =

> the call in question doesn't only result in pwm->state.duty_cycle <
> pwm->state.period, but it also corrects my local state variable (i.e. I
> have state.duty_cycle < state.period afterwards).
> =

> Is this what you thought to be fine?

I thought a bit about this and I'm convinced that updating struct
pwm_device::state is/might be fine, but changing the caller's struct pwm_st=
ate
that was passed to pwm_apply_state is not.

Consider a consumer who does:

	#define PERIOD 5000000
	#define DUTY_LITTLE 10
	...
	struct pwm_state state =3D {
		.period =3D PERIOD,
		.duty_cycle =3D DUTY_LITTLE,
		.polarity =3D PWM_POLARITY_NORMAL,
		.enabled =3D true,
	};

	pwm_apply_state(mypwm, &state);
	...
	state.duty_cycle =3D PERIOD / 2;
	pwm_apply_state(mypwm, &state);

I think the second request should have state.period =3D 5000000 and not
some other value (that might only have chosen by the respective driver
because the first duty cycle was so short).

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

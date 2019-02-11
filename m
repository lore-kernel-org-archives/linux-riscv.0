Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC32CC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 12:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9937220818
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 12:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLh32YUp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9937220818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXwa1TuN4WjedfR3syXW+UH0EBdBou4yXY1MGNhShyA=; b=WLh32YUp30JVSZ
	rO2lkquFQNoXtZPzzxQrHdL4wSPFpZ5gfdLvDeCh6DF1LErGMUUdopqFZti+wEec/zOTOmOs4mP5F
	WoFTk6NL40AZ+7nPzV6P1A7eYAOpHZY1UzwHCbwdz9otbIiHYQ4/CyNi6meIuogDksD943JNGxRri
	YMH3BTiEVxr0kP+RetNz52/7ff5CiCewz/fOB0VRhbeYsBNTkUu8b9qnrYUYwL2HZFF2cKITSqarX
	8NS8M5oBpWbHzOHcBmf1C40oaJ7leCs4LnksOfBHREb5GJuI66NUU23kF76ynT3SPlZ2rO2oRYlaZ
	vDA9XqlAukKSWsjdfjVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtAmd-0006lz-8a; Mon, 11 Feb 2019 12:33:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtAij-0002Aw-77
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 12:30:42 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gtAih-0008Se-My; Mon, 11 Feb 2019 13:29:55 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gtAig-0003K3-Py; Mon, 11 Feb 2019 13:29:54 +0100
Date: Mon, 11 Feb 2019 13:29:54 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v5 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190211122954.33thpip3yhtdw5x6@pengutronix.de>
References: <1548762199-7065-1-git-send-email-yash.shah@sifive.com>
 <1548762199-7065-3-git-send-email-yash.shah@sifive.com>
 <20190207101657.rfzcq6xdv6ocvubg@pengutronix.de>
 <CAJ2_jOGYkwb2QSUH1UU_QoGXE5LFoR0XGJmuYfNtYcZXHXyfaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2_jOGYkwb2QSUH1UU_QoGXE5LFoR0XGJmuYfNtYcZXHXyfaA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_042958_184517_2657E2F0 
X-CRM114-Status: GOOD (  24.79  )
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
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Mon, Feb 11, 2019 at 04:56:27PM +0530, Yash Shah wrote:
> On Thu, Feb 7, 2019 at 3:47 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Tue, Jan 29, 2019 at 05:13:19PM +0530, Yash Shah wrote:
> > > +struct pwm_sifive_ddata {
> > > +     struct pwm_chip chip;
> > > +     struct notifier_block notifier;
> > > +     struct clk *clk;
> > > +     void __iomem *regs;
> > > +     unsigned int approx_period;
> > > +     unsigned int real_period;
> > > +};
> > > +
> > > +static inline struct pwm_sifive_ddata *to_pwm_sifive_chip(struct pwm=
_chip *c)
> >
> > even though this is inlined I would like this to have use the
> > pwm_sifive_ prefix, too.
> =

> Not sure what exactly you want me to do here.

I want this function to be named something like pwm_sifive_chip_to_ddata.
This way it has the common prefix (and is less confusing because
to..chip suggests that is converts something to a chip, but the outcome
is ...ddata).
 =

> > In a previous review round I had doubts about the calculation of frac
> > and I think they were addressed wrongly.
> > Looking at the figure at the start of chapter 14.9 in the reference
> > manual: They use (different than the driver here) pwmcmp0=3D6 and
> > pwmzerocmp=3D1. Then a period is 7 clock cycles long and pwmcmpX must b=
e 7
> > (for X > 0) to yield a 100% signal. So pwmcmpX must be greater than or
> > equal to the period (in clock cycles).
> >
> > Here we're using pwmzerocmp=3D0, still the constraint
> >
> >         pwmcmpX >=3D period
> >
> > must be true for a 100% cycle. (Right?) With pwmzerocmp=3D0 the period =
is
> > 0x10000 clock cycles, so pwmcmpX must be >=3D 0x10000 to yield a 100%
> > signal. As this is not possible (pwmcmpX is a 16 bit value that can only
> > hold up to 0xffff) the output cannot yield 100%.
> >
> > So I think the most correct implementation here is:
> >
> >         frac =3D (duty_cycle * (1 << PWM_SIFIVE_CMPWIDTH) + (1 << PWM_S=
IFIVE_CMPWIDTH) / 2) / period;
> >         /* Sorry, we cannot do 100% :-( */
> >         frac =3D min(frac, (1 << PWM_SIFIVE_CMPWIDTH) - 1);
> >
> =

> I will once again go through the specs, if it seems correct I will
> implement the above.

I would just test this at runtime. Configure for 100% and check the wave
form if it is constant.

> > > +static int pwm_sifive_probe(struct platform_device *pdev)
> > > +{
> > > [...]
> > > +     /* Watch for changes to underlying clock frequency */
> > > +     pwm->notifier.notifier_call =3D pwm_sifive_clock_notifier;
> > > +     ret =3D clk_notifier_register(pwm->clk, &pwm->notifier);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to register clock notifier: %d\n",=
 ret);
> > > +             goto disable_clk;
> > > +     }
> >
> > Would it make sense to only enable the clock when the pwm is enabled?
> > (If yes, how does the output behave if the clock is disabled while the
> > hardware is enabled? I assume the output just freezes at the state where
> > it happens to be?)
> =

> Yes. Not sure about the behaviour of hardware when the clock is disabled.
> The behaviour should be like you said. If there is no strong reason
> then we can keep it as it is right now
> or else if you want I can make the necessary change.

I would prefer to only have the clock enabled when it is actually used.
Note the common pitfall that you cannot disable the clk immediately
after configureing the duty cycle to 100% or 0% though because you must
only stop the clock when the newly configured parameters are active.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

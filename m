Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E587C3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqFMcuHIQfh2Xgc8ygUk2+JzPdMkFJXAGzd6gFPZe/k=; b=kdxFusS/nAp4Ll
	W8Xt/G8YL7xF05OaTpn0AjYt3+ETI8+JPvHeX+CHoEXKfytUXaIqu0H3jE7xMlVRY67pvsH/tRi9j
	Z0Ey8zlXZudZeOw6vqSJcgnxKeyWjYiGzqeWa5E0IEhNgeR59pWfdKhPx8dW0UU8XMoS9gIIVPQ2N
	+XvfZpx3kMy3sWb6gH4GSxFk2KunJ5C/ehwBjIw39KlHu1PCF5ubC0LMWQKTcGfd6D7jrrJo61uDr
	l3lwNOZH1F95xjZNjBgk+GtpBVDbJMw7gWjxXAK1l0nt3elwFhRquZNzPSaGq0pY0Eg/EpUwXZx3B
	oDWFgkGNe3rLhzSP8xAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJo-0000000HJic-3Ynh;
	Mon, 07 Apr 2025 10:03:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJm-0000000HJgO-1Wbl
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:03 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73972a54919so3632610b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744020181; x=1744624981; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RACmTc9Rgs7JJUW7G658o4PTbUfl18GoBK9O7BQsyEY=;
        b=TKeielzKeNvXJnjjXWt3GsrvJdTtNxqG6HpsTSi5hQHszsXDh5xqyy2SQw90GHPTix
         JW0+tAhTNxElJNKdj4daJD4Pn40/pZG9Wr2Ei8mGslnuaUBYC7R5MZcT+U6OqdC1Uio7
         j3mzWEgTBno5mQmusAfp37WPMhRydEp35IyyG86zrCfCw9imiDaXIhdaqeNEAdKsXTQE
         ocjEXYUSTtC6syhP6zZqWUZUo1Y4wTjZTI2SSiY6ZB6GrVqGNfvXngz+Pb62DuJscQF4
         w98wZPxIlDKIs+Tt+F5HrGaSRETfUwinZNTpkRzVM7KXAfggS3mYjZ/yeFoYZ0lLt2eN
         c0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020181; x=1744624981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RACmTc9Rgs7JJUW7G658o4PTbUfl18GoBK9O7BQsyEY=;
        b=aOSzNRVDHrmUkd5Lsccv5IbBdV4mXQRsOa1yI3kS4+4r5pb9UzQrLA3QMWkCqKhbtb
         1TIDz9KFaaV482Xr3VR0JmViR7AI47J2PLsDKGPdXc7N4e1mq0pr19gpuLaSHUYAYOLa
         y18oZlvZilHrFgpliCVX63TIEdMvB31unikoSthAPx7jk4dWW94OXnll58WLS2RZD1tW
         0LCrlBsKSPRmoiMAE4nsFyN14K/MuTzoWwCprUvJk3P7IY8KATMBBCERVcRNDjgnrFMa
         DcX6m9PX/54jb+IJZmmcvTMGwiOtkJnGJBmlyPRQ1xCG0MKf8lfRx3w0lgN6vDqemCN2
         A8Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUxQOZM1zE17gN9jV6/vDaPAfvzVkaK2DUBeNuXNqMOTakMmYQ9huHb+H+DmL9Dlc9sEUvvcSGPc2Zg+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmlskiYvP8dlE31d26fPKZnWbUV3m0mXhu3p8RjW/1mOx2gLE/
	5yp9OIETPEikCojEpNhrNoUnJZWzrI3YI2uQ4N47izmKV1X5dAYv
X-Gm-Gg: ASbGncs19+Pc61lLu3M+zSlVCdO8ZwMKRX0LKd+1t59gBrXWyHngty1mBNeeHwzBo2R
	BHrhfCqgiqJxd0tJ+XKG9ckAxzaap8WsyQMiljRot3Dogq64CtbyGsCK7ZTVqP5LiDJ/wGu6dNj
	o4VikWk+8r0uYTO3ahisl6OPlEwrYe2KjxV+jcEvCGXasJgiokCUtE8Oh/JMErYHqfNnH7qZKMK
	kjpLck7sNrq16owFBOurzQFbedvGhN76twEM7E3lpG30xvlVniHjOYnQKHvw9yjc9LRXxYMpX7h
	1wC5jOQVo/UXQ5n9veOFNpEIXhkALR42P9pfsWECie4NWw==
X-Google-Smtp-Source: AGHT+IGoAl7RP6vz9q7ZNLerCe+QiTDOPUWcDP8mG3WjvZ3rSUZqx0QcgAvTWNBxY4h5EHMN4sK3VA==
X-Received: by 2002:a05:6a00:179e:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-739e6e6fb3cmr13738787b3a.0.1744020181171;
        Mon, 07 Apr 2025 03:03:01 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-739da0b45b4sm8086532b3a.151.2025.04.07.03.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:03:00 -0700 (PDT)
Date: Mon, 7 Apr 2025 18:02:57 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for SG2044
Message-ID: <jd46vvxgrmpk7dhaogio6wsut4l7keshhujw6k3kw2enodgwiw@wtaxbwgaykrr>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-3-looong.bin@gmail.com>
 <jnvlo3su4xzsvzte2s3noosycxae5uxhi3vusefpgq462ymqst@jgta6xxmcbtd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jnvlo3su4xzsvzte2s3noosycxae5uxhi3vusefpgq462ymqst@jgta6xxmcbtd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030302_404716_1C85D87D 
X-CRM114-Status: GOOD (  46.58  )
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

On Mon, Apr 07, 2025 at 11:38:27AM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 07, 2025 at 03:20:39PM +0800, Longbin Li wrote:
> > From: ghost <2990955050@qq.com>
> =

> Huh, is that a real name?
>

My fault,i will change it.
 =

> > Add PWM controller for SG2044.
> > =

> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >  drivers/pwm/pwm-sophgo-sg2042.c | 162 +++++++++++++++++++++++++++-----
> >  1 file changed, 138 insertions(+), 24 deletions(-)
> > =

> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index ff4639d849ce..c62e8c758d87 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> =

> The Limitations paragraph needs updating. E.g. SG2044 seems to support
> polarity while SG2042 doesn't.
> =


Thanks,i will add that.

> > @@ -26,20 +26,22 @@
> >  #include <linux/pwm.h>
> >  #include <linux/reset.h>
> > =

> > -/*
> > - * Offset RegisterName
> > - * 0x0000 HLPERIOD0
> > - * 0x0004 PERIOD0
> > - * 0x0008 HLPERIOD1
> > - * 0x000C PERIOD1
> > - * 0x0010 HLPERIOD2
> > - * 0x0014 PERIOD2
> > - * 0x0018 HLPERIOD3
> > - * 0x001C PERIOD3
> > - * Four groups and every group is composed of HLPERIOD & PERIOD
> > - */
> > -#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> > -#define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> > +#define REG_HLPERIOD		0x0
> > +#define REG_PERIOD		0x4
> > +#define REG_GROUP		0x8
> =

> REG_GROUP belongs to a different category than REG_PERIOD. So please use
> a different schema to name it (or drop it, see below).
> =


I will improve it.

> > +#define REG_POLARITY		0x40
> > +
> > +#define REG_PWMSTART		0x44
> > +#define REG_PWMUPDATE		0x4C
> > +#define REG_SHIFTCOUNT		0x80
> > +#define REG_SHIFTSTART		0x90
> =

> REG_SHIFTCOUNT and REG_SHIFTSTART are unused.
> =


I will drop it.

> > +#define REG_PWM_OE		0xD0
> =

> Actually I liked the old prefix better. E.g. "REG_POLARITY" looks more
> generic that it actually is.
> =


I will reconsider that.

> > +
> > +#define PWM_REG_NUM		0x80
> =

> This is unused?
> =


I will drop it,thanks!

> > +
> > +#define PWM_POLARITY_MASK(n) BIT(n)
> > +#define PWM_HLPERIOD(chan) ((chan) * REG_GROUP + REG_HLPERIOD)
> > +#define PWM_PERIOD(chan) ((chan) * REG_GROUP + REG_PERIOD)
> =

> ((chan) * 8 + 0) is IMHO better. I guess this is subjective because at
> least the *8 is repeated several times, but the advantage of not using a
> define for 8 (and 0 and 4) is that by looking at
> =

> 	#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> =

> you immediatly see the offsets of the HLPERIOD register, while for
> =

> 	#define PWM_HLPERIOD(chan) ((chan) * REG_GROUP + REG_HLPERIOD)
> =

> you have to lookup two additional symbols.
> =

> Also PWM is a prefix that is too generic.
> =


I will reconsider that.

> >  #define SG2042_PWM_CHANNELNUM	4
> > =

> > @@ -51,6 +53,12 @@
> >  struct sg2042_pwm_ddata {
> >  	void __iomem *base;
> >  	unsigned long clk_rate_hz;
> > +	struct mutex lock;
> =

> What does this lock protect? Note that there is a chip lock that is held
> when .apply() is called, to serialize apply calls for a single chip. I
> guess this can and should be dropped.
> =


I will retest it, and if possible i will drop it, thanks.

> > +};
> > +
> > +struct sg2042_chip_data {
> > +	const struct pwm_ops ops;
> > +	bool atomic;
> >  };
> > =

> >  /*
> > @@ -62,8 +70,8 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata=
 *ddata, unsigned int chan,
> >  {
> >  	void __iomem *base =3D ddata->base;
> > =

> > -	writel(period_ticks, base + SG2042_PWM_PERIOD(chan));
> > -	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
> > +	writel(period_ticks, base + PWM_PERIOD(chan));
> > +	writel(hlperiod_ticks, base + PWM_HLPERIOD(chan));
> =

> The register renaming adds really quite some noise that is actually
> unrelated to this patch. If you really think the register defines need
> renaming, do that in a separate patch (and justify it well).
> =


Sorry, i will modify here.

> >  }
> > =

> >  static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> > @@ -104,8 +112,8 @@ static int pwm_sg2042_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
> >  	u32 hlperiod_ticks;
> >  	u32 period_ticks;
> > =

> > -	period_ticks =3D readl(ddata->base + SG2042_PWM_PERIOD(chan));
> > -	hlperiod_ticks =3D readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
> > +	period_ticks =3D readl(ddata->base + PWM_PERIOD(chan));
> > +	hlperiod_ticks =3D readl(ddata->base + PWM_HLPERIOD(chan));
> > =

> >  	if (!period_ticks) {
> >  		state->enabled =3D false;
> > @@ -123,13 +131,112 @@ static int pwm_sg2042_get_state(struct pwm_chip =
*chip, struct pwm_device *pwm,
> >  	return 0;
> >  }
> > =

> > -static const struct pwm_ops pwm_sg2042_ops =3D {
> > -	.apply =3D pwm_sg2042_apply,
> > -	.get_state =3D pwm_sg2042_get_state,
> > +static void pwm_sg2044_config(struct sg2042_pwm_ddata *ddata, struct p=
wm_device *pwm, bool enabled)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value =3D readl(ddata->base + REG_PWMSTART);
> > +
> > +	if (enabled)
> > +		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
> > +	else
> > +		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
> > +}
> > +
> > +static void pwm_sg2044_set_outputenable(struct sg2042_pwm_ddata *ddata=
, struct pwm_device *pwm,
> > +					bool enabled)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value =3D readl(ddata->base + REG_PWM_OE);
> > +
> > +	if (enabled)
> > +		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
> > +	else
> > +		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
> > +}
> > +
> > +static int pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, str=
uct pwm_device *pwm,
> > +				   const struct pwm_state *state)
> > +{
> > +	enum pwm_polarity polarity;
> > +	u32 pwm_value;
> > +
> > +	pwm_value =3D readl(ddata->base + REG_POLARITY);
> > +
> > +	polarity =3D state->polarity;
> > +
> > +	if (polarity =3D=3D PWM_POLARITY_NORMAL)
> > +		pwm_value &=3D ~BIT(pwm->hwpwm);
> > +	else
> > +		pwm_value |=3D BIT(pwm->hwpwm);
> > +
> > +	writel(pwm_value, ddata->base + REG_POLARITY);
> =

> I like this idiom better than the one used in
> pwm_sg2044_set_outputenable() and pwm_sg2044_config(). However drop the
> local variable polarity.
> =


I will modify that, thanks.

> > +	return 0;
> > +}
> > +
> > +static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> > +			    const struct pwm_state *state)
> > +{
> > +	struct sg2042_pwm_ddata *ddata =3D pwmchip_get_drvdata(chip);
> > +	u32 hlperiod_ticks;
> > +	u32 period_ticks;
> > +
> > +	if (!state->enabled) {
> > +		pwm_sg2044_config(ddata, pwm, false);
> > +		return 0;
> > +	}
> > +
> > +	pwm_sg2044_set_polarity(ddata, pwm, state);
> > +
> > +	/*
> > +	 * Duration of High level (duty_cycle) =3D HLPERIOD x Period_of_input=
_clk
> > +	 * Duration of One Cycle (period) =3D PERIOD x Period_of_input_clk
> > +	 */
> > +	period_ticks =3D min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->p=
eriod,
> > +					       NSEC_PER_SEC), U32_MAX);
> > +	hlperiod_ticks =3D min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state-=
>duty_cycle,
> > +						 NSEC_PER_SEC), U32_MAX);
> =

> This is the same calculation as for sg2042. I think I'd put that in a
> function that is used by both variants.
> =


Thanks, i will modify that.

> > +	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=3D%u, HLPERIOD=3D%u\n=
",
> > +		pwm->hwpwm, period_ticks, hlperiod_ticks);
> =

> Now that there are more register values, please add them all to the
> debug output.
> =


I will, thanks.

> > +	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
> > +
> > +	guard(mutex)(&ddata->lock);
> > +
> > +	/*
> > +	 * re-enable PWMSTART to refresh the register period
> > +	 */
> > +	pwm_sg2044_config(ddata, pwm, false);
> =

> pwm_sg2044_config() is conceptually different to pwm_sg2042_config().
> This is irritating, so please find a better name.
> =


I will modify that, thanks.

> > +	pwm_sg2044_set_outputenable(ddata, pwm, true);
> > +	pwm_sg2044_config(ddata, pwm, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct sg2042_chip_data sg2042_chip_data =3D {
> > +	.ops =3D {
> > +		.apply =3D pwm_sg2042_apply,
> > +		.get_state =3D pwm_sg2042_get_state,
> > +	},
> > +	.atomic =3D true,
> > +};
> > +
> > +static const struct sg2042_chip_data sg2044_chip_data =3D {
> > +	.ops =3D {
> > +		.apply =3D pwm_sg2044_apply,
> > +		.get_state =3D pwm_sg2042_get_state,
> > +	},
> > +	.atomic =3D false,
> =

> If you drop the mutex don't forget to drop this one, too.
> =


I will, thanks for your reminder.

> >  };
> =

> Best regards
> Uwe

Best regards
Longbin Li

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

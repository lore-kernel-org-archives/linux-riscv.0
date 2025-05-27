Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFDFC54FB3
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 01:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUd6Fdu74wYFKa8ZE7+yry8J6L5w0XgNxQgb1mAqegY=; b=2pEHbQb0Qti9sv
	tWhSArWd7GiBLJAa7GQbsN0vulDPkw1+8lW88WbUSNRDwXDduK3qC2V0v6iwYM2OQvS/PGeLTjpMU
	6P0n1P2ChhDiMDBhavArBEy0bPmow4kPmqvQhowOKsIxQAzvTeHY8gxChxBDzsvdJF3DMfVm0IZ1u
	fokk2o5OCOSOxuZDjDGg6iln0tmF15OxHsTJ+tujhn6ikR+aJ3J/y5VVtX/OJt/n1D/dfYn/7E7EY
	TvD4VYfUQ/PPeFu/A4A96cAlHLx+7gRBgEglp+zBaNdblE/qR0HcMY9p8x7KECl2Y8g79zCcWAjF2
	df7uv3jNJoH5TcvEo0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjC3-00000009iIx-0n7q;
	Tue, 27 May 2025 01:33:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjC0-00000009iIT-0pon
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 01:33:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311714cc316so1022323a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748309603; x=1748914403; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvJ3qRY7vvlwo6L+qtgNdDTxVIpt1gweYQIVKsNpVWw=;
        b=mZDMqMOy3Td9kRd5WCttZJaWCe8Pd33cFE2HK3j0pfc5Pfm/sK0vyimzbfeTOpzLs1
         CGNiN1sIqwTu23UDDF4gJCP7qGFmF/aGdYp5dY/+UTFAJ+vKbokBlTz1jyQ87DpYP3hy
         KiS9BsrsZGW3aLq55ViyjWbL8ogTntal7eDMNXXbxpEFJMw/hVVosEOhDawvXRvOYmRl
         acjZ0Pbn2xqVjBObSjJd8i2DU+01GbRpou3Au3PKFFwZh7f8iG8AN/YwVcfMNqnVGbgl
         b8vAElvrLFYqDsFsDaCze0KfgqWVgfh70wlei1CABXePCqdi/7/LfYyrmXVab8FYRwPy
         g+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748309603; x=1748914403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvJ3qRY7vvlwo6L+qtgNdDTxVIpt1gweYQIVKsNpVWw=;
        b=NLRWZ3bSeHGAbgt3v0kyVZyRJJTk2pwO/oQl9/H84uk4QNKqrGsG75uxoVBFfBZslZ
         CD2Av1mKh7uSIhplhtnvk9uAh10ykP85rUJ4IE+QAQW0tZrfvoFvJ5DRClhzxEaWBaQ6
         HKEqNBRmXYt4nClfQMNGttV5UjhIUzGAQK3Yy6RWZxQgTgpxnhz93t3Ewgf1No2zpnNE
         YUMjIXI0FLbRNx3pwLBcwcAAbUVhQc9WgBrlgLUkKqye/JTSYetr2yAJghoB7BzAt5ZB
         jKws92VENKGz4QS6owgDCtJW60LzAy7gdnlvdQEsp9v7BBTbF/pmo3jOGGJWfHOPcezQ
         WnBg==
X-Forwarded-Encrypted: i=1; AJvYcCVn6q93lcKdBqeaEhZ0LVOEumquMebR730GeWqKhKhbVDlVYMiDQo9jRDBlqlni5bT0ayEsJHdEv0mSgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfXl/y4aMuHq60tXBZw1gxZr1lacck6WvziSyIW0fVN5vlmqMA
	6PlUKsTmvjbCvu6ho/CXRsC1dL0EbWSQoM8OWBKQzo5QgVnhMjevb25F
X-Gm-Gg: ASbGncuWPa2Ryquhu59UQGWVov3TM4l5azCjhtTfzFKTtHq0cZRalWxVJiVtAheVBD0
	F6ISJ56P8C4qTxUI96fXE0dzHcKK9vwup4HglUtTE/hhJM6NOhLJcY5e278zAeX5FO8F1IJOl11
	a9TlSrxNWw4xPFL7C0kbt+lHLHOuM+QolLEgzMTKOimUDxRcz+wZ2Dc1Ukg+MP/vcwDkBwAkEdy
	/hZgys/nan0ifkPOs2cXNKRLINqnlWzhyT4MjBmuQvxy2BYtyRqrlybbilTwrYAXZppmkFKAZrB
	cibFyWsXD9GCl5ZNM4o4w4w0njAF558QWL77y89KWVWVdDOUpq/s
X-Google-Smtp-Source: AGHT+IHIY+p1U9yGcxp85neZDiVtg1+leRzLjswY7T3Ox7/Uj83JLq+1T9pQYqyo3NpX7Ybgyie4yg==
X-Received: by 2002:a17:90b:5110:b0:311:9c9a:58e5 with SMTP id 98e67ed59e1d1-3119c9a5d30mr4363503a91.24.1748309602855;
        Mon, 26 May 2025 18:33:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-311a3f2eb6esm629071a91.22.2025.05.26.18.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 18:33:22 -0700 (PDT)
Date: Tue, 27 May 2025 09:33:20 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <xgk2ac6zkfs34coefjcrol3aklob7sn7ob6qerhzf7yfa3dqdo@b54syid35obp>
References: <20250428013501.6354-1-looong.bin@gmail.com>
 <20250428013501.6354-4-looong.bin@gmail.com>
 <jo4ustzbkswmeive5s4tepwhzeoeswa4knfihkzh6eylujeid4@dj2a2nzp2a5v>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jo4ustzbkswmeive5s4tepwhzeoeswa4knfihkzh6eylujeid4@dj2a2nzp2a5v>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_183324_239849_C57A0506 
X-CRM114-Status: GOOD (  34.51  )
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

On Mon, May 26, 2025 at 05:06:25PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 28, 2025 at 09:34:50AM +0800, Longbin Li wrote:
> > Add PWM controller for SG2044 on base of SG2042.
> > =

> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > ---
> >  drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index 23a83843ba53..5bb92c910540 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -13,6 +13,9 @@
> >   *   the running period.
> >   * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
> >   *   be stopped and the output is pulled to high.
> > + * - SG2044 support polarity while SG2042 does not. When PWMSTART is
> > + *   false, POLARITY being NORMAL will make output being low,
> > + *   POLARITY being INVERSED will make output being high.
> =

> Without detailed knowledge about the hardware this isn't understandable.
> What is PWMSTART? I think this can just read:
> =

> 	SG2044 supports both polarities, SG2042 only normal polarity.
> =

> The rest is an implementation detail.
>

I will modify that, thanks.
 =

> >   * See the datasheet [1] for more details.
> >   * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
> =

> This only describes SG2042, right? Can you please add a link for the new
> variant?
> =


Sorry, there is no public document for SG2044.

> >   */
> > @@ -26,6 +29,10 @@
> >  #include <linux/pwm.h>
> >  #include <linux/reset.h>
> > =

> > +#define SG2044_PWM_POLARITY		0x40
> > +#define SG2044_PWM_PWMSTART		0x44
> > +#define SG2044_PWM_OE			0xd0
> > +
> >  #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> >  #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> > =

> > @@ -72,8 +79,8 @@ static void pwm_set_dutycycle(struct pwm_chip *chip, =
struct pwm_device *pwm,
> >  	period_ticks =3D min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->p=
eriod, NSEC_PER_SEC), U32_MAX);
> >  	hlperiod_ticks =3D min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state-=
>duty_cycle, NSEC_PER_SEC), U32_MAX);
> > =

> > -	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=3D%u, HLPERIOD=3D%u\n=
",
> > -		pwm->hwpwm, period_ticks, hlperiod_ticks);
> > +	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=3D%u, PERIOD=3D%u, HL=
PERIOD=3D%u, POLARITY=3D%u\n",
> > +		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->pol=
arity);
> > =

> >  	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
> >  }
> > @@ -123,6 +130,74 @@ static int pwm_sg2042_get_state(struct pwm_chip *c=
hip, struct pwm_device *pwm,
> >  	return 0;
> >  }
> > =

> > +static void pwm_sg2044_set_start(struct sg2042_pwm_ddata *ddata, struc=
t pwm_device *pwm,
> > +				 bool enabled)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value =3D readl(ddata->base + SG2044_PWM_PWMSTART);
> =

> Please use a variable name that matches the register this is used for.
> =


I will fix that.

> > +	if (enabled)
> > +		pwm_value |=3D BIT(pwm->hwpwm);
> > +	else
> > +		pwm_value &=3D ~BIT(pwm->hwpwm);
> > +
> > +	writel(pwm_value, ddata->base + SG2044_PWM_PWMSTART);
> > +}
> > +
> > +static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, s=
truct pwm_device *pwm,
> > +				     bool enabled)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value =3D readl(ddata->base + SG2044_PWM_OE);
> > +
> > +	if (enabled)
> > +		pwm_value |=3D BIT(pwm->hwpwm);
> > +	else
> > +		pwm_value &=3D ~BIT(pwm->hwpwm);
> > +
> > +	writel(pwm_value, ddata->base + SG2044_PWM_OE);
> > +}
> > +
> > +static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, st=
ruct pwm_device *pwm,
> > +				    const struct pwm_state *state)
> > +{
> > +	u32 pwm_value;
> > +
> > +	pwm_value =3D readl(ddata->base + SG2044_PWM_POLARITY);
> > +
> > +	if (state->polarity =3D=3D PWM_POLARITY_NORMAL)
> > +		pwm_value &=3D ~BIT(pwm->hwpwm);
> > +	else
> > +		pwm_value |=3D BIT(pwm->hwpwm);
> > +
> > +	writel(pwm_value, ddata->base + SG2044_PWM_POLARITY);
> > +}
> > +
> > +static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> > +			    const struct pwm_state *state)
> > +{
> > +	struct sg2042_pwm_ddata *ddata =3D pwmchip_get_drvdata(chip);
> > +
> > +	pwm_sg2044_set_polarity(ddata, pwm, state);
> > +
> > +	pwm_set_dutycycle(chip, pwm, state);
> > +
> > +	/*
> > +	 * re-enable PWMSTART to refresh the register period
> > +	 */
> > +	pwm_sg2044_set_start(ddata, pwm, false);
> =

> I don't understand the effect of the START register. =

> =


PWMSTART[3:0] enable the output of the corresponding channel. Must re-enable
it to refresh the register period when changed the duty cycle. I will find =

a better name, thanks.

> > +	if (!state->enabled)
> > +		return 0;
> > +
> > +	pwm_sg2044_set_outputdir(ddata, pwm, true);
> > +	pwm_sg2044_set_start(ddata, pwm, true);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct sg2042_chip_data sg2042_chip_data =3D {
> >  	.ops =3D {
> >  		.apply =3D pwm_sg2042_apply,
> =

> Best regards
> Uwe



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

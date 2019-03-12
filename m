Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4685AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1946A214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfCXS5vv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1946A214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BG635XwIjGqYvl57Hu6nVXvgtpuwTggG3D2hS3356fU=; b=VfCXS5vvCvSKhk
	U3HiOnE9KioCRMBbbNxhB2QITL9Es1y7ADeUE/4nigLw73NJyqtvqUS2JY2ppTxgwh/czmgXFVImp
	Gyc+p/YHBQo9IT/6m3lR9hgJ7qoWS9CSfoYjB6iGHR4RAQy0VE6bSxt6uOUG7Go+3VgQLETviH1Gb
	O3lPHlsoFKnJXIXGugXZxh/kBBbYf4PyzHCu1+KW9d3e96jCz1i9cofqsR8OcibPQzSkIbDqv8SaG
	g20gNMeYcGBay64npMyoeTxlnpRQyjtNt4oQ56N0SG0kfUPg9iG9CLpbMuH5frcn6qhm3Ue+CrDf1
	gYw3t1ZqViW8fIcsNL4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3dXd-00067z-LC; Tue, 12 Mar 2019 09:17:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3dXa-00067W-VI
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 09:17:44 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3dXZ-0002dH-9m; Tue, 12 Mar 2019 10:17:41 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h3dXX-000766-ON; Tue, 12 Mar 2019 10:17:39 +0100
Date: Tue, 12 Mar 2019 10:17:39 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v9 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190312091739.fhv2hb2ll2eamdsn@pengutronix.de>
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <1552378289-27245-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552378289-27245-3-git-send-email-yash.shah@sifive.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_021743_163201_ACC36F15 
X-CRM114-Status: GOOD (  15.94  )
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
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 sachin.ghadi@sifive.com, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

there are just a few minor things left I commented below.

On Tue, Mar 12, 2019 at 01:41:29PM +0530, Yash Shah wrote:
> +#define div_u64_round(a, b) \
> +	({typeof(b) __b =3D b; div_u64((a) + __b / 2, __b); })

Parenthesis around b please. I guess I didn't had them in my suggestion
either, sorry for that.

> +static int pwm_sifive_enable(struct pwm_chip *chip, bool enable)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +	int ret;
> +
> +	if (enable) {
> +		ret =3D clk_enable(pwm->clk);
> +		if (ret) {
> +			dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (!enable)
> +		clk_disable(pwm->clk);
> +
> +	return 0;
> +}

There is only a single caller for this function. I wonder if it is
trivial enough to fold it into pwm_sifive_apply.

> +static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *de=
v,
> +			    struct pwm_state *state)
> +{
> +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> +	unsigned int duty_cycle;
> +	u32 frac;
> +	struct pwm_state cur_state;
> +	bool enabled;
> +	int ret =3D 0;
> +	unsigned long num;
> +
> +	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> +		return -EINVAL;
> +
> +	ret =3D clk_enable(pwm->clk);
> +	if (ret) {
> +		dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&pwm->lock);
> +	pwm_get_state(dev, &cur_state);
> +
> +	enabled =3D cur_state.enabled;
> +
> +	if (state->period !=3D pwm->approx_period) {
> +		if (pwm->user_count !=3D 1) {
> +			ret =3D -EBUSY;
> +			goto exit;
> +		}
> +		pwm->approx_period =3D state->period;
> +		pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
> +	}
> +
> +	duty_cycle =3D state->duty_cycle;
> +	if (!state->enabled)
> +		duty_cycle =3D 0;
> +
> +	num =3D (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
> +	frac =3D div_u64_round(num, state->period);
> +	/* The hardware cannot generate a 100% duty cycle */
> +	frac =3D min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> +
> +	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 +
> +	       dev->hwpwm * PWM_SIFIVE_SIZE_PWMCMP);
> +
> +	if (state->enabled !=3D enabled) {
> +		ret =3D pwm_sifive_enable(chip, state->enabled);
> +		if (ret)
> +			goto exit;

This goto is a noop.

> +	}
> +
> +exit:
> +	clk_disable(pwm->clk);
> +	mutex_unlock(&pwm->lock);
> +	return ret;
> +}

There are a few other things that could be improved, but I think they
could be addressed later. For some of these I don't even know what to
suggest, for some Thierry might not agree it is worth fixing:

 - rounding
   how to round? When should a request declined, when is rounding ok?
   There is still "if (state->period !=3D pwm->approx_period) return -EBUSY"
   in this driver. This is better than before, but if state-period =3D=3D
   pwm->approx_period + 1 the result (if accepted) might be the same as
   without the +1 and so returning -EBUSY for one case and accepting the
   other is strange.
 - don't call PWM API functions designed for consumers (here: pwm_get_state)
 - Move div_u64_round to include/linux/math64.h

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

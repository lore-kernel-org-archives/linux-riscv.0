Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B163BC19F53
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uki4AuPmJp+zMoWvKhetIosdTxr+R+RoyrDVm4mh/o8=; b=ezS4clJA/SKQz2
	Pvdfd2mJyTUz0US7vCyyCIOEfm2gLZL0IQEkMM18skYrdu6N07+/CzQaJjYVB0dUpL5AO6HgkNPaL
	7cX34C7uCwJXE3XBXsHScRfwS3Qe8n6dzSHB3YY1Q5eCZTTtZV1SD3pJ9lxzXv8oIjJVzTQPFx0Le
	+l7R1m1HbyRPF+xsA/q+WSoQBmWqkqbAsy4iBHzLJ+EDQMKTzfRqIzvgqW+Wm/NQYaz3/mv1r6efm
	/mGaKCiZllOZBY0Ab9u3VvZbeRj592idji2IXEmRo6r0tyv/HAPZEpOMnNJMEI9H3bBH7PVvDXN9M
	gVSQ+mXcx9KY3k2nptDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s22kf-00000008dhu-3PZk;
	Wed, 01 May 2024 05:43:33 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s22kW-00000008ddQ-2iA8
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 05:43:32 +0000
Date: Wed, 1 May 2024 15:42:44 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1714542190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I0JjuJfRwN3PxzuU5OJDvRQPhrTURiBh6iup5xIVpTE=;
	b=Y424BfbCPAvaTiEHva+EjwrF+C76RSvznwiqdRgCuCqTxRnj4CPCMnZcgRxIj6IJHGoWfH
	QDA+QESm21J7Owl6Nwa43JtUtBul3458OjK+OWjihWPXsis2nkQ35huVIS2GaA+EYM92bo
	pSi6wkVCU6jXLeu40QYL6P5vfcGM/B1CzZr6tFHol2LsuCNthYca4DosTY7W8q/uO1Y0oB
	dsdOKMr7KJobIGPIBnci+tvmJ2r7NGGYg0swk/u4gxbde7uajDO3S8ZtWd1PLIOYmAUHX5
	AVpikoE3IjpRbzcw/aqXp5G6Ink/LHb/tylAKunqkzV7dKkd1tifPeDv+/rSGQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v8 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
Message-ID: <ZjHWVEbzQ1udTcmQ@titan>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
 <20240131125920.2879433-3-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240131125920.2879433-3-privatesub2@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_224324_842828_E7EDE492 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Maksim Kiselev <bigunclemax@gmail.com>, Samuel Holland <samuel@sholland.org>, Brandon Cheo Fusi <fusibrandon13@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Jan 31, 2024 at 03:59:15PM +0300, Aleksandr Shubin wrote:
> +	if (state->polarity != pwm->state.polarity ||
> +	    state->duty_cycle != pwm->state.duty_cycle ||
> +	    state->period != pwm->state.period) {
> +		ctl = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CTL(pwm->hwpwm));
> +		clk_cfg = sun20i_pwm_readl(sun20i_chip, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
> +		hosc_rate = clk_get_rate(sun20i_chip->clk_hosc);
> +		bus_rate = clk_get_rate(sun20i_chip->clk_apb0);
> +		if (pwm_en & SUN20I_PWM_ENABLE_EN(pwm->hwpwm ^ 1)) {
> +			/* if the neighbor channel is enable, check period only */
> +			use_bus_clk = FIELD_GET(SUN20I_PWM_CLK_CFG_SRC, clk_cfg) != 0;
> +			val = mul_u64_u64_div_u64(state->period,
> +						  (use_bus_clk ? bus_rate : hosc_rate),
> +						  NSEC_PER_SEC);
> +
> +			div_m = FIELD_GET(SUN20I_PWM_CLK_CFG_DIV_M, clk_cfg);
> +		} else {
> +			/* check period and select clock source */
> +			use_bus_clk = false;
> +			val = mul_u64_u64_div_u64(state->period, hosc_rate, NSEC_PER_SEC);
> +			if (val <= 1) {
> +				use_bus_clk = true;
> +				val = mul_u64_u64_div_u64(state->period, bus_rate, NSEC_PER_SEC);
> +				if (val <= 1) {
> +					ret = -EINVAL;
> +					goto unlock_mutex;
> +				}
> +			}
> +			div_m = fls(DIV_ROUND_DOWN_ULL(val, SUN20I_PWM_MAGIC));
> +			if (div_m > SUN20I_PWM_CLK_DIV_M_MAX) {
> +				ret = -EINVAL;
> +				goto unlock_mutex;
> +			}
> +
> +			/* set up the CLK_DIV_M and clock CLK_SRC */
> +			clk_cfg = FIELD_PREP(SUN20I_PWM_CLK_CFG_DIV_M, div_m);
> +			clk_cfg |= FIELD_PREP(SUN20I_PWM_CLK_CFG_SRC, use_bus_clk);
> +
> +			sun20i_pwm_writel(sun20i_chip, clk_cfg, SUN20I_PWM_CLK_CFG(pwm->hwpwm));
> +		}

If I'm reading this correctly, for each PWM pair you set the clock once.
Wouldn't this mean that the order of setting PWMs would affect the accuracy?
It would be good to note this down perhaps?

John.

> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

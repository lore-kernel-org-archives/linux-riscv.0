Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC5FC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm6YGjwj6xFeEFFzjwZBFlp7efRDgwAaKhn0YkYnuxE=; b=sn2oTqDMKv2Nzc
	4k0HzbPDrVM57/nK2BPum1eeRyidxeZ/8zWoX6hzI81aPCC7LymV5zZyxavvt3zjA0nvI12Ccluf+
	u1Q4N4mPrUJWbSIF2S66XytmAN/JNDxe0vioWbebsqp4mu+NPTbJM4f50X2lC41U5uVmX2cmUbmQT
	KMg/RtAj3kuoeOoFwJio97qx2RnD/MRGOYv/Tnbm1lmMJo4lufnVIa6oNliT0FVXhfj2rPI0ndFfm
	rxvlQxCi2PRwCFJvtoKPVxC4+5zl49MKqCISR+9SEOLyrVd7/epRrAOfK3M7MwVt3Ztdn4arDgNZ7
	/HrOM4bXjE9Xr1rUotgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppR9m-007d0u-1Q;
	Thu, 20 Apr 2023 10:04:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppR9i-007czq-2U
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 10:04:48 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1765D44270
	for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681985080;
	bh=MPSX/AfZygcMhOCNuxX1ZecGolc5hbcZ2NhciybSDRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=b6v/jqmA6ujYWkGJoyz6sY7E2xd9+810N4cyaOlOReZ/QBOnWRDLRSdYgE/Td26hL
	 aSyFx1T5kmV7XDKlK3w8O/bAt/VGft8A9gM6euaY2O5k3cXq+zQkqDonsv6pGebYTx
	 xNP8YYZk4MRr07mmmYUynHSnIziIH6av3NRg5QxkPJRnTvZ2rOAq4tlO7kYvUnPl7y
	 m0ApYR7OdwJ+8pywj7+WozFoQee6GE3Q3lsb0Tfh4RLdbbGJeeGq41tf7JTm/Nsy1V
	 T0ixv/5VgWr4g8V2GWygmcqyuimp9ipPfTiK1xwvnmLC724rxa+T349v462sCkDjxx
	 mVfWF9whStzSA==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-74aa6b759b3so32798785a.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 03:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985079; x=1684577079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPSX/AfZygcMhOCNuxX1ZecGolc5hbcZ2NhciybSDRM=;
        b=FwMrMLgadH53Gx+K0s7kZsybc1XDQ/iG2ZugkogwI+RkDfmW6rLWDdRgFrDZoCAW2R
         YEGjE5eHqweDSCKNv4n54apmEiy1BWdU/FaZmrBEasGmisSf0zLpG/r+zsrGjkO8S8YZ
         pEXejnXcAqfZ8F/PtzSEDO8hs5MuxOE3G2roWcHcbNAuAokAnhPsWeK0QBwXNKZf+mR6
         +A9YnkWwdhu3dO9pbx6VjtFiHm5d9EXVADNnWpljJ6DLqDbYmSlz9mszORRb2lAh9N4c
         QOGqZJ2FLGtE2z/+w6NIn+lesreYDTncgqXAojvLCYyOvQHlua3Ub8TtTTcAn22CKWck
         93hg==
X-Gm-Message-State: AAQBX9d8E4qoypldRvkd/hURmMezTNge4KSYbVFGhTy6rwFfLR2DpLbc
	OtMGBJxl7ZWN6Oixxj0NUIAbJ6Hvfe/F45iUxNgpH9eCxHayzvf/ZIp09adrGRZvhRIfsmiS5JB
	9yz/wDp/auYVmi11y7cXYLjpW7gVvRMbz8/BtzuP7xBKFUc2Lc9h9RovAEKHEXA==
X-Received: by 2002:ac8:5792:0:b0:3ef:5733:29e4 with SMTP id v18-20020ac85792000000b003ef573329e4mr667772qta.64.1681985079079;
        Thu, 20 Apr 2023 03:04:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350YZOJhhJ2/DG8mPZrGpHZG2bUew/6AA3c59/iwkpF1lN4P7gKE74NKz6hnyMtvTbz3kA9sQrlj/oL+Xnlk50P8=
X-Received: by 2002:ac8:5792:0:b0:3ef:5733:29e4 with SMTP id
 v18-20020ac85792000000b003ef573329e4mr667740qta.64.1681985078844; Thu, 20 Apr
 2023 03:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230420093457.18936-1-nylon.chen@sifive.com> <20230420093457.18936-3-nylon.chen@sifive.com>
In-Reply-To: <20230420093457.18936-3-nylon.chen@sifive.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 20 Apr 2023 12:04:22 +0200
Message-ID: <CAJM55Z-smXpgL+QyTSeAWt=B-RS_qtbrFZtJpP-cQS0gsQnDSw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Nylon Chen <nylon.chen@sifive.com>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, geert+renesas@glider.be, 
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_030447_095742_128EE910 
X-CRM114-Status: GOOD (  21.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 20 Apr 2023 at 11:35, Nylon Chen <nylon.chen@sifive.com> wrote:
>
> The `frac` variable represents the pulse inactive time, and the result of
> this algorithm is the pulse active time. Therefore, we must reverse the
> result.
>
> The reference is SiFive FU740-C000 Manual[0]
>
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf [0]
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  drivers/pwm/pwm-sifive.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 393a4b97fc19..d5d5f36da297 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -132,13 +132,13 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  {
>         struct pwm_sifive_ddata *ddata = pwm_sifive_chip_to_ddata(chip);
>         struct pwm_state cur_state;
> -       unsigned int duty_cycle;
> +       unsigned int duty_cycle, period;
>         unsigned long long num;
>         bool enabled;
>         int ret = 0;
>         u32 frac;
>
> -       if (state->polarity != PWM_POLARITY_INVERSED)
> +       if (state->polarity != PWM_POLARITY_NORMAL && state->polarity != PWM_POLARITY_INVERSED)
>                 return -EINVAL;
>
>         cur_state = pwm->state;
> @@ -154,10 +154,13 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>          * calculating the register values first and then writing them
>          * consecutively
>          */
> +       period = max(state->period, ddata->approx_period);

Hi Nylon,

I don't understand this patch. You introduce this new variable,
period, and set it here but you never seem to use it. If you planned
to use it instead of state->period below, why should it be the max of
the old period and what is requested? What happens if the consumer
wants to lower the period?

Also above you now allow both PWM_POLARITY_NORMAL and
PWM_POLARITY_INVERSED but you treat both cases the same.

/Emil

>         num = (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
>         frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
> -       /* The hardware cannot generate a 100% duty cycle */
>         frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> +       /* The hardware cannot generate a 100% duty cycle */
> +       frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;
> +
>
>         mutex_lock(&ddata->lock);
>         if (state->period != ddata->approx_period) {
> --
> 2.40.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

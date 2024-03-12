Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACADC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9g9xDy+0ZhcZfSIew3C/zZXtE95gnzP/qMH0HtgH26Y=; b=eMl09Ap2wQbqEl
	aYPjU4Hvu+CqdYgCItVHMKDOJnWL8yisdMIzEowhlqueLqfdarZl6xa4t0TmNBYc90xCwL8zjy9pg
	CesKn4G9FA+SrXhgTDOWJ5wqq6OHp7a9Y3gFj/JA+8kj22sYWy/7ziLXY5c/FBtkvxYA0Lle3axw2
	QTe2VSC6SFESsetgZO+ZL3zrepVG5TmjFB88sFd9vJqG5KRg49oO1+HguvgOzpsfBrng61fn6eGPS
	ZIbjTD1HGM2Nv7644p0LqbTppcFwDPyF8PYVvO6D0rxuWCex8mGWMVuI39Is02XFR1jYSp4RQooP0
	5mBoAW2SZaBx9Tae0gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxAq-00000004pQD-46kZ;
	Tue, 12 Mar 2024 08:07:49 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxAn-00000004pOh-10r9
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 08:07:46 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6dc8b280155so3798508a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710230861; x=1710835661; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/RIzEOygq7VMUeLQit4zxfFJspu+naDg/n7R0XzC1T4=;
        b=QRJ3RN3bOOzFSV60njTxuYQq/1CXEFOgO0inESNGJXggLZ9TyqnVgqw8PaupNjLAfI
         lvtVKPFNmn+9YlXMBnUi233pTxXGGGl2Mh4wSgz+J6kzXswGXCBhueZHLcCHT8gkG8Jm
         Firwf1iRxcxDL/hnvy4LuefY9dEW82NIB5R3b9f2Kg48ULePZdFvG2tiNknUHtIOqk8g
         XP8eRon9epsiZMu3PVO4TTrm9D/7bCn+VpkNC6Cd4SDjngwaXSlXcaGPAGqrnHtIvAno
         +I7Zf+SJ4s8utnhYvLeyeBhTWnCmwt69xU7Z42a8338iyRRmc8TGAVJGT4c4RHSlvvLS
         sR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230861; x=1710835661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RIzEOygq7VMUeLQit4zxfFJspu+naDg/n7R0XzC1T4=;
        b=LpaX3MGSWIWZC0sV379JT1+lhbnEV2gwrxfI/oVgQrSdoXrmk7rj67JvT6ufY+gp0+
         RmDepnJPCCiLDGHqhEAajbNCm1f39x1sc3xgLuhAPuNkZOXMdqE/FItUPPZP8FyhgTCZ
         I0qyGUzix27TRn5JGtS62JWM9j1x2qe31sGYGxUTGrJ/mq6I+h0miQ2BAa4diPnrDery
         VJsXOo/SIxBmK1YwG9tqFY/mxjpL8kZGrOyaaiJad1iTrNns1XSEC6NLPb9Ds5RuZhGj
         AJF+FvrK5VydaZX+w49Ys4uEcQOOmhS9dBnGYn/kfkxGCQEg6k02WJTO15vyVNgQfNRq
         f31Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIw3Z3XFTrCToP45XMpQgXp29AJ1poj0FBzTUX0TIOoecaOvVM9F0NwETyhhkEj2PXvY9dgEp6CcP5d0pr3d7sZ10a7xqDCBCQ0zqYTsdg
X-Gm-Message-State: AOJu0YzZPjW6ON0GmQqGOHaO5qJ0vPl2V0YdayHm3s/ps3KzTg3UlsG4
	lQEW0ehZ9X3msmPKXzSEVkMO/DkmpeBMcW8RoPGePeOGnAuN/b4gXjjcvND9lyCBN3yJ50IRnsL
	LWYD3pMtTafqWI0ifDtm2zf+sE20=
X-Google-Smtp-Source: AGHT+IEqGDo4+QqrniADKoFq8kmvx9wqjkjFdrGrz+1YEKvO4L30rSVWPQnVMTLEU9xShw0Iryu5luhAJnmK0B+eWoM=
X-Received: by 2002:a05:6870:854d:b0:220:b713:77c1 with SMTP id
 w13-20020a056870854d00b00220b71377c1mr7483886oaj.31.1710230861330; Tue, 12
 Mar 2024 01:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
 <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com> <twzx4abuhduos5s32txeugqr2yyca6ey7adcontsnapthwqaxa@dscea3ybrlym>
 <CAJRtX8T3GD-zu43-+U_rGQugqzGQQ-QbjHATV1NRdEMWevSUGw@mail.gmail.com>
In-Reply-To: <CAJRtX8T3GD-zu43-+U_rGQugqzGQQ-QbjHATV1NRdEMWevSUGw@mail.gmail.com>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 12 Mar 2024 16:07:30 +0800
Message-ID: <CAJRtX8RagduSxqxh-jH2wcoNgzbRdNRYW5Gcka1_uPR-o-Tj7w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_010745_315072_8D273EA7 
X-CRM114-Status: GOOD (  19.91  )
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

Hi Uwe,

Gentle ping,
I'm sorry for wasting your time, and I look forward to your feedback.

> > > +     if (tem < PWM_CV1800_MINPERIOD)
> > > +             return -EINVAL;
> > > +
> > > +     if (tem > PWM_CV1800_MAXPERIOD)
> > > +             tem = PWM_CV1800_MAXPERIOD;
> > > +
> > > +     period_val = (u32)tem;
> > > +
> > > +     /*
> > > +      * The meaning of HLPERIOD is the number of beats in the low or high level
> > > +      * of the PERIOD. When the value of the POLARITY register is 0, HLPERIOD
> > > +      * represents a low level.
> > > +      * HLPERIOD = period_val - rate(MHz) / duty(MHz)
> > > +      * HLPERIOD = period_val - duty(ns) * rate(Hz) / NSEC_PER_SEC
> >
> > So HLPERIOD defines the second part of each period, right? This isn't
> > considered in .get_state().
>
> I am so sorry about this. I made a mess of the duty cycle.
> According to the PWM_DEBUG, it can be inferred that configure the
> biggest duty_cycle not
> bigger than the requested value, so in .apply duty_cycle should round down and
> in .get_state duty_cycle should round up. However, when the polarity is normal,
> This hardware requires a low-level beat count. So the corrected code
> is as follows.
>
> in .apply()
>
> ticks = mul_u64_u64_div_u64(state->duty_cycle , priv->clk_rate,NSEC_PER_SEC);
> ...
> hlperiod_val =period_val- (u32)ticks;
>
> in .get_state()
>
> u32 hlperiod_val=0;
>
> period_ns = DIV_ROUND_UP_ULL(period_val * NSEC_PER_SEC,priv->clk_rate);
> duty_ns = DIV_ROUND_UP_ULL(hlperiod_val * period_ns, period_val);
> hlperiod_val = period_ns - duty_ns;
>
> I tested this code with PWM_DEBUG. no warning output. What do you
> think about this?
>
>

in .apply()

ticks = mul_u64_u64_div_u64(state->duty_cycle, priv->clk_rate,
NSEC_PER_SEC);
if (ticks > period_val)
ticks = period_val;

hlperiod_val = period_val - (u32)ticks;
...
regmap_write(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), hlperiod_val);

in .get_state()

u64 hlperiod_ns = 0;
regmap_read(priv->map, PWM_CV1800_HLPERIOD(pwm->hwpwm), &hlperiod_val);
...
period_ns = DIV_ROUND_UP_ULL(period_val * NSEC_PER_SEC,
priv->clk_rate);
hlperiod_ns = DIV_ROUND_UP_ULL(hlperiod_val * NSEC_PER_SEC,
priv->clk_rate);

duty_ns = period_ns - hlperiod_ns;

I tested this code with PWM_DEBUG. no warning output.

> >
> > > +      */
> > > +     tem = mul_u64_u64_div_u64(state->duty_cycle, priv->clk_rate,
> > > +                               NSEC_PER_SEC);
> > > +     if (tem > period_val)
> > > +             return -EINVAL;
> >
> > if (tem > period_val)
> >         tem = period_val;
> >
> > > +     hlperiod_val = period_val - (u32)tem;
> >
> > Wrong rounding I think. Did you test your driver with PWM_DEBUG enabled?
>
> ditto.
>

Best regards
Jingbao Qiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0703C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 01:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HihIPip7+sCJqqV+hPT6FpTynfdzaByIlF9Vo1PBaag=; b=Tigqa3gFkzNx9i
	YefiaBHm0N+JAaDNUfW/qSxhMe2micMiJoLeQunqrf645mtsFpLg/zcHiKFbCyBbyLFIQDph6SreI
	MnM0VO+866TIENmHbPj3l0PIfXVNIvU55Rr9zTDZcSLfnX2DOf9iFlfiXG+SxJrlr8U/w3JRfH8Fr
	CmPYXyGxgAhI/WA2bja16Xgbuiexy0wb8rU3maqhU3/Hjiot7HRT2YO+3GElOtUz3qL+m0M09PRRR
	PS9SYUAYvrBmIYG3h/ukyp/uDGsN/LJcd8vGGjpLj/BmX97FtVNWc012vSh1en7giozRoU6eGebYa
	FOji2zOnhsWg6TNLJivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjHx-00000009if2-14rl;
	Tue, 27 May 2025 01:39:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjHv-00000009ieh-0qSd
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 01:39:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so2286200a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 18:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748309970; x=1748914770; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VDNozsrR2jSMsPeRLEsbQiSRT/gvBoqtxW9ncqMDN1c=;
        b=PEsbuJ7GwFwp7yHelRi3S6RKw8lAqD8bbb10h+hM0hvlttO2rv6/nTcUEzmxIq8kkd
         y5dnpniw/iyDUDUt0zFHsSb6UJR58BwGtvYi1eblobOI9fCkn5oeGGQNSp82kSv6tz57
         5sOfy//f+k0DXI4UB1nNnmIaphPrmcUov6Wit5Vg/K9VKdG7AkUlP+q6WVeBDwdXe73T
         v5JDnAvyLRrsGfPKoWF3rxOSXsUXsLSGLqDikwyRFUMB4W3yWY7aP37SYmSvmP4CKG2D
         KDGNhtOIMM3slTP17GSKBeJ4UDHArE0mjTDEK/VadudHS2nCxCbmQcIUZsjZ0pNNsqYK
         iFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748309970; x=1748914770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDNozsrR2jSMsPeRLEsbQiSRT/gvBoqtxW9ncqMDN1c=;
        b=Bg+IiGz6fTADCvLeBEUlF4/IZODwmCFOxcRM1tRqUWQLsr0vgZdFx94jxdhbEC95Qz
         0pLE6wr2kOCz4+0KXt0VjQnj/yD72of8is69aiWk+ihgf9rqvg40zTpIz+LJXyWUVfug
         9dy9SvWHYifXrPXChsIGh4Jmo2XXeHMmE0CR36WOwrrZ2dlzkA0D+xKHAkn8voo01g6W
         nBjBbleK7yS2XRnMZvULDv0IfTx7M5U4P1HH9gxAp6MbkdpHkUQmT6c10KRGN3RRAWsa
         Xt4+9rZ8DK5qawKDeuTSk/R4EZE2G1vmA9zKzTRDWvs2phEjOSYEWokqfhFWPztemL7t
         TQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlQqjwcI/fjWFX03qXksmxt6BcPubFDL657qTCcRalJfcYR4NrWTmBwcyKY7UgpCeLlxAXjW0437Zcqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB7O/UpX4bk15LUxaDz+KEaagQNfFi/RrCONDyaAJN9YyYHNbk
	sjbzd0vlLBv1PByMl88MmOOsFkWTU7Cu6r9ADmHC5srSKU3QNxubs9GP
X-Gm-Gg: ASbGnctm+XTLNBEmyrN7ZCwADr7A19e5+CRCBwFsnIxH3NvcOEoq0hmtCn26wRBRbIP
	qFL8cs9UbJcvz8tXrJVy+rUpGnXdQz28/uy9g653aL+aFNtTZdvrlIvnUUlqzfENFLnnYdvIvrU
	lN0j8tQq+elJ4KSon8zxAcn64lQ6pDXAq6qqGFxBbAVl8vpWbyjhmrPO/KKR7vlqQh0euhdlTxi
	A36hW9OlKW4G89GVSVs7lol4MjmPeVdWT9BA4rYurfRy3N7RwYDN2kF53Ft2k9iAi8HC/Jp4fPC
	46wUsG/QRouQuuwswxPxqn8EoPtE9h5ZnaCiCvvI1nC/wwX3IdSu
X-Google-Smtp-Source: AGHT+IGzgYNAetOKbrBA2x3zjBOyZOtZdfZqboKJVQp5aeYbfVjV0GoXSJ34C2w9Vc7NbtGJRSMbww==
X-Received: by 2002:a17:90b:19c6:b0:311:9c9a:58dd with SMTP id 98e67ed59e1d1-3119c9a5c6cmr2714876a91.13.1748309970134;
        Mon, 26 May 2025 18:39:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30f365f3487sm12933296a91.42.2025.05.26.18.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 18:39:29 -0700 (PDT)
Date: Tue, 27 May 2025 09:39:27 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] pwm: sophgo: reorganize the code structure
Message-ID: <srj5sbjuxrbbdyl7rk553ya2jm7icujdxvn3ecrcdh5enu74ze@daedkuqpc2g5>
References: <20250428013501.6354-1-looong.bin@gmail.com>
 <20250428013501.6354-3-looong.bin@gmail.com>
 <l57yh42pb7cfbnk5z4zo473vb5pac6t4hnpg36m3iph3og4wom@kmd35myokcgp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <l57yh42pb7cfbnk5z4zo473vb5pac6t4hnpg36m3iph3og4wom@kmd35myokcgp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_183931_249328_4A5FC7CE 
X-CRM114-Status: GOOD (  27.40  )
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

On Mon, May 26, 2025 at 04:59:34PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Mon, Apr 28, 2025 at 09:34:49AM +0800, Longbin Li wrote:
> > As the driver logic can be used in both SG2042 and SG2044, it
> > will be better to reorganize the code structure.
> > =

> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > ---
> >  drivers/pwm/pwm-sophgo-sg2042.c | 62 +++++++++++++++++++--------------
> >  1 file changed, 35 insertions(+), 27 deletions(-)
> > =

> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-s=
g2042.c
> > index ff4639d849ce..23a83843ba53 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -26,18 +26,6 @@
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
> =

> This seems to be still correct? Why remove it then?
> =


The following "#define" has already expressd it. For clarity,
i will add it back.

> >  #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> >  #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> > =

> > @@ -53,6 +41,10 @@ struct sg2042_pwm_ddata {
> >  	unsigned long clk_rate_hz;
> >  };
> > =

> > +struct sg2042_chip_data {
> > +	const struct pwm_ops ops;
> > +};
> > +
> >  /*
> >   * period_ticks: PERIOD
> >   * hlperiod_ticks: HLPERIOD
> > @@ -66,21 +58,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_dda=
ta *ddata, unsigned int chan,
> >  	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
> >  }
> > =

> > -static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> > -			    const struct pwm_state *state)
> > +static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> =

> This is not a global pwm API function, so please stick to the pwm_sg2042
> prefix.
> =


I will modify that, thanks.

> > +			      const struct pwm_state *state)
> >  {
> >  	struct sg2042_pwm_ddata *ddata =3D pwmchip_get_drvdata(chip);
> >  	u32 hlperiod_ticks;
> >  	u32 period_ticks;
> > =

> > -	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> > -		return -EINVAL;
> > -
> > -	if (!state->enabled) {
> > -		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
> > -		return 0;
> > -	}
> > -
> >  	/*
> >  	 * Duration of High level (duty_cycle) =3D HLPERIOD x Period_of_input=
_clk
> >  	 * Duration of One Cycle (period) =3D PERIOD x Period_of_input_clk
> > [...]
> > @@ -123,13 +123,16 @@ static int pwm_sg2042_get_state(struct pwm_chip *=
chip, struct pwm_device *pwm,
> >  	return 0;
> >  }
> > =

> > -static const struct pwm_ops pwm_sg2042_ops =3D {
> > -	.apply =3D pwm_sg2042_apply,
> > -	.get_state =3D pwm_sg2042_get_state,
> > +static const struct sg2042_chip_data sg2042_chip_data =3D {
> > +	.ops =3D {
> > +		.apply =3D pwm_sg2042_apply,
> > +		.get_state =3D pwm_sg2042_get_state,
> > +	}
> >  };
> > =

> >  static const struct of_device_id sg2042_pwm_ids[] =3D {
> > -	{ .compatible =3D "sophgo,sg2042-pwm" },
> > +	{ .compatible =3D "sophgo,sg2042-pwm",
> > +	  .data =3D &sg2042_chip_data },
> =

> I would have expected that checkpatch doesn't like that. At least I
> don't. Please make this
> =

> 	{
> 		.compatible =3D ...;
> 		.data =3D ...;
> 	},
> =


I will check that, thanks.

> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

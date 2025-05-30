Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF63C5B552
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+OQ9/GMNeZY81ZMNErrNbOdHnmSzQRZEFA1BhqyGGo=; b=ra13MjD/eXEIPz
	lVJqrBIqr82Dv2QAyo3vwX46vN23J5nsoSDHzlZNG++sJjKn42Vj/f+ToGd7VzMyfctut3UbK0UaC
	NQVkVFSPvIYQ4dPl4Y6RfOCkxp8cNSpdhsFae/kht3Y99IIwBUklBVrCdA1ucG5nmHb6gwc0OxxZ8
	IbfJYJC6AsuSk5xacex7twZmE1LJx3pPIl80QyqxIRbWTrnOIBDwZMkqa/5CmdZfoVxQtvoTgohd4
	fQJdkALnZj2QPUyTzi7ZNDJDLOeM6rEn025ur5S6u86HtPtspeG8rdOQ3N65e4LNZ2ZGVvI5rXmLM
	zbEAr4Z2rieRXLd3oTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwOK-00000000DQG-1i4H;
	Fri, 30 May 2025 09:51:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwLn-00000000D2l-2DnG
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 09:48:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22d95f0dda4so22732595ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748598510; x=1749203310; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ookjxClzf4cQCEvAmXl0RF2BomztovFb9LfDcMb8UFA=;
        b=X69q74snxjtkas1YqLflvU7dlMTyQaLMNCBG4ILVAIRVl8KnzFnCG1mMam1KrvFV92
         zRMlM7zqIpduTokNQqtDWLzKowNETZLMC6AMM3KupvE+cHQO7kEetb1W6fgkAbhXZWen
         Gd7zTmP8ltW1Nxo90rdkxwpvEW8rbXPHgFLH5/Kcn3NsTQWTxk6UtKEwK425F486JacM
         vjOJGmrF2eJdhbu4BcxyF5BGj6crVc461Xsy3foCvJBYxG6R5THtf15tCUKqZxruVTMd
         7ksYLtF1j1V93JkEnETI+zasZgZkwVjlkylPHh9dF1qUdSmp1HnQYt1zDwKx1wERt4kb
         Yq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598510; x=1749203310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ookjxClzf4cQCEvAmXl0RF2BomztovFb9LfDcMb8UFA=;
        b=n79VlHXmtLV4Qt6qvo4iOgbGJDmGF3GoReaZqI6mgFPNALZmptO8KYKUhpftN/aLQ2
         48yTOCKYJM+dYDATOwG2bBnvpcpLygW550ErjBhRg30GqRgWQ60ymK8ck/lwNsFjH0IY
         JZUCxRtgQPAen6IJf1wlXPpkZn375CglAC6cycMiRNARPXpwZiSgW/U/T36HQocOYLqk
         oN6a4E2SZEu5tpK9/OQknICyqsie2MLHuDs+lEWAQYhFQAj0mX8SpUQcqIrp6UfFybC1
         tgfwPMmQhfettTyDe745T47c+SUtLsW/00GtFo7P5fP2H8nvbbBs8X5pFOfU+dCc0wGj
         QynA==
X-Forwarded-Encrypted: i=1; AJvYcCXyclusG/nmfvSV1ZOJtgUELFb6bkcerjQGm3K98iKxTuS85MBqLzClTRuD4rZ2zpsbbAV7/3g2pwjG4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ii4TsZKSiVmOMNuM87HOqkHy/xlVBSHgNk1v7O6FKv72FPls
	LGK3PgDOt+bJ8CjC709/6MAvNPTI4NGqLLXsnVk7tQxHUAd+elTpIsuP
X-Gm-Gg: ASbGnctVPpla+Tzp/hXUvDlJvmC+R3UugH4R1dzhcKfynjpGzy/X8BOLqta0lfrXBcS
	0kF7+pJTPHMMb6HTqWU1bs41RW8Edombiid4bK5zwxuLrgOCPTaikNUwPbnCFkMv1OMoBaxr2xg
	owpIsKTsp35W4+5gNRp83Cl9g1WnlH5SMSY9YfTHUqX+YSMGY674I6JCVYZ0oGMDEIWhO2tV5f7
	Rd4znEmU6QunGMZ3ZAt63Dwm3WqlYonq4tl5WDWWFkQGHA/59dQFmiSsvR9iklZZDc0uXotQHtb
	5yzUZ+dhqbjTtLNjcCwom7XYDuiWa/B/9cfuWSZ/T6DPjJSJNazc
X-Google-Smtp-Source: AGHT+IF9sCFOftJujauKnIRomaigvG8t61Ftfb7NDiYEGkXgDAJ4CTIfsKr0q6wuZJOiHiCtJPc22g==
X-Received: by 2002:a17:902:c952:b0:235:779:edfe with SMTP id d9443c01a7336-23529a11512mr38942725ad.43.1748598510306;
        Fri, 30 May 2025 02:48:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23506bc8483sm24863795ad.1.2025.05.30.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:48:29 -0700 (PDT)
Date: Fri, 30 May 2025 17:48:27 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <oo3pevzuyhrsf7t2ja7mxytaxhnthfar73iwvqxgawr5gjiudf@hbevzjog7akj>
References: <20250528101139.28702-1-looong.bin@gmail.com>
 <20250528101139.28702-4-looong.bin@gmail.com>
 <azf5lzfkegr6wt3mratxra2mlfah45dc3comtkjbrbdzf4x5xc@tlzxp7oqtcfl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <azf5lzfkegr6wt3mratxra2mlfah45dc3comtkjbrbdzf4x5xc@tlzxp7oqtcfl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_024831_573768_DEF8A801 
X-CRM114-Status: GOOD (  23.35  )
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

On Fri, May 30, 2025 at 09:50:25AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Wed, May 28, 2025 at 06:11:38PM +0800, Longbin Li wrote:
> > Add PWM controller for SG2044 on base of SG2042.
> > =

> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > Tested-by: Chen Wang <unicorn_wang@outlook.com>
> =

> Nitpick: Make your S-o-b line the last line. This way you document that
> it was you who added the tags for Chen Wang.
>

Thank for remind.
 =

> > [...]
> > +static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> > +			    const struct pwm_state *state)
> > +{
> > +	struct sg2042_pwm_ddata *ddata =3D pwmchip_get_drvdata(chip);
> > +
> > +	pwm_sg2044_set_polarity(ddata, pwm, state);
> > +
> > +	pwm_sg2042_set_dutycycle(chip, pwm, state);
> > +
> > +	/*
> > +	 * re-enable PWMSTART to refresh the register period
> > +	 */
> > +	 pwm_sg2044_set_outputen(ddata, pwm, false);
> =

> I'm astonished that checkpatch doesn't spot the wrong indention here.
> =


I re-ran the checkpatch but no error. Maybe there is something wrong
in checkpatch.

> > +
> > +	if (!state->enabled)
> > +		return 0;
> > +
> > +	pwm_sg2044_set_outputdir(ddata, pwm, true);
> > +	pwm_sg2044_set_outputen(ddata, pwm, true);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct sg2042_chip_data sg2042_chip_data =3D {
> >  	.ops =3D {
> >  		.apply =3D pwm_sg2042_apply,
> > @@ -142,11 +215,22 @@ static const struct sg2042_chip_data sg2042_chip_=
data =3D {
> >  	}
> >  };
> > =

> > +static const struct sg2042_chip_data sg2044_chip_data =3D {
> > +	.ops =3D {
> > +		.apply =3D pwm_sg2044_apply,
> > +		.get_state =3D pwm_sg2042_get_state,
> > +	}
> =

> Missing , after }.
> =

> If you're ok, I'll pick up this version and fixup the two code changes
> and the order of the tags in the commit log.
> =

> Best regards
> Uwe

Thanks, it's ok to go.

Best regards,
Longbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050C7D1953D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBnOGBnpEnnO+AmmdQB1ocvIJpeiBVc+f63XxMy2UZ8=; b=oyOQO9stscXir5
	i2k54+rNyPKltOuYTt5pq32v8Egjd+llLwpJKyFwyMqNg7ciXQ139CG6bQORddi+OUjHid07ib7+M
	yoIJm2FbiXKnvzA0iaIJCtjNOVrDpU51iUfR3B1y6dDf3CFsg/DO2B429SR/3JoNW7AXAsaNKogPI
	GIrr41EoWwt+noLIPwaQUcEe1tPlj4j9Aso5u2QEu9dULs7V9WCwrNUQTw2FSgU4bNYaLOqCM5m32
	hOeQdCYAsLt7dfLJb7MtLyduWJDtJBUmNuGput93ExsTGTm3EZVgchTTsV2fb6nc7C/SOlV08lW8G
	5r/GOZT2IUFk9R0p1vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkjC-0000000EVcG-2GkN;
	Tue, 27 Jan 2026 15:11:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkj8-0000000EVbh-0B5x
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 15:11:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so66282155e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526690; x=1770131490; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiYOJIssOgLGJ3sqVKfxdywenJ86qmXkRu/RSeqz5RI=;
        b=JCaiS5e1yb90FHs+trcr+5F3U64pTKLwUr3HmeArakXfQAMA+Wq8YS5eLv8VZyVTfo
         TR94TCcpzle5v2qoxrLNZcim0XloeozjwyTQcRCx1i84Npg10dPxF0qLAZQRcyUIovP/
         lCSNnl814YP0Oiq6EJIEHKB/Q0btbHxyjWgD+fJBRdMhpBXyzTTYVR5LeCzOcx4g7k6T
         PVefY+7L614iG/rtaVecA1R6/rTRjxRRZO5KNrmQ9e/cPyexKMQ6HX00aioRtTFlbglp
         RGcCmklrbt6qoTk/d8C9t4B2ggASoTjJ2PrKusM8yO/+FkR4ww7pHU/6lS2hM8h9RHjf
         HsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526690; x=1770131490;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiYOJIssOgLGJ3sqVKfxdywenJ86qmXkRu/RSeqz5RI=;
        b=gt5zvYeDar0oD8mOVyKQfZLlvfbgsuYY++tFm7wWl5i4z2E6yPmav0gGGugZgmgwcs
         ac3Et/cCcFKlmISTEPXIEMnWur5/ULipA7Gd2hxEJ4icT2tyQnQLUQ1jjpZEi/ED1bsj
         f/0iSqKAfY2C8Sw1Ar6Q/ZtJWw0f6GrTJpqNVxpinyLke/iA/jk21IsNMvJpMjVIDEk/
         u0hz8knFlOtL39GjfqZmPreTRkIzjwNOwHulKqORkK5wf/+lBJ+rY9l1PcRpJBYKwn7h
         3D7ji1TxBskVA6TWf1mYuLaxdw2EbqT4ND3Q6LYcBQVHrEfiNxYzBZgv8A9lvWS9/o8U
         NVDw==
X-Forwarded-Encrypted: i=1; AJvYcCVLne0Xd96DQDUW5RaHI/ogCnUCFMxldg6zgqhzvkglwlPNBnJ+5nLE+hbUvWCGxWRZJVA5fZJqEE0lsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDq5GK3aUg3OeuDyft2osLW+TVG0KTFoF1se4/7Kjojv5Do2KP
	c1hhut5/8btZEu8uvR0ylmD9Zhbhys9HRXYTNjMAOrmqir6Nrdnea1YH
X-Gm-Gg: AZuq6aJG/aDo7erC5eXc+x1vXtD9Cg6ZXnZqryBph9SmXA8HEt50HpRucbDS13bIXn8
	H0k2twn1c91SnzmQjDd+tcACRXiCiPWOhCx6HZTkRDeHDWswaHo/DbeJDBpkhPT3nJgYLr+DDdo
	aH2fVHDbzUj/jJ4yeywGdOlHOigAVL/n/DJW/EwpKQIYmuY5z3l11+yMiuFbZyqcrthtu/KZnv/
	MGPJSypkCivy4m+Hx3n0Cj+dd1We42QQ2qAwFWSmn2CspbIP/+//K2L9xTOfHm4CH5shr9Aeee5
	CeO1vHh2kjUf3Nl+MaT16AviIlVeCu+SEXSdPhdCR3yWSbkCyEx9XXxTikcNxX23OD2BR4c4yfB
	g+0p83wI8vzMbzM8h0EVisuq4UpBMuR5wyszPs8TpLNDSwjJWD0UJuN1IpzDfJxtCOP7pnj4IDn
	5fo5vy/9e55O3b04KAb4EKBqKiPsXsjY9JSq+g+Tk/hNDdaV2LiXaY9yY=
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr25187715e9.34.1769526689995;
        Tue, 27 Jan 2026 07:11:29 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7623sm63589915e9.2.2026.01.27.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:11:29 -0800 (PST)
Date: Tue, 27 Jan 2026 19:11:24 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <aXjRx12yPA7QflaF@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_071134_095977_18834C7E 
X-CRM114-Status: GOOD (  20.12  )
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

On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:06:07PM +0400, Anton D. Stavinskii wrote:
> 
> >  	help
> >  	  This driver provides an ASoC codec DAI for capture and basic
> >  	  control of the RXADC registers.
> > -
> >  	  Say Y or M to build support for the Sophgo CV1800B
> >  	  internal analog ADC codec block (RXADC).
> >  	  The module will be called cv1800b-sound-adc
> 
> Extra change here.
Will fix, thanks. 
> 
> > +static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
> > +				 struct snd_pcm_hw_params *params,
> > +				 struct snd_soc_dai *dai)
> > +{
> > +	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
> > +	int ret;
> > +	unsigned int rate = params_rate(params);
> 
> > +	cv1800b_dac_mute(priv, false);
> > +	/* minimal decimation for 48kHz is 64*/
> 
> Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> probably be a mute_stream() operation.

I'm not sure here. DAC mute feature was not implemented because I don't know how
exactly do that. The public documentation is very weak for my taste. 
This call added here to be sure that override flag is
not set (override feature replaces the output by setting it to constant 
value and ignoring the input, so it is some kind of mute from my understanding. 
So ensuring this off is needed be sure that DAC will output our I2S data). 
What do you think will be better to do here? 
I'm sure that is needed, but may be better to move 
it to some early stages, like probe function. 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

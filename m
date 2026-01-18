Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB24D4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BpP5uidqLVTkbKpLqwIMCBdY4lYjRI2IiSCI4y01qs=; b=DMVZcbFCcG0PjB
	JrDLLeInGoADdPJv7DtW98+qGCZPrH9PTNezk9UJ3ANfCtixu56/KCL/BisIppBmJKPREtdK+7qwn
	dArp+SS8VIbHDB/GCCQahPOfjbzcMgmt+9ivkkRbUNhAWfHsGTcV1aEa17BgZwD807IcqY/kmbD3P
	Vlx8Jy472WRxV+KE5uU+DtgM+foizt3IhBhh02pMs6Qi2s6vfFO1WQ0M3nltd8yAa7c+i232Xh5J8
	SNpX3xGi7fJcaE+eFoYIweWa976D00ysKoMKEBDh0WP6sww5o++U7bjHyBFfTr8tNK92e9qkx0hZI
	uiiat1eA4RzaFHiiUxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhX0R-00000000e0V-0gB9;
	Sun, 18 Jan 2026 17:56:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhX0L-00000000dzN-2Fmm
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 17:56:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so25513805e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jan 2026 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768758959; x=1769363759; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmufyVTFi2Nm8r9yuM1MA+Nz0GRNSPj6jIbhD8ad9xY=;
        b=R3iNpo6yPqeRHKRzm6sDhw9Ab0eu7uI68by4eihiL9Gg2KOYuF4Li0NHD+RQj9wMCS
         GRl4KoqOqLDIkl0+GxmAfDKIwttsn4VPnXiAK8qmER9KU0mP91WyB3j6RfA5EKav4luC
         tJ0iLsjp3o1hsUxCzS82nGkIN+TY4bZpAMdQBwG8UA51aCWFau0nYrx4Zgf/6pOBkRMC
         J8/kiOnwPifFMPt9H9MfnyL6wqV4Ugx/7dwff3PypIu6NplOKKKrUGXe3BXK1mAxytEu
         DQGREFGxmy3EKATGrNW0YEiYvU1tqHHbwI0HNC2/o1oZTTwsQsrKdqbcuUk57gK6tIOP
         kGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768758959; x=1769363759;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmufyVTFi2Nm8r9yuM1MA+Nz0GRNSPj6jIbhD8ad9xY=;
        b=AEZaZcu2lfzLVOB8BuiqIt0OOPvFGyKahCTTdC3q1L4U67xKYnar9+ldlTYF36v0lU
         B7E3a1F1Q3D0n/4R0mjykwJ329lbKGVsRkhI4C2cAC+YO8vcqNucM8CjZshOVH+Qwgel
         EzZ7Qz22sjOtAgmhhMQTnBiaAKvd0I0Mu71cDeMZzanMUlJTjYRqFgjxWbT9IKAh1w6k
         Q2eM6nPZSywL+0grrDVNUaq1GDBdWegNQYLqmpztvQ2TTNNu8lMUX8/Yi8kzsq1ZX5gP
         t5/PszMs2uMiyUME462kb0yJKNPAjne5uXowxLwRAIaq3dICD65/Rt31fldMan6mzYva
         ZEvA==
X-Forwarded-Encrypted: i=1; AJvYcCWEu8/D2A10BnYY8QUPQ/EIWFbqSStGJTTQDhf3r7aeiLiEzBwZ866g1iTRz3Q3xz+oSRF8hScx5aSvoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfB46EE0PIqO2isNg0YZXZzcoOWIMbmSlQA3L3D2dZx+XcYZOr
	yiBn4w8QMPeUKY0PBaAht9IZG7levQl0vCJY85VqgkDITnAAg2tgqODG
X-Gm-Gg: AY/fxX4R4r/8TA2Zmr+jU7Q7whFuUgxl7Ovz0tuTpQeuBpXZAVObZ+mPclNA2Jl9mtk
	bAnx9/gaF6ionxlflgVdMyOImH/5Sd2+/l0E32bI1HCDFL3D0g2BLyNAqaiTrSgnSYZJpPP2rJu
	M6SVw+PaizewCxtoX9teGKhi7Ouao3VyhvmkaNutKF7GZw+Wk6qHzc+eENiWoPFK/yZ6z+lEn3M
	buIl4/KVc8VY/HSrInAmblyYbYX155cRuBghuEnqdM1869HXAk7xEAlM8SLC5mzVbux6Z0M1GeS
	Wz2u4w3RJh2e7t1y/y6XRQZsGHuSLVsxyTwj+jgEYxwJXU9Q3rOpBxM0zNt0jL54OCTt4cy2h4g
	ht7FZvgrvFsqTyCkkolzTMJW9prbRfvpe05Dt/B+aMu+wA9X2Ji/6Pgxj99mTtXx28fhJDIIODp
	tT3UlI+ITLDlbzAoK3u70pZAl0LCG+2UMDNVQY7xRsybA=
X-Received: by 2002:a05:600c:1c24:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-4802590e305mr97146725e9.14.1768758958917;
        Sun, 18 Jan 2026 09:55:58 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d90b3sm154086955e9.15.2026.01.18.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:55:58 -0800 (PST)
Date: Sun, 18 Jan 2026 21:55:53 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aW0a9e8Lyv1tu-mZ@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
 <20260118-famous-magnificent-peccary-474ba8@quoll>
 <aW0SikDtd0HIrT4v@anton.local>
 <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37bbd795-a0b1-462b-bf0a-2713f79ef2b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_095601_866614_436324E7 
X-CRM114-Status: GOOD (  16.85  )
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

On Sun, Jan 18, 2026 at 06:32:24PM +0400, Krzysztof Kozlowski wrote:
> On 18/01/2026 18:07, Anton D. Stavinskii wrote:
> > On Sun, Jan 18, 2026 at 11:14:34AM +0400, Krzysztof Kozlowski wrote:
> >>
> >> Please use subject prefixes matching the subsystem. You can get them for
> >> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> >> your patch is touching. For bindings, the preferred subjects are
> >> explained here:
> >> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> > 
> > dt-bindings: sound: sophgo,cv1800b: add I2S/TDM controller
> 
> No. Read again, I even gave you DIRECT doc link!
> 
> > 
> > Is this anyhow better? Also in the documentation directory should go
> > first but I didn't find such examples in git follow. 
> 
> Huh? How so? Where are you looking? 99% of commits have correct prefix.
> Where do you see sound:
> 
> b7d53fe53cb5 ASoC: dt-bindings: rtq9128: Add rtq9154 backward compatible
> 35bffbe49dfd ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
> 70d95c5d2081 ASoC: dt-bindings: rockchip-spdif: Allow "port" node
> f66e7da2a6b1 ASoC: dt-bindings: realtek,rt5640: Allow 7 for
> 101b982654ac ASoC: dt-bindings: realtek,rt5640: Add missing properties/
> b540b4e157c4 ASoC: dt-bindings: realtek,rt5640: Document port node
> 25b858474497 ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> 66b47b9c069f ASoC: dt-bindings: realtek,rt5640: Document mclk

Sorry I'm new to this and learning. For some reason I thought that "binding dir" 
in "<binding dir>: dt-bindings: ..." is actual directory of introduced
file. That is why I said  couldn't find any example because I didn't
find anything with "sound:". Thank you for clarification. 

Got it now(I hope so). Removing sound, adding ASoC. 
Also the word binding removed as you told me

ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

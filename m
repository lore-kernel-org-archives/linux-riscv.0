Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40236C369BD
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDuh0NMOK1zKXYceyVRVOpCT3zFO8BWPR+pY2pHo148=; b=BQYVGlqFMtp2BR
	WOlt/CLLmkM7C5DWr1hvfoVY1MQh04Nl5O/Varw9ldhJoiUHTI+X/6yQEO7ZZfaUFF72xuOsykK1w
	WJdmd6I0mc1etDIwys0RsEf4URdnE0NpTQdQxfGSoOk/N4BzgbAPvTvwvqsCzCo4KPAIrY23Tdg3z
	tcY78xxY2R8UYAYFb5Ub3x2wKp5OeOTtvxcAJgJEghmpbrkLB/iZ92ey1hAXNXsrVT13r5SCil9FK
	xewxedIdqvSF2SGanrth27MOoLcoqox323FvRqj6qytePUGh7o/f/BcYFZjwhNYQhTwUrOSBe0Ckr
	pChR1aAllV4BH0pqv53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u62kH-00000000zLA-1hQC;
	Sat, 19 Apr 2025 07:36:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u62kF-00000000zKP-0d7B
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 07:36:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c3407a87aso39105715ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 19 Apr 2025 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745048170; x=1745652970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VbNMv8EcDVNc7S53ITN7O5grQN0Xg+vZe4s9ox5YAkY=;
        b=fGlTzxPyRFLankF1mgaMH6xVpRtdz2plNEvFAPfe7Y8zpr/MgKnMZCLm0mXtm3JIcO
         UdZOTZu9gAHIEgOz9WmOQMUjgf/OFE3tHIOJYtOKXtD5KN7spsuMK5g0IvcEnJuivvRH
         w+kL7kPV9n5QPNyRyoCZgpgsuHBJ3ygs+i4bBMMsuCVmGaDTVg+p0xY6N1tMr1GzB6hs
         iiKDfLLxWtZKKRI+ixBis47P8XKqy9jF4spsOWd2yAqpHCMrjhoGGS1c4awV1YMiXllx
         gMDOEklAMPpiSJ7ZzJfc/EDEuUgsRdR/gG1Ajczm4hFDGGPxG7kFktnhOnfCGFF2eJLo
         bJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745048170; x=1745652970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbNMv8EcDVNc7S53ITN7O5grQN0Xg+vZe4s9ox5YAkY=;
        b=lCYAAFma6uSFXb3C3fNFhQrJq2hoHnqYtCRp2A8yJ1/SXSuPG1kb0+TSMiiUL6O1nQ
         HRCOs1KzGnSG41wlOiLAkMEe43p2sBuypWIsAWeTCIJjGJMqAxrd3vOAJnC5sVbcyxsU
         3+ePzXtScFBTJa4rqpFAyZE7etbKsIB1vAyxNaf84ZvaQcpL25NQrq5+pm7hvxczL8AJ
         MQFFedZ1ozo96GzN4xVnu+Ad1YAsJv4kaz4YdyAyavVB589oNuCG8U0cn3CLyVNA59Wx
         S/jHJk9w9qpsDhg02BwCXdFjFGzMTKDQ3NESHKvzDuhAwZ6TmPHJMjiww6Om1V9EY6GH
         FREw==
X-Forwarded-Encrypted: i=1; AJvYcCWNT/n933txuqIqgEMnEgy01sA5DjJ7JbdxJVod36FDq10bO7klB+IaMqcW568yJpgDQmj12IPtTFhwQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdRk5I/WIvkaqFPJ2od4Q9AwKYY7eT3eXR9/C2voKqRo8wNaD
	SDryMLlpKbzIypyMxj6XI/41hUJupx/mw5v2vC3Yn+BPlvOFb3PY
X-Gm-Gg: ASbGncsuM/98naME4PAyd1zK2KusCCjVIBZJ/HqFa7hxQvhWm7guKwrbtvlaw7rSymG
	SwY07TRBeICXVsynNfn/j9dI+dbAaI/SPKUVhTK3DWBAsM7mpRUCwQtXQXyVG93Fn+S1iQtT1PV
	J3rNeWZgJPPHDnz2qu264VQgONshwFqAcBg053PloRJF6bhPOq2wgSRAJaVIxUJXwNaK+t1qHQh
	gsFNgG7PFRhW5T41e/XXehjbvin1zOBADOZRMT9jhttM8t3Q2XXOk+C5Cc4XtiFLfx9vhVduWVx
	SxtNlH59FNNjT62+amCX/GX6Exim32maAntXYxAmLg==
X-Google-Smtp-Source: AGHT+IE8gk3khKs6q2QV88hzoLFK8V9guTrvMWRFQ6JyDLTYcHlv4zmRal3/vUFMXM/1CNJJOpJ0+w==
X-Received: by 2002:a17:902:e549:b0:224:376:7a21 with SMTP id d9443c01a7336-22c536076f3mr77627655ad.42.1745048169844;
        Sat, 19 Apr 2025 00:36:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50ed0f7asm27997115ad.169.2025.04.19.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 00:36:09 -0700 (PDT)
Date: Sat, 19 Apr 2025 15:36:05 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <pat3f5nc57uo6p7vwmlrky6ezxhtn3qldmx3falmc4hv5beyyj@r2jfmuxtx5pi>
References: <20250418022948.22853-1-looong.bin@gmail.com>
 <20250418022948.22853-4-looong.bin@gmail.com>
 <MA0P287MB2262E14F6F9758646320F7CBFEBE2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262E14F6F9758646320F7CBFEBE2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_003611_207174_5CAC8905 
X-CRM114-Status: GOOD (  19.56  )
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

On Sat, Apr 19, 2025 at 09:24:23AM +0800, Chen Wang wrote:
> 
> On 2025/4/18 10:29, Longbin Li wrote:
> > Add PWM controller for SG2044 on base of SG2042.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >   drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 87 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
> > index 23a83843ba53..26147ec596c9 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -13,6 +13,9 @@
> >    *   the running period.
> >    * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
> >    *   be stopped and the output is pulled to high.
> > + * - SG2044 support polarity while SG2042 does not. When PWMSTART is
> > + *   false, POLARITY being NORMAL will make output being low,
> > + *   POLARITY being INVERSED will make output being high.
> >    * See the datasheet [1] for more details.
> >    * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
> >    */
> > @@ -26,6 +29,10 @@
> >   #include <linux/pwm.h>
> >   #include <linux/reset.h>
> > 
> > +#define SG2044_REG_POLARITY		0x40
> > +#define SG2044_REG_PWMSTART		0x44
> > +#define SG2044_REG_PWM_OE		0xD0
> 
> SG2044_REG_xxx, the prefix looks inconsistent with
> SG2042_PWM_HLPERIOD/SG2042_PWM_PERIOD. Can it be unified?
> 
> The others look fine.
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 
> [......]
> 
> 

I will rename it to unify, thanks.

Best regards,
Longbin Li

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

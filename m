Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09743D5B161
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 05:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTP62E7ixH810BDPhQ6AczlHJaSb90IRYtaxGgYIHLc=; b=xRTbFULvyALfsi
	Sot4DwKpdjebXTQ4wuYKEaPEMt31JzOqezl8L4+AxiCZGEOnmcI17IzjaRXRQZyS7Yd9MsTK7ZyaL
	S3PZAXgAsQ9Kl3PPe42Fylko/Ah95Vja//tmN38946ohGnFWipk7qbu8bus9hVMKWu+otvkyPDzJZ
	cKhEvknPGEvHs0R+O76N2KEAkFD7eFG+62wYy5R5c6Om60SDEyIrQyBB/cRJ1GvhVr5/jIKFMY7br
	f6usyEbtjxxOX2N5XMb+rd1rmJlvaHp9/XblB+yauPLhsn0h0lLiJnWmH3K+zw2Y1lXzHH45Jq0FG
	bwFMfY4tU4nbWOqLEiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNVf-00000004iGi-17k3;
	Tue, 16 Dec 2025 05:22:07 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNVc-00000004iGK-3TeR
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 05:22:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34c277ea011so3116775a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 21:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765862523; x=1766467323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0IdpBtg/JhdmjSRlVsZcTYVx5UhfvoA9V35JLo5kNg=;
        b=GUgy9BXP32giqmCnzyXoU5ZCfENRTUMzS7mp/vHGKxpsAKfnW7QE+89eS7Dr5xQib1
         076vgcP6lQipDFtQPT05YtsVfJnZheGfmLsJ9DzZC5DKKNONvdS7TQ34MwHj1qR9irkG
         szbibw1m+MLN2VTvle+wnTJ2cZx2lWfTXjFNuElM18FkGHw/v0uOE/L1YsTi3lKjCVkJ
         dEh71ts16f6ni0DMquarigspvkYVsxF1Lx8c/XS1g1Sepu535FC0hbAoCcBu+7ryv3Q4
         mPWYAsgp5vbI4zkTQylBdZdbhy7EWrPMb6wVACDXDPie0g0qq1wDQhZOq6CVWUbhCRNd
         YsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765862523; x=1766467323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0IdpBtg/JhdmjSRlVsZcTYVx5UhfvoA9V35JLo5kNg=;
        b=HVdRE02v4wUTxT13PBdii/900NuQ97wp1xz4ibGlj0L2AM0LsW487mUxcSxpWbczfm
         sFYlyll4LqEm9OwFG6Rgk0nOItsoOJup0YMnklJVMZNYRe3hUu79xtPzqrbdT+12P77N
         r1p1XoqbB/D/7b+6vj4iibecpSzBmz8ey/5EypCbSuURdxwrPfUPLFHDoXz9lje8jIs2
         ZEquKKwtaH4HpCeTwfhAMxwUdp/gugXMFFUzmYO0RNSlaXmMGceN/1QIFJ5GgqN6iWZ7
         oxnDqxklMPAkNwloGXmDDaXR3pH4PJiihFplC7h26mt3okv+2ZC87NRIyHLcjjcoVd1t
         77Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWf5IkOR0J8QTRjVcrpWNW+1UwA/tT/YmqSzX5F9vyajxt/khhll3KQ/Psyuyt+gnb8aLISoouqOF/tSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt3J4GhGLbAQHgnFL2VjWctn7my9ZsdldeWwx3dZoxP/8OS0oz
	ou9Maez9NAly2WuKIj3BHkP3SbctMZxtNApuV+uOvqYtwMdEqQhfBkNk
X-Gm-Gg: AY/fxX4tEykYOqE21a7vTZ6+3lCWxgiA6wUhl20TMcnuetzSoL/70ZBqlHHW52nJdZQ
	oF05KDfyp9jHKt9ZwH5MiwG47WbOBAnNG6BL+vhVRHXcTsKhPiMBVhSyQVgPXe1KPUGX7A2oAeN
	hNkAePk4y4z1vfdtifJi4sTwapJMRocOk2mxC5qDWc90iAdlSq/XL3VVN4a1SZnNWnF+WujKgkB
	+2ufFhzdrn4WLe5gHY+uPCdoIu29PPIwvP2dYhSYOnUKuS3Uugk8o4yjsQycgf9HzuZecLZo9lN
	hJdpUwfl9gSZGrtqE0ZuvDA3HJu+1muMdeFFspi5ERCixhi7uq5pQx9q1uO8pQ6340b5csRhLa9
	mkvUAVj3V41anZnfoMPQWgccFKRxubUImaNPYIx5XXc+wm4hQAySX3eJeXjsKBPEU
X-Google-Smtp-Source: AGHT+IH7rgc/KiTJTKPFRn//6KTwpo0aXlM6RPxFGdwYRhguaslwU6dfICFDwUD8TCCvmZpUxPVrDg==
X-Received: by 2002:a17:90b:1fc6:b0:349:7fc6:18 with SMTP id 98e67ed59e1d1-34abd6e0193mr11861601a91.13.1765862522998;
        Mon, 15 Dec 2025 21:22:02 -0800 (PST)
Received: from localhost ([221.192.179.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cd4bd9987sm109226a91.4.2025.12.15.21.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 21:22:02 -0800 (PST)
Date: Tue, 16 Dec 2025 13:21:56 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: alex@ghiti.fr, andi.shyti@kernel.org, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Message-ID: <20251216052156.GB6413@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
 <20251211073526.3164875-1-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251211073526.3164875-1-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_212204_873783_0E8DBE39 
X-CRM114-Status: GOOD (  25.64  )
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

On Thu, Dec 11, 2025 at 03:35:26PM +0800, Guodong Xu wrote:
> On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> > Add reset control handling to the K1 I2C driver.
> >
> > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612..64d817d8315d 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> >   #include <linux/platform_device.h>
> > + #include <linux/reset.h>
> >
> >  /* spacemit i2c registers */
> >  #define SPACEMIT_ICR		 0x0		/* Control register */
> > @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
> >  	void __iomem *base;
> >  	int irq;
> >  	u32 clock_freq;
> > +	struct reset_control *resets;
> 
> Thanks for the patch! A few suggestions to simplify this:
> 
> The reset_control structure doesn't need to be stored in the device
> struct since the devm API automatically manages the resource lifecycle.
> 
> >
> >  	struct i2c_msg *msgs;
> >  	u32 msg_num;
> > @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> 
> Please use a local variable in the probe function instead:
> 
>        struct reset_control *rst;
> 
> >  	if (IS_ERR(clk))
> >  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> >
> > +	i2c->resets = devm_reset_control_get_optional(dev, NULL);
>
  
> There is a new API, I would suggest this:
>        rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> 
> 
> > +	if (IS_ERR(i2c->resets))
> > +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> > +				    "failed to get reset\n");
> > +
> > +	reset_control_assert(i2c->resets);
> > +	udelay(2);
> > +	reset_control_deassert(i2c->resets);
> > +
> 
> Why you need to call assert() then deassert()?
> Wouldn't the single API fit?
> 
 Good point.
 
 Thank you for your suggestions, I will fix them in v2.

 				- Encrow
> Best regards,
> Guodong
> 
> >  	spacemit_i2c_reset(i2c);
> >
> >  	i2c_set_adapdata(&i2c->adapt, i2c);
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

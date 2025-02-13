Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F6FC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KaT5KUeoCmDb8JdC1sZGd0bhHcbLCGZwMbcBpMgYYw=; b=Iuu6NgAIh7XRpZ
	uK8pYdRBi1UVzLfCos/EoHOXxnyv1u7aDd7eFsf+/cvPBbdZyYftR7piMIdUpDiEEhEQgFbOZZTCn
	m/Rt2wG0VMthD+z3RPvnABakVn6R0i1pdsJOEJ2noKw3IXPhjjaHk4fF31DcKoPHy7f8VoceHVjgl
	AUUMgctBTqtmB4HA39cI1SFIuJUHDs7aoYMBd0hFIEYAU5gUmBeZurHG9uGd5IvmytbBZEfYcxTrt
	Okfv7f9F4OKiFUjxGOccGcJUVzI21rmUrUi0xX2B4WcQdx0J3ogwYtWNgAaIcDpkHVXUqiuW1PcQe
	Z6FwI0xaj0lYqBm0CX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYWq-0000000B25n-0ry5;
	Thu, 13 Feb 2025 12:41:16 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXQL-0000000ArTC-2Rxr
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:30:30 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6e44f9db46bso8565586d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739446228; x=1740051028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5SU/TBSujegWTvHaxqKdEWl78O7aiUl1zKHXvdMyNQA=;
        b=XGabJAbmQ1ltrSUIrlFu4U8zPx6AORgYp9Zpokx3fevxXnI+yxaSbVgxnktFhYKEd+
         YmVRJCVn6cCp8Ye5gYEmywU48ovNKjE/LsxEfWTgJk93xIHUinGWNaLwqvUZEGlsuvCf
         +ZGvVRsqqM2h8kHK6M4IQux2w+960/ZhBMxgdJnu38fmQ9fj7Pm0l+Qf6nmHXB0ub5Jh
         I4V9M9f8LuiqQvedtEKoHEp+f6x5v+UrG+tdYKp4l8oG+rZ3JhbTRpRRbc/Wi2LiwPbQ
         2Y0Yj3gTQGYn4yYlM1Q7YusG+DJOTMrniZf2mdniZebeSAu02nxQ8cmAGmpQKV3jnsjD
         Xq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446228; x=1740051028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SU/TBSujegWTvHaxqKdEWl78O7aiUl1zKHXvdMyNQA=;
        b=L3q4RPS4mgpRsNHmw7CFlCB1TMsxBQ8Ji61j+4JsSOZZRmRSooYbfNR8XIQTq/uafL
         /k80uSEgLUUrpZBSi33e3nYvHU0bdk49M78C8A9+Vi89+dJ5rBu+wJ29QX1AWNWN7kxW
         ZRkAI2EBPBg1rppwO+hDJ7/SzI7fsCnvhQW/Ud3HUzct/C2ov0e2rEZ75aa9rzCyh6zP
         jkAAxcI1k9isBGcrV0+i+cbLNqeHQdrm2xdlr8P+qf1XjCbvP6wXLx6GujHXPOebpKmD
         5YmUP3aSWiSUnqc5bcQEolcpmcGL0OZc1Ys7y6XGEnOTHZMobhAQ1tCKt4H/fn77QKaU
         6sDA==
X-Forwarded-Encrypted: i=1; AJvYcCVAaiHhIvi0BHlDhCZlXQEpy36VGQqqmje130Qd11TkcvNsJtIArgfYpUveiKpgHy1G1kJgo/Lktb/u0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykf9GaPTl1uRkrmLnYHRH9RXspCm8GE7lM1n1crQPwy70MCFYE
	IW5osG7VEY6BSxlr9qJ38zoQFJVhoqsjcfRSoepsCMOsnaVoS6bN
X-Gm-Gg: ASbGncvV99yTL/U84QFbwYNupOZhuZJpRPCvgslsWusScBcKwyOC/yT9E/whFpK5Kbv
	kRsPZ/Yt8FX7YGcal0UT0EzRRtgsPH5XyM+42lHPFsynHJOmPqf0y1HR8k6eGbg3VVKXUxMbK9R
	MW7qGwv0jlOIEHouodpCs+qpAFCIbYlBWm+hkkBjGkIoHuiIp9AqlcR4e23EBi19jTybntyrGgN
	SHj+sUBXgJPLiC5fyVkfvG3SxVHg+KyGMe8epVm98Z9kwwcY7wU7Ruiu8aYWB143cI=
X-Google-Smtp-Source: AGHT+IFQo684UKQQw1zozEcjISvHMyMr/bRuDRMBvz25ZEQiXj7LUIrkvbXFjlOZRa8EGwkbsJlG7w==
X-Received: by 2002:a05:6214:2aa2:b0:6e0:ad33:36c with SMTP id 6a1803df08f44-6e46ed77a8fmr112510006d6.2.1739446228388;
        Thu, 13 Feb 2025 03:30:28 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d7a3d2esm8068856d6.55.2025.02.13.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:30:27 -0800 (PST)
Date: Thu, 13 Feb 2025 19:30:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/4] reset: simple: add support generic reset-simple
 device
Message-ID: <lrbpay37sn6jfclfaozauqxp76wy6w4uft3a4arhpmluhi4kq4@6bev4gj56sdn>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-3-inochiama@gmail.com>
 <20250213-laughing-oarfish-of-opportunity-a575c5@krzk-bin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213-laughing-oarfish-of-opportunity-a575c5@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_033029_619962_9260A580 
X-CRM114-Status: GOOD (  16.78  )
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

On Thu, Feb 13, 2025 at 10:36:14AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 13, 2025 at 10:08:55AM +0800, Inochi Amaoto wrote:
> > Add support for generic bit reset device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/reset/reset-simple.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> > index 276067839830..a24f8fcc6a06 100644
> > --- a/drivers/reset/reset-simple.c
> > +++ b/drivers/reset/reset-simple.c
> > @@ -148,6 +148,9 @@ static const struct of_device_id reset_simple_dt_ids[] = {
> >  		.data = &reset_simple_active_low },
> >  	{ .compatible = "brcm,bcm4908-misc-pcie-reset",
> >  		.data = &reset_simple_active_low },
> > +	{ .compatible = "reset-simple-high" },
> > +	{ .compatible = "reset-simple-low",
> > +		.data = &reset_simple_active_low },
> 
> So what is the point of the binding?
> 

I wanted to add these comptaibles as a base to avoid adding
too many compatible in driver.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

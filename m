Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCAFC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csjK9cBkq+ns8s1a/ooM6cAgbwiXNJKNnX7UpHFr8so=; b=fnwef3iG7HZRMw
	5iIMnemGTFf9S3cFi1WnMdRVMHAZqSAe9SJuInbJM8U802s6+M5WyvqxerdSZkfSIRCZRudOKmkvT
	lT7N7xPgp7U4Ey+5i8x/MazrZaxwpko3YlTlxeGwD/KX80fwh9Fwf/cooPWygOxZM12uij2tOM3OL
	ayvHy+apTqiVauh0B0aQCy8czV6U0lhEE/dxvB1uLnN/vXTjoAvCu7RyIoj3DJaPUH7wSFlyTO4ym
	oe0t8xXOU0wmuZz2qMOAvRJF5bba/dpE8/BqBi68G53OuW28VpAmKrAKQtGu4bIxWjBipSJp1cc9d
	3djg9lbKKFiR+FOhRBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thLkf-0000000GCRp-34KM;
	Mon, 10 Feb 2025 04:50:33 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLkd-0000000GCQW-2yGt
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 04:50:32 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d8e8445219so32180656d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 20:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163030; x=1739767830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QkuLbjixmlTDNvcJ8QUfk7khmf2etpBL4zZ81Ms9yQ=;
        b=YLb7lSzYAH12mdwduVFgtu3I0zzAudC25pjIfzypYUkQaBhd4E/5+pRpkkSR3yQJtL
         q/FY2m9w8wdnnCJrKRZnxgHzDWyHJfaTJD+n8+TroVAgMhxu0Lww5ZkR+9GyHzbrVbrr
         xuhtAvhbM0+ZBViTaSRztN3SjkUEa9OazOcRNJ89xSGyltRrbTSq+uejsgOf+S815NNW
         /5IW4IzTWuw6bcSjfbOyqAJyMdjmPsg3XGLN+jATZ0qtQlUdGWqPo6QHW0b3k6nxUPcM
         LqzEOOQaQhBJAVzaL1rKbLpx859S0gEcbHAnfeS/3tTTW8dtPaR3j58R9MA8FnB/3ocl
         ayUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163030; x=1739767830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QkuLbjixmlTDNvcJ8QUfk7khmf2etpBL4zZ81Ms9yQ=;
        b=Zn2C3WdxdbVNmjW7Bo1rfBHvKxFlNGOhNEyPG9iSWk5huGrO9RMA9Cg/A7yjxwUqTs
         HU7r1UahHprRvJo1Mu85C60qJGZqNlcumM/e+4isneqkIajLbXUa0Qb9LLhWVx2eCpFM
         NfDIhO3s5WyCa0jzcqEcyu545J6uVZT2U9pLrxbWxmAMSdc3lxoVDATx89tsuOpKDpmM
         2Ps9LNLRistxibBW8npKxhrywcU1U3MoCOB1lRAj7lWFAgQFotAL7sFFciMOoVqO30+M
         plTzneD2YZYcMjbRRH1awZ/s6vLXsEaKCZTUtlOGKKE6AAWKiDCRe9ryvYIehlHfOWby
         WQYg==
X-Forwarded-Encrypted: i=1; AJvYcCXYs29XqMx/61O4Ckbf+uBC/SjZxZLpI+hEIH8cQero2RottP7C8D9vNWiph9Vd4uMbfnL7qyB/CXgWeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFha7HtmsR7hcgxH/qixmK6CGC4yu0AuJPkL9MXR5SnvSLTrtQ
	XH0UUebrcY1KmVyFISSNNU4vcwEWKsRBAzaIZ2zmw9CqF/3T9sx4
X-Gm-Gg: ASbGnctypY3qiWo/XHQg5rBSE/4T/NmhuK3ywwhrLGelD1Mm2hxLvMi+0OAhmWyDK2G
	hzRyhhi2wnFTic7uqzcdYsp67qZoSx0Ci/WRo0Db07SJvUcVbvepm6lR6Xm6pGH3VlBbYnedQHi
	LqcftRCxG6DasM/MJno6YMoosTrr95YlOdGQyKL+8zJYMmGjx2oZIoqdt1483pIPy5kmCh69U81
	pnKvW1H5pDkV01cdXatUgz8MHndagWpJfsPw6XwkVeSKwoBWmxUz5eJugP9lGtCfFg=
X-Google-Smtp-Source: AGHT+IH1kJnbMj5b5cjXwM6GZ9H8p8AzdRjfokuSH6ZklUmCCOVvU8/5lE7VxXYgt1k/9sNJz2+Ttw==
X-Received: by 2002:a05:6214:76f:b0:6e2:2dd7:1404 with SMTP id 6a1803df08f44-6e4455bafc7mr173916006d6.3.1739163030073;
        Sun, 09 Feb 2025 20:50:30 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e43ba2c115sm43446666d6.20.2025.02.09.20.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:50:29 -0800 (PST)
Date: Mon, 10 Feb 2025 12:50:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/4] reset: simple: add support for Sophgo CV1800B
Message-ID: <w2d5ooepxjxz3dy6hliwmffftevvrvnihqlethhatrlo6svuep@roevwwl3ydgo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-3-inochiama@gmail.com>
 <20250209134652-GYA11750@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250209134652-GYA11750@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_205031_749709_62491590 
X-CRM114-Status: GOOD (  19.26  )
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

On Sun, Feb 09, 2025 at 01:46:52PM +0000, Yixun Lan wrote:
> Hi
> 
> On 20:29 Sun 09 Feb     , Inochi Amaoto wrote:
> > Reuse reset-simple driver for the Sophgo CV1800B reset generator.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/reset/reset-simple.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> > index 276067839830..79e94ecfe4f5 100644
> > --- a/drivers/reset/reset-simple.c
> > +++ b/drivers/reset/reset-simple.c
> > @@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
> >  	{ .compatible = "snps,dw-high-reset" },
> >  	{ .compatible = "snps,dw-low-reset",
> >  		.data = &reset_simple_active_low },
> > +	{ .compatible = "sophgo,cv1800b-reset",
> > +		.data = &reset_simple_active_low },
> I think this isn't really a problem, but..
> 
> quite a lot SoCs use the "simple active low" IP,
> can we introduce a generic compatible? so can set as fallback..
> intead of growing this compatible data each time for new SoC
> 

I have already considered this idea and design something like
"reset-simple-high" and "reset-simple-low" to cover these
generic scenarios. But adding something like this is too hard
for me to migrate existing devices. So finally I drop this and
added the device id, as I am not sure whether is better.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

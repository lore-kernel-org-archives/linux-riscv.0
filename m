Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B449C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 11:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wbo30fRsVnB3JlRkXI5FC9tNuVGMro6N9PI2woWzq0=; b=Pg82mX/vbYMvbp
	7aT5zQrq3b8hBLvRjlx9bYooD0ocrbMGOh67mYPAlFvdPsn5xv3dqz/bpONCKg7kE2pBhQvK6fFuR
	zxu3ypD0iD18ULqxQ0L2sn/orCgahA70guyb14uLsFo30T2i8uC1/C5kQmzUuBhM92E6HLF5ImVfc
	NxuMOizOH19VHgVwR493VLyRvwd5pupeHBxdQ4wsYCktvLyx0aD3w3KxPKoaki2iU68ns78WLViKy
	VeEx506VMPfzFV/7gDLsM9/lbefedW7+ICOzBbVBWELl/cHoapzQk+pNjOuu7NmSmPGQiB2qRzIVX
	2do1W5RPUcooeZe4VHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXEx-0000000Ao79-0cvi;
	Thu, 13 Feb 2025 11:18:43 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXEU-0000000Ao1x-3VOW
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:18:16 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6e46269d2c2so10385556d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739445493; x=1740050293; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jWa5V9+gOF0Da18gHiRuUCSUVEFQiY42ni6Co3x+yiM=;
        b=XpGwO0I5zeN6oCjkCvISwWRnPV8h/b+V7Z45e7XIiVsGvweSt3+BNAK2acFpWgOf9e
         qFKW97mjo6VUXgr6yM07qawkT9Bnc6kiegEbDBSD4I4K6rsSfbB6h7D/f/c0PrYnaQx1
         BRztWd+6um6ubfpemvNqE9hpwbcTdQgkfzypoebv5kG8Csans+p46AwJMCGCgfFqfIpc
         pG69iHSUqbGUzwfYyF0H5clThVoYUa0cwvIiKadkPwovwxR9uSzavI6AXoHPUfAtO8yC
         U2fK7YFhUW2qzdB1vjEfmqLdL2cRh1XZhc1AXpeYTmicI3KYxWQBQDPL4jBgzfKhuzlv
         yx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445493; x=1740050293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWa5V9+gOF0Da18gHiRuUCSUVEFQiY42ni6Co3x+yiM=;
        b=krpqydu++a3DQNqXvTdRrE7Tbrj0f/CuZ5QkMVyOJdNbuNF8e8yoSU2ozK2RZjZNL2
         w3U7hbQhxDjyVlFrRgWnrSR2GqidyZpqjZWOu23Fb0Pr/sKO96yxt29ISjEdy4Lk4kLM
         RE28T3LGc5+AItrz44JpGZrJqymeeYVwi6r/uDRXvGrCQYvsokFsn1Sksb+5ZsX+XxAI
         /XvShPDLtDE7qXSRALRFv1MBWLYRKjcN7OUUUxe/RM6DyyuO1M696LZ7kHCpgO6Wu1tn
         9JglweOGoKvPU7wzYPNIbBgNTTLYGD0N42k4daGlMpa2qHYMRKuK8xsSjCeLzStyLBON
         XFeg==
X-Forwarded-Encrypted: i=1; AJvYcCUtNGygJMWDf7klBdR2BndKe1ZvNE6OdUCvTAGkvzyeuMy8RwrxkVW0X0EkdQZwcKm4h+L2dR14B9oLBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK7QJ66p5g3zrNL5CyJpJWaJ48AB/WTa1DRYMzkX9bmbzvttrh
	TjjOL5xtQ4oMKt42STf1y3HO+Tn3BxvoxFynVPK4P5jVCdcyiGs7
X-Gm-Gg: ASbGnctvI6Dm9MXaGGGnoFl/B9E16WVe+XA8g+Ub6xiBwk6Vkevuz18WtDVYWVw90JE
	g5WXwEhL/EYRrbEQC0URVjM9gm2vxlU5qKoZzUkWlPtQWTvH3/xQtgVdDddjAzwBecR+LnJarp6
	HxQ55MtLLGU6uvRdn0WM9LNrOT8WopKDw4tN/jE+ez8SP0UEmEY5HJOF6jpOdSoQfzkZK8iqQ+x
	VfRSq8QUbfcEDlBqbmRaqJP4WmvO4t0SQzDUct7Da12jeFKeYrcYyMjW8srxxNiRog=
X-Google-Smtp-Source: AGHT+IFLRibe0XYKyIJjpp/EoUMufvpGHOsU5BVQtHPrYtw6m74u8WCyHY1uY/X0uZMhys3D7yZtUg==
X-Received: by 2002:a05:6214:5655:b0:6e6:5ede:7d83 with SMTP id 6a1803df08f44-6e65ede7e93mr16129926d6.25.1739445493556;
        Thu, 13 Feb 2025 03:18:13 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65daffdbbsm7895126d6.99.2025.02.13.03.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:18:12 -0800 (PST)
Date: Thu, 13 Feb 2025 19:18:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Message-ID: <j6xw7cpk4mfggonh5dhqz7dqj7abo75sojaann5pv2uar5en67@sdo2ygvttzqj>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-2-inochiama@gmail.com>
 <20250213-cordial-elated-grebe-57aaae@krzk-bin>
 <619128481807b279e5d3b7967b00e7f094dae7ba.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <619128481807b279e5d3b7967b00e7f094dae7ba.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_031814_890911_CCF4A803 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, Feb 13, 2025 at 11:22:07AM +0100, Philipp Zabel wrote:
> On Do, 2025-02-13 at 10:35 +0100, Krzysztof Kozlowski wrote:
> > On Thu, Feb 13, 2025 at 10:08:54AM +0800, Inochi Amaoto wrote:
> > > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > > a simple reset controller by toggling bit. It is a hard time
> > > for each device to add its own compatible to the driver.
> > > Since this device share a common design, it is possible to
> > > add a common device to reduce these unnecessary change.
> > 
> > SoC components are rarely that simple and even if it is just a bit,
> > usually it is part of one or few registers.
> 
> Yes, in those cases (which are probably most of them), I would argue
> this binding doesn't really fit.
> 

Yes, I agree. 

> > Anyway, there are already bindings for reset-simple and I do not
> > understand why this has to be duplicated.
> 
> I think the motivation is to not have to add a new binding document and
> modify reset-simple.c every time there is a new SoC. 

Yeah, this is the motivation for me to write this patch. It seems that I
describe it in a wrong way.

> I wonder if some of this can be mitigated by adding just the 
> binding document similar to trivial-devices.yaml, without the
> actual "reset-simple" compatible.
> 

It is better to keep the original compatible. Adding new base compatible
will break existing device and make the migration hard.

Regards,
Inochi



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

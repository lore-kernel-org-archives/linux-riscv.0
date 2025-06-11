Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE6C71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rd/2TLHz0WQacHUnnXMwWoACIvYCdtNkoJzIerK5+Tg=; b=v6rjoKwMw05f8p
	bj3S2RaA3xoXGIHwek+H2FGTATwzX7+VWYO9TUZZu9k55MwCO3t8noi/ecY9NmePER/N5BtEGD6iy
	k9mM2sFL9w4r7DNO4guYT68ncLhKVrAr+LTUx52OM0CB0gGcM6BBsl//C2Xjnvj/5uwwREyHQGYME
	ffwODoX+1L+Q5IwcGWRyv2RLr5zjGmGh6shePVRAh4fveFuaT89GFqhzxeZlekeimQQCPbD6uzg9q
	xYB0Mnb6jLCzCvqFW7l9eA+docCsNFXAS2ZTIoWe18SThdPkdwhXkgIwgS5n8unYUJQ+qBY6pWzJn
	aHhagZ68QujQXinTyMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwJ-00000009Hub-3QIh;
	Wed, 11 Jun 2025 08:36:07 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGlT-00000009GBB-1KlX
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:24:57 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7d3862646eeso219928685a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630294; x=1750235094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BidLvrmOmqABz8QFweaiXGgnxn0STrjzzVlTkfXyV+8=;
        b=Pg+bj8BorSxSobv15cw6YJLNn1I954u6CceK2DAXMRXuBlYU5TqIIkz1d+YSFzHz0P
         ZTdhAPTsF/pmh+/3z2UUFDJq9mkC44Mn6jRcB+HvGUy6f3q8zAsDUgM5qzh1PeQewupK
         05CzbZplhEaKhJ9rmvr+1jyfjBjLBhcVrGnbrjri9bjqwAhNQ1OORJL6cYqBbfQhTGUY
         Szww7DRtmkxwvjoD0DC5lsLpKJWZu452AG5BpcjFgBbu4IkAXGiBSLy5ERn/yW1D85aZ
         mZ4IIrYLdeu8hfY+ENwPLdZGjt1cW01Cgy09uNsWpLr5Enfbd8dNtgmW/s17/9Xr2qMf
         zsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630294; x=1750235094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BidLvrmOmqABz8QFweaiXGgnxn0STrjzzVlTkfXyV+8=;
        b=Yhla6p19QPnDzQ/MtoqQD7v205lYsqNM5FfBqslrYWd92qJXm6Ic9DDxy+8/THq8qO
         xDnCn/O0j4HNB++PLj2pFwZ3X+7Usnyz6VVd3V7lQUegaQPhSaHK2Iko7MdiqPX4Lmtk
         f9urVErziC0RP+aVsT7VzSMHpvHtBxzNBVkw/ZR9EDKQWGE3YcbwQsT5F51OkSzEl4d3
         OSwgW1nBmKFOa/atrwhk1Ws/G4XA8iB7wWqwxvlT25JaqmuCKgO7LBHyM+xlMdc+wKUi
         T6N/KOwqpeC76CGqBD2fYMaTrNNyc5tscovawiuz8Hmxh/ntpTnbiFhMHovjXnXlHO6G
         r8pg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJquFQT5UeAqDce/ghPIIQc+DKbi3UzfQMEdH10JGP09qye3WJ6XMi5dXoSDp/gy8X087n8LhdHDI9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi1afwLKZmuKAGHa/9k3ADaN/t0+AMB4HgHiLqVcfXzOYw8Y1d
	wR9O4vdyvjF3NUWWaTDO83tiZRyCOP184bfpaxRfJltKJF+Nn/pGUUYC
X-Gm-Gg: ASbGncsEQzajkZ4uqVqyYWJL5TYQYHGDk5C2MSrALY2YobEJA0xkLjzJYOIBzTHqa+N
	bCfBUmtiU/1Bg03iRh21cp12d0v/y9CK8DC2CH5p4GIsyEcnL5uHQwOe1QuizL7iQYxPwmg8L7u
	HyxDMb64vRdYImLi3abRj4JXzlXfqVb36of/xlK7jcVCjugx9C5KXKKyP37Cp90Un6N892SejU/
	roqzsOd35wGP0KIiATFjW7Ktig02PY2ddR/fq8h5QER73kRGYja8QeMSO8IGBwpw32vunZc52D4
	QKI9FVJCtshszZjdMookJud7B55+6WFqEyCm4g==
X-Google-Smtp-Source: AGHT+IHb2MLjUBYv7CB4OtR5rJJhMMfCSImfLyf7zcPSqR4AyQunE+RrQVFB6oFjHFdz9IskAQDceQ==
X-Received: by 2002:a05:620a:2955:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d3a88ae947mr345558185a.28.1749630294098;
        Wed, 11 Jun 2025 01:24:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a31sm79287166d6.7.2025.06.11.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:24:53 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:23:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <ycnj5ke42kpqjwgsjoo3vs4gibyr2i3yr63jfwbeajo5unqqmx@xdt4xwhcjbna>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
 <20250611-brown-turtle-of-election-87c324@kuoka>
 <f74e217e-4a6e-4ba8-a89f-9518e2f74fda@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f74e217e-4a6e-4ba8-a89f-9518e2f74fda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012455_357935_48FCF9B1 
X-CRM114-Status: GOOD (  15.80  )
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

On Wed, Jun 11, 2025 at 10:21:07AM +0200, Krzysztof Kozlowski wrote:
> On 11/06/2025 10:19, Krzysztof Kozlowski wrote:
> > On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> >> Add bindings for the reset generator on the SOPHGO CV1800B
> >> RISC-V SoC.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >>  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >> index 1d1b84575960..bd8dfa998939 100644
> >> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >> @@ -17,6 +17,7 @@ properties:
> >>                - sophgo,sg2044-reset
> >>            - const: sophgo,sg2042-reset
> >>        - const: sophgo,sg2042-reset
> >> +      - const: sophgo,cv1800b-reset
> > 
> > Keep alphabetical order. That's enum with previous entry, btw.
> > 
> 
> Heh, it was an enum when this was acked.
> 

It seems that I have made a mistake when rebase. I will fix this in
the next version. Thanks for reminder.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

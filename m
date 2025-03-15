Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D8C282EC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Mar 2025 00:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3jUsVACPb9E4pqJ6/9NFqxVza+ALgBbYlGBHVPbBrA=; b=HN/sINWiwo7pS0
	+r89iP0OEiKqyfUcC5EnSNgJvebsaQ0aVvOiAqC00339/cWfZN4xgYppZbCkcX8B0epZeXF47AzXO
	6MOp+rJOlvYKEyF3J9J4B91ZnzUBQYKREJCqhBb2a0Q9v+anXmgNRN2lAQPM/bqrkl+JAUMT44TUN
	LzQiRGfY7iM7Hf4YQnZROeJ1UBBvPrs89/rS0y+hU1CMx7Pg3BCaVGkXCc3IbZYywcNgHGcCxTTwe
	w4+pDYMORACxaoTIJ0UdeulT58VSK/YipvtV2vS7I4Uq/MKoRPIGgI6AXg7un5zlLpgN9QnzC2c90
	PjwVHY17/L0uXgl7lu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFny-0000000Fd7B-04xp;
	Sat, 15 Mar 2025 00:55:10 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFnv-0000000Fd6p-0SVz
	for linux-riscv@lists.infradead.org;
	Sat, 15 Mar 2025 00:55:08 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c55b53a459so263151685a.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 17:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742000106; x=1742604906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8qvkRDVRdv9qBia2/dOTQyKzNJ34jMIIljDmJe7gzU=;
        b=UjsQC6HZTwwpKZ5G59v7YsvsfhObdYLpGISzQxeKVDmIe1AqGdaOYICG05DC35jl7S
         Am7NFMLUne6DKpLaGbnsGLfwS4yp1qYKpko1Gxr7iGoli7ITyuUd+e79A+Ywu8PNvzgi
         ekeFTP0rRxWyMuGSnZ9R82Sb+i2p4Dm0kmys+9X+4XbgyzjVLo+aE03tAt8Ytu42kuBW
         AAXYL0k6MK0Rp0+4taD6X+IC1cxPbbncxnN2MUUWSDXIpToRi5As1CSsio0wN7wHDpyr
         gAI2MJB/Y94ajAV1wVqqcZ2Ci8KIKvDsuunnJzVP2MHlLdVyif/PY8P7yoIo0HJP7ith
         A9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742000106; x=1742604906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qvkRDVRdv9qBia2/dOTQyKzNJ34jMIIljDmJe7gzU=;
        b=pFUImLmIgab5EojlT+TX2gTJgoi0DtbgrSzvcqAyA27wB5trn57FoMb8Xq23I7/77x
         U0WNEpQspV7hcam+28Im6/wpOuGOlTeHJk1gfbLZZ86YfrOXLxjIDlS7dL5WcjW3Vvv8
         1XaoTukwjvCHqGA4rV+n3tnvaGqU7Ue+OYOJG0Aja2xkQvAtBLYh0mm2JE7MBlkUmQw6
         r8wh6lxcyRNnuu/o93TbhXiDVjpO1diUSFVkFlCKQVQVKzsxTq+vYBfYwSjXhUtA3ykj
         xzksFjBoqlzUFOs7l47w7jx+ZWiTFT/oVbfKKF3hyDiIDWt/uwdqLvxijyNr6s+btzSs
         efHw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWyp2C3X8uwdmhj0sEDG860SCyihz6aJWYf5s1ibhrkd9Gm6OEPUd62ucZu12hNflJssUE+VNmE7jtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLRjXMMNmeYJYEdk1U2jutT7UwVEDOthXvvIs6z41q1Yy4OGSw
	HBbzKh3jksUzUPrLSg8F95HVhjbL2sURqMKakpsrzlVtitALZzY7
X-Gm-Gg: ASbGncsnKlzeQj6Gh8tJsxjhJt+AIebnycoLaQrnUNle2DjJ13UG4LZOwQzFuOrp15v
	MEKVgVRAyhyjsGYiPeBZOyGXM+Su7VVlivy4uc2V6Q/NWVA2hNAUmKMHYaHP/9mb5Q491oo+WH7
	iuVTEx57xg+RyQWAzcmFx9QmAwB3iUiREX/Yn3hosFXQhpiCI34G2Nu/SsJm6G09g6hQSUhe/3I
	RaNXvkEYywaUy0sCNZ//1ZdbGMS6RHTANZpEq7a7QB068C5Cok9vLq9Iwlawj6Jd49RH7dLVkfL
	p/eeMoXV3FoxxdqkfTcY
X-Google-Smtp-Source: AGHT+IGgp1uiZq2qFqYPbOYD3pGMfDQvx5aQCCNWvl6mUfYQooAN1cww4ZHEMX/4ZqxQFR+1JE6iMg==
X-Received: by 2002:a05:620a:1a91:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c57c7e4c4bmr607862185a.23.1742000105668;
        Fri, 14 Mar 2025 17:55:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573c52246sm320780885a.11.2025.03.14.17.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 17:55:04 -0700 (PDT)
Date: Sat, 15 Mar 2025 08:54:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for
 SG2042
Message-ID: <f5nsx7xaf4hzmtj7zd5yuxbh53e6u6qqze6zhczrvwujt76ccy@3xtjhwtl6uzl>
References: <20250211051801.470800-1-inochiama@gmail.com>
 <174070346793.192886.6076012325463673162.b4-ty@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174070346793.192886.6076012325463673162.b4-ty@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_175507_152560_E69B274B 
X-CRM114-Status: GOOD (  15.01  )
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

On Fri, Feb 28, 2025 at 08:44:32AM +0800, Inochi Amaoto wrote:
> On Tue, 11 Feb 2025 13:17:48 +0800, Inochi Amaoto wrote:
> > SG2042 has a simple pinctrl device for all configurable pins.
> > It supports setting pull up/down, drive strength and input schmitt
> > trigger.
> > 
> > Add support for SG2042 and SG2044 pinctrl device.
> > 
> > Changed from v1:
> > - https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
> > 1. Fix the binding documentation error.
> > 2. Refactor the cv18xx code so SG2042 can uses the same code.
> > 3. Add SG2044 pinctrl support as it has the same layout.
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [8/8] riscv: dts: sophgo: sg2042: add pinctrl support
>       https://github.com/sophgo/linux/commit/5277657d53834cfbdbb9444088c1448b29bdfe98
> 
> Thanks,
> Inochi
> 

This patch is unapplied temporarily for dependency issue.
I will repick it in the next cycle.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

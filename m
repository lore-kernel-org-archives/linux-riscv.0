Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0BCCA0ED3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8E6MHtYxHf07vx9meeGRmdM2SS+aXdNtgIX6F7DB3RI=; b=cq4i7x2k1f6C+s
	6t9+8iIPeqmT4sTbEry4h4pr22Z/lepIgjnDfGrnN35/OHQ8z0pxW6wZ/yngf851DIjUlhFczkcO+
	ZMIchRnuMg03geyD74R42bSkGoloHMBkajwy/lnFybmOxyDhXPgterHwcU2Ja9yJXQSUmvABIOc1Z
	dXXaIHWPHOKYe+UE9Z/tFK6LIfczAe4QZxLmc5ajxxYDCJVc4tGLr6lHfUVJx0IdNVaarRARAQI2b
	Kl8uJBALDWUYF5f7XXAeZfkijELXvcfjwMIAYPuwTjcpwbqKIGrb4UqU5NyGmCwL1hC5ntfN7qHd8
	elNZB/Gi3gHDi6flbQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllvt-00000003ZuY-01BC;
	Wed, 04 Sep 2024 09:04:09 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllXy-00000003SVm-38He
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 08:39:28 +0000
Date: Wed, 4 Sep 2024 08:39:21 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Message-ID: <20240904083921-GYB107481@gentoo>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
 <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
 <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
 <20240904070520-GYA107481@gentoo>
 <f27dc213-e5a0-41d7-9522-ed29567f0097@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f27dc213-e5a0-41d7-9522-ed29567f0097@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_013926_829088_A9DBB471 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 09:42 Wed 04 Sep     , Krzysztof Kozlowski wrote:
> On 04/09/2024 09:05, Yixun Lan wrote:
> > Hi Krzysztof 
> 
> >>> +  "#interrupt-cells":
> >>> +    const: 2
> >>> +    description: |
> >>> +      The first cell is the GPIO number, the second should specify
> >>> +      flags.  The following subset of flags is supported:
> >>> +      - bits[3:0] trigger type flags (no level trigger type support)
> >>> +        1 = low-to-high edge triggered
> >>> +        2 = high-to-low edge triggered
> >>> +      Valid combinations are 1, 2, 3
> >>
> >> Hm? No, you must use standard interrupt flags, not custom ones.
> >>
> > It should be same as standard flags, my intention here was try to say
> > the controller support edge trigger only, but no level trigger flags (4, 8)
> > should I just replace number to macro, and put it like this:
> 
> Then just say that level interrupts are not supported. Do not refer to
Ok, got

> some bits (bits of what?).
> 
the flags IRQ_TYPE_LEVEL_HIGH=4, IRQ_TYPE_LEVEL_LOW=4


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

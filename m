Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A211FCD342C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8G8FgztzxYoVcuXHNuGMYTXhWbCYEEfuAoHy10gnhZ0=; b=zFxqafq4yooJHs
	E1Nq9MZ9GBHKzBrAOAMltP2DqSV9palUZoSEe0XIx61Y2HgYWmfc64i/qb4k9zTUJ7uwRmkYjK6oe
	KYp81SSifBzUKxHbqdu9MS6W9bzbwEw4WRRlbS2kKxiNhEXFHmf7B6Zcr2q+DhJ3lKH/i2NOjHsX4
	bQfhKZbX1Jc4I6C/60X2N/avoFVkKu8JQbTcTL8wi/5ZUp9lbQ9WseJpqPTXlAxNlC+i0+4QGNzmM
	Azyrjs9L8dB/tAX/uJY67ct7UV3d1ioUuELpq3sp4a5GVopSsgB5EOeZCuKl6GK7tvRTMRdp4x9Xu
	CeIjzhEzC2lTm0fMOAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqQT-0000000Cutc-3hda;
	Mon, 04 May 2026 10:21:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqQQ-0000000Cus3-3w1M
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 10:21:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1834422b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777890075; x=1778494875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzJI2062NMt5980YtQqfww16vShKlaQt7llmD/pl5fY=;
        b=A4SCVC4+mX7kqal0kCUmDC/emAx0KuaDbjRw0kmpaRtWx2SQR0fekYFqLtQa6ikkmq
         UFJgMfM4jRn1+OHe/0UNkvfGyyh/jdD0tqWIzooB5rlhvvqm4TE+2Z1xIHpemxf+rSTT
         k+jrh0jz4aVp0r2sFQ67KO8rOxmk9sKNjYVf1SxkXk5wvwT5HhgiBplgZw516y+MmPBB
         +cwm8ptRuk1uZw96wiL9rEW+ZZgq4vXLOlo52rEyHwvHHXWURQ9kBF+xlSzjhMdEdl+6
         HSsIezki6bDUf5/KbVAqlU5DbP0dMPL0/Sh7wOmHEPAqHhxECvpPZnRmdAocqdayxwqs
         1Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890075; x=1778494875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzJI2062NMt5980YtQqfww16vShKlaQt7llmD/pl5fY=;
        b=SZvohCWQ9pAZX+wGVT1SLR0EE78UikhBzPXLTmoyWuUhBHYuc+Ko2THrET3jyaC2zR
         ykgf4J2rWsU5CjkpToLoHd6+eUSjn7lhUmL+XctBymXDSj08zbfikY2yhmbR9U9TqiUA
         6QRyHmkVw/OpgjpCFg6Aa/xSAKPv2X6a+SW/2Xl0WA7iBqJmStHD8lwxif19Cbnf3+x0
         Bv+C0Gq975C6zFEqj09jlbM1opGqi7NveYX/zpmwCx4nN2z1VNAvCPPIdodJc46wr0Ry
         gqLgq/dwPYeA2i0H1W9I/xTIexBJB34h4q6i/gKg0eNh+SWxqH16FGykRsjIrbOD4102
         ukSA==
X-Forwarded-Encrypted: i=1; AFNElJ85iciRwC7AowT0XA2A5ysZ6KdPdQPvleK2wsK5dkhhVmnV6I7TeeIbmACxaa438SYbLD1Di6MVMM1sMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjaEwCQFP0ERGeubN/QxNuB4wsyYs6tGVO7LvTee3kJwNylsQN
	p/Y7H8r4pue+KSE5rKjii/4XGncdc9uSsycOdULWETTaSqvfGockGNUG
X-Gm-Gg: AeBDieswYfv3BlcdKeqgaEMxmHXu0X0pbMnf3cqs9XgqHkmipUP7lcsYUYBGHkx5au6
	cqV376iHKOTyxdoOFYvfi84WCXLYQ+yaPW1NeCXb12Bvus3/y+oFz9HTcyn8CLEW0eEgSkvRyIh
	bRaCb/ZwgEHsk3zfvdHxQeLIGATLFcgh65Dkr1rpWCyUsNRAMP0D99M7mJ31h4gHFHe5q7ugzef
	z4dPdrA5INeEAom9V8DJPPEZAJckjuXUbtnm8us/op0VQku8hv9ieEE8fsXowtNspBzuHO3VJd/
	tovb2f3ggCGpVtYdXi1ImafwJJmtl368/1cc/6KSS9ju4bsS4mPf7NfeaCdMTcrvdAqpxfMrzb1
	Gmjd0Ey8FFGML2NswNRlZj9ihHQB7mTuIOod+u3+UE0l1DlkNIYF6LU+YWoiauuB20uK7S1+Pr7
	7++hRRybGFbOyb7GdFRGopOoYRfoEjyMNBE5KsAHsNa641
X-Received: by 2002:a05:6a00:340f:b0:835:4291:6975 with SMTP id d2e1a72fcca58-835429173d9mr5262314b3a.39.1777890075240;
        Mon, 04 May 2026 03:21:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm4335636b3a.9.2026.05.04.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:21:14 -0700 (PDT)
Date: Mon, 4 May 2026 18:20:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ze Huang <huang.ze@linux.dev>, 
	Alex Elder <elder@riscstar.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Spacemit K3 USB3/PCIe comb phy
 support
Message-ID: <afhx6C2EvDbMJc92@inochi.infowork>
References: <20260430022843.1090138-1-inochiama@gmail.com>
 <20260430022843.1090138-2-inochiama@gmail.com>
 <20260504-logical-nice-python-1e1f43@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-logical-nice-python-1e1f43@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_032118_982064_8286351D 
X-CRM114-Status: GOOD (  18.46  )
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

On Mon, May 04, 2026 at 11:54:11AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 10:28:40AM +0800, Inochi Amaoto wrote:
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-comb-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 2
> > +    description:
> > +      The first one is phy id, the second one is phy type.
> 
> You could mention here the defines representing supported phy types.
> 

OK.

> > +
> > +  spacemit,apb-spare:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to APB SPARE system controller interface, used for
> > +      PHY calibration.
> > +
> > +  spacemit,apmu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle of APMU syscon
> > +          - description: configuration of the PHY lanes
> > +    description: |
> > +      Phandle to control PHY mux configuration. The configuration
> > +      is described as follows:
> > +      bit 4: 0 - PCIe A x8 mode, 1 - PCIe lane share mode
> > +      bit 3: 0 - PCIe A x4 mode, 1 - PCIe A x2 and PCIe B x2 mode
> > +      bit 2: 0 - PCIe C lane 0 is PCIe mode , 1 - USB mode
> > +      bit 1: 0 - PCIe C lane 1 is PCIe mode , 1 - USB mode
> > +      bit 0: 0 - PCIe D lane is PCIe mode , 1 - USB mode
> 
> I assume this device k3-comb-phy handles phys for PCIe A, B, C and D?
> 

In fact it handles phys for PCIe A-E. The mux for the phy of PCIe E 
(the id is 5) is controlled by bit 4. If the comb PHY is in shared
mode, the PCIe E always got one lane.

I think it is good to add a public link for this configuration, but
Spacemit has no opened any document for this publicly....

> > +
> > +      The bit[3:0] is only valid when bit 4 is 1.
> > +
> > +required:
> > +  - compatible
> 
> reg required.
> 

It is fine for me

> > +  - "#phy-cells"
> > +  - spacemit,apb-spare
> > +  - spacemit,apmu
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

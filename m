Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC38CC0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFcZvbMQ6Lw7Q0U1S29Hw6vTJvyPm68TQ4Pujl10xLw=; b=v5FD7HxS4sX80g
	H4m7m7Zh+w7thvp26a1Vpmjthib1Bte2uHnX00Di0KAuaLyu2Jo+knXr1GKKx1+qR3rHUq9RbfUmw
	Ep0kRZuSkzwPGM2fF0GMh2pgTtvdqV689GSADDE2y0uxFWxBmPd+labEvB0o5PXH3obhfAn0Yd38t
	kQdIN6vuFsFj5Wucl5uK2Q40+ivxPsEYsOWRe3Ta7YpUY3UIObOn6/6jZw7bi73lPSDp2RhIlUXG1
	m8aQQaoJVlgEuqaFPEBYH52sXYFm6LgVfFxt/A4Mw/a0H+iix+o6bGm/LDLleHwtzyzkX/w8d7Lw+
	txsG7vjZRcbJoOTCz9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXTs-0000000AsOE-0rD6;
	Thu, 13 Feb 2025 11:34:08 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXMR-0000000Aq7W-3LgJ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:26:29 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-471bb02fc88so5450381cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 03:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739445985; x=1740050785; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUTfDmvy5Bhdv7Ab6yYlWq1JIjBJXsMdnuekE4YJLOk=;
        b=I335MWMG7JydxlGQWYrGrKT/Z3OAXodWcwvLHwCjT6uIfEy447QOrI2JTAnj09+39o
         RkA8htkFbkOzGWq4emQncubyhWtYnqSiJvlNWTyrbuqk/BlTFrj1iPzlgFjb6xXVCgqu
         VY/XUYu54QYYWFV+Rs/fio3F7A2lF42+bYOf1Dnafy2E2zFR3e1lKFknKbN1AAifjQYp
         nKPNldIxc0526r4m8e8dON7SfJwPBoJbkZ+dJbf9MBN1XSOHuIsBgPQYd3CI9xon7Go4
         uVYBG8BUvY6VwkNei+wW8/efsIUorxO79z0iojc9M8OU2oXug6zcuFbNdCat7BdqL3u4
         uZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445985; x=1740050785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUTfDmvy5Bhdv7Ab6yYlWq1JIjBJXsMdnuekE4YJLOk=;
        b=WqZw6dw/lV25/QDsReOJTtql36+Bkw4YKoJGqo7qh08YzDKf6tjYrvHzd63H2mTQ6Q
         iFrFeCsxPevqUnMcZCM9gEdlSc1ta0f+EuzJrskS8ecdLBmxkpsMoBChfd7eulXn6AZD
         FnP/ndg53n4mpFPDWr//IfLREmNtMzxaO9oL+xG+IWFmjHYxZeSlqtzmI3i0+q+Zhjcb
         bYF23CpXS0vHGcgsqyrgDTMhILAu9DMHXEE4zgHzRMUQhNbwXreJwssyhJb8cD6iIQTd
         EEdaXwz8V5y7tJVyiJlDIqe5+FGZuH7gKGzMfWASL+/05e+HhmlFJvmVlMpkF0xeaqRj
         EefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfoYIlYeAsJce02zl8OWeqQWxV8pJ63Kjm+KpXnS363oN3cofdhriBvA18HHQCcGITCFBD+LT0xmqFlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsIRGeLNpuLIvA4vSdDLULsqV61Id7SgYPRTzrb/lB0uAAJeC6
	igb7nHw7hs4dFwukLI373YbIqlkL6zGTlggjAj5wbuVdYDJT8Zjp
X-Gm-Gg: ASbGncvipzJHAVBV64vcFib8vdGZrc9KDccOh8g09DNvAMHszghogDgXxeg8raz5/vZ
	pKB5e6NdnovSNh7YlEdzP3s06bEEJpZt2umHlGc3eEpZ3aKVUPnhApkh9W+So9j0e4VTlTNI2pQ
	IvBbRRfzd/J6DHcFC6ISSK/2t7W/Q6O3rNll6SELvk8I/aaX95fRVd6EjB+ME9tmBUL4Rq+fGx8
	g+MAOeM22vn2Q24CvbXuGBC1ChIAFLGVTdIkz4UVE5M6nluTFft7UtnuaUVdl8DiB8=
X-Google-Smtp-Source: AGHT+IHarKxPF7Mq1Va3dpnA4qdWkYz+da0eCf7AiIm5qMplxsfMjqtaZ8SbX7mt6EAyGdIMQeVqtQ==
X-Received: by 2002:ac8:5ac5:0:b0:467:57c8:ca31 with SMTP id d75a77b69052e-471bedbbe05mr52875421cf.46.1739445985449;
        Thu, 13 Feb 2025 03:26:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c29e9428sm6781241cf.7.2025.02.13.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:26:24 -0800 (PST)
Date: Thu, 13 Feb 2025 19:26:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
Message-ID: <bzzwckg2ac2q4fkcp5jju5ubqmget3jdwmvcubdmc4xp3slmwn@hn4kmkotfnfw>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <20250213020900.745551-2-inochiama@gmail.com>
 <de7dedf98e2085c895a93ba56c4e5fa50e298d05.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de7dedf98e2085c895a93ba56c4e5fa50e298d05.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_032627_839586_29969FCC 
X-CRM114-Status: GOOD (  35.37  )
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

On Thu, Feb 13, 2025 at 11:08:59AM +0100, Philipp Zabel wrote:
> On Do, 2025-02-13 at 10:08 +0800, Inochi Amaoto wrote:
> > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > a simple reset controller by toggling bit. It is a hard time
> > for each device to add its own compatible to the driver.
> > Since this device share a common design, it is possible to
> > add a common device to reduce these unnecessary change.
> > 
> > Add common binding for these kind generic reset controller.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/reset/reset-simple.yaml          | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> > new file mode 100644
> > index 000000000000..77584e23e8e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic BIT Reset Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +description:
> > +  Some reset controller devices uses a simple method to perform
> > +  assert/deassert by toggling bit. Some SoCs from Aspeed, Allwinner,
> > +  Sophgo and Synopsys have this kind of reset controller instances.
> 
> I think some properties should be documented that make reset
> controllers "simple" according to this binding.
> 
> For example, right now, the reset-simple driver assumes the following:
> 
>   - There is a single, contiguous range of 32-bit registers.
>   - All bits in each register directly control a reset line.
>      - There are no self-deasserting resets.
>      - There are no timing requirements.
>      - The bits are exclusively resets, nothing else.
>   - All bits behave the same, so all reset bits are either
>     active-high or all are active-low.
>   - The bits can be read back, but the read status may
>     be active-low independently from the writes.
> 

Thanks, I will add these assumes in to the binding.

> > +properties:
> > +  compatible:
> > +    enum:
> > +      - reset-simple-high
> > +      - reset-simple-low
> 
> I wonder if it would be better to have a single
> 
>   compatible:
>     const: reset-simple
> 
> and a boolean property, e.g.
> 
>   active-low:
>     type: boolean
> 
> like in leds/common.yaml. Also it should be documented clearly what
> this means for reads and writes.
> 

Yeah, it is better to have a property instead of defining a base
compatible. With this property, there are two ways to process this
property with existing device:

1. If device has defined the data, the active-low is ignored
2. If device has defined the data, the active-low will overwrite
   the device data.

I wonder which one is better?

> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#reset-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    reset-controller@1000000 {
> > +        compatible = "reset-simple-high";
> 
> The example should probably include a SoC specific compatible?
> 
> regards
> Philipp

I think it is OK. But I think it should be added when a
specific compatible is coming.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

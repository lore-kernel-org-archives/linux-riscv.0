Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB131C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+TNlsN/6ifixSMJKeW41VZazKIEEQpYvsPMAVu1890=; b=tWI/eI2mURimwE
	V0KRC34ARFm5jsL7hzorOJEOZ9e+dZ8rYq9SnYp2KywHu/uucn9oAQCDgnUyvyp4AySbOaUaO1fyU
	0AhTWF3WuPuJuUzEeUgQKC6FrVqRd/pJPrIk55ThAoBcsF8XOuq7ffxgqDXGfjJHPCVGMG/Uh4ZCZ
	gWHnmeOvo0D3EgOUVCXqJ4PeL7oCVW0Pw22LgQTs0zs+caQUt0UR6b+IUY0yDGMVdwaikdwsXaawA
	gK7ylKNoUG3sW5okgmLM/QceoZUeqkXOBnBUbV04PYv3beiKnJdlOmGXBwR4oZKJocdKLuCBK2zIk
	YL3nhxXr4MZahQKFQmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4xB-00CulH-1I; Mon, 21 Nov 2022 11:27:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4x8-00Cujn-0i
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:27:07 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 89B5B3F328
	for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669030023;
	bh=nVDeZyW08L6nlsmG9j40la0+32+2f6F/+Ex3JCMFolQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RMHBFopqbrm4ahbWARLygpU613O26PLOhmQ7ewl7YFyhIaYddu0Y4lhaWmxm+5B1b
	 99pGBB3uWuKGC0p0rKtg2PFT5Wq48e4cSDxqNa1NPvvPdTNrvsb0QxC0TFM0mwHl9n
	 WFLOc0jtTAE2yiXWUWDgHPJSIgwZrJMRPvncPES6hK/ikpwyab+XEPRB3oBW/nHWje
	 e82V0ayXkCL/OUvLHQOdngGvCWR5vH5cy+xf7SLjOdThZX5axpb/cYCeFyh4qDbGIU
	 UYrMh04NcAnkx9nTjAiufQM7qYQBrDE2B3BWU5j5bMYMrzXKrV7l0OZ6w0d5FVGIGm
	 H6fp9UjriSutg==
Received: by mail-yb1-f198.google.com with SMTP id s16-20020a25aa10000000b006e894071c9bso7977278ybi.20
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 03:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVDeZyW08L6nlsmG9j40la0+32+2f6F/+Ex3JCMFolQ=;
        b=FIzTYLMnZmozO/proKT/EBZps2gvLt89NzKNY+G1uEiNFpL7rvHyyALF3Wk4ZQZ1cq
         lgbAkrIHslUOHjnwMgBAHJN54zQLl1JYs3dra0Q+zz98XQTAXkhiGfgh2tzT468gXhH5
         djt+TuugaoY11oNFzUd4vC+bjmUsg6cxldOQcJ19DoYPFz0d76cbT/ySv4auk4BuxfW+
         X/b+VFYzbdmQKdmjBS1dR8bOTxmy7Dm6j5KFJ2capa6OcO6ihxQJckUIz7+uXtyHluJ9
         xX5VzIPgOpHSfdd8oLUj76P2iPIEfMi9ZvaESQiizvXWUywgddS1hm9Udyoa/ujU+dya
         PNrQ==
X-Gm-Message-State: ANoB5plUQ1gpkv6sgk4j+CNgbHFK6mmOBERREbfypiu+/lLdnXMdb51y
	6xk2wMGiYBowTkDZ2ue1c+Q/8ZWDqTGmoO+kIJYi6cESJbW90oziKwXKOXHxN0ef+Q4eZtIAThJ
	KXNXQ4UIUyiRXItgOdAUZyJWWdCz5IYyewdabpHvVxhoHQ0yPxUAknehPuZFgpw==
X-Received: by 2002:a81:7287:0:b0:36d:451:1ae3 with SMTP id n129-20020a817287000000b0036d04511ae3mr17133999ywc.412.1669030022444;
        Mon, 21 Nov 2022 03:27:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7BNoHMhxvvMA27fb1kHBCpUPwqHXSX7q0wPPmbNiJG25wYB+LqAmx8G+JjyU2pjpZ5G11Fsrh4Vg711umxRCY=
X-Received: by 2002:a81:7287:0:b0:36d:451:1ae3 with SMTP id
 n129-20020a817287000000b0036d04511ae3mr17133979ywc.412.1669030022234; Mon, 21
 Nov 2022 03:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-5-hal.feng@starfivetech.com> <CAJM55Z8z9OLU5_Z0HiyKN0mMZHrKSkGJqbP_1QOw3nEt6b5MxQ@mail.gmail.com>
 <4dd7ebaf-89db-3c22-e8bc-e9f7211fa06b@starfivetech.com>
In-Reply-To: <4dd7ebaf-89db-3c22-e8bc-e9f7211fa06b@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 21 Nov 2022 12:26:45 +0100
Message-ID: <CAJM55Z-eQMXES0v4m-a6THyydyCDhqD0=ETjk8_bWxTw_Q5sLw@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] reset: starfive: Factor out common JH71X0 reset code
To: Hal Feng <hal.feng@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_032706_251027_16F3A0E4 
X-CRM114-Status: GOOD (  26.11  )
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

On Mon, 21 Nov 2022 at 10:24, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Sat, 19 Nov 2022 00:39:35 +0800, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> > > diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> > > similarity index 50%
> > > copy from drivers/reset/starfive/reset-starfive-jh7100.c
> > > copy to drivers/reset/starfive/reset-starfive-jh71x0.c
> > > index fc44b2fb3e03..1e230f3f9841 100644
> > > --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> > > +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
>
> [...]
>
> > > -static int __init jh7100_reset_probe(struct platform_device *pdev)
> > > +int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
> > > +                                  void __iomem *assert, void __iomem *status,
> > > +                                  const u64 *asserted, unsigned int nr_resets,
> > > +                                  bool is_module)
> > >  {
> > >         struct jh7100_reset *data;
> > >
> > > -       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > > +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > >         if (!data)
> > >                 return -ENOMEM;
> > >
> > > -       data->base = devm_platform_ioremap_resource(pdev, 0);
> > > -       if (IS_ERR(data->base))
> > > -               return PTR_ERR(data->base);
> > > -
> > >         data->rcdev.ops = &jh7100_reset_ops;
> > > -       data->rcdev.owner = THIS_MODULE;
> > > -       data->rcdev.nr_resets = JH7100_RSTN_END;
> > > -       data->rcdev.dev = &pdev->dev;
> > > -       data->rcdev.of_node = pdev->dev.of_node;
> > > +       if (is_module)
> > > +               data->rcdev.owner = THIS_MODULE;
> >
> > nit: consider just passing the owner directly, so this would just be
> > data->rcdev.owner = owner;
> >
> > ..and callers that used false can just pass NULL.
>
> Yeah, will fix it.
>
> >
> > > +       data->rcdev.nr_resets = nr_resets;
> > > +       data->rcdev.dev = dev;
> > > +       data->rcdev.of_node = of_node;
> >
> > Is it important to register this with the auxiliary device and not
> > just use the parent device?
>
> I'm not sure whether it still works if we use the same device,

Try it.

> but
> it's general to separate the devices of clock and reset. They have
> different device names and different drivers.
>
> Best regards,
> Hal
>
> > If not you can just always pass the device that has the right of_node
> > and have this be
> >
> > data->rcdev.of_node = dev->of_node;
> >
> > > +
> > >         spin_lock_init(&data->lock);
> > > +       data->assert = assert;
> > > +       data->status = status;
> > > +       data->asserted = asserted;
> > >
> > > -       return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> > > +       return devm_reset_controller_register(dev, &data->rcdev);
> > >  }
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

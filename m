Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7908DC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEfYkDAEikjQT5LVeZ/V4VuQozf7edXWRPAXHEHHz7A=; b=s59SemN/Cn1nVG
	DMUUmkjfHqFwZIAUyE+MJR1KDA4Z+/c+QgoKU20JFr7P8xTMQNq/9OU5vHmidwbnt0BuScfX4Ogzb
	ECaCst4lTWNJJtVnvnQRHvr9xZpqgPNu2tO/Av6Ciojmm6+Qfude/YN4Kkoijl0XMCHuoWqDAf5Gp
	OEoqhuxgKclKoiPyTgbclikuqooWEbNjwKiVgICghJ7xtw7T1R3VWlFL4BXoG9MB11LGBiOnpfa+m
	vszzHYrxYFGqTixRbQPkYnfL+Pzaha/H+yvMOrren3rtYcM5G2onHzyZYJYePUPJgcvkcZSmEpFMH
	/DZLW2Vb55HWcODO/fkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox32E-00BmoG-Dg; Mon, 21 Nov 2022 09:24:14 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox32A-00Bmlu-89
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 09:24:12 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4D39E24E226;
	Mon, 21 Nov 2022 17:23:39 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 17:23:39 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Nov
 2022 17:23:38 +0800
Message-ID: <4dd7ebaf-89db-3c22-e8bc-e9f7211fa06b@starfivetech.com>
Date: Mon, 21 Nov 2022 17:23:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 04/14] reset: starfive: Factor out common JH71X0 reset
 code
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-5-hal.feng@starfivetech.com>
 <CAJM55Z8z9OLU5_Z0HiyKN0mMZHrKSkGJqbP_1QOw3nEt6b5MxQ@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z8z9OLU5_Z0HiyKN0mMZHrKSkGJqbP_1QOw3nEt6b5MxQ@mail.gmail.com>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_012410_594908_75973E80 
X-CRM114-Status: GOOD (  18.59  )
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

On Sat, 19 Nov 2022 00:39:35 +0800, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> > diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> > similarity index 50%
> > copy from drivers/reset/starfive/reset-starfive-jh7100.c
> > copy to drivers/reset/starfive/reset-starfive-jh71x0.c
> > index fc44b2fb3e03..1e230f3f9841 100644
> > --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> > +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c

[...]

> > -static int __init jh7100_reset_probe(struct platform_device *pdev)
> > +int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
> > +                                  void __iomem *assert, void __iomem *status,
> > +                                  const u64 *asserted, unsigned int nr_resets,
> > +                                  bool is_module)
> >  {
> >         struct jh7100_reset *data;
> >
> > -       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> >         if (!data)
> >                 return -ENOMEM;
> >
> > -       data->base = devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(data->base))
> > -               return PTR_ERR(data->base);
> > -
> >         data->rcdev.ops = &jh7100_reset_ops;
> > -       data->rcdev.owner = THIS_MODULE;
> > -       data->rcdev.nr_resets = JH7100_RSTN_END;
> > -       data->rcdev.dev = &pdev->dev;
> > -       data->rcdev.of_node = pdev->dev.of_node;
> > +       if (is_module)
> > +               data->rcdev.owner = THIS_MODULE;
> 
> nit: consider just passing the owner directly, so this would just be
> data->rcdev.owner = owner;
> 
> ..and callers that used false can just pass NULL.

Yeah, will fix it.

> 
> > +       data->rcdev.nr_resets = nr_resets;
> > +       data->rcdev.dev = dev;
> > +       data->rcdev.of_node = of_node;
> 
> Is it important to register this with the auxiliary device and not
> just use the parent device?

I'm not sure whether it still works if we use the same device, but
it's general to separate the devices of clock and reset. They have
different device names and different drivers.

Best regards,
Hal

> If not you can just always pass the device that has the right of_node
> and have this be
> 
> data->rcdev.of_node = dev->of_node;
> 
> > +
> >         spin_lock_init(&data->lock);
> > +       data->assert = assert;
> > +       data->status = status;
> > +       data->asserted = asserted;
> >
> > -       return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> > +       return devm_reset_controller_register(dev, &data->rcdev);
> >  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

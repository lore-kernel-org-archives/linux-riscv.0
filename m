Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD457C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZW+iUR+VuaZZPrhH25tV0ARJPIeFSueUxa5p6SwO6+c=; b=mcYtMjTNkcCXlV
	nJaebmf/uA7wK5DY0PSFSnoTJwfRvQxCuY06y7isB9B8l9OBEOPv016lhl6zXdynx9GqJ1akGEc2r
	C2eAvpy/GPy6wjwqUocv36t13n//gCkRwWEo+BIyGKXUhddG4/TlTCQYesPPO3iBEk5pwwdJeNu3B
	ozZJ9ryMKNoZrb/KCz+IM5nbnH0nwfW6ANyqpHEz5piaYc1oaQdCRTLdAiLKv8YNsCHk0/7/igoQM
	eiYHIO/S2/YaF/ArmLrU67kwj3wfQFf/rh4Pe2pGD5CibUUC1eWN5KKCYMKFGqo0s/zulZ4EuBIdM
	P9LCClCZYmWy7ZXPZMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjvc-00F3hl-7y; Wed, 23 Nov 2022 07:12:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxjvX-00F3WY-9v
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 07:12:14 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 02AD024E047;
	Wed, 23 Nov 2022 15:11:39 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Nov
 2022 15:11:39 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Nov
 2022 15:11:37 +0800
Message-ID: <771e92e8-5641-67db-22aa-0533139a588b@starfivetech.com>
Date: Wed, 23 Nov 2022 15:11:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 6/8] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-7-hal.feng@starfivetech.com> <Y3d0GE7msiWGlRcd@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y3d0GE7msiWGlRcd@spud>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_231211_651576_8254812A 
X-CRM114-Status: GOOD (  17.22  )
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

On Fri, 18 Nov 2022 20:01:28 +0800, Conor Dooley wrote:
> On Fri, Nov 18, 2022 at 09:17:12AM +0800, Hal Feng wrote:
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > new file mode 100644
> > index 000000000000..c22e8f1d2640
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -0,0 +1,437 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> 
> @Emil, I feel like I have to ask given the 2022 date, but should this
> stuff be attributed to your canonical address or is this fine?
> 
> Other than that, a cursory check /looks/ fine, other than the:
> 
> > +       gmac0_rgmii_rxin: gmac0_rgmii_rxin {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency = <0>;
> > +       };
> 
> If you remove the clock-frequency = <0> bit, dtb validation will force
> people to set the value in jh7110-board.dts which I'd prefer to rely on
> than a comment.

Okay, will remove the `clock-frequency = <0>` in this file.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFF2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4eYewKPMdOwkBFxJ++1Oepp+uduBRIbM1A8tS2pj38=; b=nWbAJCgSQmXyyz
	yKGVtC2OfJIMEMGXMQJsiYu5oYOnTQYOy+2PrUc2peM/9ecxDeHiK+N5mVtI0dd3mwYhCs6dPbJl6
	KMCn0jTzmNerqrSlg6/2FU6mjM0RkSqYBqvdi8YsUVhRGfAir5KRutOff8og3UhaejlFCHzggZnsz
	vn8Oz13GJ++dNvCV/aL11BXzxl9aIs8vGSpF1j9xwFJWgC/zb9IDantpYeOeaQJWHIUQJ44imhJER
	do3eyGGhtYb/BFdurRB+DndB95owjKsTwyG/OM4GsXALI7YOJSpbJtK7eEXm78RPVdfspME8T/CQv
	Q/4fJVI2Plv5xQHcMdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XRj-001szw-NR; Fri, 23 Dec 2022 02:06:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XQs-001sI0-Qs
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 02:05:13 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0459F24E24A;
	Fri, 23 Dec 2022 10:04:17 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 10:04:17 +0800
Received: from [192.168.125.65] (183.27.97.120) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 10:04:16 +0800
Message-ID: <dfe1ea7a-f3b3-4c79-787e-6fa0d3b08ca0@starfivetech.com>
Date: Fri, 23 Dec 2022 10:05:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 1/7] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive 2 board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-2-hal.feng@starfivetech.com>
 <4c528a35-d3eb-db20-2a1e-3d79d0977d91@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <4c528a35-d3eb-db20-2a1e-3d79d0977d91@linaro.org>
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_180511_262232_6AD83FF2 
X-CRM114-Status: GOOD (  11.27  )
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

On Tue, 20 Dec 2022 11:05:51 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2022 02:12, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > Add device tree bindings for the StarFive JH7110 RISC-V SoC
> > and the VisionFive 2 board equipped with it.
> > 
> > VisionFive 2 board has version A and version B, which are
> > different in gmac and phy chip. The version A board has one
> > 1000Mbps and one 100Mbps Ethernet ports while the version B
> > board has two 1000Mbps Ethernet ports.
> > 
> > Link: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> > Link: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
> I assume you did not add my tag because of changes?

Yes, it might not the original one to which you wanna add the
Acked-by tag.

Best regards,
Hal

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

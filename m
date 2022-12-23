Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824ABC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 02:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjAnd4QoAZG7/fvqAr2+N/mOSd4J9YXq5nI/AeSf5fY=; b=NBTT7HrhQaR2Op
	6kxb4iSDJFMNJWEbUS1uzd7AAzbUjM+CCiX/YIYw8Au4sBc0Cmr/Jr6osY26WLWZPEDdOjE+AXLdK
	NpEd/FGnwZ1LU4dzLg7SQebYkI0IMSkN1+xAp4/GGuh8Gaj0wIbkNtzG5sLGju9kIczkaTbHpbkQS
	dB0Qv0ac66tvEtJVUdU6NGMztp8Oty3NkVx1sEjC+xrKAULagGwoyqQ2tnDQMVQfz4UZn0iuT3Nqr
	f3XwtKXeDuOfGEeoEW2XQorDdKgSbzJ/klhFv5E0RD8QnK1/JDfE/sITqViUz6jbhxQ+Qoq6W3Wh7
	Wzd1p4xjaCVl5COqcjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XaN-001xJj-DW; Fri, 23 Dec 2022 02:14:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XaH-001xGm-8V
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 02:14:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6F92924E233;
	Fri, 23 Dec 2022 10:14:35 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 10:14:35 +0800
Received: from [192.168.125.65] (183.27.97.120) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 10:14:34 +0800
Message-ID: <91397902-e11d-89c3-1fe4-d262a463b0b9@starfivetech.com>
Date: Fri, 23 Dec 2022 10:15:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 1/7] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive 2 board
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-2-hal.feng@starfivetech.com> <Y6Ih/oG661gkA9Rd@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y6Ih/oG661gkA9Rd@spud>
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_181453_527741_4B2A44E6 
X-CRM114-Status: GOOD (  11.24  )
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

On Tue, 20 Dec 2022 20:58:38 +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 09:12:41AM +0800, Hal Feng wrote:
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
> Unless Emil objects, I'll queue this for 6.3 once -rc1 has been tagged.

Thank you so much.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

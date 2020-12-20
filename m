Return-Path: <SRS0=wI7M=FY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD50C4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Dec 2020 05:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B20A233CE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Dec 2020 05:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B20A233CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hmHHFskgJC5FCnob1emVIwW1HK5reDiOnK7s+c9bkg8=; b=g4BzfvZqU83HQp40mKBXfKAcx
	UNbkU6yuDq1WEbKfI5FN2/AXTrB9V/v6ktCvuWPaNscvYTIAW1bqmBr5KGfzttlqq74cxC+/631PN
	2qToICC8O6sl6dMUpfriQDVow/s6jI3rODk+sCPtEHyrJflrC1Vzp0wESRIb+NDroyL9TAP1WjR+R
	kQIxm9pTZeC/alSKsX+kfWgEqB1tFfZ1FH2BNsjEl9aSJ12GoTSetEbkhk+nGB5xRRv4AbBsNbKoE
	cNsqgOL7hcZQ6Z32b4aYp00Y/GlnYLviwFKMWHCZoFhgiHkDOpOw/B7rne2FKboWv8KahLc1WESOH
	ezl6dMvZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqrN5-00079W-KK; Sun, 20 Dec 2020 05:35:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqrN3-00079A-S7
 for linux-riscv@lists.infradead.org; Sun, 20 Dec 2020 05:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608442504;
 bh=aIFosRjp0pvkc7SjVi5j1znmZz4mlFjF/3Le9rkNXvw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OUPgAhjqV84wDwcNTFEfgf5cCxdnSyI6X244yxCQ/4HKA8VLf+g6B8GYj/pRVYc/e
 GkcMovrHkCP2M2Qkb6uYeqIpAodyDmSqZSN4GyQxIfpZCsxO0PV4c40SJkD/HNAg4p
 slsRhyfuGBu/zmRxX8N+K5liQvNqYSw84cbLBB+ZYS7XxxL0S6wfeXUn8TnUp2Dg8e
 RpHvkhcXp7SSvsIRBLf3MXgnxLvn8nLQ8RK+LCv3CoFYJc2rKf7hR5DSPonNLYNcNy
 BRdIPrqMcS12RfywFvjY3jmNUOYAri/36JaeY5o8AYzNoykV34012mHoEQjAg2ZAA3
 LauaD7TSl5pcg==
MIME-Version: 1.0
In-Reply-To: <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
 <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
 <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,
 k210-clk bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Sat, 19 Dec 2020 21:35:02 -0800
Message-ID: <160844250293.1580929.6654681087428087193@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_003506_023366_61D6461E 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-12-17 02:51:20)
> On 2020/12/17 19:49, Stephen Boyd wrote:
> > I was thinking of just applying this DT binding patch now so it gets
> > merged into the next -rc1. Then anyone can use the defines because
> > they're in Linus' tree and wherever the dts file ends up can just base
> > on -rc1. I probably won't merge the clk driver until v5.12 given that
> > the merge window is open.
> 
> OK. Makes sense. Sending just the clk binding patch then, with the K210_CLK_ACLK
> clock definition left in.
> 

Did you send it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

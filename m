Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60184C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2WxQsLozBnXrk256Iy4JYCPtPuV4Clzae32u6RjS84=; b=eh0lC9mTek5sEK
	eGnxKxIBfIDPBWsRyzFkEZ//wBA0ycQGsvcKAsvCYsluI/tpMLQCwn7TpW9yQT+WrhjPVLQwqU1Vy
	DOZpKxuCw8VlzIzNhLNVbZpQtt4tsRY96gBq1clXpDf/cIGgriQNi7W3LtgX5qAqtLFwlqBbGhB9s
	91NXY5WQ7bOhgs1nt4x6jcdjFtnYK+y3oeyzmanjlnFWZW3Kw0NyrYvMJoKepNbYpGPNYHWui52la
	dOrzgfxkJFflSbIXD6O6+liQDTpGPAmwpv3zDJI+tKuxfzaGKzmP4oZI0++hyAgq0Kxxrq3S0p4S7
	MOH8Jb74sux4EJs48hEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOqB-006Neo-Nh; Tue, 22 Nov 2022 08:41:15 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOq3-006NOV-S3
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:41:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DDB3C24E32C;
	Tue, 22 Nov 2022 16:40:37 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 16:40:37 +0800
Received: from [192.168.125.106] (113.72.144.23) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 16:40:37 +0800
Message-ID: <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
Date: Tue, 22 Nov 2022 16:40:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
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
 <20221118011714.70877-5-hal.feng@starfivetech.com> <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y3dvCPP1g0LzzHFO@spud>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_004108_234351_FB90486A 
X-CRM114-Status: GOOD (  11.81  )
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

On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
> On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> > On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > > 
> > > This cache controller is also used on the StarFive JH7110 SoC.
> > 
> > "... and configured identically to that of the FU740"?
> > Anyways,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Actually, after looking at the next patch - why can you not fall back to
> the fu740 one since you appear to have the same configuration as it?

Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
compatible in dts.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

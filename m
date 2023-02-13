Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1110C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijMX1jN43DM36i38G8tse7df3Ux1Vl+Q42J+U3BhZ3I=; b=ScO33keLVA7doS
	ZgCYzBWCtDW/b30hnnJystvO0q/bW+dRRNn/ieLATv5Rqf7w8h+YAWScWb1bviIpj4uiznU3XKTkj
	XCHqmr21Ga3bGgKjucs8h2KqKNDZGGCsihZCIqdwxp25qr5ZipAErVJgmXoKkdGwJ4MYeTUqcYVx6
	2cpsHv7LwXJjDGQ5sNFims45hOIsNNtjlIYfvK4SHhgeNmiYFuMCjnI9zlZ5Mjf+OmyWo/JzPE1hm
	KRagXc17f5vvEOedy+JJ9ZKKeLXQBLKGT3YRZ7m4B2vnyzGSx7FC7Mv69sSkT+yyOuh5imvub4HmX
	/KlPBLW2fI1A7ghirNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVLe-00DxC1-Ei; Mon, 13 Feb 2023 09:42:10 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVLL-00Dwvr-3G
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:42:08 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 75D0B24E154;
	Mon, 13 Feb 2023 17:41:04 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 17:41:04 +0800
Received: from [192.168.125.110] (183.27.97.168) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Feb
 2023 17:41:03 +0800
Message-ID: <e1d2646e-b5de-298e-bb91-19ad12fd31af@starfivetech.com>
Date: Mon, 13 Feb 2023 17:41:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
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
 <20221220011247.35560-7-hal.feng@starfivetech.com> <Y6zHy9oL4xzl+6Rd@spud>
 <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
 <Y9og8Q2UnJ452KH/@wendy>
 <df6755ed-a358-ea01-d89e-f3c004b9c297@starfivetech.com>
 <Y9wR7Up+iObw5qoE@spud> <Y+TU98PLIvtkD8/R@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y+TU98PLIvtkD8/R@wendy>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_014151_912406_4ED947EA 
X-CRM114-Status: GOOD (  19.83  )
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

On Thu, 9 Feb 2023 11:11:51 +0000, Conor Dooley wrote:
> On Thu, Feb 02, 2023 at 07:41:33PM +0000, Conor Dooley wrote:
>> On Fri, Feb 03, 2023 at 02:56:41AM +0800, Hal Feng wrote:
>> > On Wed, 1 Feb 2023 08:21:05 +0000, Conor Dooley wrote:
>> > > On Wed, Feb 01, 2023 at 03:21:48PM +0800, Hal Feng wrote:
>> > >> On Wed, 28 Dec 2022 22:48:43 +0000, Conor Dooley wrote:
>> > >> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> 
>> FWIW, the deadline for getting material in for v6.3 has already passed,
>> so you can send the next version of this series without waiting for
>> clarification on the compatibles & ISA string. We should have plenty of
>> time to get those fixed up before the series gets applied.
> 
> Also, as it looks like the pinctrl driver is going to land in time for
> v6.3, that leaves just this series and the clock driver required for
> base support.
> 
> In the original submission, you sent the clock driver and dt in the same
> series & I think it might make the process a bit faster if you sent them
> both together for the next version again.
> 
> That way, both the drivers and dts can go together as their have an
> inter dependence.
> 
> That's my opinion anyway, will make trying to sequence things between
> trees easier.

Good idea. But how can I write the change log if we do so? Will it make
the history confused? Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

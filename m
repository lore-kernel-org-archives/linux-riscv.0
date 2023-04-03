Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F180CC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 07:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zL857xb6uV7zyljUdURGlD3WRnBw10WqOThIwWsQr88=; b=iaRNQdfkt2erDZ
	4i3yjtppPZFm4HduPbxqJvtrxxhiDRqCXLUKIkxJcb70LcqMn2E0ZIezsIXfMP4cCtRCFJR4GCAlw
	X0GExaX4HJc3EvG4V2frBq1vSXuTEsQ+J3oM8jw3lwCx+N/Eufx176spP4i779wa2D+Lu5sZH9S8w
	01bve3vJ48pyK1vClw8CMNuRphEzkiM3j+VJ4Bo5KLkADpsddPPPd6JMhg+6NldWkv0XvBripl9d7
	a6p0blvJf6lLqfBySocEYQewHdTY6PZncMixXhtPVYltYd67vp+TfIGL1b/vnyEgF1VWQ66oldmaq
	xxhFnt4rbavOjy8giK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEen-00EOxv-18;
	Mon, 03 Apr 2023 07:31:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjEei-00EOtt-1r
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 07:31:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CA09124E22F;
	Mon,  3 Apr 2023 15:30:34 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 15:30:34 +0800
Received: from [192.168.125.87] (183.27.97.179) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 15:30:33 +0800
Message-ID: <ce4ee037-c53c-5bd4-8968-437ee21c9c51@starfivetech.com>
Date: Mon, 3 Apr 2023 15:30:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <acb36897-8085-4f41-9b68-b243467ffc6f@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <acb36897-8085-4f41-9b68-b243467ffc6f@spud>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_003109_102037_EE9ECF48 
X-CRM114-Status: GOOD (  26.20  )
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

On Sun, 2 Apr 2023 20:19:41 +0100, Conor Dooley wrote:
> Hey Hal,
> 
> On Sat, Apr 01, 2023 at 07:19:12PM +0800, Hal Feng wrote:
>> This patch series adds basic clock, reset & DT support for StarFive
>> JH7110 SoC.
>> 
>> @Stephen and @Conor, I have made this series start with the shared
>> dt-bindings, so it will be easier to merge.
> 
> Thanks. I probably should have asked for that, makes my life easier
> that's for sure!

My pleasure.

> 
>> @Conor, patch 1, 2, 16~21 were already in your branch. Patch 22 is the
>> same with the patch [1] I submitted before, which you had accepted but
>> not merge it into your branch.
> 
> I hadn't merged that into anywhere, so I just went and dropped the
> original incarnation of that branch and have re-created it.
> I don't recall there being a maintainers pattern error (from running
> scripts/get_maintainer.pl --self-test=patterns) with what I had done in
> my branch, but with your patch 1 applied I see one. To save myself a
> complaint from LKP, I stripped out the MAINTAINERS bits from patch 1
> into their own patch that can go with the clock/reset bits.
> 
> I squashed 22 into "riscv: dts: starfive: Add initial StarFive JH7110
> device tree" since there's no reason to add something knowingly
> incorrect IMO.
> 
> I've gone and pushed out the following as riscv-jh7110_initial_dts:
> riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device
> riscv: dts: starfive: Add StarFive JH7110 pin function definitions
> riscv: dts: starfive: Add initial StarFive JH7110 device tree
> dt-bindings: riscv: Add SiFive S7 compatible
> dt-bindings: interrupt-controller: Add StarFive JH7110 plic
> dt-bindings: timer: Add StarFive JH7110 clint
> dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
> dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
> 
> And the rest as riscv-jh7110_clk_reset:
> MAINTAINERS: generalise StarFive clk/reset entries

For this patch, I find something to improve.
1. Could you please help me sort the StarFive entries in MAINTAINERS?
"STARFIVE JH71X0 CLOCK DRIVERS" should be added after
"STARFIVE JH7110 MMC/SD/SDIO DRIVER".

2. A "S" should be added at the end of
"STARFIVE JH7100 RESET CONTROLLER DRIVER".

I have tested your branch and have no comments on the other patches.

> reset: starfive: Add StarFive JH7110 reset driver
> clk: starfive: Add StarFive JH7110 always-on clock driver
> clk: starfive: Add StarFive JH7110 system clock driver
> reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
> reset: starfive: Rename "jh7100" to "jh71x0" for the common code
> reset: starfive: Extract the common JH71X0 reset code
> reset: starfive: Factor out common JH71X0 reset code
> reset: Create subdirectory for StarFive drivers
> reset: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
> clk: starfive: Rename "jh7100" to "jh71x0" for the common code
> clk: starfive: Rename clk-starfive-jh7100.h to clk-starfive-jh71x0.h
> clk: starfive: Factor out common JH7100 and JH7110 code
> clk: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
> dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
> dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
> 
> <https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/refs>
> 
> As it looks like everything has been resolved in terms of comments on
> v6, provided LKP doesn't complain or people don't spot something else,
> my plan is to send Stephen a PR around Wednesday for the driver bits.

Thanks for your work.

Best regards,
Hal

> 
> Please LMK if I screwed up anything,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

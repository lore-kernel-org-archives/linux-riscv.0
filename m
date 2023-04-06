Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA96C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjN9zF404T6qWhY2aj09pV1et1t3Bry2SUPposmr+Lo=; b=RLFVS+9qrTZbGW
	DZW1dv18CZE0chxjwsb7B9QXokzx25qR2Sq5MjWU9e5NoMavBO9tRN/NCQHFM8afiTa4Ot5ZpPUBi
	mYqAXGQRfDy6bD4sDO1fgPaFu7wJeASC0n3bMicvcgws1/i+mVJHGiXstwIM81woZS638Zrxkee97
	UE3ac+h3fxVe9psOZbvGhU422KlP/TLsxKfobAbfEVF7tqhD+CL3ipkcEoi6ebn+21F0DfjsWYewn
	YfoAoisVSDpfi5qOzDNs3kkmxQRc1Xqxlg5FKrtkfJSRjyAJ3sDUYh8C4T9G/yrrRtFVchFE3j2A3
	ldE9KmpNK/J2njuEjzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJf9-006aCs-30;
	Thu, 06 Apr 2023 07:04:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkJf5-006a9a-05
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 07:04:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B452724E32C;
	Thu,  6 Apr 2023 15:03:16 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 15:03:16 +0800
Received: from [192.168.125.87] (183.27.97.179) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 15:03:15 +0800
Message-ID: <ce311dcf-67a5-bf15-d0da-88967baf4ee9@starfivetech.com>
Date: Thu, 6 Apr 2023 15:03:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 00/22] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
To: Conor Dooley <conor@kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Marc
 Zyngier" <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <20230405-wharf-rejoin-5222e5958611@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230405-wharf-rejoin-5222e5958611@spud>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_000359_390422_B699BCFF 
X-CRM114-Status: GOOD (  14.86  )
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

On Wed,  5 Apr 2023 22:30:45 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Sat, 01 Apr 2023 19:19:12 +0800, Hal Feng wrote:
>> This patch series adds basic clock, reset & DT support for StarFive
>> JH7110 SoC.
>> 
>> @Stephen and @Conor, I have made this series start with the shared
>> dt-bindings, so it will be easier to merge.
>> 
>> @Conor, patch 1, 2, 16~21 were already in your branch. Patch 22 is the
>> same with the patch [1] I submitted before, which you had accepted but
>> not merge it into your branch.
>> 
>> [...]
> 
> Applied to riscv-dt-for-next, thanks!

Thank you so much.

> 
> [01/22] dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
>         https://git.kernel.org/conor/c/7fce1e39f019
> [02/22] dt-bindings: clock: Add StarFive JH7110 always-on clock and reset generator
>         https://git.kernel.org/conor/c/3de0c9103258
> 
> These two are shared with clk.
> 
> [16/22] dt-bindings: timer: Add StarFive JH7110 clint
>         https://git.kernel.org/conor/c/1ff5482ab9a5
> [17/22] dt-bindings: interrupt-controller: Add StarFive JH7110 plic
>         https://git.kernel.org/conor/c/8406d19ca049
> 
> I took these bindings too, as Palmer has done that in the past for new
> SoC support.
> 
> [18/22] dt-bindings: riscv: Add SiFive S7 compatible
>         https://git.kernel.org/conor/c/8868caa2a073
> [19/22] riscv: dts: starfive: Add initial StarFive JH7110 device tree
>         https://git.kernel.org/conor/c/60bf0a39842e
> [20/22] riscv: dts: starfive: Add StarFive JH7110 pin function definitions
>         https://git.kernel.org/conor/c/e22f09e598d1
> [21/22] riscv: dts: starfive: Add StarFive JH7110 VisionFive 2 board device tree
>         https://git.kernel.org/conor/c/54baba33392d
> [22/22] riscv: dts: starfive: jh7110: Correct the properties of S7 core
>         (squashed)
> 
> Hal, can you get your folks to resend whatever dts bits that are now
> applicable? IOW, the dt-bindings for the entries are in a for-next
> branch for some subsystem.

Of course. As far as I know, these nodes include trng / pmu / mmc / qspi.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

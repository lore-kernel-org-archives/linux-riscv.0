Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A891C6FD1C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9La1rx0OmMeIOBZyuS/Le1fUPE5eGzeSj5t+MfBZBQ=; b=qczbWSaVpPL0Ft
	eRrmTH5lmUaqZq6cZUJFDlpcJbboUQTAJxdO+umC6FYcgwYFvEOSck9TMP9rnl5Ah1yHqGn761oKP
	M/2zaUBi67daIXwSp4jmAVX/dWNMPUiDJsuhfuakJqowgx6OzAA0UFgNwaynX4m6FwJiK/UcsMmId
	FDnkxS42abMhHKhUL1RoSD2Mv046Dyv55/FVmowUlq600Nx4V5BathXi+2hVH39MKrrPhd8kL2uhJ
	T5+UmgISKOE/LiLDWhqhygaoPwnl+x7P95QqjZLKz6+iIMlQf5ZVTWW5g6HswXLhcWw1ryEOBjG9W
	lxnrFCrhR+KVMe2t4AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYTF-00464W-C0; Mon, 13 Mar 2023 03:03:33 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYTB-00463U-BQ
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:03:31 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B984F24E21A;
	Mon, 13 Mar 2023 11:03:11 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:49:55 +0800
Received: from [192.168.125.74] (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:49:54 +0800
Message-ID: <f9be1acb-a3f3-aa31-bcf6-27c4396684d6@starfivetech.com>
Date: Mon, 13 Mar 2023 10:49:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 12/21] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <devicetree@vger.kernel.org>, "Albert
 Ou" <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, <linux-kernel@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley
	<conor@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, Marc Zyngier
	<maz@kernel.org>, <linux-riscv@lists.infradead.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Michael Turquette
	<mturquette@baylibre.com>, <linux-clk@vger.kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-13-hal.feng@starfivetech.com>
 <167854426637.141815.17209731765325744156.robh@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <167854426637.141815.17209731765325744156.robh@kernel.org>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_200329_646432_C35E423C 
X-CRM114-Status: GOOD (  13.68  )
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

On Sat, 11 Mar 2023 08:18:03 -0600, Rob Herring wrote:
> On Sat, 11 Mar 2023 17:07:24 +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add bindings for the always-on clock and reset generator (AONCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-aoncrg.yaml         | 107 ++++++++++++++++++
>>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  18 +++
>>  .../dt-bindings/reset/starfive,jh7110-crg.h   |  12 ++
>>  3 files changed, 137 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>> 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> Missing tags:
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch has been changed a lot and I am not sure whether it's still
the one you want. So I removed the Reviewed-by tag.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

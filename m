Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AD7C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaQpg6Cf2kwa7gKj5GLn8ZtKJMVypbN3JfjV3fWqLbM=; b=kGCI7+ZvLwEgDF
	VEaTFuOEPjwDoYf5CSEkLP45EGWu1Qpg2FvBJGdNYxIILqJSYmkultjoFcDyGkS1bNM4zD8mqKx/r
	N3PQYU6UwU3O9MsSafXQaXn4UwtKAYJBh9gWqFWJRU/sN0SbdaNeGYV8OtTmAqUWCFSW42cr+KrOw
	hjGkFF2IrOmBPqs+8YuXSYibE8VEBPzTNKp79pSERxdnAsMj8w2g+x+o0X4dVRyLT///+UVf+z799
	L2C5XJ2Uc+47lf2icXwYzgZQK1QiWx3Kqhz2lDoqrN2kg6BZxn6Ro9Tamt6bmzgEAQ3naCoFJAO1C
	MfysWZqwiNi3RdS5uWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIOS-0068oK-7e; Wed, 15 Feb 2023 14:04:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIOM-0068kz-Gi
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:04:18 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7AD6B24E313;
	Wed, 15 Feb 2023 22:03:45 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 22:03:45 +0800
Received: from [192.168.125.110] (183.27.97.168) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 22:03:44 +0800
Message-ID: <af42ed91-95aa-014a-1efb-6f70ee5a0433@starfivetech.com>
Date: Wed, 15 Feb 2023 22:03:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Conor
 Dooley" <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z9Y_fF+4Dtu++C_jVS0+ohXp5U0GyuJCBpUh-SpTMGrVA@mail.gmail.com>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_060414_933182_FCD6AAB6 
X-CRM114-Status: GOOD (  19.99  )
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

On 2/14/2023 5:53 PM, Emil Renner Berthing wrote:
> On Tue, 20 Dec 2022 at 02:12, Hal Feng <hal.feng@starfivetech.com> wrote:
>>
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
>> which has version A and version B. Support booting and basic
>> clock/reset/pinctrl/uart drivers.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>>  .../jh7110-starfive-visionfive-2-va.dts       |  13 ++
>>  .../jh7110-starfive-visionfive-2-vb.dts       |  13 ++
>>  .../jh7110-starfive-visionfive-2.dtsi         | 111 ++++++++++++++++++
>>  4 files changed, 138 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
>> index 0ea1bc15ab30..79e925a4a227 100644
>> --- a/arch/riscv/boot/dts/starfive/Makefile
>> +++ b/arch/riscv/boot/dts/starfive/Makefile
>> @@ -1,2 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
>> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-va.dtb jh7110-starfive-visionfive-2-vb.dtb
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
>> new file mode 100644
>> index 000000000000..188d3fddbe88
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-va.dts
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110-starfive-visionfive-2.dtsi"
>> +
>> +/ {
>> +       model = "StarFive VisionFive 2 VA";
>> +       compatible = "starfive,visionfive-2-va", "starfive,jh7110";
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
>> new file mode 100644
>> index 000000000000..f75c10536f84
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-vb.dts
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110-starfive-visionfive-2.dtsi"
>> +
>> +/ {
>> +       model = "StarFive VisionFive 2 VB";
>> +       compatible = "starfive,visionfive-2-vb", "starfive,jh7110";
> 
> Hi Hal,
> 
> I just want to double check, is "VisionFive 2 VA" / "visoinfive-2-va"
> and "VisionFive 2 VB" / "visionfive-2-vb" really what you want? I
> still think having these names match what is printed on the silkscreen
> makes it a lot easier for everybody. Even your own releases calls the
> boards "v1.2A" and "v1.3B":
> https://github.com/starfive-tech/VisionFive2/releases/
> 
> So I'd suggest
> model = "StarFive VisionFive 2 v1.3B";
> compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
> 
> I haven't seen these "VA" and "VB" anywhere else, so if you don't want
> the version numbers and can promise that there will be no incompatible
> future revisions of the boards then maybe just drop the "V". Eg.
> model = "StarFive VisionFive 2 B";
> compatible = "starfive,visionfive-2-b", "starfive,jh7110";

The version A board has reached the end of life. As far as I know, the
version B board will not update also unless there are some important
requirements and StarFive decides to update. Furthermore, it's too late
to change the compatible as patch 1 was already accepted. Will it be
easier to read if I modify it as below?

	model = "StarFive VisionFive 2 vB";
	compatible = "starfive,visionfive-2-vb", "starfive,jh7110";

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

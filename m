Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DFDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 01:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B1wJejZ+grzohGwwYsiFTfBFoTkj+I7pr2NOH0NwEk=; b=lMlCjc1w2JMnTx
	08N6WU2gIM4fLr3azq08vQ1ieBbvQCenyoQjJt8aOVseo1xQ49S6J7VjBGkIAegPc4BHShPQbl2xS
	P4BefD9X2Ee4RY0CUDqsVuiLTEMmAIb90CBqt8+/WBEdt9x7KuqebLpirk3Nx58RuiczJs11B8t9v
	2wqpP+TE/jO0r5CLPCCrX9L9q8CtMohFojjif/ewJBhIWbRCJX1e0Oad/OqV3nIRh+tYDs0K0YOvF
	W2u2kvuJGO3G3AxnYst0c0g2EkJOt1yjTLd6LVdi77MGlcG4amsz+ASmn32iw8Tz2DHPfYljvtqY1
	g5IqiwztE7M5AH5VYEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG8La-001TFR-0P;
	Thu, 21 Dec 2023 01:59:38 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG8LV-001TBJ-1O
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 01:59:36 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3DCDF7FFC;
	Thu, 21 Dec 2023 09:58:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 09:58:32 +0800
Received: from [192.168.125.131] (113.72.145.47) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 09:58:31 +0800
Message-ID: <ec9f653d-7078-4efc-b1b6-bbd7a74a1c18@starfivetech.com>
Date: Thu, 21 Dec 2023 09:50:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clocksource: Add JH7110 timer driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>
References: <20231219145402.7879-1-xingyu.wu@starfivetech.com>
 <20231219145402.7879-3-xingyu.wu@starfivetech.com>
 <CAJM55Z_X9b=TJt7343kQ68ndN1MvH-rFM9hyEZMJRvQnOk72Yg@mail.gmail.com>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <CAJM55Z_X9b=TJt7343kQ68ndN1MvH-rFM9hyEZMJRvQnOk72Yg@mail.gmail.com>
X-Originating-IP: [113.72.145.47]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_175933_779289_5F76274F 
X-CRM114-Status: GOOD (  13.20  )
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

On 2023/12/20 21:59, Emil Renner Berthing wrote:
> Xingyu Wu wrote:
>> Add timer driver for the StarFive JH7110 SoC and select it by
>> CONFIG_SOC_STARFIVE.
>>
>> This timer has four free-running and independent 32-bit counters.
>> Each channel(counter) can trigger an interrupt when timeout even
>> CPU is sleeping. So this timer is used as global timer and register
>> clockevent for each CPU core after riscv-timer registration on the
>> StarFive JH7110 SoC.
>>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  MAINTAINERS                        |   7 +
>>  arch/riscv/Kconfig.socs            |   1 +
>>  drivers/clocksource/Kconfig        |   9 +
>>  drivers/clocksource/Makefile       |   1 +
>>  drivers/clocksource/timer-jh7110.c | 360 +++++++++++++++++++++++++++++
>>  include/linux/cpuhotplug.h         |   1 +
>>  6 files changed, 379 insertions(+)
>>  create mode 100644 drivers/clocksource/timer-jh7110.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9104430e148e..fe0e803606a5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20617,6 +20617,13 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>>  F:	sound/soc/starfive/jh7110_tdm.c
>>
>> +STARFIVE JH7110 TIMER DRIVER
>> +M:	Samin Guo <samin.guo@starfivetech.com>
> 
> Last time I sent a mail to samin.guo@starfivetech.com it bounced. Was that just
> a temporary error?
> 
> /Emil

Oh, This email has been deactivated and I don't have his other personal email.
I had dropped it in the driver but forget it here.
Will fix.

Thanks,
Xingyu Wu

> 
>> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
>> +S:	Supported
>> +F:	Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
>> +F:	drivers/clocksource/timer-jh7110.c
>> +
>>  STARFIVE JH71X0 CLOCK DRIVERS
>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>  M:	Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

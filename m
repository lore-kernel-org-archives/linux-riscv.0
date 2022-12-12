Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FC0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 03:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7jI7OpwNbeLbXIoo3y88n+tqJ8WXlxosr6KI++8WWk=; b=Jjmn9w8ydr0hcn
	Pp9jpz9zo7bblMh8C0QSeJ18oKfeR0V6NthRtxNQmHhScKhft9/dosy/3QGKrTn/aDbRd4Tng+Z4g
	cFEQBiKsJ9Qu1z7l+XqDq/OwjULZPXYydnOUfp0Li0p8w+BUTqSQCIdY79D5UxxDbI8JgDccfGBc3
	WOIZyHBtQaB390bYbW9dnBWIcKessqWEoi/iSwOlcvyUjdCF9hGYBFhMw6e7zi2ckDSqnJl07T8nQ
	1HjOK9wETwGtZVhEhqULFt0ph22MALqWw64jN97q1H/SPtnWAWLHI9np7j+H4Si+bIwzjF55e4Irh
	LoNRgDH4SUPRb678xxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ZMR-0074li-0t; Mon, 12 Dec 2022 03:20:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ZMM-0074cy-Hr
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 03:20:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C95EF24E115;
	Mon, 12 Dec 2022 11:19:40 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Dec
 2022 11:19:40 +0800
Received: from [192.168.125.96] (113.72.147.126) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Dec
 2022 11:19:40 +0800
Message-ID: <c45b1c4c-1e7d-ff08-a07e-0752630339bc@starfivetech.com>
Date: Mon, 12 Dec 2022 11:19:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RESEND PATCH v2 1/3] dt-bindings: power: Add starfive,jh71xx-pmu
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
 <20221208084523.9733-2-walker.chen@starfivetech.com>
 <ac374e10-fb5b-c56c-7c76-b131446533fe@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <ac374e10-fb5b-c56c-7c76-b131446533fe@linaro.org>
X-Originating-IP: [113.72.147.126]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_192006_971333_47007AD3 
X-CRM114-Status: GOOD (  10.88  )
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

On 2022/12/8 17:03, Krzysztof Kozlowski wrote:
> On 08/12/2022 09:45, Walker Chen wrote:
>> Add bindings for Power Management Unit (PMU) on the StarFive JH71XX SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> 
> 
> 
>> +    };
>> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
>> new file mode 100644
>> index 000000000000..73c6a79a2181
>> --- /dev/null
>> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> 
> Why different license than the bindings? MIT is pretty compatible, but
> if it does not matter for you, keep same licenses as bindings.

MIT should be the least restrictive license. But it seems that BSD is more used and more safe.
So both of them will be used same licenses in next version. Thanks.

> 
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Author: Walker Chen <walker.chen@starfivetech.com>
>> + */
>> +#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
>> +#define __DT_BINDINGS_POWER_JH7110_POWER_H__
>> +
>> +#define JH7110_PD_SYSTOP	0
>> +#define JH7110_PD_CPU		1
>> +#define JH7110_PD_GPUA		2
>> +#define JH7110_PD_VDEC		3
>> +#define JH7110_PD_VOUT		4
>> +#define JH7110_PD_ISP		5
>> +#define JH7110_PD_VENC		6
>> +
>> +#endif
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

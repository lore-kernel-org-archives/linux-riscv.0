Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF5AC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 03:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arA9100sa4RIVmpXf234bqTXJL6C4gzLGeV/YdwuF2Y=; b=I7lbG4rMwR0NEC
	5HZnTDEkJj7e85XypFM/hsHGgMbITxa6wNbE859/EasUsGrUa/KsWv3rMWE+zHkCPdveuGjAb1Y4o
	ApwbyM2+YZ9BEIGtgbJMta4sLPQvvxzs/I70fRSRPoYcoOBpZJ5araipncV9xuwnMsh6RpSDKDloz
	3+QTYq+oHqpWmGyxFlv/4gVDQXjQuZUB3ixs/OEaSYxQL3BV50V7YKzKWKBgRJLCLn5xl6UUoezLz
	5FHuYd1f9AtTYAkPYrePVQ2wGbNhMcLQB4TFkAOEz2yQpPMbJExSGlIQsZnaIy0jm+wBwO00dn2/Q
	A1bvX5blOYjeObF3E/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozUXH-00FMda-Ez; Mon, 28 Nov 2022 03:10:23 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozUXA-00FMHP-66
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 03:10:21 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DC2C024E1D3;
	Mon, 28 Nov 2022 11:09:21 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Nov
 2022 11:09:21 +0800
Received: from [192.168.125.96] (183.27.97.81) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 28 Nov
 2022 11:09:21 +0800
Message-ID: <c2bfb7bc-f679-3731-fef4-4c7c2e4e5445@starfivetech.com>
Date: Mon, 28 Nov 2022 11:09:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 3/4] soc: starfive: Add StarFive JH71XX pmu driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-4-walker.chen@starfivetech.com>
 <15a860d8-d134-5eab-1635-74622421c5d7@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <15a860d8-d134-5eab-1635-74622421c5d7@linaro.org>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_191016_520223_2E5CE00B 
X-CRM114-Status: GOOD (  10.32  )
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

On 2022/11/21 18:14, Krzysztof Kozlowski wrote:
> On 18/11/2022 14:32, Walker Chen wrote:
>> Add generic power domain driver for the StarFive JH71XX SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +
>> +MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
>> +MODULE_DESCRIPTION("StarFive JH71XX Power Domain Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/soc/starfive/pm_domains.h b/include/soc/starfive/pm_domains.h
>> new file mode 100644
>> index 000000000000..a20e28e9baf3
>> --- /dev/null
>> +++ b/include/soc/starfive/pm_domains.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Author: Walker Chen <walker.chen@starfivetech.com>
>> + */
>> +
>> +#ifndef __SOC_STARFIVE_PMDOMAINS_H__
>> +#define __SOC_STARFIVE_PMDOMAINS_H__
>> +
>> +#include <linux/types.h>
>> +
>> +void starfive_pmu_hw_event_turn_on(u32 mask);
>> +void starfive_pmu_hw_event_turn_off(u32 mask);
> 
> These are not used outside of driver. Drop entire header file.
> 

Yes, these two exported functions will be drop in the next version of patches.

Best Regards,
Walker Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

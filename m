Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03FCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLldeFFACZSadv8k2VwQaoFxQ1ImEfCUIEMsPrCZbGY=; b=fbRfUu06UT48/D
	eUZDxzCtm+c9sp9P6hES4k3SXwxE7MHoxVMlgPmN2XZWp6CjAPQQgmmq3Pyuq+BeTIBHBn+MUMY4/
	Zjj9OeM7n2G+vKYprCt+JDU3JBhnW3uAZrRDN1IT1phHVjiTLvjikmueJ/h1xMEHWJC/6TjWEB/W6
	s1yglPRXXMeZ+nNNXVm9IQ/ffiyMPQt+nsm5FlZQWnX8ILM7Db4Dg8mQwGO9RcqRTbdcy1Vc2/F5r
	QsZU5dkVqpLIu70swIA8MwVNbv8J0Yu3IxoVwpRAo0on2uSKwP4mg4rsw+tHd0c6E7nF8JBroNVJW
	TmGZO8PiSlh5KWJSQBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxO09-005v9W-QS; Tue, 22 Nov 2022 07:47:29 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxO06-005usZ-Tf
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:47:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ABB6B24E2D9;
	Tue, 22 Nov 2022 15:46:35 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 15:46:35 +0800
Received: from [192.168.125.96] (113.72.144.23) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 15:46:34 +0800
Message-ID: <98866fec-e88a-f241-bb42-78d33f051f11@starfivetech.com>
Date: Tue, 22 Nov 2022 15:46:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Walker Chen <walker.chen@starfivetech.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: power: Add StarFive JH7110 power
 domain definitions
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-2-walker.chen@starfivetech.com>
 <bc853d76-5b65-676a-040a-edf53034c9ad@linaro.org>
Content-Language: en-US
In-Reply-To: <bc853d76-5b65-676a-040a-edf53034c9ad@linaro.org>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_234727_274233_30FD4810 
X-CRM114-Status: GOOD (  11.73  )
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

On 2022/11/21 18:12, Krzysztof Kozlowski wrote:
> On 18/11/2022 14:32, Walker Chen wrote:
>> Add power domain definitions for the StarFive JH7110 SoC.
>>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  include/dt-bindings/power/jh7110-power.h | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 include/dt-bindings/power/jh7110-power.h
>>
>> diff --git a/include/dt-bindings/power/jh7110-power.h b/include/dt-bindings/power/jh7110-power.h
>> new file mode 100644
>> index 000000000000..24160c46fbaf
>> --- /dev/null
>> +++ b/include/dt-bindings/power/jh7110-power.h
> 
> Filename matching compatible or bindings file.

So the file name should be changed to "starfive,jh7110-power.h" and the compatible in the driver 
should also be changed to "starfive,jh7110-power". Is it right ?

> 
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: (GPL-2.0) */
> 
> Dual license for bindings.

Ok, the license will be changed to GPL-2.0 or MIT in the patch v2. 

> 
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Author: Walker Chen <walker.chen@starfivetech.com>
>> + */
>> +#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
>> +#define __DT_BINDINGS_POWER_JH7110_POWER_H__
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F947C77B72
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4zBH2zsJeneBImAbQxt8z75dcLvfmbq/5f6S9Wbj80=; b=ndfRF4DZ5227Z+
	+kCITMH3nM9b4zDtsIfn2rawcGxN/eBTGrpghhdPwd6PfaqJsm/vKI1DucAbXEF53iAJtCGgZViuO
	D3p8lPUsdwviYvipmHu/TR8+rWiQR2u1dT4jcwqZLk9R0VZWuDi+ZDYhXAHyXWFCw9j8iZoFyHGaB
	rzqdls9Qg0XkAQHTOPlCsRCRo39GUK66+mimbk9MFVqv6n46Cp8Nc5al7PCh/sgJsWjuTUX/W6uuJ
	1FIEASguEkJNrVuKJo005AUodmUEKLNNXAjejlIhiolKRJZthmVXAK9GFsJhOCseT7XdhYjS9NoAL
	wTNsqL5Ctey/sF448e9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWCe-002K0f-2t;
	Wed, 12 Apr 2023 08:51:44 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWCc-002JxL-2G
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 08:51:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2A92624E287;
	Wed, 12 Apr 2023 16:51:19 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 16:51:19 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 16:51:18 +0800
Message-ID: <ee406b3d-0719-9332-cab5-62fe7537bcf1@starfivetech.com>
Date: Wed, 12 Apr 2023 16:51:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
 <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_015142_903922_7CA71979 
X-CRM114-Status: GOOD (  11.28  )
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



On 2023/4/12 16:35, Krzysztof Kozlowski wrote:
> On 11/04/2023 08:47, Changhuang Liang wrote:
>> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
>> interrupts properties.
[...]
>>  
>>  description: |
>>    StarFive JH7110 SoC includes support for multiple power domains which can be
>> @@ -17,6 +18,7 @@ properties:
>>    compatible:
>>      enum:
>>        - starfive,jh7110-pmu
>> +      - starfive,jh7110-pmu-dphy
> 
> You do here much more than commit msg says.
> 
> Isn'y DPHY a phy? Why is it in power?
> 

OK, I will add more description. This is a power framework used to turn on/off 
DPHY. So it in power, not a phy.

>>  
>>    reg:
>>      maxItems: 1
>> @@ -29,10 +31,18 @@ properties:
>>  
>>  required:
>>    - compatible
>> -  - reg
>> -  - interrupts
>>    - "#power-domain-cells"
>>  
>> +if:
> 
> Put it under allOf (in this place). Will save you one re-indentation later.
> 

OK, will fix it.

>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: starfive,jh7110-pmu
>> +then:
>> +  required:
>> +    - reg
>> +    - interrupts
>> +
>>  additionalProperties: false
>>  
>>  examples:
>> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
>> index 132bfe401fc8..0bfd6700c144 100644
>> --- a/include/dt-bindings/power/starfive,jh7110-pmu.h
>> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
>> @@ -14,4 +14,7 @@
>>  #define JH7110_PD_ISP		5
>>  #define JH7110_PD_VENC		6
>>  
>> +#define JH7110_PD_DPHY_TX	0
>> +#define JH7110_PD_DPHY_RX	1
>> +
>>  #endif
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

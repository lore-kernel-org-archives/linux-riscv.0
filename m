Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920A7C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 03:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lko59cfZDHfVd2aK3KIEX7mOQMfc4Fa7gZJAWBBqOHw=; b=fsWLXfeGJo2csJ
	wZEPDyhRITFEGOVrgiOmrQDzCNlOorUEkyZ8vOIICvOQ3Ema9HR94klprd8JuLIbWejefXy1Ak/FP
	vPCUUd5kvOH7WD/3PPJdnoIMt5N3JAxADWlq7l463cEV5wudhfeeXuwQSG/Kw89vPmZrMC62X98w+
	BsJbQ8vpoqbfW9ZsLA3RMyF45YbAD9/AaZMVtgZXxW8Qm4e7l9SjXx5xNrJq/niQ3WGbHDAmFpqs8
	kqcjgrZCXyQ2ON7o+2eptvYyp7XIcGt3RcyuV6HgxEKAwcMviqeUxaIBpj4J80xPUBO6bxD8B6N2U
	ntu05qXpyx0HwYfhhZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa6fd-007bxv-DE; Thu, 09 Mar 2023 03:10:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa6fY-007bwl-NN
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 03:10:18 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A461C24E1A4;
	Thu,  9 Mar 2023 11:10:02 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 11:10:02 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 11:10:01 +0800
Message-ID: <aac48eab-5f36-396a-d582-a944cd07c30d@starfivetech.com>
Date: Thu, 9 Mar 2023 11:10:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 03/12] dt-bindings: net: snps,dwmac: Add an optional
 resets single 'ahb'
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis
	<pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-4-samin.guo@starfivetech.com>
 <20230308215709.GA3904341-robh@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230308215709.GA3904341-robh@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_191017_086192_1E9565E2 
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


Re: [PATCH v5 03/12] dt-bindings: net: snps,dwmac: Add an optional resets single 'ahb'
From: Rob Herring <robh@kernel.org>

> On Fri, Mar 03, 2023 at 04:59:19PM +0800, Samin Guo wrote:
>> According to:
>> stmmac_platform.c: stmmac_probe_config_dt
>> stmmac_main.c: stmmac_dvr_probe
> 
> That's not really a reason on its own. Maybe the driver is wrong. Do we 
> know what hardware needs this?
> 
Hi Rob, Starfive JH7110 SOC must have two resets (stmmaceth+ahb), it uses snps,dwmac-5.20 IP.

Best regards,
Samin
>> dwmac controller may require one (stmmaceth) or two (stmmaceth+ahb)
>> reset signals, and the maxItems of resets/reset-names is going to be 2.
>>
>> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
>> ---
>>  .../devicetree/bindings/net/snps,dwmac.yaml        | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index b4135d5297b4..89099a888f0b 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -133,12 +133,18 @@ properties:
>>          - ptp_ref
>>  
>>    resets:
>> -    maxItems: 1
>> -    description:
>> -      MAC Reset signal.
>> +    minItems: 1
>> +    items:
>> +      - description: GMAC stmmaceth reset
>> +      - description: AHB reset
>>  
>>    reset-names:
>> -    const: stmmaceth
>> +    minItems: 1
>> +    maxItems: 2
>> +    contains:
> 
> This means 'reset-names = "foo", "ahb";' is valid. You want 'items' 
> instead. However, that still allows the below string in any order. Do we 
> really need that? If not, then you want:
> 
> items:
>   - const: stmmaceth
>   - const: ahb
> 
Thank you for your guidance. It will be better to modify it in this way, I will fix it in next version.

Best regards,
Samin
>> +      enum:
>> +        - stmmaceth
>> +        - ahb
>>  
>>    power-domains:
>>      maxItems: 1
>> -- 
>> 2.17.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B09C7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPxGSuEZWNgDRMe3VQs/E/mVwrVmHh3uRR3nYhvr0KM=; b=Q4ecuA7xW17u1S
	RQZ4629JbXSuYn/ikn3t9oCgJ9rN41LuNBA2xpDVxmi5oIWoAFYGJVkdr0ZkLD873sCYmBIFISQWK
	tZKdeVx8EZqKTQOEZdaOOD/1oM83r2xP9Qp89zyrOC31ZvdKVLINW4KbWEK3CNn2bjPIxuxvRpa+5
	1dxHdH7VnDmeZ7kfxnBpFd85BVxEn+apb9lTwoJ5oxy5O8taByVqHuOBANWqd4XHsHjeo+mJOahKe
	WYaGbmjZnXw/S0EY/n7F+U+/kQKhy4sp0OXlOYM3ZSE6h0u/ChbOFQW5dyxasUrAWFXukwJe63B6b
	9h1Vntp50CpGVRhynArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmmRu-004njd-0o;
	Thu, 13 Apr 2023 02:12:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmmRq-004njB-19
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 02:12:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A23618016;
	Thu, 13 Apr 2023 10:11:55 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 10:11:55 +0800
Received: from [192.168.125.82] (183.27.97.249) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 10:11:54 +0800
Message-ID: <bc14ff65-a4ad-c9cd-8348-c27249418eab@starfivetech.com>
Date: Thu, 13 Apr 2023 10:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
 <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
 <ee406b3d-0719-9332-cab5-62fe7537bcf1@starfivetech.com>
 <20230412-trifle-outplayed-8a1c795fab8b@wendy>
 <d59439c1-bce1-b4a1-0e05-77afc4fc2ebb@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <d59439c1-bce1-b4a1-0e05-77afc4fc2ebb@linaro.org>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_191230_729678_70A445B6 
X-CRM114-Status: GOOD (  12.61  )
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



On 2023/4/12 19:29, Krzysztof Kozlowski wrote:
> On 12/04/2023 11:42, Conor Dooley wrote:
>> On Wed, Apr 12, 2023 at 04:51:16PM +0800, Changhuang Liang wrote:
>>>
>>>
>>> On 2023/4/12 16:35, Krzysztof Kozlowski wrote:
>>>> On 11/04/2023 08:47, Changhuang Liang wrote:
>>>>> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
>>>>> interrupts properties.
>>> [...]
>>>>>  
>>>>>  description: |
>>>>>    StarFive JH7110 SoC includes support for multiple power domains which can be
>>>>> @@ -17,6 +18,7 @@ properties:
>>>>>    compatible:
>>>>>      enum:
>>>>>        - starfive,jh7110-pmu
>>>>> +      - starfive,jh7110-pmu-dphy
>>>>
>>>> You do here much more than commit msg says.
>>>>
>>>> Isn'y DPHY a phy? Why is it in power?
>>>>
>>>
>>> OK, I will add more description. This is a power framework used to turn on/off 
>>> DPHY. So it in power, not a phy.
>>
>> Perhaps tie it less to its role w/ the phy, and more to do with its
>> location, say "jh7110-aon-pmu"?
>> There's already "aon"/"sys"/"stg" stuff used in clock-controller and
>> syscon compatibles etc.
>>
>> Krzysztof, what do you think of that? (if you remember the whole
>> discussion we previously had about using those identifiers a few weeks
>> ago).
> 
> Depends whether this is the same case or not. AFAIR, for AON/SYS/STG
> these were blocks with few features, not only clock controller.
> 
> This sounds like just phy. Powering on/off phy is still a job of phy
> controller... unless it is a power domain controller.
> Best regards,
> Krzysztof
> 

Hi, Coner and Krzysztof,

Next version I will change commit message:

dt-bindings: power: Add JH7110 DPHY PMU support.

Add DPHY PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY rx/tx
power switch, and it don't need the reg and interrupt properties.

I think this commit message will helpful for you to understand it.

Best regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0424C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TO69nIsxwSxo7Xf+J896/8DpZMzTWSG1KquFdAn3uGM=; b=D0IFzIJrNyKVVz
	6aaCOW7dNRY4+VGcKyhWJs45mtKIcQQsfSmfE74ElCh3wM7B2jL+K8wuaF1OxMkxtcW813MSNcK7p
	JXVoyoH9WbzWtKxt6se9jhA00JLTtpTwexoo6vDmCSONAY2Q/60Utn48LIiuufgeAy+TlKFwO4GDB
	cIN2nMN6pZstT0rAgcXMykR2EyMEPCumpiRJIDuYAK0JkRK54uL7aQo+w/lD59g5ezgZ5QVlDD1MD
	JHOc+qG6KC931mLXAQlN7fNG4bAxDzjbKKmbJsnq0XUWRqiaYtoqzT/ZHFcVIRNvMbXMVnMUVjABL
	7HpNDq0W6+DQ+KEU3PTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn93e-0086SI-34;
	Fri, 14 Apr 2023 02:21:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn93b-0086Re-18
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 02:21:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 91F6624E1C6;
	Fri, 14 Apr 2023 10:20:33 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Apr
 2023 10:20:33 +0800
Received: from [192.168.125.82] (183.27.97.249) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Apr
 2023 10:20:32 +0800
Message-ID: <84300997-31f8-b36e-e54e-876c266fc953@starfivetech.com>
Date: Fri, 14 Apr 2023 10:20:31 +0800
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
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_192059_705831_9CD5D1B7 
X-CRM114-Status: GOOD (  12.66  )
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

I found something wrong with my description here, not turn on/off DPHY,
is turn on/off DPHY power switch. 

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

So, next version the compatible can be changed to "jh7110-aon-pmu"?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

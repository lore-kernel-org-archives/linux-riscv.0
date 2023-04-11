Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9213C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 07:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s10gsHbUzF66E9sAg0WySIOWWbuA4tfWEWTKoLZZC9A=; b=dvnh7y43RGcicx
	kZUzmUFH1pnVad917wqX+bzrLuMTdVZqnPq3j7R12Kh86sh+9QtigLyu76P1/p52EJHkIN1d3m9cl
	J4/gS45B4Fx9PHB/PxFSe7dSunPf+HWyR71LKGGMuo5vBiB1vPSpl6eq736naOJyRdEIj6LnXiFpq
	ZStfOEcHvot7vkMVyY3OXBzMUgzhkr+XUA+BEn50p7ncmwSKTMoP0xykzUQXYIhi/lVmMHHQEnVk+
	GpYeDVEbIbwcOquRXFC3K2HnnRZZLGHp8dPqhL3R0IRKVilV8/mgZmdwMPo63mpEy31PKqg/rMvbF
	EjiSG1uC5gJRf0DKYoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8h5-00Glkw-35;
	Tue, 11 Apr 2023 07:45:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8h2-00GliC-2b
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 07:45:35 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 31E2B24E2E3;
	Tue, 11 Apr 2023 15:45:09 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 15:45:09 +0800
Received: from [192.168.125.108] (113.72.145.176) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 15:45:08 +0800
Message-ID: <a37bcd12-73b7-0503-e82b-ab880bd43f16@starfivetech.com>
Date: Tue, 11 Apr 2023 15:45:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding
 documents.
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406111142.74410-2-minda.chen@starfivetech.com>
 <38bc48bf-7d8c-8ddd-861f-3b7f3d2edce6@linaro.org>
 <430f1eb0-e348-8a4e-b501-16b8c3b2494f@starfivetech.com>
 <f37964c6-0a75-2900-e6a7-282f5366696c@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <f37964c6-0a75-2900-e6a7-282f5366696c@linaro.org>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_004533_155300_A939C002 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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



On 2023/4/10 23:21, Krzysztof Kozlowski wrote:
> On 10/04/2023 11:05, Minda Chen wrote:
>>>> +
>>>> +  starfive,stg-syscon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    items:
>>>> +      items:
>>>> +        - description: phandle to System Register Controller stg_syscon node.
>>>> +        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>>> +        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>>> +        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>>> +        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for PCIe.
>>>> +    description:
>>>> +      The phandle to System Register Controller syscon node and the offset
>>>> +      of STG_SYSCONSAIF__SYSCFG register for PCIe. Total 4 regsisters offset
>>>> +      for PCIe.
>>>> +
>>>> +  pwren-gpios:
>>>> +    description: Should specify the GPIO for controlling the PCI bus device power on.
>>>
>>> What are these? Different than defined in gpio-consumer-common?
>>>
>> power gpio board level configuration. It it not a requried property
> 
> What is "board level configuration"? Again - is it different than
> powerdown-gpios from gpio-consumer-common.yaml?
> 
> 
I am sorry. I will change to powerdown-gpios follow gpio-consumer-common.yaml
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

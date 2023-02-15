Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A3EC05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 01:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyyF9s+Dd00PeCOLAAUY/+RI0bIIsRUghcRrxSOQqdk=; b=cO9qhLcTMNx5Hh
	nMBSOwnmDS1q0zS3b0Xn3efNvS33qG7WaIgVy/1Q4o8dBrGoF/MwVCBbiPxn/ecczOUQ4tBQl8PZt
	ZHczraNqE6vE7QgwMVhFH4RnrjkdfHCAguHxWMhqZYFjAwLiKphJJfN/ETk3n6E6fw06KcyUSEMQ9
	XubOLiyG1E5cJRXXMw+pE8dS676nSWmfIdof0BnjOADLmPDk0xR2HHYx5JKQSPSJZ+74mzBp8ggRa
	Ea4TxTuC0OziMlQczmrhnVxLINkACxScrafECAkw8QOm1Z45uqTz4TtkUGvHi9aCjHuorkbFVpx0D
	ZPPNjs2iV1hapSWPeRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6b6-004Gpa-FZ; Wed, 15 Feb 2023 01:28:36 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6b3-004GmT-KV; Wed, 15 Feb 2023 01:28:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7D07E24E20A;
	Wed, 15 Feb 2023 09:27:56 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 09:27:56 +0800
Received: from [192.168.1.100] (183.27.97.168) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 09:27:55 +0800
Message-ID: <e6b9e942-633b-90f4-104e-1d6fbe5d0235@starfivetech.com>
Date: Wed, 15 Feb 2023 09:27:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230210061713.6449-1-changhuang.liang@starfivetech.com>
 <20230210061713.6449-3-changhuang.liang@starfivetech.com>
 <3fc07187-f5a0-86d1-a0fd-ba18a2baf555@linaro.org>
 <f33f3ce0-ca0f-b24e-eab6-4fb9a6ae6d4a@starfivetech.com>
 <80d16935-dad6-8087-c1b2-1d5b1c3f738e@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <80d16935-dad6-8087-c1b2-1d5b1c3f738e@linaro.org>
X-Originating-IP: [183.27.97.168]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_172834_004072_7BEAC0EB 
X-CRM114-Status: GOOD (  10.01  )
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



On 2023/2/14 15:49, Krzysztof Kozlowski wrote:
> On 14/02/2023 04:07, Changhuang Liang wrote:
>>
>> OK, will drop quotes
>>
>>>> +    items:
>>>> +      items:
>>>> +        - description: phandle of AON SYSCON
>>>> +        - description: register offset
>>>> +    description: The register of dphy rx driver can be configured
>>>> +      by AON SYSCON in this property.
>>>
>>> Can be? So does not have to? But you made it a required property....
>>>
>>
>> Maybe I described it wrong.
>> I will change to:
>> 	description: The power of dphy rx can be configured by AON SYSCON
>> 	  in this property.
>> It is like AON SYSCON is the power switch of the dphy rx, it is necessary to
>> configure the AON SYSCON register, so I made it a required property.
> 
> Then do not use "can be". Can is optional: I can jump but I don't have
> to. :)
> 

OK, "can be" will be changed to "is".

Best Regards,
Changhuang Liang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

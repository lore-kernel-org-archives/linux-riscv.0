Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4090DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGHDrOmPqIhG5l5qYNRaE51N2IWXzd+g7Q9VXsVz45Y=; b=xaaN0oTPNCs0Nu
	rCfJVPIxSCY1ZkevNQF6U5gqwTauKmc8RvkjJkUTBGCj1p+g8uVjxCPlJwgot0DCnRRErqQzcHD2c
	mmMRzT1KyNrIO/87OriuX6eCgrHGjMrVk8X4flZBy12Qtejtb6vIkVpwdQQ5FbYwkxtI6EJFzLVkT
	g3VfVglJexx3m8A4zudCBq/GrhddAzwIKfyHZcLGJp2d+fYPyFcp6b5wEeHdqQIKTZXt0t5skd3WY
	r0roXgM4G6pNcMRKoEj2CH7E5tCtabYcElnQRrN3XzV9oSabSvPofKgA/4Qs6brxqPOAWojMDqPfO
	nFXamthAEgqjVw/j4l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pASh2-003fFR-9X; Wed, 28 Dec 2022 09:25:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pASgy-003evN-5O
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 09:25:47 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6589624E19A;
	Wed, 28 Dec 2022 17:24:53 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 17:24:53 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 17:24:51 +0800
Message-ID: <dd1a55b7-d05a-0ea8-6042-25b80befec22@starfivetech.com>
Date: Wed, 28 Dec 2022 17:24:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/9] dt-bindings: net: motorcomm: add support for
 Motorcomm YT8531
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-6-yanhong.wang@starfivetech.com>
 <994718d8-f3ee-af5e-bda7-f913f66597ce@linaro.org>
 <134a2ead-e272-c32e-b14f-a9e98c8924ac@starfivetech.com>
 <c296cf6b-6c50-205d-d5f5-6095c0a6c523@linaro.org>
 <e03fb7bc-b196-bc8a-b396-fab8686d396b@starfivetech.com>
 <9b098bf9-59d7-e58d-aba3-a8055af053c6@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <9b098bf9-59d7-e58d-aba3-a8055af053c6@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_012544_627961_4C06316F 
X-CRM114-Status: UNSURE (   8.86  )
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



On 2022/12/28 17:11, Krzysztof Kozlowski wrote:
> On 28/12/2022 04:23, yanhong wang wrote:
>> 
>> 
>> On 2022/12/27 17:52, Krzysztof Kozlowski wrote:
>>> On 27/12/2022 10:38, yanhong wang wrote:
>>>>>
>>>>> This must be false. After referencing ethernet-phy this should be
>>>>> unevaluatedProperties: false.
>>>>>
>>>>>
>>>>
>>>> Thanks. Parts of this patch exist already, after discussion unanimity was achieved,
>>>> i will remove the parts of YT8531 in the next version.
>>>
>>> I don't understand what does it mean. You sent duplicated patch? If so,
>>> please do not... you waste reviewers time.
>>>
>>> Anyway this entire patch does not meet criteria for submission at all,
>>> so please start over from example-schema.
>>>
>> 
>> Sorry, maybe I didn't make it clear, which led to misunderstanding. Motorcomm Inc is also 
>> carrying out the upstream of YT8531, and my patch will be duplicated and conflicted 
>> with their submission. By communicating with the developers of Motorcomm Inc, the part 
>> of YT8531 will be submitted by Motorcomm Inc, so my submission about YT8531 will be withdrawn.
> 
> Are they going to apply the feedback received for this series?
> 

Yes, they support not only YT8531, but also other models of their company.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

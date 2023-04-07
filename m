Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DB1C76196
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/lW5qYUzq80uzn231v8vFUUbR/eYPov/uZ8PX1qu/0=; b=v7LD1QWfkbDVrz
	lZ1KxBSJbTCM4P6TwZbA6vnftN3c4AH/UEviQ/0Sq2RrecOelzYM/VGDSLfUw2Hpd5ELx6R7TA+Ac
	W9iy8bb67e/IsBI2Ax+jM4Xt1DFkh1sXLcjMK66tRyvY+m18p+tr7EpiCKgJcY8Eh/i3N/QDZDWnE
	lS1tEk+NcpKDS0iOv44mnVX3JTHxyh7//gEfRRb7XKDPJ0BOh1tlDFrPZkEKylxj4bs8vT956A9X2
	KsU7qNuc2KM/xVyQJiyr3mVEcO95i+w/zsp9VNr2SAzNnOwaTw0GlsvM9ClsS29iT2WHtnZuuZQs+
	T+k8iIzpi754ahiA4OzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkg4L-009L37-12;
	Fri, 07 Apr 2023 06:59:33 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkg4H-009Kz4-1n;
	Fri, 07 Apr 2023 06:59:31 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B52D424E2EE;
	Fri,  7 Apr 2023 14:58:49 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 14:58:50 +0800
Received: from [192.168.125.82] (183.27.97.179) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 14:58:48 +0800
Message-ID: <5dc4ddc2-9d15-ebb2-38bc-8a544ca67e0d@starfivetech.com>
Date: Fri, 7 Apr 2023 14:58:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu
	<jack.zhu@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
 <20230315100421.133428-2-changhuang.liang@starfivetech.com>
 <20230320151437.GA1709620-robh@kernel.org>
 <fa13e903-809d-064f-baff-c7e7474b52da@starfivetech.com>
 <06a17138-cccc-1283-d235-fa54275c1651@kernel.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <06a17138-cccc-1283-d235-fa54275c1651@kernel.org>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_235929_759646_EB74B89C 
X-CRM114-Status: GOOD (  10.95  )
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



On 2023/4/7 14:54, Krzysztof Kozlowski wrote:
> On 07/04/2023 08:51, Changhuang Liang wrote:
>>>> +
>>>> +  resets:
>>>> +    items:
>>>> +      - description: DPHY_HW reset
>>>> +      - description: DPHY_B09_ALWAYS_ON reset
>>>> +
>>>> +  starfive,aon-syscon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    items:
>>>> +      - items:
>>>> +          - description: phandle of AON SYSCON
>>>> +          - description: register offset
>>>> +    description: The power of dphy rx is configured by AON SYSCON
>>>> +      in this property.
>>>
>>> Sounds like AON SYSCON should be a power-domains provider. Custom 
>>> phandle links are for things which don't fit standard bindings.
>>>
>>
>> Hi, Rob,
>>
>> On visionfive2 jh7110 SoC, this AON SYSCON is the Secondary power switch to the DPHY Rx.
>> When we open the pmic switch, we also need to configure the AON SYSCON register to turn 
>> on the switch, it is used to link the pmic and the DPHY Rx, So I think it just use syscon
>> framework is enought. What about your comments.
> 
> Which sounds exactly like power domain provider...
> 

OK, thanks for your comment, I will try to use power domain framework in next patch.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

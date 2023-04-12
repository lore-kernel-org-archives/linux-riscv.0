Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3B7C7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRL6PI8IFqU85AmyEeMOOovTUkaA5ND09GZNQQZiSSw=; b=20hr7JywpNpcZo
	j0D9l0twxzeGWThlmkvlNPlDNR8o5tVi2hYg3mnkd3+VbhavbZ0jfRun5OMK/cTgxcmQLdkL9PlRJ
	IRS+rcxFWt70O7yKbu8ZlNe0Z2W9Iun1335VVyHkTHNghQ8dAe3OHwPEQIS6etsPE0oQ2676SCzm2
	iUFsxZ63SuH6DVMz3C7oo0mMxPWLxu9fwXGeEEwgj7AZC+jmyzu0PNKp6xgYVQlrz7PqvEiGYVMqW
	eeiLVKp+s96NG2cnAUymM85x7iLOzHbk4DzJVD4pbJIZ/KxyenFYyKRCX0IWxvd9IBw4cXb4BXt2U
	C9WN329Oev9UD/MxZZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZoe-003Bap-0F;
	Wed, 12 Apr 2023 12:43:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZoZ-003BXt-36;
	Wed, 12 Apr 2023 12:43:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4A87424E01A;
	Wed, 12 Apr 2023 20:42:37 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 20:42:37 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 20:42:36 +0800
Message-ID: <eb47b7c7-bdbb-92d9-ba39-604ce487f297@starfivetech.com>
Date: Wed, 12 Apr 2023 20:42:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
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
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <20230412084540.295411-2-changhuang.liang@starfivetech.com>
 <8dd0dc63-e0df-8764-f756-da032d9d671c@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <8dd0dc63-e0df-8764-f756-da032d9d671c@linaro.org>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_054308_186872_68730780 
X-CRM114-Status: GOOD (  14.19  )
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



On 2023/4/12 19:34, Krzysztof Kozlowski wrote:
> On 12/04/2023 10:45, Changhuang Liang wrote:
>> StarFive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
>> a M31 IP. Add a binding for it.
> 
> So this is D-PHY? Or the other patch is D-PHY? The naming is quite
> confusing and your commit msgs are not helping here.
> 
> Also the power domain phandle here adds to the confusion.
> 

Yes, this is DPHY, DPHY has rx and tx, and last version we are discussing that 
use power domain replace syscon:
https://lore.kernel.org/all/5dc4ddc2-9d15-ebb2-38bc-8a544ca67e0d@starfivetech.com/

>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 85 +++++++++++++++++++
>>  1 file changed, 85 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>>
[...]
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  lane_maps:
> 
> Why did this appear? Underscores are not allowed. It looks like you
> re-implement some standard property.
> 

Will change to lane-maps.
Yes, according to Vinod advice, lane mapping table use device tree
to parse makes sense.

>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description:
>> +      D-PHY rx controller physical lanes and logic lanes mapping table.
>> +    items:
>> +      - description: logic lane index point to physical lane clock lane 0
>> +      - description: logic lane index point to physical lane data lane 0
>> +      - description: logic lane index point to physical lane data lane 1
>> +      - description: logic lane index point to physical lane data lane 2
>> +      - description: logic lane index point to physical lane data lane 3
>> +      - description: logic lane index point to physical lane clock lane 1
>> +
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

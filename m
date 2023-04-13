Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E058AC77B6C
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 01:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOSgVJ/r3oM3VAQJz7kcNOwvRpBdASf/iZBVepmNLUQ=; b=lvyDATkwBR/BEs
	82rSkvGBAb0O6Wns3h0DNPviEuvSgHV1kN8pwO6/aJmBZNFuXD/rM3KEqLU1tn8CEpu2SOh/DwMcq
	EAL75g/bkHw1eJ8sVObXY3PJDOCUCcnLJc5uAk+LEZT64Ax3QeLiCHzWCM2tVxnUjkA9od0pQkLJ0
	qbV2GUwvq0kuGXA9FQCFXE2+5a1Dy88Q4UwaQQYAf2BZcUYs0n3v4IWX42R2SOtXVOrWa0LfomBOD
	4FRARV7rFpVp0l4YqjYGF6Y8uAZjMKloQvmOKYBTaDVR3/PjKxsVnVbJ851qad/JoT5ZVey73Xa/s
	uI7EsE2kfS+xVLgMY1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmlmk-004l6Y-28;
	Thu, 13 Apr 2023 01:30:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmlmf-004l5C-0G;
	Thu, 13 Apr 2023 01:29:59 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A4D907FEF;
	Thu, 13 Apr 2023 09:29:27 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 09:29:27 +0800
Received: from [192.168.125.82] (183.27.97.249) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 09:29:26 +0800
Message-ID: <b05a43df-1138-3dbd-08a9-0f2bc9b74807@starfivetech.com>
Date: Thu, 13 Apr 2023 09:29:25 +0800
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
 <eb47b7c7-bdbb-92d9-ba39-604ce487f297@starfivetech.com>
 <f6a4fb28-d635-4d99-44bb-d929cb41eef2@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <f6a4fb28-d635-4d99-44bb-d929cb41eef2@linaro.org>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_182957_454142_F4702700 
X-CRM114-Status: GOOD (  14.50  )
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



On 2023/4/13 0:55, Krzysztof Kozlowski wrote:
> On 12/04/2023 14:42, Changhuang Liang wrote:
>>
>>
>> On 2023/4/12 19:34, Krzysztof Kozlowski wrote:
>>> On 12/04/2023 10:45, Changhuang Liang wrote:
>>>> StarFive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
>>>> a M31 IP. Add a binding for it.
>>>
>>> So this is D-PHY? Or the other patch is D-PHY? The naming is quite
>>> confusing and your commit msgs are not helping here.
>>>
>>> Also the power domain phandle here adds to the confusion.
>>>
>>
>> Yes, this is DPHY, DPHY has rx and tx, and last version we are discussing that 
>> use power domain replace syscon:
>> https://lore.kernel.org/all/5dc4ddc2-9d15-ebb2-38bc-8a544ca67e0d@starfivetech.com/
> 
> The other patch - DPHY PMU - is confusing. Instead of writing short
> commits, explain more.
> 

OK, I will add more commit message in DPHY PMU dt-binding patch, for example:

dt-bindings: power: Add JH7110 DPHY PMU support.

Add DPHY PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY rx/tx
power switch, and it don't need the reg and interrupt properties.

I think this commit message will helpful for you to distinguish them.

>>
>>>>
>>>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>>>> ---
>>>>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 85 +++++++++++++++++++
>>>>  1 file changed, 85 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
>>>>
>> [...]
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  lane_maps:
>>>
>>> Why did this appear? Underscores are not allowed. It looks like you
>>> re-implement some standard property.
>>>
>>
>> Will change to lane-maps.
>> Yes, according to Vinod advice, lane mapping table use device tree
>> to parse makes sense.
> 
> Hm, I have a feeling that I saw such property, so you should dig into
> existing and in-flight bindings.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

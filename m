Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419CEC77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 03:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENsPScevx8qEpcDG54NBPAWS2iUgptZyEizm8K7q6O4=; b=Q400UdDW9J5Sp0
	hfpclwFG4qMFuSa/y6ZeCRVLUm4S8ajkCJbtKL9S9pKPv/SLtpyUDLbAKHCDDp/IYiRxK+sECohSq
	P+kdHOHhy1EkF5AttuT4LAatmQ+/+bZkgby7HHe4sXM032e4QtUTLliqg/NzXor4T1Dv5pGdG2o7m
	s0kAZZSowpTYOopOQaFmrHa7qepkuO0L+tvBFGg9MM70higvcON1/oHXppJExU2Uo6kKCvbNDjRbq
	QvfEmorQ+8x/jkJCM3LEJu6peQhjbr9lzUfO9HXlt7GMLq7UNsCDn/sAbnuRqMOkb6xx7r2rlQhUj
	YD+3DTzYzMrrl6KDxIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poFhr-00EnSb-1L;
	Mon, 17 Apr 2023 03:39:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poFhn-00EnR3-20;
	Mon, 17 Apr 2023 03:39:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1BF0580CF;
	Mon, 17 Apr 2023 11:37:52 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 11:37:52 +0800
Received: from [192.168.125.106] (183.27.97.249) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 11:37:51 +0800
Message-ID: <0a17d229-16b5-e562-ae55-8ff6ae1c15cf@starfivetech.com>
Date: Mon, 17 Apr 2023 11:37:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
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
 <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
 <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
 <0c94aadf-fac3-d05c-1c54-ae8337526849@starfivetech.com>
 <31c582a7-682a-330e-51d4-53b4a0c5f3a2@linaro.org>
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <31c582a7-682a-330e-51d4-53b4a0c5f3a2@linaro.org>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_203903_951386_DF4C2425 
X-CRM114-Status: GOOD (  13.20  )
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



On 2023/4/17 1:29, Krzysztof Kozlowski wrote:
> On 13/04/2023 11:02, Changhuang Liang wrote:
>>
>>
>> On 2023/4/13 16:41, Krzysztof Kozlowski wrote:
>>> On 13/04/2023 04:34, Changhuang Liang wrote:
>>>>>>>> +  lane_maps:
>>>>>>>
>>>>>>> Why did this appear? Underscores are not allowed. It looks like you
>>>>>>> re-implement some standard property.
>>>>>>>
>>>>>>
>>>>>> Will change to lane-maps.
>>>>>> Yes, according to Vinod advice, lane mapping table use device tree
>>>>>> to parse makes sense.
>>>>>
>>>>> Hm, I have a feeling that I saw such property, so you should dig into
>>>>> existing and in-flight bindings.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>
>>>> A standard property? Like "clocks" or "resets"?
>>>
>>> Like lane-polarities now submitted to one MIPI.
>>>
>>> Anyway it does not look like a property of a board. You said it is fixed
>>> per SoC, so it should be implied from the compatible. Otherwise please
>>> explain in description and provide some rationale.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> This property is the only one used for this IP, I have compared this IP with
>> other DPHY rx module, DPHY modules form the other manufacturers not have this
>> configure.
>> And we also have a SoC called JH7100. It DPHY rx module is the same as JH7110.
>> But we don't do the upstream work on it. If it use this lane-maps will be 
>> configure as "lane_maps = /bits/ 8 <0 1 2 3 4 5>;".
> 
> And JH7100 is different SoC, so you have different compatible. Again -
> is this board specific? If not, looks like SoC specific, thus imply it
> from compatible.
> 
> 
> Best regards,
> Krzysztof
> 

Hi, Vinod

I agree with Krzysztof. What about your comments?

Best regards,
Changhuang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

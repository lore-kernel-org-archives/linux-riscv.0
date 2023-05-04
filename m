Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B1C77B75
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 01:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNsyb1dsuWh5pSmYjNRqJZUgyA3Fp+6Z9xw1yHKi4Jk=; b=3Bwehn/EaJGEFf
	yx9567JOsg1oZiCmWyzMxa4LI2jUu9wfhFBJ42sZ8rXJAuavUb7nzWyt4plMsxaZxkMSSQTf8rD6b
	AmOwTZU8gANLu+RcaoNCUAcF/vHVZ+P5J+t+V55scdmF51/7pPAmGwMhvJiYQCVzHg5BmoJ1SV+lQ
	JpApj5/ZjvvzzWyTp/aQILap6y1bwgg1G0puY1GU/b+h3kdnFYb4NKGSslLFMW1w64adkQkOCdBf4
	xDEzNRzszBkHQx10DCF7pRvYzcCrS9YxSMys5SX4WZTfUj+NDf2IbuN5gQULPR8y+YtBImGnn3Kwi
	Wo8K/43u3pmNVIDiOkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNfv-006HSG-2g;
	Thu, 04 May 2023 01:22:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNfr-006HNf-0P;
	Thu, 04 May 2023 01:22:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2A1117F8A;
	Thu,  4 May 2023 09:21:37 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 09:21:37 +0800
Received: from [192.168.125.107] (183.27.99.121) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 09:21:36 +0800
Message-ID: <d2044dc1-ff5c-7398-5646-1bfdfb8ea935@starfivetech.com>
Date: Thu, 4 May 2023 09:21:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
 <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
 <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
 <0c94aadf-fac3-d05c-1c54-ae8337526849@starfivetech.com>
 <31c582a7-682a-330e-51d4-53b4a0c5f3a2@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <31c582a7-682a-330e-51d4-53b4a0c5f3a2@linaro.org>
X-Originating-IP: [183.27.99.121]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_182223_345898_8EFF5919 
X-CRM114-Status: GOOD (  12.03  )
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

Vinod,

Hi, could you give me some suggestions about Krzysztof's comment? Thanks for
your time.

Best regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

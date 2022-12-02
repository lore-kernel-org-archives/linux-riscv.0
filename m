Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508DAC4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1kMEeZvMIwfuw7mL/+Yb/pPQ05mmR37WclJZpzE1n8=; b=htY+aawP2knc/Q
	XWifXEEG177w7DpTLp8t9NW1oKtp8PCbALMPLw5cevpKMswF+Ebux4JmHeBLdNz6aVXZ6Od8t9pcS
	1wQEnFcuwejm2sgybj30ybosoeYGrLnJ5agdA7A+aiAaL/luiZdN26gIAG1aw6g5H6AveYmL3Vb32
	l552xg4MPrxvSN1iclLQy3ypjlG2xmwp0rrUX6A+QC/e9qqqI4Y/6sKHL6Xz7yqnoXjffvyXia45l
	ZSF7YJMKPBA/dUSDDklQN+Ag5RlpRhdv1vBG4F3oEElCJMbD62X2hsmNpxKo9lDXQFOvo6POkY6XX
	czwcITODAs0ztGxO0rjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0vRe-00CU0N-Ti; Fri, 02 Dec 2022 02:06:30 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0vRa-00CTuI-Tf
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 02:06:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EDA2524E059;
	Fri,  2 Dec 2022 10:05:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 10:05:52 +0800
Received: from [192.168.125.106] (113.72.147.18) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 10:05:51 +0800
Message-ID: <fd1ca52a-8f2f-0c3a-aefd-3fac380ecdf2@starfivetech.com>
Date: Fri, 2 Dec 2022 10:06:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
 <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
 <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
 <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
 <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
 <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
 <e954511b-e74a-2c3a-95ec-d33c938b146f@starfivetech.com>
 <4e94c635-4cbb-449e-24af-f6fee47fb45e@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <4e94c635-4cbb-449e-24af-f6fee47fb45e@linaro.org>
X-Originating-IP: [113.72.147.18]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_180627_279281_85865BF8 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, 1 Dec 2022 11:21:04 +0100, Krzysztof Kozlowski wrote:
> On 30/11/2022 19:05, Hal Feng wrote:
>> On Wed, 30 Nov 2022 16:19:06 +0100, Krzysztof Kozlowski wrote:
>>> On 30/11/2022 16:12, Hal Feng wrote:
>>>> On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
>>>>> On 30/11/2022 10:47, Hal Feng wrote:
>>>>>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>>>>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>>>
>>>>>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>>>>>
>>>>>>>> Binding headers are coming with the file bringing bindings for the
>>>>>>>> device, so you need to squash patches.
>>>>>>>
>>>>>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>>>>>> following files in one commit?
>>>>>>>
>>>>>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>>>>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>>>>
>>>>>> Hi, Krzysztof,
>>>>>>
>>>>>> Could you please give me some suggestions?
>>>>>
>>>>> You can keep aon and sys split. First add one of them with their own
>>>>> headers. Then add second with their own defines.
>>>>
>>>> You mean split patch 7 and patch 8 into sys part and aon part
>>>> respectively? There are totally five regions (sys/aon/stg/isp/vout)
>>>> for clocks and resets in JH7110. If we do that, there will be 5
>>>> headers for JH7110 in either clock or reset directory finally. Is
>>>> that OK if there are too many headers for just one SoC?
>>>
>>>
>>> Sorry, I lost the track of what patches you have. The comment was -
>>> bindings include both the doc and headers. You want to split some, some
>>> merge, sorry, no clue. I did not propose splitting headers...
>> 
>> It's ok. The problem was that the header
>> 
>> include/dt-bindings/clock/starfive,jh7110-crg.h
>> 
>> was used in both
>> 
>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> 
>> and
>> 
>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml.
>> 
>> The same for include/dt-bindings/reset/starfive,jh7110-crg.h.
>> So should I add these four files in one patch?
> 
> No. I think I wrote proposed flow of patches:
> 1. syscrg bindings with header
> 2. aoncrg bindings with changes to header

Great. Got it. Thanks a lot!

Best regards,
Hal

> 
> Why do you need to merge anything?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

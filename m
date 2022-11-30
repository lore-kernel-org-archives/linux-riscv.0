Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D43C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94ZjOwodaJuRc92chQL30PtGT9jcMJmqZr7AzqfEvoY=; b=GvIkx5e+SKxpwP
	NEJNVi0Lw6FeKcleEAv0dd76g9REKmBwzIJMQIZ8KXAgYnMoVowWnIclg4U6YdVQUPCROuTlDNt60
	PXlBOXk9J93vSr7b3r74/ry6Uma9PJWzfbkBb951uU7ZXosfdAMFBT4EDOZ4fOxxRkOn9k3zzhicf
	urBP32zZgpE85wsrtNP11qp8ZP4BU2lDwy3FJQjAYcZ5oBIULj8zOyWiUPyDcA1yyWI5ZzcX7gMx0
	kfszpHrVKpuXSaUDr8Br1RDZ5HIlpVNQA+UEdw4Oji7luQ53Ftv630RzgWrEyiAeOq9ILROAk3qk9
	fQ/t/2HV+VAdhEMia08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OlT-00HH5E-5H; Wed, 30 Nov 2022 15:12:47 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OlN-00HGxD-U9
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:12:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5E5E524DEAE;
	Wed, 30 Nov 2022 23:12:06 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 23:12:06 +0800
Received: from [192.168.0.42] (183.27.96.20) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 23:12:05 +0800
Message-ID: <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
Date: Wed, 30 Nov 2022 23:12:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
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
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
X-Originating-IP: [183.27.96.20]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_071242_180533_5CD3E1A9 
X-CRM114-Status: GOOD (  11.02  )
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

On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
> On 30/11/2022 10:47, Hal Feng wrote:
>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>
>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>
>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>
>>>> Binding headers are coming with the file bringing bindings for the
>>>> device, so you need to squash patches.
>>>
>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>> following files in one commit?
>>>
>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>> 
>> Hi, Krzysztof,
>> 
>> Could you please give me some suggestions?
> 
> You can keep aon and sys split. First add one of them with their own
> headers. Then add second with their own defines.

You mean split patch 7 and patch 8 into sys part and aon part
respectively? There are totally five regions (sys/aon/stg/isp/vout)
for clocks and resets in JH7110. If we do that, there will be 5
headers for JH7110 in either clock or reset directory finally. Is
that OK if there are too many headers for just one SoC?

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

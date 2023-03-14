Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B598C6FD1C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=608d2AT4uZDRXEuv3H8FMkrZAi71V+mFeyKpE6Kqlcs=; b=vy8rfzmN6pmdOz
	Yhq3els7o/V2XXyjp/yu7tqUdvT+sP5JRl5+6nHPrsaiKkMw9aZpM1Eub3RMLaSuiFz3J/N+JhJ8w
	+OpT3casmzOX/svdQYBlNvgQBh+fpxo0gvmqQrwzWpvLN0ZJAj3w7/t75M32JHo6JyjsWQyfHs60F
	PvfN1yP1wo+4G1VHOsI0Gpd+hFA/63Nyw69o+CzZlVhPK8SomI3qheoelkPLUlEnto58qHm87GZQi
	7wwr8aW/8QerPgQP3nLc2dYCGMvUINFuQVI6ldExjV9No1SCczADjeqqSaCKaCdZHcNFFf3I0jqnw
	qbey1lJdq1ejUzBIlVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5Uw-00ARIf-2X;
	Tue, 14 Mar 2023 14:19:30 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5Ut-00ARFH-2J
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 14:19:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B666124DCBE;
	Tue, 14 Mar 2023 22:19:00 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 22:19:00 +0800
Received: from [192.168.125.74] (113.72.145.194) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Mar
 2023 22:18:59 +0800
Message-ID: <518f47e4-7fc6-7715-93dd-2a3b1b4acadf@starfivetech.com>
Date: Tue, 14 Mar 2023 22:18:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Ben Dooks <ben.dooks@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Thomas Gleixner
	<tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, <linux-clk@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
 <167854282659.42837.5915012938593380363.robh@kernel.org>
 <80549148-1bad-9190-c4ea-a9555d15ca38@starfivetech.com>
 <834fb899-7a03-ba0a-8302-f64ea58c60dd@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <834fb899-7a03-ba0a-8302-f64ea58c60dd@linaro.org>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_071928_327089_D1205E5C 
X-CRM114-Status: GOOD (  13.38  )
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

On Mon, 13 Mar 2023 08:51:20 +0100, Krzysztof Kozlowski wrote:
> On 13/03/2023 03:47, Hal Feng wrote:
>> On Sat, 11 Mar 2023 08:17:00 -0600, Rob Herring wrote:
>>> On Sat, 11 Mar 2023 17:07:23 +0800, Hal Feng wrote:
>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>
>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>
>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>> ---
>>>>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>>>>  MAINTAINERS                                   |   8 +-
>>>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>>>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>>>>  4 files changed, 454 insertions(+), 3 deletions(-)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>>>>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>>>>
>>>
>>>
>>> Please add Acked-by/Reviewed-by tags when posting new versions. However,
>>> there's no need to repost patches *only* to add the tags. The upstream
>>> maintainer will do that for acks received on the version they apply.
>>>
>>> If a tag was not added on purpose, please state why and what changed.
>>>
>>> Missing tags:
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>> 
>> This patch has been changed a lot and I am not sure whether it's still
>> the one you want. So I removed the Reviewed-by tag.
> 
> Then mention it in changelog, just like Rob asked:
> "If a tag was not added on purpose, please state why and what changed."
> I don't see any explanation in the changelog about it.

So sorry for missing that. Thank you for your suggestions.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

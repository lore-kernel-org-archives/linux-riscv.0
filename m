Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7871CEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZvfrvmOrS9p++Mtm68GG5/GztnQ4Hake3DdI5zfq1A=; b=lHeb7+kY09u6hS
	NhBubJuvC660SX89KlUcoo/5tbjh2bf6QPz8jWZZ5WRcYD5bipdmrq8Bjo67QhDCmBwlzLy7IcsLh
	FWagnaXh9Mm4YsTgYkznrVjUjLZ81//pm4OoIsJOK6j0wRVMH4a7jJ8Lk0xxKL6NXFK8JoGAvHcPd
	0VFTWe3hrjaysrLkfdkYV2tXfmKu8W3uWvYjgjm5ow2sgtiD1q9nC62bwWDLF/SwQ1xnNnRdW/Wlo
	CGZU8fA2616RxqqhakCW4ic3esOsTbf+KwowEsJ5Ew0ruSX67GMEzFKj2IDXRpChgwgkgSnYcO6YL
	etGKVqtpyp2dM7fL59/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3AT-002e39-34;
	Fri, 30 Jun 2023 01:43:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3AP-002e00-0f
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 01:43:23 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 419057FD3;
	Fri, 30 Jun 2023 09:42:32 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:42:32 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:42:31 +0800
Message-ID: <ebb6c688-1a96-5167-2e50-ee18ebd0a5d7@starfivetech.com>
Date: Fri, 30 Jun 2023 09:42:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-2-hal.feng@starfivetech.com>
 <92171465-d2ba-c3ba-aa55-0f705e924a0f@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <92171465-d2ba-c3ba-aa55-0f705e924a0f@linaro.org>
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_184321_439012_80D303BE 
X-CRM114-Status: GOOD (  10.84  )
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

On Mon, 26 Jun 2023 17:32:04 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../sound/starfive,jh7110-pwmdac-dit.yaml     | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
>> new file mode 100644
>> index 000000000000..bc43e3b1e9d2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac-dit.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 Dummy PWM-DAC Transmitter
>> +
>> +maintainers:
>> +  - Hal Feng <hal.feng@starfivetech.com>
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-pwmdac-dit
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  sound-name-prefix: true
> 
> Drop

Will fix it.

> 
>> +
>> +required:
>> +  - compatible
>> +  - "#sound-dai-cells"
>> +
>> +additionalProperties: false
> 
> Instead: unevaluatedProperties: false

Will fix. Thanks.

>> +
>> +examples:
>> +  - |
>> +    pwmdac-dit {
> 
> pwmdac?

No. For a similar implementation, you can refer to "spdif-dit" in

arch/arm64/boot/dts/rockchip/rk3328-rock64.dts

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

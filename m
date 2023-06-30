Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88645EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 02:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MICqAQcDMdIQSlnwvCShErkwDKE9zVuQpCQ0Z16klg=; b=fvFB1pAtFoWWYv
	XQMndn1d4zswoN99JBeQINs/AUOwdr8qkVBYHYf+twVFZJj0WcxPgjiXEtT0tQd6AZh9MWhoCp4M8
	1pzt+bZLkFrpMm7x5I6zh1VPK+ZK0QoNBi6eM/5cFdDmZ6Hqap7RFINXou7uLatnXqLXvEzNqPmlm
	gVPnFDELTjWoNbfY29LN4QPswIOc+6A+rO/5Ztyh44zj7NHOxdYs4buwUUkOeQFnPkDNWhyM9utPY
	RY5qfVunl/0Q6+vE8rM1QsrOnC5s3hsAMmdOZ+2W8e54JsNlgNpYU15AEFpMj1NSVtenP1OvQvEaC
	CSm6rC2Oa8wZDYd9a+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3Uu-002ftj-0c;
	Fri, 30 Jun 2023 02:04:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3Uk-002fsv-37
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 02:04:24 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A848224DBCE;
	Fri, 30 Jun 2023 10:04:10 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 10:04:10 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 10:04:09 +0800
Message-ID: <fdba4068-a947-4d42-8fcc-8edf48e710f1@starfivetech.com>
Date: Fri, 30 Jun 2023 10:04:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 3/5] ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC
 controller
Content-Language: en-US
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
 <20230626110909.38718-4-hal.feng@starfivetech.com>
 <fc726c72-0503-b407-cad1-f24422f02ab2@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <fc726c72-0503-b407-cad1-f24422f02ab2@linaro.org>
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_190423_155570_2711E9E6 
X-CRM114-Status: GOOD (  12.87  )
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

On Mon, 26 Jun 2023 17:36:20 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add bindings for the PWM-DAC controller on the JH7110
>> RISC-V SoC by StarFive Ltd.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../sound/starfive,jh7110-pwmdac.yaml         | 76 +++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
>> new file mode 100644
>> index 000000000000..91a4213f2bd8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 PWM-DAC Controller
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Got it. Will drop it later.

> 
>> +  The PWM-DAC Controller uses PWM square wave generators plus RC filters to
>> +  form a DAC for audio play in StarFive JH7110 SoC. This audio play controller
>> +  supports 16 bit audio format, up to 48K sampling frequency , up to left
> 
> No space before ,

Will fix.

> 
>> +  and right dual channels.
>> +
>> +maintainers:
>> +  - Hal Feng <hal.feng@starfivetec
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your review.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30301EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 01:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjZC7ylfypCQRV03hWeHH1PLj9piMWNiDwCS+Ia8JxA=; b=cIIu/5+MEkj55m
	slTjj8PHgkp23ji/kAEzTnPcZHogewYdSBH4dzF4afEyANUtu0RQVq9DsXe6BLP43fKmWuGlfWTl9
	9N8+zWvk+crAp7fWpbLEZ3EVrhAwwzOMiaF1onNBBr8QZgONChbIvY7cSB/7QPAFRlSeLzzKlwWVM
	1pOfvpBHgvgXdc97cS2xLa4DFFepuUbalDuOo/CDZir23dwfe/qDxuIThcT1khxhgbOFCNRZgxV3F
	KMBAD1h42wLRJOotgXqT3rgRpt41W9uvZn+zyTqlBJTJvVMBxVrmiEf1Eg2T/dU7sFlnNqGEwaIws
	seOBoe7sSBB/eoVjB+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3O7-002fYB-1K;
	Fri, 30 Jun 2023 01:57:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3O4-002fXO-1r
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 01:57:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0DD8124DE30;
	Fri, 30 Jun 2023 09:57:04 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:57:04 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:57:03 +0800
Message-ID: <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
Date: Fri, 30 Jun 2023 09:57:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
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
 <20230626110909.38718-2-hal.feng@starfivetech.com>
 <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_185728_811757_20EEC38A 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, 26 Jun 2023 17:34:56 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
> 
> ...
> 
>> +required:
>> +  - compatible
>> +  - "#sound-dai-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pwmdac-dit {
>> +        compatible = "starfive,jh7110-pwmdac-dit";
>> +        #sound-dai-cells = <0>;
> 
> BTW, I don't see any resources here. Neither in the driver. I think you
> just added this for driver, not for a real hardware.

Yes, this is a dummy PWM-DAC transmitter as described in the title. The
StarFive JH7110 PWM-DAC module doesn't need a hardware codec, but a
dummy codec is needed for the driver.

For a similar implementation, you can refer to
sound/soc/codecs/spdif_transmitter.c

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

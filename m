Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3D2C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0HyG1HeXmdfUyIwCcb0gMUhBpVw0v4Cx5ZjWh52EK8=; b=VXQbF0znZ5tL8y
	4XPEItRUVMygnVUbFJXRHJ2KpLWjknfFTOsvnjlG7z7Nnpu/FsTsKnjladl3kbz7XBGy90U7yPKvk
	KbK/SV1Qi41Eb/f3tFw84BoXYo9YyuefTuiKRKBDWGHU2mNnlAQLIPCl9fFiV9IEkYvCQ/qzbYhx4
	GuNgmDE7H8Hf42Xlt+s1S7tJwl4qu08E4nnIg1RKp2tRQU35Zvp//T0gF6L7CF/ERiVv3/V2kdbRD
	BrQ339FETRAm0XClJAJNDsRgDpIB5gYM73+BesKubTAPQYLcH/DQgYwhjRZMcYiS2cMyFOuC7Hvyg
	/kWKhPk1Jpv+8f9x2egQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODOm-006jrD-1O;
	Tue, 25 Jul 2023 08:28:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODOi-006jo7-2V
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 08:28:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 90D1C83D4;
	Tue, 25 Jul 2023 16:27:31 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 16:27:31 +0800
Received: from [192.168.125.84] (183.27.99.135) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 16:27:30 +0800
Message-ID: <62ddb368-d714-8986-9904-2e44edfb069c@starfivetech.com>
Date: Tue, 25 Jul 2023 16:27:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
From: Hal Feng <hal.feng@starfivetech.com>
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
 <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
 <c0244a98-4c91-93d8-a3e4-5210d0b3f205@linaro.org>
 <d046796e-34a0-56e5-a740-6a1fcf41d216@starfivetech.com>
Content-Language: en-US
In-Reply-To: <d046796e-34a0-56e5-a740-6a1fcf41d216@starfivetech.com>
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_012801_167401_C81D16A3 
X-CRM114-Status: GOOD (  13.21  )
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

On Mon, 10 Jul 2023 11:22:50 +0800, Hal Feng wrote:
> On Sat, 1 Jul 2023 10:17:51 +0200, Krzysztof Kozlowski wrote:
>> On 30/06/2023 03:57, Hal Feng wrote:
>>> On Mon, 26 Jun 2023 17:34:56 +0200, Krzysztof Kozlowski wrote:
>>>> On 26/06/2023 13:09, Hal Feng wrote:
>>>>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
>>>>
>>>> ...
>>>>
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - "#sound-dai-cells"
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    pwmdac-dit {
>>>>> +        compatible = "starfive,jh7110-pwmdac-dit";
>>>>> +        #sound-dai-cells = <0>;
>>>>
>>>> BTW, I don't see any resources here. Neither in the driver. I think you
>>>> just added this for driver, not for a real hardware.
>>> 
>>> Yes, this is a dummy PWM-DAC transmitter as described in the title. The
>>> StarFive JH7110 PWM-DAC module doesn't need a hardware codec, but a
>>> dummy codec is needed for the driver.
>> 
>> Bindings are no for drivers, therefore with such reasoning the answer
>> is: drop entire binding. If you think otherwise, please give me some
>> more details about the hardware.
> 
> I agreed. I will drop this binding and the compatible in patch 2. Thanks.

Hi, Krzysztof,

Could I use the dummy spdif codec [1][2] which is already upstream? The dummy
spdif codec is really compatible with the one which JH7110 PWM-DAC needed.
They are mostly similar.

[1] Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
[2] sound/soc/codecs/spdif_transmitter.c

In that way, patch 1 & 2 can be dropped and patch 5 will be modified as follows.

+	pwmdac_dit: pwmdac-dit {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "left_j";
+			bitclock-master = <&sndcpu0>;
+			frame-master = <&sndcpu0>;
+
+			sndcpu0: cpu {
+				sound-dai = <&pwmdac>;
+			};
+
+			codec {
+				sound-dai = <&pwmdac_dit>;
+			};
+		};
+	};

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

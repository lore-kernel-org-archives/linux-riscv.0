Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BD7EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 02:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BFzKVI+bXwTcYdfLNHpPGFjjI95GwA/EMiKCr1TRGk=; b=O+2UOpDL0jtv6C
	PCApi8lxn/TrhkVE0AORinRlX0W/FXSwjSrx6XxPECKmckIeFsEeCDNJ5BJyn5fui76KxcKDGIqB4
	KDz9ly+7tBc48bmBlG8FpwBd/hzjeQ9bTFiirnzjEmM5lV4gXtyDiPxqW7Y362hFZr01v39iLGP2S
	84XwSFq6OUyIQkayJ7RcPj0yWhhEUQc/21TSssC0wA6E1XfwUdSX7mzapEjdwfxCy+56rG2iGp//S
	Vlz554t+znSxMvP0tSuluqGnhsRuv+94pMUYbKg4DaNfX04KAgSthiDUm4MJV2dDJJlxdxtnx/pbT
	dMrJuyvk+za/S1Pgh03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3cX-002gXN-06;
	Fri, 30 Jun 2023 02:12:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF3cT-002gWm-25
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 02:12:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 19FE824E245;
	Fri, 30 Jun 2023 10:12:07 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 10:12:07 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 10:12:06 +0800
Message-ID: <16813f18-2188-ad9d-9c06-6bbc845b9d99@starfivetech.com>
Date: Fri, 30 Jun 2023 10:12:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: Add JH7110 PWM-DAC support
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
 <20230626110909.38718-6-hal.feng@starfivetech.com>
 <2a0154ec-7949-f1b1-760f-3ba64d2cff3f@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <2a0154ec-7949-f1b1-760f-3ba64d2cff3f@linaro.org>
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_191221_830445_ED708819 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, 26 Jun 2023 17:37:35 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add PWM-DAC support for StarFive JH7110 SoC.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 50 +++++++++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
>>  2 files changed, 63 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index 19b5954ee72d..5ca66a65e722 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -36,6 +36,34 @@ gpio-restart {
>>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
>>  		priority = <224>;
>>  	};
>> +
>> +	pwmdac_dit: pwmdac-dit {
>> +		compatible = "starfive,jh7110-pwmdac-dit";
>> +		#sound-dai-cells = <0>;
>> +	};
>> +
>> +	sound {
>> +		compatible = "simple-audio-card";
>> +		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		simple-audio-card,dai-link@0 {
>> +			reg = <0>;
>> +			format = "left_j";
>> +			bitclock-master = <&sndcpu0>;
>> +			frame-master = <&sndcpu0>;
>> +			status = "okay";
> 
> Drop

OK.

> 
>> +
>> +			sndcpu0: cpu {
>> +				sound-dai = <&pwmdac>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&pwmdac_dit>;
> 
> You said it is a transmitter, not a codec...

It is a dummy codec, also known as a dummy transmitter.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

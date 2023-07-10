Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C0BEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9xTa9tjXClqj26r/QqHUOpjSsy3Fx0kOG0btB6/gGc=; b=tbNNEZHbXtCIKe
	r1bcdySDDNuAAcB2RiA5iZpS5mCCq/UUse9DNbstAg+48H7+gHYGH9vpnRNkcas87SCjpARO6lcwi
	g8kBq6uSDLJLX+EduRXw9JbDE6bkWZ2NCPUSuhyejBIzHm8l3PhXhwUA4mIJyc4a4oOAmYhVcwWMe
	9KwvsS2aIXgQWa5PZ3yjGUAU4m+DTvmyla4Cg3QyijRRRuiPmcbOpHLyqKG3GX49pr8AhLrj8REdF
	IvcogGsmv9kFOm76OGIYZAJpFkmvfh2AAJ/+syeUy2fMIKml4jKSi0tC6NjXbAKhKn3oe5NgNeidU
	dmzSN2nS1X63wk6zpLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIhV1-00AGxc-2o;
	Mon, 10 Jul 2023 03:23:43 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIhUx-00AGsR-1m
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 03:23:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E952A24E023;
	Mon, 10 Jul 2023 11:22:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Jul
 2023 11:22:51 +0800
Received: from [192.168.125.93] (113.72.145.114) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Jul
 2023 11:22:51 +0800
Message-ID: <d046796e-34a0-56e5-a740-6a1fcf41d216@starfivetech.com>
Date: Mon, 10 Jul 2023 11:22:50 +0800
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
 <006ddacd-0496-70d1-3310-99b16706de84@linaro.org>
 <0312262c-28c0-9445-c6f7-2079a57db8c7@starfivetech.com>
 <c0244a98-4c91-93d8-a3e4-5210d0b3f205@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <c0244a98-4c91-93d8-a3e4-5210d0b3f205@linaro.org>
X-Originating-IP: [113.72.145.114]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_202339_903152_19E394D4 
X-CRM114-Status: GOOD (  12.13  )
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

On Sat, 1 Jul 2023 10:17:51 +0200, Krzysztof Kozlowski wrote:
> On 30/06/2023 03:57, Hal Feng wrote:
>> On Mon, 26 Jun 2023 17:34:56 +0200, Krzysztof Kozlowski wrote:
>>> On 26/06/2023 13:09, Hal Feng wrote:
>>>> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
>>>
>>> ...
>>>
>>>> +required:
>>>> +  - compatible
>>>> +  - "#sound-dai-cells"
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    pwmdac-dit {
>>>> +        compatible = "starfive,jh7110-pwmdac-dit";
>>>> +        #sound-dai-cells = <0>;
>>>
>>> BTW, I don't see any resources here. Neither in the driver. I think you
>>> just added this for driver, not for a real hardware.
>> 
>> Yes, this is a dummy PWM-DAC transmitter as described in the title. The
>> StarFive JH7110 PWM-DAC module doesn't need a hardware codec, but a
>> dummy codec is needed for the driver.
> 
> Bindings are no for drivers, therefore with such reasoning the answer
> is: drop entire binding. If you think otherwise, please give me some
> more details about the hardware.

I agreed. I will drop this binding and the compatible in patch 2. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

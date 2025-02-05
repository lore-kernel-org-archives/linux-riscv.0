Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B3C02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YkCRnd2HUXaVJfzYwYctSr9UAZNi77Vrnh/YmZSbi8=; b=WeAV0DVzXiA1Ew
	u0+DCypijtA6sW+E1ybMO40MxDY/oksT6W6t9fKy5TW4mo7dub6+T4KWoYf6OK55kdIICt70Xfd6K
	ARqwqth4ZguU71pTvA7MQ4hQ9QdpXyWtoZ1F6gxhtP5rSvZhokLiwo5Wo29MjswvEPLlegNGc+cnU
	MQprsIchsvyzNrNZINXhW7gNSfCjD0d1lu+ZtpTJgWMsVavAZz3pjaJ2bNmK2BAr1mMx2AhOgwcpo
	AgrvHf4MrW0nxPVIJsw5TKyJ6y/5rFLtzc4UFC3l2rAg6WgXGA8kAqfnDFXavX73t6XvlPNCBmbbt
	pvYYZ/A/3W2JmaMXNvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcFg-00000002noz-0ivM;
	Wed, 05 Feb 2025 10:03:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcER-00000002nXU-1hGc
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:02:09 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BE2443F277
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738749722;
	bh=lRkR+WYaons/jJVqBwYKIgchNhk8mrQWriNR5CVl3/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=NhHdZ4Ew/XkUXa222qi6TdUYpJQmVXy92bSTutSshYFoHdia9ILRwslnkAS8KgINC
	 b27GkY6KpH5auJ3ytQAKU8JF9saQrnUipGCH378YDKykTXN3ve3b9NW5z5T4Q1t/hp
	 XoY56BN/AHwDDB09j/g9SvFNrMcOUTV8PXTcK2Tg31hUbVwySSvDx6SRRshiZh+YFW
	 edxlVILdbcZ7e8ipytC6ABSy2TVcavc31RovDsVVhDcvvNSw7PQ05CCVzN+GU/Zb2l
	 +Ro4q8xgi7zyBe8u3M3lzg7eIU/yWEGQEO778TCR9E1Hww5uLXfPnRzB4eyAuotOE9
	 4yj4ILZqw+dBg==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361d4e8359so46300545e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 02:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749722; x=1739354522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRkR+WYaons/jJVqBwYKIgchNhk8mrQWriNR5CVl3/0=;
        b=mRbI84Xx7a0ms/Ozb3zT2vuafg1OenFkVK5KmJ+Cq3xt4j1aDsL0aH8IQKNxvNcERA
         /ehJkX9qS+qh2h3N9V+876SCq6Vb/P0Y9K5vTdr6/nGzDtHt8GeivDuUZXBOtOMu63HW
         Wk/Vq4Pvpr8ufMDJcDJYTVLIyFKLStzisQVoaP4h80K2z3M0QYmMFw2VYqvakdXtkJHo
         R7ixLJ3NSpcJsXby1vSZvvD8GFeIG+jktgPtf6KwD/ecPrns3QmU2jqHvwLfJbbeCA7q
         qV4sfJlihoapq20BWL/t1z7gGlblTTdE2eex1C3X1YcUSFUoPTIfB3i1dkQGJWunIsh3
         bbFw==
X-Forwarded-Encrypted: i=1; AJvYcCV+9DjAi3hCjxTgJSgQ9P2hPRZR+GCMHuXCCFGEW4RqXA21SP63GNxhkOrOr4lP1nvhm7YsQcLhHAWxRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlzlNpyuihZ9kWHL5dGMUs18Cfqld0GNevo4nHYOQ0XT6EY3Qw
	A3Lu/oWjXPRBKsVows3vp0D4i5mdH441L9CxAOTjbzn75XrIjB84tpntrnEmy9PuiS2f90ZWv8h
	4fnC/W3uW5d8vv1V6j6+W+7Z0w/wYvgf2uNE+E9ODR6AWco9sJJqH6kxFzUZldCwaxOLznDYA14
	gGcKFBqQ==
X-Gm-Gg: ASbGncvo0y5G1IFfV2OaixPPX2nO0fHeBMCjgvOxfEIcnAjHqYxJNBZBkhpJpc1Da4E
	dN2gPvu1bYlKwcZ+cLpR1jxC3LQrTegJZ0t35r7vC2OsPOeYowA7bJLlZ2bhgCRXiSOXjWLnw8z
	myoyDHCtAb10HeehYAKzqOUTb0Hm85K8mTknaJr/jRVggQZmW1cuI71wVWnUez8P0FXZICMNUQF
	fZeyICvdYtzk4JuDsyCQiueg03ftVLizWkHr7oqOrGG9eTaHz/1tyKj50B9PYkY1ZH+TJ4cSmnp
	G3Enyk/FXD7nYu1TqOUN7y3TfbFA77GF928f2w4scWZbvb3Xc6V/aAgv92YNYNVowwFuKIs=
X-Received: by 2002:a05:600c:46d4:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4390d55fc82mr14932105e9.23.1738749721725;
        Wed, 05 Feb 2025 02:02:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGq8om1DDyQcOOxkaGbGiKq7JJDXixn8Voguht0gmaJQbiYzhmBxXZIPIdniNSl3ZJ3CUhAFQ==
X-Received: by 2002:a05:600c:46d4:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-4390d55fc82mr14931765e9.23.1738749721365;
        Wed, 05 Feb 2025 02:02:01 -0800 (PST)
Received: from ?IPV6:2a02:3035:6e0:9052:36d8:1776:f263:97eb? ([2a02:3035:6e0:9052:36d8:1776:f263:97eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf7dbcsm15922705e9.30.2025.02.05.02.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:02:00 -0800 (PST)
Message-ID: <206a6ada-1ef9-47f3-b1cf-fb1a1540e95c@canonical.com>
Date: Wed, 5 Feb 2025 11:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, E Shattow <e@freeshell.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-6-e@freeshell.de>
 <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <25B3D8909DBCC21B+43663a76-4afa-44ae-95e2-3a8792de614c@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_020207_841095_3D43B3C8 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/5/25 08:57, Hal Feng wrote:
> On 2/3/2025 9:37 AM, E Shattow wrote:
>> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>>    - i2c5_pins and i2c-pins subnode for connection to eeprom
>>    - eeprom node
>>    - qspi flash configuration subnode
>>    - memory node
>>    - uart0 for serial console
>>
>>    With this the U-Boot SPL secondary program loader may drop such
>>    overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 30c5f3487c8b..c9e7ae59ee7c 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -28,6 +28,7 @@ chosen {
>>   	memory@40000000 {
>>   		device_type = "memory";
>>   		reg = <0x0 0x40000000 0x1 0x0>;
>> +		bootph-pre-ram;
>>   	};
>>   
>>   	gpio-restart {
>> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>>   	};
>>   
>>   	eeprom@50 {
>> +		bootph-pre-ram;
>>   		compatible = "atmel,24c04";
>>   		reg = <0x50>;
>>   		pagesize = <16>;
>> @@ -323,6 +325,7 @@ &qspi {
>>   	nor_flash: flash@0 {
>>   		compatible = "jedec,spi-nor";
>>   		reg = <0>;
>> +		bootph-pre-ram;
>>   		cdns,read-delay = <2>;
>>   		spi-max-frequency = <100000000>;
>>   		cdns,tshsl-ns = <1>;
>> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>>   	};
>>   
>>   	i2c5_pins: i2c5-0 {
>> +		bootph-pre-ram;
>>   		i2c-pins {
>>   			pinmux = <GPIOMUX(19, GPOUT_LOW,
>>   					      GPOEN_SYS_I2C5_CLK,
>> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>>   					      GPOEN_SYS_I2C5_DATA,
>>   					      GPI_SYS_I2C5_DATA)>;
>>   			bias-disable; /* external pull-up */
>> +			bootph-pre-ram;
>>   			input-enable;
>>   			input-schmitt-enable;
>>   		};
>> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>>   };
>>   
>>   &uart0 {
>> +	bootph-pre-ram;
>>   	clock-frequency = <24000000>;
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_pins>;
> 
> What about &mmc0, &mmc1, &qspi, &sysgpio, &mmc0_pins, &mmc1_pins, &i2c5?
> Why not add "bootph-pre-ram;" for them?

Would they be needed before relocation of U-Boot to DRAM?

Best regards

Heinrich


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

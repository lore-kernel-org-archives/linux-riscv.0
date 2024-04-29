Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57534C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1c643ZhpIqOOr6B3Z7crf1v9VmX/ez223eyS45HZN0=; b=3emKz+Ki0o69mP
	1TLkONUoQ0iMWkc06MGNqRBOLC6INhCEGeieHn2kJFcm00ftsYoxnQ1I+8uJFoxh+ycmxAe2uBPK+
	kRzN8Oyolo4W172GlDPbqokcPP9SmbfvzayL7Lc5J5cJ2IeFXYSXfmTQYFY8KDSkiqh5WuDRzSJ8r
	/0Rul/nhY4mlCG6nCyCqiJlnkYMKMQD4ZEKry/+rFBAY3Yr0Hq290Mbv2M0gPSQLe6k9TJucIFRaH
	yv7G4qPLoQR0yg+m6w82boFpdKwN5U8UZJX7R/yAOTBzkTOXxSesqC+2q67POov4dxcwGXrXinx7H
	uGC/DGrvibIOyZVYW6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qjm-00000002r0Y-3Bru;
	Mon, 29 Apr 2024 13:08:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Qjj-00000002qyl-0kcW
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:08:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FB5A1C0011;
	Mon, 29 Apr 2024 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714396078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T8jHqkc/pwYAZPpY3tPykrSPNntOxfw2cx/+VnKdJ0=;
	b=hf+P86egTGrP4TwSUuKw8GWmwN5RqIBzVTughWx1y6TAnshMaxooCmjTxsF16Vh4rtLfeF
	u4+0BhEld4JBBTIwh2QN72iFAiUKif5lsDwI+Z4d5/Lsp8tg/5ygKM73Utgbr9t+Zg9pFM
	XpRaDQ6oRHkwvHiNvcAEl4TlwhbDjDfHYBBS30iSDlbKdsNCNpcVlF6ot+gcBUpkWxJ7bp
	ewll399OHCxTyQG1+O9Ni707qUnz+4wP9nWxF90W7RKF5V4ZrwbHiIUB2UDebtZHcrjRbw
	6kKfL/u8q9LMNPW7tQ7a4elmuHxyfe0FAlVQ7FJwpQhzKiinW7/I5V7K3A3CSg==
Message-ID: <1b7f9c68-32da-405f-add3-33e542406345@bootlin.com>
Date: Mon, 29 Apr 2024 15:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, andi.shyti@kernel.org, jszhang@kernel.org,
 miquel.raynal@bootlin.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, thomas.petazzoni@bootlin.com, guoren@kernel.org,
 wefu@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, krzk+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
 <20240425-script-fondness-0e80bfa31615@spud>
 <3eb27570-4a53-47f6-8e36-e25fc1063124@bootlin.com>
 <20240426-patchy-grievance-e7103a344c82@spud>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240426-patchy-grievance-e7103a344c82@spud>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_060803_546766_8D749790 
X-CRM114-Status: GOOD (  25.61  )
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



On 4/26/24 4:42 PM, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 04:12:00PM +0200, Thomas Bonnefille wrote:
>>
>>
>> On 4/25/24 6:35 PM, Conor Dooley wrote:
>>> On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
>>>>
>>>> On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
>>>>> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
>>>>> and a default configuration for the BeagleV-Ahead. It appears that the
>>>>> TH1520 I2C is already supported in the upstream kernel through the
>>>>> Synopsis Designware I2C adapter driver.
>>>>> As there is no clock driver for this board as of today, this patch
>>>>> series uses a fixed-clock named i2c_ic_clk.
>>>>> There is also no pinctrl driver yet so pinmux must be handled manually
>>>>> for now.
>>>>> It also fixes the order of the nodes in the device tree to comply with
>>>>> device-tree coding-style.
>>>>>
>>>>> Thomas Bonnefille (4):
>>>>>     dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>>>>>     riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
>>>>>     riscv: dts: thead: Add TH1520 I2C nodes
>>>>>     riscv: dts: thead: Enable I2C on the BeagleV-Ahead
>>>>>
>>>>>    .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
>>>>>    .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
>>>>>    arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
>>>>>    3 files changed, 127 insertions(+), 27 deletions(-)
>>>>>
>>>>> --
>>>>> 2.44.0
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>> My bot found new DTB warnings on the .dts files added or changed in this
>>>> series.
>>>>
>>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>>> are fixed by another series. Ultimately, it is up to the platform
>>>> maintainer whether these warnings are acceptable or not. No need to reply
>>>> unless the platform maintainer has comments.
>>>>
>>>> If you already ran DT checks and didn't see these error(s), then
>>>> make sure dt-schema is up to date:
>>>>
>>>>     pip3 install dtschema --upgrade
>>>>
>>>>
>>>> New warnings running 'make CHECK_DTBS=y thead/th1520-beaglev-ahead.dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
>>>>
>>>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
>>>
>>> The bot is not freaking out here, 50 MHz is indeed more than 5 MHz :)
>>
>> 5MHz is the maximum clock-frequency, ie. the I2C bus frequency.
>> This is actually set to 100kHz for I2C0 in the DT:
>>
>> &i2c0 {
>>      status = "okay";
>>      clock-frequency = <100000>; <----
>> ...
>> };
>>
>> 50MHz is the "fixed-clock" frequency, that is the clock feeding the I2C
>> IP block:
>>
>> i2c_ic_clk: i2c-clock {
>>      compatible = "fixed-clock";
>>      clock-frequency = <50000000>; <-----
>>      #clock-cells = <0>;
>> };
>>
>> My guess is that the bot confused the clock-frequency parameter for the bus
>> clock (SCL) with the i2c-ic-clock value for the controller itself during the
>> checks.
>>
>> Do you agree with this or am I misunderstanding the error ?
>>
>> If I lower the fixed-clock frequency to eg. 100kHz, the error is gone. But I
>> guess the 5MHz limit should probably not apply to the input clock?
> 
> Heh, I know why that's happening - it's your node name.
> The pattern for i2c controllers is "^i2c(@.*)?":
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> 
> Rob co-incidentally (or maybe not) put out a patch for fixed-frequency
> clock names, suggesting using clock as a prefix:
> https://lore.kernel.org/all/20240425183810.3079069-1-robh@kernel.org/
> If we switched to that format, I believe your problem goes away.
> 
> Cheers,
> Conor.
> 

Indeed it was the node name, when I switched the name of the fixed clock 
to clock-i2c-ic, the error was gone, thank you. :)
But i2c_ic_clk shouldn't match "^i2c(@.*)?", one of my teammates 
suggested that the error may instead come from this line 
https://elixir.bootlin.com/linux/latest/source/scripts/dtc/checks.c#L1023.

But as Drew is working on new iterations of the TH1520's clock driver I 
will just delete this fixed clock and publish a second version depending 
on his patch.

Thank you,
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

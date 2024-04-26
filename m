Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADEDC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0Wu3N65uo1piQQYJr4tEdXkWA6cG4SZZPIfOVUC4t4=; b=1SWYVbzZu+Ohag
	+M4NIA1v3fjzwrJFkGgpgTWJ8k29uA0x+a8Q4Z4ZPvv9wNTkQrM2R2sbyrjuQUDUtyoZtgdK5BMBW
	zfNFh03L6pXk9elKrR7nwHmGDv8X7wBKLyAQPscjb1A39umEYFf+sHOlqhaVVmaQvr65H0LmbB/kR
	+9o7OjQv24PU3YyuBn5rEXnmb/9c5PS8VlinDgyHHRgnFDkGy+FSyh+BE2CuVjhl2WMoc1J0E/c3G
	2UqnMVIVTwqibP+eYgBGA2ol2nnjTQ2rZsrxpjyhFk4TA37YL8GNkL2rTfVB+eLIxgaD9N4GT1I+K
	QlrpEYq3F4okwTcmiIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MJB-0000000CmzF-0eo4;
	Fri, 26 Apr 2024 14:12:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MJ8-0000000CmxK-0YEu
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 14:12:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E27BEE0003;
	Fri, 26 Apr 2024 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714140723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBlZZhqUOxK1WoIWgNjoVopQORRPwTRwg+7z5lKrffc=;
	b=a0yWg0xYVg+XK1+iP6vP7DJO22dF3t4BkE6I6QKK6Rq9EuigqqJaFPj1HsaaR865AuKmXQ
	LHmeUfc95oT+8LXjdjqgH0AmroqFqID86RaE+N7CmcCZ+oh3dW1nbid41OGlx4oYgmNMb/
	lZGZor6r/fj5FCfIKd8FyxbGGP02MOLA9KmQo0te+2SRNIInAOikCTVjkdWIOU9QlPDNBe
	vvGEgCqKBFDkQJoTOyQxawYzZRgxCpWCLOD6VEifIZK/Wb5AIjKzwzsTHA1+9j26IWCuVr
	XChAt9ui+M12CY2V5HeIdOu4lE9gkHms8h6z9GhNWXKVUbYf8kK3DSLmdjGHTg==
Message-ID: <3eb27570-4a53-47f6-8e36-e25fc1063124@bootlin.com>
Date: Fri, 26 Apr 2024 16:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: andi.shyti@kernel.org, jszhang@kernel.org, miquel.raynal@bootlin.com,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 thomas.petazzoni@bootlin.com, guoren@kernel.org, wefu@redhat.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
 <20240425-script-fondness-0e80bfa31615@spud>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240425-script-fondness-0e80bfa31615@spud>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_071210_676058_859C9F5F 
X-CRM114-Status: GOOD (  18.83  )
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



On 4/25/24 6:35 PM, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
>>
>> On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
>>> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
>>> and a default configuration for the BeagleV-Ahead. It appears that the
>>> TH1520 I2C is already supported in the upstream kernel through the
>>> Synopsis Designware I2C adapter driver.
>>> As there is no clock driver for this board as of today, this patch
>>> series uses a fixed-clock named i2c_ic_clk.
>>> There is also no pinctrl driver yet so pinmux must be handled manually
>>> for now.
>>> It also fixes the order of the nodes in the device tree to comply with
>>> device-tree coding-style.
>>>
>>> Thomas Bonnefille (4):
>>>    dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>>>    riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
>>>    riscv: dts: thead: Add TH1520 I2C nodes
>>>    riscv: dts: thead: Enable I2C on the BeagleV-Ahead
>>>
>>>   .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
>>>   .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
>>>   arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
>>>   3 files changed, 127 insertions(+), 27 deletions(-)
>>>
>>> --
>>> 2.44.0
>>>
>>>
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> New warnings running 'make CHECK_DTBS=y thead/th1520-beaglev-ahead.dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
>>
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
> 
> The bot is not freaking out here, 50 MHz is indeed more than 5 MHz :)

5MHz is the maximum clock-frequency, ie. the I2C bus frequency.
This is actually set to 100kHz for I2C0 in the DT:

&i2c0 {
     status = "okay";
     clock-frequency = <100000>; <----
...
};

50MHz is the "fixed-clock" frequency, that is the clock feeding the I2C
IP block:

i2c_ic_clk: i2c-clock {
     compatible = "fixed-clock";
     clock-frequency = <50000000>; <-----
     #clock-cells = <0>;
};

My guess is that the bot confused the clock-frequency parameter for the 
bus clock (SCL) with the i2c-ic-clock value for the controller itself 
during the checks.

Do you agree with this or am I misunderstanding the error ?

If I lower the fixed-clock frequency to eg. 100kHz, the error is gone. 
But I guess the 5MHz limit should probably not apply to the input clock?

Best regards,
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

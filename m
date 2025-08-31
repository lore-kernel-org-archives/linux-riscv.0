Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13036CA0FE8
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Aug 2025 22:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znvT3Ec0HtbUNxkRl4NJd6tbFz7K02WI/W23/VpkVR8=; b=MlSfaHXDuOIcc3
	kvq6I6W7GH1iQWj6WfJlKrsz9j317cMbnHRAxNocZQdW6mZShoxEUKNL0xIEY5mENLDKg0Bab9F14
	Bem4m4DYHEA8EfOafeEMgrB+lxFM6cvcftW3cvtJpxx2Q+GZBfZNeEnFvVs5kUPRCrDrY5rbkC+HO
	3cJ+pdeTB3e5QL4AEm4V9boe5x8hRb53Fxz2NsXkl/+qZRPwMBVTT3ynjCDHR3YTDg08fswNRY3KV
	VCSJSQBh0GpuImtLm2BIsr6Mi6xk9nfWKgvN4tNqdl97mBxBtUzF65jUZkcIP02j3kLnEPbLqV22B
	6t3a6aRj/h5uwbj8ijTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usqon-0000000Am5t-04jE;
	Sun, 31 Aug 2025 22:46:37 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usqok-0000000Am5P-1iUi
	for linux-riscv@lists.infradead.org;
	Sun, 31 Aug 2025 22:46:36 +0000
Received: from [192.168.2.54] (unknown [216.234.200.243])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 6F16FB2200E7;
	Mon,  1 Sep 2025 00:46:28 +0200 (CEST)
Message-ID: <036589cf-3e78-42ea-9876-2a01acdbb598@freeshell.de>
Date: Sun, 31 Aug 2025 15:46:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] riscv: dts: starfive: add Milk-V Mars CM Lite
 system-on-module
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250724094912.253723-1-e@freeshell.de>
 <20250724094912.253723-5-e@freeshell.de>
 <257702B5AE6EE65A+20bf1aab-7fa4-45ba-a8ae-d3aeb5f6e9d9@linux.starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <257702B5AE6EE65A+20bf1aab-7fa4-45ba-a8ae-d3aeb5f6e9d9@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_154634_633359_7F68155D 
X-CRM114-Status: GOOD (  17.96  )
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

On 8/20/25 19:40, Hal Feng wrote:
> On 7/24/2025 5:48 PM, E Shattow wrote:
>> Milk-V Mars CM Lite is a System-on-Module based on the Milk-V Mars CM
>> without the onboard eMMC storage component populated and configured
>> instead for SD3.0 Card Slot on that interface via 100-pin connector.
>>
>> Link to Milk-V Mars CM Lite schematics: https://github.com/milkv-mars/mars-files/tree/main/Mars-CM_Hardware_Schematices
>> Link to StarFive JH7110 Technical Reference Manual: https://doc-en.rvspace.org/JH7110/TRM/index.html
>> Link to Raspberry Pi CM4IO datasheet: https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf
>>
>> Add the devicetree file to make use of StarFive JH7110 common supported
>> features PMIC, EEPROM, UART, I2C, GPIO, PCIe, QSPI Flash, PWM, and
>> Ethernet. Also configure the eMMC interface mmc0 for SD Card use and
>> configure the common SD Card interface mmc1 for onboard SDIO BT+WiFi.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>>  .../dts/starfive/jh7110-milkv-marscm-lite.dts | 176 ++++++++++++++++++
>>  2 files changed, 177 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
>>
>> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
>> index 79742617ddab..62b659f89ba7 100644
>> --- a/arch/riscv/boot/dts/starfive/Makefile
>> +++ b/arch/riscv/boot/dts/starfive/Makefile
>> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
>>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
>>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
>> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-lite.dtb
>>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
>> new file mode 100644
>> index 000000000000..e110146f0b76
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
>> @@ -0,0 +1,176 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2025 E Shattow <e@freeshell.de>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include "jh7110-common.dtsi"
> 
> You can just include "jh7110-milkv-marscm-emmc.dts" instead of "jh7110-common.dtsi".
> And then adding mmc0 changes will be enough.
> 
> Best regards,
> Hal
> 
> ...
> 
>> +&mmc0 {
>> +	bus-width = <4>;
>> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
>> +};
>> +
>> +&mmc0_pins {
>> +	pwren-pins {
>> +		pinmux = <GPIOMUX(22, GPOUT_HIGH,
>> +				      GPOEN_ENABLE,
>> +				      GPI_NONE)>;
>> +	};
>> +};
>> +
> ...
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Okay. I will refactor the series to create and use
"jh7110-milkv-marscm.dtsi" common board include.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

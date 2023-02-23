Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE21C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q44RY/Flv+rQ2EU+GbCIqZ7kmsVKxXIWFexc2KhRY50=; b=wx+3QIzp5hjEYO
	YbjIGNakzlr8kImPwqtX4N2QluTaigp6wMf0KJTf6itlLsXMwp9x7DqU7nvFaux71/Neb9se7FUWS
	p3SmF0xJEaxBHIreWRvU9APtWNSjWhEGsPaeMA1B7Q2IffPDIfoCq5WveSBEQSpbl8lAaj4+t9J/z
	cWVd8E9f7SNyQBVH6PxVgc95AFtwILvf4WFhcTZ3ypRacjNLSiG6L7GmVr6DRpe3cnLhr0/lLkf/I
	lDcSScn8xJeSjfhJzTvVo95nFtnIllULoCMR6sawB3M5+OI04WYGzrgxE24FiW4z51jM6EMHW325o
	RHTsTyf2U54ZFk5SvFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7JM-00FaWu-Lr; Thu, 23 Feb 2023 08:50:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7JJ-00FaW1-OP
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 08:50:43 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0B78224E143;
	Thu, 23 Feb 2023 16:50:24 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:50:24 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:50:22 +0800
Message-ID: <2af3f84b-2c2b-dc79-c76c-9411fcbcf7ca@starfivetech.com>
Date: Thu, 23 Feb 2023 16:50:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 19/19] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-20-hal.feng@starfivetech.com>
 <CAJM55Z_QMtzKeRFN1iGf498z4+vga6RBgwybCQi6aOUYCr_P-Q@mail.gmail.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <CAJM55Z_QMtzKeRFN1iGf498z4+vga6RBgwybCQi6aOUYCr_P-Q@mail.gmail.com>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_005042_241701_7BB32E94 
X-CRM114-Status: GOOD (  18.23  )
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

On Tue, 21 Feb 2023 16:03:08 +0100, Emil Renner Berthing wrote:
> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
>> which has version A and version B. Support booting and basic
>> clock/reset/pinctrl/uart drivers.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/Makefile         |   6 +-
>>  .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
>>  .../jh7110-starfive-visionfive-2-v1.3b.dts    |  13 ++
>>  .../jh7110-starfive-visionfive-2.dtsi         | 215 ++++++++++++++++++
>>  4 files changed, 246 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
>> index 039c143cba33..cd73519b907b 100644
>> --- a/arch/riscv/boot/dts/starfive/Makefile
>> +++ b/arch/riscv/boot/dts/starfive/Makefile
>> @@ -1,2 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> -dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
>> +dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
>> +dtb-$(CONFIG_SOC_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>> +
>> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
>> new file mode 100644
>> index 000000000000..4af3300f3cf3
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110-starfive-visionfive-2.dtsi"
>> +
>> +/ {
>> +       model = "StarFive VisionFive 2 v1.2A";
>> +       compatible = "starfive,visionfive-2-v1.2a", "starfive,jh7110";
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
>> new file mode 100644
>> index 000000000000..9230cc3d8946
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110-starfive-visionfive-2.dtsi"
>> +
>> +/ {
>> +       model = "StarFive VisionFive 2 v1.3B";
>> +       compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> new file mode 100644
>> index 000000000000..c2aa8946a0f1
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -0,0 +1,215 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110.dtsi"
>> +#include "jh7110-pinfunc.h"
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +       aliases {
>> +               serial0 = &uart0;
>> +               i2c0 = &i2c0;
>> +               i2c2 = &i2c2;
>> +               i2c5 = &i2c5;
>> +               i2c6 = &i2c6;
> 
> Let's keep these sorted alphabetically.

OK, will fix it.

> 
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0:115200n8";
>> +       };
>> +
>> +       cpus {
>> +               timebase-frequency = <4000000>;
>> +       };
>> +
>> +       memory@40000000 {
>> +               device_type = "memory";
>> +               reg = <0x0 0x40000000 0x1 0x0>;
>> +       };
>> +
>> +       gpio-restart {
>> +               compatible = "gpio-restart";
>> +               gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
>> +               priority = <224>;
>> +       };
>> +};
>> +
>> +&osc {
>> +       clock-frequency = <24000000>;
>> +};
>> +
>> +&rtc_osc {
>> +       clock-frequency = <32768>;
>> +};
>> +
>> +&gmac0_rmii_refin {
>> +       clock-frequency = <50000000>;
>> +};
>> +
>> +&gmac0_rgmii_rxin {
>> +       clock-frequency = <125000000>;
>> +};
>> +
>> +&gmac1_rmii_refin {
>> +       clock-frequency = <50000000>;
>> +};
>> +
>> +&gmac1_rgmii_rxin {
>> +       clock-frequency = <125000000>;
>> +};
>> +
>> +&i2stx_bclk_ext {
>> +       clock-frequency = <12288000>;
>> +};
>> +
>> +&i2stx_lrck_ext {
>> +       clock-frequency = <192000>;
>> +};
>> +
>> +&i2srx_bclk_ext {
>> +       clock-frequency = <12288000>;
>> +};
>> +
>> +&i2srx_lrck_ext {
>> +       clock-frequency = <192000>;
>> +};
>> +
>> +&tdm_ext {
>> +       clock-frequency = <49152000>;
>> +};
>> +
>> +&mclk_ext {
>> +       clock-frequency = <12288000>;
>> +};
>> +
>> +&uart0 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&uart0_pins>;
>> +       status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +       clock-frequency = <100000>;
>> +       i2c-sda-hold-time-ns = <300>;
>> +       i2c-sda-falling-time-ns = <510>;
>> +       i2c-scl-falling-time-ns = <510>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&i2c0_pins>;
>> +       status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +       clock-frequency = <100000>;
>> +       i2c-sda-hold-time-ns = <300>;
>> +       i2c-sda-falling-time-ns = <510>;
>> +       i2c-scl-falling-time-ns = <510>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&i2c2_pins>;
>> +       status = "okay";
>> +};
>> +
>> +&i2c5 {
>> +       clock-frequency = <100000>;
>> +       i2c-sda-hold-time-ns = <300>;
>> +       i2c-sda-falling-time-ns = <510>;
>> +       i2c-scl-falling-time-ns = <510>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&i2c5_pins>;
>> +       status = "okay";
>> +};
>> +
>> +&i2c6 {
>> +       clock-frequency = <100000>;
>> +       i2c-sda-hold-time-ns = <300>;
>> +       i2c-sda-falling-time-ns = <510>;
>> +       i2c-scl-falling-time-ns = <510>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&i2c6_pins>;
>> +       status = "okay";
>> +};
>> +
>> +&sysgpio {
>> +       uart0_pins: uart0-0 {
>> +               tx-pins {
>> +                       pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
>> +                                            GPOEN_ENABLE,
>> +                                            GPI_NONE)>;
>> +                       bias-disable;
>> +                       drive-strength = <12>;
>> +                       input-disable;
>> +                       input-schmitt-disable;
>> +                       slew-rate = <0>;
>> +               };
>> +
>> +               rx-pins {
>> +                       pinmux = <GPIOMUX(6, GPOUT_LOW,
>> +                                            GPOEN_DISABLE,
>> +                                            GPI_SYS_UART0_RX)>;
>> +                       bias-disable; /* external pull-up */
>> +                       drive-strength = <2>;
>> +                       input-enable;
>> +                       input-schmitt-enable;
>> +                       slew-rate = <0>;
>> +               };
>> +       };
>> +
>> +       i2c0_pins: i2c0-0 {
>> +               i2c-pins {
>> +                       pinmux = <GPIOMUX(57, GPOUT_LOW,
>> +                                             GPOEN_SYS_I2C0_CLK,
>> +                                             GPI_SYS_I2C0_CLK)>,
>> +                                <GPIOMUX(58, GPOUT_LOW,
>> +                                             GPOEN_SYS_I2C0_DATA,
>> +                                             GPI_SYS_I2C0_DATA)>;
>> +                       bias-disable; /* external pull-up */
>> +                       input-enable;
>> +                       input-schmitt-enable;
>> +               };
>> +       };
>> +
>> +       i2c2_pins: i2c2-0 {
>> +               i2c-pins {
>> +                       pinmux = <GPIOMUX(3, GPOUT_LOW,
>> +                                            GPOEN_SYS_I2C2_CLK,
>> +                                            GPI_SYS_I2C2_CLK)>,
>> +                                <GPIOMUX(2, GPOUT_LOW,
>> +                                            GPOEN_SYS_I2C2_DATA,
>> +                                            GPI_SYS_I2C2_DATA)>;
>> +                       bias-disable; /* external pull-up */
>> +                       input-enable;
>> +                       input-schmitt-enable;
>> +               };
>> +       };
>> +
>> +       i2c5_pins: i2c5-0 {
>> +               i2c-pins {
>> +                       pinmux = <GPIOMUX(19, GPOUT_LOW,
>> +                                             GPOEN_SYS_I2C5_CLK,
>> +                                             GPI_SYS_I2C5_CLK)>,
>> +                                <GPIOMUX(20, GPOUT_LOW,
>> +                                             GPOEN_SYS_I2C5_DATA,
>> +                                             GPI_SYS_I2C5_DATA)>;
>> +                       bias-disable; /* external pull-up */
>> +                       input-enable;
>> +                       input-schmitt-enable;
>> +               };
>> +       };
>> +
>> +       i2c6_pins: i2c6-0 {
>> +               i2c-pins {
>> +                       pinmux = <GPIOMUX(16, GPOUT_LOW,
>> +                                             GPOEN_SYS_I2C6_CLK,
>> +                                             GPI_SYS_I2C6_CLK)>,
>> +                                <GPIOMUX(17, GPOUT_LOW,
>> +                                             GPOEN_SYS_I2C6_DATA,
>> +                                             GPI_SYS_I2C6_DATA)>;
>> +                       bias-disable; /* external pull-up */
>> +                       input-enable;
>> +                       input-schmitt-enable;
>> +               };
>> +       };
>> +};
> 
> It would be great to have some sort of order to this file so it's
> obvious where to add new nodes. I suggest we do
> - root node
> - external clocks
> - other node references in alphabetical order
> 
> You're almost there with this patch except the uart0 node is out of place.

Will fix accordingly. Thanks for your suggestions.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

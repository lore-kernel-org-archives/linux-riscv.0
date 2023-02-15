Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39686C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tGoqxnof34dDGSB4KNeQiMXVi+3di2KQL4oDAzQF4Q=; b=MX1UjBVlrSjT+Y
	v3TOSqvp1dBvPUPPoMtEyGXd0Hwgn3qbItQEOcu+fe5lV2SGoYEffWM5DDFI7HxvZRgvqaXAr5VnE
	x3MPE5r2KdOJBn5IPI2EmwmJsCZHFtldgH2DQwM47oedFV4Crj3FleXQY/+vugDScOw0xwzXQgWak
	G82NpHjKa4x+6n8YTkeimFF7pGyGYTbERrzJZNSvKpRsRf4Sp1RgOQkvXcCrS6dguZSLXR/HZL8SJ
	Hy9bsqkPvy6Z2stoBMyKixW37UMXBpSIH935uXpQYq9eJDS3Cn9azJjSsRxJ5E5+zABGBwjssVdfn
	2c9OocgMetzr8oFfuolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSF5w-005T1L-Hm; Wed, 15 Feb 2023 10:33:00 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSF5s-005Syh-J0
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 10:32:59 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DD11724E2A9;
	Wed, 15 Feb 2023 18:32:30 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 18:32:31 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 18:32:30 +0800
Message-ID: <8abe3cb3-3cae-9e22-1528-9c3bbbe8fb7d@starfivetech.com>
Date: Wed, 15 Feb 2023 18:32:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
 <20230203081913.81968-4-william.qiu@starfivetech.com>
 <CAJM55Z8CRT_H-by=Nj0Nu1iWug1wdPMZceiE+RMJvE+q4RzQ7w@mail.gmail.com>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAJM55Z8CRT_H-by=Nj0Nu1iWug1wdPMZceiE+RMJvE+q4RzQ7w@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_023256_923181_BBD0C3E3 
X-CRM114-Status: GOOD (  15.36  )
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



On 2023/2/15 18:31, Emil Renner Berthing wrote:
> On Fri, 3 Feb 2023 at 09:21, William Qiu <william.qiu@starfivetech.com> wrote:
>>
>> This adds the mmc node for the StarFive JH7110 SoC.
>> Set mmco node to emmc and set mmc1 node to sd.
>>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 23 ++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 37 +++++++++++++++++++
>>  2 files changed, 60 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index c60280b89c73..e1a0248e907f 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -42,6 +42,29 @@ &rtc_osc {
>>         clock-frequency = <32768>;
>>  };
>>
>> +&mmc0 {
>> +       max-frequency = <100000000>;
>> +       bus-width = <8>;
>> +       cap-mmc-highspeed;
>> +       mmc-ddr-1_8v;
>> +       mmc-hs200-1_8v;
>> +       non-removable;
>> +       cap-mmc-hw-reset;
>> +       post-power-on-delay-ms = <200>;
>> +       status = "okay";
>> +};
>> +
>> +&mmc1 {
>> +       max-frequency = <100000000>;
>> +       bus-width = <4>;
>> +       no-sdio;ru
>> +       no-mmc;
>> +       broken-cd;
>> +       cap-sd-highspeed;
>> +       post-power-on-delay-ms = <200>;
>> +       status = "okay";
>> +};
> 
> Please add these so they're sorted alphabetically (but keep the clocks
> at the top), so there's at least some sort of system.
> 
>>  &gmac0_rmii_refin {
>>         clock-frequency = <50000000>;
>>  };
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 64d260ea1f29..ae1a664e7af5 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -370,6 +370,11 @@ syscrg: clock-controller@13020000 {
>>                         #reset-cells = <1>;
>>                 };
>>
>> +               sysreg: syscon@13030000 {
>> +                       compatible = "starfive,sysreg", "syscon";
>> +                       reg = <0x0 0x13030000 0x0 0x1000>;
>> +               };
>> +
>>                 gpio: gpio@13040000 {
>>                         compatible = "starfive,jh7110-sys-pinctrl";
>>                         reg = <0x0 0x13040000 0x0 0x10000>;
>> @@ -407,5 +412,37 @@ gpioa: gpio@17020000 {
>>                         gpio-controller;
>>                         #gpio-cells = <2>;
>>                 };
>> +
>> +               mmc0: mmc@16010000 {
>> +                       compatible = "starfive,jh7110-mmc";
>> +                       reg = <0x0 0x16010000 0x0 0x10000>;
>> +                       clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
>> +                                <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
>> +                       clock-names = "biu","ciu";
>> +                       resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
>> +                       reset-names = "reset";
>> +                       interrupts = <74>;
>> +                       fifo-depth = <32>;
>> +                       fifo-watermark-aligned;
>> +                       data-addr = <0>;
>> +                       starfive,sysreg = <&sysreg 0x14 0x1a 0x7c000000>;
> 
> This may need updating depending on whether you fix the driver or bindings.
> 
I'll do it then
>> +                       status = "disabled";
>> +               };
>> +
>> +               mmc1: mmc@16020000 {
>> +                       compatible = "starfive,jh7110-mmc";
>> +                       reg = <0x0 0x16020000 0x0 0x10000>;
>> +                       clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
>> +                                <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
>> +                       clock-names = "biu","ciu";
>> +                       resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
>> +                       reset-names = "reset";
>> +                       interrupts = <75>;
>> +                       fifo-depth = <32>;
>> +                       fifo-watermark-aligned;
>> +                       data-addr = <0>;
>> +                       starfive,sysreg = <&sysreg 0x9c 0x1 0x3e>;
>> +                       status = "disabled";
>> +               };
>>         };
>>  };
>> --
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

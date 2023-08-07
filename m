Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209B8C001DF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 01:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBatoyZqsP/3yhnhVvWSCZzznG3RUjalrJCZl17q01o=; b=ymElffV5dAeRLt
	22INW7SL6T1i4kzzU3QI8d5/3bE8uLuCrNiN9MGYqjLuNlAlT8NRVLaFy/FxTvUSCgRoddSXQcej9
	V8qqqea0vZ3t0N8ADLRkOBvuHVQpCtSVi49hOVqMlRML1dNnYJ+oN/BrTDuJ21q0JaA9kXAWaj/at
	dpotkAxhY5AVwvguiDxMvdv9C1ZNpr6zH03IhONOpUq7i3g81RUrqfCGPyNSgvLzINpMRNv6OHujY
	bo/Jf9OQn7R3SExGpEGULjRreNYRfqf/2MCgTIj/lQLncjHWug/25fYTGvcjOKgpDYR8tnPPHZPAT
	V7Codx7kxq37ry+qOcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSpPw-00FzK5-1D;
	Mon, 07 Aug 2023 01:52:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSpPr-00FzDS-1z
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 01:52:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 75DE1806C;
	Mon,  7 Aug 2023 09:51:09 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 09:51:09 +0800
Received: from [192.168.120.59] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 09:51:08 +0800
Message-ID: <66287e45-f2ed-7010-95f4-9a307108795b@starfivetech.com>
Date: Mon, 7 Aug 2023 09:51:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/4] riscv: dts: starfive: Add mmc node
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-4-william.qiu@starfivetech.com>
 <CAJM55Z8gVEZS4Ws2Gi7_JbdkS-4y3_8mQvR4ZxLCWZ4A1y9X1g@mail.gmail.com>
 <CAJM55Z-h+CUmWtkn31Ek+qvxrOr5_Jz3QRRLqWYLz2A0E+h+rA@mail.gmail.com>
 <d967d628-6961-568e-d72e-ce0e17153818@starfivetech.com>
 <CAJM55Z_sXt8G4+SFuN74g95zjE73f=9gbtVE+dxZ0UDEcH1hMQ@mail.gmail.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAJM55Z_sXt8G4+SFuN74g95zjE73f=9gbtVE+dxZ0UDEcH1hMQ@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_185216_187228_CDB28D76 
X-CRM114-Status: GOOD (  24.88  )
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



On 2023/8/5 21:14, Emil Renner Berthing wrote:
> On Wed, 15 Feb 2023 at 13:26, William Qiu <william.qiu@starfivetech.com> wrote:
>> On 2023/2/15 20:22, Emil Renner Berthing wrote:
>> > On Wed, 15 Feb 2023 at 13:12, Emil Renner Berthing
>> > <emil.renner.berthing@canonical.com> wrote:
>> >>
>> >> On Wed, 15 Feb 2023 at 12:35, William Qiu <william.qiu@starfivetech.com> wrote:
>> >> >
>> >> > Add the mmc node for the StarFive JH7110 SoC.
>> >> > Set mmco node to emmc and set mmc1 node to sd.
>> >> >
>> >> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> >> > ---
>> >> >  .../jh7110-starfive-visionfive-2.dtsi         | 23 +++++++++
>> >> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 47 +++++++++++++++++++
>> >> >  2 files changed, 70 insertions(+)
>> >> >
>> >> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> >> > index c60280b89c73..e1a0248e907f 100644
>> >> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> >> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> >> > @@ -42,6 +42,29 @@ &rtc_osc {
>> >> >         clock-frequency = <32768>;
>> >> >  };
>> >> >
>> >> > +&mmc0 {
>> >> > +       max-frequency = <100000000>;
>> >> > +       bus-width = <8>;
>> >> > +       cap-mmc-highspeed;
>> >> > +       mmc-ddr-1_8v;
>> >> > +       mmc-hs200-1_8v;
>> >> > +       non-removable;
>> >> > +       cap-mmc-hw-reset;
>> >> > +       post-power-on-delay-ms = <200>;
>> >> > +       status = "okay";
>> >> > +};
>> >> > +
>> >> > +&mmc1 {
>> >> > +       max-frequency = <100000000>;
>> >> > +       bus-width = <4>;
>> >> > +       no-sdio;
>> >> > +       no-mmc;
>> >> > +       broken-cd;
>> >> > +       cap-sd-highspeed;
>> >> > +       post-power-on-delay-ms = <200>;
>> >> > +       status = "okay";
>> >> > +};
>> >
>> > These nodes are also still oddly placed in the middle of the external
>> > clocks. Again please keep the external clocks at the top and then
>> > order the nodes alphabetically to have some sort of system.
>> >
>>
>>
>> Hi Emil,
>>
>> I'll update it in next version.
> 
> Hi William,
> 
> It seems the mmc nodes are still missing from the upstream device
> tree. The sysreg nodes have been added in Conors riscv-dt-for-next[1]
> branch, so I don't see any missing dependencies. Could you please
> update and send a new version of this?
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next
> 
> /Emil
> 

Hi Emil,

I will start to do the upstream work of this part from this week.
Since the mmc driver has some modifications, I will send a separate
patch series.

Best Regards,
William
>> Best Regards
>> William
>>
>> >> >  &gmac0_rmii_refin {
>> >> >         clock-frequency = <50000000>;
>> >> >  };
>> >> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> >> > index 64d260ea1f29..17f7b3ee6ca3 100644
>> >> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> >> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> >> > @@ -314,6 +314,11 @@ uart2: serial@10020000 {
>> >> >                         status = "disabled";
>> >> >                 };
>> >> >
>> >> > +               stg_syscon: syscon@10240000 {
>> >> > +                       compatible = "starfive,jh7110-stg-syscon", "syscon";
>> >> > +                       reg = <0x0 0x10240000 0x0 0x1000>;
>> >> > +               };
>> >> > +
>> >> >                 uart3: serial@12000000 {
>> >> >                         compatible = "snps,dw-apb-uart";
>> >> >                         reg = <0x0 0x12000000 0x0 0x10000>;
>> >> > @@ -370,6 +375,11 @@ syscrg: clock-controller@13020000 {
>> >> >                         #reset-cells = <1>;
>> >> >                 };
>> >> >
>> >> > +               sys_syscon: syscon@13030000 {
>> >> > +                       compatible = "starfive,jh7110-sys-syscon", "syscon";
>> >> > +                       reg = <0x0 0x13030000 0x0 0x1000>;
>> >> > +               };
>> >> > +
>> >> >                 gpio: gpio@13040000 {
>> >> >                         compatible = "starfive,jh7110-sys-pinctrl";
>> >> >                         reg = <0x0 0x13040000 0x0 0x10000>;
>> >> > @@ -397,6 +407,11 @@ aoncrg: clock-controller@17000000 {
>> >> >                         #reset-cells = <1>;
>> >> >                 };
>> >> >
>> >> > +               aon_syscon: syscon@17010000 {
>> >> > +                       compatible = "starfive,jh7110-aon-syscon", "syscon";
>> >> > +                       reg = <0x0 0x17010000 0x0 0x1000>;
>> >> > +               };
>> >> > +
>> >> >                 gpioa: gpio@17020000 {
>> >> >                         compatible = "starfive,jh7110-aon-pinctrl";
>> >> >                         reg = <0x0 0x17020000 0x0 0x10000>;
>> >> > @@ -407,5 +422,37 @@ gpioa: gpio@17020000 {
>> >> >                         gpio-controller;
>> >> >                         #gpio-cells = <2>;
>> >> >                 };
>> >> > +
>> >> > +               mmc0: mmc@16010000 {
>> >> > +                       compatible = "starfive,jh7110-mmc";
>> >> > +                       reg = <0x0 0x16010000 0x0 0x10000>;
>> >> > +                       clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
>> >> > +                                <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
>> >> > +                       clock-names = "biu","ciu";
>> >> > +                       resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
>> >> > +                       reset-names = "reset";
>> >> > +                       interrupts = <74>;
>> >> > +                       fifo-depth = <32>;
>> >> > +                       fifo-watermark-aligned;
>> >> > +                       data-addr = <0>;
>> >> > +                       starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
>> >> > +                       status = "disabled";
>> >> > +               };
>> >> > +
>> >> > +               mmc1: mmc@16020000 {
>> >> > +                       compatible = "starfive,jh7110-mmc";
>> >> > +                       reg = <0x0 0x16020000 0x0 0x10000>;
>> >> > +                       clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
>> >> > +                                <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
>> >> > +                       clock-names = "biu","ciu";
>> >> > +                       resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
>> >> > +                       reset-names = "reset";
>> >> > +                       interrupts = <75>;
>> >> > +                       fifo-depth = <32>;
>> >> > +                       fifo-watermark-aligned;
>> >> > +                       data-addr = <0>;
>> >> > +                       starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
>> >> > +                       status = "disabled";
>> >> > +               };
>> >>
>> >> Hi William,
>> >>
>> >> These nodes still don't seem to be sorted by address, eg. by the
>> >> number after the @
>> >> Also please move the dt-binding patch before this one, so dtb_check
>> >> won't fail no matter where git bisect happens to land.
>> >>
>> >> /Emil
>> >>
>> >> >         };
>> >> >  };
>> >> > --
>> >> > 2.34.1
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > linux-riscv mailing list
>> >> > linux-riscv@lists.infradead.org
>> >> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

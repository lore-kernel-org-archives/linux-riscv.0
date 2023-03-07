Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12C4C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YL92f/wocsFPCj2GsKHvEmgUP+vQZnoU8tzN+hxhRF4=; b=N27f9qQfJIhBS3
	+nqFdMGkjlPZrX3bGIF+4DXKffNw40Zdu0v79S41ekqGos23sZCTyh72B4NMQgHi2Uy7Wve19YQUK
	VCKuZCyJsTo5gCRsD7tr3XjbmGLfnYZbwP2aWRNPShZumncXSDzdtIxtfmkywS67Wm+jK4K3u3Myr
	U4K3BfZ8rxkGNCvYwenBR2srJ19npr+y0L88GIaFWBvdONSCAyRK0qxAOjIeyQ8n4K+QNqxscCgJX
	13+4kl9lHgjU5Mug2S9iaeCM9GaMfE9oKrhi+lAkPiN1ekAXVvo/TAMwmIu97UWoyjn7QoP4kwzIZ
	KyqiV01pUaF2iwZkiOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZS7C-00GXls-Kc; Tue, 07 Mar 2023 07:52:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZS79-00GXhU-8p
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 07:52:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9A36024E30E;
	Tue,  7 Mar 2023 15:51:40 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 15:51:40 +0800
Received: from [192.168.125.108] (183.27.97.46) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 15:51:39 +0800
Message-ID: <ce013b9a-ea3c-7942-263f-3afa673ce5ee@starfivetech.com>
Date: Tue, 7 Mar 2023 15:51:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] dts: usb: add StarFive JH7110 USB dts configuration.
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230306095408.26057-1-minda.chen@starfivetech.com>
 <CAJM55Z_kUPYOXwccDOaGk2DoRd9sNrGdpKKMyRUijh5SoPnJ4w@mail.gmail.com>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <CAJM55Z_kUPYOXwccDOaGk2DoRd9sNrGdpKKMyRUijh5SoPnJ4w@mail.gmail.com>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_235203_616254_3F32CF76 
X-CRM114-Status: GOOD (  11.35  )
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



On 2023/3/7 2:32, Emil Renner Berthing wrote:
> On Mon, 6 Mar 2023 at 10:55, Minda Chen <minda.chen@starfivetech.com> wrote:
>>
>> USB phy dts configuration. Also includes Cadence USB
>> subnode configuration.
>>
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         |  6 +++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 39 +++++++++++++++++++
>>  2 files changed, 45 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index e8b8f4346fdd..2a9ed8b9ee25 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -244,3 +244,9 @@
>>                 };
>>         };
>>  };
>> +
>> +&usb0 {
>> +       starfive,usb2-only;
>> +       dr_mode = "peripheral";
>> +       status = "okay";
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index be180f23963e..ee665cdc3510 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -628,5 +628,44 @@
>>                         starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
>>                         status = "disabled";
>>                 };
>> +
>> +               usb0: usbphy@10200000 {
> 
> Please keep the nodes sorted by the address after @
>ok. Thanks.
>> +                       compatible = "starfive,jh7110-usb";
>> +                       reg = <0x0 0x10210000 0x0 0x1000>,
>> +                             <0x0 0x10200000 0x0 0x1000>;
>> +                       reg-names = "usb3", "usb2";
>> +                       clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
>> +                                <&stgcrg JH7110_STGCLK_USB0_APP_125>,
>> +                                <&stgcrg JH7110_STGCLK_USB0_LPM>,
>> +                                <&stgcrg JH7110_STGCLK_USB0_STB>,
>> +                                <&stgcrg JH7110_STGCLK_USB0_APB>,
>> +                                <&stgcrg JH7110_STGCLK_USB0_AXI>,
>> +                                <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
>> +                       clock-names = "usb_125m", "usb0_app_125", "usb0_lpm",
>> +                               "usb0_stb", "usb0_apb", "usb0_axi", "usb0_utmi_apb";
>> +                       resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
>> +                                <&stgcrg JH7110_STGRST_USB0_APB>,
>> +                                <&stgcrg JH7110_STGRST_USB0_AXI>,
>> +                                <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
>> +                       starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
>> +                       starfive,sys-syscon = <&sys_syscon 0x18>;
>> +                       status = "disabled";
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       #interrupt-cells = <1>;
>> +                       #phy-cells = <0>;
>> +                       ranges;
> 
> Please add an empty line here.
> ok.
>> +                       usbdrd_cdns3: usb@10100000 {
>> +                               compatible = "cdns,usb3";
>> +                               reg = <0x0 0x10100000 0x0 0x10000>,
>> +                                     <0x0 0x10110000 0x0 0x10000>,
>> +                                     <0x0 0x10120000 0x0 0x10000>;
>> +                               reg-names = "otg", "xhci", "dev";
>> +                               interrupts = <100>, <108>, <110>;
>> +                               interrupt-names = "host", "peripheral", "otg";
>> +                               phy-names = "cdns3,usb3-phy", "cnds3,usb2-phy";
>> +                               maximum-speed = "super-speed";
>> +                       };
>> +               };
>>         };
>>  };
>> --
>> 2.17.1
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

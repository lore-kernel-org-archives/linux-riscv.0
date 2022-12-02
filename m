Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A83C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVPYqNupslFjv4kSFujUJ+4+6FPxzcCum5GLQFvkG34=; b=H7o6eafEzBgx6l
	ySsAfC8TLimf10WO0mYgnvin7tSwHSIA9MWQrsAPbylbMfZnmhcc9MxtTiKF832hcbW1S1gDc6V6H
	VOfbNTCA4+F+53FGcmYR5jZ6vDLXNls/EvorfqwRo1aCSgL6BBidxbzPlmC8FoYkN4P8NjlMTuXF4
	QKmJLfE1VcmtmJVQcn9h3gS9tm9cd0zeof2EB+qhBrIPG3zfvl8PMhF3njkRWaZ0jCOIBovnKRGTl
	QUKnRZVCyu6x8Ne+ZJLTmdIo/xT+3XEqEXwh69I1QJTTDHUKS6IZ2DtcVMUDiyDli/CkAAEYN9Atc
	LOs7F35z/Jq5UAVzMAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yzh-00DfNB-R3; Fri, 02 Dec 2022 05:53:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yzd-00Df3l-DK
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 05:53:52 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 125FA24DBCB;
	Fri,  2 Dec 2022 13:53:20 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 13:53:20 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 13:53:18 +0800
Message-ID: <40c1995e-07ea-9c84-e36f-8d179daa5c0b@starfivetech.com>
Date: Fri, 2 Dec 2022 13:53:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 6/7] riscv: dts: starfive: jh7110: Add ethernet device
 node
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-7-yanhong.wang@starfivetech.com> <Y4joSiz0gKvyuecn@spud>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <Y4joSiz0gKvyuecn@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_215349_745218_1CA979E6 
X-CRM114-Status: GOOD (  13.76  )
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



On 2022/12/2 1:45, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 05:02:41PM +0800, Yanhong Wang wrote:
>> Add JH7110 ethernet device node to support gmac driver for the JH7110
>> RISC-V SoC.
>> 
>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 80 ++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index c22e8f1d2640..97ed5418d91f 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -433,5 +433,85 @@
>>  			reg-shift = <2>;
>>  			status = "disabled";
>>  		};
>> +
>> +		stmmac_axi_setup: stmmac-axi-config {
>> +			snps,wr_osr_lmt = <4>;
>> +			snps,rd_osr_lmt = <4>;
>> +			snps,blen = <256 128 64 32 0 0 0>;
>> +		};
>> +
>> +		gmac0: ethernet@16030000 {
>> +			compatible = "starfive,dwmac", "snps,dwmac-5.20";
>> +			reg = <0x0 0x16030000 0x0 0x10000>;
>> +			clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
>> +				 <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
>> +				 <&aoncrg JH7110_AONCLK_GMAC0_TX>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC0_GTXC>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>;
>> +			clock-names = "stmmaceth",
>> +					"pclk",
>> +					"ptp_ref",
>> +					"tx",
>> +					"gtxc",
>> +					"gtx";
> 
> Can you sort this into fewer lines please?

Will sort in the next version.

> 
>> +			resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
>> +				 <&aoncrg JH7110_AONRST_GMAC0_AHB>;
>> +			reset-names = "stmmaceth", "ahb";
>> +			interrupts = <7>, <6>, <5> ;
> 
> Please also remove the space before the ;

Will remove the space.

> 
>> +			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> 
> The answer is probably "the dw driver needs this" but my OCD really
> hates "macirq" vs "eth_wake_irq"..

The definition of  "macirq" and "eth_wake_irq"  is to reuse stmmac_get_platform_resources() API. 

> 
>> +			phy-mode = "rgmii-id";
>> +			snps,multicast-filter-bins = <64>;
>> +			snps,perfect-filter-entries = <8>;
>> +			rx-fifo-depth = <2048>;
>> +			tx-fifo-depth = <2048>;
>> +			snps,fixed-burst;
>> +			snps,no-pbl-x8;
>> +			snps,force_thresh_dma_mode;
>> +			snps,axi-config = <&stmmac_axi_setup>;
>> +			snps,tso;
>> +			snps,en-tx-lpi-clockgating;
>> +			snps,lpi_en;
>> +			snps,txpbl = <16>;
>> +			snps,rxpbl = <16>;
>> +			status = "disabled";
>> +		};
>> +
>> +		gmac1: ethernet@16040000 {
>> +			compatible = "starfive,dwmac", "snps,dwmac-5.20";
>> +			reg = <0x0 0x16040000 0x0 0x10000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC1_TX>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC1_GTXC>,
>> +				 <&syscrg JH7110_SYSCLK_GMAC1_GTXCLK>;
>> +			clock-names = "stmmaceth",
>> +					"pclk",
>> +					"ptp_ref",
>> +					"tx",
>> +					"gtxc",
>> +					"gtx";
>> +			resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
>> +				 <&syscrg JH7110_SYSRST_GMAC1_AHB>;
>> +			reset-names = "stmmaceth", "ahb";
>> +			interrupts = <78>, <77>, <76> ;
> 
> Same comments for this node.

Will remove the space.

> 
>> +			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
>> +			phy-mode = "rgmii-id";
>> +			snps,multicast-filter-bins = <64>;
>> +			snps,perfect-filter-entries = <8>;
>> +			rx-fifo-depth = <2048>;
>> +			tx-fifo-depth = <2048>;
>> +			snps,fixed-burst;
>> +			snps,no-pbl-x8;
>> +			snps,force_thresh_dma_mode;
>> +			snps,axi-config = <&stmmac_axi_setup>;
>> +			snps,tso;
>> +			snps,en-tx-lpi-clockgating;
>> +			snps,lpi_en;
>> +			snps,txpbl = <16>;
>> +			snps,rxpbl = <16>;
>> +			status = "disabled";
>> +		};
>>  	};
>>  };
>> -- 
>> 2.17.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

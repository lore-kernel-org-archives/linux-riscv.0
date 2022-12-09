Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78366C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOpmRR8/nibFPcCA5uW47Eaj+lIgS1DVScqq3D+jrVI=; b=q+BAbMpTFUnPuT
	p2t0WEx2ztfoZIkb/sBnR+HDsaHrlqaJYG+EscgkgPANkTK6JNuVfqq2c5TEj0m1yDVQfF9TdK3ys
	G1FSJcFaGqDWvMBjaob6pC1FCSi0OY0KAnBaotwelor31T9QEXpaytC7fVtO3ohUS6ZZkT77JROh7
	lf4Vp7XA1eP5Yx5Zth6p13Kht5Rcq1YiVWS/7UTJ/fegCl7i5Rn1sAhHyPEN/UdWyo4DtBY5Ww+s9
	cO1fxTj0RgvI7sK1YykfGD7Ry0N/LFAryZZY/53o2vbs3PjrZNm3OLyCVT8IAVTzKOyYUeCM107eU
	btgFakduuKgSrYF/GAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S42-00HVSf-OW; Fri, 09 Dec 2022 01:20:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S3u-00HV8w-Jt
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:20:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DB57824E041;
	Fri,  9 Dec 2022 09:19:53 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 9 Dec
 2022 09:19:51 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 9 Dec
 2022 09:19:49 +0800
Message-ID: <ed2f5df6-66c4-26b4-b650-48a128760965@starfivetech.com>
Date: Fri, 9 Dec 2022 09:19:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 7/7] riscv: dts: starfive: visionfive-v2: Add phy
 delay_chain configuration
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
 <20221201090242.2381-8-yanhong.wang@starfivetech.com> <Y4jpDvXo/uj9ygLR@spud>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <Y4jpDvXo/uj9ygLR@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172026_956957_26E21B67 
X-CRM114-Status: GOOD (  12.10  )
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



On 2022/12/2 1:49, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 05:02:42PM +0800, Yanhong Wang wrote:
>> Add phy delay_chain configuration to support motorcomm phy driver for
>> StarFive VisionFive 2 board.
>> 
>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-v2.dts         | 46 +++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>> index c8946cf3a268..2868ef4c74ef 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
>> @@ -15,6 +15,8 @@
>>  
>>  	aliases {
>>  		serial0 = &uart0;
>> +		ethernet0=&gmac0;
>> +		ethernet1=&gmac1;
> 
> Please match the whitespace usage of the existing entry.
> 

Will fix in the next version.

>>  	};
>>  
>>  	chosen {
>> @@ -114,3 +116,47 @@
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&gmac0 {
>> +	status = "okay";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	phy-handle = <&phy0>;
>> +	status = "okay";
>> +	mdio0 {
> 
> A line of whitespace before the child nodes too please :)
> 

Will fix.

>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "snps,dwmac-mdio";
>> +		phy0: ethernet-phy@0 {
>> +			reg = <0>;
>> +			rxc_dly_en = <1>;
>> +			tx_delay_sel_fe = <5>;
>> +			tx_delay_sel = <0xa>;
>> +			tx_inverted_10 = <0x1>;
>> +			tx_inverted_100 = <0x1>;
>> +			tx_inverted_1000 = <0x1>;
>> +		};
>> +	};
>> +};
>> +
>> +&gmac1 {
>> +	status = "okay";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	phy-handle = <&phy1>;
>> +	status = "okay";
>> +	mdio1 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "snps,dwmac-mdio";
>> +		phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +			tx_delay_sel_fe = <5>;
>> +			tx_delay_sel = <0>;
>> +			rxc_dly_en = <0>;
>> +			tx_inverted_10 = <0x1>;
>> +			tx_inverted_100 = <0x1>;
>> +			tx_inverted_1000 = <0x0>;
>> +		};
>> +	};
>> +};
>> -- 
>> 2.17.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

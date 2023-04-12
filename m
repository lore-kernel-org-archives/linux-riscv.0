Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EDBC77B70
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVMpQKxOv4QT20vk2mwXTZMmOG1Yrtwb7ukqQfENhoc=; b=T0fBGefKiEb9Lc
	JQJ+nP8ApL0y4lz2c/Cx5TJhrt9Zo1vWLo/Cv3TvHHef0QNLcUEEoWtqF6kk4nE+78MNlCFghToQo
	bI1GllB1f6x9BZOcrE5i4SnI4TIOq7VPP1DbVwi5MXtnP3pNjN/wQLlzW4XuhXbfinipOjg1VNPc/
	Q/+ubh0asicje3MKNWZxWlzXbTldytLtY5akG6GSc3dMxO/LAIoICjOHTXtrQ403NoYya4RgJBk12
	KIL0a8hvxkeef/T+wrwgIbq+hlSoL2IDJS0Cb8qiNA1ztF8EU2g0ojv4aAYt5A5gaeQzDzmG3pJMR
	4jQtC/huvzrED2Gz6wxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQLi-001dEN-14;
	Wed, 12 Apr 2023 02:36:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQLf-001dAr-28
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:36:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9F69124E1D1;
	Wed, 12 Apr 2023 10:36:16 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:36:16 +0800
Received: from [192.168.125.89] (113.72.145.176) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:36:15 +0800
Message-ID: <3557b890-fa43-f16b-95fd-6fc44204086d@starfivetech.com>
Date: Wed, 12 Apr 2023 10:36:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/3] riscv: dts: starfive: Enable axp15060 pmic for
 cpufreq
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <20230411083257.16155-2-mason.huo@starfivetech.com>
 <20230411-chimp-unvarying-142394732ff5@wendy>
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230411-chimp-unvarying-142394732ff5@wendy>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_193639_853232_2B12B6A7 
X-CRM114-Status: GOOD (  10.57  )
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



On 2023/4/11 17:13, Conor Dooley wrote:
> On Tue, Apr 11, 2023 at 04:32:55PM +0800, Mason Huo wrote:
>> The VisionFive 2 board has an embedded pmic axp15060,
>> which supports the cpu DVFS through the dcdc2 regulator.
>> This patch enables axp15060 pmic and configs the dcdc2.
>> 
>> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
>> ---
>>  .../starfive/jh7110-starfive-visionfive-2.dtsi    | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index 2a6d81609284..df582bddae4b 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -114,6 +114,21 @@ &i2c5 {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&i2c5_pins>;
>>  	status = "okay";
>> +
>> +	pmic: axp15060_reg@36 {
> 
> No underscores in node names please & "pmic" is the generic node name
> for pmics.
> 
> Cheers,
> Conor.
> 
Address it in next version.

Thanks
Mason
>> +		compatible = "x-powers,axp15060";
>> +		reg = <0x36>;
>> +
>> +		regulators {
>> +			reg_dcdc2: dcdc2 {
>> +				regulator-boot-on;
>> +				regulator-always-on;
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <1540000>;
>> +				regulator-name = "vdd-cpu";
>> +			};
>> +		};
>> +	};
>>  };
>>  
>>  &i2c6 {
>> -- 
>> 2.39.2
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

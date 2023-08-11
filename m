Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5455C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgaa3ZqdUT5OOUus7bFkZ4NAEo9VgLoptjeyHG24QKo=; b=jp0t6fRQ3RmZzC
	Xqqy7D5iOIU8upIQ0wXF3L7gQLWxuQQgsY1u/6y+QsbKjqbCHF80joGnVCfIueWxwalgaOPc3QlOn
	hAjeAd+bgV1mX2BqWWcyAb4clZBNkcuOHddThSKsTyMAFR/tsd2EBedw5avWgWQyoXHdw1LTxmLMV
	36KnWN94Sw8Vx3dWnmuXQwV0Xjr64v9QL63eLDo0EWL+B2v+ijxWpr7vCwKLSRk5VKj85bcm7GMzb
	X6qk2EJqwIwI2OUewpNTRXm/7MzYGEALzaLF6XJ1+9hR9CCDspJRTwroE6jLqd25SsJYc79nt+DWE
	MWKnr7cu8ay6GzJQgxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUHlg-0099eD-1a;
	Fri, 11 Aug 2023 02:20:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUHlc-0099cW-0s
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 02:20:46 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DB63C823D;
	Fri, 11 Aug 2023 10:20:10 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 11 Aug
 2023 10:20:11 +0800
Received: from [192.168.120.59] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 11 Aug
 2023 10:20:10 +0800
Message-ID: <a0373acd-a364-3b4e-8e7a-d274d2421c49@starfivetech.com>
Date: Fri, 11 Aug 2023 10:20:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: enable DCDC1&ALDO4 node in
 axp15060
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230809013917.81674-1-william.qiu@starfivetech.com>
 <20230809013917.81674-2-william.qiu@starfivetech.com>
 <CAJM55Z8EtUjfjF04jcNwdyPzx3VmEWZs14Fr-9PDiqXcHDOe9Q@mail.gmail.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAJM55Z8EtUjfjF04jcNwdyPzx3VmEWZs14Fr-9PDiqXcHDOe9Q@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_192044_686924_04E8940B 
X-CRM114-Status: GOOD (  13.78  )
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



On 2023/8/10 19:31, Emil Renner Berthing wrote:
> On Wed, 9 Aug 2023 at 03:41, William Qiu <william.qiu@starfivetech.com> wrote:
>>
>> Enable DCDC1 node for vmmc-supply and enable ALDO4 node for
>> vqmmc-supply.
>>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../starfive/jh7110-starfive-visionfive-2.dtsi   | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index d2f3b9eb859b..d67e26b9c791 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -165,12 +165,28 @@ axp15060: pmic@36 {
>>                 #interrupt-cells = <1>;
>>
>>                 regulators {
>> +                       vcc_3v3: dcdc1 {
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
>> +                               regulator-min-microvolt = <3300000>;
>> +                               regulator-max-microvolt = <3300000>;
>> +                               regulator-name = "vcc_3v3";
>> +                       };
>> +
>>                         vdd_cpu: dcdc2 {
>>                                 regulator-always-on;
>>                                 regulator-min-microvolt = <500000>;
>>                                 regulator-max-microvolt = <1540000>;
>>                                 regulator-name = "vdd-cpu";
>>                         };
>> +
>> +                       emmc_vdd: aldo4 {
>> +                               regulator-boot-on;
>> +                               regulator-always-on;
> 
> Hi William,
> 
> Just a question: You mark these regulators as always-on, so they'll
> never be shut off even if the device is suspended. Is that because the
> mmc driver can't deal with reinitializing the mmc/sd-card if the card
> has been shut off while suspended or is there some other reason to
> mark them always-on?
> 

Hi Emil,

Because now hibernation's storage medium is currently SD/eMMC, so we need
to mark SD/eMMC always-on.

Best Regards,
William
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-name = "emmc_vdd";
>> +                       };
>>                 };
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

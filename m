Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE90C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTc7vGfQ6xOGR6tUPR2ZwHfyrJtMM6y9gQmUWd2GflM=; b=cWgQamAx9uWLHq
	t9qhtXA5Z6fkfuxg1IB3s7RiJbVmAYqbxPpiKlqo2vWZf2AnUVRFLsgaio71Gkvcq8c1PWMFhPUfJ
	pVXVpk3mfEs8uDeZAAVT6G8QrXzqnSQsHEZA7k8EgFFjQDUSuO7GY3AetYXhQUkEk56ztMb35eDXp
	F5oczkgxS3aRs49rRq6liYKDNfiQpYHxnAhzWiKn0ZK3394S4OSZMvuZLCHNxLtGtXpnItdSsRpDH
	CKItaPthcStBRzV9iQHoNXRqjauGuJMkXvcEOdz0eNwkTFC812OeIPohIeCPy51fd+IrSDOZB/600
	KmREbCvG3fE8AYcMjayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWozI-00BkuH-Vk; Tue, 28 Feb 2023 01:41:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWozF-00BksI-C8
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 01:41:03 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 169A824E392;
	Tue, 28 Feb 2023 09:40:34 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 09:40:33 +0800
Received: from [192.168.125.128] (113.72.145.171) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 09:40:32 +0800
Message-ID: <f943857c-f3ee-c521-ca84-51942e463d05@starfivetech.com>
Date: Tue, 28 Feb 2023 09:40:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 10/11] riscv: dts: starfive: jh7110: Add DVP and HDMI
 TX pixel external clocks
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-11-xingyu.wu@starfivetech.com> <Y/0KyeK3DU8xtL2V@spud>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <Y/0KyeK3DU8xtL2V@spud>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_174101_587386_14D087D2 
X-CRM114-Status: GOOD (  12.18  )
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

On 2023/2/28 3:55, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 04:33:22PM +0800, Xingyu Wu wrote:
>> Add DVP and HDMI TX pixel external fixed clocks and the rates are
>> 74.25MHz and 297MHz.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  .../dts/starfive/jh7110-starfive-visionfive-2.dtsi   |  8 ++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi             | 12 ++++++++++++
>>  2 files changed, 20 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index c2aa8946a0f1..27af817a55aa 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -86,6 +86,14 @@ &mclk_ext {
>>  	clock-frequency = <12288000>;
>>  };
>>  
>> +&dvp_clk {
>> +	clock-frequency = <74250000>;
>> +};
>> +
>> +&hdmitx0_pixelclk {
>> +	clock-frequency = <297000000>;
>> +};
>> +
>>  &uart0 {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&uart0_pins>;
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 005ead2624d4..a5e6fb3ad188 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -245,6 +245,18 @@ mclk_ext: mclk-ext-clock {
>>  		#clock-cells = <0>;
>>  	};
>>  
>> +	dvp_clk: dvp-clk-clock {
>> +		compatible = "fixed-clock";
>> +		clock-output-names = "dvp_clk";
>> +		#clock-cells = <0>;
>> +	};
>> +
>> +	hdmitx0_pixelclk: hdmitx0-pixelclk-clock {
>> +		compatible = "fixed-clock";
>> +		clock-output-names = "hdmitx0_pixelclk";
>> +		#clock-cells = <0>;
>> +	};
>> +
> 
> Hmm, would you mind adding these entries with no unit addresses in
> alphanumerical order? Both in the soc & board dtsi files.
> 

Oh, It was my negligence. I will adjust it. Thanks.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

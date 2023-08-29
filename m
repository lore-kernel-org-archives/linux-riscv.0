Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C57C71153
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 01:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9QanBd2ZTXEid95KH3u/v0J/XHVaZ7wQJ+g9wCJjds=; b=1aWyweRhHxbWd+
	Grl3s3LZgiHGSx8fAl5G8w121TykPaM+U+cGsQin1I0vwPV50DvA27mRdkCCQKTOVc0y2nlbML8bP
	M5OgJloPnsLFO+MVnsSCxpa4TWWLmmAMfXPsSRfUG2NNfv9euBKmSskxHBeSE14/3l3yUmFaKHjEk
	PLb02korJzek3+CIXPPDDDMZX5SmS6AUBCxBYuNAVMlv9OXBqESdO7gakodOnrNn0JNgnU/BTzgEi
	Bz9WwGD5LWpp5yMgQYJLiZKIynCMQQ4h/MbCAoWLVMB4tDVxC8YARwJXLLDB3+JcvjLv4NPgr2Svo
	K/ro4ykcRwDMdsVfZm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao0R-00AaAW-1Z;
	Tue, 29 Aug 2023 01:58:59 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao0N-00Aa9E-1D
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 01:58:58 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8D3F47FFE;
	Tue, 29 Aug 2023 09:58:22 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 09:58:22 +0800
Received: from [192.168.125.72] (113.72.145.245) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 09:58:21 +0800
Message-ID: <afac7b40-1bdc-c546-1ba1-2cfba74e6adc@starfivetech.com>
Date: Tue, 29 Aug 2023 09:58:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [-next v1] riscv: dts: starfive: visionfive 2: Enable usb0 and
 fix tdm pins sort order
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230828115239.16012-1-hal.feng@starfivetech.com>
 <3a5e343c-a0cc-8d1b-eadc-82c3d038aaa1@linaro.org>
 <20230828-hence-unguarded-2020c68246e8@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230828-hence-unguarded-2020c68246e8@wendy>
X-Originating-IP: [113.72.145.245]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_185855_717093_75DE194C 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, 28 Aug 2023 13:05:06 +0100, Conor Dooley wrote:
> On Mon, Aug 28, 2023 at 01:54:53PM +0200, Krzysztof Kozlowski wrote:
>> On 28/08/2023 13:52, Hal Feng wrote:
>> > usb0 was disabled by mistake when merging, so enable it.
>> > tdm_pins node should be sorted alphabetically.
>> > 
>> > Fixes: e7c304c0346d ("riscv: dts: starfive: jh7110: add the node and pins configuration for tdm")
>> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> > ---
>> >  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++---------
>> >  1 file changed, 25 insertions(+), 24 deletions(-)
>> > 
>> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> > index d79f94432b27..382dfb5e64e4 100644
>> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> > @@ -440,30 +440,6 @@ GPOEN_ENABLE,
>> >  		};
>> >  	};
>> >  
>> > -	uart0_pins: uart0-0 {
>> > -		tx-pins {
>> > -			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
>> > -					     GPOEN_ENABLE,
>> > -					     GPI_NONE)>;
>> > -			bias-disable;
>> > -			drive-strength = <12>;
>> > -			input-disable;
>> > -			input-schmitt-disable;
>> > -			slew-rate = <0>;
>> > -		};
>> > -
>> > -		rx-pins {
>> > -			pinmux = <GPIOMUX(6, GPOUT_LOW,
>> > -					     GPOEN_DISABLE,
>> > -					     GPI_SYS_UART0_RX)>;
>> > -			bias-disable; /* external pull-up */
>> > -			drive-strength = <2>;
>> > -			input-enable;
>> > -			input-schmitt-enable;
>> > -			slew-rate = <0>;
>> > -		};
>> > -	};
>> > -
>> >  	tdm_pins: tdm-0 {
>> >  		tx-pins {
>> >  			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
>> > @@ -497,6 +473,30 @@ GPOEN_DISABLE,
>> >  			input-enable;
>> >  		};
>> >  	};
>> > +
>> > +	uart0_pins: uart0-0 {
>> > +		tx-pins {
>> > +			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
>> > +					     GPOEN_ENABLE,
>> > +					     GPI_NONE)>;
>> > +			bias-disable;
>> > +			drive-strength = <12>;
>> > +			input-disable;
>> > +			input-schmitt-disable;
>> > +			slew-rate = <0>;
>> > +		};
>> > +
>> > +		rx-pins {
>> > +			pinmux = <GPIOMUX(6, GPOUT_LOW,
>> > +					     GPOEN_DISABLE,
>> > +					     GPI_SYS_UART0_RX)>;
>> > +			bias-disable; /* external pull-up */
>> > +			drive-strength = <2>;
>> > +			input-enable;
>> > +			input-schmitt-enable;
>> > +			slew-rate = <0>;
>> > +		};
>> 
>> 
>> What is fixed in this hunk? Order of nodes is just a style, not a bug
>> needing backports.
> 
> Please split this in two parts, with one for my screwed up conflict
> resolution & one for the node ordering.

OK, I will split this into two patches. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

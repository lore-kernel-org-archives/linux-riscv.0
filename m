Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B841C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 01:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRTwN+0TK4eXcTP7c+m8FsMyKN6J4U1ocfNxu9AiJik=; b=wfplhhkeqNsG4h
	9fMVnErVDT/K6VGx7ROHW43TY0VnltpOuYDQgSjE6VwbkSKm0RTPOkrvx/HtI/bJ9iaPAR9P48/BI
	64HTOMeOZ1qn7ErWNh0sL4hK5ftqNU3yl2FUf4pXq2gEdZUPjd5H7fladT9uEXzmFyl0vK4zlWnDD
	7uu14HwaZme18m2GqQKen2NvDpNlgC6yMc2D8jrYAqx3vkc04rwdsCVnlpgdgQWyEagrMX1l52CmJ
	SvyYNvb9puy8XCRytQ9QKmQgrDnG1RtW7CW1OQC/0qkWpiX+P1CVR9w/s7L5L7buLCjtF6mNrq5OH
	bX1tkDeVr7Wipybpylvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozpjK-0051sd-Vm; Tue, 29 Nov 2022 01:48:15 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozpjH-0051kT-AT
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 01:48:13 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5E74624DE6E;
	Tue, 29 Nov 2022 09:47:20 +0800 (CST)
Received: from EXMBX065.cuchost.com (172.16.6.65) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Nov
 2022 09:47:20 +0800
Received: from [192.168.125.66] (113.72.147.18) by EXMBX065.cuchost.com
 (172.16.6.65) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Nov
 2022 09:47:19 +0800
Message-ID: <30c21787-0c48-ff50-1d63-8e69bdcdbe30@starfivetech.com>
Date: Tue, 29 Nov 2022 09:47:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl
 definitions
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hal Feng
	<hal.feng@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-2-hal.feng@starfivetech.com>
 <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
 <08db0f3b-5222-9460-26ba-0e6380d16583@linaro.org>
 <0ceba170-f844-e733-a49e-e67746f9f836@starfivetech.com>
 <093ea507-4c42-1af9-4896-64c1a918432e@linaro.org>
From: Jianlong Huang <jianlong.huang@starfivetech.com>
In-Reply-To: <093ea507-4c42-1af9-4896-64c1a918432e@linaro.org>
X-Originating-IP: [113.72.147.18]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX065.cuchost.com
 (172.16.6.65)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_174811_543113_F5FF4481 
X-CRM114-Status: GOOD (  10.84  )
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

On Mon, 28 Nov 2022 09:32:45 +0100, Krzysztof Kozlowski wrote:
> On 28/11/2022 01:48, Jianlong Huang wrote:
> 
>>>>> +/* aon_iomux doen */
>>>>> +#define GPOEN_AON_PTC0_OE_N_4			2
>>>>> +#define GPOEN_AON_PTC0_OE_N_5			3
>>>>> +#define GPOEN_AON_PTC0_OE_N_6			4
>>>>> +#define GPOEN_AON_PTC0_OE_N_7			5
>>>>> +
>>>>
>>>> It looks like you add register constants to the bindings. Why? The
>>>> bindings are not the place to represent hardware programming model. Not
>>>> mentioning that there is no benefit in this.
>>>
>>> Also: this entire file should be dropped, but if it stays, you have to
>>> name it matching bindings or compatible (vendor,device.h).
>> 
>> Thanks your comments.
>> These macros are used to configure pinctrl in dts, so the file should stay,
> 
> Why they should stay? What's the reason? If it is not a constant used by
> driver, then register values should not be placed in the bindings, so
> drop it.
> 

Thanks.

These macros in binding header(example, DOUT, DOEN etc) will be used in DTS,
and driver will parse the DT for pinctrl configuration.

Example in dts:
uart0_pins: uart0-0 {
	tx-pins {
		pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX, GPOEN_ENABLE, GPI_NONE)>;
		bias-disable;
		drive-strength = <12>;
		input-disable;
		input-schmitt-disable;
		slew-rate = <0>;
	};

	rx-pins {
		pinmux = <GPIOMUX(6, GPOUT_LOW, GPOEN_DISABLE, GPI_SYS_UART0_RX)>;
		bias-pull-up;
		drive-strength = <2>;
		input-enable;
		input-schmitt-enable;
		slew-rate = <0>;
	};
};


Best regards,
Jianlong Huang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

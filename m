Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4607CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3jbUNCs5G7H9ApXs/SlT0zmZKjiytoRFBtgkUYiPBc=; b=EEcCB0CiWcU1ar
	Z2+YCSa293pVBSPweDdXUX4MP2w/ZHfuh4vM3Z9OZwHlNicprBXZ7O1nC99AV8lLKJXSO1jciJKUs
	yaVW9+4kojOGTslfvbUll65QkpIuqieG0dAAWWH9R5Hajcotkj43cf8nLZoh3AXrJTZPmm6D9Rbey
	BxBeA4r0W3dNEE38lePmib5IgmTaR5GTD0471NsprLikrCay9G6nRf03D+LbYjY+/wHdbNybnzTa8
	03f4At+AsShPb5ZUJgQDOQkUk/zxiS87JJwJaoTPwVp4N4IERVoQjHlzW0PomHr/qC9Q/rWmeHCx+
	GZMSk9kqkamvkC8GOL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oid7J-008SCa-LD; Wed, 12 Oct 2022 14:53:53 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oid7E-008SBw-F7
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 14:53:51 +0000
X-QQ-mid: bizesmtp71t1665586398tra1mkxv
Received: from [192.168.1.231] ( [113.72.146.141])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Oct 2022 22:53:16 +0800 (CST)
X-QQ-SSF: 01000000002000B09000B00A0000000
X-QQ-FEAT: Q5/H4pNog203Q26Mis4ciWl055ow0ajIHrfB0/XOCwC8VcIHMdhaaI4V2fyX5
	38PXgbepu+GYSoJRIEnLYHasPwO576mbxLyyxYxDkIO3Qw9oRGRQdZuJ2loRlBNAlLYa4GC
	Fe+8gZoqavoauj1vW0xHE78oo2iqq2+cw8NXHLUdXPwnZJHwjI3NCU9uTyyd9q8Syv/it57
	YDbbiYP6xv4roDawpnlNaUae9FRYYd5YYPOVF0DdNLTzxh1E1Xu5Pe4Xc86a0ZsqFHpzRFq
	zm5FoEZ/4ykbN4upH9ePaGwcaLB7QSWpTvLuzL7jdF4iI6D4JyI+hX7L+LsV15tDF8xW20K
	JP4yr4EUXaQ0kGaX7P3G/xDArMOjMLvRBV0UxClxJyD8bd/Gx17YK1V0B2ZeWUXM8fTgJcS
	9yyANqHDAGk=
X-QQ-GoodBg: 0
Message-ID: <14D22B831DDCFAED+14879d26-5d3a-3487-07ef-3b64e775e43f@linux.starfivetech.com>
Date: Wed, 12 Oct 2022 22:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset
 bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
 <20220929184349.GA2551443-robh@kernel.org>
 <8BEAFAD2C4CE6E4A+0a00376c-1e3e-f597-bcf6-106ff294859a@linux.starfivetech.com>
 <2f1d1afd-3c97-6ce0-8247-6e1c4a24e548@linaro.org>
 <4769BE3503398017+b1699221-ccc9-a0c1-0b11-141ce9644d74@linux.starfivetech.com>
 <9f04267d-2592-b303-9b79-9cef672c970a@linaro.org>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <9f04267d-2592-b303-9b79-9cef672c970a@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_075348_860124_501030EE 
X-CRM114-Status: GOOD (  18.46  )
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

On Wed, 12 Oct 2022 09:33:42 -0400, Krzysztof Kozlowski wrote:
> On 12/10/2022 09:16, Hal Feng wrote:
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    enum:
>>>>>> +      - starfive,jh7110-reset
>>>>>
>>>>> 'reg' needed? Is this a sub-block of something else?
>>>>
>>>> Yes, the reset node is a child node of the syscon node, see patch 27 for detail.
>>>> You might not see the complete patches at that time due to technical issue of
>>>> our smtp email server. Again, I feel so sorry about that.
>>>>
>>>> 	syscrg: syscrg@13020000 {
>>>> 		compatible = "syscon", "simple-mfd";
>>>> 		reg = <0x0 0x13020000 0x0 0x10000>;
>>>>
>>>> 		syscrg_clk: clock-controller@13020000 {
>>>> 			compatible = "starfive,jh7110-clkgen-sys";
>>>> 			clocks = <&osc>, <&gmac1_rmii_refin>,
>>>> 				 <&gmac1_rgmii_rxin>,
>>>> 				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>>>> 				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
>>>> 				 <&tdm_ext>, <&mclk_ext>;
>>>> 			clock-names = "osc", "gmac1_rmii_refin",
>>>> 				"gmac1_rgmii_rxin",
>>>> 				"i2stx_bclk_ext", "i2stx_lrck_ext",
>>>> 				"i2srx_bclk_ext", "i2srx_lrck_ext",
>>>> 				"tdm_ext", "mclk_ext";
>>>> 			#clock-cells = <1>;
>>>> 		};
>>>>
>>>> 		syscrg_rst: reset-controller@13020000 {
>>>> 			compatible = "starfive,jh7110-reset";
>>>> 			#reset-cells = <1>;
>>>
>>> So the answer to the "reg needed?" is what? You have unit address but no
>>> reg, so this is not correct.
>> 
>> Not needed in the reset-controller node, but needed in its parent node. 
> 
> We do not talk about parent node. Rob's question was in this bindings.
> Is this document a binding for the parent node or for this node?

This node. So not needed.

> 
>> I am sorry
>> for missing description to point it out in the bindings. I will rewrite all bindings
>> for the next version. Unit address here should be deleted.
>> 
>>>
>>>> 			starfive,assert-offset = <0x2F8>;
>>>> 			starfive,status-offset= <0x308>;
>>>> 			starfive,nr-resets = <JH7110_SYSRST_END>;
>>>> 		};
>>>> 	};
>>>>
>>>> In this case, we get the memory mapped space through the parent node with syscon
>>>> APIs. You can see patch 13 for detail.
>>>>
>>>> static int reset_starfive_register(struct platform_device *pdev, const u32 *asserted)
>>>> {
>>>
>>>
>>> (...)
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +  "#reset-cells":
>>>>>> +    const: 1
>>>>>> +
>>>>>> +  starfive,assert-offset:
>>>>>> +    description: Offset of the first ASSERT register
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +
>>>>>> +  starfive,status-offset:
>>>>>> +    description: Offset of the first STATUS register
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>
>>>>> These can't be implied from the compatible string?
>> 
>> Definitely can. We do this is for simplifying the reset driver.
> 
> The role of the bindings is not to simplify some specific driver in some
> specific OS...
> 
>> Otherwise, we may need to define more compatibles because there
>> are multiple reset blocks in JH7110. Another case can be found at
>> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reset/altr,rst-mgr.yaml
> 
> And why is this a problem? You have different hardware, so should have
> different compatibles. Otherwise we would have a compatible
> "all,everything" and use it in all possible devices.

Okay, I get it. Thanks a lot.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

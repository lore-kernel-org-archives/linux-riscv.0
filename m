Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CEAC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk3Rcw9MiUJrnCbEntaxJmjlKtB2n8ZXa76TEusoNrU=; b=DgwFr638PQtVDY
	HUAPG9gOT1takuMv/oaz7wuj62sn5DzuS3Iz10vH7jD+4r+jAC7568oM5tjeW7+OigesDgXPT4O4r
	ZR9B0PilCINiMRKejR4R12yfx+CI+HaK9ejo84SnGMOwBuYae4J5nHAQvu2CbIQwAI00naBmXNLye
	lu9aG64JR9K81qFArUKPvGkxjlpfdWzSwrWxY17+08vVFLvsAkE2IExHOrZQQJZj30qsSNkUUYkWH
	tpGGo/19NP6F8RsG67DV0/POl7gd4Acn4Ccv6h1aYnP9pYDOAW75bk1dhvcnKUdSBiId3N4izWKtw
	1T5PXmrU3ir+ycAJDV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibbw-0087to-RK; Wed, 12 Oct 2022 13:17:24 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibbr-0087q2-NH
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 13:17:22 +0000
X-QQ-mid: bizesmtp68t1665580609te3ildxc
Received: from [192.168.50.235] ( [113.72.147.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Oct 2022 21:16:48 +0800 (CST)
X-QQ-SSF: 01000000002000B09000B00A0000000
X-QQ-FEAT: DQ0OCu3gog3rE8xw6j7Rk2p48ngJp/0LijQoGV4LH0QojjfF4o4ZASfem9Y0t
	97G5CD3OTqWO+XOLkxERsTJV8d2IdYsp2kM9pX5fmgZXlBZSzR+0jdM0VofduY8zFBdacI8
	mey1YLnP7aJJdNgRqLZzbuYjhg3o8+aIBdO6iK22IMlAl0SimfzjNa+U7HTGBIblW8C+nVD
	4NHP4RI0e9I2r2Wv5goooGgBeOyaTZWY7BHnYQCiVJ7JMk50j8JRvD2bYxmGLut+rhGiUC6
	0y9KUvA5jiRW60GEBEHKvamQ/8Ls174w97JS7i0ZmFOiKkY7qY2VGmuLZWH5bq8VJVgsB8h
	ENgdEWeBCZSO7SAENWnnPhCrU2l/S2TD6W6BGHfGpfI104nuctgszgCTYj1/03uqlTVuAiQ
X-QQ-GoodBg: 0
Message-ID: <4769BE3503398017+b1699221-ccc9-a0c1-0b11-141ce9644d74@linux.starfivetech.com>
Date: Wed, 12 Oct 2022 21:16:37 +0800
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
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <2f1d1afd-3c97-6ce0-8247-6e1c4a24e548@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_061720_285248_E78A5428 
X-CRM114-Status: GOOD (  28.97  )
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

On Tue, 11 Oct 2022 12:36:08 -0400, Krzysztof Kozlowski wrote:
> On 11/10/2022 11:30, Hal Feng wrote:
>> On Thu, 29 Sep 2022 13:43:49 -0500, Rob Herring wrote:
>>> On Fri, Sep 30, 2022 at 01:51:47AM +0800, Hal Feng wrote:
>>>> Add bindings for the reset controller on the JH7110 RISC-V
>>>> SoC by StarFive Technology Ltd.
>>>>
>>>> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
>>>> ---
>>>>  .../bindings/reset/starfive,jh7110-reset.yaml | 54 +++++++++++++++++++
>>>>  1 file changed, 54 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
>>>> new file mode 100644
>>>> index 000000000000..bb0010c200f9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
>>>> @@ -0,0 +1,54 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/reset/starfive,jh7110-reset.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: StarFive JH7110 SoC Reset Controller Device Tree Bindings
>>>> +
>>>> +maintainers:
>>>> +  - Emil Renner Berthing <kernel@esmil.dk>
>>>> +  - Hal Feng <hal.feng@linux.starfivetech.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - starfive,jh7110-reset
>>>
>>> 'reg' needed? Is this a sub-block of something else?
>> 
>> Yes, the reset node is a child node of the syscon node, see patch 27 for detail.
>> You might not see the complete patches at that time due to technical issue of
>> our smtp email server. Again, I feel so sorry about that.
>> 
>> 	syscrg: syscrg@13020000 {
>> 		compatible = "syscon", "simple-mfd";
>> 		reg = <0x0 0x13020000 0x0 0x10000>;
>> 
>> 		syscrg_clk: clock-controller@13020000 {
>> 			compatible = "starfive,jh7110-clkgen-sys";
>> 			clocks = <&osc>, <&gmac1_rmii_refin>,
>> 				 <&gmac1_rgmii_rxin>,
>> 				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>> 				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
>> 				 <&tdm_ext>, <&mclk_ext>;
>> 			clock-names = "osc", "gmac1_rmii_refin",
>> 				"gmac1_rgmii_rxin",
>> 				"i2stx_bclk_ext", "i2stx_lrck_ext",
>> 				"i2srx_bclk_ext", "i2srx_lrck_ext",
>> 				"tdm_ext", "mclk_ext";
>> 			#clock-cells = <1>;
>> 		};
>> 
>> 		syscrg_rst: reset-controller@13020000 {
>> 			compatible = "starfive,jh7110-reset";
>> 			#reset-cells = <1>;
> 
> So the answer to the "reg needed?" is what? You have unit address but no
> reg, so this is not correct.

Not needed in the reset-controller node, but needed in its parent node. I am sorry
for missing description to point it out in the bindings. I will rewrite all bindings
for the next version. Unit address here should be deleted.

> 
>> 			starfive,assert-offset = <0x2F8>;
>> 			starfive,status-offset= <0x308>;
>> 			starfive,nr-resets = <JH7110_SYSRST_END>;
>> 		};
>> 	};
>> 
>> In this case, we get the memory mapped space through the parent node with syscon
>> APIs. You can see patch 13 for detail.
>> 
>> static int reset_starfive_register(struct platform_device *pdev, const u32 *asserted)
>> {
> 
> 
> (...)
> 
>> 
>>>
>>>> +
>>>> +  "#reset-cells":
>>>> +    const: 1
>>>> +
>>>> +  starfive,assert-offset:
>>>> +    description: Offset of the first ASSERT register
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +
>>>> +  starfive,status-offset:
>>>> +    description: Offset of the first STATUS register
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>
>>> These can't be implied from the compatible string?

Definitely can. We do this is for simplifying the reset driver.
Otherwise, we may need to define more compatibles because there
are multiple reset blocks in JH7110. Another case can be found at
https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/reset/altr,rst-mgr.yaml

>> 
>> These two properties are the key differences among different reset controllers.
> 
> Different as in different compatibles? Please answer the questions..> 
>> There are five memory regions for clock and reset in StarFive JH7110 SoC. They
>> are "syscrg", "aoncrg", "stgcrg", "ispcrg" and "voutcrg". Each memory region
>> has different reset ASSERT/STATUS register offset and different number of reset
>> signals. 
> 
> Then these are not exactly the same devices, so using one compatible for
> them does not look correct.

One compatible can just be matched by one device? I think this is what
confuses me.

Best regards,
Hal

> 
>> After storing them in dt, the reset driver can register all reset
>> controllers with the same compatible string. 
> 
> Which is not how the compatible should be used...
> 
>> All we expect is that all reset
>> controllers in a single SoC use the same compatible string for matching and the
>> reset driver can be applied to all StarFive SoCs using different compatible strings.
> 
> Keep driver out of the talks.
> 
>> Just like
> 
> Existing bad pattern is not an argument to keep it going. Fix bad
> patterns instead.
> 
>> 
>> arch/riscv/boot/dts/starfive/jh7100.dtsi:
>> 
>> 	rstgen: reset-controller@11840000 {
>> 		compatible = "starfive,jh7100-reset";
>> 		reg = <0x0 0x11840000 0x0 0x10000>;
>> 		#reset-cells = <1>;
>> 		starfive,assert-offset = <0x0>;
>> 		starfive,status-offset= <0x10>;
>> 		starfive,nr-resets = <JH7100_RSTN_END>;
>> 	};
>> 
>> arch/riscv/boot/dts/starfive/jh7110.dtsi:
>> 
>> 	syscrg: syscrg@13020000 {
>> 		compatible = "syscon", "simple-mfd";
>> 		reg = <0x0 0x13020000 0x0 0x10000>;
>> 
>> 		syscrg_clk: clock-controller@13020000 {
>> 			compatible = "starfive,jh7110-clkgen-sys";
>> 			...
>> 		};
>> 
>> 		syscrg_rst: reset-controller@13020000 {
>> 			compatible = "starfive,jh7110-reset";
>> 			#reset-cells = <1>;
>> 			starfive,assert-offset = <0x2F8>;
>> 			starfive,status-offset= <0x308>;
>> 			starfive,nr-resets = <JH7110_SYSRST_END>;
>> 		};
>> 	};
>> 
>> 	aoncrg: aoncrg@17000000 {
>> 		compatible = "syscon", "simple-mfd";
>> 		reg = <0x0 0x17000000 0x0 0x10000>;
>> 
>> 		aoncrg_clk: clock-controller@17000000 {
>> 			compatible = "starfive,jh7110-clkgen-aon";
>> 			...
>> 		};
>> 
>> 		aoncrg_rst: reset-controller@17000000 {
>> 			compatible = "starfive,jh7110-reset";
>> 			#reset-cells = <1>;
>> 			starfive,assert-offset = <0x38>;
>> 			starfive,status-offset= <0x3C>;
>> 			starfive,nr-resets = <JH7110_AONRST_END>;
>> 		};
>> 	};
>> 
>> 	stgcrg: stgcrg@10230000 {	//Not submmited yet
>> 		compatible = "syscon", "simple-mfd";
>> 		reg = <0x0 0x10230000 0x0 0x10000>;
>> 
>> 		stgcrg_clk: clock-controller@10230000 {
>> 			compatible = "starfive,jh7110-clkgen-stg";
>> 			...
>> 		};
>> 
>> 		stgcrg_rst: reset-controller@10230000 {
>> 			compatible = "starfive,jh7110-reset";
>> 			#reset-cells = <1>;
>> 			starfive,assert-offset = <0x74>;
>> 			starfive,status-offset= <0x78>;
>> 			starfive,nr-resets = <JH7110_STGRST_END>;
>> 		};
>> 	};
>> 	...
>> 
>>>
>>>> +
>>>> +  starfive,nr-resets:
>>>> +    description: Number of reset signals
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>
>>> Why do you need this? Most bindings don't. If just to validate 'resets' 
>>> args, then don't.
>> 
>> Can be removed. Instead, the reset driver should includes some related
>> binding headers or defines some macros for pointing out the number of
>> reset signals of each reset controller.
>> 
>> Best regards,
>> Hal
>> 
>>>
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - "#reset-cells"
>>>> +  - starfive,assert-offset
>>>> +  - starfive,status-offset
>>>> +  - starfive,nr-resets
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/reset/starfive-jh7110.h>
>>>> +
>>>> +    syscrg_rst: reset-controller@13020000 {
> 
> Please test your patches.
> 
> 
> Best regards,
> Krzysztof
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

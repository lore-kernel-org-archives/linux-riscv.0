Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1F3C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdtH22SrNH2KsghhPMg3qI2+aqnE98JooQFykLO/MsU=; b=M6W8finfsmpchV
	m3PNY+7YHBPifI4nMRTPhh96OHbD6rgdA9wICjiLZJ3ZWiERhxjiWWsyBaDESyup631VR/9zKt+Xs
	WT7q+QgwgCALd44fOSsIZUC1QxUiK6ATx9pcBLGxWiDMdat/4G55q8dTW5gEz42QF6bY2/PI2fxDc
	eoIdNg5LnhBsUwAKXzKh26tMRjVpi0ZshCc6WGI73sizSklGNi+XkQb4H7Ag3lS6sYhCn4N/1dw9+
	7H210twg1z7eSo9LyiXbURFjLUtTAaiXjqbIUmTbPer6bOecN1lNjnJ4ky2Vk03Pcf5vTr27+8gVL
	b0YNA3GGC/XbFL/+rIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQq0t-00000004Aep-1QTn;
	Mon, 08 Jul 2024 15:10:47 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQq0q-00000004AeK-0Hgk
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 15:10:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10B8660002;
	Mon,  8 Jul 2024 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720451437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOZqQN/Nnha6t0DDSE4qaJBTCsvAvOYX1HhTukGXw48=;
	b=npeeBsznrrp7xGGJL236f8vBtetBSs+MHA67lR06ypSpJWUIBMAHxpA/hOjBM36PsrisV9
	2S/b8i0wpkPmraw8WY3YxG96DQPCOU5bll31FA1XQD90gJY9hftdOzZHX6agN7gL80iQQ/
	BIRSgNQe489XeE2zsZ+p745t1JBCBJFvN5CcBtqG6P+VlEhYFFRj7VChfOVjmpk1fDcNKE
	d0mn8jYUNY1GKusVafscSYifocrYwNqDIlYgMjQsVZE7jwm49gFgI6oJ/MaLg0W+AI/B31
	zFvIWEQhErCif5ozEfuMt/uRcC3Caj/SXiISut3cFhf00XAXJbBkbx5NL8qzTg==
Message-ID: <3df11ce2-6b84-4f80-a24c-20c8d4019e7c@bootlin.com>
Date: Mon, 8 Jul 2024 17:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml:
 Add Sophgo SARADC binding documentation
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240705-sg2002-adc-v2-0-83428c20a9b2@bootlin.com>
 <20240705-sg2002-adc-v2-1-83428c20a9b2@bootlin.com>
 <20240705-unaired-pesticide-4135eaa04212@spud>
 <6b5459fd-2873-4c26-b986-882413b8d95b@bootlin.com>
 <20240706-remote-undergo-3b9dfe44d16f@spud>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240706-remote-undergo-3b9dfe44d16f@spud>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_081044_414418_5F2649A6 
X-CRM114-Status: GOOD (  21.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 7/6/24 2:42 PM, Conor Dooley wrote:
> On Fri, Jul 05, 2024 at 05:24:19PM +0200, Thomas Bonnefille wrote:
>>
>>
>> On 7/5/24 5:01 PM, Conor Dooley wrote:
>>> On Fri, Jul 05, 2024 at 03:42:23PM +0200, Thomas Bonnefille wrote:
>>>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>>>> the Sophgo SoC.
>>>>
>>>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>>> ---
>>>>    .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 63 ++++++++++++++++++++++
>>>>    1 file changed, 63 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>>>> new file mode 100644
>>>> index 000000000000..31bd8ac6dfa5
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>>>> @@ -0,0 +1,63 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-saradc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title:
>>>> +  Sophgo CV18XX SoC series 3 channels Successive Approximation Analog to
>>>> +  Digital Converters
>>>> +
>>>> +maintainers:
>>>> +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>>> +
>>>> +description:
>>>> +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - sophgo,cv1800b-saradc
>>>> +          - const: sophgo,cv18xx-saradc
>>>
>>> I don't think the fallback here makes sense. If there's other devices
>>> with a compatible programming model added later, we can fall back to the
>>> cv1800b.
>>>
>>
>> Ok I'll do that, I wasn't sure if it was a good practice to fallback on
>> another SoC specific compatible.
>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    description:
>>>> +      SARADC will use the presence of this clock to determine if the controller
>>>> +      needs to be explicitly clocked by it (Active domain) or if it is part of
>>>> +      the No-Die Domain, along with the RTC, which does not require explicit
>>>> +      clocking.
>>>
>>> What does "explicit clocking" mean? Is it clocked directly (or via
>>> dividers) by a clock on the board or another source?
>>>
>>
>> It means that, if a clock is provided, the driver will work in "Active
>> Domain" and will use the clock generator of the SoC to get the right clock
>> signal.
>>
>> However if no clock is provided, the controller will work in "No-Die" domain
>> (Always On) and use the RTCSYS subsystem to get its clock signal.
> 
> So it does have a clock, but provided by a different provider. I don't
> really understand why that would "excuse" it from having a clocks
> property, with the RTCSYS as the provider.

By digging into the datasheet, I discovered that there might be a way to 
use a valid clock as the input of the No-Die domain ADC. I would like to 
ask Inochi about this, as he wrote the clock driver for this SoC.

As I understand it, the SARADC working in the No-Die domain is fed, like 
every other IP in the No-Die domain, by the CLK_SRC_RTC_SYS_0. This 
clock source is either a division of the main oscillator (referred to as 
osc_parents in the clock driver) or "xtal," which is an external 
oscillator. Am I right? What is the role of CLK_RTC_24M?

If I'm correct, this description isn't needed anymore in the bindings, 
and the device tree node for the SARADC in the No-Die domain will need 
this line:

+                       clocks = <&clk CLK_SRC_RTC_SYS_0>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

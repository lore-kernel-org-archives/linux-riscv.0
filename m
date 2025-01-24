Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9CAC0218C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUsx1+WD+PBU6UsRSLXcP22O+mS499eszKHRdXChFko=; b=DNEg3Ly5xA9RWm
	NazzoWGO/Xn8MpRwcf7gX87MDq5XOdSmzIxHV/hTYcAz/BnFr6Dp56uuzylN9pTSoc8EDgGafW3q+
	aHmngLC3IvZcP471Z1OlESy3bcVsQ/+/sIO7WHidEnpJFYN+G6Q0DOEJef+lZr+Gyd9U//bzSjz0A
	K73m9on4VA7oCK+xcGnjnDwWPYYk7yO+OEpIsItu/jYCGC/GMmU4PkHhrgni3kb60tQR+L7OlpYVq
	eqoaj8xEy7cWMX3i25TDXY5aAaM3Npkzq8m0EPIP4E9lrPG0hJuJM8WXfCq/HdlavDRll9TVc+mV/
	DG5tTxInYKV5Qsa1qvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHD4-0000000EUKw-1h27;
	Fri, 24 Jan 2025 10:46:46 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHCn-0000000EUGq-1XJY
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 10:46:31 +0000
Received: from [IPV6:2605:59c0:20f3:a400:5304:e921:4d34:736a] (unknown [IPv6:2605:59c0:20f3:a400:5304:e921:4d34:736a])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E8C17B4B325B;
	Fri, 24 Jan 2025 11:46:23 +0100 (CET)
Message-ID: <9d4783b1-3dfe-482c-a963-ccc66c9b0f1a@freeshell.de>
Date: Fri, 24 Jan 2025 02:46:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Minda Chen <minda.chen@starfivetech.com>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
 <20250104-mutilated-unpaved-008eebdb200a@spud>
 <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
 <20250106-suggest-waltz-47d7f7760069@spud>
 <ZQ2PR01MB1307A9E106AE06E144875D6EE619A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20250115-bunkmate-reluctant-a9bad52d8a04@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250115-bunkmate-reluctant-a9bad52d8a04@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_024629_584505_9B25ED80 
X-CRM114-Status: GOOD (  30.44  )
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


On 1/15/25 01:35, Conor Dooley wrote:
> On Wed, Jan 15, 2025 at 06:33:08AM +0000, Hal Feng wrote:
>>> On 07.01.25 04:08, Conor Dooley wrote:
>>> On Sat, Jan 04, 2025 at 01:04:30PM -0800, E Shattow wrote:
>>>> Hi, Conor  (added CC: Minda Chen, Hal Feng)
>>>>
>>>> On 1/4/25 10:33, Conor Dooley wrote:
>>>>> On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
>>>>>> Replace syscrg assignments of clocks, clock parents, and rates,
>>>>>> for compatibility with downstream boot loader SPL secondary
>>>>>> program loader.
>>>>>>
>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>>>> ---
>>>>>>    arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++---
>>>>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>> index 48fb5091b817..55c6743100a7 100644
>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>>>> @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
>>>>>>    };
>>>>>>    &syscrg {
>>>>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>>>>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>>>>>> -	assigned-clock-rates = <500000000>, <1500000000>;
>>>>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>>>>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>>>>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>>>>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>>>>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>>>>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>>>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>>>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>>>>>> +	assigned-clock-rates = <0>, <0>, <0>, <0>;
>>>>>
>>>>> Why is assigned rates here 0s, rather than the property just removed?
>>>>>
>>>>>>    };
>>>>>>    &sysgpio {
>>>>>> --
>>>>>> 2.45.2
>>>>>>
>>>>
>>>> Assigned rates all zeroes is how it is in U-Boot. Removing the
>>>> assigned-clock-rates property as suggested does work in U-Boot and
>>>> Linux both.
>>>>
>>>> For context, U-Boot fails when replacing assigned-clocks to
>>>> JH7110_SYSCLK_CPU_CORE (500MHz) and JH7110_PLLCLK_PLL0_OUT
>>> (1500MHz)
>>>> from Linux. So I tried to merge all properties together and in testing
>>>> then U-Boot failed (or I did it wrong). However replacing the Linux
>>>> properties with the U-Boot configuration (above) on Linux does work for
>>> both.
>>>>
>>>> I do not know if this is correct but I can test any suggestions and
>>>> report if they are working.
>>>>
>>>> Do these changes make sense? Are there other variations I should test?
>>>
>>> I'd like the commit message to at least explain why these clocks need to be
>>> set to zero (I assume that means disabled?). Maybe the StarFive folks know
>>> why it is required?
>>
>> Here "assigned-clock-rates = <0>, ..." means skipping setting clock rates.
>> You can refer to
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml/
> 
> If you check the wording there, it says:
>    To skip setting parent or rate of a clock its corresponding entry should be
>    set to 0, or can be omitted if it is not followed by any non-zero entry.
> Since all clocks are being set to 0 above, we should be in the "can be
> omitted" case for the entire property, no? That would...
> 
>> Linux here setting JH7110_SYSCLK_CPU_CORE to 500MHz and JH7110_PLLCLK_PLL0_OUT
>> to 1500MHz are for increasing the CPU frequency to 1500MHz.
>>
>> VF2 u-boot is still running at 1000MHz now. You failed to set JH7110_PLLCLK_PLL0_OUT
>> to 1500MHz, because CPU power supply voltage needs to be increased before running at
>> 1500MHz.

Conor / Hal,  how does this work:

Are these the minimum and maximum values for CPU frequency, CPU CORE and 
PLL0 OUT ?

>>
>> I think a better choice now is changing Linux device tree as follows:
>>
>> &syscrg {
>> 	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>> 			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>> 			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>> 			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
>> 			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
>> 			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>> 	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>> 				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>> 				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>> 				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>> 	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
>> };
> 
> ...make this one a reasonable change...
> 
>> For u-boot, if there is no requirement to run u-boot at 1500MHz, just keep
>> &syscrg {
>> 	assigned-clock-rates = <0>, <0>, <0>, <0>;
>> };
> 
> ...but not this one.
> 
>> in u-boot device tree. If we need running 1500MHz in u-boot, I will send a patch
>> to implement it and then &syscrg{...} in u-boot device tree can be dropped.
>>
>> Best regards,
>> Hal

Hal,

What voltage (and speed) has less heat output?

I think it must be configured to be *reliable first* as it is pictured 
being a developer board on a person's desk (with no extra accessory - no 
fans, heatsink, etc.) and for example doing work as of a Linux kernel 
compile with using all cores.

We should not force a configuration that will fail for the common 
situation. What voltage and clock speed is the best for continuous 
reliable operation of a JH7110 CPU with no added heatsink or fan and at 
ambient temperature?

Does CPU frequency range need to be given in devicetree? Can instead 
this be done with userspace tool or Linux subsystem at runtime?

The thermal dissipation of JH7110 CPU will be depend on the board layout 
and physical application. So, my opinion here:  I think any minimum and 
maximum CPU frequency limit that is given by manufacturer recommendation 
of safe continuous operation is okay for dts include. If some part of 
this frequency range is not reliable (from undervolt, or overheat) then 
it is a "no" from me in Linux and in U-Boot. The fact of failing to boot 
(in U-Boot) because JH7110 CPU default voltage is not high enough for 
1500MHz operation tells me this is a wrong idea or there is missing code 
in U-Boot to select a default sane clock speed and voltage.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

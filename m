Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D885C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xd4BOwpzuZlLZtbdXPWVfA8m1rWKXC/VRllltRMPtSc=; b=BUU+n/s1gN6Pmb
	p3cAw7CX/qx3lQiP2V+kJnZaz0aqNpUuaRXDfLbscq+xbe63zmV26duK2ZYZyCPJM5Nykmo+IO/zS
	2cFmSBg+Ra6ZDCZsZmSVzO6ZKNQ6YU/5RfkZl3S+ocsWV/ORbO4OAknYqtyIVntDChd6eG4ufD5qn
	GBEIhWz//iQCl9+SFQRFzb+lTU/ymJ3MBTEdTbIikxNYxn+v2ap0+l28EMasHpLklzTnre5rGtZib
	b6FUJeUGopDHa4xiYEGoU6U0cTpk1YJLwFKc2de6aR14re+z/Xc4BoR0l9H+ySXToU2CWQvCvwAVD
	w3NRbuJlTdUzChF1yGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5i3-00000008Gyv-2Qsl;
	Wed, 16 Jul 2025 17:14:23 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5i0-00000008GyQ-3aZO
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 17:14:22 +0000
Received: from [192.168.2.54] (unknown [143.105.119.108])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 11B43B4D0D04;
	Wed, 16 Jul 2025 19:14:14 +0200 (CEST)
Message-ID: <ff4021dd-69bc-45ae-a3d0-7f15be194717@freeshell.de>
Date: Wed, 16 Jul 2025 10:14:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: add status power led
 node
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716040500.178287-1-e@freeshell.de>
 <20250716-wind-slum-99dd6ea87f63@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250716-wind-slum-99dd6ea87f63@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_101421_076222_6C72A0DE 
X-CRM114-Status: GOOD (  16.12  )
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



On 7/16/25 08:28, Conor Dooley wrote:
> On Tue, Jul 15, 2025 at 09:04:54PM -0700, E Shattow wrote:
>> Add status power led node for StarFive VisionFive2 and variant boards.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
> 
> Again, I'll grab this too but it may be too late for 6.17.
> 
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 4baeb981d4df..2eaf01775ef5 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -8,6 +8,7 @@
>>  #include "jh7110.dtsi"
>>  #include "jh7110-pinfunc.h"
>>  #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>>  #include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
>>  
>>  / {
>> @@ -38,6 +39,14 @@ gpio-restart {
>>  		priority = <224>;
>>  	};
>>  
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		led_status_power: led-0 {
>> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +
>>  	pwmdac_codec: audio-codec {
>>  		compatible = "linux,spdif-dit";
>>  		#sound-dai-cells = <0>;
>>
>> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
>> -- 
>> 2.50.0
>>

Ok sounds good to me. This is common on all JH7110 boards, but am not
sure if it is connected to anything on DeepComputing Framework 13 V01.

LED color varies yet there is an LED connected this way on variants I
could find a published schematic for:
- Milk-V Mars
- Pine64 Star64
- StarFive VisionFive2 1.2a
- StarFive VisionFive2 1.3b

Discussion about the OrangePi RV dts shows this to have the same
connection to an LED. I am putting together patches for adding Milk-V
Mars CM and Milk-V Mars CM Lite, tested successfully and listed on
schematics as well. Some early revision developer sample board
schematics for some of the above do not list RGPIO3 so assumed n/c and
no problem there.

If anyone out there can link to the FML13V01 schematic or confirm this
change does not break for users I'd appreciate that, for any follow-up
that might be needed per-board.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

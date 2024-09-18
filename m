Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638C6CCD190
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLRcE1xIVGjDyFJoVGCIEyTeiFA2V2N51Dgw7l2qsgs=; b=vbZLr13qb3KcJr
	0Gk69B0fZFWWC2sNZ5jGKy/4hJgV+PDQuk5F3Nh2ICHF1ka6qbJaGBxSfS5BHPAyiJVMo1GkKzEvu
	Mt83nUEQhwy6G2dCe6oPlt0sDWb47jAePZTxZqU5GezRhqbrls9AJH3bbwsTlsTiM5iodXty407bV
	BerKlV4tOh4ZdB/w9Ips5vPmEPUhLafGPgEDoTf38ZjFUEYRo5yC0VCORFFug1wK0wwTbj7JUn4HR
	9q8NoFIVQ94ZTu5kIvGEikdmAhm8lO+14OyER0twjCKRLeEUZ/eT5z7/Iugbs6orN+cvKbAoriyUL
	RIBnIG/IHPgcc4QLjazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqEO-00000007q3n-2FJj;
	Wed, 18 Sep 2024 08:40:12 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqEL-00000007q3H-0boE
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 08:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=kndYrYYqDkcp0197Z0G5UQyfDrIiCK/y6NU5mK/gTYQ=;
	b=CgU0y1q+nDKb6SY1S+EW7QzMKUFSwVH/gQMUgNJ+ex/NexpfQTJ6EnKeEhUwNC
	zGUJwLAih+oCxfm/DJIzWJ3Ut9W/UzxLI2nGKbEMbSCJ5jUMOPnaGE3bl7+5QsuC
	3PhlsFtV8wEB5azw9pGls207mzXTzXbMReehhU5p5ent4=
Received: from [192.168.31.242] (unknown [27.18.168.209])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wD3n2PBkepmzEcuCA--.53176S2;
	Wed, 18 Sep 2024 16:39:32 +0800 (CST)
Message-ID: <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
Date: Wed, 18 Sep 2024 16:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
 <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
X-CM-TRANSID: _____wD3n2PBkepmzEcuCA--.53176S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWxWF43CryxJFykJw13urg_yoW8XFWxpw
	4a9FZxCr1xursIyryaqF90gr13uan7uF4jgw1ak34UJr43XryYkwnYqrW8XryDWF4Sq3y0
	9r4Fq34I9r1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRrb15UUUUU=
X-Originating-IP: [27.18.168.209]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJwheomXAn32U0AAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_014009_817518_C5C4A0E4 
X-CRM114-Status: GOOD (  11.42  )
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

On 9/16/24 11:52 PM, Krzysztof Kozlowski wrote:
> On 16/09/2024 08:47, Ze Huang wrote:
>> Add pinctrl device, containing default config for uart, pwm, iis, iic and
>> mmc.
>>
>> Signed-off-by: Ze Huang <18771902331@163.com>
>> ---
>>   arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 +++++++++++++++++++
>>   arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
>>   arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
>>   3 files changed, 336 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
>>
>> diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>> new file mode 100644
>> index 000000000000..0737f50d2868
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>> @@ -0,0 +1,316 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
>> + */
>> +#include "k230-pinctrl.h"
>> +
>> +/ {
>> +	soc {
>> +		pinctrl: pinctrl@91105000 {
> That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
> that's preferred coding style in RISC-V or Canaan?

Pinctrl-related nodes were separated the for ease of maintenance, but the
convention in Canaan is to place them in the board-level DTS file. Would it
be better to stay consistent with their approach?

>> +			compatible = "canaan,k230-pinctrl";
>> +			reg = <0x0 0x91105000 0x0 0x100>;
>> +
> Best regards,
> Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD39C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAwlbQYarPyxx3NxenxpSJD2DCButV/aEtQqmfLky3I=; b=2rFDiFom9601FR
	k/Y37Lg3pIKRQXa+LoN3D8FXz9KvW3XxTtkp9gq9bp+acONu5rHqYzBXUlWzn7UZonShOtDsTjE8p
	Itm4Of3eBeVnEqfPoptMdA88nGiVatzCh/rMUFOUJZ4q5sA65tLtB65AIWvLE204Avrn+Yc6S86XF
	IstsIPpIFPIIDQdHNo5Fak0i78jfmoezsZ9wtIW5+e14DGsNUhSLgZNo1WiUWplK/h+MuyXGiBh9t
	NOnWfFxq+yzPtnpygJwkAe55iLGu0pbTxlWSfuDNBclUnalTKgQilWi11aWv5P0Gm5WMEY15tPyvK
	zTY0m215htzE3xeod7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQCY-00000009vGU-1Oxq;
	Sun, 21 Apr 2024 05:57:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQCU-00000009vEB-1AiI
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 05:57:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 207B540003;
	Sun, 21 Apr 2024 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713679024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2Kjmtq3Ybi5b8tattuXhRtpcAjxJmV4CBtd58iYrr0=;
	b=d4KjKCq+u+3vSraYnDy7e+yvNOQXi1W3H6Vimzr/Wo/QpqS53ewWw9HX5A1vo7ZoaTLkzE
	SDfV/p3+7skZXNlTP29vVva5sj2qg1elJ4A3L9PSdqpxM5D1GIJdLNSIIzK1HUjqnFgJsg
	uODQ0wUQFk2VuFI+hxhUnWP+pW3ivnvTM/ms3iGSda90JIz2HM+EFxCsGztM2RioHAdX0l
	AnjZCADOdeNbbP3ommWGIHZuUJ3ogJWeaWyBCjZ/S6ekhIW/sAkeK78+DQIPzXZd33fUUO
	8Nf/FzFArX94aS2PaCT+aHR72EuiTrDB3EAcKLpvA8ltAppwOnqAoIWoiCmKzg==
Message-ID: <e457d5f6-3289-4049-b663-2ebcfe78dce4@bootlin.com>
Date: Sun, 21 Apr 2024 07:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] riscv: dts: sophgo: add initial Milk-V Duo S board
 support
To: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
 <20240417065311.3881023-3-michael.opdenacker@bootlin.com>
 <IA1PR20MB49539A380E44459ACE19DEB6BB0F2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IA1PR20MB49539A380E44459ACE19DEB6BB0F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_225718_625204_445058EB 
X-CRM114-Status: GOOD (  17.78  )
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

Hi Inochi

Thanks for your advice!

On 4/17/24 at 11:34, Inochi Amaoto wrote:
> On Wed, Apr 17, 2024 at 08:53:11AM GMT, michael.opdenacker@bootlin.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This adds initial support for the Milk-V Duo S board
>> (https://milkv.io/duo-s), enabling the serial port,
>> making it possible to boot Linux to the command line.
>>
>> Link: https://lore.kernel.org/linux-riscv/171266958507.1032617.9460749136730849811.robh@kernel.org/T/#t
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>>   .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 34 +++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
>>
>> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
>> index 57ad82a61ea6..e008acb5240f 100644
>> --- a/arch/riscv/boot/dts/sophgo/Makefile
>> +++ b/arch/riscv/boot/dts/sophgo/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duos.dtb
>>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
>> new file mode 100644
>> index 000000000000..c1ecf97d5e93
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
>> @@ -0,0 +1,34 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2024 Michael Opdenacker <michael.opdenacker@bootlin.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "cv1812h.dtsi"
>> +
>> +/ {
>> +	model = "Milk-V Duo S";
>> +	compatible = "milkv,duos", "sophgo,cv1812h";
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x80000000 0x20000000>;
>> +	};
> Add a cpu specific file, and move this to it.

Now that I'm including "cv1812h.dtsi", which has the same structure, all 
I need is to change the reg setting to have 512 MB of RAM instead of 
256MB, right? See the V6 I'm sending soon.

>
>> +};
>> +
>> +&osc {
>> +	clock-frequency = <25000000>;
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1
>>
> Add necessary DT node in the cpu specific file. (clint,
> plic and clk). You also need to rebase your patch based
> on sophgo/for-next.

Same here, cv1812h.dtsi already configures &clint, &plic and &clk, so it 
seems to me I don't need to make changes again here. At least the board 
boots fine for me as it is.
Cheers
Michael.


-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

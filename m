Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C71ECFC504
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 03:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O81VGg4lzd6AQzGs4ojTyc7E+ZjbiTmBJRIJ1x8am3M=; b=A45JroelLYUyY8
	W23CeHeHQfB4u3Ugu3sP9/OU+uWZxrBR8mR6tXrArIpv0pJ9WmLeyNjqcje+mWtcznZiS+Jh9iBKr
	LJckEZQTkeSknnNCvLV7sUdKceC4kaQo69vGV+fTXOATRPddK9avQR0C3ORvuwFyruUmUZrscIsx6
	VhG7y0W9RLYYGDYzPW3l9z8GVBK7FdPScCs+gMVmZNgg9T2noEmBTd8kMLbZEyAOUqufSB2cr2/IP
	4DSMG424pFM6lONH45rdiE8lsMOKCfkSrd0wC+fOAJVqWnO45xVtxXZUbvYGtXsFoaPvn5s56CtD+
	nmzQXxd3JTjEXawsCDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMeLZ-00000009Dz6-0VN8;
	Sat, 22 Nov 2025 03:31:37 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMeLV-00000009Dya-1eA8
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 03:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1763782263;
	bh=dSCZow36UoMM46BBajqssiSEXL6PvDYG1E5ouX01BOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ari733BB+zfdbjsK5vIlyi2TujrFex+AHjwQ7i0+Av0sbyI+wfCZAJ24At2uIC0+S
	 j9vdQLCadD2JF4bVuBHv8RrrBzMoPIXaeDdOVUI+T0AP+Ef4BCCgU6fX4Kxq4Pr6uL
	 F9WkFdrkq4gWsAUR8CjSsMNBeXrjEM3ljENWdmWD/5uvrRkkqCqZG2oIugzA7OaeX0
	 bcl3HqWntvR49i3hpDarUHQ8RNVHpQwd9ponL5c39URbpxuQkEbJv++zQJzXwdYA4z
	 0IMEJIOReGvYpcIWxSURerjVSwqMstJM2ep7jShpKzbM6ioKx/EZrrULjw+aNVIe3y
	 k5jswuNydDdqA==
Received: from [192.168.2.54] (unknown [143.105.119.236])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E5F3CB221561;
	Sat, 22 Nov 2025 04:30:59 +0100 (CET)
Message-ID: <b61969d3-b00b-4ea7-bee5-ba7ffb530aa9@freeshell.de>
Date: Fri, 21 Nov 2025 19:30:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Hal Feng <hal.feng@starfivetech.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
 <20251120082946.109378-4-hal.feng@starfivetech.com>
 <CAJM55Z8NsC_-jcrm+ndMonU6EtkSzhAQvoROXZwOWNi9FeQLXA@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z8NsC_-jcrm+ndMonU6EtkSzhAQvoROXZwOWNi9FeQLXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_193133_931621_087030DE 
X-CRM114-Status: GOOD (  13.20  )
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



On 11/21/25 03:51, Emil Renner Berthing wrote:
> Quoting Hal Feng (2025-11-20 09:29:44)
>> Add common board dtsi for use by VisionFive 2 Lite variants.
>>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../jh7110s-starfive-visionfive-2-lite.dtsi   | 691 ++++++++++++++++++
>>  1 file changed, 691 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
>> new file mode 100644
>> index 000000000000..aa375c4a3fa3
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
>> @@ -0,0 +1,691 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
>> + * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include "jh7110.dtsi"
>> +#include "jh7110-pinfunc.h"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
> ''
> I'm confused. In [1] you said "remove jh7110s-common.dtsi, because only one
> board uses JH7110S now." but this series still adds two different boards.
> 
> Also this derives from jh7110.dtsi rather than from jh7110-common.dts as I
> suggested in [2].
> 
> In any case I'm fine with doing it this way, so
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> [1]: https://lore.kernel.org/linux-riscv/ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
> [2]: https://lore.kernel.org/linux-riscv/CAJM55Z-MfpVX3EuQ_AjvDSk6FwR51R5cQdN5RybS9pbJ8r9NNg@mail.gmail.com/

"Yes" or "No" question from me: Is it necessary to introduce new
"jh7110s" compatible?

I am also confused as suggestions and feedback from v2 are not
implemented in v3:

"jh7110" or "jh7110s" filename prefix ?

<prefix>-starfive-visionfive-2-lite.dtsi includes jh7110-common.dtsi ?
Not changed in v3 with include of "jh7110.dtsi" and duplicating
jh7110-common.dtsi in a board dtsi file. This may be acceptable but it
makes no sense to me why is this done when the suggestion is for minimal
changes.

<prefix>-starfive-visionfive-2-lite.dtsi adds four pairs of
'/delete-property/' with OPP table where different from jh7110-common.dtsi ?

<prefix>-starfive-visionfive-2-lite.dts:
compatible = "starfive,visionfive-2-lite", "starfive,jh7110"
? (or else)
compatible = "starfive,visionfive-2-lite", "starfive,jh7110s"
? (or else)
compatible = "starfive,visionfive-2-lite", "starfive,jh7110s",
"starfive,jh7110"
?

<prefix>-starfive-visionfive-2-lite-emmc.dts:
compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110"
? (or else)
compatible = "starfive,visionfive-2-lite-emmc", "starfive,jh7110s"
? (or else)
compatible = "starfive,visionfive-2-lite", "starfive,jh7110s",
"starfive,jh7110"
?

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

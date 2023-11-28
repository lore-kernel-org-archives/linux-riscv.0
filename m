Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5160DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLGWjSlAJeTXe+7sMmhz35bREmPXDrcKlBbiTFKq+1c=; b=bBaXxR0/ChGyn9
	F1DykvlRMpTvk1OAHF+oRlslQIpYjmhyabZ/7aFXQmht4SRyW3olz3pwN/UHC6HGVu6KI/PyRCArr
	g2+2f8s7blovb8KjnbbAbNxzoOCw7shbtQVyZIsrRbBFRSxd1Q8vLUFh5SCl+/nvPPZ34RcIv/lrE
	PAsfa0Y7DQCKZD0Y1wT0E8ZfAqEtggIW6tKCHivyUTKqm2g6gv8AXdqr0pHJjmUcDpwX2OAqiEUj+
	wsra49coUOeCvHFW2bwgfUkLvf9zYL6A0Vp6GuYbk6nYHFSRTHYhe+vAB/XP67dB8zqIogsoT07t2
	6Z131ar001omI2Q3kBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ohv-003xuT-11;
	Tue, 28 Nov 2023 03:24:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ohr-003xr3-1Q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 03:24:18 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BD51824E284;
	Tue, 28 Nov 2023 11:23:29 +0800 (CST)
Received: from EXMBX163.cuchost.com (172.16.7.73) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Nov
 2023 11:23:29 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX163.cuchost.com
 (172.16.7.73) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Nov
 2023 11:23:29 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 28 Nov 2023 11:23:29 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor@kernel.org"
	<conor@kernel.org>, "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "emil.renner.berthing@canonical.com"
	<emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH 7/7] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Topic: [PATCH 7/7] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Index: AQHaINIsNJmOJgxv1UyTHTa/bh+M/LCNVdGAgAG7ubA=
Date: Tue, 28 Nov 2023 03:23:29 +0000
Message-ID: <09c51c5301c54659828c5cce748d3762@EXMBX066.cuchost.com>
References: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
 <20231127013602.253835-8-jeeheng.sia@starfivetech.com>
 <20b13322-3cd1-47b1-bb39-2710ddc59a11@kernel.org>
In-Reply-To: <20b13322-3cd1-47b1-bb39-2710ddc59a11@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_192415_786173_962A68FC 
X-CRM114-Status: GOOD (  20.82  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, November 27, 2023 4:51 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> conor@kernel.org; kernel@esmil.dk; robh+dt@kernel.org; emil.renner.berthing@canonical.com
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH 7/7] riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
> On 27/11/2023 02:36, Sia Jee Heng wrote:
> > Add initial device tree for the StarFive JH8100 RISC-V SoC
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/Makefile       |   1 +
> >  arch/riscv/boot/dts/starfive/jh8100-evb.dts |  42 +++
> >  arch/riscv/boot/dts/starfive/jh8100.dtsi    | 365 ++++++++++++++++++++
> >  3 files changed, 408 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
> >  create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> > index 0141504c0f5c..fbb0dc619102 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -10,3 +10,4 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
> >
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> > +dtb-$(CONFIG_ARCH_STARFIVE) += jh8100-evb.dtb
> > diff --git a/arch/riscv/boot/dts/starfive/jh8100-evb.dts b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> > new file mode 100644
> > index 000000000000..67c4964a8773
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> > @@ -0,0 +1,42 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
> > + */
> > +
> > +#include "jh8100.dtsi"
> > +
> > +/ {
> > +	model = "StarFive JH8100 EVB";
> > +	compatible = "starfive,jh8100-evb", "starfive,jh8100";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	cpus {
> > +		timebase-frequency = <4000000>;
> 
> This was fixed recently on the mailing lists.
The timebase-frequency on StarFive JH8100 SoC is set by an internal clk divider, will move the property to jh8100.dtsi. Thanks.
> 
> 
> > +
> > +	};
> > +
> > +	memory {
> > +		device_type = "memory";
> > +		reg = <0x0 0x40000000 0x2 0x00000000>; /* 8GB */
> > +	};
> > +
> > +	soc {
> > +		clk_uart: clk_uart {
> 
> Undercores are not allowed in node names. Use hyphen.
Noted.
> 
> Also, boards must not add nodes to the soc. This is board, not SoC DTS.
Noted. Will move it to dtsi.
> 
> ...
> 
> > +
> > +		uart6: serial@127e0000  {
> > +			compatible = "starfive,jh8100-uart";
> > +			reg = <0x0 0x127e0000 0x0 0x10000>;
> > +			clock-names = "uart_clk", "pclk";
> > +			interrupts = <73>;
> > +			status = "disabled";
> > +		};
> > +
> 
> Stray blank line. In other places as well.
Noted.
> 
> > +	};
> > +};
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

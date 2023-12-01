Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F8CC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6VHK3wtvuw0jySJGVrLw4G71EQxedMNfTJMSFRbGhk=; b=yJJVIiNMz1U2Bx
	l9E5zXMzB5sopC32Y0DItjnddS7AvutGJ5mj3F8aesNQt5Hc2dd6xrQ4ZboYJnvUkGwwM5CWZPLiy
	Hqf33DtWH8sFaBksFibo7EwwXXXOCHL6+2vAtoF1ldjYe0UTN7VslbXG0jSja9IWCbRZo4ruTbXnm
	ijclcYl4LaEsb+I0lmKg0DTZDBegwVH7vrG08Rp2opVSJQu7LSYvXYVf14kajKsGta2L6SiTJ3L10
	/ZmNE5vkbt6Z8zw3OlyPExPUJLMkDE1Wm5t+OGvenhbgggbsn6Q+geVE5yBqlscLsehjZV43K9z8K
	UAo34Yx4N8O4+hBLOXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xY4-00CpoF-1O;
	Fri, 01 Dec 2023 07:02:52 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xY0-00Cplc-15
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 07:02:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 802EE806C;
	Fri,  1 Dec 2023 15:02:14 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Dec
 2023 15:02:14 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 1 Dec 2023 15:02:14 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"conor@kernel.org" <conor@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org" <drew@beagleboard.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v2 0/6] Initial device tree support for StarFive JH8100
 SoC
Thread-Topic: [PATCH v2 0/6] Initial device tree support for StarFive JH8100
 SoC
Thread-Index: AQHaIoltfrp3sT1yT0ef06easE87zLCUArOg
Date: Fri, 1 Dec 2023 07:02:14 +0000
Message-ID: <1cef32884e2c4921a07d408e22fe23f8@EXMBX066.cuchost.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
In-Reply-To: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.54.3.230]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230248_732574_7A05EB06 
X-CRM114-Status: GOOD (  19.53  )
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

Thank you, Krzysztof, Conor, and LeyFoon, for your comments.
I will prepare version 3 to address all the feedback.

> -----Original Message-----
> From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Sent: Wednesday, November 29, 2023 2:01 PM
> To: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; krzk@kernel.org; conor+dt@kernel.org;
> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org; tglx@linutronix.de;
> conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
> <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; JeeHeng Sia
> <jeeheng.sia@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Subject: [PATCH v2 0/6] Initial device tree support for StarFive JH8100 SoC
> 
> StarFive JH8100 SoC consists of 4 RISC-V performance Cores (Dubhe-90) and
> 2 RISC-V energy efficient cores (Dubhe-80). It also features various
> interfaces such as DDR4, Gbit-Ether, CAN, USB 3.2, SD/MMC, etc., making it
> ideal for high-performance computing scenarios.
> 
> This patch series introduces initial SoC DTSI support for the StarFive
> JH8100 SoC. The relevant dt-binding documentation has been updated
> accordingly. Below is the list of IP blocks added in the initial SoC DTSI,
> which can be used for booting via initramfs on FPGA:
> 
> - StarFive Dubhe-80 CPU
> - StarFive Dubhe-90 CPU
> - PLIC
> - CLINT
> - UART
> 
> The primary goal is to include foundational patches so that additional
> drivers can be built on top of this framework.
> 
> Changes since v1:
> - Dropped patch 5.
> - Moved timebase-frequency from .dts to .dtsi.
> - Moved soc node from .dts to .dtsi.
> - Revised the title for the dt-binding document by removing Xilinx
>   wording.
> - Added a full stop to the end of the commit messages.
> - Removed extra blank lines.
> - Used hyphen for a node name.
> - Added more recipients to the mailing list.
> 
> Sia Jee Heng (6):
>   dt-bindings: riscv: Add StarFive Dubhe compatibles
>   dt-bindings: riscv: Add StarFive JH8100 SoC
>   dt-bindings: timer: Add StarFive JH8100 clint
>   dt-bindings: interrupt-controller: Add StarFive JH8100 plic
>   dt-bindings: serial: cdns: Add new compatible string for StarFive
>     JH8100 UART
>   riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/cpus.yaml       |   2 +
>  .../devicetree/bindings/riscv/starfive.yaml   |   5 +-
>  .../devicetree/bindings/serial/cdns,uart.yaml |   4 +
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>  arch/riscv/boot/dts/starfive/jh8100-evb.dts   |  28 ++
>  arch/riscv/boot/dts/starfive/jh8100.dtsi      | 378 ++++++++++++++++++
>  8 files changed, 419 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi
> 
> 
> base-commit: 18d46e76d7c2eedd8577fae67e3f1d4db25018b0
> --
> 2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

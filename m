Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6596CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 07:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78iNRMK8aBQfUhx+9pLN9q2S1cg8nAdrPktEW95ecN4=; b=X0WwSYEiBZUMni
	UKGEtGHmlwIMxfzU3ARmPYIUK5zEY/CQ+UA3s3wzEeVeApPT1SWyuRcj9z0tLYpKa2IrPrYZ7J9Pw
	sBvRLuI9bQhtsfMsnIA0krBOb+w+M89m3vSDg3yl7Sbu1slsoYoYpUCD4zGs3VOk3kRjzFpJyXfNz
	mpfWg73xM2amVO9/MOjEuBllOfaGt2CYgv4WOIPgvDVMUlVq54lTDue/gLG+VjGTaX0w1AIi1Fgsw
	LyWJji7qafh5dhu7bHSmG1W9K1JiJmU+pkCru7on5b94g/H5kzcD//E5iz1rPdzpG1ziqygsY5KqK
	frlGw1CmQuJBlBRsh0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7syg-004TJD-1v;
	Tue, 28 Nov 2023 07:57:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7syc-004TFs-2q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 07:57:52 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B1D1024DC8B;
	Tue, 28 Nov 2023 15:57:19 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Nov
 2023 15:57:19 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX066.cuchost.com
 (172.16.7.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Nov
 2023 15:57:19 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 28 Nov 2023 15:57:19 +0800
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
Subject: RE: [PATCH 6/7] serial: xilinx_uartps: Add new compatible string for
 StarFive
Thread-Topic: [PATCH 6/7] serial: xilinx_uartps: Add new compatible string for
 StarFive
Thread-Index: AQHaINIphsM8jXvQa0qbM8hLZxm2GLCNVWaAgAG91cD//7vrAIAAj/Xg
Date: Tue, 28 Nov 2023 07:57:19 +0000
Message-ID: <15b8ae81c5184ce3b42a6ab39a6852d6@EXMBX066.cuchost.com>
References: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
 <20231127013602.253835-7-jeeheng.sia@starfivetech.com>
 <07fc5ebe-47b2-4843-ad49-36e6686e5a9a@kernel.org>
 <b423574c710b44aabb36cd434693b3e2@EXMBX066.cuchost.com>
 <d6dd14c2-f662-4b82-bc96-7e161cb721c9@kernel.org>
In-Reply-To: <d6dd14c2-f662-4b82-bc96-7e161cb721c9@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_235751_223436_3905FA0E 
X-CRM114-Status: GOOD (  23.05  )
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
> Sent: Tuesday, November 28, 2023 3:21 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> conor@kernel.org; kernel@esmil.dk; robh+dt@kernel.org; emil.renner.berthing@canonical.com
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH 6/7] serial: xilinx_uartps: Add new compatible string for StarFive
> 
> On 28/11/2023 06:25, JeeHeng Sia wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Monday, November 27, 2023 4:49 PM
> >> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> >> conor@kernel.org; kernel@esmil.dk; robh+dt@kernel.org; emil.renner.berthing@canonical.com
> >> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> >> Subject: Re: [PATCH 6/7] serial: xilinx_uartps: Add new compatible string for StarFive
> >>
> >> On 27/11/2023 02:36, Sia Jee Heng wrote:
> >>> This patch adds the new compatible string for StarFive JH8100 SoC
> >>>
> >>> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> >>> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >>> ---
> >>>  drivers/tty/serial/xilinx_uartps.c | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> >>> index 66a45a634158..170901c143c2 100644
> >>> --- a/drivers/tty/serial/xilinx_uartps.c
> >>> +++ b/drivers/tty/serial/xilinx_uartps.c
> >>> @@ -1210,7 +1210,7 @@ OF_EARLYCON_DECLARE(cdns, "xlnx,xuartps", cdns_early_console_setup);
> >>>  OF_EARLYCON_DECLARE(cdns, "cdns,uart-r1p8", cdns_early_console_setup);
> >>>  OF_EARLYCON_DECLARE(cdns, "cdns,uart-r1p12", cdns_early_console_setup);
> >>>  OF_EARLYCON_DECLARE(cdns, "xlnx,zynqmp-uart", cdns_early_console_setup);
> >>> -
> >>> +OF_EARLYCON_DECLARE(cdns, "starfive,jh8100-uart", cdns_early_console_setup);
> >>>
> >>>  /* Static pointer to console port */
> >>>  static struct uart_port *console_port;
> >>> @@ -1448,6 +1448,7 @@ static const struct of_device_id cdns_uart_of_match[] = {
> >>>  	{ .compatible = "cdns,uart-r1p8", },
> >>>  	{ .compatible = "cdns,uart-r1p12", .data = &zynqmp_uart_def },
> >>>  	{ .compatible = "xlnx,zynqmp-uart", .data = &zynqmp_uart_def },
> >>> +	{ .compatible = "starfive,jh8100-uart", },
> >>
> >> Why you do not express compatibility in your bindings? Skip this driver
> >> change.
> > The compatibility string was added to the binding in the 5th patch. We need to add this compatibility string to the driver, as the
> other compatibilities were used for other SoCs.
> 
> You did not add "compatibility string" but compatible. I am asking why
> you are not expressing in your bindings the compatibility between this
> and other devices.
> 
> And no, you do not need driver change for compatible devices, so again:
> skip this driver change.
Alright, I will skip this driver change. Thanks.
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

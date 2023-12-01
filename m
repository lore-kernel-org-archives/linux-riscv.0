Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E03FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WknoTvaPp9LfY8DGnunaUPq67YiyARaBnmgNTDkUk8=; b=N7o7XBJGU1Csx9
	0sRYO9JHTzkzbbxqcw5t3bWd5pPujZIUc4U5Y0e58IsHFZPY+IckRd7xeiUqOZ5nqtDISyloaC/qk
	zjfG8/QI9MlyxLA6aD9SVPeNMdc+Us7BdDAWdj1sbHhw5dO0h28rwWbevCRJQC5F22617lt1V6Krr
	UFbtDoz1qDrohSfuf2ezoloCrFdR4n0A5cymiPmOcElN0fB5ZDG8FxZfQXvl1nslSXGLR9rB5HQ6N
	yab72O8Qi2i8MFU7sXebkLn9bOca5dokh68LC46AUpvIQG9sDVxiyK7tbO+67KH49067GI9VYq993
	LveOy9EvVths9JzRq7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8sQZ-00CMF2-2u;
	Fri, 01 Dec 2023 01:34:47 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8sQV-00CMD7-1L
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 01:34:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 80FA180A4;
	Fri,  1 Dec 2023 09:34:10 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Dec
 2023 09:34:10 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Dec
 2023 09:34:09 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 1 Dec 2023 09:34:10 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"conor@kernel.org" <conor@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org" <drew@beagleboard.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Topic: [PATCH v2 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Index: AQHaIomdkCH/WE7GIU6i0VyZ0qWNd7CSonGAgAEFIaA=
Date: Fri, 1 Dec 2023 01:34:10 +0000
Message-ID: <823f1c9a43aa4ded919b05f5a96f036b@EXMBX066.cuchost.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-7-jeeheng.sia@starfivetech.com>
 <21e2d194efee4bb6b870735e6fe2d65c@EXMBX061.cuchost.com>
In-Reply-To: <21e2d194efee4bb6b870735e6fe2d65c@EXMBX061.cuchost.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.54.3.230]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_173443_738575_959BBE8C 
X-CRM114-Status: GOOD (  12.23  )
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
> From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Sent: Friday, December 1, 2023 1:58 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH v2 6/6] riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
> 
> 
> -----Original Message-----
> From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Sent: Wednesday, November 29, 2023 2:01 PM
> To: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; krzk@kernel.org; conor+dt@kernel.org;
> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org; tglx@linutronix.de;
> conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
> <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; JeeHeng Sia
> <jeeheng.sia@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Subject: [PATCH v2 6/6] riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
> Add initial device tree for the StarFive JH8100 RISC-V SoC.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile       |   1 +
>  arch/riscv/boot/dts/starfive/jh8100-evb.dts |  28 ++
>  arch/riscv/boot/dts/starfive/jh8100.dtsi    | 378 ++++++++++++++++++++
>  3 files changed, 407 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 0141504c0f5c..fbb0dc619102 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -10,3 +10,4 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
> 
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh8100-evb.dtb
> Add empty line before this.
Ok, I can add an empty line here to distinguish between the platforms.
> 
> [....]
> 
> Regards
> Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

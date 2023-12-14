Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151BCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 00:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2Ho2Llg7WbEml94Vw13zg9C1iP6v/2+cwoHheWtRHQ=; b=hlMu5/CNFxT8hE
	0q4nFpN9YBAQRS6PWaycJgkdDzdDmpnmydReAdmgaedQm2lMf0Se0Jdk8qMotaFuZdzUyhPA0vbqM
	kvicJX6rLlJS3FRmy9nYyTVIh4KYS/CmsmVs+Ab6szmpNoxhfpOGwH2ThKXCqqs8Z0KP5CdCcgphP
	nXvxt8Mov+adE65seFcjCPHnKzPb8woaNv3JfAFYlOicpfAg65SF4huijGrQRRWzfKq6E2KGnTo4p
	S0YdsLYZlwJsG9dKYDwbzuyE5b/Mu1GXTC7riU+EC12WFjgV9Gddj5DjOYUCNxlNMQ5j6qbja9qu1
	ehmv4KX4KDPMAEpTmAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDZhK-00GLYz-1h;
	Thu, 14 Dec 2023 00:35:30 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDZhH-00GLXb-0z
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 00:35:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 15D3C24E25A;
	Thu, 14 Dec 2023 08:34:54 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 08:34:53 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 08:34:53 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Thu, 14 Dec 2023 08:34:53 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
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
Subject: RE: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Topic: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Index: AQHaJFAfN2r53q/6u0mikZZoJRWxOLCfEf+AgAeiAoCAAUw4MA==
Date: Thu, 14 Dec 2023 00:34:53 +0000
Message-ID: <e18a1f301dfc403d966e4f050c87eb10@EXMBX066.cuchost.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
 <CAJM55Z831ucY4QqPTR_0zJVB05UUT4W-3M0CGzvtyPo=AMD=Vw@mail.gmail.com>
 <CAJM55Z-BJMi=rbe8op5EQ-efwo-9AbmavVE1BVJ9_xuHQzMhLQ@mail.gmail.com>
In-Reply-To: <CAJM55Z-BJMi=rbe8op5EQ-efwo-9AbmavVE1BVJ9_xuHQzMhLQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_163527_639245_4900D530 
X-CRM114-Status: GOOD (  16.47  )
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
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Sent: Wednesday, December 13, 2023 8:39 PM
> To: Emil Renner Berthing <emil.renner.berthing@canonical.com>; JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk;
> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org;
> anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
> <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
> Emil Renner Berthing wrote:
> > Sia Jee Heng wrote:
> > > Add initial device tree for the StarFive JH8100 RISC-V SoC.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >
> > Looks good to me, thanks.
> >
> > Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> I just learned that this JH8100 is not actually a real SoC yet but just an FPGA
> implementation, and no indication that that's actually a product that will be
> mass produced. Hence a lot of details may change before it becomes a real
> SoC/product people can buy, so let's not add this device tree yet before
> everything is set in silicon.
> 
> Please consider my Acked-by abeve revoked.
> 
> Sia Jee Heng: With that said I still think it's super awesome that you're
> beginning upstreaming support for your new SoCs early. I wish more SoC vendors
> would follow your example.
Hi Emil, I am not sure what you mean. We verified on FPGA & Emulator, and the logic
is pretty much close to the real silicon. I did mention that in the cover letter as well.
I am new to Linux, so I am wondering if there is a Linux upstream guideline mentioning
that pre-silicon software is not allowed to upstream? Hope there is an updated Linux
upstream guideline that benefit other vendors.
> 
> /Emil
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

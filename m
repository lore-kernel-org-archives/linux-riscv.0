Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0C7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDJp1hzGMGWpNSxNTrg+/tSchBQtBakO9XHR7P2WDAk=; b=n1VKFrN8NhPGTq
	3F7YDnv/olFl7Vc3J42/J4d7AY2pYmPXZQi3jdwSwiWe8fGMF8JqDJfoPNqLY1D1yOaPQtaxGJiIX
	iK4KSdbxJaAeWTCFTNdBddzXHQ9lC2NKypVQaO21iOwwWL0ZxbS5lLUoWtk2hcs1FkfBF2IrsVH5g
	RFPZ4V8Zl0YW/Hopm2YnSmCx10guEZkESebQx3R+PJx5R2TZllRltF6hnWDW6Zrp88sidTuvgDR+3
	7tjyXOfJtlCMCB3dwxKeHJsAbVOcN3ubxIDHgEtznkhcy+Dj7RCCH7JskSOdOwctWiIxX5X5NLJFY
	MJI6VZJtrj0RmpnqzS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPEl-00En8B-2G;
	Wed, 13 Dec 2023 13:25:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPEi-00En39-0m
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:25:18 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1D5DA24E246;
	Wed, 13 Dec 2023 21:24:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 21:24:23 +0800
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 21:24:23 +0800
Received: from EXMBX061.cuchost.com ([fe80::413f:35c8:bf4f:599a]) by
 EXMBX061.cuchost.com ([fe80::413f:35c8:bf4f:599a%14]) with mapi id
 15.00.1497.044; Wed, 13 Dec 2023 21:24:23 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, JeeHeng Sia
	<jeeheng.sia@starfivetech.com>
CC: "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"anup@brainfault.org" <anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org"
	<drew@beagleboard.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Thread-Topic: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Thread-Index: AQHaJE/+gN06PgKn10+OgNsQzAP7lrCmtRSAgACQEsA=
Date: Wed, 13 Dec 2023 13:24:23 +0000
Message-ID: <84b808cb028c40a29c9f81011931afba@EXMBX061.cuchost.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-3-jeeheng.sia@starfivetech.com>
 <20231213-imminent-favorable-a7d25e6555af@spud>
In-Reply-To: <20231213-imminent-favorable-a7d25e6555af@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.16.6.8]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_052516_571909_7AE73509 
X-CRM114-Status: GOOD (  19.59  )
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
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, December 13, 2023 8:43 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org;
> tglx@linutronix.de; anup@brainfault.org; gregkh@linuxfoundation.org;
> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
> <michael.zhu@starfivetech.com>; drew@beagleboard.org;
> devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Conor
> Dooley <conor.dooley@microchip.com>
> Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
> 
> On Fri, Dec 01, 2023 at 08:14:06PM +0800, Sia Jee Heng wrote:
> > Add device tree bindings for the StarFive JH8100 RISC-V SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > index cc4d92f0a1bf..12d7844232b8 100644
> > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > @@ -30,6 +30,10 @@ properties:
> >                - starfive,visionfive-2-v1.3b
> >            - const: starfive,jh7110
> >
> > +      - items:
> > +          - enum:
> > +              - starfive,jh8100-evb
> 
> Hmm, reading some of the other threads it appears that the evaluation
> platform that you guys have is actually just an FPGA? Could you please provide
> more information as to what this "evb" actually is?
> 
> If it is just an FPGA-based evaluation platform I don't think that we want to
> merge patches for the platform. I'm fine with patches adding peripheral
> support, but the soc/board dts files and things like pinctrl or clock drivers I am
> not keen on.
> Perhaps Emil also has an opinion on this.
> 
> Thanks,
> Conor.

We have been testing on the FPGA/emulator for pre-silicon validation. It will have real silicon SoC next year.

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

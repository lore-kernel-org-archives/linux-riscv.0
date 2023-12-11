Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC18C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jWpZsSamc5JYZ/+2Tdw3TwT4KPbyml4EZgBE0CnvP0=; b=riykkBToou24Lh
	I+8EvYJAXk23nb/0QzUJWNc+PSCaeTD9DA+K9RVSr5jPu8p1wItA9Bl/zo6aKKSRrQMZhM4dYWLeS
	W+9CXNfochtPzAN1nWG+iU5Ol3ftSLOFqpcdeM1bvXHzN/19pGadpnwmY326qwyjTyCLk9CJexaJ6
	/RYdNNsrO2UIri5E+BAtws7Z91WTs/7xdpmYT2KC2avx8csvUBi9frLDPFUlZAecO3HQiB7+e+DT3
	AsMEl1x58ROD7+TZSJv76o4Jyh8gZB8FTNOXjOZAsZOhVLsPXU5ll6ubMmnL2anPGdTz6a4TAM9Y0
	1nHJFpQmtFZlTyd6tLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCckK-004UYJ-26;
	Mon, 11 Dec 2023 09:38:40 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCckD-004UX7-2J
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 09:38:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3733424DC13;
	Mon, 11 Dec 2023 17:38:04 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 17:38:03 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 17:38:03 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Mon, 11 Dec 2023 17:38:03 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Shengyu Qu <wiagn233@outlook.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
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
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org"
	<drew@beagleboard.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Topic: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Thread-Index: AQHaJFAfN2r53q/6u0mikZZoJRWxOLCez+mAgASMRMD//+TAgIAAoXXw
Date: Mon, 11 Dec 2023 09:38:03 +0000
Message-ID: <b3690246eb1e48428238ceb26b046297@EXMBX066.cuchost.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
 <TY3P286MB2611F70A3D61788E556C8A30988AA@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <358bcdb3f0ab4a7b9d6bbe17ca1a696d@EXMBX066.cuchost.com>
 <20231211-submerge-vegan-244889f1751c@wendy>
In-Reply-To: <20231211-submerge-vegan-244889f1751c@wendy>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_013834_204983_1DC22F3B 
X-CRM114-Status: GOOD (  13.27  )
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
> From: Conor Dooley <conor.dooley@microchip.com>
> Sent: Monday, December 11, 2023 3:59 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: Shengyu Qu <wiagn233@outlook.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org;
> devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100 device tree
> 
> On Mon, Dec 11, 2023 at 01:38:06AM +0000, JeeHeng Sia wrote:
> >
> > > From: Shengyu Qu <wiagn233@outlook.com>
> > > Sent: Friday, December 8, 2023 8:09 PM
> 
> > > Does the dubhe-80 cores actually support vector? Or vector support
> > >
> > > doesn't exist on actual silicon?
> 
> > We don't have a use case for vector application in JH8100
> 
> I am sorry, but I am not clear on what this means. Do the CPUs on
> the JH8100 support vector or not?
The JH8100 CPU does not support vector operation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

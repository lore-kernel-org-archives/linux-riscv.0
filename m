Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512F0C46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0Dd/Z99k8iF7/jNBOQGxGyb6jFzAq8ZMEJY9yJNNOg=; b=T5sWxp3b1btDAw
	+W9DRMypGa72/r3BrVj01cJ2LlewQhgwz4Tg/tNwbdIKBaEtJaobT7PK8FPuo8TQXzEQSQrg0Wk10
	C1NWVvGn0hoMaYvVaxXpjI020bQsmJbdW4H5w59JT9PbgFvXQNAqFnjlrAqsRg0UcDttDExFf22eG
	FKKWR1+KWzri8CCwHCXV0L3B1dVTqNr2MN34noCMtrar4pY5SeqyxiL96T+RCnj4JBvg+3atdRet0
	E5xqZRSTPtFRsN1QscxaI7kFRInAx+5mN1t01N/2tnU3HaHHDO59aW/+x6DpK47kHyL4rMc1+/A4O
	wqkK9eTCahBpmD5vq6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRgL-00EOfs-1k;
	Wed, 27 Dec 2023 11:02:37 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRgG-00EOcS-28
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 11:02:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9C8707FDC;
	Wed, 27 Dec 2023 19:02:06 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Dec
 2023 19:02:06 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Dec
 2023 19:02:06 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 27 Dec 2023 19:02:05 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [RFC 16/16] riscv: dts: starfive: jh8100: Add clocks and resets
 nodes
Thread-Topic: [RFC 16/16] riscv: dts: starfive: jh8100: Add clocks and resets
 nodes
Thread-Index: AQHaN74UwHfI31bNP0eqUuemefaENrC7DBgAgAHpxDA=
Date: Wed, 27 Dec 2023 11:02:05 +0000
Message-ID: <86603ac21f3e4c28ba5d727245bc6657@EXMBX066.cuchost.com>
References: <20231226053848.25089-1-jeeheng.sia@starfivetech.com>
 <20231226053848.25089-17-jeeheng.sia@starfivetech.com>
 <bc6b5c5e-9396-4740-af99-1eda4275526b@linaro.org>
In-Reply-To: <bc6b5c5e-9396-4740-af99-1eda4275526b@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_030233_039603_83B7D09D 
X-CRM114-Status: GOOD (  16.27  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Tuesday, December 26, 2023 9:39 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [RFC 16/16] riscv: dts: starfive: jh8100: Add clocks and resets nodes
> 
> On 26/12/2023 06:38, Sia Jee Heng wrote:
> > Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
> > nodes for JH8100 RISC-V SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> 
> ...
> 
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;
> > @@ -357,6 +563,99 @@ uart4: serial@121a0000  {
> >  			status = "disabled";
> >  		};
> >
> > +		necrg: necrg@12320000 {
> 
> This is a friendly reminder during the review process.
Thank you for the friendly reminder and your valuable feedback.
I appreciate your guidance during the review process.
Your input is crucial, and I'm committed to delivering high-quality code.
Thanks again for your time and feedback. 
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
I didn't ignore your comment. Instead, I misinterpreted it as suggesting
the use of a dash instead of an underscore for the node's name. I will make
the necessary adjustment and change it back to 'clock-controller'.
> 
> Thank you.
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

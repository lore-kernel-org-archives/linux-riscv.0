Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416B3C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXE9/byYDCF9xeLERuY4C67MDP/QeNesHp2XUn3+YYo=; b=reO0atVhYjHN48
	nhwIk+sNq0cHFe/bs7sBsz5xznHbB6oysUseTPUpt1uxTC0dV8IiLeWvFjl3pJyAQcDjJZ+7pry2P
	QQ92hBWviPIRji7SCAfucefCId8ui6U5+g4oOGbsEbELud5Ev6Ft6pdkUIaOsGSYBtidzw9MisDes
	r24urKWsc1j+J1WK6EibRaLQ2kXrCT2YWsjTLQzL68d5C95p2x2SnJWcpr9ybo96boRaBqw4Abc53
	TSI+x0BqgHEUhV2pDR7Bt6C//1LSRAZX+zd+QaSFw6XbZOGAMGIEmxAgpYRuiYWrccj/9dRSvF9gs
	IWPVs46+yqyWXfvFVUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRpcp-000EsX-AM; Tue, 14 Feb 2023 07:21:15 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRpTf-000AL2-Go
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 07:11:50 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 411AD24E39A;
	Tue, 14 Feb 2023 15:11:03 +0800 (CST)
Received: from EXMBX164.cuchost.com (172.16.7.74) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Feb
 2023 15:11:03 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX164.cuchost.com
 (172.16.6.74) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 14 Feb
 2023 15:11:02 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Tue, 14 Feb 2023 15:11:02 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Christoph Hellwig <hch@infradead.org>, Herbert Xu
	<herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Thread-Topic: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Thread-Index: AQHZNMIM/vLXVq3JgUiER7vBRC/T367F3jsAgACIQGD//3/YAIAHoM+AgACWCMA=
Date: Tue, 14 Feb 2023 07:11:02 +0000
Message-ID: <d3ca1ec350d2442fb71eb006f8b57c45@EXMBX168.cuchost.com>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
 <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
 <88a62a7a11814d629e2198583a0349b6@EXMBX168.cuchost.com>
 <Y+TARjfzt2FMG6oJ@gondor.apana.org.au> <Y+smaRL9f7g9RWEB@infradead.org>
In-Reply-To: <Y+smaRL9f7g9RWEB@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.105.77]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_231147_750264_E1763D27 
X-CRM114-Status: GOOD (  20.77  )
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
> From: Christoph Hellwig <hch@infradead.org>
> Sent: 14 February, 2023 2:13 PM
> To: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: JiaJie Ho <jiajie.ho@starfivetech.com>; David S . Miller
> <davem@davemloft.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner Berthing
> <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>; linux-
> crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
> 
> On Thu, Feb 09, 2023 at 05:43:34PM +0800, Herbert Xu wrote:
> > On Thu, Feb 09, 2023 at 09:33:06AM +0000, JiaJie Ho wrote:
> > >
> > > The DMA can only support 32-bit addressing.
> > > So, I am copying everything in case kernel allocated memory region >32-
> bit for a user app.
> >
> > Does your hardware support scatter-and-gather? If so you should at
> > least allocate individual pages rather than one contiguous buffer.
> >
> > Then you can allocate them on-demand rather than before-hand.
> >
> > It would also be nice to not do the copy if the input you were given
> > was in low memory (and contiguous if your hardware doesn't do SG).
> 
> All of that is done by the DMA API, or more specifically swiotlb and does not
> need to be duplicated in individual drivers.

I'll update the driver accordingly.
Thanks Christoph and Herbert for the pointers.

Regards
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

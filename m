Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5295DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sepANtnZKRDh2+3CedPzvXy23ZowMw0fzWnhIfh9zrk=; b=sM5srRR91iOGL+
	W5QyuNvAC77stjLheUkTkodEKapm3Ch35/1p7JM4j2YmCWTKb6m+i0C0Y3kr0Dq/1J/xKvSWbyCMl
	P0wqnRTDoJziB0+38d9ubioCV3F0iRCSUokewogMv2G5rxGwOkrF5De2lZu1VqjwUdmpOyo7EolyU
	Ol6ZosLo/2aHpniM5liUh4wdOTK1H51nIhtE+1Dai24TQ5kGOvFnBvYsJ5BfQ0plw26H2UF/4657j
	2IxjU0BhpgzBRyn26fyv3wOPlG+ENzCH5dcmdo6mY390tcIHbMO9nOkvb2NRU3fpXYL1NP7kPDoP7
	k8VY5XMLwWrppSqyTW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DSL-00B8yL-Py; Thu, 08 Dec 2022 09:44:41 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DJb-00AyRM-Jw
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:35:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 67B0E24DD6E;
	Thu,  8 Dec 2022 17:35:11 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 17:35:11 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 8 Dec 2022 17:35:10 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
Thread-Topic: [PATCH 0/6] crypto: starfive: Add driver for cryptographic
 engine
Thread-Index: AQHZBH/pPWRKQfsetk2izJkM4PGjPq5jvsYw//+A4ICAAIfRMA==
Date: Thu, 8 Dec 2022 09:35:10 +0000
Message-ID: <a0bd9060bab348eba1044cd911653bd7@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <e1e9f1d19982493b89ae63f51e00a3bb@EXMBX068.cuchost.com>
 <9c7066e4-fa3f-3dda-b939-04dfdaf73242@linaro.org>
In-Reply-To: <9c7066e4-fa3f-3dda-b939-04dfdaf73242@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.158.8]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_013540_012646_326600C3 
X-CRM114-Status: GOOD (  11.90  )
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
> Sent: Thursday, December 8, 2022 5:28 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; David S . Miller <davem@davemloft.net>;
> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
> 
> On 08/12/2022 10:09, JiaJie Ho wrote:
> >
> > Hi Herbert/David,
> >
> > Could you please help to review and provide comments on this patch series?
> > Thank you in advance.
> 
> You received some comments so the expectation is to send a v2.
> 

Sure, I'll do that then.

Thanks
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

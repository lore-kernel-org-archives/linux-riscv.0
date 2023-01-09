Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2D4C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 04:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+djj/MaIJRZSQi3vmsHoWEFajK/SZOEetq2iLPVkufI=; b=N/3vc0CPHR2ShZ
	pgzeEI6biDFAhqstbuno0/gmEgw0nEjKBkuAcjkHQntxBenKzDW4tRmkRfAkkeAcoKhhUxsKG/U3s
	5F75GJYsoA/nPqR1+dQ0+194s8ctTqw5HwaVkkEaAXo2vm6mZsTrJnP++Xs+V27cqsZcbjLT+BdGf
	TKFVfiC0UFHHIXxJjGE/XJKA7ktjBZpuJmQ3xkWg4N1qzntYaR8YrcRS3rhveck3q5179Q4AuHA5+
	UmhTLen3f3mYybOBUSUC5Z1VhFi7I3Jf8YqV/Y0uBt219FfPt6Vgww+EoNKDtl2TVCyhKZj+vOVjZ
	dYaChVnslwW+3OR1xFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEjrC-00HLOq-Aq; Mon, 09 Jan 2023 04:33:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEjr8-00HLIx-Fw
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 04:33:57 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9D36224DFF7;
	Mon,  9 Jan 2023 12:33:27 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 12:33:27 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 12:33:27 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Mon, 9 Jan 2023 12:33:27 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Thread-Topic: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive
 SoC
Thread-Index: AQHZGoveBWEVWeSp5UqGtlmGFQKs8K6QmY4AgATZceD//3/RgIAAj3Zg//+ATgCAAIa+sA==
Date: Mon, 9 Jan 2023 04:33:26 +0000
Message-ID: <ea5aecd72cd24670a85d9cf04f5ee71e@EXMBX168.cuchost.com>
References: <20221228071103.91797-1-jiajie.ho@starfivetech.com>
 <20221228071103.91797-3-jiajie.ho@starfivetech.com>
 <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
 <7c2cc6e9cdf241318fc73162a5ec221d@EXMBX168.cuchost.com>
 <Y7uEGxl8xJ1xxkKZ@gondor.apana.org.au>
 <e0c9944151b24e848af55221a4388301@EXMBX168.cuchost.com>
 <Y7uRVNvplGjrZxa4@gondor.apana.org.au>
In-Reply-To: <Y7uRVNvplGjrZxa4@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.108.220]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_203354_911839_7EFC6F41 
X-CRM114-Status: GOOD (  14.87  )
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
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Sent: 9 January, 2023 12:00 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Olivia Mackall <olivia@selenic.com>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive
> SoC
> 
> On Mon, Jan 09, 2023 at 03:41:14AM +0000, JiaJie Ho wrote:
> >
> > The average wait time is around 20 microseconds.
> > I measured from writel cmd to wait_for_completion done.
> 
> Do you know of an upper bound? E.g., if we limit it to 40us how many
> requests would fail on average?
> 

I don't have the upper bound. 
I ran the rngtest with 1000 blocks, none of the wait time exceeded 30us.

> Having a maximum delay of 40us would be OK with wait == 0.  So you could
> implement it in a way such that if the wait time exceeded 40us then you
> return if wait == 0, otherwise you can wait longer.
> 

I'll do this then.

Thanks
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

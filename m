Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B15EC54EBC
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 02:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qt96rm49lz7jH6hS5/aIfN4mx570Na/fhI3j/XxeKCU=; b=YKPPXhhKZe8drf
	9MoLVYQyjpva9RQrrF0dSxXSaYUwqzztA7Iv9VNcgKBHTSl+mrDQhJ2tMuiUJHJXoTueMJ/0XFNel
	J5qhq5Ks0RXOxLUOLNuB6vi1Tc6OD3BFOr9EHzoou3rDgjcDruN/VAZ1hzMDmEXH3osgvbx9Thzn2
	+MSXd1YTPW/d70/q7b9W38/AbsUkpKRUcKyj5joBX4nnNQdqBKEr0VzUXYlNs5Et/+sdJv6r+vw2t
	ufeAwwMsUDU5dO92Ek/N3D+4PuCIghHdftlnbkhiXrKuqv3cYZmfI6RopL9+SrIHypxE53FPRtBFp
	1aBuE/BsoE7yl+9CBydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEiNB-00Gxp4-2D; Mon, 09 Jan 2023 02:58:53 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEiN5-00Gxmr-VD
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 02:58:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AD34324E161;
	Mon,  9 Jan 2023 10:58:14 +0800 (CST)
Received: from EXMBX064.cuchost.com (172.16.6.64) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 10:58:14 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX064.cuchost.com
 (172.16.6.64) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 10:58:14 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Mon, 9 Jan 2023 10:58:14 +0800
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
Thread-Index: AQHZGoveBWEVWeSp5UqGtlmGFQKs8K6QmY4AgATZceA=
Date: Mon, 9 Jan 2023 02:58:14 +0000
Message-ID: <7c2cc6e9cdf241318fc73162a5ec221d@EXMBX168.cuchost.com>
References: <20221228071103.91797-1-jiajie.ho@starfivetech.com>
 <20221228071103.91797-3-jiajie.ho@starfivetech.com>
 <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
In-Reply-To: <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.108.220]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_185848_194163_96A90E04 
X-CRM114-Status: GOOD (  12.10  )
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
> Sent: 6 January, 2023 4:39 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Olivia Mackall <olivia@selenic.com>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive
> SoC
> 
> On Wed, Dec 28, 2022 at 03:11:02PM +0800, Jia Jie Ho wrote:
> > +static int starfive_trng_read(struct hwrng *rng, void *buf, size_t
> > +max, bool wait)
> 
> You should respect the wait argument and not do polling/sleeping if it is false.
> 

Hi Herbert, 

My trng device requires sending a generate new number cmd before each read.
It then only populates the data registers with new random number and raise an interrupt when ready.
If user choose to not wait, they will always get stale bits. 
Is it okay to always return error if wait=false ?

Thanks
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

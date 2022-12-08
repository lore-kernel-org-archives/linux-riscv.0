Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A986C63705
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8T8OsXInoTH6cU1CNlYHgYw53B8H9LgjorUt5rmqSI=; b=r+SaHp6dnD4eVe
	pOlTNcRBrZ1PA4YcUrP+FCKUB0I8MTWL3MparEfBNdYG31+PmnVSp+gprWFH7EBTU65UCDubbQRet
	Iu6UWvx52I2Y9b/2SpxkjjvAnIE2+fWSWH12Xe7namcn/HTxLF3vBr+rza//H+nW1PtQKfQIzTu+L
	K5/PfVfXwbGZ9VSHw38YU1N8xL+JlbZ4ikQ6Fs5m/GKdlYEF3NO4xIyudEZFKUqkF/0pO1GwIQ/3s
	mISHlRwUBoToGD+fTz1YMefN/3TsEBXJ3EQB12v5PSQbDG1PUAQJG6Xo4CFV8MsQom7AKZxnsfEbP
	2uIbmeH8np+omwSdXREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DBP-00ArAX-Mg; Thu, 08 Dec 2022 09:27:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cv0-00AeZm-2c
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 09:10:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0CB9A24DFD7;
	Thu,  8 Dec 2022 17:09:47 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 17:09:47 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 17:09:46 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 8 Dec 2022 17:09:46 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
Thread-Topic: [PATCH 0/6] crypto: starfive: Add driver for cryptographic
 engine
Thread-Index: AQHZBH/pPWRKQfsetk2izJkM4PGjPq5jvsYw
Date: Thu, 8 Dec 2022 09:09:46 +0000
Message-ID: <e1e9f1d19982493b89ae63f51e00a3bb@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
In-Reply-To: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_011014_511824_14BF4384 
X-CRM114-Status: GOOD (  15.31  )
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
> From: JiaJie Ho <jiajie.ho@starfivetech.com>
> Sent: Wednesday, November 30, 2022 1:52 PM
> To: Herbert Xu <herbert@gondor.apana.org.au>; David S . Miller
> <davem@davemloft.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org; JiaJie Ho
> <jiajie.ho@starfivetech.com>
> Subject: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
> 
> This patch series adds kernel driver support for Starfive crypto engine.
> The engine supports hardware acceleration for HMAC/hash functions, AES
> block cipher operations and RSA. The first patch adds basic driver for device
> probe and DMA init. The subsequent patches adds supported crypto
> primitives to the driver which include hash functions, AES and RSA. Patch 5
> adds documentation to describe device tree bindings and the last patch adds
> device node to VisionFive 2 dts.
> 
> The driver has been tested with crypto selftest and additional test.
> 
> This patch series depends on the following patches:
> https://patchwork.kernel.org/project/linux-
> riscv/cover/20221118010627.70576-1-hal.feng@starfivetech.com/
> https://patchwork.kernel.org/project/linux-
> riscv/cover/20221118011714.70877-1-hal.feng@starfivetech.com/
> 
> Jia Jie Ho (6):
>   crypto: starfive - Add StarFive crypto engine support
>   crypto: starfive - Add hash and HMAC support
>   crypto: starfive - Add AES skcipher and aead support
>   crypto: starfive - Add Public Key algo support
>   dt-bindings: crypto: Add bindings for Starfive crypto driver
>   riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
> 

Hi Herbert/David,

Could you please help to review and provide comments on this patch series?
Thank you in advance.

Best regards,
Jia Jie 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

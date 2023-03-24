Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0621C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 04:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkZhbA6Z6CzTZNvfXLT0VmyXJvvInvgTJ2oBPVz1vH8=; b=FGhG85EcEhXQ9c
	6b154VrxhkTLFvP5Qf5g/ngXG6QwCVxX1mSJPDEmKxnaoAebIbEj9QQ6zhL7J31ST27fzOt43vjgm
	aeySsHG01ZdnwInbv7lprh97qNyaUST38qxlD/0wZLaYpyHtwbo48yWhCqdVb15D/Cxze/1V6rROL
	gVoytN+cyb9aHmJnwDDwvYrvA+dup96qZht95uoKHJQbLJaLa2z0l8ClDhpLh+sBWv4hKGQ7VsygS
	G7nuU+PaxPL0AL7d6Zo8GfO+JURQHrIJ6xjP0CfppWTzJRfPQjwUyuA05SOPitrSZ9a7jEsJk/ySU
	9UztodVGTPuMlNBqxLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfZPn-003XCP-1w;
	Fri, 24 Mar 2023 04:52:35 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfZPi-003XAn-32
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 04:52:33 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9EEBD24DBFD;
	Fri, 24 Mar 2023 12:51:43 +0800 (CST)
Received: from EXMBX163.cuchost.com (172.16.7.73) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 12:51:43 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX163.cuchost.com
 (172.16.6.73) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 12:51:43 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Fri, 24 Mar 2023 12:51:43 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 0/4] crypto: starfive - Add drivers for crypto engine
Thread-Topic: [PATCH v3 0/4] crypto: starfive - Add drivers for crypto engine
Thread-Index: AQHZVbQGpGqpyyNhMUOCrVA7ceGTta8JaAiQ
Date: Fri, 24 Mar 2023 04:51:43 +0000
Message-ID: <734f3a559d28408fa5b95ade203626f2@EXMBX168.cuchost.com>
References: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
In-Reply-To: <20230313135646.2077707-1-jiajie.ho@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.105.77]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_215231_445727_CBBFF342 
X-CRM114-Status: GOOD (  20.71  )
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
> From: Jia Jie Ho <jiajie.ho@starfivetech.com>
> Sent: 13 March, 2023 9:57 PM
> To: Herbert Xu <herbert@gondor.apana.org.au>; David S . Miller
> <davem@davemloft.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner Berthing
> <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: [PATCH v3 0/4] crypto: starfive - Add drivers for crypto engine
> 
> This patch series adds kernel driver support for StarFive JH7110 crypto engine.
> The first patch adds Documentations for the device and Patch 2 adds device
> probe and DMA init for the module. Patch 3 adds crypto and DMA dts node
> for VisionFive 2 board. Patch 4 adds hash/hmac support to the module.
> 
> Patch 3 needs to be applied on top of:
> https://patchwork.kernel.org/project/linux-
> riscv/patch/20230221024645.127922-18-hal.feng@starfivetech.com/
> https://patchwork.kernel.org/project/linux-
> riscv/cover/20230120024445.244345-1-xingyu.wu@starfivetech.com/
> 
> Changes v2->v3:
> - Only implement digest and use fallback for other ops (Herbert)
> - Use interrupt instead of polling for hash complete (Herbert)
> - Remove manual data copy from out-of-bound memory location as it will
>   be handled by DMA API. (Christoph & Herbert)
> 
> Changes v1->v2:
> - Fixed yaml filename and format (Krzysztof)
> - Removed unnecessary property names in yaml (Krzysztof)
> - Moved of_device_id table close to usage (Krzysztof)
> - Use dev_err_probe for error returns (Krzysztof)
> - Dropped redundant readl and writel wrappers (Krzysztof)
> - Updated commit signed offs (Conor)
> - Dropped redundant node in dts, module set to on in dtsi (Conor)
> 
> Jia Jie Ho (4):
>   dt-bindings: crypto: Add StarFive crypto module
>   crypto: starfive - Add crypto engine support
>   riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
>   crypto: starfive - Add hash and HMAC support
> 
>  .../crypto/starfive,jh7110-crypto.yaml        |   70 ++
>  MAINTAINERS                                   |    7 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   28 +
>  drivers/crypto/Kconfig                        |    1 +
>  drivers/crypto/Makefile                       |    1 +
>  drivers/crypto/starfive/Kconfig               |   21 +
>  drivers/crypto/starfive/Makefile              |    4 +
>  drivers/crypto/starfive/jh7110-cryp.c         |  239 ++++
>  drivers/crypto/starfive/jh7110-cryp.h         |  134 +++
>  drivers/crypto/starfive/jh7110-hash.c         | 1041 +++++++++++++++++
>  10 files changed, 1546 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
>  create mode 100644 drivers/crypto/starfive/Kconfig  create mode 100644
> drivers/crypto/starfive/Makefile  create mode 100644
> drivers/crypto/starfive/jh7110-cryp.c
>  create mode 100644 drivers/crypto/starfive/jh7110-cryp.h
>  create mode 100644 drivers/crypto/starfive/jh7110-hash.c
> 
> --
> 2.25.1


Hi Herbert/David,

Could you please help review this patch series?
Thanks in advance.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

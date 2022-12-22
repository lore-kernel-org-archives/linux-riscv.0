Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D12C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4W2nWhiXP5wLfV7DbZEikIRgds3jMRDjE36cbTBlA4=; b=nRfClCgCpy2DqS
	re/BNY/56ykAoRzwezZoPyz3Pzoo7RmQ1MYaXEdmTztVIwpk/4a+u+kL9qdl3kHTnrRWMKa1pF4Gg
	EkyVJyUuzMTRrIeB3GdrdUpqIMg66L3XsV9Is/p79WUSJ36CF0CLVn6L5gwuBLWRLrk+TXDOzrXMr
	QoljvnYDvxUBCVSf2EpYzX7ndApn8QPDwR/+fhmVdHH7PgVAEMbybPbQoYtTklMTDekJKnD4aTuCs
	zvXj/bmSuZXqwW9R4KV09A9BTtFtIU3hLST+TqVkp6scLhp6bin4qy0Ru+NnNDvGz5rHmJ8XknZ92
	8uNY2osLzRv2F9n0GAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Ghc-008qD3-Fo; Thu, 22 Dec 2022 08:13:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8GhS-008q6O-Dc
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 08:13:12 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9C3D324E342;
	Thu, 22 Dec 2022 16:12:44 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 22 Dec
 2022 16:12:44 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Thu, 22 Dec 2022 16:12:44 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Olivia Mackall
	<olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley
	<conor.dooley@microchip.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 1/3] dt-bindings: rng: Add StarFive TRNG module
Thread-Topic: [PATCH 1/3] dt-bindings: rng: Add StarFive TRNG module
Thread-Index: AQHZFRxUoXQEQibksUW9iWQOWN1q6q53kkEAgAH9dkA=
Date: Thu, 22 Dec 2022 08:12:44 +0000
Message-ID: <3fe5be6168b94f62b2c9ce078e5e954a@EXMBX168.cuchost.com>
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-2-jiajie.ho@starfivetech.com>
 <3a26c733-6573-5954-f4e5-8a1f8abba140@linaro.org>
In-Reply-To: <3a26c733-6573-5954-f4e5-8a1f8abba140@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.229.243]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_001310_807403_228DEA6C 
X-CRM114-Status: GOOD (  12.43  )
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
> Sent: Wednesday, December 21, 2022 5:48 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Olivia Mackall
> <olivia@selenic.com>; Herbert Xu <herbert@gondor.apana.org.au>; Rob
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Emil Renner Berthing <kernel@esmil.dk>; Conor Dooley
> <conor.dooley@microchip.com>; linux-crypto@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org
> Subject: Re: [PATCH 1/3] dt-bindings: rng: Add StarFive TRNG module
> 
> On 21/12/2022 10:08, Jia Jie Ho wrote:
> > Add documentation to describe Starfive true random number generator
> > module.
> >
> > Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > ---
> >  .../bindings/rng/starfive,jh7110-trng.yaml    | 55 +++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> >
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
Hi Krzysztof,

Thank you for spending time reviewing this patch.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

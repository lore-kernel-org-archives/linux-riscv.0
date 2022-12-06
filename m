Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B117C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 03:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOrDePTb8T4YUEMaD9Bdl+KJCFiPll/QOw0j/6j34Ts=; b=nVr+GP3fAP+4Tw
	pmhZEpmfx3yuToPRNNQdBBzA935C0OyWhN7Ip36NotehRxSNj4qvaFQAsxSnO/Hn1c1U/DUKNt/wj
	bSHQ7xCur5KFeWsmps9XO1Yzhk/tyJGUh+K0dgpBqvXrzrzg2rmcsorBPMsBf8sTAHR/dUwJzwbMv
	4sTOlYGRUqU3lw7iv7xFZaRq80g4sMkUOz1dFArFPDGHnkfOuqAXB3Zb2OtdWtFhv9sDTWjAZLyjp
	aGkLBOUyDI02VFaoxlLNbgzViUrAbwQV/Isc79MnBQPP9ottSC76NUwnaq7Ohxey/D1KXByLsMFIy
	a6habPk1ryBTUM2FicMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Oxt-00GyjY-OJ; Tue, 06 Dec 2022 03:49:53 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Oxo-00GyZf-OM
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 03:49:51 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B4A9A24DBE9;
	Tue,  6 Dec 2022 11:48:52 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Dec
 2022 11:48:52 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Tue, 6 Dec 2022 11:48:52 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>
Subject: RE: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
 driver
Thread-Topic: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive
 crypto driver
Thread-Index: AQHZBH/2P5dLP9b8iUC7OZp9LCFzsa5W9X0AgAlLclA=
Date: Tue, 6 Dec 2022 03:48:52 +0000
Message-ID: <14a3facb1fe642cba0048f2f2d0eb2e9@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
 <166981596611.1846501.537832446745968339.robh@kernel.org>
In-Reply-To: <166981596611.1846501.537832446745968339.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_194949_111409_1DA6136E 
X-CRM114-Status: GOOD (  16.94  )
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
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, November 30, 2022 9:48 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: linux-crypto@vger.kernel.org; linux-riscv@lists.infradead.org; Rob
> Herring <robh+dt@kernel.org>; Herbert Xu
> <herbert@gondor.apana.org.au>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; David S . Miller <davem@davemloft.net>
> Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
> driver
> 
> 
> On Wed, 30 Nov 2022 13:52:13 +0800, Jia Jie Ho wrote:
> > Add documentation to describe Starfive crypto driver bindings.
> >
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > ---
> >  .../bindings/crypto/starfive-crypto.yaml      | 109 ++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> >
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/crypto/starfive-
> crypto.example.dts:21:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No
> such file or directory
>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:406:
> Documentation/devicetree/bindings/crypto/starfive-crypto.example.dtb]
> Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-
> bindings/patch/20221130055214.2416888-6-jiajie.ho@starfivetech.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 

Hi Rob Herring,

The #include in example have dependencies on the following patches:
https://patchwork.kernel.org/project/linux-riscv/cover/20221118010627.70576-1-hal.feng@starfivetech.com/
https://patchwork.kernel.org/project/linux-riscv/cover/20221118011714.70877-1-hal.feng@starfivetech.com/
I've noted them in the cover letter.
How do I add them in this patch?

Thanks,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

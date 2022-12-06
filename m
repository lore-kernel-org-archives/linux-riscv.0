Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0074C47090
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQlM2hWQv8iAWlPLu4VKZsxl3HoECCTgjbI63jpOcOs=; b=dcnY4Sqfg4x6fH
	1ulbUC2kVepKc8ikHJc26St6QnIXnPGwDfojAJ3nSMgAdtEWoP40qAFkxpo7JKwNT/j70F7BogqYX
	oIozWf9imKhSf6hXosxD3uTk019wvLldoy0hXiWEJ2oESyH2bKikVgATFD9uxd2Qq/ACnJSuy5haJ
	AIYPKUO0vW/kV8ccen6VvBMU9xcpYD1aCmXU6Qc40Ujuyxg1VYvdYY+jqDnCSnJ30cKQJzV+3i5E/
	zVGSeq2s/q7xusmKG/TMIbv5SEaI63jjsXT8/zdbEwpJPgVW74e+tzbbbW+J30BUfLd4gQeaXGPxM
	1BXaGGD2KO0fzgh18lDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TNo-004uK6-SM; Tue, 06 Dec 2022 08:32:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TNk-004u8L-3W
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 08:32:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3CCF724E277;
	Tue,  6 Dec 2022 16:32:39 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Dec
 2022 16:32:39 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Tue, 6 Dec 2022 16:32:39 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>
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
Thread-Index: AQHZBH/2P5dLP9b8iUC7OZp9LCFzsa5W9X0AgAlLclD//8izgIAAh0AA
Date: Tue, 6 Dec 2022 08:32:38 +0000
Message-ID: <15fcb91a5214438fb69535bcf2df576e@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
 <166981596611.1846501.537832446745968339.robh@kernel.org>
 <14a3facb1fe642cba0048f2f2d0eb2e9@EXMBX068.cuchost.com>
 <0a2056f9-0126-4dd7-55fa-930ce61e2e81@linaro.org>
In-Reply-To: <0a2056f9-0126-4dd7-55fa-930ce61e2e81@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_003252_451259_2C3F6A0D 
X-CRM114-Status: GOOD (  15.93  )
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
> Sent: Tuesday, December 6, 2022 4:26 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Rob Herring <robh@kernel.org>
> Cc: linux-crypto@vger.kernel.org; linux-riscv@lists.infradead.org; Rob
> Herring <robh+dt@kernel.org>; Herbert Xu
> <herbert@gondor.apana.org.au>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; David S . Miller <davem@davemloft.net>
> Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
> driver
> 
> On 06/12/2022 04:48, JiaJie Ho wrote:
> >
> >
> > The #include in example have dependencies on the following patches:
> > https://patchwork.kernel.org/project/linux-riscv/cover/20221118010627.
> > 70576-1-hal.feng@starfivetech.com/
> > https://patchwork.kernel.org/project/linux-riscv/cover/20221118011714.
> > 70877-1-hal.feng@starfivetech.com/
> > I've noted them in the cover letter.
> > How do I add them in this patch?
> 
> You cannot. Testing bot does not take dependencies, so it did not have
> above clock IDs. This also should point your attention that if crypto
> maintainers pick up this patch, they also won't have the clock IDs so their tree
> will have such failure as well.
> 
> You can wait with your patch till dependency hits mainline or you can just
> replace clock IDs with numbers and drop the header (and later you can
> correct the example if needed... or leave it as is).
> 
I'll replace the IDs and drop the header then.
Thanks.

Regards,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

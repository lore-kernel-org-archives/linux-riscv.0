Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EF6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 06:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGpmSoe87sl3f9mAir0jqd+/zXsozOjwYImXV2ACjIw=; b=bLpNmKtLE24cUh
	saoL9mnU+gOv0IDzsQLhtZHsTyYTXwYujd3S/jetVtDZkKcV5u9gkxYST9eH3skq6lnsJxymt22dm
	j5g8YzQJJrV7QJJNxRmLx9NtVL5T1CTzo4Zt0gFL39sAHWiqW/nZjVUtQ1O191nQZ6KESyU5tDZwy
	Ru46JZS02/+I6d4+l1OtKqQWsjQLPRKd3gozETBOAHbIsL0uJ232vETY1KYYj4ZnIqMC9Zy8kRbDb
	Jvosu/FK6d8GMVSmFlPVFRQWWcmajNO4YkjSkhvytXwf7YAW2Vngc9W8fBoFAcbgWdO4PxtVVArzc
	02Yrx3Q2vvCSjhTCFLYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yqO-00BfRk-Ck; Tue, 13 Dec 2022 06:32:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yqK-00Bevp-OA
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 06:32:47 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A1A0424E023;
	Tue, 13 Dec 2022 14:32:07 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Dec
 2022 14:32:07 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Dec
 2022 14:32:07 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Tue, 13 Dec 2022 14:32:07 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
Thread-Topic: [PATCH 0/6] crypto: starfive: Add driver for cryptographic
 engine
Thread-Index: AQHZBH/pPWRKQfsetk2izJkM4PGjPq5jvsYw//+A4ICAAIfRMIAHH2GAgACIHJA=
Date: Tue, 13 Dec 2022 06:32:07 +0000
Message-ID: <8680f0d88b1046d1b554825651ed21c1@EXMBX068.cuchost.com>
References: <a0bd9060bab348eba1044cd911653bd7@EXMBX068.cuchost.com>
 <mhng-181c038e-a986-4dac-9745-9405d6814c84@palmer-ri-x1c9>
In-Reply-To: <mhng-181c038e-a986-4dac-9745-9405d6814c84@palmer-ri-x1c9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_223244_984669_C4D69E8E 
X-CRM114-Status: GOOD (  12.62  )
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
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: Tuesday, December 13, 2022 2:20 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: krzysztof.kozlowski@linaro.org; herbert@gondor.apana.org.au;
> davem@davemloft.net; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; linux-crypto@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org
> Subject: RE: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
> 
> >>
> >> You received some comments so the expectation is to send a v2.
> >>
> >
> > Sure, I'll do that then.
> 
> Not sure if I missed it, but I can't find a v2.

Hi Palmer,

I'm still working on the patches.  I'll send them out soon.

Thanks,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

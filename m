Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BD5C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7G0L3HcIiRukiVtN6Prg7q0zUUrt1Q1ef93N0HVkM0=; b=CPGgWych4tdkhy
	CbwZX6ZG4wWXYYVjhbEg2zrsf/T6ieno6xTJWCS398taffA3viNl1Nz+hpMmmSZC71jc861FPQUdA
	acECQuKZ9zBNcH7q8Kc7W684Dxw58z8/E/aZV9Au2MsAvzGSAeTx8LMq9rBDZrRsXVS9rCdCn7T1Z
	X6vNVoCwoIqjddxvvBwIdpHV8E+f4JEaVT+NpLswSHvKqw2op5AodvMCiJgrHC6kL9WOAJeWnJjjf
	ZtqiINbqzYl7LV4yvE9OTkXT7KcVTmPL8N52EN64ZJ6q4YKOIhKRSOzvwz+mMHF7H9p1UmPl1P99U
	1DPU/LVIOLCMVyU/vhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0g6z-006RIR-EO; Thu, 01 Dec 2022 09:44:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0g6w-006RE0-8o
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:44:08 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 65BF924E161;
	Thu,  1 Dec 2022 17:43:42 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:43:42 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:43:42 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 1 Dec 2022 17:43:42 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine support
Thread-Topic: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine
 support
Thread-Index: AQHZBH/rqnMRzesHF0+7VtyEEKwoza5W7JSAgAGlN8D//62vgIAAiNrQ
Date: Thu, 1 Dec 2022 09:43:42 +0000
Message-ID: <291d6d792df648afa9033e7fe8c7a0f4@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-2-jiajie.ho@starfivetech.com>
 <aafb1c32-bc00-2db2-edbd-aa4771f33ac7@linaro.org>
 <60ad0da0116044d3a1fe575e9904e22c@EXMBX068.cuchost.com>
 <6028b265-bc8a-3a06-b17c-56aa772a4782@linaro.org>
In-Reply-To: <6028b265-bc8a-3a06-b17c-56aa772a4782@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_014406_597907_AF75D17C 
X-CRM114-Status: GOOD (  17.17  )
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
> Sent: Thursday, December 1, 2022 5:29 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; David S . Miller <davem@davemloft.net>;
> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine
> support
> 
> On 01/12/2022 07:52, JiaJie Ho wrote:
> 
> >>> +
> >>> +static inline u32 starfive_sec_read(struct starfive_sec_dev *sdev,
> >>> +u32 offset) {
> >>> +	return __raw_readl(sdev->io_base + offset);
> >>
> >> I don't think these read/write wrappers help anyhow...
> >>
> >
> > These wrappers are used by the crypto primitives in this patch series.
> > I'll move these to subsequent patches when they are first used.
> >
> > Thank you for spending time reviewing and providing helpful comments
> > for this driver.
> >
> 
> Just drop the wrappers. I said they do not help and your answer "are used"
> does not explain anything. If you insist on keeping them, please explain what
> are the benefits except more code and more indirections/layers making it
> more difficult to read?
> 

I'll drop these in the next version.
Thanks again for the suggestion.

Regards,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

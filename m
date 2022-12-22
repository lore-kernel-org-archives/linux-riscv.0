Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93609C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71CGgJpFnRA8h5YX8fi/wU5U7FZzOack69XC7qB0apY=; b=gBHZvdQx8cQgMv
	o6Txw6Xz4l2nraW3zWp+L9o7olac12wt52MJ5z43HgAgk16DYvxd5IwtJkOX4WnyN+E1NTCCfNTvr
	U/WbQ7DPnyE7uPSgXec+8ifpLwp9dcOThA+yy0MNXdclhxZRErzFvmmr1dtAFvIe1dVdXfODgmojK
	rbY3Ab8QVmvCaSv89OkB8HKjQq1ZlsLoQJzdHMsHAr5q83ddlNqRbOGa5r1PddCw3yZbt0eK8tWnC
	7eeugK5ZwLXK/Sr33IhCtckwLYitsUNSZK6H1q3S7xTdg1Dt8r9/wGP5lWG9i5TmKMfnq9OxBioLc
	pKeg4kw8Xbyw5wQBLLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8GgO-008pqy-45; Thu, 22 Dec 2022 08:12:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8GgE-008ph6-FF
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 08:11:59 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DE0D124E36E;
	Thu, 22 Dec 2022 16:11:16 +0800 (CST)
Received: from EXMBX063.cuchost.com (172.16.7.63) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 22 Dec
 2022 16:11:16 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX063.cuchost.com
 (172.16.6.63) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 22 Dec
 2022 16:11:16 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Thu, 22 Dec 2022 16:11:16 +0800
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
Subject: RE: [PATCH 3/3] riscv: dts: starfive: Add TRNG node for VisionFive 2
Thread-Topic: [PATCH 3/3] riscv: dts: starfive: Add TRNG node for VisionFive 2
Thread-Index: AQHZFRwZSE/lt9EBpUOGdiBQvIWXRa53klOAgAH8thA=
Date: Thu, 22 Dec 2022 08:11:16 +0000
Message-ID: <ee96fa9cdf9442169dab277647a3bae3@EXMBX168.cuchost.com>
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-4-jiajie.ho@starfivetech.com>
 <cbbf719b-a027-f91b-bd2c-6e6b43447b97@linaro.org>
In-Reply-To: <cbbf719b-a027-f91b-bd2c-6e6b43447b97@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.229.243]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_001155_686695_F5886A2E 
X-CRM114-Status: GOOD (  10.22  )
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
> Subject: Re: [PATCH 3/3] riscv: dts: starfive: Add TRNG node for VisionFive 2
> 
> > +
> > +		rng: rng@1600c000 {
> > +			compatible = "starfive,jh7110-trng";
> > +			reg = <0x0 0x1600C000 0x0 0x4000>;
> > +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> > +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> > +			clock-names = "hclk", "ahb";
> > +			resets = <&stgcrg
> JH7110_STGRST_SEC_TOP_HRESETN>;
> > +			interrupts = <30>;
> > +			status = "okay";
> 
> Drop. It's by default.
> 
I'll fix this in v2.

Thanks,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

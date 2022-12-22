Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61826C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARYFMeGywdX8YvoukiylsCh/9fs69srccpwofPSM40c=; b=Bjc0n4XtxB1MTZ
	HHwBXl3CQzM4Xo8M0FSaQIAh8T8ALuzRh0jBPP9i8EJFVy6zzQgTmZTvuURMpfKrWfep9BbK080DZ
	3Vs0PG1fLECQbIG+q3gaLROjpF4KLhe3sgmAs7F/E/QtkHZRwEVcgTT27HrYqQXll9YB7DQ/OKcr7
	MqHO7p43fKtwf6DUU4rsbZjPiQP4fIyK+ILraXpZq4WgE1+4oHoCXm1VSZVwmnR9SyLxAlrcclI/P
	8g/QKFo47+trV18PbtIfDREnrqVdfmGS2xNXecrFeVfoOv7APG3SE+Zht4WIH/GcNE3lLb43sH1ig
	ypkp76Vyytk8xh6Z4YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8IqY-00AKv8-KX; Thu, 22 Dec 2022 10:30:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Ipn-00AKXZ-MM
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 10:29:58 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4C1D024E347;
	Thu, 22 Dec 2022 18:29:42 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 22 Dec
 2022 18:29:42 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Thu, 22 Dec 2022 18:29:42 +0800
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
Subject: RE: [PATCH 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Thread-Topic: [PATCH 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Thread-Index: AQHZFRwx15kE4gLKu0uxN2CW96B+Oa53kqwAgAIT3RD//3zVgIAAklKA
Date: Thu, 22 Dec 2022 10:29:41 +0000
Message-ID: <2684abf708f145f4b49ec1680c1ddb87@EXMBX168.cuchost.com>
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-3-jiajie.ho@starfivetech.com>
 <05aaa9f8-7a97-51c9-e18a-1c3753f2006b@linaro.org>
 <69dca1be673a40729d750c00d927b437@EXMBX168.cuchost.com>
 <27f1c084-60b4-daeb-0ffe-c0500aecbd49@linaro.org>
In-Reply-To: <27f1c084-60b4-daeb-0ffe-c0500aecbd49@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.229.243]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_022956_072096_30DE10B9 
X-CRM114-Status: GOOD (  20.81  )
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
> Sent: Thursday, December 22, 2022 5:44 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Olivia Mackall
> <olivia@selenic.com>; Herbert Xu <herbert@gondor.apana.org.au>; Rob
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Emil Renner Berthing <kernel@esmil.dk>; Conor Dooley
> <conor.dooley@microchip.com>; linux-crypto@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org
> Subject: Re: [PATCH 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
> 
> > How do I properly handle __maybe_unused functions in this scenario?
> 
> The same as in other files. Use `git grep`
> 
> > Will it help if I add #define as follows:
> >
> > #ifdef CONFIG_PM
> > #define STARFIVE_RNG_PM_OPS (&starfive_rng_pm_ops) #else #define
> > STARFIVE_RNG_PM_OPS NULL #endif
> 
> I talked only about of_match_ptr(). This is not of_match_ptr and should have
> its own syntax (pm_sleep_ptr + static DEFINE_SIMPLE_DEV_PM_OPS)
> 
> >
> > static struct platform_driver starfive_trng_driver = {
> >         .probe  = starfive_trng_probe,
> >         .driver = {
> >                 .name           = "starfive-trng",
> >                 .pm             = STARFIVE_RNG_PM_OPS,
> >                 .of_match_table = of_match_ptr(trng_dt_ids),
> >         },
> > };
> >
> > I did build the patches with the tools mentioned but did not get warnings.
> > Do I need a specific version, or have I done something wrong?
> 
> You just need proper COMPILE_TEST config with OF disabled.
> 

I'll update the patch accordingly.
Thanks again for the comments and suggestions.

Regards,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

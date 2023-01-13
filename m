Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABDAC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 02:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U1IcFBs2yTukGf29Y6kHdSi0DMiCPT/MDD1p4Y8IZc=; b=ZXtaJiAfjQebzx
	qBbh3cRf7JERYFcxNVXqAtavzkYGOzY21TbThizoV5eQWp3QFTONXA/o9ENIQtgNOV+sEbtc2RbY2
	VPCKlwgJvNu7e8BRtVLE13ctsq0xHfdiBmYRb1J+3cmZJJPAqEZZrGgA8LSpe6UiTelQ5ln4TBsyz
	Ozbscu26y9LcUxq0uoqIBsmSUPmPmBJmAjRP3iPQ6PSg90rqNMRMfCkgW9++w+KWYBhTJx4wC5RT+
	4MMwD4+HtN7xt7oQaSYgvrhYLHLaleqasDMF0STEc/JVCGzwv5ZYM3H1Jw2WQrvzi8H2dUGOhrlk6
	4wUIVcGgca0VN657fjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG9qw-000A7j-SS; Fri, 13 Jan 2023 02:31:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG9qr-000A5y-Nl
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 02:31:32 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3DEEB24E115;
	Fri, 13 Jan 2023 10:30:56 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 13 Jan
 2023 10:30:56 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 13 Jan
 2023 10:30:55 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Fri, 13 Jan 2023 10:30:55 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v4 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Thread-Topic: [PATCH v4 2/3] hwrng: starfive - Add TRNG driver for StarFive
 SoC
Thread-Index: AQHZJj/IHp8vIBNNJEO5ZoaN+GosV66aoj2AgADzXNA=
Date: Fri, 13 Jan 2023 02:30:55 +0000
Message-ID: <82979ef41b4a4c9f8a77c950e3c65c86@EXMBX168.cuchost.com>
References: <20230112043812.150393-1-jiajie.ho@starfivetech.com>
 <20230112043812.150393-3-jiajie.ho@starfivetech.com> <Y8Bco7lBBj7CO9C5@spud>
In-Reply-To: <Y8Bco7lBBj7CO9C5@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.108.220]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_183130_161442_CCBAD420 
X-CRM114-Status: GOOD (  23.28  )
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

> > +STARFIVE TRNG DRIVER
> > +M:	Jia Jie Ho <jiajie.ho@starfivetech.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/rng/starfive*
> > +F:	drivers/char/hw_random/starfive-trng.c
> 
> minor nit (so don't submit another version just to fix this):
> This should be Supported, no?
> 

Hi Conor, 
I'll update this in next version together with other comments below. 

> > diff --git a/drivers/char/hw_random/Makefile
> > b/drivers/char/hw_random/Makefile index 3e948cf04476..f68ac370847f
> > 100644
> > --- a/drivers/char/hw_random/Makefile
> > +++ b/drivers/char/hw_random/Makefile
> > @@ -47,3 +47,4 @@ obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-
> trng.o
> >  obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
> >  obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
> >  obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
> > +obj-$(CONFIG_HW_RANDOM_STARFIVE) += starfive-trng.o
> 
> Is "STARFIVE" a bit too general of a name here and in the Kconfig entry?
> I don't have a TRM for the JH7100, but this name (and the Kconfig text)
> would give me the impression that I can use it there too.
> Does this driver support both?
> 

7100 uses a different trng module but this same generator might be used in
future products, so I left it generic. Would it be better to specify the product?

> > +static int starfive_trng_probe(struct platform_device *pdev)
[...]
> > +	ret = devm_hwrng_register(&pdev->dev, &trng->rng);
> > +	if (ret) {
> > +		dev_err_probe(&pdev->dev, ret, "Failed to register
> hwrng\n");
> > +		goto err_fail_register;
> > +	}
> > +
> > +	pm_runtime_use_autosuspend(&pdev->dev);
> > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> 
> > +	pm_runtime_enable(&pdev->dev);
> 
> > +
> > +	return 0;
> > +
> > +err_fail_register:
> 
> > +	pm_runtime_disable(&pdev->dev);
> 
> This was only enabled after the only goto for this label, does it serve a
> purpose?
> I know little about runtime PM, it just caught my eye.
> I looked at the other rng drivers that had calls to pm_runtime_enable(), but
> they all seem to do their pm enablement _before_ calling hwrng_register().
> Again, I am not familiar with runtime PM, but curious why you are doing
> things differently, that's all.

It does make more sense to move pm_runtime_enable before registering the
generator to align with codes in the goto label.
I'll fix this part.

Thanks again for reviewing the patches.

Best regards,
Jia Jie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

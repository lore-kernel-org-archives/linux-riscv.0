Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B79C54EBE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22PZdQyrSxBZNq94IY9YOqkvQt1I8oPPs8lit35KU5E=; b=orRCJXTUWYbEl1
	r96EOlI81Svo3w0uD4ilB6q/VzPEOB5S6j9ur42fL38Wc1hvHiIJfMgqSFRbhoJ96bPXVqgekc+N8
	L19PMD8EdP3z+UBBjUvttKmSgYxz/FBbbKCcz7Re05TZs+F/8w5JfKYx9A2PXSKsOX3aJM1uTVOiB
	Be07IHZQbo05i3Gd76bzQOlo+vvyBmQw/2B0BkWVkLF1o9S2azFaPXCYrgo6SgeVlFP86IOBiB8aZ
	47N8AexW/AOGEB5rfNXN4JQ5k+UK+OWhhFxUg6CdsXuYaPTnfnHlkHAXsvPHfegzvkEVutTHTn/8N
	c51nzue+9SkuhtxPi0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9KT-005eDm-6b; Tue, 10 Jan 2023 07:45:53 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9KQ-005eCT-9k
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 07:45:52 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8E3BE24E2EE;
	Tue, 10 Jan 2023 15:45:21 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 15:45:18 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 15:45:18 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Tue, 10 Jan 2023 15:45:18 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v3 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Thread-Topic: [PATCH v3 2/3] hwrng: starfive - Add TRNG driver for StarFive
 SoC
Thread-Index: AQHZJEs120dGRuhRZEeUeBz460sZNq6WvwSAgACGdNA=
Date: Tue, 10 Jan 2023 07:45:17 +0000
Message-ID: <3f7e4e82d42d4c1791afa346f8b62870@EXMBX168.cuchost.com>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com>
 <20230109165249.110279-3-jiajie.ho@starfivetech.com>
 <Y70WgbySlio6cjew@gondor.apana.org.au>
In-Reply-To: <Y70WgbySlio6cjew@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.108.220]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_234550_705938_E89E6F1A 
X-CRM114-Status: GOOD (  19.29  )
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
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Sent: 10 January, 2023 3:41 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Olivia Mackall <olivia@selenic.com>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v3 2/3] hwrng: starfive - Add TRNG driver for StarFive
> SoC
> 
> On Tue, Jan 10, 2023 at 12:52:48AM +0800, Jia Jie Ho wrote:
> >
> > +static irqreturn_t starfive_trng_irq(int irq, void *priv) {
> > +	u32 status;
> > +	struct starfive_trng *trng = (struct starfive_trng *)priv;
> > +
> > +	status = readl(trng->base + STARFIVE_ISTAT);
> > +	if (status & STARFIVE_ISTAT_RAND_RDY) {
> > +		writel(STARFIVE_ISTAT_RAND_RDY, trng->base +
> STARFIVE_ISTAT);
> > +		complete(&trng->random_done);
> > +	}
> > +
> > +	if (status & STARFIVE_ISTAT_SEED_DONE) {
> > +		writel(STARFIVE_ISTAT_SEED_DONE, trng->base +
> STARFIVE_ISTAT);
> > +		complete(&trng->reseed_done);
> > +	}
> > +
> > +	if (status & STARFIVE_ISTAT_LFSR_LOCKUP) {
> > +		writel(STARFIVE_ISTAT_LFSR_LOCKUP, trng->base +
> STARFIVE_ISTAT);
> > +		/* SEU occurred, reseeding required*/
> > +		writel(STARFIVE_CTRL_EXEC_RANDRESEED, trng->base +
> STARFIVE_CTRL);
> 
> This could occur at the same time as a GENE_RANDNUM write so perhaps
> you should add some locking?
> 

I'll add those in the next version.

> > +	ret = devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev-
> >name,
> > +			       (void *)trng);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, irq,
> > +				     "Failed to register interrupt handler\n");
> 
> ...
> 
> > +	init_completion(&trng->random_done);
> > +	init_completion(&trng->reseed_done);
> 
> These completion initialisations should be moved above the IRQ registration
> because you should always be prepared to get spurious interrupts.
> 

Will update these too.

> Otherwise the patch looks good.
> 

Thanks again for reviewing the patch and providing the useful feedbacks.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

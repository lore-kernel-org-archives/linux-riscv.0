Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7214CC54EBD
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwWXubMeaLUjBiAvinlbMCzP7es0NggCXwF4nfRaWgI=; b=J86PEYvpnDf1tI
	IysNKAI55povEJA2cvws7jbXkxpSjj/dnPh9rm+lztdgSvi/suPOt91hH21bjC59Ru+4yNUEGn25+
	x4Z7wvVL4prAM+wV2Lk6QKZElBardNJuxi42FccD18LVi+QvQIi7GqnahWxqEqSYQTf/JD/Gj8CA1
	hD6eKEXfB8eVAbt49HIEN4rNDavaqU/UkROrL1/eqWBZB/ghbvHzr7naY5pj6CEpPkvCoU7yCegAn
	nhiw4M1PanDAd+gg0BYiJ3Ox6gEkw26hcW6dLgspFdeR5hlgZ6lWmYQ03tGwx1PKD51w/SGB5ctb5
	5p7l3dP8glGj83lhbRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWQu-00Dyyf-Ve; Sun, 08 Jan 2023 14:13:57 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEWQq-00Dyv4-5z
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 14:13:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E0DCB24DC94;
	Sun,  8 Jan 2023 22:13:05 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Jan
 2023 22:13:05 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Sun, 8 Jan 2023 22:13:05 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Thread-Topic: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive
 SoC
Thread-Index: AQHZGoveBWEVWeSp5UqGtlmGFQKs8K6QmY4AgAQHL+A=
Date: Sun, 8 Jan 2023 14:13:05 +0000
Message-ID: <75798088d1cd41dd94dafe67179761d9@EXMBX168.cuchost.com>
References: <20221228071103.91797-1-jiajie.ho@starfivetech.com>
 <20221228071103.91797-3-jiajie.ho@starfivetech.com>
 <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
In-Reply-To: <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.16.6.8]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_061352_732523_6EABB45D 
X-CRM114-Status: GOOD (  18.29  )
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
> Sent: 6 January, 2023 4:39 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Olivia Mackall <olivia@selenic.com>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive
> SoC
> 
> On Wed, Dec 28, 2022 at 03:11:02PM +0800, Jia Jie Ho wrote:
> >
> > +static int starfive_trng_cmd(struct starfive_trng *trng, u32 cmd) {
> > +	int ret;
> > +
> > +	ret = starfive_trng_wait_idle(trng);
> > +	if (ret)
> > +		return -ETIMEDOUT;
> > +
> > +	switch (cmd) {
> > +	case STARFIVE_CTRL_EXEC_NOP:
> > +		writel(cmd, trng->base + STARFIVE_CTRL);
> > +		break;
> > +	case STARFIVE_CTRL_GENE_RANDNUM:
> > +		reinit_completion(&trng->random_done);
> > +		writel(cmd, trng->base + STARFIVE_CTRL);
> > +		ret = wait_for_completion_timeout(&trng->random_done,
> 3000);
> 
> Please don't use a constant jiffies value, because it may vary in length.
> Instead use a constant millisecond value and convert it to jiffies.
> 

I'll fix this in next version.

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
> > +		starfive_trng_cmd(trng,
> STARFIVE_CTRL_EXEC_RANDRESEED);
> 
> You should not sleep in an IRQ handler.
> 

Will fix this too.

> > +static int starfive_trng_read(struct hwrng *rng, void *buf, size_t
> > +max, bool wait)
> 
> You should respect the wait argument and not do polling/sleeping if it is false.

I'll add this in the next version.

Thanks for reviewing this patch.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

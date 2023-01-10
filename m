Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F63C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqTUpEVmRMREp70Wf+QiuQe9YaBSUhBQIMM11DTpDsw=; b=1fzsRjj7dcbAZ8
	tlIaN7xvZ3dcGPoQlKHHVXKQgufMzvuXL4W7VxwKagWYpM0gp3LDYHiypEFZvDoi9P8259UKkthJ7
	men6qJhlCCUI0evGMR6f5p3N5gOp4CMGE9XW88KDy+HGhiK/KCaD3dN9tLOLtovkOL5j1JFR9zH7G
	j/9nrrfenbVk6SHXEubx9ta5rdYbsQw6M13Dk9eHf2KAzOKfGeJRq/nZApEY+mtmttAOjwIMmTDxk
	L87Fi/CdCbPLg/O8Hc2fWbIsEweADLgy0zHtXU3NjeO293+BADR6myLg71dOSzHV1c40ZCqwIcLjl
	IHLUWvWe1uyBJnmnaqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9GD-005dfq-Cl; Tue, 10 Jan 2023 07:41:29 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9G9-005de8-Ch
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 07:41:27 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pF9FZ-00FwmE-1Y; Tue, 10 Jan 2023 15:40:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 10 Jan 2023 15:40:49 +0800
Date: Tue, 10 Jan 2023 15:40:49 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Message-ID: <Y70WgbySlio6cjew@gondor.apana.org.au>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com>
 <20230109165249.110279-3-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109165249.110279-3-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_234125_449539_A019E8A7 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue, Jan 10, 2023 at 12:52:48AM +0800, Jia Jie Ho wrote:
>
> +static irqreturn_t starfive_trng_irq(int irq, void *priv)
> +{
> +	u32 status;
> +	struct starfive_trng *trng = (struct starfive_trng *)priv;
> +
> +	status = readl(trng->base + STARFIVE_ISTAT);
> +	if (status & STARFIVE_ISTAT_RAND_RDY) {
> +		writel(STARFIVE_ISTAT_RAND_RDY, trng->base + STARFIVE_ISTAT);
> +		complete(&trng->random_done);
> +	}
> +
> +	if (status & STARFIVE_ISTAT_SEED_DONE) {
> +		writel(STARFIVE_ISTAT_SEED_DONE, trng->base + STARFIVE_ISTAT);
> +		complete(&trng->reseed_done);
> +	}
> +
> +	if (status & STARFIVE_ISTAT_LFSR_LOCKUP) {
> +		writel(STARFIVE_ISTAT_LFSR_LOCKUP, trng->base + STARFIVE_ISTAT);
> +		/* SEU occurred, reseeding required*/
> +		writel(STARFIVE_CTRL_EXEC_RANDRESEED, trng->base + STARFIVE_CTRL);

This could occur at the same time as a GENE_RANDNUM write so perhaps
you should add some locking?

> +	ret = devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev->name,
> +			       (void *)trng);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, irq,
> +				     "Failed to register interrupt handler\n");

...

> +	init_completion(&trng->random_done);
> +	init_completion(&trng->reseed_done);

These completion initialisations should be moved above the IRQ
registration because you should always be prepared to get spurious
interrupts.

Otherwise the patch looks good.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

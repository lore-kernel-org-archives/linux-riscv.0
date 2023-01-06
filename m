Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D7C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmJlprFxk732Daj3Hy7j6+XG8OsiUazJaiQwx+zsQbg=; b=jz+370qT73tU0f
	86Ot76eQSi8tqyUuLi7dDfnhmWT1MNvR7uRj+8zalg2V2L83wondS7U077AFYhzmIeDrONaiRXyAs
	ayCsKdX90ccsfSUQCaMzSz2kMjg/jRfUnd8w52usxak2smfUtBSN0kXybw6mjNWeAPqYMaWgH6SHk
	P4UvHRDla59sLRCbtgwonPnrMh30u/MQExkAjv15i5rvZT4/sVbWmB6A3hd4xT81hCW+mKQYsivU1
	TdtNsXNqWhE4OTr5mDNy8dQ0TFzAboLkW5NFEax/LDIFsxunAdstz+XyT3F6Me1R3hwcJI4VqTsId
	m1yAIAic7sXDw+qccEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiGu-006hWL-D1; Fri, 06 Jan 2023 08:40:16 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=formenos.hmeau.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDiGZ-006hLa-8u
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 08:39:57 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pDiG4-00EV7i-2e; Fri, 06 Jan 2023 16:39:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Jan 2023 16:39:24 +0800
Date: Fri, 6 Jan 2023 16:39:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Message-ID: <Y7fePDme5E3yhPhQ@gondor.apana.org.au>
References: <20221228071103.91797-1-jiajie.ho@starfivetech.com>
 <20221228071103.91797-3-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221228071103.91797-3-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_003955_391446_B78B39CC 
X-CRM114-Status: GOOD (  12.76  )
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

On Wed, Dec 28, 2022 at 03:11:02PM +0800, Jia Jie Ho wrote:
>
> +static int starfive_trng_cmd(struct starfive_trng *trng, u32 cmd)
> +{
> +	int ret;
> +
> +	ret = starfive_trng_wait_idle(trng);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	switch (cmd) {
> +	case STARFIVE_CTRL_EXEC_NOP:
> +		writel(cmd, trng->base + STARFIVE_CTRL);
> +		break;
> +	case STARFIVE_CTRL_GENE_RANDNUM:
> +		reinit_completion(&trng->random_done);
> +		writel(cmd, trng->base + STARFIVE_CTRL);
> +		ret = wait_for_completion_timeout(&trng->random_done, 3000);

Please don't use a constant jiffies value, because it may vary
in length.  Instead use a constant millisecond value and convert
it to jiffies.

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
> +		starfive_trng_cmd(trng, STARFIVE_CTRL_EXEC_RANDRESEED);

You should not sleep in an IRQ handler.

> +static int starfive_trng_read(struct hwrng *rng, void *buf, size_t max, bool wait)

You should respect the wait argument and not do polling/sleeping
if it is false.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

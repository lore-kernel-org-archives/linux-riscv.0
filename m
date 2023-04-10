Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089C5C76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UAdmaxKWLu8E6OuDZ4vcYbWAvECoRQJTcFBbZhqWTM=; b=ODtN5VzTk5h2Xl
	0hW4c0GeRge5WHSCJdQUOkyP28vnpCu374zsjCl+syEcd3JUoJYEabK9qCmR5Kr5Xw1EDI2/4G/ob
	gCuwefRvs28u0GK2TN8kxR2sI8fJ4Mxt1+k0gHP3uTb3+Y1i10f8+cwkxrPnOMos+4J/PY6Wn4GRM
	rtIOFGNuvRlj3PD6PEJvJhgwhqOQuSZMi/ST5g662dVlWLvvewhEm7EWg/hgdHZuv2J1F75NMTfBV
	1Wpubzy3uzlezeIXJZtwO5ZdC7doEC8Fz0zolrMcUfWIDVjG3Q1vUYxAobwTFP8M8Ue+FHZaY8SWg
	Z1OI/LMJo3OBXyEItbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pln8G-00EpDK-0n;
	Mon, 10 Apr 2023 08:44:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pln8C-00EpCG-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 08:44:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BFC6924E0D6;
	Mon, 10 Apr 2023 16:43:40 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 16:43:41 +0800
Received: from [192.168.155.128] (202.188.176.82) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 16:43:37 +0800
Message-ID: <6df549e9-d0f6-23ca-882f-527c4e40b553@starfivetech.com>
Date: Mon, 10 Apr 2023 16:43:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-crypto@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
 <20230410073752.39506-5-jiajie.ho@starfivetech.com>
 <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
In-Reply-To: <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_014408_545455_9D9873EA 
X-CRM114-Status: GOOD (  15.38  )
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

On 10/4/2023 3:50 pm, Herbert Xu wrote:
> On Mon, Apr 10, 2023 at 03:37:52PM +0800, Jia Jie Ho wrote:
>>
>> +static void starfive_hash_start(void *param)
>> +{
>> +	struct starfive_cryp_ctx *ctx = param;
>> +	struct starfive_cryp_request_ctx *rctx = ctx->rctx;
>> +	struct starfive_cryp_dev *cryp = ctx->cryp;
>> +	union starfive_alg_cr alg_cr;
>> +	union starfive_hash_csr csr;
>> +
>> +	dma_unmap_sg(cryp->dev, rctx->in_sg, rctx->in_sg_len, DMA_TO_DEVICE);
>> +
>> +	alg_cr.v = 0;
>> +	alg_cr.clear = 1;
>> +
>> +	writel(alg_cr.v, cryp->base + STARFIVE_ALG_CR_OFFSET);
>> +
>> +	csr.v = readl(cryp->base + STARFIVE_HASH_SHACSR);
>> +	csr.firstb = 0;
>> +	csr.final = 1;
>> +
>> +	reinit_completion(&cryp->hash_done);
>> +	writel(~STARFIVE_IE_MASK_HASH_DONE, cryp->base + STARFIVE_IE_MASK_OFFSET);
>> +	writel(csr.v, cryp->base + STARFIVE_HASH_SHACSR);
>> +}
> 
> Why are you still using a completion? The callback function should
> invoke the crypto_engine finalize_request call directly.
> 

Hi Herbert,
The hardware requires user to set a 'final' bit after data transfer completed.
This completion is to wait for the interrupt signal from device that the final digest 
has been populated to the read registers.

I'll do the finalize_request call directly in the next version.

>> +static int starfive_hash_xmit(struct starfive_cryp_ctx *ctx)
>> +{
>> +	struct starfive_cryp_request_ctx *rctx = ctx->rctx;
>> +	struct starfive_cryp_dev *cryp = ctx->cryp;
>> +	int ret;
>> +
>> +	rctx->csr.hash.v = 0;
>> +	rctx->csr.hash.reset = 1;
>> +	writel(rctx->csr.hash.v, cryp->base + STARFIVE_HASH_SHACSR);
>> +
>> +	if (starfive_hash_wait_busy(ctx))
>> +		return dev_err_probe(cryp->dev, -ETIMEDOUT, "Error resetting engine.\n");
>> +
>> +	rctx->csr.hash.v = 0;
>> +	rctx->csr.hash.mode = ctx->hash_mode & STARFIVE_HASH_MODE_MASK;
>> +	rctx->csr.hash.ie = 1;
>> +
>> +	if (ctx->hash_mode & STARFIVE_HASH_HMAC_FLAGS) {
>> +		ret = starfive_hash_hmac_key(ctx);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		rctx->csr.hash.start = 1;
>> +		rctx->csr.hash.firstb = 1;
>> +		writel(rctx->csr.hash.v, cryp->base + STARFIVE_HASH_SHACSR);
>> +	}
>> +
>> +	ret = starfive_hash_xmit_dma(ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!wait_for_completion_timeout(&cryp->hash_done, msecs_to_jiffies(10000)))
>> +		return dev_err_probe(cryp->dev, -ETIMEDOUT, "Timeout waiting for hash done\n");
> 
> There is no point in waiting for completion.  Just return 0 and
> you're done.
> 

I'll change this in the next version too.

Thanks for taking time reviewing this patch.

Best regards,
Jia Jie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

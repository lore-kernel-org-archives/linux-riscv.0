Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E582CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 22:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD542084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 22:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hr6PCW4R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD542084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oIX720tZCNf6HETDTW80YjRUic+9d+RYkfpiq6/hYzQ=; b=hr6PCW4ROz1Wm/Tjua1aFTeBf
	WTNBkvlWKcGqsx/HeAAkhxcsxjCUI3+4/TP5wrogcYorTfZ9fAiErPyDiBRaBKGvR8YEMJv8DE9Yi
	4ANsPPfHcHmVsrvqn/OSV1aQMqXixVjLv7FsPGJzYSfOQT6m3BWXqu63z54fSFynVMUEE3QqqFguz
	WiChn/OCIhn1SwvZcvraCmJy5UjRNmvX53aXIlbpZWzmk0GLvLOsarSYxHXa+J+EWLsPQYCME54Hj
	Vuj4kVnVSN8Yup2MiZ47Nr8vlsMTgt+r4u8RGTm8t6duFkPBQOc3BcDjNQ2e6I/h+xxLPrwtvBVsO
	8BmstdZng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzUNd-00085C-6g; Thu, 28 Feb 2019 22:42:17 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzUNa-00084j-PG
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 22:42:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B44D8A78;
 Thu, 28 Feb 2019 14:42:13 -0800 (PST)
Received: from [192.168.1.123] (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 611903F720;
 Thu, 28 Feb 2019 14:42:12 -0800 (PST)
Subject: Re: [PATCH] Revert "of/device: Really only set bus DMA mask when
 appropriate"
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "robh@kernel.org" <robh@kernel.org>
References: <20190228223257.6189-1-alistair.francis@wdc.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <056edacd-a998-277c-f0de-1aac256165a2@arm.com>
Date: Thu, 28 Feb 2019 22:42:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190228223257.6189-1-alistair.francis@wdc.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_144214_824748_829FF8CE 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2019-02-28 10:33 pm, Alistair Francis wrote:
> This reverts commit 6778be4e520959659b27a441c06a84c9cb009085.
> 
> Reverting the commit fixes these error messages and an non-functioning
> USB bus when attaching a USB to PCIe card to a RISC-V board:
>      xhci_hcd 0000:03:00.0: Host took too long to start, waited 16000 microseconds.
>      xhci_hcd 0000:03:00.0: startup error -19
>      xhci_hcd 0000:03:00.0: USB bus 2 deregistered
>      xhci_hcd 0000:03:00.0: WARNING: Host System Error
>      xhci_hcd 0000:03:00.0: remove, state 1
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> I'm not sure if this is the correct fix, it's possible something else is
> wrong, but I wanted to get some feedback.

Given that the bug which this revert would reintroduce cripples DMA on 
just about every 64-bit DT system, probably not. Can you clarify what 
your DT looks like, and turn on the debug output for of_dma_get_range() 
to see what it says?

Robin.

> drivers/of/device.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 3717f2a20d0d..8299f8055da7 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -149,11 +149,9 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
>   	 * set by the driver.
>   	 */
>   	mask = DMA_BIT_MASK(ilog2(dma_addr + size - 1) + 1);
> +	dev->bus_dma_mask = mask;
>   	dev->coherent_dma_mask &= mask;
>   	*dev->dma_mask &= mask;
> -	/* ...but only set bus mask if we found valid dma-ranges earlier */
> -	if (!ret)
> -		dev->bus_dma_mask = mask;
>   
>   	coherent = of_dma_is_coherent(np);
>   	dev_dbg(dev, "device is%sdma coherent\n",
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

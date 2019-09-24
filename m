Return-Path: <SRS0=vaUQ=XT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492D6C432C1
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2019 21:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C4A52146E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2019 21:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oZVBfwqX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wfE5PHL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C4A52146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMSzBrnkAbnDKvFTD5GmBqgPRDEIsfbBLOX3lslaUJE=; b=oZVBfwqXPH/4Kg
	O9+BAbXqIYdUOcD0ptD2LBJJD5ny075PePQuABFrQJuYtixHEbZuMh5OMuXOiQapyW7RGT8x3BEDd
	dMICUXw+YeT6w+etea64wFFbCBLAsvlAMS/cnovIO4JKWyKYayIYNdjXDbkG0AC36hNUc2xDr+HmG
	SViTI6pxSQJhH5fr0bTTys7OjR6OjpKBGkqlrJZmMo4ZFFkTq4q/4UWqGNcfDdPI9qGvAlgpYPTcY
	kX1vkf+si3IOYA1E4sHjDHsEGF47YKn29L8Lf5yzcefVxplq+b8t3924btK7fYjQPuEox7K2mlfap
	KcUOyY+gXTx6OjCAvcJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCsFK-00068m-H8; Tue, 24 Sep 2019 21:21:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCsFG-00066d-1d
 for linux-riscv@lists.infradead.org; Tue, 24 Sep 2019 21:21:17 +0000
Received: from localhost (unknown [12.157.10.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 812862146E;
 Tue, 24 Sep 2019 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569360072;
 bh=YwTnTLVeehJrct4PNQdvbGHqGUqGNX0FXMXJ8P27DZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wfE5PHL673l/faJkcNrHUaXRQ+94j1pJKdEikf3DrBIKkUirdnWkQ++L3dso3zdlj
 0WAQkVJbn8QR38mdR/Ih4PtjGoEC4Sc0ATLE2Jnvjjci+uLv/F/QEu6su4299nQWVs
 z7JgEH7pmrLakQ0RlTkVSf8CmWFmZeq5T9FX7FpA=
Date: Tue, 24 Sep 2019 14:20:11 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Green Wan <green.wan@sifive.com>
Subject: Re: [PATCH v3 3/3] dmaengine: sf-pdma: add platform DMA support for
 HiFive Unleashed A00
Message-ID: <20190924212011.GG3824@vkoul-mobl>
References: <20190920090205.19552-1-green.wan@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920090205.19552-1-green.wan@sifive.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_142114_487006_EB723618 
X-CRM114-Status: GOOD (  14.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-hackers@sifive.com,
 Dan Williams <dan.j.williams@intel.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Green,

On 20-09-19, 17:01, Green Wan wrote:

Please make sure threading is *not* broken in your patch series. Atm
they are all over place in my mailbox!

> Link: https://www.kernel.org/doc/html/v4.17/driver-api/dmaengine/
> Link: https://static.dev.sifive.com/FU540-C000-v1.0.pdf

Link tag is used for discussion for the patch, please drop first one and
add second one as a documentation for hardware

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d0caa09a479e..c5f0662c9106 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14594,6 +14594,7 @@ F:	drivers/media/mmc/siano/
>  SIFIVE PDMA DRIVER
>  M:	Green Wan <green.wan@sifive.com>
>  S:	Maintained
> +F:	drivers/dma/sf-pdma/
>  F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml

What is this generated against, only one line?

> +static void sf_pdma_fill_desc(struct sf_pdma_chan *chan,
> +			      u64 dst,
> +			      u64 src,
> +			      u64 size)

Please align these to precceeding line open brace!

> +{
> +	struct pdma_regs *regs = &chan->regs;
> +
> +	writel(PDMA_FULL_SPEED, regs->xfer_type);
> +	writeq(size, regs->xfer_size);
> +	writeq(dst, regs->dst_addr);
> +	writeq(src, regs->src_addr);
> +}
> +
> +void sf_pdma_disclaim_chan(struct sf_pdma_chan *chan)
> +{
> +	struct pdma_regs *regs = &chan->regs;
> +
> +	writel(PDMA_CLEAR_CTRL, regs->ctrl);
> +}
> +
> +struct dma_async_tx_descriptor *
> +	sf_pdma_prep_dma_memcpy(struct dma_chan *dchan,
> +				dma_addr_t dest,
> +				dma_addr_t src,
> +				size_t len,
> +				unsigned long flags)
> +{
> +	struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
> +	struct sf_pdma_desc *desc;
> +
> +	if (!chan || !len || !dest || !src) {
> +		pr_debug("%s: Please check dma len, dest, src!\n", __func__);
> +		return NULL;
> +	}
> +
> +	desc = sf_pdma_alloc_desc(chan);
> +	if (!desc)
> +		return NULL;
> +
> +	desc->in_use = true;
> +	desc->dirn = DMA_MEM_TO_MEM;
> +	desc->async_tx = vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);

No error checking?
> +
> +	spin_lock_irqsave(&chan->lock, flags);
> +	chan->desc = desc;
> +	sf_pdma_fill_desc(desc->chan, dest, src, len);
> +	spin_unlock_irqrestore(&chan->lock, flags);
> +
> +	return desc->async_tx;
> +}
> +
> +static void sf_pdma_unprep_slave_dma(struct sf_pdma_chan *chan)
> +{
> +	if (chan->dma_dir != DMA_NONE)
> +		dma_unmap_resource(chan->vchan.chan.device->dev,

This is slave dma right, why are you unmapping? Also where is the
mapping call?

> +				   chan->dma_dev_addr,
> +				   chan->dma_dev_size,
> +				   chan->dma_dir, 0);
> +	chan->dma_dir = DMA_NONE;
> +}
> +
> +static int sf_pdma_slave_config(struct dma_chan *dchan,
> +				struct dma_slave_config *cfg)
> +{
> +	struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
> +
> +	memcpy(&chan->cfg, cfg, sizeof(*cfg));
> +	sf_pdma_unprep_slave_dma(chan);

Why unprep?

> +static enum dma_status
> +sf_pdma_tx_status(struct dma_chan *dchan,
> +		  dma_cookie_t cookie,
> +		  struct dma_tx_state *txstate)
> +{
> +	struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
> +	enum dma_status status;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&chan->lock, flags);
> +	if (chan->xfer_err) {
> +		chan->status = DMA_ERROR;
> +		spin_unlock_irqrestore(&chan->lock, flags);
> +		return chan->status;
> +	}
> +
> +	spin_unlock_irqrestore(&chan->lock, flags);
> +
> +	status = dma_cookie_status(dchan, cookie, txstate);
> +
> +	if (status == DMA_COMPLETE)
> +		return status;
> +
> +	if (!txstate)
> +		return chan->status;

why not return status? Is that expected to be different than status?

> +static int sf_pdma_remove(struct platform_device *pdev)
> +{
> +	struct sf_pdma *pdma = platform_get_drvdata(pdev);
> +
> +	dma_async_device_unregister(&pdma->dma_dev);

whay about irqs and tasklets, they are still enabled and can trigger!
-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3000DCFB440
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vIZv3nhW8FOIrkIddpx/9FlM2veOHp5OkL5Hq4W9DRU=; b=n5oDV5Hq1t4aWLe+bQ3OhfKJLC
	5SzQO0oAPtPtWJp+8gT3+YxiDGzD8Dt0/GWv0nJOO9ST2uzAcLMwn/pGhNika2ckQIGVVImPzF9LP
	yZv81LTwhq3dnF4gpvXmQB/biICxo0aCIPnMfApTurxD8crNnNO3I7e3FFP6LAQvbQSLditpG4i9V
	97KfrdcqvXsLhpBmsP3Ml2iqzZFmUStwXSEiaoTVCW7aWS5KFbClcA8RLq303F10L/JMinOkQn1T7
	H3ibboemOxlW4yPepCoECvkaXd3hOKyFCd2tX7Y5xQ/KPfWKsnEPh/cELBxqnhhU5CtGngPV5h268
	d+pTb5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxn7s-00000002OVg-3SyS;
	Mon, 07 Oct 2024 12:46:12 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmnS-00000002JzP-3Zhm
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 12:25:09 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so1488335a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1728303905; x=1728908705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM96gy8f618bGBajVDpCaKuepjJ0dpUYbsUw4JQ//R4=;
        b=Chnho8fcIKWNnuPXHuBaJnaLg+P7U1sG8q9aDByqd6FJR2IKNOM4pMjve5rGFz2afm
         2oGM77j0jbsnxBNRWCn6dAgA83IjY8lItF7qiJtapOh5kLzpvzOQNpBvMA89L2O3Da27
         Fl6LuK1SZX9rGddWL0fFKnsO9fUunv7od4rPrJOAIa+VmAJ0Q0gv/V7WzZO4C1lqMilO
         oakX/bvO1Z6HxrpNF2ghyrsqHkgBZHnxwIEbjcArQ7vzksO6m+H1lfleLZoj7w3NJ5eu
         /C5Sp1sTIUa7pVbSMleWWs/YUQiPGm5MlTbXs0wCohD2DdnQzQnOKwdvpiuS5aUjKr/z
         rWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303905; x=1728908705;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM96gy8f618bGBajVDpCaKuepjJ0dpUYbsUw4JQ//R4=;
        b=hQwA4dPZMu4VHmeKzGrPFkkHMNtqvHt4vJk+LAg5mXP7WAuxd/bd8vNqCBe0R4vr7P
         RG9EWz2aZ1QfEfq56qbMJZ/7YalSvJa3opQ1Lrb/ws3J0xNJdQYcGMhK21/pUdxY1vp2
         uSkipTiU9CmoO4iZhqYoNekl5FX1p4KmcnOctxkKybTkNPxBbQposk3VhASkV1quUVHm
         e5dxu6xAMAwg5MvnLrO71i5H+rTZstT01XPVgcXQQnVYLJlZeocw1OcMl324m6WicIHm
         63myMq4abB7z82WcsLmv8DE5E1Igg+MwypQCvs9ktAOwZaUbyF5Qop9X0c/xkY1/dHVK
         FoMw==
X-Forwarded-Encrypted: i=1; AJvYcCW1B8ZsMzUCExSiI0kgPbVFAYB+7iNoixEnOpRKTdbgjlMo5PwwPoGRghPc59uM+DywaYRXSs8r1jCh0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWhSQZ5dUJUbAwR7qfkGhLT63y3LJIvXZiAU0rVrAa8K8giUH9
	4zCvswUq+oVxn9lY+QoKKstW18O9hPYbaIVF/mMGEasQLumxGnKgxUldlE3sEg0=
X-Google-Smtp-Source: AGHT+IHzmdeyk7BcbsepBbIRiOyd9bViCdVFyVoSqlIqtw/HHX0y/avV8U1WcrVmd8PF5MvJp7Tjrg==
X-Received: by 2002:a05:6a20:d492:b0:1d6:5054:a02 with SMTP id adf61e73a8af0-1d6dfa24d0amr16925290637.2.1728303905288;
        Mon, 07 Oct 2024 05:25:05 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d66695sm4409586b3a.174.2024.10.07.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:25:04 -0700 (PDT)
Date: Mon, 07 Oct 2024 05:25:04 -0700 (PDT)
X-Google-Original-Date: Mon, 07 Oct 2024 05:25:03 PDT (-0700)
Subject: Re: [PATCH v1] dma: fix typo in the comment
In-Reply-To: <20240918034114.860132-1-yanzhen@vivo.com>
CC: vkoul@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  samuel.holland@sifive.com, michal.simek@amd.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com,
  yanzhen@vivo.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yanzhen@vivo.com
Message-ID: <mhng-8b05e8aa-ec7d-4ccf-883f-5e88cd86ad4f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_052506_899463_69E098D0 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 17 Sep 2024 20:41:14 PDT (-0700), yanzhen@vivo.com wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
>
> Replace 'enngine' with 'engine' in the comment &
> replace 'trascatioin' with 'transaction' in the comment &
> replace 'descripter' with 'descriptor' in the comment &
> replace 'descritpor' with 'descriptor' in the comment &
> replace 'rgisters' with 'registers' in the comment.
>
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
>  drivers/dma/mv_xor_v2.c         | 2 +-
>  drivers/dma/sf-pdma/sf-pdma.c   | 2 +-

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

for the SiFive stuff.  I'm happy to pick this up via the RISC-V tree if 
people want, but it's mostly for other stuff so I'm going to leave it 
alone for now.

Thanks!

>  drivers/dma/sh/shdma-base.c     | 2 +-
>  drivers/dma/sh/usb-dmac.c       | 2 +-
>  drivers/dma/xilinx/zynqmp_dma.c | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
> index c8c67f4d982c..c6c9702dcca0 100644
> --- a/drivers/dma/mv_xor_v2.c
> +++ b/drivers/dma/mv_xor_v2.c
> @@ -635,7 +635,7 @@ static int mv_xor_v2_descq_init(struct mv_xor_v2_device *xor_dev)
>  	writel(MV_XOR_V2_DESC_NUM,
>  	       xor_dev->dma_base + MV_XOR_V2_DMA_DESQ_SIZE_OFF);
>
> -	/* write the DESQ address to the DMA enngine*/
> +	/* write the DESQ address to the DMA engine*/
>  	writel(lower_32_bits(xor_dev->hw_desq),
>  	       xor_dev->dma_base + MV_XOR_V2_DMA_DESQ_BALR_OFF);
>  	writel(upper_32_bits(xor_dev->hw_desq),
> diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
> index 428473611115..538a7bc58108 100644
> --- a/drivers/dma/sf-pdma/sf-pdma.c
> +++ b/drivers/dma/sf-pdma/sf-pdma.c
> @@ -354,7 +354,7 @@ static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
>  	if (!residue) {
>  		tasklet_hi_schedule(&chan->done_tasklet);
>  	} else {
> -		/* submit next trascatioin if possible */
> +		/* submit next transaction if possible */
>  		struct sf_pdma_desc *desc = chan->desc;
>
>  		desc->src_addr += desc->xfer_size - residue;
> diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
> index 588c5f409a80..fdd41e1c2263 100644
> --- a/drivers/dma/sh/shdma-base.c
> +++ b/drivers/dma/sh/shdma-base.c
> @@ -961,7 +961,7 @@ void shdma_chan_probe(struct shdma_dev *sdev,
>
>  	spin_lock_init(&schan->chan_lock);
>
> -	/* Init descripter manage list */
> +	/* Init descriptor manage list */
>  	INIT_LIST_HEAD(&schan->ld_queue);
>  	INIT_LIST_HEAD(&schan->ld_free);
>
> diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
> index f7cd0cad056c..cc7f7ee7f74a 100644
> --- a/drivers/dma/sh/usb-dmac.c
> +++ b/drivers/dma/sh/usb-dmac.c
> @@ -301,7 +301,7 @@ static struct usb_dmac_desc *usb_dmac_desc_get(struct usb_dmac_chan *chan,
>  	struct usb_dmac_desc *desc = NULL;
>  	unsigned long flags;
>
> -	/* Get a freed descritpor */
> +	/* Get a freed descriptor */
>  	spin_lock_irqsave(&chan->vc.lock, flags);
>  	list_for_each_entry(desc, &chan->desc_freed, node) {
>  		if (sg_len <= desc->sg_allocated_len) {
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index 9ae46f1198fe..18a407975e14 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -366,7 +366,7 @@ static void zynqmp_dma_init(struct zynqmp_dma_chan *chan)
>  	}
>  	writel(val, chan->regs + ZYNQMP_DMA_DATA_ATTR);
>
> -	/* Clearing the interrupt account rgisters */
> +	/* Clearing the interrupt account registers */
>  	val = readl(chan->regs + ZYNQMP_DMA_IRQ_SRC_ACCT);
>  	val = readl(chan->regs + ZYNQMP_DMA_IRQ_DST_ACCT);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

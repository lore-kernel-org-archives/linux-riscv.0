Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43251F4BB99
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3SdnAC3ln5NH2DwtRyJ18DhHUR0enpZn5pCXbIoRkQ=; b=TAdjCSqzAUU+8T
	uRbsupTEFV5GoywbI4Uwn+EbbraJCuBjj6rJ+V4eNIW0A2CNlnqErrV2+ji9ONv6c2yq+rrgxkgCU
	0oBR62DCwD//PdTEJZd5E+Alg8l1GZHb9d/Bdar0gxX30mTJO2FnutXSHL5ZIK1Zop45IjPaudTiw
	v5wy5VBMCTg1ajDyZie+8MtkAylmeXZXK0ZvBCRABWphrRvcXxlLqKIWP0tJ6el+vrUYAX9wp5rCh
	bYRRD9ZIGSCaBRafGibY1PpOSf4XxWdJpmAH9PCD0bv0dWAY1TUkXIPslTgXQOB9qjNbyAgcvjjSu
	/eO6V/XBZ1/7jc/ZcWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKS-00000003ozo-0N2b;
	Wed, 25 Feb 2026 10:41:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKQ-00000003oz5-2A4j
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 10:41:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ade1806c28so762155ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016074; x=1772620874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5peVG9Q2XYh9oaZWaeVmzNFFF3WeNUswB5+Or4VvBI=;
        b=jL8OlyGou6eUYUmjScXRDE7Gw7nz5KIYIu7V04biO8Wwn0qL2kPpdJdnn/eVgCvS41
         JWLLyQ/oKvB2Y4yq/X8e/eeVdXnbop1u+IfXAajzhBFVUBzJmGP1tSDyFEGLIiXc+9gM
         XbV0DHXwsNBKpI8PNXBQKR5NMCQzPhM5Z+xMESEQDMU5LITmQ4JHZRKnpuJnTraT5KOv
         2+husUBFzZpDyRYe2ZWkrk3Xr9Uz4lpurlc8vfE1DH9XytZ71Ut1uUP2ax/adVkjDU5w
         XxJOPODyYq9FtW7ETqWrZRBVf2Pv+S8eldMrDwfEyGt4x6ErgUNoB4KURSrxNuDN1wFS
         hLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016074; x=1772620874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5peVG9Q2XYh9oaZWaeVmzNFFF3WeNUswB5+Or4VvBI=;
        b=BbPtffdWwzyBt9tdTV0fXq6uYogV3stLmTLZp84iMEpA6CzK+iCDejLR8txDvE1jdD
         wAvL6z4M8vmBekiuZVHVJqBij/i2nErW9/VAKr5W31DCgkCAr675Zr9M/qB+l2dth2bF
         PQ2ek0SrN5kdi1ubp1QjjmaNplczDVmBqHk9olm+Xnp3RdSVCs6LhI8SuY4FeoqElrNc
         h2EpYL7MG6ba5rnGYlMgwo4ANsCSY2gP4oYOqARsDdI19BZaQmnOBLZ+3n46wfI0M5Hy
         U+5bhYjXWKlgWXkGEo6GpefYQiPITPzzPP+SI1WWEoRKQEy57OgvQZ7j5wKmOf9MpzD4
         lHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPIz7/OkQ/YmBuaH4S2G2+rx7QNa4KiMIX8TSq5y7WLUpvHGYPzqvA2AOqLbhlJc1IrEjzZ7wepIlpAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw052lZDbNmanKk59l8zd8m1c+W1SYp2WIPiFy/w7+8wp8JdATW
	UM/zNsS1nm3FHHHl38kMb+Up1au+J3h+URGtxxrcbkxIR17c+n3QJpPq
X-Gm-Gg: ATEYQzxRNE72UsvVaOzLNTC+hacbR9S85Ie6kuLd0yVMf+IfkYglfwlbZGRs7ioNfwA
	A+WpinZTCdKlnxg8gSpptifC0tRIRny1QhDSM73v10+d5AS9b8tJmKDdUD8BrRkhNH8HirvfRm7
	+kQFqLbj9YVZfaL/Rs4ecV4xrmg7Rtvw4phcJq1ICIME7c84UcmdpMkZH99cH8Gscgb7djdJLv3
	3/cEhDhA5DxfuyXSR2t2u5rn4UehnMYmHdC1BiexaAEx3nnPYJIqCqIbK6au9ZrQQMAju624+8b
	QLaInmxl+cco5uXmQ1GvEjlJjWriJ/mXpwPZzm3Gte9j6QSNgbZgHyGw3Zh43Izxg9y/SZthkLT
	p7UOGqltFUULroTdlAhIf3t8bFweThf4EcxG3GZBILjWveQZsmslgC/mqMbBRfCovZekhtuHuGe
	NgV+Bguuq8+i+hPUZ5xngP0A==
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id d9443c01a7336-2ad74556f97mr158162195ad.50.1772016073682;
        Wed, 25 Feb 2026 02:41:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dba7sm133070865ad.26.2026.02.25.02.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:13 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Date: Wed, 25 Feb 2026 18:40:40 +0800
Message-ID: <20260225104042.1138901-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_024114_556569_8D3EAEB4 
X-CRM114-Status: GOOD (  19.02  )
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

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Allow the driver to use DMA phandle args as the channel number, so the
DMA multiplexer can route the DMA interrupt correctly.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 5d74bc29cf89..ada6dfc9b673 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -50,6 +50,7 @@
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+#define AXI_DMA_FLAG_ARG0_AS_CHAN	BIT(3)
 
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
@@ -1358,16 +1359,27 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
 static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
 					    struct of_dma *ofdma)
 {
+	unsigned int handshake = dma_spec->args[0];
 	struct dw_axi_dma *dw = ofdma->of_dma_data;
-	struct axi_dma_chan *chan;
+	struct axi_dma_chan *chan = NULL;
 	struct dma_chan *dchan;
 
-	dchan = dma_get_any_slave_channel(&dw->dma);
+	if (dw->hdata->use_handshake_as_channel_number) {
+		if (handshake >= dw->hdata->nr_channels)
+			return NULL;
+
+		chan = &dw->chan[handshake];
+		dchan = dma_get_slave_channel(&chan->vc.chan);
+	} else {
+		dchan = dma_get_any_slave_channel(&dw->dma);
+	}
+
 	if (!dchan)
 		return NULL;
 
-	chan = dchan_to_axi_dma_chan(dchan);
-	chan->hw_handshake_num = dma_spec->args[0];
+	if (!chan)
+		chan = dchan_to_axi_dma_chan(dchan);
+	chan->hw_handshake_num = handshake;
 	return dchan;
 }
 
@@ -1506,6 +1518,8 @@ static int dw_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_ARG0_AS_CHAN);
+
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1661,6 +1675,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
 	}, {
 		.compatible = "intel,kmb-axi-dma",
 		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
+	}, {
+		.compatible = "sophgo,cv1800b-axi-dma",
+		.data = (void *)AXI_DMA_FLAG_ARG0_AS_CHAN,
 	}, {
 		.compatible = "starfive,jh7110-axi-dma",
 		.data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index b842e6a8d90d..67cc199e24d1 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -34,6 +34,7 @@ struct dw_axi_dma_hcfg {
 	bool	reg_map_8_channels;
 	bool	restrict_axi_burst_len;
 	bool	use_cfg2;
+	bool	use_handshake_as_channel_number;
 };
 
 struct axi_dma_chan {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

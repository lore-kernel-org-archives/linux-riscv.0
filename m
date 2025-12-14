Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1219D5B170
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 22:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CCqJuObBj9l3tLuat4NojCPi/mPbQMj1Fhiy8mWmtE=; b=ceAi+g2eLSUIYc
	RDrTTvHnQ3SUCV5DZhvvnSq2+GTczStP+RpkK5hUceZsR2WtuyokylEc9R8iL7rYZj5qwTuNOkbVk
	EhWa9dDd7NYDgCD91P+I/r3Me+dJ+mdkqpCC3fDAitcBQN51tqhxwKLdfWzjA9NOuNhnZyVdkPiDI
	hgOscER5Nk74zJZ9Lhfc3Yp5QnmkMEylwJgTpwaufHQBbBkC/vW1icIaPWovz2baPqEUoviUrSTKC
	jcVixoZkb8AJ5w2uCFP69JlQ9zO0PxW3e8ZaW5b8OC5SNJM4cvKSqHm2WSxwQqGshMH/uuUDLmE3r
	XcO68R68/7ay0FNnlOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUury-00000002oF4-18o2;
	Sun, 14 Dec 2025 22:47:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUurw-00000002oEC-17Aj
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 22:47:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2175027b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752431; x=1766357231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyPrePrVyIxKolVVQUdwjbRSU8L6ctwDY64qSpxJztc=;
        b=HVx+2Z9DZyTntIOsdhPkF+pvug5t1X6WJRd4LTpgy3LIh/ryrHLhL06f5MCycTl+Ai
         DH7BLHfw7W0+BdOej0aq2zYqpIF//QCEOw8LGaLP148rkuVJaqLIPkczCoWwES4rIwud
         RioDYgSuvFgkJqK5icdYIqiorODC1o3TVfUMVoDC41mWlgnvtpHVxwrXldzs+BGY4mLL
         Hg3ncXRWDZgdgG8bKpiZGqayglMuV59hloVQ6CmFRRf7k7GYAH6pfO4IiId6WNSTc6q7
         GOWEH6F0YuOKi30uwzPzA9clH7nCCMJA11VMHj8ZPEtAEF74ykyuzHJW0shgYWys4dGH
         K4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752431; x=1766357231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyPrePrVyIxKolVVQUdwjbRSU8L6ctwDY64qSpxJztc=;
        b=s9LYrDb6NUE+ZVCa8D0fjYizcjJ2kQGgNcvZHt/q2BhJ3HH6J8/QF0dmUdkIHXC/2b
         ohk8qXbaDMTowWP9xJPytgbR9dQCPEIo2KOvvuapOcQDxMqrDeUUvBMfvEGPbRz/+xVz
         uDMzhMb9Stfa8bNNtf5yvkeiQz5WbS2d1P5qfalqYjNNIT4j0vTjhZ4pQKhxmEe80uwL
         3ZZSjSJzDrhbICN7Qc+tMJjh/Bp4vT9NJyqI1HLuBaQyNKM0lN3x4BDSBOtRIrGy7+9x
         jFHv67r7RX1ZDLZFJkEc6hU5NTcoKQywFf9lC8UGtS5u3a/S03RUEJ+iP9K9AK92ebUb
         WVHg==
X-Forwarded-Encrypted: i=1; AJvYcCWHngHjjYsEWZilpz91pLDbzRM/ON/dzm9G1JqhOB7if6VUp/1ZRGiojmnSFvEJ3mdt6lgFWH4tJfddAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyygfprE1qCdF9LtfrKIT+n6yKIgqR8Lf4w24iocWrb46D9reHZ
	Oy8tBKZpT/ysCfbxKSgnPzxRg9EZ+fFzuT2yct2jqcaclhovGEVcIvmH
X-Gm-Gg: AY/fxX4GjFiquAtHJxnRKB7QyTbEK1nhXyjW56Nuz+irXqR/e56LLkhfY0KJt69Nwnz
	ol57CAKiq1KoJ0m62TjZDMjBCIbJIrdfudbkjm33aEmf/nBgpXGKE/3MvbfxUCK4+iSLiGkkeoy
	/JjF8re1srquDNfj8LHv8eOYF0UOiMcg3QXka/vvM6p/2kO9ledeWzChv0X3C+U/kFy7RjylHAd
	5EdDKdMZBMTKf121qhhF5xPyaATgW1073DSTOM5cfCA/LVhhfRUTpNUVX1L6kD/8uMF2XLyd72L
	mvdqesEGhqIJMxVeHbqI3Zb5ArNejlBdUc5u5hLWb8USBveIL2GzxosPGJnTdOQ+QMwsfJYzMDM
	k9avnYgkqxuTJfLZbq+nvc1/5Vwavta7E+chwwfhXehZ4i34ZeGEpf3t5vktDbFQk68gVdZGrh/
	lPFC41PzbRuw==
X-Google-Smtp-Source: AGHT+IEU3uCYji7le46xC0e22HVzvq4FXx0kLGP2zcG2dgpXLhUjKAhMDK/pzyBxMtxqvDCTwIkxdQ==
X-Received: by 2002:a05:7022:e88e:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11f34bde21bmr6149821c88.8.1765752431276;
        Sun, 14 Dec 2025 14:47:11 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm39517228c88.2.2025.12.14.14.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:11 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Date: Mon, 15 Dec 2025 06:45:59 +0800
Message-ID: <20251214224601.598358-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
References: <20251214224601.598358-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_144712_329527_93382AD5 
X-CRM114-Status: GOOD (  18.89  )
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
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..829aa6c05b5c 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -7,6 +7,7 @@
  * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
  */
 
+#include "linux/stddef.h"
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -50,6 +51,7 @@
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)
 
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
@@ -1360,16 +1362,27 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
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
 
@@ -1508,6 +1521,8 @@ static int dw_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
+
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1663,6 +1678,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
 	}, {
 		.compatible = "intel,kmb-axi-dma",
 		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
+	}, {
+		.compatible = "sophgo,cv1800b-axi-dma",
+		.data = (void *)AXI_DMA_FLAG_HANDSHAKE_AS_CHAN,
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

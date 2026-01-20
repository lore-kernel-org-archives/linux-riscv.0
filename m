Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A3AD2ECFD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 01:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dj2hWt4Ip00AjDNqo7xnYACFjsa2NMXgj//jww0K6QU=; b=2uPMMczHFFJyUJ
	OjwG42uVBS5oWWheLfeDVRfjYRBso255/RLZgExgk/e4yvq34IAzHawBJyJlPLzNgkx4SoxPN1Lt+
	d+pw3UwhHUuX1b03yAGLE4xo5gtQaYVTJ5LuLcYZQqYtLUJMG5K9PjcOm/QiRCozcfG6IZut2Vdj8
	9YE7pdg7f9qi3YgRw+BTWfdC+vEns3GmOgiiuxKKPtKlqPbHIQF1g4TbjXvUMhOGsj1S+68obOZ4/
	iCd4tnSaFAbJI+OLEo2NYkaqt4bXmXIGP3clWzQTjiQloN85QQgtvWCKaXgn7c5lHME8rKuvmBEvt
	OvV+gzCCRKHs8oxPKn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0gR-000000032wt-2cgF;
	Tue, 20 Jan 2026 01:37:27 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0gP-000000032vt-0aCU
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 01:37:26 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2ae287a8444so2284085eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 17:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873044; x=1769477844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gH82B8wM8CiGczLPrX3tBjZxmPDBBF0WQaYSUsGab4s=;
        b=NudDJDdb3cIMA7KSNkNyU45HmWDb5frhe6d9tPwwiwTzByHcPikD2LXqEi5CSgopoV
         gAZ907obbnvy8hYwTwJP0xWKC/aYagIt68JyWijUuXbgrdJwp5fE0vZ6vsOyXi25qak2
         8fgODbyCldrGJpZDn+h74QqqUN6JOnJaE7cfNcxubT4wzGWAn2BudxQD+qwdI6udsW8U
         Gju3hKHnNBqeHneJERz8snd9CVs9tLQeUsyyKBqsLIkNprSd6RSJkad1peIOoZYtidWB
         Cwy1TuFzWslBe7wQ689GWkoU8BnaNjc7MagN56fT960efOKJlLBCl7r8N6Z1b+APgQzc
         kh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873044; x=1769477844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gH82B8wM8CiGczLPrX3tBjZxmPDBBF0WQaYSUsGab4s=;
        b=AC/ZUofAgiUDcg77ha2vWwgwcPaM7J25kfAgpk6XdllXIrID4Gt+J1lLljZw0sLLaz
         /nrHuD0ZrNPOVr5PjoQ4aDk6KtZERDLf1sqM5d2eEn+PRsJAou8T013ikVOhALI+eqWV
         4Shmwsqoq2SsFSAX1KNYpDkx6ru7EbmkBa9qSlqx4jcSoPI7UYq0iA3rjaWLH2julco7
         0MP4lqellNFidgz/Jx/uOIkfQzallc7/+3qoVKjPt7gnhrvCH7xw9SiAhGN7S9Hf0EFj
         s1ZEYKkTTtD5IuRNcR1c1XoWbDMm1hcFJnq9us2Jdlp0Ns0fT/8ImBF1d0/LIQBJDFkS
         Nasw==
X-Forwarded-Encrypted: i=1; AJvYcCWQZYjyrM9By6DPrf6dNWeSkZDTV9tONgklvMWmSYx208GmbhM27YStvHGhoa7ZWwWpjFGzs36q40YXew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8VBqDVad0cQ71o+UkcLUspzD4ynuY3JprY3ToBgx8YMLGslM5
	/R9YiHpWi1lsAjju7hj8cGxO60SkVBDc5NUaTquuBNwE3rlMcyAoMmKP
X-Gm-Gg: AZuq6aJuUismSkmmSgMP+0g2eBZJ5/5zyXdygZ3KOvegXWjXunDIUUFbOze7t4YX9/q
	QhMSTmxpSPwERkif2Ly2fHafR46gId4lSWAktTSZesx16jGOWuGcdyZ1n9k8Ue85Rl3Jjb8zdSh
	lKaiNEAKS+S4dXo/8JjIN9zWw2OlgXOeNW3OYCdBWdQ+yvNyNR/Xmz3wR6rOdhjlGwnrCvs6LKu
	PJg93murcAs8v9YMhQx4GSt0kfHk9KXeopEx7TLmHYHsu31dgGWNUdHhEMU58wbbxEGBobmd37b
	uqgNAKfvnau3EZBfz3S+YJXsQS89tkxmtH1FuEeMU77j5Fj0fMTemqrqOm4iKjU48ImX2nVENtF
	/OMN80mrZ4iDfZUHdl7iYWMyS1p1XM7VrdQBBYUI+AkQ8ZZPZPPZGgKx+l/NA+Bg/YgHL+KYTAZ
	0rsPzDerJXTg==
X-Received: by 2002:a05:693c:6097:b0:2b6:b9c2:7b48 with SMTP id 5a478bee46e88-2b6b9c27beemr9582735eec.20.1768873042756;
        Mon, 19 Jan 2026 17:37:22 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502d22sm15297558eec.10.2026.01.19.17.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:22 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
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
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Date: Tue, 20 Jan 2026 09:37:04 +0800
Message-ID: <20260120013706.436742-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120013706.436742-1-inochiama@gmail.com>
References: <20260120013706.436742-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173725_360620_B815B8F6 
X-CRM114-Status: GOOD (  19.24  )
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
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..89ded0207832 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -50,6 +50,7 @@
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+#define AXI_DMA_FLAG_ARG0_AS_CHAN	BIT(3)
 
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
@@ -1360,16 +1361,27 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
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
 
@@ -1508,6 +1520,8 @@ static int dw_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_ARG0_AS_CHAN);
+
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1663,6 +1677,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

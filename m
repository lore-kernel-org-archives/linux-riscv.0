Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED5D43367
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 02:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOCiTB8w3O6d8UaBeLp+bzrBr4Ui3U5w7WE/Fx/oQ4A=; b=BGzhiGPpfohjGO
	d/XatXeo+Gni21LZXYrcV3bgYhKLmkZTGSOqJ9OoTs0E+p7G7uhqDGY2YfBXYEBZpr7S/kYeJIniK
	GLxGokc5Sz8F+Mzisn04XNfIg4KlwCr5g6OhihD6TKdz4x+4hb5NAmdJ/uf/mnZj1DM5A57s9eOzH
	BXfWfRiQCT2s5YAfTTBNB4SCaEPtz5J1sDVLr9XJULvOqXu4jdoZ5ivNWoNHs3FY+nfMLhQUxkGd9
	KS1J++8gvoGHTiNNdlBzuXLzlr8240qTD7R2PSgB6GPXIIP4I+K7CGHVnOs/ynL4BY+zMb+n0iDD6
	uAeBZasnRDwtu/qMSzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXv-0000000HWOz-1tzj;
	Fri, 12 Dec 2025 02:06:15 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXs-0000000HWNl-1feW
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 02:06:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-343ff854297so927492a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 18:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505171; x=1766109971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UW8ta2pE4L/+9Yv6ju5XY9TcpGvPkrqtEfI1VIl2bA=;
        b=dMBhCVlvNxOVC17JkN26R6yWwqgYJ2koA5g0hSz19pZ0FMaea+Ae7LEXJtSrDYRqw7
         NyxQMX/ALtDoiGimRsFg0z8Nl6Xjdw1U18xa1wjzWFTF25/Cn9+SjHCm5gupYQ0Q1X6g
         +MVryru4UUf2moQW9Pv3fBm4CPWx3tXyQFzp0DlEo4zW0k+RDEnu8afqlecTFE0E2eOy
         Ws8AaR4o4Kz9YynOcrgfwfF8vmGBqu+KdmMt77dtTnbSX6pxuCE9EqbWL82yRDGepsEZ
         vAZaRBRES82VAhk7EoljAvJc0tRP2w041Y2xktmb/uMvfvYYYZKl0jr9f2EEc5PJiYme
         h8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505171; x=1766109971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UW8ta2pE4L/+9Yv6ju5XY9TcpGvPkrqtEfI1VIl2bA=;
        b=cOruwcLGZAfspwowL6D7wBzmZ4d3jLQLZCUJWXQpvKe8YfEubUyeust35H4lIrHik8
         fVmTe/7WhCMfpV6TiSRJS+ZDF821H+Ylc+aJbnRZntmfY0twC1euD9+oNtbBDGYqlqp5
         X/eUfIJTqTyaYFdWG8uJlvDYr0tbglC7eNBAB3CkdEiuVFv1ZJUgDbNqJzOG5aGSV1B3
         /7YT83yYJjX7BHZZWW3eFzlb9ReuG358FKRsuUA0OBd2rtFK8ZTn48e7r+cjGpI18LYy
         S9a4FlkRfOTNc9lYTcFEAUwfvc9UUrPQ02zeuNmHmEemW8Ch6WUKonyxZYeg/iG+/5Tw
         XXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEu71hPQP/NLONhzZqXZA+8WvR5TtkNL2ILTrBHSyfpmdhepw8PITbWAGEx2Kl/xMG8uzqTH/oPQzNAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV069Z60t+IG4QxfQz1Qzz1jMJTJW0yU/ArUGr/cjvThJ8YqAF
	UCbivWhXyI67hmCPhYisjkyNHZLsZv1s/un7bp0fMG35x+JVTtVPbajS
X-Gm-Gg: AY/fxX4MTA/bFUsCjyexqg8Ai2fs2JLEIkWjJba+x38G90T62/4sqfCC7/Tvv/3YJXr
	He+zig6kzrHuseJAumk9cEv0ebgAyW570O40IAVuDqg7+TNijREIzJv9hu5uj8qOeZiX6pqUytN
	0cV7pf5pNhl1pQnCOe9a2MeYONvTdL1gpR4baYXkCbrR90nf51BGAqqLNeZGeowJRWnSrpNfrG5
	OXHwwB5ptBZ+ej6ZPMlv865Y5chIv3uqsemKyVENgxyNcaulokYC81AJ1sPLbFMZWcwORtFZyPD
	qcX6R0MRk04CDQ3SD9W1b2+xYU9s0aV6hMtHGJIr+uq+SCh+R4vIwjhEa6KxT5UhHDxvLpMrSKE
	l9cDWYoyT04Yaf2MkNFCz+jfMT/vmLOsW7EsePsyi6AHWUONYCuONafCd3BuOUMb42VR2V/P5Ab
	Lfh+HDNmHJ4+OjLnNds5H+
X-Google-Smtp-Source: AGHT+IGSWde9J7Z1CP0kykXZdi8BkMxbnhMLXy73Xa4qFfGp95pPa1k3E1/AVaVXLlBhIIxrLowN/A==
X-Received: by 2002:a05:7022:f303:b0:119:e569:f610 with SMTP id a92af1059eb24-11f349a1991mr358648c88.9.1765505171307;
        Thu, 11 Dec 2025 18:06:11 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb3b4sm12959928c88.4.2025.12.11.18.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:10 -0800 (PST)
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
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Date: Fri, 12 Dec 2025 10:05:02 +0800
Message-ID: <20251212020504.915616-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212020504.915616-1-inochiama@gmail.com>
References: <20251212020504.915616-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_180612_441616_2A292997 
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

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Allow the driver to use DMA phandle args as the channel number, so the
DMA multiplexer can route the DMA interrupt correctly.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..62bf0d0dc354 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -50,6 +50,7 @@
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)

 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
@@ -1361,15 +1362,26 @@ static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
 					    struct of_dma *ofdma)
 {
 	struct dw_axi_dma *dw = ofdma->of_dma_data;
+	unsigned int handshake = dma_spec->args[0];
 	struct axi_dma_chan *chan;
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

+	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
+
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);

 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1663,6 +1677,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FCCCAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pub1Ah4pYsYWSo+pTcEsvD0HFUqwM+42s7AmF0XY+tc=; b=1gfLb3vxhsNHS7
	cMYDDuTRtghKa2QMbWSWMR1D3KOsAkHmtntRmbHp5I7BnDnoE7xRTmoSuc7g3kw8e+2IGD3Voc0AL
	ACHoRjxL1i39gHhlEwWXCVL7HNYxqisMMZFnjl/2pQy96XIC+a0kPlkZyoeGGFMkzfhJQ/rwptUTJ
	pZFwK22+BBIsUSIjucFTy4BMPyaA2fK3AKp2CYiF7FMR+CQqbZ39v1l8WrLSNF4cE4y4Ozu8NJZ06
	lX1p2lOfSeVu0X59BIfM9yaTBrhSuBuN9v6DGhllgjGeUDoOLzxWcaPa3gs0F0sO1hG2NH1MQe2l9
	ebJSeb9SYSsxS9F7okBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kmj-00000008ocx-3zLM;
	Thu, 25 Sep 2025 12:09:17 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kmh-00000008oaP-1uKL
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:09:16 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-4248746aabfso4520895ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802154; x=1759406954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=nxWgcH/DFs2STPRZU3jrNy6l9t3AtXH6f4zOribtCRVlDoqtAiGOsu+PwMSxW2j8uF
         or9IrIXxDzhR1r95kjyhSSm3ya1PWHrnT0HEmrvQK8Kjt04XNS1GKsfZynLKAvvgZVA9
         dD1KSCxdvh5zlBjAEA/igL/9ra5pG333xfyei6Hs84ftKACLXYnwfp3dYSRiQHKQPFZO
         MdXDxOSwt6ZjVKZfIlwNgQ9VYMLkrBFsWuU9H3KkwKd3Hq2nzzZXExLjbMfRjq/Y2WyE
         1TNPamauy1CENrtnZ/6zy8ZfoznCzQ0TuMve4qKm1UrA6vkYsjgG3CKEj8TwGhD1JosO
         66cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802154; x=1759406954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=Vy3ixPxX2Yu4yfwBsQ1ml9Ed94wQOyvcAWRy27WKnR3izd9+A1yUF3a4ZetXpVj4ss
         bqYmwPf9zEOqNR673yYhzK0G9GCIFBCWEe8l1C2gtUnJeT25e5DkBx4ZmyLAmS/bUCSQ
         NLoDyZkpmMKI/QU9hJSKLpANAbsOV52UJy9qnrJ2kTUmtMGZbu2pcfPI3p75dO6FHtxQ
         lnSHcYZukYT7KPDPK9NKMQwqm2kDl9uFcirIWg5q51iK3PYihLBrRJU9+BE0oWKa2NnX
         Toi93CTKBhTnybvEgx1ova5UUoJ0wSQDt+CcvzD3JIhwAE+poJWfyHD2e/X1JhoaXY3U
         dsmg==
X-Forwarded-Encrypted: i=1; AJvYcCV9iDLlffEXk7hTD338ryIpdT6jXMwTbxd4iXNJGn7g3flMd0EGIR6Ywk88LqFhsxE+bSYKbqZLYuwCyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlAzn2gj61Q61/5oIEYy5jnbiRvOyHr5lSZQDcnQJnMnYikiaV
	mzrIUKDy7b8WocAeAQDzn6XUE+iPkvIxlFgIQR90SIY4JJp37JH6W3bLNh7DnS1Htds=
X-Gm-Gg: ASbGncvNWMdkJnNNgaU7l/rwMLIgkTiQTNWXpRELYZWVmttg2wlwSTu0GaHSn53mdiz
	8e+1AG35X3XJ+8BLInGMUBAE91m2szvkGLPdIH6Hjw4Jys0CpWPNbPXydt2d6Eh5mPQpUveFmAI
	XcVZwDJmnZstJLIO1S+W6CyHZ8PfcDzGlKK9VnbDAvaM0RtfnTyk+YTJYtjbPKsNUFdr+64jzN5
	HiEVxiXbFUzNDkB7asguhH4kVIk/kx4RoKmeGoGRiQ90WFu/9QNIMjwcYId47f/1XesyzXFiYQG
	rOIwDY+NC8Z8OkYiEArq55RSewzPe+OOcqHQXTYidMrE7QWJzp+pwcDrlsGuuNsPiZ6iiQA3arX
	UDpEWc8dV7850kSDiGwOZKc8H6QD3rZnGSFwdYdoC98h0xXN+H9DJGsDd3GPuknJ0sQ==
X-Google-Smtp-Source: AGHT+IEBJ+drkM79LMDTsVqVSkGDzcPRYyPT9NtjqS/rk0F605YLf1DTbe9+DpHbYdMz9/5APp0ejw==
X-Received: by 2002:a92:2802:0:b0:3f2:b471:e617 with SMTP id e9e14a558f8ab-4259563e04fmr37344175ab.25.1758802154131;
        Thu, 25 Sep 2025 05:09:14 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5b29c1sm742821173.62.2025.09.25.05.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:09:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	junhui.liu@pigmoral.tech,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] spi: support the SpacemiT K1 SPI controller
Date: Thu, 25 Sep 2025 07:09:05 -0500
Message-ID: <20250925120909.2514847-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_050915_608073_4424D251 
X-CRM114-Status: GOOD (  17.80  )
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

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  The controller
has two 32-entry FIFOs and supports PIO and DMA for transfers.

Version 4 incorporates changes suggested during review of v3.

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v4

Between version 3 and version 4 (all suggested by Yixun):
  - Fixed an underrun/overrun comment error
  - Renamed a pinctrl node
  - Formatted dmas and dma-names properties on one line

Here is version 3 of this series:
  https://lore.kernel.org/lkml/20250922161717.1590690-1-elder@riscstar.com/

Between version 2 and version 3:
  - Add Conor's Acked-by to patch 1
  - Add Rob's Reviewed-by to patch 1
  - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
  - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
  - Added a comment stating we use 1, 2, or 4 bytes per word
  - Cleaned up DMA channels properly in case of failure setting up
  - No longer use devm_*() for allocating DMA channels or buffer
  - Moved the SPI controller into the dma-bus memory region

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250919155914.935608-1-elder@riscstar.com/

Between version 1 and version 2:
  - Use enum rather than const for the binding compatible string
  - Omit the label and status property in the binding example
  - The spi-spacemit-k1.o make target is now added in sorted order
  - The SPI_SPACEMIT_K1 config option is added in sorted order
  - The SPI_SPACEMIT_K1 config does *not* depend on MMP_PDMA,
    however MMP_PDMA is checked at runtime, and if not enabled,
    DMA will not be used
  - Read/modify/writes of registers no longer use an additional
    "virt" variable to hold the address accessed
  - The k1_spi_driver_data->ioaddr field has been renamed base
  - The DMA address for the base address is maintained, rather than
    saving the DMA address of the data register
  - The spi-max-frequency property value is now bounds checked
  - A local variable is now initialized to 0 in k1_spi_write_word()
  - The driver name is now "k1-spi"
  - DT aliases are used rather than spacemit,k1-ssp-id for bus number
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  84 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423FBCCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lc9PIH1B78C5SmY9AFK7TTd9M5pVOTHpQE81H62Po+U=; b=PZFCBRlPuv3m6r
	/Tjyas3nYExnvzJJGT7NPknfc/bmtrqo+QhyypMygvP7XRbCLdHO5GjXv2bCUBmQbm1mi3jeuRpO/
	6kAED2B/gGhyJODuFQjAXdc2u1rMBC7xCqaos7MvBxVyZYmKZa+W/2oNcqoZKE0/rsMqXXb2Lmg74
	poWSN71d9Kv1w1+7IiqnBF9Apb0J5ffGv2KNtyK+wUXmRhqU5x6Lub8aRZNwFDMGqyXHX65u2rsWL
	b+sukLuZK8xnBQPRhElGIVMm76fFuayHHek0wiwDsrRYLAlgipf2KvHuML8ZSH8DhsuR5r1ClOXua
	bDCf2G5FVQVuXxP092QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMkk-0000000DwLl-0dP8;
	Mon, 27 Oct 2025 12:55:14 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMkg-0000000DwJ7-2pXs
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 12:55:12 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-9379a062ca8so189484139f.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761569709; x=1762174509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nAF82uQdqoZ+b3y8tjZiPVkCVKQg6rD1LcHeZvN9hk=;
        b=ZHmPJbYm2cjo2YjF8gS9lWcT8+Q67dxE0jHjHI81CHYpbkLVN0R6M1p53JDfpW1TkK
         q+x/MQTHDo9DP1vNTX5ObGU+7w4Cckbqgn4H5/pCWGyuoLJcDeqI1aZBplJaXrDgyoWH
         iyjyi2ISU+DPi/XsCs84zHYMe/nTrv0oxBhBEiceMPgqoTlarX9Q4iruQK3OhqgpsYwT
         npcwRjui/AOgwd8QfMKW2S2qAHp2V/p28ttGNZGXSAf9cjn2EBwdr7bSH3/NI5/9Q3lr
         kIX75AsdRsXxljyBxu0f0XdKbq8DtCXntXzrj8Nv3eCQbCKjCit8HDe8mSwVD85VEyue
         3Mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569709; x=1762174509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nAF82uQdqoZ+b3y8tjZiPVkCVKQg6rD1LcHeZvN9hk=;
        b=RzQXl2RJIx/o6/7RCqCQEGK4FKAyj73N1Zsd3Qku2c2PxMNtVWEjXuWhx+bWdApeIz
         85xb3xo2/L4hERm8sz4RAfC9VBTJwV4IlQzir5Eo9qR5uE0fPHiZPjIrDV1yCfGbsHo7
         8ykyz4BcA2dU7ZWm72wRUzEvxgPDsSrZTe50qBJSLxUiteKcCMk/CcY54RVCnDFEeA1z
         g2WC65UAyDex6ONNuuHbFXwqAg3i0kJliSwz6D4f/kBZ7ddOsLI8d0gx/NPKCpkXUnTA
         LXl/9miZP+zQ9px95P2u3MlAnEc3ZkIoIef4MrIe5ILvwo6OZSsg1Fa85DnW18K0YqWP
         s/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoLHfQIf7HoxAhEe0RR8ZXMohVHkbw25u5THaXE9OOy73OQ7LZAM0R0V3A+Lv85iwwbI8479sWtEE4+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsGNdqhoglYVxPUTnL9AX8Ooy5rniUAux0YUZ8EMxU2c55K4j5
	nS4uTRZHPlroNykkZ4zdaTy0sBVc4ixYYT3Ee2TOQKRIWfJDk6ALEn91IpG4EU+2QZM=
X-Gm-Gg: ASbGncusCjQfhVY+cmaBt4ey3Z3ra4hiLY1lWH9xD5PypUwMxqDUlGNx4R/fvD/MVYi
	YonbE/qMA/W2mI6jcyaCMrpaZT9fJrOCqDDdtxfogoTIBmDN/TUwwMY6MNgVqyL/Ca8H9SIwDSI
	mEFR8LSCxg33CqDvEIqP5Py7NjMYw/QercCoh5kRrhyGYBhODsqeH+751/7eKJkG8RXZN8Lk3Vv
	sEAs9ORJ8so8EV+sbdaVsoZc1iMwgdLcfXVx2bdnIZWU7aFTnWmgpDfrDd+JEHKAB8NN7pkwWmf
	16ghvaCWjT8bjh0L3tOK1eVd9768HmoSNHfi0BaKtEFQCfn/lXka3WPr2C933/mg4Ic+QZEmcsD
	Ep8U4cwzj/FdbdFXuxHCWqfXU5HSUstXc43hFI4mYVJsqYrrZiSML0QuFVktUhB13hLpRJAtxvw
	YLyN5L4b+vElf4kdzugq5bQ6FZkgFDTYbBCa4sdcCiHkaNZ2QRzptrYg==
X-Google-Smtp-Source: AGHT+IF9dogLPfu3KKBrg4aJADxwDW+rw89Jp80NmbsD4vytQNTH3nxBh7Ne+iAACQ+ZbrAmLBB0QQ==
X-Received: by 2002:a05:6602:29d2:b0:93e:871f:b060 with SMTP id ca18e2360f4ac-93e871fb6b2mr5001344339f.15.1761569709430;
        Mon, 27 Oct 2025 05:55:09 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359e742efsm249121639f.7.2025.10.27.05.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:55:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 27 Oct 2025 07:55:00 -0500
Message-ID: <20251027125504.297033-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055510_956579_E75587E5 
X-CRM114-Status: GOOD (  18.60  )
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

Version 6 is identical to version 5, other than being rebased onto
a current linux-next/master.

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v6

Between version 5 and version 6:
  - Rebase only

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20251013123309.2252042-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Yixun's Reviewed-by tag on patch 3

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250925121714.2514932-1-elder@riscstar.com/

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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  15 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1105 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

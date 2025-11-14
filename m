Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD044CE8D7B
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S7f9R3VPSijL20fsZ0anVx6pWv1fmKsmnDkLzy5Kaf4=; b=KXBKemB9my9kmQ
	sMTXh2Pi4MRYk1oeo8odiPIyPnOYuuwk09PKJEjt6iw5vXz56jri0j/4OPTAjeCmzFm27h347Ws5R
	eww2+DzS33F0HQnBcP8vRz4qFRrgAIf3IBU7sX7zK9hGnbDooLEL/BZh+Q6Kaco/wNlc6gYPXbYZM
	0hyt9HN0S0qH9LkYVVCRmI/vwjRpwS4PFCGgaFHEDb5D1GJku0dXC0t9h8dFjWoo9UrcLN+1OXQz0
	PTweycY/eaeqizdKneRdGaNw1MjFrnPME5G2Rhg3hhc7Y4wZTk7geFl1M0YdnVel51c+c0D/sYH2h
	Go88pWxRBkwQPbLSaVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyzY-0000000Cys7-43V6;
	Fri, 14 Nov 2025 18:57:52 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyzV-0000000CyrS-3XVY
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 18:57:51 +0000
Received: by mail-io1-xd41.google.com with SMTP id ca18e2360f4ac-9486d008fdbso109380739f.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763146669; x=1763751469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qXJqiPsnANUtpsR8sAeXZ7h/dCQytG5r8pVCD3h57A=;
        b=0zQXEAKqw8aEVXoFRxCx5kxhFeqFZ1lCM4la4poYSVKhzP/ZFzd+T6S09T/azY+OW8
         PEpuhfIbPrr2K0bjIZsjWNB7Hzuj3/BAHw6rogsiqxIxLoStF9L6NavSFoslUmTe2BlB
         l+vqpYyZItog44XCtLPhvYO6NOteyOSBhZWfFwKPiH2Y7NLzakx1LpLDiyLM+zYDdeM+
         quXnZyvV90euRA8ImjeCeJP8jVzychc76L66g30SDybWMKc99BQk0eMVihfiQP5Y1Cjh
         +9vD+NavBMe5fsGWawTauTal2CTMprr4j2rVWedZ2AC+PjeTlayVovG4omcqi9cWjidy
         S4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146669; x=1763751469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qXJqiPsnANUtpsR8sAeXZ7h/dCQytG5r8pVCD3h57A=;
        b=nMtnWQhej8HLKdHQ2J3JL9Xq6HVqPeGSN/pTqfwtZGfLX6al7ZFTSgGMXec/1HklUK
         2JPrfEhfoPj2D8y6cNZ7fCFoKuPdbunU7zJZA0SqTK2hqYpUVg98uB5vHbGPi9rlc0ry
         npfX8m6yG7CZF2nvXzDbWBY9WT0qSI7oDdquFYFaAz1mCHuiDpKWBvjPyrjzq9DRv/20
         h1t4YHn4hB3cL0hBZpjVgK5gWuQsVDqYi8UCcCF++PIMYSqjrFjILRIfkdp8+EpCefEG
         dtUZH8S7cZQBPCWN4FD1e/WYxucvORwWMaZCmJaCsZBvoQ0IiETylxv+zaCz+z+VOcKh
         WEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIv9VVmiGD2Yd4p2MXP089nSllki1loqwzjgGf5wnm4OhSIEANAhamPBA9/yk4/W4Djg/2GOMjFbHiYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJcNdtS892nsdvGS5N9dfAdh3QSAmGaaXEcSyaWSTgSwdnHlcK
	mp81cJ3eXB40IG8qO8Tb2V6hvkwZUDVXGygLynT0B4RWuKrdLc6EOXqKsecx3snt3R8=
X-Gm-Gg: ASbGncsVeIk8XjmJ4DRZOgo9naA75WiPZLCKG+lRd0UUobx5MPAxrqcJafcBJ/IXCwZ
	wphQHBw30qOAYj8XSAo5l/sLdKscwn5DiptoUVmG5KYlkLi+D1JqGYGzQjdsp3LSz7iOp+maiLN
	5H4kXJkh35Qwst7HXpVULskvbfKh4Rih4waeMaL49bkwwxdL1Xsux20vuqyM1dvTITpSLsqpD5q
	mA/Or5lehMpYO9o8fUFdRXYGV7HAnMGnb9YQZsXLuAMq7mVJSHIb+xTzwbYN3ZuW8RxVv8aUCVY
	G1hkAz/tAKxQWNxv9XmA1eClRePsCozMnpVG552jLEVz5nYGV+6j7HIf1NRMwyq2CB+s9Rk9JHP
	yycCGogwKEDD9GFj2j2Cg4WLuHpY94wSI5rRBn/Uae4qvjfMzZ0UV0jg1bXw/6Ahsee0NMFmIEb
	GRuJo7dqx+YdT3YvLotnoPEdQMsbIt7qiEY+w+afzmqKccwsESFBNJwtQQalOX3Q81
X-Google-Smtp-Source: AGHT+IF4Nu5xfllgas5VBV6/o7VY3ZLAK+xfSIPCiHas33IRbeDvWn8RhVK1Tut1/N9t2FgYtTTWTw==
X-Received: by 2002:a05:6602:3429:b0:945:a834:5951 with SMTP id ca18e2360f4ac-948e0689de5mr706912439f.6.1763146668632;
        Fri, 14 Nov 2025 10:57:48 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2ba690bsm278679339f.8.2025.11.14.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:57:48 -0800 (PST)
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
Subject: [PATCH v7 0/3] spi: support the SpacemiT K1 SPI controller
Date: Fri, 14 Nov 2025 12:57:41 -0600
Message-ID: <20251114185745.2838358-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_105750_149079_374D23E6 
X-CRM114-Status: GOOD (  21.01  )
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

Version 7 fixes two bugs, and now builds the driver as a kernel module
by default.

(Note, this is a distinct series from the QSPI driver, which was
merged recently.)

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v7

Between version 6 and version 7:
  - DIV_ROUND_UP_ULL() is now used when setting the speed, to address
    two errors reported by the Intel kernel test robot on 32-bit builds
  - Fixed a bug interpreting the resource pointer in k1_spi_dma_cleanup()
  - The driver is now built as a module by default, if ARCH_SPACEMIT
    is defined

Here is version 6 of this series:
  https://lore.kernel.org/lkml/20251027125504.297033-1-elder@riscstar.com/

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
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  15 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 966 ++++++++++++++++++
 7 files changed, 1102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

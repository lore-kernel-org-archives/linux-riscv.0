Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50030CCA476
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKfl+KNJDfdlQ9pPfyA6l5IML01CyBWZ+Eg9rUHpZ6Y=; b=fhUgEDBRRwEdtD
	uKdG1NAJd7ImlFq96zNAVe1BDJN8IhhAomuhZCfb1E6o5wyErZhHx699THVLDiDmcbkb+b/DpMp3o
	bkS+y2Ym9wgzffLkl/WoYNNLjt5faCYAEIcDBxsXhOR2uvCtVLHytVLwXzY2YK29EA0tcDgwv1x42
	oO+t++wsNLvpISAq2hjBbodR28wKnznGuyEwWxfe4IEUDCiWI6aVYl83z5UXTCHZnYMiJ6jo0Rx9J
	WROhx4Fhd9KETH/46Z+NRBo2EWwwyLJhBCMFsJs/Puq2tTGiu15h0Os0uLzqDLdpFNHJKV94/7n3m
	LrW9kUswtYakhMaFsQpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hjq-0000000D82F-0T2L;
	Mon, 13 Oct 2025 12:33:18 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Hjn-0000000D81V-0q3E
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 12:33:16 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-42f8b7cd7e5so16707495ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760358794; x=1760963594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLrx3aJ85cahSgBHalujwwLYoL+tJ6ZOd2UYi1030U0=;
        b=elSyRdcYzqocRfVkwisANot2AZPSVkYtzlOQ3mEqukEYHb5v3JGd1TU77WzqdgoAo8
         lHM/AHZ4fvXGs9HyhoE81ke6Pvi9ylO42OOtstighmueHk5wjPmzQkENcWBK071lylKi
         yQqMytx5SX7Y5ZL8/ra4+B2pVKDIrxa1THOVSyaQ0NA6N2AAFsk6yNhCL0itHFun5vnm
         Yk2rMotCwtSKl50HTB30HE2LrB/wSe3H9aWjrwIclhnau3S7XQi6nZuVTClExehb5XTv
         a5awWMtO7MK2kRdOOma8fzqSDhh2cnqoFHIcj8Z6hh9yp+JFp1AcBoyIFYjCOqnklfmB
         pJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358794; x=1760963594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLrx3aJ85cahSgBHalujwwLYoL+tJ6ZOd2UYi1030U0=;
        b=rO+tWxFzY10CmfCgHa3I/mp5AuSwhRvK0d1Z5IQ+HGZSnyMElI27L9oUUTZGjV5tI1
         u8Kb/8oqyF8o494QYLcXQG4HC97Eo5i2BQt72M4025q77gvKTwS6ChMjQGZ4urZsrGFv
         tcDDI+oOS10D1iWm423efFLNZHaVV4BLutGQfihwp/u0HMxWj5DIvvyIWGiSlqA3jhpy
         RcNg3b/UpqHbkrhEpJr5gRmNFS3zv97FEn5ySBmWmCRapMh6LXI3i/kYfa9nto1ZArdV
         Q6yv4Ia9NAT40lA5AiCawPBG1dSFQum9kylNSkv9nQqAbaytSuFU95D9sc7SNVf61+hE
         TaCw==
X-Forwarded-Encrypted: i=1; AJvYcCX6cbIXCwMoGHU5RetjCrebaUr+3uqez86CxxMXaTst4ku3oAHa74jT1C1BCiNTtcnpTl13tg2GegDIbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVpvwhBifQPWhlJ1pAPBnl+ayqTrRV4GURHqDnoMOyGlHPbaIv
	DadG97GeRaCQ9nKQgS9levYFkROlV02kUHDd3BRQG71AI96UByWRdZAw94w83k0yNJc=
X-Gm-Gg: ASbGncsfiaNxX+gzBVO2Hfa1503GZjYj7DhJBucfjs2ksn7E3pA9CsLG+RBbr+lvuNN
	RgPU2Sl6P69DAXYHFJQiAY186DB4w2OTccy+AJbNu8/8u4TLi+leR8lJ59LBsjA61YJV/UYJuex
	NXDeKpOa7rWGubiuIvFNm96QFKs4ZLSEKaEVWgCynpP5j9Rw7xbZy0Xrog5L/F4RYF+Ru80GcRl
	TUJxzUBp1UZYZFNc+JGzHHSegHjFZKxD1tf17ol7yASllRu5Cde2r4ayKuDBh1Y8+bqf3E5mKSl
	FSjJ/Fl465OES+ZqCOxoPv0F0Yypoz4efVbqJpptD2uoCUU7K8cJELsStTjRCLymz3j0nP/s3aZ
	/rQ0gvJMjQsfJznQc0nwN63uyQZgh5F71SWHTPyBM6QRQrEFrVgtnrAlHXA+kI06en6ZoJQdz+S
	mfN/baGHth2K4/5MtT4hs=
X-Google-Smtp-Source: AGHT+IFg0DwI3pqrI0r0Isbt8WNPInul2Q08ViVQNFGip0noHZxRDTL9hoja3a4mal6MKLFRgicfyg==
X-Received: by 2002:a05:6e02:4713:b0:42f:8eeb:49a1 with SMTP id e9e14a558f8ab-42f8eeb4a2fmr172406555ab.13.1760358793820;
        Mon, 13 Oct 2025 05:33:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9037e344sm51529815ab.34.2025.10.13.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:33:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
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
Subject: [PATCH v5 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 13 Oct 2025 07:33:05 -0500
Message-ID: <20251013123309.2252042-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_053315_358008_EB2453FC 
X-CRM114-Status: GOOD (  17.28  )
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

Version 5 adds Yixun's Reviewed-by tag on patch 3, and is based on
Linux v6.18-rc1.

                                        -Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v5

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
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

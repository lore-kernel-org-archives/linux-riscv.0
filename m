Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF9ACAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YY5U7VHU6d4EzBK/D+gYuqXZLwb6N/V6ETFDOEjLf0=; b=tKO4zQHLyDq95Y
	Ix39wTCxg6tmLZ7GNpKacsHI5vo8Hgin2TIZci5LSoP9MOhm/759lr1dShFR6Y5aPkoc69C3hHpCp
	qAkcZuAtJ5521qDxWls3cKG4y4E9+f1l4YhvS74FFz77OreSXOeXKLqEowWTV6p6ar6yDazFXJCj1
	I8e2PLa/vG6eOOewnGY7zibRdJ4nS4+JB1q1w2O8rTMu9gcDQB1YEzhD3KxiNy7bU7VSyUtTVh84I
	SODLcA4xtH2oYIhV922ZpVSxOXdQr6a+XcbFI6uP+Dg5C6UCNNxJllbAIZHrOp4YY5bZQOTx5qe+u
	Usax7dRgk0Ur2/Np03ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdW7-00000003RSB-1YyL;
	Fri, 19 Sep 2025 15:59:23 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdW3-00000003ROy-12XM
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:59:22 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3fe48646d40so15446495ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758297558; x=1758902358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PieohXBDde9aJoeZPffJCOlv0SEwDrquFxpLVqeOn8w=;
        b=P8r1WK8LIHj/o7Nb86dU5Z20BuQsw/yJDjI9udVk/3J/qXPgoT7YGcm6mzMZHUu1Qg
         kcbg8Tz6RDc83mCo2MghbnOLuW4FXyG3BLf+arvxPUEeyRPgQzC19d9/5QunHXbkgOz+
         /XjajuCmlmUUreYyeZqdoRSUxuNKQcQNn+9+ao9yh4h4R9QXQkxUDLthsudJHZoNnKtW
         OKULLknjOtXZevKnz12Dtdef1dNElcAQMFY3n+LqtamK/w+RtaVSI0/3J3oHv0VlRPWu
         uM9Ck+7iyGuUFrc8kZ2VbyQ+78r4biLF86sNgGeGaeogfaatpaS/IGvJpurQCuTwqJB4
         5zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297558; x=1758902358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PieohXBDde9aJoeZPffJCOlv0SEwDrquFxpLVqeOn8w=;
        b=XeOqJHYO39Dm8NsIR18sHVuyz4S+7i+KsG6R4gPAma58sPvFnWj7qDdUW4DOLjKvYg
         OPKoDIHkyRQnkTeb2h3Y5VmXyPbMHvMpMAkfJn2xHgGkViS6uizVGOIZgbxda+4+rfif
         EIugfr21MJadoKCU8IKk2PCIMDDZVzJCnRLcMSkC70YGs5EmEPL2be1SaluIvTIdpOsR
         MYO6DNXl+rDSpQVyzjWQqMY72F2O75zrtf2jPHq9UUlKuLrUHHCMSGGcwIaykwvk9g+W
         RAYZUsprsVFLZOXflQzrZSvn06snTILzhRLZyvBtuTN+1XyBrilWg6wXZInxAJKVOvQb
         X1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUc5vqRI7Ym4y/SN/78jFGUKo4KrC9qti1+VvivVtK/GFj3wT0PmEJkOyP2VC4uJ2Rvf0LWY5Nky+8ssw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqZp01V13Ednx4S8vbkGc2yomb2M29UWfRqziFD135hqWpe1IP
	KLTDh8Ry3xGa0HVU4v3ZKyehyuBgSvwRnmNnRFJjGty5Rzo818d0rLAA2/cCgvmNJuY=
X-Gm-Gg: ASbGncsIVgt+YTyQfG38YP3d3aACHGRlDJ2IFPJjr1u8uorkho7AQDqvS40Tr7BBZMh
	rdfohqecI2JbGdDdLWex3kS67yktwkX00mCiNa10mf2etvMczVlwMef0QDsNDWJmUlpZyyKYTkZ
	Cd1rK8eS8RDt7TJOZ0R7cyCcmFAnniIsTKHV/rDpLbbbeb5wNmWV9XKYoFsG6PaLqKg6Sluy0Gs
	BP9tUh/QNmLp5iRB7qUpcea/QqfOBFVyZMQHvpAAdP1bGzyIZfv40Y+PC7d5psNrF8yF45Mh3uZ
	SW0TIizWRg11S7FghWXFlCGraLtE/gtADkn/T7HglYj1n+yBKkOoBFxOLozN04Ok2ZqOSK1f0HV
	NsV4dTR9W8kor3SkX6IVjwitvBvrAW//cwJON8kQnKsMbGtGyWEtsv1BXqmVocCFW4g==
X-Google-Smtp-Source: AGHT+IEjqrlSFIoeKxmjUweDtrCLwaQpAtyQ3arbMa+ZmRjzpi9BoH5PVFn/nUo5LPbXaE/8/YT8KA==
X-Received: by 2002:a92:c5b2:0:b0:411:6759:bfad with SMTP id e9e14a558f8ab-42441af5df5mr105138315ab.10.1758297558106;
        Fri, 19 Sep 2025 08:59:18 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa460bsm2250898173.52.2025.09.19.08.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:17 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
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
Subject: [PATCH v2 0/3] spi: support the SpacemiT K1 SPI controller
Date: Fri, 19 Sep 2025 10:59:10 -0500
Message-ID: <20250919155914.935608-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085919_302517_EE35EE9F 
X-CRM114-Status: GOOD (  16.18  )
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

Version 2 incorporates changes suggested during review of v1.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v2

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

 .../bindings/spi/spacemit,k1-spi.yaml         |  87 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  16 +
 drivers/spi/Kconfig                           |   8 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 968 ++++++++++++++++++
 7 files changed, 1107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

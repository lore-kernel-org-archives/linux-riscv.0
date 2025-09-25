Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239E9CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pub1Ah4pYsYWSo+pTcEsvD0HFUqwM+42s7AmF0XY+tc=; b=AcJsSWwSTGCRjK
	PaL/+gqDkhQJVL+zgkqvX87A7m4pyHS+AyB7Hufj03XN/GoO+w40vpdWNmny5kTA0qcnWx09wvOiC
	Jq5t06RGRobduvli6tIgYzVzhjSHu8M1/382bZ+3asRX/PdcoMcSd+FpsaV3huC7pv4FtkvuZKgaO
	I9Cf6W4cWq1Jbg29XZIuPYK7ArvJRUSAUtR2Zo5IK19Tcy3578Xplj8945RYMRxTHDUMo8fdi6uCz
	uj7VubG6aPb9xr/p0eidCLk5l3UyQnQ+CFVE+XZGTyEjxeuFia56YNpg3Rt1YbKqMgijho9fqXKq5
	YkOfOzL0rLz2iywfRe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kuY-00000008ssY-1JFf;
	Thu, 25 Sep 2025 12:17:22 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kuW-00000008srS-2Tz5
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:17:21 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-8d593793af1so37748039f.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758802640; x=1759407440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=CpirubcrFwwA1XTdNPtHh74KxRTVFzem9DGi0DqtXEXspRx/g2wZcelVRhtoSz/tDt
         +6BCkKDyOmqZEJfFdsHCjpr6ypAdX4SM6dZQUvseR/vsInHE9ibhmOHIA3VCF9A8C7QE
         2+J3V+pyddvK76DQ/4Agf7ebQGTaE8rTvJXAQ722jGqFYwssAXQKymkv65FASvQjJtZU
         MZM/CBmV89PjAtfmgYbwmAJm40MeWmR2IjtEGnE3Y1/hfldaUs9Mx3epa21XH3xJiQjr
         dvE8ZXCQK+359n7yusGnyyHPVlVpJSaZ2oOMvZCtFGgux6PfjU21/aYlDM2pEP72SxVC
         Ponw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802640; x=1759407440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHsvn6JN9lNBPv+vuOCqB081gUg4QWTUGs8Fvt4xcvY=;
        b=T0uxms9gpbdJxBc5DFIqpxNrohc3iv5iMh2DuJZXm7SlcjXCefKh+dLLv2iAbi1sIu
         dfJiTsfrkItJfZkGl72SPMTnDaK00kNMXG/u5x+HOu8j1U/Akj07ZJNIvwqpTg8wKY1r
         HQa0kk0csLvGADR8BP6sHy+P43XHyl4ZCNb32lpJ+EtNGXqCfoE0foHKb3XpZFNpaNBU
         ozDvLzgGIFqoi57pjDxe3kpnfe8nPNxKDAFJsQj8LOYS++8eSvDFLhb4k4z2A1iDX+0D
         YPKXwVs1j022HSSlZbdBW0RDDgMV8lg3yyVZ+2EkHF0TeHJU9QDDzvPaU04NbeBcPg/b
         l14Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpZhAe+arP7nawrd+FUrGbLBedGxynHnYuj+NtzJ1Ck9WmUlWfc79X0ED37jtJlCF5A7S1n72kyqU5uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynfA+W0qNaK5JdIkuUO2DD57ggX3n1jL3fLnOl3v/CCh0gmD1s
	iI2hKOydDzd5xj1DRsJiMwPODWfcTaqbZD9oubiGB1wM7julmC92Rz9ELh5aRkDZ2G8=
X-Gm-Gg: ASbGncsCF/AhkcpX01jMr7QiF1NhJZPCJrQfLYSffFFVoXO7HVakUuaa9xJoeQlo4L9
	aVjAhA5aoMJwVUogdUJQoPzetR5Ipj9in0lj42LfE7cih3p2S0j+JzjJ82/Jci65xAjdO8kJGi5
	z06XbzlbBhuXosKumbjWW3JQnxpXh/2YtPpORdB7FlrCHUoG7aE4FSZxwzjb0VVgdGIOFbuIJ6D
	MoWEhaZl37OxCnyLQ8dpO/7HXDtY9ppzppGbjl6Js9XE3OXGGz/EDvK76JcPJetWgomLqeLMEUO
	Sncxkudk4oOfD2tghzTJ7G1g7bEJpPhbvEzZEGGguGKMLfIkV+Yq7pjSxLFGbEomrVNhhsyU5O2
	JHl92ydSUiax2x0KrHGDh968iuI+WiIhcyga9bLTDcDZIlLjYVHKPOGfz4HZd/tWQYw==
X-Google-Smtp-Source: AGHT+IFItDx0CgAF9/fDAUUs6ylh3g4EswI9rpEOCYIuQ62NnMT5cMivYNjp0gufj/IrIj6FyCAjzQ==
X-Received: by 2002:a05:6602:6d01:b0:887:690b:2594 with SMTP id ca18e2360f4ac-90375bc2ccamr342646339f.5.1758802639509;
        Thu, 25 Sep 2025 05:17:19 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040c57fa59sm66918439f.16.2025.09.25.05.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:17:18 -0700 (PDT)
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
Date: Thu, 25 Sep 2025 07:17:10 -0500
Message-ID: <20250925121714.2514932-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_051720_626559_7A33E6DE 
X-CRM114-Status: GOOD (  17.77  )
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

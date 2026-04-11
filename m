Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD0BF459EE
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lbw9fDLLYJ6nojW+Yx/bAeU8JCvRijfgPGnjRVQ9LaU=; b=naBbhki+yiquuj
	x+BTGWNknNtwJgvt4vCbK8xMnNO8Ni6MBm19SXAt2DGrS5tMUxY6x5FvQFTrSN5RswunZbQPXN+ZB
	TfGtG4xOPl6NctrEBGOhRB878fRmcKMZ2MF8B9OKTfGIo6xTtZYyClZ7NK2uR5d/TIjeoL7VvmRwO
	LREyvUcbsEqhU3nP+zRx0nrR35CYGccRMUHMJQMVZUEvwlix8MVuBwoxqfGBVFpvVjjgygdSVHVxF
	GU2qpIoFVoErWj/6kUGEpYBkGtN6M6Uy+IrJX9QlcXbn0cmv40v+m68GYsxGdFZC36mr1ADBLTnC+
	VVdXnaOqMHOEEJjgs4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDPj-0000000CPlo-2i54;
	Fri, 10 Apr 2026 15:04:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDPg-0000000CPlT-3Qqd
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 15:04:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82cd9d0eceaso1604551b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Apr 2026 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775833491; x=1776438291; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyFmM55+8nwlvhnoFbA02HWarg4SN6Bckaku3Nj5Ch0=;
        b=0uTOtOKF6ETdkvJ/lZC3KtGaBO6zUl/LukVLHOr0QtLiuhusjn4JfpxuVxzPUiGyob
         agUX5+rryVl9gG5hMFS4f4ZOz6fHXThimmvHig6wk7bclaxWc5eSzflB70l0dkj6MDwp
         nHQxE3YszwfzXTQ/kfN6zMMC1IvvXxrTL0ETZi6bHslBR7+01M8vWUnZW1xctu9t/AAX
         hH96ex1QTib4v2EmW9giyZQtE+k7qc2wMqbGPFstyf87KiqfMyyY0MEyqr9pqA3cnedU
         jNtjIxR/1E83NHLT/mrQD5qcikyOHttBiEnvRf4T4vRp9Zx2YLYWSoy2Zwc1+lkY5IiS
         eYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775833491; x=1776438291;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyFmM55+8nwlvhnoFbA02HWarg4SN6Bckaku3Nj5Ch0=;
        b=g3jX11HfZaFxntH7Rw/KVW5feUeXFqb/XKM8H+uoTs1EINqSgiPpvygdmbMcg3Ejr0
         hIgsVIL4LoN5chAqHZf0hFNkadJqBamvBnT2MKJeSy3NDGIFSI9smhRENrC4MWI5XX5P
         66MMBKIy756El29YizExYcWg8VUArOxZKwwmcJBGTGue+msut5scn0ooCRYMZJlMTOHI
         3wSKPsG+HV/MPFgbrKnYF6zT0rerBvAb/Nq96Bm4e9IHHFuPnvQei+7+WU2FN+1Jjg8q
         P5j3FCFuyZIsAiAQ6n4u4bgQC89W7Ykbz2sBjQzYPM3+yoXjHs7dhliLJ5ZdNj1bIto2
         P0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6BjfRo6axCDMo+NCPPth+19er8UpP51ELRklHkFoOUOKIfkfx+P52Iq/Fs+2ffpBsbsIAn0/OhzFMnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywje+RXvy6kRf6AZz8qb3VAwBOTwOOTkLQVYNxoVpNayqSH7ezZ
	ZqTWfuLYHNf4lFBrouZAIX4lt9/XkUrwrHG+hBYBQb1V+7Y3TfP7v7k0p+9NLg+6uM8=
X-Gm-Gg: AeBDieu3DN22GgSwB8k+C7Z3NAt7B2GpkgZ8wbTpgvvcNnjvN7URPSMRweidniF/b+F
	EiD+NiXUFnfaDayVWEJBNXIvW4XslzwGLwJAMNbDoNe0Dl0mlPavyg/Rps75k2RUj4woLsSKCHX
	iJQj2+jOoKqbuH7McPg8rVHhbcinJi2+71DOTcBd8RNxPF+rji/0AOJSwGXni7HqOcrbdng/kY5
	DOYK7+zTdI7teJlhnreRjb8jwsO94R6HBRT+NOQbPrVTNKEYbyX2q1NZBBpS/e10faVmF5TXs2h
	3pLSU/Qma0Ego9U7CQxL5YHBFbmZIHK6iNhTeZsGPCCsjpKmqic+6BWZq6w6tpQ3gJKdMnWbC6i
	rKxJZGCWjYAg8vChvGqRH/nGyfKV0z93D/q40f3KYL9iGc3fPJr8kZ4vwBha4ZqCR+aBUHvbYrb
	6Ex4XXebX+tw5g/LkOtrP0/m9oKQvUw0j6u1Mg852FUxu5tE+hhbTe3qEqudi2tdfV
X-Received: by 2002:a05:6a00:400b:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f0c2efb17mr4220868b3a.48.1775833491374;
        Fri, 10 Apr 2026 08:04:51 -0700 (PDT)
Received: from [127.0.1.1] ([45.8.220.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4d5413sm2970532b3a.40.2026.04.10.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:04:50 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v8 0/3] spi: support the SpacemiT K1 SPI controller
Date: Fri, 10 Apr 2026 23:04:19 -0400
Message-Id: <20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADO62WkC/yXMyw5AMBCF4VeRWWvS1t2riAU1GOKSDiIR765Yn
 MW3OP8FjJaQIfcusHgQ0zI7pL4Hpq/mDgU1zqCljmUoE8EruVUGJ9rEqATKLEpMoJSKNLjXarG
 l8ysW5W/e6wHN9mbgvh/8TjubcwAAAA==
X-Change-ID: 20260407-spi-spacemit-k1-e0957c311152
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_080453_122427_EF659D2E 
X-CRM114-Status: GOOD (  21.54  )
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

Starting with v8, I am taking over from Alex Elder to shepherd this
series upstream.  Alex developed versions 1 through 7.

Version 8 reworks the driver based on Mark Brown's review of v7, making
much better use of the SPI core framework.

(Note, this is a distinct series from the QSPI driver, which was
merged recently.)

 -
 Guodong

Between version 7 and version 8:
  - Use // comments for the file header (Mark Brown)
  - Remove open-coded DMA mapping (k1_spi_map_dma_buffer(),
    k1_spi_unmap_dma_buffer(), k1_spi_map_dma_buffers(), the dummy
    buffer, k1_spi_io struct); use SPI core DMA mapping via
    transfer->tx_sg/rx_sg instead
  - Add can_dma() callback, replacing open-coded transfer length
    checks
  - Add set_cs() callback for chip select control via the
    TOP_HOLD_FRAME_LOW bit
  - Switch from transfer_one_message() to transfer_one()
  - DMA completion calls spi_finalize_current_transfer() directly
    instead of using a completion
  - Add SSP_STATUS_BCE (bit count error) to error detection
  - Return IRQ_NONE early if no transfer is active, before
    acknowledging interrupts
  - Simplify k1_spi_driver_data struct
  - ~160 fewer lines of code

Here is version 7 of this series:
  https://lore.kernel.org/lkml/20251114185745.2838358-1-elder@riscstar.com/

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

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Alex Elder (3):
      dt-bindings: spi: add SpacemiT K1 SPI support
      spi: spacemit: introduce SpacemiT K1 SPI controller driver
      riscv: dts: spacemit: define a SPI controller node

 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   |  84 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 +
 drivers/spi/Kconfig                                |   9 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-spacemit-k1.c                      | 782 +++++++++++++++++++++
 7 files changed, 918 insertions(+)
---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20260407-spi-spacemit-k1-e0957c311152

Best regards,
--  
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

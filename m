Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F570C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sajAGYXlPzdJE7xoZyeYl2HKZ6cQKYUhd6RlS0H37d8=; b=cqKyRVG34or1TG
	Rr8Ljen3XXqaNKAVeFuY7BJCQROvUDTqT5LnMuTmlTa5u95dMLZQvOm0wOn9PYR/s4OfbxGMh14hH
	PsaqxhDDOBPljT2gs17KZqxktOwEbOUSTOd1Kk3gcCI2RBa55n/HHeSq5he4JMxvzQbsF9zoLr5Sa
	FvtCQ52CVNsEwoyCFl6JdirHTStNr2NAsiNVxdkMccJSYl05B8b6zNZ2iq6jdfVeXArePkDh06bZA
	0+B77Xah4yil3ZanEQDuDiDU1WNdKCHkLaivBDkn59XTBs9i4iL0YSf6APoTuHzoy3U/0cpDoceM3
	zxfnkZVx4pH6e/D+2FYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ712-00000006mD2-0oZB;
	Sun, 25 May 2025 08:47:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ70y-00000006mCV-2Zzo
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:47:29 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742b614581dso1216171b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162847; x=1748767647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao7Q/xXijY5fH5cbAIEqBGx+ybN0Ql0QjcAKqCvWttA=;
        b=JkwDGpZJdQqLoIzJ3nGlINKXbBvTg+9z97I47p5+eFjW442nhZvOI532uaWOsfwkOz
         ue08l6GVyM4z0Ydu6jQ1n0wgHbbdw6lPbO7QzEwsGyZmZ1NW1pFVZQ/cXO2R9U+OVQG4
         W9oAJMRgDyGg820+3EIuN5pnxewdmwc259T+wg74jT9itMaZ4b251h11jzTV0+0lO1s3
         LBpB6Jng4i/CYtqAgVzoUQhQeo7EUrqfFWkxh+B7Y5IUxnQws3J5hx0VWQZbK8ocAD6a
         lW7UbIQale22qmMgLgQ3qrAZbdnLwQa17G/m/HJG5fItF2HW8+WUETqbhGZQ+ptd3kf2
         urzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162847; x=1748767647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ao7Q/xXijY5fH5cbAIEqBGx+ybN0Ql0QjcAKqCvWttA=;
        b=hh5P0FPS6kG6BPxuPj9PZulu5N431+ZIdTiXZdc3pqfT9Vt6s9NHh/RTLAAO+Q0qZr
         KdbjyuMQx3UbFtnmXULTuvCzPbgXHQCJQeXzZh2Qxcv8PKKIqptQBLvH/3kdc+LppvXB
         C1is2g36/RmPEA6UJasF8loK/2EIn7KeTyhbMHVSWifDtFsc88vNkUsIVFmJT+xHA2o+
         NIhGpJ+td7srkljVY8NRuOQ4mBTga7D8tuSxFKn3FGUuIlIHFL5yFzhkIxcIs1HUlcnS
         fGU1QZnlS9lEJ/1A1qZScfdd8/6C7uTfqRch+aN2aff2x685VTYp+WKvQ906URjWpJnr
         zSFA==
X-Forwarded-Encrypted: i=1; AJvYcCWR5laX1cSgCE+ovHBKnpy8XlFdN74dC37Smb29Hj1k9Ai11ASeonY97AQXNRiG0XorZ00OBP3erYVpiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcMh/itD+doxwNs3AYhkPlDcXzESxECUTwG6IEzT3aT/FIG/yA
	u0rEUjI9G1qt90ZjCVQVAHU6b9vkk9yiMdNyirb7uvN6PZFYPi70u7YzCsNcPyIvyLs=
X-Gm-Gg: ASbGnctSTKscVnP0pTyBVUSa5t6eqi4/BZDhb0ibwJfDP7VSM5e+zw+krFC0GYYuGuJ
	zH8zlH7Gg5Vf8851+EQM1kD1wUUtPom1i7V9iFIC6AkSzUL+9C04u4cQ/lSiEYnHyWFSEVtsNqy
	rDjdbKfgUiuyC0ZP2lw2Lfr9qwNENLZb4o5VsGTqLgjYSXWlOESb+/wIoxE+pwGF1gXx3DtLaDl
	SiCbN7dBKUBrH3Dc5nbTTLk4helv8m2C2TlDSVTk6OkmOyCBQ2LQZz9ZZluHYES4IxSlt15kRlJ
	BegzUY54XaFZEkg8b3ADXFJXUtLc+addKRfZ4fSV47nDpN005YmsjsUzWvVt6W3TDwSvkQIZ+Dy
	CRFYDcybm
X-Google-Smtp-Source: AGHT+IEc8vlNlubdM7ZcFtUpfAvKcv5TgPvrM2RuQ5WgOI01LJtb0pSWzaY2oJXu3hrpj45QwRe5xA==
X-Received: by 2002:a05:6a21:4592:b0:1f5:8e54:9f10 with SMTP id adf61e73a8af0-2188c374058mr10629850637.34.1748162847430;
        Sun, 25 May 2025 01:47:27 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v4 00/23] Linux SBI MPXY and RPMI drivers
Date: Sun, 25 May 2025 14:16:47 +0530
Message-ID: <20250525084710.1665648-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014728_660296_E34C62CE 
X-CRM114-Status: GOOD (  18.81  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
are frozen and in public review at the RISC-V International.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
and RPMI system MSI driver This series also includes ACPI support
for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v4 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v3:
 - Rebased the series on Linux-6.15-rc7
 - Updated PATCH2 DT bindings as-per Rob's suggestion
 - Improved request_threaded_irq() usage in PATCH7
 - Updated PATCH10 clk-rpmi driver as-per commments from Andy
 - Updated PATCH13 irq-riscv-rpmi-sysmsi driver as-per comments
   from Andy and Tglx
 - Addressed ACPI related comments in PATCH14, PATCH15, PATCH18,
   PATCH20 and PATCH21

Changes since v2:
 - Dropped the "RFC" tag from series since the SBI v3.0 and
   RPMI v1.0 specifications are now frozen
 - Rebased the series on Linux-6.15-rc5
 - Split PATCH8 of v2 into two patches adding separate DT
   bindings for "riscv,rpmi-mpxy-clock" and "riscv,rpmi-clock"
 - Split PATCH10 of v2 into two patches adding separate DT
   bindings for "riscv,rpmi-mpxy-system-msi" and
   "riscv,rpmi-system-msi"
 - Addressed comments from TGLX on PATCH11 of v2 adding irqchip
   driver for RPMI system MSI
 - Addressed ACPI related comments in PATCH15 and PATCH16 of v2
 - New PATCH17 and PATCH18 in this series

Changes since v1:
 - Addressed DT bindings related comments in PATCH2, PATCH3, and
   PATCH7 of v1 series
 - Addressed comments in PATCH6 and PATCH8 of v1 series
 - New PATCH6 in v2 series to allow fwnode based mailbox channel
   request
 - New PATCH10 and PATCH11 to add RPMI system MSI based interrupt
   controller driver
 - New PATCH12 to PATCH16 which adds ACPI support in SBI MPXY
   mailbox driver and RPMI system MSI driver
 - New PATCH17 to enable required kconfig option to allow graceful
   shutdown on QEMU virt machine

Anup Patel (14):
  riscv: Add new error codes defined by SBI v3.0
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
  dt-bindings: clock: Add RPMI clock service message proxy bindings
  dt-bindings: clock: Add RPMI clock service controller bindings
  dt-bindings: Add RPMI system MSI message proxy bindings
  dt-bindings: Add RPMI system MSI interrupt controller bindings
  irqchip: Add driver for the RPMI system MSI service group
  RISC-V: Enable GPIO keyboard and event device in RV64 defconfig
  MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers

Rahul Pathak (1):
  clk: Add clock driver for the RISC-V RPMI clock service group

Sunil V L (8):
  ACPI: property: Refactor acpi_fwnode_get_reference_args()
  ACPI: property: Add support for cells property
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Create interrupt controller list in sorted order
  ACPI: RISC-V: Add support to update gsi range
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   61 +
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
 .../riscv,rpmi-system-msi.yaml                |   74 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   72 ++
 drivers/acpi/property.c                       |  123 +-
 drivers/acpi/riscv/irq.c                      |   80 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  589 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  324 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   47 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1003 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  233 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |    8 +
 27 files changed, 2905 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 create mode 100644 drivers/clk/clk-rpmi.c
 create mode 100644 drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

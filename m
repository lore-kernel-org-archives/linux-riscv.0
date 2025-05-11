Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D5AC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rP8vSPL8mvIsEjTHF4bDUV0DKq1QBAHUEBUm7Cy49NY=; b=F354vNnNKZM+8t
	w3uqez6Sf0ftu+zkbY5QulUC/LcnMrOOL+HavW5/VYj8aSehisf8tX4L/vaY5HU4/1BiaP9/kS3u+
	lMe0gfJoUxa9R1yUJtQIRQr+IbkEl574znueiChO3dV9tzAoPfeFbEio0ICjLzL2ELFjk8IhdBPZY
	doEH00dAoq80lILnHne4o7L0EPHWD9Hnj453TN/Gi6kUN/kSoSAFBZXV0SG4WxhwYGiEpmP8Il6SZ
	Vbd7fOITYLNePOa2mf+B7zMJwCu3+TkLWDvZWjgfwHnpNpw/1TxCp8TO2HenleecnY0XhcwI3T9rR
	K/28kNFdTi/zx8d9X0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6uV-00000007H8c-3LJ5;
	Sun, 11 May 2025 13:40:07 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6uT-00000007H7z-1t25
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b1a1930a922so2598656a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970804; x=1747575604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2X7+jVVNL7UrA8dHN/YI8a62ZSrvEZ5auq7El/7vY8=;
        b=Up8FTrY8++yL3kYSuE8fan3xz3J4HMvFNkutV23ARbdzJIQ9HQndv4N22/Riwg+Hi7
         kFHCd7G2JQxsQ+9hcAORRR8eq0j1ooyehfZKEKDShOlDZYjpauhLri74YsH67OXmWTJi
         u9WeE7TQ7K63/Cq4XSNRxr1bgg9LQAAij8G3aDGlkFgg5jQrEXC+uV+XGk1wBJ3ZGycM
         3R2bHy7qwCxlu3IPJIcmJD40wvSBQLUfjqLMdgJ8dYt3uq/S+hweIQ5ugowzPjrVJREd
         q/VH7Xz5nlk57de8ARjl6i26piDiUE3o1xGvX/xleGqyAsmItp9Ps3ykNfy/SYDhg1dO
         YfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970804; x=1747575604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2X7+jVVNL7UrA8dHN/YI8a62ZSrvEZ5auq7El/7vY8=;
        b=L9zFkg3spdCn5H6TJXp++rgY0z6gYeK4tbmpFMGqLT7D0UmCyJWPJjDWt5WODUZMag
         YBs++kUkWCT5l0hjnoksb01toWqkiNUNjoz2QLIU6uv9m/0QDdlOGx75u/24jcoSnycY
         3qpQESxvikmYagRXJs9pKvVxqfGT76hNLu0sYLzLEDoYxzvWSa0vN3D62qGeqoD0GF+N
         yGotd36QaRlL/J5R2QnJNq0pyNsg8RMbunPgrLkbdeE92s7XaUqvfS46AREMkO8+JAqJ
         DObxU8sTTHXdUsAKzbF67YNBVR3gkYANOklitfIVigyICXm8B61zrEZgu+rOCaueJE3q
         6CCA==
X-Forwarded-Encrypted: i=1; AJvYcCXTgmFL5O7wJwqRXUo7e/uDPa+DqY5vgCsfoWeXME9GnL1dyf+kgUPxOS3tXMlag5pTl8squMSc8dYI+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+y9p771L+r4axMbh9PHMW0vllkmUH4App8H87HlJQEvakFPWK
	FkkKcfwRRcdKV247PnWItuZPzr0w/G/VA1d4lmtM4q8spwh/y4kdPaHK7oasZs/cUgQoHJcbCtc
	K
X-Gm-Gg: ASbGncs6UA4ck6df4x/xGw17lg9ZOcLLH7N6k7xYGdlPtuhUUNzBKpiupHzoVdCowaF
	mRQ0/qoClQuEMrm6TDKZh8jxWFARsvp4Sxb0sXHRhyJGMnwnuRoZah+DkqeblPha51Ooq0VAQDA
	J7lCXVKXD/y1QxANjytrYgBxaxtbgupOOV/xZPDUxNj1LlQeIPvk1A2z+Qh0Gq496xpjZUdtq06
	KhljJ87QR/fLMpfw54us7KQ2PSOKsE3V84bea7rLAuengfDbdjkzs6Qm9RGA7aZt/A656Wt3qzS
	+VROi8KGVtBQNwWAIPd4jMkw5HiKCCxRzYo+t8g+jN5gtawUhjiSVFk6kBgqSEZX55nRmRfk4X3
	j5USe1i2kD6C2NQ==
X-Google-Smtp-Source: AGHT+IFeovprhIUjCenVGzvCSweIJ9z5nY2eghETFdt8kR3joqVLkksTBy7OfdfpRIPRnZrpPXtoAg==
X-Received: by 2002:a17:903:32c1:b0:224:c46:d167 with SMTP id d9443c01a7336-22fc8b51a28mr143434215ad.16.1746970803926;
        Sun, 11 May 2025 06:40:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:03 -0700 (PDT)
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
Subject: [PATCH v3 00/23] Linux SBI MPXY and RPMI drivers
Date: Sun, 11 May 2025 19:09:16 +0530
Message-ID: <20250511133939.801777-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064005_497772_22BEC811 
X-CRM114-Status: GOOD (  17.90  )
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

These patches can be found in the riscv_sbi_mpxy_mailbox_v3 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

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
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  148 +++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   72 ++
 drivers/acpi/property.c                       |  118 +-
 drivers/acpi/riscv/irq.c                      |   80 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  601 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  315 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   48 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1007 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  235 ++++
 include/linux/mailbox_controller.h            |    3 +
 26 files changed, 2925 insertions(+), 76 deletions(-)
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

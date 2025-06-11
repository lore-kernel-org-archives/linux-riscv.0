Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FE7C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a63E4Zn3LmrkoyXEq2giz7BMJDF7dO2WCwJqnwemGpg=; b=npvGDEXjX+WPZZ
	uUIobTlfjRxX03llqvhrH5XBoCD4hAMyZjK8OeJqzcZ9rANCBtnLMYrfWLJ2pu8mZUtm+vamL+8dt
	iVXk5Adky/7YSMgX/twcBxDIqxdg3qdnqP+SXjoLwiH4B+VLTSZc0o37ow8zOm3+CWvjssA5Ve29h
	4d1tZdXM8qqk23NwvSwbQTChTJeeG1412a4a8Wzd+cvTOFx2olvnIKxxt1KfgFU4pv2tfoKpevAig
	6rsBoRi/7MFb1Q3bTaS+ansJ5LILmcw/VgZ7Ww+blaALkgJOCcSNimJiky8Rrg1Q4h87ppToAKWFg
	v0Cd2L6suZZBr8TDCy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPErc-00000008yx7-3YDj;
	Wed, 11 Jun 2025 06:23:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEra-00000008ywQ-3O0K
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:23:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23526264386so54518965ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622986; x=1750227786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfmX95hujCrj9blYJ8BmjyNowtVqVIanAbJjD67+vAA=;
        b=asVRV8sdSf85dJtNzFfHvDxbcSx2pkeoLQ+D0bIzfKXXAq8iye2PahwTI6qjNe4eje
         BA1JilzZWJnE+Tn2G96+wdI/MqfGBmMw0o5j8BLD24nDj7vfKzUgs1HbL3DA/3ZwvFff
         smj8jKSLKY8p/EE+w6bnWbbmG8cmDwgyomf2WAbfYdStYZwqkwsDKhgOUKSs+jp7gE03
         1iDxwZLZPyI4p7giGJoblTz6saKc8IsFyzfhu7MtiCugqstKhN5YKdRUtI12PrXiOOGN
         bnMqO2gkeoued0k4dhuGploeatvzB3pSkqBL1oR+kz0Ui98wSZ9xayUnCVEHo7HW9h1z
         NtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622986; x=1750227786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfmX95hujCrj9blYJ8BmjyNowtVqVIanAbJjD67+vAA=;
        b=QnlQ5ev75s4XIjmHIKdZBKQby6tXBJ/OYx6WxNACzkxxtPE77FKm2FiBmqxH/ZRXzL
         JuD8oe5kSASl0aPN7BMbJ19uAYtxgzvXVeTouGHIrgISO8zESAcnOkenleEuRLy6m4uu
         Inb3z3aXyn1on9pITc7W7pqNSGctm7VI+n+Fw9OXD4NoXo7C/gN8OdBJ6wPO2MQZV2wm
         5pUCP7dCTP+VdjmDsQiM8O5LYoUtWvm+iwuq/T9965AT73mATw0Lk8nE9XBk8iThuRmq
         spq7AU14mQ9mRCTfmV00Bg3gdzivlLiXC13RkAHCzTKoW0v/uDAgMwvbLjTYTbxLjdgN
         nTKA==
X-Forwarded-Encrypted: i=1; AJvYcCVqWNKMn/uDXFtFNQX+B5wJltf5bUYDK5B9DF8KCJazsEVFLL5h5LqxIZzWtI3qSZ/l/pjTPzqhZrZi2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Jb0w8jz7NpI13f5yHElUgi6YuSMfwI06kjJwftxnPbxcgZyw
	LlZ7X7pYQAmORoy0lN9trq+1VMZLx9ejgN9lLupgjMft95rC39baHVq571HQ9FTKeMIZNF+YMsp
	0qwA7pBk=
X-Gm-Gg: ASbGncs0SXXFYudKDRrfRH0vTODGj23s9/gyDHdczNBFKX+S7O2x9nN6Vrz3qgNI0un
	D6L2eZ7mekCZhAptF/anvf7Rnqr6PIopWw6Rvsd1nb953wzQ17WHkwccHYM9w4I/XaWq9j44U46
	Q4xJvagW9NXAxesOCacz8q1VbOyxnzUYdhSLwQsMJ5XvxubrtcjmC/NMpM/8F0XE4s//Rhzgshj
	VXH9Glp45WVwTGVW0AdcUCxeHAbM+jGYJq1kR+4nnew6u561n1aMWezhiwaqeIJDBNzpbkamnny
	uK1nfjlKMLOhVZ2xdz1qOf7wAVkuE+VwF7RdyTklhlcVTzGZKLrDPDSuNFS9Ab8+cWrayzpEw3E
	4ijTNAMWCEIyE08xYpybtoiXTJAJkklcaNP3n
X-Google-Smtp-Source: AGHT+IHSrTlgCLaqGGBKm2V552V4xqWgVbVjfWOuolPdJzzx1JsZPHsQKmSOy4XI9x2O/aCfniZVjg==
X-Received: by 2002:a17:902:c94d:b0:235:668:fb00 with SMTP id d9443c01a7336-23641b25d36mr26128145ad.46.1749622972783;
        Tue, 10 Jun 2025 23:22:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:22:52 -0700 (PDT)
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
Subject: [PATCH v5 00/23] Linux SBI MPXY and RPMI drivers
Date: Wed, 11 Jun 2025 11:52:15 +0530
Message-ID: <20250611062238.636753-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232306_847484_1687861C 
X-CRM114-Status: GOOD (  18.26  )
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

These patches can be found in the riscv_sbi_mpxy_mailbox_v5 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v4:
 - Rebased the series on Linux-6.16-rc1
 - Dropped PATCH1 since a similar change is already merged
   https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@rivosinc.com/
 - Addressed Andy's comments on PATCH4, PATCH5, PATCH6, PATCH7,
   PATCH13, and PATCH17
 - Addressed Atish's comments on PATCH11 and PATCH12
 - Addressed Conor's comments on PATCH9

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

Anup Patel (13):
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

Sunil V L (9):
  ACPI: property: Refactor acpi_fwnode_get_reference_args()
  ACPI: property: Add support for cells property
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Create interrupt controller list in sorted order
  ACPI: RISC-V: Add support to update gsi range
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   64 ++
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml |   64 ++
 .../riscv,rpmi-mpxy-system-msi.yaml           |   67 ++
 .../riscv,rpmi-system-msi.yaml                |   74 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  124 ++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   51 +
 MAINTAINERS                                   |   15 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    6 +
 arch/riscv/include/asm/sbi.h                  |   61 +
 drivers/acpi/property.c                       |  123 +-
 drivers/acpi/riscv/irq.c                      |   75 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  590 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  325 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   45 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1002 +++++++++++++++++
 include/linux/byteorder/generic.h             |   16 +
 include/linux/mailbox/riscv-rpmi-message.h    |  236 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |   16 +
 29 files changed, 2920 insertions(+), 75 deletions(-)
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

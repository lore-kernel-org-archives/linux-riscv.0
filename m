Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC28C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKUznkp9sY0V316ZrdAbfkHIUsIobAtlEiNZYzYrhbA=; b=pvLll16UgsQwgy
	YzyovAZHXlXIekf/D+UYldq2xpIrYZdJBY5fUUWemVaVeEbZYKjnVWcry8SWj16rldYK1Wy+wQJTp
	ARnXgTJEbyPSoA/9X8AFmc1FzFOHqn6Z9qBZOLi34e2xkpytS5EiIN6hQbrkLVEiNc3DuR1YkQ3wd
	El+rCNKTRHIZNm5I7xml8JIppI/qspSXVKmQC7IoTCk8o0yitFUjFzCEz5pZNn6FJBbqrVi4nOVi0
	fxmMOT7z6ZmdgY3vYCFneQ+9mfInxSSbgtgMNvGnrOythxoW7n6ZeOrd8m6wUBJ8k/g/wUuM5fUKo
	S44oxN3wfBjsqOvNsJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoI-0000000AHYG-3IhI;
	Wed, 18 Jun 2025 13:26:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrgG-0000000A5HN-02rG
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:14:17 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so5645528a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248855; x=1750853655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kU6ELZHmWfRFZtt8myULSktkMGOdoy0bJnmNn+l3FAg=;
        b=g3UjZpxLrTWoi/e/NsWe/8W9PvfMCcrjv7aeNtmtmmfCv+TyaloATOR9xTpVP/exTH
         E4BmJfcRF/BRY9b6x1XCmVfDm/ZtBnyFKJAVnbu7fURzgtKN7c5U6bHX5B+6VCDWGtyH
         YJGgYpOQb3NtKuK31sKJNE1ocOray2v1XH8DEH+pcaoJT76wgOahrf5yoQBJK+QqUFHA
         VSF19AGSgwv1YKQ91IT3RgSu/DNvRY1KjxWHW/s7YeN7V3eTrj9wtsAyVuATUbvpElC/
         XrC+C9s08TDS1IQYen6Cu7z/eKix14Zfu+bBN0Dui14r4tHOBRx2j4NOr0DdYgm01kIT
         p0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248855; x=1750853655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU6ELZHmWfRFZtt8myULSktkMGOdoy0bJnmNn+l3FAg=;
        b=fcfAkRM3YiLrDhqSV4vjFb0GjEx5w5LEzG8a2orPqoxeb12K/avyd4ekPZFDyRUY+Q
         Q1+Wvwhqu5VLWHYWDQX1tMlhTRZOJ2FWPXx9GIV101zXQidFAKpkDg1JFVrL1xktt93y
         p5s3wC9rW9RrKha6z0WLBP5ZNzk6uaw9uiaEGF7UPkkSuNgOG2YVTRlsWqDcO1isy7eY
         7xptcBOb2l2zYt0VcB3Ud7k++f5QK7eEbtyPH0DVkBPxAQnUUzg6cYcvYj8XPjSciRWB
         /gixt7wpHUUeYPgGREBZqSpl57cp1ymrsTKKhRT4o0qpO2ahBklvic3iutRIe/NUE6Sl
         Rmog==
X-Forwarded-Encrypted: i=1; AJvYcCV46yROlLeVTLwnZMEkIfQE5GXjBhei/fkqSZXIKwWJtDNZiQhPZ9i9RA1KrKdaBKHKdhaGUC2IBlMhkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx18+rTs37dEWVj1fvnRkuMSJBQ8vjg+QY6yi992Q6EGq8KG2zX
	x0oi7etCAdzMhCFjWpqN4mpXMmLB7xW2nXehaMaRHBJGiMxB4cAqYO64MNoHT7GZjrc=
X-Gm-Gg: ASbGncuU+NJHFWlBkpLd/I+fIbCk2HER3OKrOrEeFo/QiIpO85x2rnSXocnkC5uVtPn
	erAauR+oHh2aeN6fQCUvBaTVwcYbTsPXvHbyNIVdigLDjTWwwKrqONm2QJHH9T2y7UIrqEOe4hR
	gwxWdyeNmq+3rED8sA6vxEL36/B1ShonndFImFRwmnTpmfB++WlDBq5apbI91BjRAMX2DZRa/oD
	UijtZqNvpPV/j5NnEfWozlb+4G0CbxwmINnFts23j3NdNCQtPEV6iiq3O5B4hUlS358Xe8Wam2H
	vgfnWl3DbIIBF+t2fJIGLGlg/fjj4XMLxo2jkjGMFL6v+anspdXGdeoanfJewq0WAvb8RQxvuEd
	EgZHZ+c68VdAlVdV3xQ==
X-Google-Smtp-Source: AGHT+IGcCKbwptDQMQnuozxFbYTWACUxoulQiiAiNLJwHP6odVkggj+x6mEoPAARc6SOyqpAGxrcpw==
X-Received: by 2002:a05:6a20:a115:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-21fbd683f68mr26318104637.23.1750248854939;
        Wed, 18 Jun 2025 05:14:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:14 -0700 (PDT)
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
Subject: [PATCH v6 00/23] Linux SBI MPXY and RPMI drivers
Date: Wed, 18 Jun 2025 17:43:35 +0530
Message-ID: <20250618121358.503781-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051416_055473_2DDBB159 
X-CRM114-Status: GOOD (  18.70  )
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

These patches can be found in the riscv_sbi_mpxy_mailbox_v6 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v5:
 - Rebased the series on Linux-6.16-rc2
 - Added Conor's Reviewed-by in all DT binding patches
 - Addressed Andy's comments on PATCH5
 - Addressed Tglx's comments on PATCH12 and PATCH21

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
 arch/riscv/include/asm/sbi.h                  |   63 +
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
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  324 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   65 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1012 +++++++++++++++++
 include/linux/byteorder/generic.h             |   16 +
 include/linux/mailbox/riscv-rpmi-message.h    |  238 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |   16 +
 29 files changed, 2948 insertions(+), 80 deletions(-)
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

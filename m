Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D4C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z7EWnl2QhmU5+p3ggjK7PPU50EUoYaaZVFY/g5R51GQ=; b=pBvhB3J4UzrZbz
	iLXdpKwh5ofcfobBdYY3FFECQBFYYh3Igo1863GmodZCBruP0jZ5sJIeFkJIgpG/dSsDvbemfb1h2
	EruI/HWaS9M6HPTqs1PtP0bpvaKlUZd170KgMbAN+6bnLDaSArrT9P4+bmg1yWSfsnhRRXX0UzQID
	QH0rz8GH+sqBCgQ9tY9+eVxLgVG2+ApslMm97FKGBIBLACzBfixgj4+fXgRZqZ6E+Xcbj+Hc1R4hy
	Mr3JWARaGOTu4Toj7hDJl9Wh90lJ936L8KMymeG0fvRcbYgGw7sPi+VUd4k5GpH5wdbEwmG4mMv9+
	lNTR6PiDU3UKBLMnrakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKLu-0000000E7at-0V2K;
	Mon, 28 Jul 2025 09:41:02 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKLr-0000000E7aV-11pb
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:41:00 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso4473518a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695658; x=1754300458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=25NsLwgQxU6OoVi/DUTMUdIs8rRQolxUNPKDhe6xPck=;
        b=IqgDorNVtKyxbDqY13GCmp7VpB0jtO6BMmTkd20Y+C6GwYD6BIJyKwW9w8AfHxqapB
         ojkZAZBHVfZTHzwM3nwYa34ILEQlJy/TDOSw2WXLEeEW3vRdA0JxlsaYHnI2Po1WP3b8
         tmZys2CR1i9KI+/zzKv9SbPzk9xXKxfEYgIiG4ZKJev3spMPIiBdMBSf/A4sEms+aa0S
         tpUv1v2tSgvkg85JDt3e2l06PN4sISSAbigHQILl1Ca/BNbFyEBYv2bx9pn2ebBEUd20
         +xjIJLZ/Z2g0IRBJvPo6P7dWladuUykyY60v0S9p8I4d/cyGRC+zdAjuQz14gSqenXwX
         dyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695658; x=1754300458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25NsLwgQxU6OoVi/DUTMUdIs8rRQolxUNPKDhe6xPck=;
        b=KNazTH3ttaQgyB7zMnOJN1zgWPJODKioiibzSf5jNsBk78jsTFICm0Tb8BKYDAPqcB
         lu0eRNViyhNb+iHneixe95kE+mUfKfTWhg/ohbGzhzYyDK4inJFTZnSNVIgcx7CpEdWr
         MOFIiqHpcBcsCfEbqsGGFavT+HJmWv/tS4GF5F9HscA6kQPpg0ZGBJQeR4rzLz6fdUBB
         QMrznLep0Ly+85pi1AfO80NZ7+xIONHs0X5qEbaDtJz8i0ve6l02vm6R36eurqOXMChd
         GBrfBB+aJWHuXnmBPIarT+LaPMsR60+CH7+Y64NxGBHMUxS5MFX+6hV3JUztiXHPUXLs
         dwNg==
X-Forwarded-Encrypted: i=1; AJvYcCXBRdooOMvXIeEuxkE+isMf0I6HrjJtqVkBlc7zhDuXlTz94pPHRcxNUnfJBIxBQyAIpgVmX8rsGRzXcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykP+gtojUQKA1o1WFZlQgUCrgemyJEMWosNQ38t8ji+/u1G8eq
	HHuybf7ufMuYqDcvEU4JYlzel35lo2JwfPodTthifkna1DVgH3uC8ZrhXisA1nBV4k8=
X-Gm-Gg: ASbGncuYFaXAbEoGvyvor6fZeKjN/Fp6bBX3TEUmByq7whhxYAVa3gxdLVQdCG60NXx
	cEHNQhST+fuNPd3Nm6993D1vbW0u2mYNLnezj1LdZPEsWKjPxIC9gRBeyb0tGV4d8Ly2iQGqrFA
	QyR1TZMHDEuNtJmJgjYB/VOy0jvGHsbeJY8wDVgxRdKKJs4jcz9bkOK3ZLOE/ErEl2qW8JEAUR/
	qowvrFbWZDX0Lt5nQH0atjwxW+QP/sQl40mwwgRMN6adSwGp8xNcOqW+wiMj/PaIKNBReW5BMDU
	wPOIK6MKpFinxG4ky+nVw97s7AbwUU2TRTHn/FCnI888S52q7NEMfJNyEsklseZFKQEbZoBfuo4
	0XDWtwUEK57+9OIaLVOAiKBEoucFa72RUb3iJJRk4CFCku6J4iilerDu5G3ol
X-Google-Smtp-Source: AGHT+IEmvT+SOvzEcdLdlRaaKWgRWUpUW8p4SklxnxOFXQ6plZqK680P2Sf3GArKsbF5pMJNWebOLg==
X-Received: by 2002:a17:90b:39cd:b0:31f:7c9:2e66 with SMTP id 98e67ed59e1d1-31f07c92f41mr1489966a91.28.1753695658070;
        Mon, 28 Jul 2025 02:40:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:40:57 -0700 (PDT)
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
Subject: [PATCH v9 00/24] Linux SBI MPXY and RPMI drivers
Date: Mon, 28 Jul 2025 15:10:08 +0530
Message-ID: <20250728094032.63545-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024059_288066_FDC84F79 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
are ratified by the RISC-V International.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
and RPMI system MSI driver This series also includes ACPI support
for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v9 branch
at: https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Changes since v8:
 - Added Jassi's Acked-by in mailbox related patches
 - Renamed "clock-controller" DT node to "clock-service" DT node
   in PATCH8 as suggested by Stephen Boyd

Changes since v7:
 - Addressed enum related nits in PATCH3
   (Refer, https://lore.kernel.org/all/CAK9=C2VxhC6soxHtmacedbeCU=rFi84Br1RvN2uPcBKoLhRaJw@mail.gmail.com/)
 - Addressed comments in PATCH7 as follows:
   - Added minmax.h to includes
   - Removed "rc" variable from mpxy_mbox_send_rpmi_data()
   - Removed alignment and other checks from mpxy_mbox_peek_rpmi_data()
   - Created separate function to restrict scope of channel_ids used in mpxy_mbox_probe()
   (Refer, https://lore.kernel.org/all/CAK9=C2Ume2CmBYHYob7HSJHu=ZdfdWM+4JYPgFJ9Hir5Oi8cOg@mail.gmail.com/)
 - Improved comments for struct rpmi_clk_rates in PATCH10
   (Refer, https://lore.kernel.org/all/CAK9=C2VfvsbFTjecQm0OSsssXbff7wC4fqWf3CTmnpWSiaLcBw@mail.gmail.com/)
 - Improved refactoring of acpi_fwnode_get_reference_args() in PATCH14
   (Refer, https://lore.kernel.org/all/20250702051345.1460497-15-apatel@ventanamicro.com/)
 - Improve nargs_count parsing in acpi_fwnode_get_reference_args() for PATCH15
   (Refer, https://lore.kernel.org/all/20250702051345.1460497-16-apatel@ventanamicro.com/)
 - Added more comments describing why need to explicitly set device MSI domain in PATCH21
   (Refer, https://lore.kernel.org/all/aGaUmpw1pVWNAmpb@smile.fi.intel.com/)

Changes since v6:
 - Rebased the series on Linux-6.16-rc4
 - Added Stephen's Reviewed-by in appropriate patches
 - Addressed Andy's comments on PATCH5, PATCH6, PATCH9, and PATCH14
 - New PATCH6 in this series which is factored-out from PATCH7

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

Anup Patel (14):
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  byteorder: Add memcpy_to_le32() and memcpy_from_le32()
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
  ACPI: property: Refactor acpi_fwnode_get_reference_args() to support
    nargs_prop
  ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
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
 drivers/acpi/property.c                       |  128 ++-
 drivers/acpi/riscv/irq.c                      |   75 +-
 drivers/acpi/scan.c                           |    2 +
 drivers/base/property.c                       |    2 +-
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  616 ++++++++++
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-imsic-early.c       |    2 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  328 ++++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   65 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1017 +++++++++++++++++
 include/linux/byteorder/generic.h             |   16 +
 include/linux/mailbox/riscv-rpmi-message.h    |  243 ++++
 include/linux/mailbox_controller.h            |    3 +
 include/linux/wordpart.h                      |   16 +
 29 files changed, 2990 insertions(+), 83 deletions(-)
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

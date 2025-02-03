Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C5DC02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e6IkiIiRXvgkWS3ubnaLJ5Tpfh2odDFddaat4HzB6q0=; b=4sdxJ7UkokX+6C
	w60rXT5vriem5EZUIJR5lCBlCvvFyCHO+6leMLSQmzLJYu/K156o7WCRAn1FBZj1AvmHGCEE5jgNE
	vZ6wfIdbRSAjGfjGHw5VqD5ZCM2+4m0huJy2gf2Q4bBRD8sBNNR7cDEGoD1ZgXvSr5ak2QWDmK5ag
	g5k0bD9O6eAp+pEqyqk6DuL5e34g5k9seucWhTT5LksKNR/62O6W5bi8wcB96PyWBsZTAnzPDLJiI
	g4stYAtdQtJhq1d5HZ9kRZvwwGZyACzG6zwlySvYtZ3JXlpM+eAnc/8j+lDnndnmB8+N9LXK46Bn5
	4ycDA7tEOWRHeYCFDoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes93-0000000Etcl-3BXi;
	Mon, 03 Feb 2025 08:49:29 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes90-0000000EtcE-1rek
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:49:27 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-467b955e288so45733101cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572565; x=1739177365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYXXlTk5HduQbMTIlt80IsYvDUjFzMF5KSYRQGJL3Uk=;
        b=m8XNpIuXn6fDNVOsARKlhZu8nsrsAGOTmT4jQwEtHVUH1ZEg423Jo1fQLsZAkXylnF
         lspR/BUrd1OgJ4pDdqUg/DpxdOJxnPm9rIlQGiCmveROXi5qPCRxG6PUDl8622zSivpp
         5pJvJU7HBukbDcsy2/hXF8g7HO9COAWnQa35EgOfWU1kzZ3OdX5hnmE613fQYbonPQBp
         vTAWNbYpOm5HZgwcOWcL4Rr8RONutAct3fcF11FDFFwfyrk0qHIXRmhRmKHN073kwHY6
         D6ryLUHpyj/yd+V4L2qxmp9KRaffiOCDJXSLYnDWH8Xk1J7N4WV3W5WywEcpXv3dRPBS
         G6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572565; x=1739177365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYXXlTk5HduQbMTIlt80IsYvDUjFzMF5KSYRQGJL3Uk=;
        b=BVpcbzWx9krZX1BgCouOYBH+dYBolkJFV3/hiNbGDJPUCHPFcU9VvZibZDy9IXqcKM
         aItEbGW32+EHvNXOKrpG1YTW4R9Ncl0N/VwcRhkrmn4r2spPQcR4ewf8ZaiCxLEllIVN
         F9aQsxC3OIdjmmoxfkm/xLv++90iPYxgCMAsK5GMP79g4K3bo5qpijvNu5ZYrKmjTcUd
         B6z5vUfcNdn/TFSRb39JmRUq6hcwBICM0cQLQ257Bw3LeqSt/PLhpjoNSgTlaGkKPkv/
         esuZUj8polDuG2VQggsNSzi5UXRwNcPZslPlyZfL0bVZCf49lrhSgd3nXH6+Ekt7rs5i
         CQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVSmnvhhMrXQ8dlKkVwoOdjabUEiGfXDaF8Aajs4ioE49uAxLYhwAroDBEKsJA1vzfKOmQVnjsQ1+uz5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgz5N3GA5zh4exBdqAb2GL+lcRu9TK+zODTNYzSviQ5ygY6tii
	0YPBNFLxS0vX96RQRZpiEZW01lgfI6hXMt6uQpQe2HxtTGBLpI9mMA+cyzrOWjY=
X-Gm-Gg: ASbGncs6KnVUreQ1M7tFNbWp0+YnY98kUjYL+osEURwLxl00Zcght0U/zcdKL2Sf50M
	RJutsITNeh+lisCopD6vwP8+xjNo6tdWSXKV5bf3+eam6zP5FrdanS0ghfd7lP/+Im0iTiP58df
	f15DU0eB7DPprlVUin0S6MfL1alR4vqWwxtPWiFrIfZSQi8dGOjYgGr5DsUhRkPYny5a1p3J3rd
	VLrc/so3B7PzyGdFgZk02NALpldqndcP0XUi585wnyAkqGzuXwTpli4zui1XyHeGynKEh9NGhHP
	Y2r9klbNWQAPnlc0NsNN2xSCC0QY3oFh19gFrrcvwDNQEIc3IIarVao=
X-Google-Smtp-Source: AGHT+IGH0XTcN/X29iLH8kRSIgCwIt85vlSYKgmJJ/8YJqUZ2p1KY2bxWsy8EAgScZgVFzZwv6JhNQ==
X-Received: by 2002:ac8:584f:0:b0:467:5e4f:3d1 with SMTP id d75a77b69052e-46fd0b924b4mr302004001cf.33.1738572564583;
        Mon, 03 Feb 2025 00:49:24 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:49:23 -0800 (PST)
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
Subject: [RFC PATCH v2 00/17] Linux SBI MPXY and RPMI drivers
Date: Mon,  3 Feb 2025 14:18:49 +0530
Message-ID: <20250203084906.681418-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_004926_487475_BA0BCD42 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 MPXY extension [1] and RPMI v1.0 [2] specifications are
in stable state and under ARC review at the RISC-V International so
as part of the RVI process we would like to receive an early feedback
on the device tree bindings and mailbox drivers hence this series.

Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
for Linux only has SBI MPXY mailbox controller driver, RPMI clock
driver.and RPMI system MSI driver This series also includes ACPI
support for SBI MPXY mailbox controller and RPMI system MSI drivers.

These patches can be found in the riscv_sbi_mpxy_mailbox_v2 branch at:
https://github.com/avpatel/linux.git

To test these patches, boot Linux on "virt,rpmi=on,aia=aplic-imsic"
machine with OpenSBI and QEMU from the dev-upstream QEMU branch at:
https://github.com/ventanamicro/opensbi.git
https://github.com/ventanamicro/qemu.git

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

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

Anup Patel (11):
  riscv: Add new error codes defined by SBI v3.0
  dt-bindings: mailbox: Add bindings for RPMI shared memory transport
  dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
  RISC-V: Add defines for the SBI message proxy extension
  mailbox: Add common header for RPMI messages sent via mailbox
  mailbox: Allow controller specific mapping using fwnode
  mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
  dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
  dt-bindings: interrupt-controller: Add bindings for RISC-V RPMI system
    MSI
  irqchip: Add driver for the RISC-V RPMI system MSI service group
  RISC-V: Enable GPIO keyboard and event device in RV64 defconfig

Rahul Pathak (1):
  clk: Add clock driver for the RISC-V RPMI clock service group

Sunil V L (5):
  ACPI: property: Add support for nargs_prop in
    acpi_fwnode_get_reference_args()
  ACPI: scan: Update honor list for RPMI System MSI
  ACPI: RISC-V: Add RPMI System MSI to GSI mapping
  mailbox/riscv-sbi-mpxy: Add ACPI support
  irqchip/riscv-rpmi-sysmsi: Add ACPI support

 .../bindings/clock/riscv,rpmi-clock.yaml      |   77 ++
 .../riscv,rpmi-system-msi.yaml                |   89 ++
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        |  150 +++
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml |   54 +
 arch/riscv/configs/defconfig                  |    2 +
 arch/riscv/include/asm/irq.h                  |    1 +
 arch/riscv/include/asm/sbi.h                  |   70 ++
 drivers/acpi/property.c                       |   15 +-
 drivers/acpi/riscv/irq.c                      |   33 +
 drivers/acpi/scan.c                           |    2 +
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rpmi.c                        |  601 ++++++++++
 drivers/gpio/gpiolib-acpi.c                   |    2 +-
 drivers/irqchip/Kconfig                       |    7 +
 drivers/irqchip/Makefile                      |    1 +
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |  315 +++++
 drivers/mailbox/Kconfig                       |   11 +
 drivers/mailbox/Makefile                      |    2 +
 drivers/mailbox/mailbox.c                     |   44 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 1027 +++++++++++++++++
 drivers/pwm/core.c                            |    2 +-
 include/linux/acpi.h                          |   12 +-
 include/linux/mailbox/riscv-rpmi-message.h    |  235 ++++
 include/linux/mailbox_controller.h            |    3 +
 25 files changed, 2737 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
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

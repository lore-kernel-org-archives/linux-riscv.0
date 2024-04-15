Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7E1C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yy+QglNIzgDd4b2InRFyL0eYZcIe6CVHe0XVJVQ6VkY=; b=Af2XAbDK7GWH8+
	FXIiHNdVVYu2Stpq7hY7p+F/0hPDx2UsX+XWcamXlpPHaBCFI6zqxLMbX1zEIGqoHfpzORkAtn7+Y
	VUijSW2ncaR0H2FHC5UlcXRLyj5GYYuy0WPx670bPvo5V1a7S6t9fnpKWzA5m7/QlxSxaPj+lda6l
	ylqOZhPmqP0oUwJ7A2Af9NfwhY/b0SYBf8S7fAckiBHTtsNU7mTsUO6b7JjdrIwM0fxsAOKmYEuiP
	CiDr03GpY7ryiILnx/9UYGy4b5Hifu3GKuvp7eb4A1gYJ88ytb5ZmKhb5n6cqn35uYbNom/ruHYGl
	Tk3iNWorQ+FpRIojVx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPi0-00000009BKk-1ao5;
	Mon, 15 Apr 2024 17:01:32 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPhs-00000009BJN-3ju8
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:01:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so3148883b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200483; x=1713805283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afQUKb3+bReZJJVzkqw/D/pAyQK9zbCbxN1Z3zQxUCM=;
        b=m2rNxlqiZtogxNNkeajq3AgcqlgNP7u6HgU3QFlT9sWSpk1VnUgrMnu+GisbXUUulM
         w2nL6yPXkCyhu6h1FY9kazrDwYJjRa9MJrc1Kcy1St251cjYJs7EJzJqGzm3ugwEEKIx
         rFyxpjysoZsq9oGTlOBAGX1HucX8Dvq1YQcCdoUzdkzhwqn0kaRRIY8zziBf0jMJ8YVD
         tHQLt3Rkje/CQjkiNR1v6Iu3AhHsnn6d/UA+DViHNlitBo07LQSOxKlzOwLCHmiv70Je
         VoJG4hjcG2YTis3Ddue20pAy3z8qnP7okucKmxvF76N3iKngD65lawcgovJjsqJjT1uu
         ODDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200484; x=1713805284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afQUKb3+bReZJJVzkqw/D/pAyQK9zbCbxN1Z3zQxUCM=;
        b=X5VofFiIRSqwZLjvKItCKzKr2fOuQfSLKb+nxtmuQ0Bb2YexNQpOF8k0T7OmaGrMKf
         JkGWSSmXuvBnGvGA8q49srSnWw9l22jvsTfHj0V90mQZmqXdevlOBEoCKpOB+Ahc+y2S
         IEhKy/arLf68XtMgRYygmLFNExfUgEImQIzaS4nStNNvGQvQJrI/+Hn/W1NeBrVo9mTh
         cZAWqYiLE3DK/tOXqO4NlYnvOWBN1QYnBS+ruvWCUzeW141AbV2Jc6k0/wxMBYcXvFnl
         R1Xtus/am7PirP7ebr504rbLijI7Q9669DgPRkE1F4gXShrKS8hTFpJT7reZefasDQIc
         zM6w==
X-Forwarded-Encrypted: i=1; AJvYcCUuD/lVOJFdvOoYC8w5uyqF0jw27q9rktgKxU0OppJWEKA6Pc56k/7Xy1MxU9EO1uT2Puo/uDjzt9gL4UCOknhSzWXxsXrPVW+I98mAuGuG
X-Gm-Message-State: AOJu0YwiEiRdELeylseZCoSM5M1V1PZ6GlfLNWC9icR36AtmEf6VrZWB
	WJfw7Bw0Gdix4+aZn8uFbZ7DCT3UGJyzwERgmt//Yu3tWrdyiEC7rnTOlDvnCx8=
X-Google-Smtp-Source: AGHT+IGvUtNPBJtUrZHBRqgCeSvMfTaswoxNkmXpQMc4XGFfcLCC2fGcj6PbI0z7193t2XQ0TXdwYw==
X-Received: by 2002:a05:6a20:4e29:b0:1a3:a8da:918b with SMTP id gk41-20020a056a204e2900b001a3a8da918bmr7760997pzb.47.1713200483351;
        Mon, 15 Apr 2024 10:01:23 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:01:22 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 00/20] RISC-V: ACPI: Add external interrupt controller support
Date: Mon, 15 Apr 2024 22:30:53 +0530
Message-Id: <20240415170113.662318-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100124_959611_DC046748 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for the below ECR approved by ASWG.
1) MADT - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing

The series primarily enables irqchip drivers for RISC-V ACPI based
platforms.

The series can be broadly categorized like below. 

1) PCI ACPI related functions are migrated from arm64 to common file so
that we don't need to duplicate them for RISC-V.

2) Added support for re-ordering the probe of interrupt controllers when
IRQCHIP_ACPI_DECLARE is used.

3) To ensure probe order between interrupt controllers and devices,
implicit dependency is created similar to when _DEP is present.

4) When PNP devices like Generic 16550A UART, have the dependency on the
interrupt controller, they will not be added to PNP data structures. So,
added second phase of pnpacpi_init to handle this.

5) ACPI support added in RISC-V interrupt controller drivers.

This series is still kept as RFC to seek feedback on above design
changes. Looking forward for the feedback!

Changes since RFC v3:
	1) Moved to _DEP method instead of fw_devlink.
	2) PLIC/APLIC driver probe using namespace devices.
	3) Handling PNP devices as part of clearing dependency.
	4) Rebased to latest linux-next to get AIA DT drivers.

Changes since RFC v2:
	1) Introduced fw_devlink for ACPI nodes for IRQ dependency.
	2) Dropped patches in drivers which are not required due to
	   fw_devlink support.
	3) Dropped pci_set_msi() patch and added a patch in
	   pci_create_root_bus().
	4) Updated pnp_irq() patch so that none of the actual PNP
	   drivers need to change.

Changes since RFC v1:
	1) Abandoned swnode approach as per Marc's feedback.
	2) To cope up with AIA series changes which changed irqchip driver
	   probe from core_initcall() to platform_driver, added patches
	   to support deferred probing.
	3) Rebased on top of Anup's AIA v11 and added tags.

To test the series,

1) Qemu should be built using the riscv_acpi_namespace_v1 branch at
https://github.com/vlsunil/qemu.git

2) EDK2 should be built using the instructions at:
https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/README.md

3) Build Linux using this series.

Run Qemu:
qemu-system-riscv64 \
 -M virt,pflash0=pflash0,pflash1=pflash1,aia=aplic-imsic \
 -m 2G -smp 8 \
 -serial mon:stdio \
 -device virtio-gpu-pci -full-screen \
 -device qemu-xhci \
 -device usb-kbd \
 -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
 -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd \
 -netdev user,id=net0 -device virtio-net-pci,netdev=net0 \
 -kernel arch/riscv/boot/Image \
 -initrd rootfs.cpio \
 -append "root=/dev/ram ro console=ttyS0 rootwait earlycon=uart8250,mmio,0x10000000"

To boot with APLIC only, use aia=aplic.
To boot with PLIC, remove aia= option.

This series is also available in acpi_b2_v4_autodep_v1 branch at
https://github.com/vlsunil/linux.git

Based-on: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20240415

Sunil V L (20):
  arm64: PCI: Migrate ACPI related functions to pci-acpi.c
  RISC-V: ACPI: Implement PCI related functionality
  PCI: Make pci_create_root_bus() declare its reliance on MSI domains
  ACPI: scan.c: Add weak arch specific function to reorder the IRQCHIP
    probe
  ACPI: RISC-V: Implement arch function to reorder irqchip probe entries
  ACPI: bus: Add acpi_riscv_init function
  RISC-V: Kconfig: Select deferred GSI probe for ACPI systems
  ACPI: scan: Refactor dependency creation
  drivers/acpi/scan.c: Update _DEP honor list
  RISC-V: ACPI: Initialize GSI mapping structures
  ACPI: scan.c: Define weak function to populate dependencies
  RISC-V: ACPI: Implement function to add implicit dependencies
  ACPI/PNP: Initialize PNP devices skipped due to _DEP
  irqchip: riscv-intc: Add ACPI support for AIA
  irqchip: riscv-imsic: Add ACPI support
  irqchip: riscv-aplic: Add ACPI support
  irqchip: irq-sifive-plic: Add ACPI support
  ACPI: bus: Add RINTC IRQ model for RISC-V
  irqchip: riscv-intc: Set ACPI irqmodel
  ACPI: pci_link: Clear the dependencies after probe

 arch/arm64/kernel/pci.c                    | 191 ------------
 arch/riscv/Kconfig                         |   3 +
 arch/riscv/include/asm/irq.h               |  57 ++++
 arch/riscv/kernel/acpi.c                   |  31 +-
 drivers/acpi/Kconfig                       |   3 +
 drivers/acpi/bus.c                         |   4 +
 drivers/acpi/pci_link.c                    |   3 +
 drivers/acpi/riscv/Makefile                |   2 +-
 drivers/acpi/riscv/init.c                  |  14 +
 drivers/acpi/riscv/init.h                  |   4 +
 drivers/acpi/riscv/irq.c                   | 323 +++++++++++++++++++++
 drivers/acpi/scan.c                        |  69 +++--
 drivers/irqchip/irq-riscv-aplic-direct.c   |  20 +-
 drivers/irqchip/irq-riscv-aplic-main.c     |  70 +++--
 drivers/irqchip/irq-riscv-aplic-main.h     |   1 +
 drivers/irqchip/irq-riscv-aplic-msi.c      |   9 +-
 drivers/irqchip/irq-riscv-imsic-early.c    |  52 +++-
 drivers/irqchip/irq-riscv-imsic-platform.c |  32 +-
 drivers/irqchip/irq-riscv-imsic-state.c    | 115 ++++----
 drivers/irqchip/irq-riscv-imsic-state.h    |   2 +-
 drivers/irqchip/irq-riscv-intc.c           | 102 ++++++-
 drivers/irqchip/irq-sifive-plic.c          |  89 ++++--
 drivers/pci/pci-acpi.c                     | 182 ++++++++++++
 drivers/pci/probe.c                        |   3 +
 drivers/pnp/pnpacpi/core.c                 |  24 +-
 drivers/pnp/pnpacpi/rsparser.c             |  63 ++--
 include/acpi/acpi_bus.h                    |   2 +
 include/linux/acpi.h                       |   9 +
 include/linux/irqchip/riscv-imsic.h        |  10 +
 include/linux/pnp.h                        |   7 +
 30 files changed, 1108 insertions(+), 388 deletions(-)
 create mode 100644 drivers/acpi/riscv/init.c
 create mode 100644 drivers/acpi/riscv/init.h
 create mode 100644 drivers/acpi/riscv/irq.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

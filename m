Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFABC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uaRr5V6ynbfHVMa51SLxGeWYWlJGw4t5qlZgDZFOFAg=; b=YKyJJzQ+XxQpaM
	w9s9vHer5VXLMDPq5LKlyXe0iTIrkz9xjgcebJtrGdp00atkAjtqJwZeELZ8/fBMBvXX2tC5t5nnu
	of+QT/WjfDbf8IvPlUIEXVnnlxTWs89PKe/zQwgExvlAWjC8mWoj4a3Qbigpo1dx6AGiKtdefTcl7
	XLUl1z6gwp7OxaYlG68NAnqvrXyurukOCA1cVl0Pi8cbjUOsu4rCZnxSMdrQmMjDs4qnipl6tN2i3
	A2NrLy86jpSFv9EBSaCW5XbKomfDb1Cc3BOKekgMiTEWaaF1rXzb/g4PgfptTIXk94mKCv92AyQiS
	OSvLUYg/YahnNqyKOXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpf-004xdr-FX; Mon, 30 Jan 2023 18:24:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYnd-004wm8-2Y
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:22:38 +0000
Received: by mail-pj1-x102a.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so13814281pjq.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RI22LbgqWNEv5UzlC1sMyx9FAhRay6n0zSuBGUPx4y8=;
        b=BhBgNdAagLBMY28KLLQVlINvG4nk9njtI1Kcv6Kc6G4unrUh5ZBfAiC7Lpl4kL/oid
         VDvBZKFG0hhODY3zyhSXF+XhlTt/EUH/jno/EQzcbiel2IIfdD7Yq9hcKEsrWGrtDDnl
         IhlcJ9kMY38C9J/f8hKOie7R4xXQGv3awE55RbchEXJ+fXxivwdh2Lt+l4vxKylTmKpy
         1xw/VH9Uf9Hcq3V19EydNCcS+rOdwktXHoEhUbTKFGn+IztCYGPJerQWAD1SVwl5L79F
         EkQTKchOFkt7NCdKqjqKE18wU5IctSbeX4yek5KhgtqVNj2sY4/3V9fmmLf7pNdCPHdi
         kXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RI22LbgqWNEv5UzlC1sMyx9FAhRay6n0zSuBGUPx4y8=;
        b=tzZaihlGaU3iRtf1zib48vchroKBkMqyeNWuFnkD6/ukfdzay41kJecyrsEVUpxiZ0
         j3SsPYOaRrDQfPIwbEXJhzcKKTkAk6YwpO3abokHDI/HwD9I5S5gKViE4dk/Zel07xie
         FRy0eiAaippg1tLaKOgdKfCo5VTULrrCYils48pdAGjLrrl+PsVKoetY+d3Jbs7qPjwv
         SH/F8uJ06y71KK4zmHidJP6wYf2rNYIZv+ZHEP8KX8Hdh9P/dqK3EdnvU5Smhdm/ZteA
         upz4E4DWeN1MEtw+X2EaIsw8churrE+P6LKrkf1E4bV3aBNF/ohEJsNNOMZUeXxkCGUO
         HPcQ==
X-Gm-Message-State: AO0yUKWSxuHMRuxQnUWmYh8jlUl5C8MbTigdohru64fAelK59rxGvZau
	tx+7RUpDc37tJCBp1Z6mv87XRpBhyit4MAhE
X-Google-Smtp-Source: AK7set/c3VAC3ZT2NOToGmYgKr82uNdFAR1hLwjGxiq3XJF5GQQbK6Orcm8br2dBNQTap/jO+cH1ag==
X-Received: by 2002:a05:6a20:c19a:b0:b8:4cc9:16d9 with SMTP id bg26-20020a056a20c19a00b000b84cc916d9mr18529672pzb.46.1675102954299;
        Mon, 30 Jan 2023 10:22:34 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:33 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/24] Add basic ACPI support for RISC-V
Date: Mon, 30 Jan 2023 23:52:01 +0530
Message-Id: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102237_158279_6F2FD20B 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series enables the basic ACPI infrastructure for RISC-V.
Supporting external interrupt controllers is in progress and hence it is
tested using polling based HVC SBI console and RAM disk.

The series depends on Anup's IPI improvement series.
https://github.com/avpatel/linux/commits/riscv_ipi_imp_v17

These changes are available at
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17

Testing:
1) Build Qemu with ACPI support using below branch
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review

2) Build EDK2 as per instructions in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support

3) Build Linux after enabling SBI HVC and SBI earlycon
CONFIG_RISCV_SBI_V01=y
CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
CONFIG_HVC_RISCV_SBI=y

4) Build buildroot.

Run with below command.
qemu-system-riscv64   -nographic \
-drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
-machine virt,acpi=on -smp 16 -m 2G \
-kernel arch/riscv/boot/Image \
-initrd buildroot/output/images/rootfs.cpio \
-append "root=/dev/ram ro console=hvc0 earlycon=sbi"

Jisheng Zhang (1):
  riscv: move sbi_init() earlier before jump_label_init()

Sunil V L (23):
  ACPICA: MADT: Add RISC-V INTC interrupt controller
  ACPICA: Add structure definitions for RISC-V RHCT
  RISC-V: ACPI: Add empty headers to enable ACPI core
  RISC-V: ACPI: Add basic functions to build ACPI core
  RISC-V: ACPI: Add PCI functions to build ACPI core
  RISC-V: ACPI: Enable ACPI build infrastructure
  ACPI: Enable ACPI_PROCESSOR for RISC-V
  ACPI: OSL: Make should_use_kmap() 0 for RISC-V.
  ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
  RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
  RISC-V: ACPI: smpboot: Create wrapper smp_setup()
  RISC-V: ACPI: smpboot: Add ACPI support in smp_setup()
  RISC-V: ACPI: smpboot: Add function to retrieve the hartid
  clocksource/timer-riscv: Refactor riscv_timer_init_dt()
  RISC-V: ACPI: clocksource/timer-riscv: Add ACPI support
  ACPI: RISC-V: drivers/acpi: Add RHCT related code
  RISC-V: ACPI: time.c: Add ACPI support for time_init()
  RISC-V: ACPI: cpufeature: Add ACPI support in riscv_fill_hwcap()
  RISC-V: ACPI: cpu: Enable cpuinfo for ACPI systems
  RISC-V: ACPI: Add ACPI initialization in setup_arch()
  RISC-V: ACPI: Enable ACPI in defconfig
  MAINTAINERS: Add entry for drivers/acpi/riscv
  Documentation/kernel-parameters.txt: Add RISC-V for ACPI parameter

 .../admin-guide/kernel-parameters.txt         |   6 +-
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig                            |   5 +
 arch/riscv/configs/defconfig                  |   4 +
 arch/riscv/include/asm/acenv.h                |  17 ++
 arch/riscv/include/asm/acpi.h                 |  87 +++++++++
 arch/riscv/include/asm/cpu.h                  |   9 +
 arch/riscv/kernel/Makefile                    |   3 +
 arch/riscv/kernel/acpi.c                      | 178 ++++++++++++++++++
 arch/riscv/kernel/cpu.c                       |  36 +++-
 arch/riscv/kernel/cpufeature.c                |  45 ++++-
 arch/riscv/kernel/pci.c                       | 173 +++++++++++++++++
 arch/riscv/kernel/setup.c                     |  21 ++-
 arch/riscv/kernel/smpboot.c                   |  99 +++++++++-
 arch/riscv/kernel/time.c                      |  25 ++-
 drivers/acpi/Kconfig                          |   2 +-
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/osl.c                            |   2 +-
 drivers/acpi/processor_core.c                 |  28 +++
 drivers/acpi/riscv/Makefile                   |   2 +
 drivers/acpi/riscv/rhct.c                     |  93 +++++++++
 drivers/clocksource/timer-riscv.c             |  88 ++++-----
 drivers/irqchip/irq-riscv-intc.c              |  79 ++++++--
 include/acpi/actbl2.h                         |  69 ++++++-
 24 files changed, 994 insertions(+), 86 deletions(-)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/acpi.h
 create mode 100644 arch/riscv/include/asm/cpu.h
 create mode 100644 arch/riscv/kernel/acpi.c
 create mode 100644 arch/riscv/kernel/pci.c
 create mode 100644 drivers/acpi/riscv/Makefile
 create mode 100644 drivers/acpi/riscv/rhct.c

-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

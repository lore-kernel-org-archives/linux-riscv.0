Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9120BC25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 06:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1dXeBmvixXa2crWDL7U1gmvbn17JtdXqUA3DEayvHAc=; b=4eEwQHnjz/Jyg3
	sxBCpJ3FldwH31Jyy8HoyoqXdwTIVovN0/fpuh8q/kopXNKXOBZhsQzskZ+othYrHYcSKGiCRd7rF
	i/o0MrovPMDFaghL+h93XGfe5txUSBEwDGDkvg/F+i4RRZQymXeB6JjiswqkN8/rRjfJ0u1RGpZaO
	bq4slh93JLTYyCJchEzyjYVBjwuIXAHLfdfIS2+mNd7Sj+EpzCpnZe2bLV5Bjy31wuu6RpGSl7O4U
	qKLgUQIkPyOjjIybJfwTdMYrtxyGuJ1nlRQGbWhvsuDG30d7jk+I1gtrFKpt50zt19PXJWyvMiNCx
	wHDrPABQw6BBXINS80Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIOa-003uPk-N3; Sat, 20 Aug 2022 06:55:48 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIOY-003uO4-EK
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 06:55:48 +0000
Received: by mail-ot1-x334.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso4434961otv.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 23:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=KPNOEhwPuKr2rNEs7Vth7fZX5wzX+lJkHQAT28oftZM=;
        b=mnw8mo+p85WWeHD6KVAZuMFd0M9sEPZgWPeOmxyJAdVCKYqNxjY62gI1d30T3B74/0
         sDIrWCsDeyEfF2UFPDXLPmtW6J/39+zCfB5pEGhyv84oYW8U2+EVAT6VEyTNWirYKTNm
         iEy3aM3j/6lckKeBKE42t6siB30oD11JYGkMRTsfR2J732jSwcUoYolUzf1gWpnbspKF
         EVP3rwcI9UnzOW3WveO/xpO/eBHN22XaGG5vJnIXmNUvTtSRpsaUTY9Hjok9XqltZB6t
         qNGbeHndpxpZ+icJvrXq4TAKLtQoYFVWQG/4kFKAXXaQvcu1gJ6e74z50bknAMRjJkPs
         vKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=KPNOEhwPuKr2rNEs7Vth7fZX5wzX+lJkHQAT28oftZM=;
        b=aWGGONxEOSaMgRw+9gKUlbBFYQIYCF5KcBEwHRg21uYk2lqVl9Brevp1/ylEJ5jm12
         QNdP1isq4am4BPkmKUYNU/UPQ2RmyO5JTsqdp3rk3fwyOW9UOR5vK5xfUqCLUD+2Mpz0
         xnmATmJE/Jl+c8xysoDCyHVxW7urzRROZjv4XVqIflPvKImXBR7HVrsa19wG5fCZCdee
         qfF6mbcl3L3p3mdcuU1wNfs2RS5W5cpqxvAi93U2KPAOiCBPGkv5GxagrZ4mgtq7RPTy
         doDwfu2iqTiHuevJei5HF9um7fRSUajj2JRydA8Y5KxeXbQZxikbX+UkBaXyJx3hTIIt
         Fp6A==
X-Gm-Message-State: ACgBeo0tEsYxjTF9sYLb6vQyrPHN5XWtFAjCbX7SF9ad8weQZXVtnNaT
	ilkfBwKPLF/JGG4zFTdWRXZhAQ==
X-Google-Smtp-Source: AA6agR5ILnYcedXqGh51ZJjhO/bA6id8F/rppfMkigrZPruGOqlxzUMNW0sV5J1OdsTKvAh7Dzkbfg==
X-Received: by 2002:a05:6830:3c1:b0:637:28be:7920 with SMTP id p1-20020a05683003c100b0063728be7920mr4268310otc.105.1660978544886;
        Fri, 19 Aug 2022 23:55:44 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.68])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b00636faf5e2d9sm1661098otl.39.2022.08.19.23.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:55:44 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 0/7] RISC-V IPI Improvements
Date: Sat, 20 Aug 2022 12:24:39 +0530
Message-Id: <20220820065446.389788-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_235546_546120_C4270BA7 
X-CRM114-Status: GOOD (  15.43  )
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

This series aims to improve IPI support in Linux RISC-V in following ways:
 1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
    specific hooks. This also makes Linux RISC-V IPI support aligned with
    other architectures.
 2) Remote TLB flushes and icache flushes should prefer local IPIs instead
    of SBI calls whenever we have specialized hardware (such as RISC-V AIA
    IMSIC and RISC-V SWI) which allows S-mode software to directly inject
    IPIs without any assistance from M-mode runtime firmware.

These patches were originally part of the "Linux RISC-V ACLINT Support"
series but this now a separate series so that it can be merged independently
of the "Linux RISC-V ACLINT Support" series.
(Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)

These patches are also a preparatory patches for the up-coming:
 1) Linux RISC-V AIA support
 2) Linux RISC-V SWI support

These patches can also be found in riscv_ipi_imp_v8 branch at:
https://github.com/avpatel/linux.git

Changes since v7:
 - Rebased on Linux-6.0-rc1
 - Use atomic operations to track per-CPU pending and enabled IPIs in PATCH3.
   (Note: this is inspired from IPI muxing implemented in
    drivers/irqchip/irq-apple-aic.c)
 - Made "struct ipi_mux_ops" (added by PATCH3) flexible so that
   drivers/irqchip/irq-apple-aic.c can adopt it in future.

Changes since v6:
 - Rebased on Linux-5.19-rc7
 - Added documentation for struct ipi_mux_ops in PATCH3
 - Dropped dummy irq_mask()/unmask() in PATCH3
 - Added const for "ipi_mux_chip" in PATCH3
 - Removed "type" initialization from ipi_mux_domain_alloc() in PATCH3
 - Dropped translate() from "ipi_mux_domain_ops" in PATCH3
 - Improved barrier documentation in ipi_mux_process() of PATCH3
 - Added percpu check in ipi_mux_create() for parent_virq of PATCH3
 - Added nr_ipi parameter in ipi_mux_create() of PATCH3

Changes since v5:
 - Rebased on Linux-5.18-rc3
 - Used kernel doc style in PATCH3
 - Removed redundant loop in ipi_mux_process() of PATCH3
 - Removed "RISC-V" prefix form ipi_mux_chip.name of PATCH3
 - Removed use of "this patch" in PATCH3 commit description
 - Addressed few other nit comments in PATCH3

Changes since v4:
 - Rebased on Linux-5.17
 - Includes new PATCH3 which adds mechanism to multiplex a single HW IPI

Changes since v3:
 - Rebased on Linux-5.17-rc6
 - Updated PATCH2 to not export riscv_set_intc_hwnode_fn()
 - Simplified riscv_intc_hwnode() in PATCH2

Changes since v2:
 - Rebased on Linux-5.17-rc4
 - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
   a function which allows drivers to directly discover INTC fwnode

Changes since v1:
 - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2

Anup Patel (7):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
  genirq: Add mechanism to multiplex a single HW IPI
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible

 arch/riscv/Kconfig                |   2 +
 arch/riscv/include/asm/irq.h      |   4 +
 arch/riscv/include/asm/sbi.h      |   7 +
 arch/riscv/include/asm/smp.h      |  49 ++++--
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/irq.c           |  21 ++-
 arch/riscv/kernel/sbi-ipi.c       |  60 ++++++++
 arch/riscv/kernel/sbi.c           |  11 --
 arch/riscv/kernel/smp.c           | 164 ++++++++++----------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 ++++++++++--
 drivers/clocksource/timer-clint.c |  42 +++--
 drivers/irqchip/irq-riscv-intc.c  |  60 ++++----
 include/linux/irq.h               |  18 +++
 kernel/irq/Kconfig                |   5 +
 kernel/irq/Makefile               |   1 +
 kernel/irq/ipi-mux.c              | 244 ++++++++++++++++++++++++++++++
 19 files changed, 628 insertions(+), 167 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 kernel/irq/ipi-mux.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

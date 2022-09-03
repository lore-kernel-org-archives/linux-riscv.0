Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A97ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MR9aHVC9zrVNXlXT5FVwDXewom0qDxKkWZTP1c4+2bw=; b=QGxP8ZS1z7F4z5
	MYD4rqbUk6s73LisTTZ07S3YcD+7hG/HSu1Rpm3RAyiUX5BK/PoFf/budT7GlbocnZ9rmWIYyquPY
	1eikctgEUHd9b1lAFaribHs7MQL3sVXL82nW5FbhCrj7j+Do2EkEAG1JPPtGo8gVqdRyDBFzsdTGw
	QoY40P8k6JKE+m6/06R4vO4AUatOx2Q5KYbuMEcEvJOQuMfF3INvcCY+pcZqzIxRRhQSlKxnyZxrC
	BH1ej49CK0tV5/EqJwvhCGs+UYGTNbLaPSW7VhcAYc8VKINpl6rWDsz67JJR5Yv8WRP+pv44lccQm
	PY4YxOtmkw4r7FgXWlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVly-00DOyv-Pa; Sat, 03 Sep 2022 16:13:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVlv-00DOvX-RH
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:13:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id 9so1476662plj.11
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 09:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Z2Z4CuKPpzIX76o/kIyBP9I5caHG/7FTz4qjELBoKLc=;
        b=eUB/n96VpXBNS7VK2julFtaRSCHw6l/eXZnWOstEF2S/s7zDnnwTixb/unCrFkr4P1
         af2phuRMMWidg151TIc6etI4gKLovjyBJ47yvrUgEN5TZ8yOmpXk8PIJbTlNlINIAshB
         n1rhzIeqOfpVzIlEM13uCgoeWl9VBiue6a6eu9cz5w1a2jPDUYmp3KK9aXSi2RzzTyLv
         qYoFw9YDEop6ags5Ks0bxySG4TCRzWBgafQmgLMNHnTNpthOzKq09YRNduLrPaOPhXbe
         tuvb1lua4mgXi4t+XMGDHDlMOUAlerT0i2QxrO+B+1eVv3xU/OHckniyE3Imo/Cvwmkl
         z3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z2Z4CuKPpzIX76o/kIyBP9I5caHG/7FTz4qjELBoKLc=;
        b=ZJ1hW5q0/otoFTUx9KZRUTr/e/ewheoejKrrqNm3L3QX4Kl76zQfDg6/Hcg3JPwD25
         fIYsTxOIXCusnG5oqzAD+wYPlcplGqKPNMmYKlCGXpTjaC/s/UQRtNjM0Llq9b+3UzFy
         LpL75igobruImfD7fW3a2rSaYHsPK06gVrLpT0xkntBldK4nW5vJmweoWyk8nvtWjzAi
         ESSEd5uQ/E4yPstGLzxyQyy1mIXNurLamvuAGVsaLL1luAaKN4VY9HEXxEtbhWRarwz0
         JWORQ/U3pkz6LuC3aMha1Ol2UqCCeXdK/Yk5i28+pJ8wfBCjrQceDtHGo5j25EFICMpj
         fwVg==
X-Gm-Message-State: ACgBeo2fZqnUk7faAk1aU52g3qdVJSskBZSbwvDgyfK68FwhD8B8TCf6
	X3TK1cbj3rtVKJmRf2NghaXeRcyW/+rOYg==
X-Google-Smtp-Source: AA6agR4/hUeCZWty9GnzkvYFDRVoABaTD6ge6lMlLM2jtJPEhv4bYXNJjqAjPOIjuH7aLLGvORND8g==
X-Received: by 2002:a17:902:b484:b0:170:a2d8:80f6 with SMTP id y4-20020a170902b48400b00170a2d880f6mr40651539plr.97.1662221604732;
        Sat, 03 Sep 2022 09:13:24 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.86.115])
        by smtp.gmail.com with ESMTPSA id 4-20020a620504000000b00537b1aa9191sm4166738pff.178.2022.09.03.09.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 09:13:24 -0700 (PDT)
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
Subject: [PATCH v9 0/7] RISC-V IPI Improvements
Date: Sat,  3 Sep 2022 21:43:02 +0530
Message-Id: <20220903161309.32848-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_091327_900713_26C35426 
X-CRM114-Status: GOOD (  16.01  )
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

These patches can also be found in riscv_ipi_imp_v9 branch at:
https://github.com/avpatel/linux.git

Changes since v8:
 - Rebased on Linux-6.0-rc3
 - Use dummy percpu data as parameter for request_percpu_irq() in PATCH4.

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
 arch/riscv/kernel/smp.c           | 166 ++++++++++----------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 ++++++++++--
 drivers/clocksource/timer-clint.c |  42 +++--
 drivers/irqchip/irq-riscv-intc.c  |  60 ++++----
 include/linux/irq.h               |  18 +++
 kernel/irq/Kconfig                |   5 +
 kernel/irq/Makefile               |   1 +
 kernel/irq/ipi-mux.c              | 244 ++++++++++++++++++++++++++++++
 19 files changed, 630 insertions(+), 167 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 kernel/irq/ipi-mux.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

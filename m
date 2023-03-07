Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C240C678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tW4YDKARXhW2Q/mGM82JGyYBH/V7FKA1fxkWZO8OzoU=; b=ImdukMXo61WTHl
	vBayhxxZRcRGE1aqJKcdBYEcabWYPpumTGExrjn/y7Irn5dgytlYKUHnBE7lCYW0z9QJU6UXj1NNy
	0aEwwY6yVGwCf0qYt55T3IO1kPAUJgQVSdPaZnNp8Y5h9JLwAruN7eCRL793W3i0zNG9nqw1TqOrB
	G3/W580EhgiVrPVVEOziYVlrjgSRyA1aEEuAadw+JgNhcEC3NX0Il/Ad/q+YXLM+Gv3EcHTtbVqki
	rRavoaOyfp/dKs3CgWWQA6g11afHyq+1D25dZQZPkknPGyyppwtweO1v8FWsAS54XNi3mK2ZQUV9r
	HpTP8A9cKp7GJRqFAtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBD-001oiO-CQ; Tue, 07 Mar 2023 17:32:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbB9-001ofh-Qu
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 17:32:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id h8so14887207plf.10
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/DFNifw+shgTpCvVLL2+IaasMh1b7gZ7i36M6XC2VY=;
        b=EqJvAfBhvPQKG4wmingwHT/tofg/oaerE1MXddYFl+AEcW+PU3Idd1JdIrPOC8gNyo
         hOZI2V2XNSjhH10ySEpiMT2VMC0tzRnvAbJSmFLFoPRAELWvLPoot1AaIx8Hc2hz/RO8
         Bq5gMdgrJ/rPFy0FqCgvFjFpTbkKWaJmyIJ6snxqoUi9vHXLUFx3RIo5VkZ7UQSd8rSp
         n2yUEht3UrnimxoCxAtPvMwbo6bTwLuXfBjUXuM2AW4ShSFj4z0ZXco3oAnghFWJ04xT
         Tl1W1gLd9XFXvfvSvXQtNC5dbRQw3E6ztvpOk3Q5cHRzpQJ/egTCyl+KW5r+upe6CGhD
         dJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/DFNifw+shgTpCvVLL2+IaasMh1b7gZ7i36M6XC2VY=;
        b=672o0V97hVW7xlPyJNXvwpdsCKP/8jiwwoQsP6S2kFrjbf5ojQvWTxgvUWXqFlxwyg
         YMnF79m8SlNiVKjv9WZWzDw9vApWVX5YpyuldtiaZodWq7T4/K5/ioBH7HwZPaD+fnB1
         /F2uumDbvg1YQcdbYzS+ZuZNbX0DgVqQ9qBn0WE+1b6kVNOPzYFti1atRmKV+71juffd
         lOXYn7CJT1bBOB2f8lszNmofZF2dWvVYezxeFOMfIXc84BSuCwLoT+fEDD7/Afc2rfMQ
         x1xQHmezBzEiaRgMO0zZhFEJBHb09pKmhSSs4A17bo32+dLqvw4PsCMLHCCRxdyNv3RR
         SWfw==
X-Gm-Message-State: AO0yUKXNFsUe+upRIKoPflVX7aunndxFR9qTqAtTDRydKgy5tVjZK3La
	Z01x7qkJe71BqV1qaEWD6LnGIQ==
X-Google-Smtp-Source: AK7set9Wg1m8RwMirw3U4OahVBkjcOghAarHEF2daXJUo6X8Npq+dxw4XN+fTPAAkCCDEbfp7Z7+TA==
X-Received: by 2002:a05:6a20:69a6:b0:c7:8779:416d with SMTP id t38-20020a056a2069a600b000c78779416dmr15946784pzk.58.1678210364844;
        Tue, 07 Mar 2023 09:32:44 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:32:44 -0800 (PST)
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
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v17 0/7] RISC-V IPI Improvements
Date: Tue,  7 Mar 2023 23:02:24 +0530
Message-Id: <20230307173231.2189275-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_093247_908555_A876C40B 
X-CRM114-Status: GOOD (  18.00  )
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

These patches can also be found in riscv_ipi_imp_v17 branch at:
https://github.com/avpatel/linux.git

Changes since v16:
 - Rebased on Linux-6.3-rc1
 - Dropped PATCH3 and PATCH9 since these patches are already merged
 - Added Palmer's Acked-by

Changes since v15:
 - Rebased on Linux-6.2-rc2
 - Added Reviewed-by and Tested-by tags to some of the patches.

Changes since v14:
 - Minor fixes in commit description of PATCH3 (as suggested by tglx)
 - Don't disable parent IPI when CPU goes offline for SBI IPI driver and
   CLINT driver in PATCH4.
 - Include Apple AIC driver changes from Marc Z as PATCH9

Changes since v13:
 - Included changes suggested by Marc Z in PATCH3
 - Use chained handlers in PATCH4
 - Added new PATCH8 to have empty irq_eoi() in RISC-V INTC driver. This
   avoids the unnecessary mask/unmask dance at time of handling interrupts.

Changes since v12:
 - Rebased on Linux-6.1-rc7
 - Bring-back the IPI optimization in ipi_mux_send_mask() for PATCH3
 - Call ipi_mux_send() for one target CPU at a time in PATCH3

Changes since v11:
 - Removed ipi_mux_pre/post_handle() callbacks in PATCH3
 - Removed sturct ipi_mux_ops in PATCH3
 - Removed parent_virq and data pointer from everywhere in PATCH3
 - Removed struct ipi_mux_control in PATCH3
 - Improved function signature of ipi_mux_send() callback in PATCH3
 - Used unsigned type with atomic operation in PATCH3

Changes since v10:
 - Rebased on Linux-6.1-rc5
 - Drop the "!(pending & ibit)" check in ipi_mux_send_mask() of PATCH3
 - Disable local interrupts in ipi_mux_send_mask() of PATCH3 because we
   can be preempted while using a per-CPU temporary variable.

Changes since v9:
 - Rebased on Linux-6.1-rc3
 - Updated header comment block of ipi-mux.c in PATCH3
 - Use a struct for global data of ipi-mux.c in PATCH3
 - Add per-CPU temp cpumask for sending IPIs in PATCH3
 - Drop the use of fwspec in PATCH3
 - Use static key for ipi_mux_pre_handle() and ipi_mux_post_handle()
   in PATCH3
 - Remove redundant pr_warn_ratelimited() called by ipi_mux_process()
   in PATCH3
 - Remove CPUHP thingy from ipi_mux_create() in PATCH3

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
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible
  irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers

 arch/riscv/Kconfig                |   2 +
 arch/riscv/include/asm/irq.h      |   4 +
 arch/riscv/include/asm/sbi.h      |   9 +-
 arch/riscv/include/asm/smp.h      |  49 ++++++---
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/irq.c           |  21 +++-
 arch/riscv/kernel/sbi-ipi.c       |  77 ++++++++++++++
 arch/riscv/kernel/sbi.c           | 100 +++--------------
 arch/riscv/kernel/smp.c           | 171 +++++++++++++++---------------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++++++---
 drivers/clocksource/timer-clint.c |  65 +++++++++---
 drivers/irqchip/Kconfig           |   1 +
 drivers/irqchip/irq-riscv-intc.c  |  71 ++++++++-----
 16 files changed, 429 insertions(+), 248 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

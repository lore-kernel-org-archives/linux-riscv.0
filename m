Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB5CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gtVWl4lt8gYd20bQPSZ59+8J+LEluep6ib/fqPgWAkM=; b=RFvBCF2R44sHXy
	DTZLUxhmM0oQ+R+7nrmJw9fxzWT2f+9o6Rg5xhgYqumiA3H48Frc+WpE4ommCB+EiMM+x9Wn9KZLx
	zxXYudEzadGBV/Z5PGokI9U5LborUwKhH4+sxsKIBphEm6aQjmA2qha+ZqRtPfLUp3Ggf9A/hwZMr
	OQYz4jFtv/dZhd74Qb+tpUvh61nyYihy4sUG4bmUlxuY9LiOCb+qAjJropAHN9bJtgJdvA+LsrbaW
	AUyN+8U9wF0EWBMOtVOBBouo5lJMQPM5RpWLWasea3yyb0h1eE7CdkOpuu6DNVDBVY6WMpEVrdjD+
	DCplFQEdBI82GxmlzlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgr1-0000000EZMz-1jDC;
	Wed, 03 Jun 2026 08:21:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgqy-0000000EZLr-1y1y;
	Wed, 03 Jun 2026 08:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 509C1401A6;
	Wed,  3 Jun 2026 08:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F78D1F00893;
	Wed,  3 Jun 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474891;
	bh=roqByI0ANZaxZ2rldGt9p/o5LQVsge3W6W4aPEvMzNI=;
	h=From:Subject:Date:To:Cc;
	b=nHpJpaiXA8Jdl1wSU0NSaD4Ku591j9xRmKXRBCzPKXzbx8TVUP6iTkbVe/Z1CSxhs
	 nIYwaXfPbxWHRSQPrsq1qcHSzR+fv79cQI0FDMiSoqjm0ituzsptvJ0OyZwwmc1m+G
	 mm2aGRjbJJVxtSoY0ibiC/tLDtD6kAWmw6rP6WE74r/fCokS45ESO3ygnDVOUES0aE
	 xk+pPxDJr5IjLLtB1h9U8KNBa4TVZh7uqf0+FLfKJ81GRXSHZjLHIfLneFTDBB+NbZ
	 Ge/ovSUZ7TyfNaSRb8LmTMCsL1MnirYZ0essElbcZGIJakcsmGdyc+OPaCQoPm+Lvc
	 4Wq5WDBdEF25Q==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v2 0/6] irqchip/ACPI: Arm GICv5 IWB ACPI IRQ probe deferral
Date: Wed, 03 Jun 2026 10:20:56 +0200
Message-Id: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOjjH2oC/4WOyw6CMBBFf4V07RgolIcr/8OwaMsAo4aSKVYN4
 d/l8QEuT3Jyz52FRyb04hLNgjGQJzesIE+RsL0eOgRqVhYylnmcyQI6shAUaDsS0NvAyM4gNNg
 is36CbWyZVSbRpcrEOjIytvTZA7f6YP8yd7TTtroZPfnJ8Xd/EJLNO2IqVv9iIYEYTFqYUlVVm
 eby+kAe8Hl23Il6WZYf10ma498AAAA=
X-Change-ID: 20260427-gic-v5-acpi-iwb-probe-deferral-cdc849b1a854
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012132_574359_19EA2747 
X-CRM114-Status: GOOD (  10.20  )
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

On Arm GICv5 systems, the IWB (Interrupt Wire Bridge) handles wired interrupts
and it is in charge of translating interrupt wires to GICv5 ITS messages.

In ACPI systems, an IWB is backed by a platform device. Device drivers for
devices whose IRQs are routed to an IWB might probe earlier than the IWB device
driver, which can result in failures in that until the IWB driver is probed and
its IRQ domain is duly registered, IRQs routed to it cannot be resolved.

Some interrupt controllers for the RISC-V architecture suffer from the same
issue; RISC-V, in its ACPI IRQ layer solved the problem by automatically
creating device dependencies that result in the interrupt controllers drivers
being probed before any device driver whose devices IRQs are routed to them is
probed.

Instead of reinventing the wheel, this series move the aforementioned RISC-V
code to generic ACPI IRQ handling code (while fixing some bits and pieces) and
implement GICv5 IWB ACPI probe deferral on top of it.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Changes in v2:
- Split the patchset in several logic units according to review
- Link to v1: https://patch.msgid.link/20260505-gic-v5-acpi-iwb-probe-deferral-v1-0-b37b85998362@kernel.org

---
Lorenzo Pieralisi (6):
      ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
      ACPI: RISC-V: Check acpi_get_handle() status in riscv_acpi_add_prt_dep()
      ACPI: RISC-V: Fix riscv_acpi_add_prt_dep() loop handling
      ACPI: irq: Move RISC-V interrupt controllers autodep to ACPI IRQ code
      ACPI/IORT: Implement ACPI infrastructure to enable GICv5 IWB probe deferral
      irqchip/gic-v5: Enable GICv5 IWB ACPI probe ordering detection

 arch/riscv/include/asm/acpi.h       |   1 +
 drivers/acpi/arm64/iort.c           |  22 ++++-
 drivers/acpi/irq.c                  | 172 +++++++++++++++++++++++++++++++++++-
 drivers/acpi/riscv/irq.c            | 141 +----------------------------
 drivers/acpi/scan.c                 |   1 +
 drivers/irqchip/irq-gic-v3.c        |   2 +-
 drivers/irqchip/irq-gic-v5-iwb.c    |   5 ++
 drivers/irqchip/irq-gic-v5.c        |  13 ++-
 drivers/irqchip/irq-gic.c           |   2 +-
 drivers/irqchip/irq-loongarch-cpu.c |   2 +-
 drivers/irqchip/irq-riscv-intc.c    |   3 +-
 include/linux/acpi.h                |   5 +-
 include/linux/acpi_iort.h           |   3 +-
 13 files changed, 218 insertions(+), 154 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260427-gic-v5-acpi-iwb-probe-deferral-cdc849b1a854

Best regards,
--  
Lorenzo Pieralisi <lpieralisi@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

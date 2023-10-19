Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B1CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nl7hdX230s27VnZBIWfVKICy60rCwnnAxV9rvKAaLSI=; b=KE2DC2Q2+i3s2W
	99zjKimnw2ZWeRwwm4yk+OO6ac/CMZdqvaFG2VW6aUzJb2NQpKO0cmSpb/gyMvMpEfJy5D7gElv6Y
	tdsWxUzpMCRTnOrIoAVd8Kpp+FGiXtaZi9mjakT53TDz7SCwG/MnOMwgXdtgXJiYX3JfEPUMPrsCp
	zqCCjD0582TvM7gjfFstllh4goBhj/t5qRDyDirOIaZcEFFyIPdAzDCjX3fWZcOu5bPs1fFsn8Aol
	f1/9MuTCQvvh/0XWkyfFRA+I457RBHwDYIumw7VO24FttqQl7r5WbNLKi+OI6zc1CTkeIv8ehQ2b6
	prEh9+qJyiLnj3ZnD0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTVV-00HZqt-0i;
	Thu, 19 Oct 2023 13:56:13 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTVQ-00HZpS-03
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 13:56:10 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39JDtmVk022024;
	Thu, 19 Oct 2023 21:55:48 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 19 Oct 2023
 21:55:44 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <linux-riscv@lists.infradead.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>,
        <peterlin@andestech.com>
Subject: [PATCH v2 00/10] Support Andes PMU extension
Date: Thu, 19 Oct 2023 21:52:38 +0800
Message-ID: <20231019135238.3654285-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39JDtmVk022024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_065608_493845_D9694FD8 
X-CRM114-Status: GOOD (  11.47  )
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

Hi All,

This patch series introduces the Andes PMU extension, which serves
the same purpose as Sscofpmf. In this version we use FDT-based
probing and the CONFIG_ANDES_CUSTOM_PMU to enable perf sampling
and filtering support.

Its non-standard local interrupt is assigned to bit 18 in the
custom S-mode local interrupt pending CSR (slip), while the
interrupt cause is (256 + 18).

The feature needs the PMU device callbacks in OpenSBI.
The OpenSBI and Linux patches can be found on Andes Technology GitHub
- https://github.com/andestech/opensbi/commits/andes-pmu-support-v2
- https://github.com/andestech/linux/commits/andes-pmu-support-v2

The PMU device tree node used on AX45MP:
- https://github.com/andestech/opensbi/blob/andes-pmu-support-v2/docs/pmu_support.md#example-3

Tested hardware:
- ASUS  Tinker-V (RZ/Five, AX45MP single core)
- Andes AE350    (AX45MP quad core)

Locus Wei-Han Chen (1):
  riscv: andes: Support symbolic FW and HW raw events

Yu Chien Peter Lin (9):
  riscv: errata: Rename defines for Andes
  irqchip/riscv-intc: Allow large non-standard hwirq number
  irqchip/riscv-intc: Introduce Andes IRQ chip
  riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
    INTC
  dt-bindings: riscv: Add andestech,cpu-intc to interrupt-controller
  perf: RISC-V: Eliminate redundant IRQ enable/disable operations
  perf: RISC-V: Move T-Head PMU to CPU feature alternative framework
  perf: RISC-V: Introduce Andes PMU for perf event sampling
  riscv: dts: renesas: Add Andes PMU extension

 .../devicetree/bindings/riscv/cpus.yaml       |   4 +-
 arch/riscv/Kconfig.errata                     |  13 --
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-
 arch/riscv/errata/andes/errata.c              |  10 +-
 arch/riscv/errata/thead/errata.c              |  19 ---
 arch/riscv/include/asm/errata_list.h          |  19 +--
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/vendorid_list.h        |   2 +-
 arch/riscv/kernel/alternative.c               |   2 +-
 arch/riscv/kernel/cpufeature.c                |   2 +
 drivers/irqchip/irq-riscv-intc.c              |  61 +++++++--
 drivers/perf/Kconfig                          |  27 ++++
 drivers/perf/riscv_pmu_sbi.c                  |  49 ++++++-
 include/linux/irqchip/irq-riscv-intc.h        |  12 ++
 .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
 .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
 .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
 .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 19 files changed, 481 insertions(+), 75 deletions(-)
 create mode 100644 include/linux/irqchip/irq-riscv-intc.h
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

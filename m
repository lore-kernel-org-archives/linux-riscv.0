Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D28EEE14AA
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IOjY4klBxcynrlU6e/zX7qI5Fn8KyhnvFJ3iSTnM5EA=; b=P6QZ5tZIvQJUXx
	ExY5ugcVFSSsOoNE+cXIepxK0acPC7B4Q1n7IzsAulci1V99k+PrwgmSqS2vGwTSiEPDifAsodYd+
	uwE5DN7CJiQGp1N1dEj1v8IoT0wxSBxLQwqdJ8BNKmWmxgHsG99AIS/V1ajB5HI//n+sdhLLB5LNW
	0Y/JCpOeTEZCVYyBlj/2zoihegGxx1S4ZuaNsDjqYlPXj1qMWh9HMHf7IgvLuZlj70sN8jE6HKKqc
	EdouTe4h0AosXME//QHVGTmJbEkw2Vprcd66DaXhqH+CT+suX/HBvZ6WXr+yjxhUA1zchaTSK1jLJ
	JWsvlxvpnQks0sspRNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bZ-00BBJk-00;
	Thu, 07 Sep 2023 02:18:49 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bS-00BBHM-2x;
	Thu, 07 Sep 2023 02:18:45 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3872I5eM024097;
	Thu, 7 Sep 2023 10:18:05 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Sep 2023
 10:18:00 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
        <atishp@atishpatra.org>, <anup@brainfault.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: <ajones@ventanamicro.com>, <heiko@sntech.de>, <samuel@sholland.org>,
        <geert+renesas@glider.be>, <n.shubin@yadro.com>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>,
        Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH 0/4] Support Andes PMU extension
Date: Thu, 7 Sep 2023 10:16:31 +0800
Message-ID: <20230907021635.1002738-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3872I5eM024097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_191843_393281_4E331A95 
X-CRM114-Status: GOOD (  10.12  )
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

This patch series introduces the Andes PMU errata, which
adds support for perf sampling and mode filtering with
the Andes PMU extension. 

The custom PMU extension serves the same purpose as Sscofpmf.
Its non-standard local interrupt is assigned to bit 18 in the
custom S-mode local interrupt pending CSR (slip), while the
interrupt cause is (256 + 18).

This series is dependent on the series from Prabhakar,
- https://patchwork.kernel.org/project/linux-riscv/cover/20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

The feature needs the PMU device callbacks in OpenSBI.
The OpenSBI and Linux patches can be found on Andes Technology GitHub
- https://github.com/andestech/opensbi/commits/andes-pmu-support
- https://github.com/andestech/linux/commits/andes-pmu-support

The PMU device tree node of AX45MP:
- https://github.com/andestech/opensbi/blob/andes-pmu-support/docs/pmu_support.md#example-3

Tested hardware:
- ASUS  Tinker-V (RZ/Five, AX45MP single core)
- Andes AE350    (AX45MP quad core)

Locus Wei-Han Chen (1):
  riscv: andes: Support symbolic FW and HW raw events

Yu Chien Peter Lin (3):
  riscv: errata: Rename defines for Andes
  irqchip/riscv-intc: Support large non-standard hwirq number
  riscv: errata: Add Andes PMU errata

 arch/riscv/Kconfig.errata                     |  13 ++
 arch/riscv/errata/andes/errata.c              |  55 +++++++-
 arch/riscv/include/asm/errata_list.h          |  45 ++++++-
 arch/riscv/include/asm/vendorid_list.h        |   2 +-
 arch/riscv/kernel/alternative.c               |   2 +-
 drivers/irqchip/irq-riscv-intc.c              |  10 +-
 drivers/perf/riscv_pmu_sbi.c                  |  20 ++-
 .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
 .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
 .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
 .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 12 files changed, 453 insertions(+), 24 deletions(-)
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

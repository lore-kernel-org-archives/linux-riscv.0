Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08593CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6Dvk06BfqL4vLh8WWVNuQ28xYp09F8XygQdD0EvhBE=; b=pEJ1xPbqdv1mCs
	B9lWISRtVPvPPohWYwDbuRi+17Fhc0Q0hL+cmjMqk1pvI4icyzCKM2vadU/PbPN66Bi+Ju5us+8ml
	MD/+tVkYMD+yRggWUNcsUqTf7lhbJ07T553Liua+S+AxEYBL19jcuYmUz2EBBz6SwcWisFTrciaGJ
	/v0T9Az00ielP3GpSKJWOZ4g2QU4JF0LuJQUAzS9m4/aWdOawCqoglUBp/dpp1ZcK6mxJJb3WcdX8
	yTZLo2a63+YAdbQqS9gUpy814vw+3Ry++0S1SIb7Zb1Glzn7AYThcBYD/SElSekqyWDvGnyWe6i92
	5HYt+hMNavNhHvjTuzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJgB-0000000E1iG-2oNd;
	Wed, 10 Sep 2025 12:12:03 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJg9-0000000E1gN-2BWU
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 12:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757506319; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=961RzLYNaE+6MHkCqPuztzrhQhdEaKYDqLZdVJiqp1s=;
	b=CSLhbETtXVYpjZdQ8Vqlyn1oLQOsF/k2c9hfIFHNo3slDT8wtk59Z5QYDrg8qPQT/uWdG00l5I+bTDfW0cVLZ45URGvsJLDf9gVi2xUT+eMVdb8gsjZIQFAWbzTHNU91MEo204iKp/GF4NBRDRJuCZLmMJOyDBbBLmh7hrcFIjo=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Wni1qBM_1757506314 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 20:11:56 +0800
From: cp0613@linux.alibaba.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org,
	jeeheng.sia@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 2/2] perf vendor events riscv: Add T-HEAD C930 metrics
Date: Wed, 10 Sep 2025 20:11:21 +0800
Message-ID: <20250910121121.7203-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910121121.7203-1-cp0613@linux.alibaba.com>
References: <20250910121121.7203-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_051201_901786_ECD539D8 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

From: Chen Pei <cp0613@linux.alibaba.com>

This patch adds T-HEAD C930 metrics, including topdown and some
other metric groups.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 .../arch/riscv/thead/c930/metrics.json        | 538 ++++++++++++++++++
 1 file changed, 538 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/metrics.json

diff --git a/tools/perf/pmu-events/arch/riscv/thead/c930/metrics.json b/tools/perf/pmu-events/arch/riscv/thead/c930/metrics.json
new file mode 100644
index 000000000000..689bae6209dc
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/thead/c930/metrics.json
@@ -0,0 +1,538 @@
+[
+    {
+        "MetricExpr": "(topdown.frontend_bound.slots - topdown.bad_speculation.recovery_bubbles*8) / topdown.slots ",
+        "PublicDescription": "Fraction of slots unused due to the frontend's inability to supply enough uops",
+        "BriefDescription": "Fraction of slots unused due to the frontend's inability to supply enough uops",
+        "CommonMetricgroupName": "TopdownL1",
+        "MetricGroup": "Common;TopdownL1",
+        "MetricName": "topdown.frontend_bound.rate"
+    },
+    {
+        "MetricExpr": "(uop.spec - uop.ret + topdown.bad_speculation.recovery_bubbles*8) / topdown.slots",
+        "PublicDescription": "Fraction of slots wasted due to incorrect speculations",
+        "BriefDescription": "Fraction of slots wasted due to incorrect speculations",
+        "CommonMetricgroupName": "TopdownL1",
+        "MetricGroup": "Common;TopdownL1",
+        "MetricName": "topdown.bad_speculation.rate"
+    },
+    {
+        "MetricExpr": "uop.ret / topdown.slots",
+        "PublicDescription": "Fraction of slots that retired",
+        "BriefDescription": "Fraction of slots that retired",
+        "CommonMetricgroupName": "TopdownL1",
+        "MetricGroup": "Common;TopdownL1",
+        "MetricName": "topdown.retiring.rate"
+    },
+    {
+        "MetricExpr": "1 - (topdown.frontend_bound.rate + topdown.bad_speculation.rate + topdown.retiring.rate)",
+        "PublicDescription": "Fraction of slots unused due to a lack of backend resources",
+        "BriefDescription": "Fraction of slots unused due to a lack of backend resources",
+        "CommonMetricgroupName": "TopdownL1",
+        "MetricGroup": "Common;TopdownL1",
+        "MetricName": "topdown.backend_bound.rate"
+    },
+    {
+        "MetricExpr": "topdown.frontend_bound.latency.slots / topdown.slots",
+        "PublicDescription": "Fetch latency bound L2 topdown metric",
+        "BriefDescription": "Fetch latency bound L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.frontend_bound.latency.rate"
+    },
+    {
+        "MetricExpr": "topdown.frontend_bound.rate - topdown.frontend_bound.latency.rate",
+        "PublicDescription": "Fetch bandwidth bound L2 topdown metric",
+        "BriefDescription": "Fetch bandwidth bound L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.frontend_bound.bandwidth.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.rate * inst.mispred.brjmp.spec / (inst.mispred.brjmp.spec + topdown.bad_speculation.exception_flush + topdown.bad_speculation.interrupt_flush + topdown.bad_speculation.other_flush + topdown.bad_speculation.rar_hazard_early_flush + topdown.bad_speculation.raw_hazard_early_flush)",
+        "PublicDescription": "Branch mispredicts L2 topdown metric",
+        "BriefDescription": "Branch mispredicts L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.bad_speculation.branch_mispredicts.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.rate * (topdown.bad_speculation.raw_hazard_early_flush + topdown.bad_speculation.rar_hazard_early_flush) / (inst.mispred.brjmp.spec + topdown.bad_speculation.exception_flush + topdown.bad_speculation.interrupt_flush + topdown.bad_speculation.other_flush + topdown.bad_speculation.rar_hazard_early_flush + topdown.bad_speculation.raw_hazard_early_flush)",
+        "PublicDescription": "Load/Store early flush L2 topdown metric",
+        "BriefDescription": "Load/Store early flush L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.bad_speculation.ldst_early_flush.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.rate - (topdown.bad_speculation.branch_mispredicts.rate + topdown.bad_speculation.ldst_early_flush.rate)",
+        "PublicDescription": "Machine clears L2 topdown metric",
+        "BriefDescription": "Machine clears L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.bad_speculation.machine_clears.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.rate * (topdown.backend_bound.memory.load + topdown.backend_bound.memory.store)/cycles.hart",
+        "PublicDescription": "Memory bound L2 topdown metric",
+        "BriefDescription": "Memory bound L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.backend_bound.memory_bound.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.rate - topdown.backend_bound.memory_bound.rate",
+        "PublicDescription": "Core bound L2 topdown metric",
+        "BriefDescription": "Core bound L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.backend_bound.core_bound.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * (inst.int.alu.spec + inst.int.mul.spec + inst.int.div.spec + inst.int.csr.spec) / uop.spec",
+        "PublicDescription": "Integer operations L2 topdown metric",
+        "BriefDescription": "Integer operations L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.retiring.int.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.brjmp.spec / uop.spec",
+        "PublicDescription": "Branch operations L2 topdown metric",
+        "BriefDescription": "Branch operations L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.retiring.brjmp.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.spec / uop.spec",
+        "PublicDescription": "Load/Store operations L2 topdown metric",
+        "BriefDescription": "Load/Store operations L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.retiring.ldst.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.sca.fp.arith.spec / uop.spec",
+        "PublicDescription": "Scalar float point arithmetic operations L2 topdown metric",
+        "BriefDescription": "Scalar float point arithmetic operations L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.retiring.fp.arith.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.rvv.arith.spec / uop.spec",
+        "PublicDescription": "Vector arithmetic operations L2 topdown metric",
+        "BriefDescription": "Vector arithmetic operations L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.retiring.rvv.arith.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate - topdown.retiring.int.rate - topdown.retiring.brjmp.rate - topdown.retiring.ldst.rate - topdown.retiring.fp.arith.rate - topdown.retiring.rvv.arith.rate",
+        "PublicDescription": "Other operations L2 topdown metric",
+        "BriefDescription": "Other operations L2 topdown metric",
+        "MetricGroup": "TopdownL2",
+        "MetricName": "topdown.retiring.other.rate"
+    },
+    {
+        "MetricExpr": "cache.l1i.rd.miss.latency / cycles.hart",
+        "PublicDescription": "Idle by icache miss L3 topdown metric",
+        "BriefDescription": "Idle by icache miss L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.frontend_bound.latency.data.rate"
+    },
+    {
+        "MetricExpr": "tlb.l1i.miss.latency / cycles.hart",
+        "PublicDescription": "Idle by itlb miss L3 topdown metric",
+        "BriefDescription": "Idle by itlb miss L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.frontend_bound.latency.addr.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.brjmp.latency / cycles.hart",
+        "PublicDescription": "Idle by fetch pipeline bubbles L3 topdown metric",
+        "BriefDescription": "Idle by fetch pipeline bubbles L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.frontend_bound.latency.redirect.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.brjmp.spec / inst.brjmp.spec",
+        "PublicDescription": "Branch misprediction rate L3 topdown metric",
+        "BriefDescription": "Branch misprediction rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.brjmp.spec * 1000 / uop.spec",
+        "PublicDescription": "Branch misprediction per 1000 instructions L3 topdown metric",
+        "BriefDescription": "Branch misprediction per 1000 instructions L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.pki"
+    },
+    {
+        "MetricExpr": "inst.mispred.branch / inst.brjmp.branch.spec",
+        "PublicDescription": "Condition branch misprediction rate L3 topdown metric",
+        "BriefDescription": "Condition branch misprediction rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.branch.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.branch *1000 / uop.spec",
+        "PublicDescription": "Condition branch misprediction per 1000 instructions L3 topdown metric",
+        "BriefDescription": "Condition branch misprediction per 1000 instructions L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.branch.pki"
+    },
+    {
+        "MetricExpr": "inst.mispred.uncond_branch / inst.brjmp.uncond_branch.spec",
+        "PublicDescription": "Unconditional branch (exclude indirect branch and function return) misprediction rate L3 topdown metric",
+        "BriefDescription": "Unconditional branch (exclude indirect branch and function return) misprediction rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.uncond_branch.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.uncond_branch *1000 / uop.spec",
+        "PublicDescription": "Unconditional branch (exclude indirect branch and function return) misprediction per 1000 instructions L3 topdown metric",
+        "BriefDescription": "Unconditional branch (exclude indirect branch and function return) misprediction per 1000 instructions L3 topdown metric",
+        "MetricGroup": "TopdownL3;Per-instruction",
+        "MetricName": "inst.mispred.uncond_branch.pki"
+    },
+    {
+        "MetricExpr": "inst.mispred.ind / inst.brjmp.ind.spec",
+        "PublicDescription": "Indirect branch misprediction rate L3 topdown metric",
+        "BriefDescription": "Indirect branch misprediction rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.ind.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.ind *1000 / uop.spec",
+        "PublicDescription": "Indirect branch misprediction per 1000 instructions L3 topdown metric",
+        "BriefDescription": "Indirect branch misprediction per 1000 instructions L3 topdown metric",
+        "MetricGroup": "TopdownL3;Per-instruction",
+        "MetricName": "inst.mispred.ind.pki"
+    },
+    {
+        "MetricExpr": "inst.mispred.ret / inst.brjmp.ret.spec",
+        "PublicDescription": "Function return misprediction rate L3 topdown metric",
+        "BriefDescription": "Function return misprediction rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "inst.mispred.ret.rate"
+    },
+    {
+        "MetricExpr": "inst.mispred.ret *1000 / uop.spec",
+        "PublicDescription": "Function return misprediction per 1000 instructions L3 topdown metric",
+        "BriefDescription": "Function return misprediction per 1000 instructions L3 topdown metric",
+        "MetricGroup": "TopdownL3;Per-instruction",
+        "MetricName": "inst.mispred.ret.pki"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.raw_hazard_early_flush / (topdown.bad_speculation.raw_hazard_early_flush + topdown.bad_speculation.rar_hazard_early_flush)",
+        "PublicDescription": "RAW early flush rate L3 topdown metric",
+        "BriefDescription": "RAW early flush rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.bad_speculation.raw_hazard_early_flush.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.rar_hazard_early_flush / (topdown.bad_speculation.raw_hazard_early_flush + topdown.bad_speculation.rar_hazard_early_flush)",
+        "PublicDescription": "RAR early flush rate L3 topdown metric",
+        "BriefDescription": "RAR early flush rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.bad_speculation.rar_hazard_early_flush.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.exception_flush / (topdown.bad_speculation.exception_flush + topdown.bad_speculation.interrupt_flush + topdown.bad_speculation.other_flush)",
+        "PublicDescription": "exception flush rate L3 topdown metric",
+        "BriefDescription": "exception flush rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.bad_speculation.exception_flush.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.interrupt_flush / (topdown.bad_speculation.exception_flush + topdown.bad_speculation.interrupt_flush + topdown.bad_speculation.other_flush)",
+        "PublicDescription": "interrupt flush rate L3 topdown metric",
+        "BriefDescription": "interrupt flush rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.bad_speculation.interrupt_flush.rate"
+    },
+    {
+        "MetricExpr": "topdown.bad_speculation.other_flush / (topdown.bad_speculation.exception_flush + topdown.bad_speculation.interrupt_flush + topdown.bad_speculation.other_flush)",
+        "PublicDescription": "other flush rate L3 topdown metric",
+        "BriefDescription": "other flush rate L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.bad_speculation.other_flush.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.int.alu.spec / uop.spec",
+        "PublicDescription": "Arithmetic operations L3 topdown metric",
+        "BriefDescription": "Arithmetic operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.int.alu.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.int.mul.spec / uop.spec",
+        "PublicDescription": "Multiplication operations L3 topdown metric",
+        "BriefDescription": "Multiplication operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.int.mul.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.int.div.spec / uop.spec",
+        "PublicDescription": "Division operations L3 topdown metric",
+        "BriefDescription": "Division operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.int.div.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.int.csr.spec / uop.spec",
+        "PublicDescription": "CSR access operations L3 topdown metric",
+        "BriefDescription": "CSR access operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.int.csr.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.brjmp.branch.spec / uop.spec",
+        "PublicDescription": "Conditional branch operations L3 topdown metric",
+        "BriefDescription": "Conditional branch operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.brjmp.branch.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.brjmp.ind.spec / uop.spec",
+        "PublicDescription": "Indirect branch operations L3 topdown metric",
+        "BriefDescription": "Indirect branch operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.brjmp.ind.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.brjmp.ret.spec / uop.spec",
+        "PublicDescription": "Function return operations L3 topdown metric",
+        "BriefDescription": "Function return operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.brjmp.ret.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.brjmp.uncond_branch.spec / uop.spec",
+        "PublicDescription": "Unconditional branch operations L3 topdown metric",
+        "BriefDescription": "Unconditional branch operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.brjmp.uncond_branch.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.load.spec / uop.spec",
+        "PublicDescription": "Load operations L3 topdown metric",
+        "BriefDescription": "Load operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.ldst.load.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.store.spec / uop.spec",
+        "PublicDescription": "Store operations L3 topdown metric",
+        "BriefDescription": "Store operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.ldst.store.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.float_load.spec / uop.spec",
+        "PublicDescription": "Float load operations L3 topdown metric",
+        "BriefDescription": "Float laod operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.ldst.float_load.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.float_store.spec / uop.spec",
+        "PublicDescription": "Float store operations L3 topdown metric",
+        "BriefDescription": "Float store operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.ldst.float_store.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.vec_load.spec / uop.spec",
+        "PublicDescription": "Vector load operations L3 topdown metric",
+        "BriefDescription": "Vector load operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.ldst.vec_load.rate"
+    },
+    {
+        "MetricExpr": "topdown.retiring.rate * inst.ldst.vec_store.spec / uop.spec",
+        "PublicDescription": "Vector store operations L3 topdown metric",
+        "BriefDescription": "Vector store operations L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.retiring.ldst.vec_store.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.core.barrier_csr / cycles.hart",
+        "PublicDescription": "Core bound barrier stall L3 topdown metric",
+        "BriefDescription": "Core bound barrier stall L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.core.barrier.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.core.highload / cycles.hart",
+        "PublicDescription": "Core bound high load stall L3 topdown metric",
+        "BriefDescription": "Core bound high load stall L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.core.highload.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.core.rob_full / cycles.hart",
+        "PublicDescription": "Core bound rob full stall L3 topdown metric",
+        "BriefDescription": "Core bound rob full stall L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.core.rob_full.rate"
+    },
+    {
+        "MetricExpr": " (ieu.is.siq.stall + ieu.is.miq.stall + ieu.is.biq.stall + ieu.is.lsiq.stall + ieu.is.vfpq.stall) / cycles.hart",
+        "PublicDescription": "Core bound issue queue stall L3 topdown metric",
+        "BriefDescription": "Core bound issueu queue stall L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.core.is_stall.rate"
+    },
+    {
+        "MetricExpr": " topdown.backend_bound.core.div_busy / cycles.hart",
+        "PublicDescription": "Core bound div busy stall L3 topdown metric",
+        "BriefDescription": "Core bound div busy stall L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.core.div_busy.rate"
+    },
+    {
+        "MetricExpr": " topdown.backend_bound.core.rvv_stall / cycles.hart",
+        "PublicDescription": "Core bound rvv stall L3 topdown metric",
+        "BriefDescription": "Core bound rvv stall L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.core.rvv_stall.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.memory.load.l2_miss / (topdown.backend_bound.memory.load + topdown.backend_bound.memory.store)",
+        "PublicDescription": "External memory bound L3 topdown metric",
+        "BriefDescription": "External memory bound L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.memory.ext_mem_bound.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.memory.load.l1_miss / (topdown.backend_bound.memory.load + topdown.backend_bound.memory.store)",
+        "PublicDescription": "L2 memory bound L3 topdown metric",
+        "BriefDescription": "L2 memory bound L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.memory.l2_bound.rate"
+    },
+    {
+        "MetricExpr": "1 - topdown.backend_bound.memory.ext_mem_bound.rate - topdown.backend_bound.memory.l2_bound.rate - topdown.backend_bound.memory.store_bound.rate",
+        "PublicDescription": "L1 memory bound L3 topdown metric",
+        "BriefDescription": "L1 memory bound L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.memory.l1_bound.rate"
+    },
+    {
+        "MetricExpr": "topdown.backend_bound.memory.store / (topdown.backend_bound.memory.load + topdown.backend_bound.memory.store)",
+        "PublicDescription": "Store bound L3 topdown metric",
+        "BriefDescription": "Store bound L3 topdown metric",
+        "MetricGroup": "TopdownL3",
+        "MetricName": "topdown.backend_bound.memory.store_bound.rate"
+    },
+    {
+        "MetricExpr": "cycles.hart * 8",
+        "PublicDescription": "Total slots",
+        "BriefDescription": "Total slots",
+        "MetricGroup": "Common",
+        "MetricName": "topdown.slots"
+    },
+    {
+        "MetricExpr": "uop.ret / cycles.hart",
+        "PublicDescription": "Instructions per cycle",
+        "BriefDescription": "Instructions per cycle",
+        "MetricGroup": "Common;Per-cycle",
+        "MetricName": "ipc"
+    },
+    {
+        "MetricExpr": "cache.l1d.rd.miss * 1000 / uop.ret",
+        "PublicDescription": "l1 dcache access misses per 1000 instructions",
+        "BriefDescription": "l1 dcache access misses per 1000 instructions",
+        "MetricGroup": "Common;Per-instruction",
+        "MetricName": "cache.l1d.rd.data.mpki"
+    },
+    {
+        "MetricExpr": "cache.l1d.wr.miss * 1000 / uop.ret",
+        "PublicDescription": "l1 dcache write access misses per 1000 instructions",
+        "BriefDescription": "l1 dcache write access misses per 1000 instructions",
+        "MetricGroup": "Common;Per-instruction",
+        "MetricName": "cache.l1d.wr.data.mpki"
+    },
+    {
+        "MetricExpr": "cache.l1i.rd.miss * 1000 / uop.ret",
+        "PublicDescription": "l1 icache access misses per 1000 instructions",
+        "BriefDescription": "l1 icache access misses per 1000 instructions",
+        "MetricGroup": "Common;Per-instruction",
+        "MetricName": "cache.l1i.rd.code.mpki"
+    },
+    {
+        "MetricExpr": "cache.l2.miss * 1000 / uop.ret",
+        "PublicDescription": "l2 cache access misses per 1000 instructions",
+        "BriefDescription": "l2 cache access misses per 1000 instructions",
+        "MetricGroup": "Common;Per-instruction",
+        "MetricName": "cache.l2.mpki"
+    },
+    {
+        "MetricExpr": "tlb.l1d.miss * 1000 / uop.ret",
+        "PublicDescription": "L1 TLB misses caused by data loads or stores per 1000 instructions",
+        "BriefDescription": "L1 TLB misses caused by data loads or stores per 1000 instructions",
+        "MetricGroup": "Common;Per-instruction",
+        "MetricName": "tlb.l1d.ldst.mpki"
+    },
+    {
+        "MetricExpr": "tlb.l1i.miss * 1000 / uop.ret",
+        "PublicDescription": "L1 TLB misses caused by instruction fetch per 1000 instructions",
+        "BriefDescription": "L1 TLB misses caused by instruction fetch per 1000 instructions",
+        "MetricGroup": "Common;Per-instruction",
+        "MetricName": "tlb.l1i.code.mpki"
+    },
+    {
+        "MetricExpr": "cache.l1d.rd.miss / cache.l1d.rd.access",
+        "PublicDescription": "l1 dcache access miss rate",
+        "BriefDescription": "l1 dcache access miss rate",
+        "MetricGroup": "Common",
+        "MetricName": "cache.l1d.rd.data.miss.rate"
+    },
+    {
+        "MetricExpr": "cache.l1d.wr.miss / cache.l1d.wr.access",
+        "PublicDescription": "l1 dcache write access miss rate",
+        "BriefDescription": "l1 dcache write access miss rate",
+        "MetricGroup": "Common",
+        "MetricName": "cache.l1d.wr.data.miss.rate"
+    },
+    {
+        "MetricExpr": "cache.l1i.rd.miss / cache.l1i.rd.access",
+        "PublicDescription": "l1 icache access miss rate",
+        "BriefDescription": "l1 icache access miss rate",
+        "MetricGroup": "Common",
+        "MetricName": "cache.l1i.rd.code.miss.rate"
+    },
+    {
+        "MetricExpr": "cache.l2.miss / cache.l2.access",
+        "PublicDescription": "l2 cache access miss rate",
+        "BriefDescription": "l2 cache access miss rate",
+        "MetricGroup": "Common",
+        "MetricName": "cache.l2.rd.miss.rate"
+    },
+    {
+        "MetricExpr": "1 - topdown.backend_bound.memory.demand_read.l3 / topdown.backend_bound.memory.demand_read",
+        "PublicDescription": "LLC access miss rate",
+        "BriefDescription": "lLC access miss rate",
+        "MetricGroup": "Common",
+        "MetricName": "cache.l3.rd.miss.rate"
+    },
+    {
+        "MetricExpr": "tlb.l1d.miss / tlb.l1d.access",
+        "PublicDescription": "L1 TLB misses caused by data loads or stores rate",
+        "BriefDescription": "L1 TLB misses caused by data loads or stores rate",
+        "MetricGroup": "Common",
+        "MetricName": "tlb.l1d.ldst.miss.rate"
+    },
+    {
+        "MetricExpr": "tlb.l1i.miss / tlb.l1i.access",
+        "PublicDescription": "L1 TLB misses caused by instruction fetch rate",
+        "BriefDescription": "L1 TLB misses caused by instruction fetch rate",
+        "MetricGroup": "Common",
+        "MetricName": "tlb.l1i.code.miss.rate"
+    },
+    {
+        "MetricExpr": " bus.rd.access / bus.access",
+        "PublicDescription": "Bus read access rate",
+        "BriefDescription": "Bus read access rate",
+        "MetricGroup": "Common",
+        "MetricName": "bus.rd.rate"
+    },
+    {
+        "MetricExpr": " bus.wr.access / bus.access",
+        "PublicDescription": "Bus write access rate",
+        "BriefDescription": "Bus write access rate",
+        "MetricGroup": "Common",
+        "MetricName": "bus.wr.rate"
+    }
+]
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

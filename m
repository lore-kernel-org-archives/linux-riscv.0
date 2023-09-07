Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ECEEE14D3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SZac5U0LnqmLYGxWJoIYe1QS24GnD3VjZb4xYSoPZw=; b=ObO2i1uic8he9b
	wiUI/kK/AYlmtQTQ/ceoeYBXudEYbvXEifkN3gKnkdktRKZ1IB/4k1exhNmp6DxBXb0YEC6kANWeF
	0Pg3KI6TZTCjgicUyF0kMERz36BIVFa01p3j5srAcbbk7XeQOmgPZhmZqvKxXUgzYtyV3QCeF++PI
	lxXQzbpO/jp90aOZ/4eW2+xoBF5fnaRIoaRgBH9UGqBnemQ//P01zTLo9z0gy9D5dDWyrvJceMDwT
	blCBwSaebrU9Q7LEJ/hdJVOI0q3Hw/bi7F6WwbRbklLkwa00tQJ5Vf+IkCdmWP7DwwGgb0+I6o6aZ
	MDJ6JItKaRkFN+lj3Gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bd-00BBLf-1V;
	Thu, 07 Sep 2023 02:18:53 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bV-00BBI8-28;
	Thu, 07 Sep 2023 02:18:48 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3872IP4m024163;
	Thu, 7 Sep 2023 10:18:25 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Sep 2023
 10:18:20 +0800
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
Subject: [PATCH 4/4] riscv: andes: Support symbolic FW and HW raw events
Date: Thu, 7 Sep 2023 10:16:35 +0800
Message-ID: <20230907021635.1002738-5-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907021635.1002738-1-peterlin@andestech.com>
References: <20230907021635.1002738-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3872IP4m024163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_191846_141585_F1493C41 
X-CRM114-Status: GOOD (  11.30  )
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

From: Locus Wei-Han Chen <locus84@andestech.com>

This patch adds the Andes AX45 JSON files in the perf tool,
allowing perf to be used with symbolic event names.

Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
 .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
 .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
 .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 5 files changed, 330 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json

diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
new file mode 100644
index 000000000000..9b4a032186a7
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
@@ -0,0 +1,68 @@
+[
+  {
+    "ArchStdEvent": "FW_MISALIGNED_LOAD"
+  },
+  {
+    "ArchStdEvent": "FW_MISALIGNED_STORE"
+  },
+  {
+    "ArchStdEvent": "FW_ACCESS_LOAD"
+  },
+  {
+    "ArchStdEvent": "FW_ACCESS_STORE"
+  },
+  {
+    "ArchStdEvent": "FW_ILLEGAL_INSN"
+  },
+  {
+    "ArchStdEvent": "FW_SET_TIMER"
+  },
+  {
+    "ArchStdEvent": "FW_IPI_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_IPI_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_FENCE_I_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_FENCE_I_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_VMID_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_GVMA_VMID_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_RECEIVED"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_ASID_SENT"
+  },
+  {
+    "ArchStdEvent": "FW_HFENCE_VVMA_ASID_RECEIVED"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
new file mode 100644
index 000000000000..713a08c1a40f
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
@@ -0,0 +1,127 @@
+[
+	{
+		"EventCode": "0x10",
+		"EventName": "cycle_count",
+		"BriefDescription": "Cycle count"
+	},
+	{
+		"EventCode": "0x20",
+		"EventName": "inst_count",
+		"BriefDescription": "Retired instruction count"
+	},
+	{
+		"EventCode": "0x30",
+		"EventName": "int_load_inst",
+		"BriefDescription": "Integer load instruction count"
+	},
+	{
+		"EventCode": "0x40",
+		"EventName": "int_store_inst",
+		"BriefDescription": "Integer store instruction count"
+	},
+	{
+		"EventCode": "0x50",
+		"EventName": "atomic_inst",
+		"BriefDescription": "Atomic instruction count"
+	},
+	{
+		"EventCode": "0x60",
+		"EventName": "sys_inst",
+		"BriefDescription": "System instruction count"
+	},
+	{
+		"EventCode": "0x70",
+		"EventName": "int_compute_inst",
+		"BriefDescription": "Integer computational instruction count"
+	},
+	{
+		"EventCode": "0x80",
+		"EventName": "condition_br",
+		"BriefDescription": "Conditional branch instruction count"
+	},
+	{
+		"EventCode": "0x90",
+		"EventName": "taken_condition_br",
+		"BriefDescription": "Taken conditional branch instruction count"
+	},
+	{
+		"EventCode": "0xA0",
+		"EventName": "jal_inst",
+		"BriefDescription": "JAL instruction count"
+	},
+	{
+		"EventCode": "0xB0",
+		"EventName": "jalr_inst",
+		"BriefDescription": "JALR instruction count"
+	},
+	{
+		"EventCode": "0xC0",
+		"EventName": "ret_inst",
+		"BriefDescription": "Return instruction count"
+	},
+	{
+		"EventCode": "0xD0",
+		"EventName": "control_trans_inst",
+		"BriefDescription": "Control transfer instruction count"
+	},
+	{
+		"EventCode": "0xE0",
+		"EventName": "ex9_inst",
+		"BriefDescription": "EXEC.IT instruction count"
+	},
+	{
+		"EventCode": "0xF0",
+		"EventName": "int_mul_inst",
+		"BriefDescription": "Integer multiplication instruction count"
+	},
+	{
+		"EventCode": "0x100",
+		"EventName": "int_div_rem_inst",
+		"BriefDescription": "Integer division/remainder instruction count"
+	},
+	{
+		"EventCode": "0x110",
+		"EventName": "float_load_inst",
+		"BriefDescription": "Floating-point load instruction count"
+	},
+	{
+		"EventCode": "0x120",
+		"EventName": "float_store_inst",
+		"BriefDescription": "Floating-point store instruction count"
+	},
+	{
+		"EventCode": "0x130",
+		"EventName": "float_add_sub_inst",
+		"BriefDescription": "Floating-point addition/subtraction instruction count"
+	},
+	{
+		"EventCode": "0x140",
+		"EventName": "float_mul_inst",
+		"BriefDescription": "Floating-point multiplication instruction count"
+	},
+	{
+		"EventCode": "0x150",
+		"EventName": "float_fused_muladd_inst",
+		"BriefDescription": "Floating-point fused multiply-add instruction count"
+	},
+	{
+		"EventCode": "0x160",
+		"EventName": "float_div_sqrt_inst",
+		"BriefDescription": "Floating-point division or square-root instruction count"
+	},
+	{
+		"EventCode": "0x170",
+		"EventName": "other_float_inst",
+		"BriefDescription": "Other floating-point instruction count"
+	},
+	{
+		"EventCode": "0x180",
+		"EventName": "int_mul_add_sub_inst",
+		"BriefDescription": "Integer multiplication and add/sub instruction count"
+	},
+	{
+		"EventCode": "0x190",
+		"EventName": "retired_ops",
+		"BriefDescription": "Retired operation count"
+	}
+]
diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
new file mode 100644
index 000000000000..c7401b526c77
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
@@ -0,0 +1,57 @@
+[
+	{
+		"EventCode": "0x01",
+		"EventName": "ilm_access",
+		"BriefDescription": "ILM access"
+	},
+	{
+		"EventCode": "0x11",
+		"EventName": "dlm_access",
+		"BriefDescription": "DLM access"
+	},
+	{
+		"EventCode": "0x21",
+		"EventName": "icache_access",
+		"BriefDescription": "ICACHE access"
+	},
+	{
+		"EventCode": "0x31",
+		"EventName": "icache_miss",
+		"BriefDescription": "ICACHE miss"
+	},
+	{
+		"EventCode": "0x41",
+		"EventName": "dcache_access",
+		"BriefDescription": "DCACHE access"
+	},
+	{
+		"EventCode": "0x51",
+		"EventName": "dcache_miss",
+		"BriefDescription": "DCACHE miss"
+	},
+	{
+		"EventCode": "0x61",
+		"EventName": "dcache_load_access",
+		"BriefDescription": "DCACHE load access"
+	},
+	{
+		"EventCode": "0x71",
+		"EventName": "dcache_load_miss",
+		"BriefDescription": "DCACHE load miss"
+	},
+	{
+		"EventCode": "0x81",
+		"EventName": "dcache_store_access",
+		"BriefDescription": "DCACHE store access"
+	},
+	{
+		"EventCode": "0x91",
+		"EventName": "dcache_store_miss",
+		"BriefDescription": "DCACHE store miss"
+	},
+	{
+		"EventCode": "0xA1",
+		"EventName": "dcache_wb",
+		"BriefDescription": "DCACHE writeback"
+	}
+]
diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json
new file mode 100644
index 000000000000..a6d378cbaa74
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json
@@ -0,0 +1,77 @@
+[
+	{
+		"EventCode": "0xB1",
+		"EventName": "cycle_wait_icache_fill",
+		"BriefDescription": "Cycles waiting for ICACHE fill data"
+	},
+	{
+		"EventCode": "0xC1",
+		"EventName": "cycle_wait_dcache_fill",
+		"BriefDescription": "Cycles waiting for DCACHE fill data"
+	},
+	{
+		"EventCode": "0xD1",
+		"EventName": "uncached_ifetch_from_bus",
+		"BriefDescription": "Uncached ifetch data access from bus"
+	},
+	{
+		"EventCode": "0xE1",
+		"EventName": "uncached_load_from_bus",
+		"BriefDescription": "Uncached load data access from bus"
+	},
+	{
+		"EventCode": "0xF1",
+		"EventName": "cycle_wait_uncached_ifetch",
+		"BriefDescription": "Cycles waiting for uncached ifetch data from bus"
+	},
+	{
+		"EventCode": "0x101",
+		"EventName": "cycle_wait_uncached_load",
+		"BriefDescription": "Cycles waiting for uncached load data from bus"
+	},
+	{
+		"EventCode": "0x111",
+		"EventName": "main_itlb_access",
+		"BriefDescription": "Main ITLB access"
+	},
+	{
+		"EventCode": "0x121",
+		"EventName": "main_itlb_miss",
+		"BriefDescription": "Main ITLB miss"
+	},
+	{
+		"EventCode": "0x131",
+		"EventName": "main_dtlb_access",
+		"BriefDescription": "Main DTLB access"
+	},
+	{
+		"EventCode": "0x141",
+		"EventName": "main_dtlb_miss",
+		"BriefDescription": "Main DTLB miss"
+	},
+	{
+		"EventCode": "0x151",
+		"EventName": "cycle_wait_itlb_fill",
+		"BriefDescription": "Cycles waiting for Main ITLB fill data"
+	},
+	{
+		"EventCode": "0x161",
+		"EventName": "pipe_stall_cycle_dtlb_miss",
+		"BriefDescription": "Pipeline stall cycles caused by Main DTLB miss"
+	},
+	{
+		"EventCode": "0x02",
+		"EventName": "mispredict_condition_br",
+		"BriefDescription": "Misprediction of conditional branches"
+	},
+	{
+		"EventCode": "0x12",
+		"EventName": "mispredict_take_condition_br",
+		"BriefDescription": "Misprediction of taken conditional branches"
+	},
+	{
+		"EventCode": "0x22",
+		"EventName": "mispredict_target_ret_inst",
+		"BriefDescription": "Misprediction of targets of Return instructions"
+	}
+]
diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index c61b3d6ef616..5bf09af14c1b 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -15,3 +15,4 @@
 #
 #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
+0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

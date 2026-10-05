Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A679CA5FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Sbzu4XXH/dulbjrqmTGCSR2M8i+8Q7lnszdCQQBX6k=; b=EfpmfDTi2zINmu
	HtOcfZj+c2FQ52rgCfXlkOChEiIMYgbqi+QU5NJ9Hki6gauKwuSkMYJ8qJTy7urRVzs2jrQ5KIrSZ
	JuMpVCaW8/hkf1DW091/eRyu2HzYzV7s/dNQz6sKW+0f2PwYNWG/F2vduPJYojf5kgQt79fTiPP3h
	1VSCSqA811XDLL98uFtRcaFaXf7LSqwkTUNNitvLkAYY46vctgAMGzhDrteXMrtdd3bl8WDnf11fP
	1CVFG3jNacM6MdVfWuPDOMmMLrA3B9gZ3SXL18czsVSIxRCiXF2g6HCG0Rrc0JQV+KbUv5Q5PrH4Y
	jY+yDQxQakpq2yN6FsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlN9-0000000GpL5-0E5T;
	Mon, 05 Oct 2026 16:17:03 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlN5-0000000GpKi-2l6R
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 16:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=justus-bergermann.de; s=s1-ionos; t=1791217006; x=1791821806;
	i=mail@justus-bergermann.de;
	bh=CsITrZyjiqvY6cgbknX8/hqfuJO7/QyGO3sp+x+4Fi0=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cIvaLTSmhjMbSqgjThoe3t/lt7Lw5uJOsldbiz7YqoyyQ4e+hFFUxtqAzfBmJR2f
	 YZLpSFnPQnw/cztckNkYSEq4vYgQ+i5AGphqhAio1O661iYMiUNsIbbHXgomeyoj/
	 NoNhrXVhep9IOuTe7Wgqx1rgXyQ7kfXh3yvZDtUGZfrOTmmxfqGOKoudP0+v04T/G
	 fwSuum4Y53IKuOWlqh4irlxkVVU32+zjAgVApCjKInKhEnj6aLRCd4iX5GMROM5al
	 X3gaamcd1Q73t/dpKXGgZ0rfNaS9JAtwK7pqfS8+oijNWZAOV3FkS9+BXew1rUo3Q
	 0qpNE6TRwIpZCcE/6Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue107
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1MTRhS-1x8DQn47lE-00NQOJ; Mon, 05
 Oct 2026 18:16:46 +0200
From: Justus Bergermann <mail@justus-bergermann.de>
Date: Mon, 05 Oct 2026 18:15:52 +0200
Subject: [PATCH] perf vendor events riscv: Add PMU events JSON file for
 T-Head C908
MIME-Version: 1.0
Message-Id: <20261005-c908-pmu-events-v1-1-cfab33201c59@justus-bergermann.de>
X-B4-Tracking: v=1; b=H4sIADfNw2oC/yXMTQqEMAxA4atI1hNoK/7UqwwunBo1glUalQHx7
 lZdfov3DhAKTAJVckCgnYVnH6E/Cbih8T0ht9FglMm1Uhk6q0pcpg1pJ78KZtZo2xVt6koDsVo
 Cdfx/jt/6tWy/kdx6b+A8L6gPQKxzAAAA
X-Change-ID: 20261005-c908-pmu-events-59219f7d3c82
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Justus Bergermann <justus.bergermann@mpi-sp.org>, 
 Justus Bergermann <mail@justus-bergermann.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791217003; l=26328;
 i=mail@justus-bergermann.de; s=20261005; h=from:subject:message-id;
 bh=PwZr5qlQYWGngpAqe8ibKGge2oaK0EWe9ZtnY14PLkE=;
 b=maiIl1WgYSVsXrnkbohqKBQGrtme6ZCw6UM0oazqd7Z4n179vI+UdoOrup0PGkXLFK373pHhK
 X9etQK/nSZDCFF0aJJ7fXg7NIIRpyiHyYoPi6EC1uR+DuKX96urZDLk
X-Developer-Key: i=mail@justus-bergermann.de; a=ed25519;
 pk=lSU6MMoEK602rjbVE7OO5q4vESv+gR/awWo2p3i6dWw=
X-Provags-ID: V03:K1:lyBc/VplGk5/U0YiCH1hseeiswWEJgCreJHWR0lTNYjIL9Dhf9f
 9QnnJNeyTmDGZcGm57eC7fV+ax7L+5ys0cmPabf3OwhuUsKIZBhpUlVDUn97kEpTtGCsvLL
 9vjRXo+f7h8QVAvPAf94Owl/dAAx5cuFb44MoUDdJX/3xkxR4U8Rr7HnJNTRNVgqOb67GRI
 ccHvmZIt9GXE7cqHRKfUw==
UI-OutboundReport: notjunk:1;M01:P0:uWHX/lA54Zo=;8J8yQANjZJ48+Q3WTB+lZXL3+QU
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_091700_318695_962DA325 
X-CRM114-Status: GOOD (  10.41  )
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

The XuanTie C908 cannot use the existing thead/c900-legacy event file:
The c900-legacy mapfile entry is 0x5b7-0x0-0x0, which works because the
c906 and c910 leave marchid and mimpid unimplemented, so both read
as zero. The C908 implements them: a Kendryte K230 with the c908 reports
mvendorid 0x5b7, marchid 0x8000000009140d00 and mimpid 0x50000. No entry
matches, so perf currently resolves no vendor event names at all on this
core.

Add a thead/c908 directory describing the 165 raw events defined in
Table 14.6 of the XuanTie C908 user manual, codes 0x01 to 0xb4, and a
mapfile entry for the core.

Signed-off-by: Justus Bergermann <mail@justus-bergermann.de>
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv       |   1 +
 .../pmu-events/arch/riscv/thead/c908/cache.json    | 127 +++++
 .../pmu-events/arch/riscv/thead/c908/firmware.json |  68 +++
 .../arch/riscv/thead/c908/instruction.json         | 192 ++++++++
 .../arch/riscv/thead/c908/microarch.json           | 512 +++++++++++++++++++++
 5 files changed, 900 insertions(+)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 87cfb0e0849f..51d0438b9cc8 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -21,6 +21,7 @@
 0x489-0x8000000000000[1-6]08-0x[9b][[:xdigit:]]+,v1,sifive/p650,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x5b7-0x80000000090c0d00-0x2047000,v1,thead/c900-legacy,core
+0x5b7-0x8000000009140d00-0x[[:xdigit:]]+,v1,thead/c908,core
 0x602-0x3-0x0,v1,openhwgroup/cva6,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
diff --git a/tools/perf/pmu-events/arch/riscv/thead/c908/cache.json b/tools/perf/pmu-events/arch/riscv/thead/c908/cache.json
new file mode 100644
index 000000000000..052c771fbdea
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/thead/c908/cache.json
@@ -0,0 +1,127 @@
+[
+  {
+    "EventName": "L1_ICACHE_ACCESS",
+    "EventCode": "0x00000001",
+    "BriefDescription": "L1-icache Access"
+  },
+  {
+    "EventName": "L1_ICACHE_MISS",
+    "EventCode": "0x00000002",
+    "BriefDescription": "L1-icache Miss"
+  },
+  {
+    "EventName": "ITLB_MISS",
+    "EventCode": "0x00000003",
+    "BriefDescription": "iTLB Miss"
+  },
+  {
+    "EventName": "JTLB_MISS",
+    "EventCode": "0x00000005",
+    "BriefDescription": "jTLB Miss"
+  },
+  {
+    "EventName": "L1_DCACHE_READ_ACCESS",
+    "EventCode": "0x0000000c",
+    "BriefDescription": "L1-dcache load access"
+  },
+  {
+    "EventName": "L1_DCACHE_READ_MISS",
+    "EventCode": "0x0000000d",
+    "BriefDescription": "L1-dcache load miss"
+  },
+  {
+    "EventName": "L1_DCACHE_WRITE_ACCESS",
+    "EventCode": "0x0000000e",
+    "BriefDescription": "L1-dcache store access"
+  },
+  {
+    "EventName": "L1_DCACHE_WRITE_MISS",
+    "EventCode": "0x0000000f",
+    "BriefDescription": "L1-dcache store miss"
+  },
+  {
+    "EventName": "IF_REFILL_STALL",
+    "EventCode": "0x00000051",
+    "BriefDescription": "IF Refill Stall"
+  },
+  {
+    "EventName": "L1_DCACHE_ACCESS",
+    "EventCode": "0x0000009b",
+    "BriefDescription": "L1 Dcache Access"
+  },
+  {
+    "EventName": "L1_DCACHE_MISS",
+    "EventCode": "0x0000009c",
+    "BriefDescription": "L1 Dcache Miss"
+  },
+  {
+    "EventName": "L1_DCACHE_EXCLUSIVE_EVICTION",
+    "EventCode": "0x0000009d",
+    "BriefDescription": "L1 Dcache Exclusive Eviction"
+  },
+  {
+    "EventName": "ICACHE_PREFETCH",
+    "EventCode": "0x0000009e",
+    "BriefDescription": "Icache Prefetch"
+  },
+  {
+    "EventName": "DCACHE_AMR_ACTIVE",
+    "EventCode": "0x0000009f",
+    "BriefDescription": "Dcache Amr Active"
+  },
+  {
+    "EventName": "ICACHE_PREFETCH_MISS",
+    "EventCode": "0x000000a0",
+    "BriefDescription": "Icache Prefetch Miss"
+  },
+  {
+    "EventName": "DCACHE_REFILL_CAUSED_BY_PREFETCH",
+    "EventCode": "0x000000a1",
+    "BriefDescription": "Dcache Refill Caused by Prefetch"
+  },
+  {
+    "EventName": "DCACHE_HIT_CAUSED_BY_PREFETCH",
+    "EventCode": "0x000000a2",
+    "BriefDescription": "Dcache Hit Caused by Prefetch"
+  },
+  {
+    "EventName": "STORE_DTLB_MISS",
+    "EventCode": "0x000000a3",
+    "BriefDescription": "Store Dtlb Miss"
+  },
+  {
+    "EventName": "LOAD_DTLB_MISS",
+    "EventCode": "0x000000a4",
+    "BriefDescription": "Load Dtlb Miss"
+  },
+  {
+    "EventName": "L2_ACCESS",
+    "EventCode": "0x000000a5",
+    "BriefDescription": "L2 Access"
+  },
+  {
+    "EventName": "L2_MISS",
+    "EventCode": "0x000000a6",
+    "BriefDescription": "L2 Miss"
+  },
+  {
+    "EventName": "SNB_READ_CREATE_VLD",
+    "EventCode": "0x000000a7",
+    "BriefDescription": "Snb Read Create Vld"
+  },
+  {
+    "EventName": "SNB_READ_CREATE_STALL",
+    "EventCode": "0x000000a8",
+    "BriefDescription": "Snb Read Create Stall"
+  },
+  {
+    "EventName": "SNB_WRITE_CREATE_VLD",
+    "EventCode": "0x000000a9",
+    "BriefDescription": "Snb Write Create Vld"
+  },
+  {
+    "EventName": "SNB_WRITE_CREATE_STALL",
+    "EventCode": "0x000000aa",
+    "BriefDescription": "Snb Write Create Stall"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/thead/c908/firmware.json b/tools/perf/pmu-events/arch/riscv/thead/c908/firmware.json
new file mode 100644
index 000000000000..7149caec4f80
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/thead/c908/firmware.json
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
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
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
diff --git a/tools/perf/pmu-events/arch/riscv/thead/c908/instruction.json b/tools/perf/pmu-events/arch/riscv/thead/c908/instruction.json
new file mode 100644
index 000000000000..401544f1d15e
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/thead/c908/instruction.json
@@ -0,0 +1,192 @@
+[
+  {
+    "EventName": "CONDITION_BRANCH_MISPRED",
+    "EventCode": "0x00000006",
+    "BriefDescription": "Condition Branch Mispred"
+  },
+  {
+    "EventName": "CONDITION_BRANCH",
+    "EventCode": "0x00000007",
+    "BriefDescription": "Condition Branch"
+  },
+  {
+    "EventName": "INDIRECT_BRANCH_MISS",
+    "EventCode": "0x00000008",
+    "BriefDescription": "Indirect Branch Miss"
+  },
+  {
+    "EventName": "INDIRECT_BRANCH",
+    "EventCode": "0x00000009",
+    "BriefDescription": "Indirect Branch"
+  },
+  {
+    "EventName": "INST_STORE",
+    "EventCode": "0x0000000b",
+    "BriefDescription": "Store Instruction"
+  },
+  {
+    "EventName": "ISSUE_INSTRUCTION",
+    "EventCode": "0x00000016",
+    "BriefDescription": "Issue Instruction"
+  },
+  {
+    "EventName": "INST_ALU",
+    "EventCode": "0x0000001d",
+    "BriefDescription": "ALU Instruction"
+  },
+  {
+    "EventName": "INST_VECTOR",
+    "EventCode": "0x0000001f",
+    "BriefDescription": "Vector SIMD Instruction"
+  },
+  {
+    "EventName": "INST_CSR",
+    "EventCode": "0x00000020",
+    "BriefDescription": "CSR Instruction"
+  },
+  {
+    "EventName": "ATOMIC_INSTRUCTION",
+    "EventCode": "0x00000021",
+    "BriefDescription": "ATOMIC Instruction"
+  },
+  {
+    "EventName": "INST_ECALL",
+    "EventCode": "0x00000025",
+    "BriefDescription": "Environment Call"
+  },
+  {
+    "EventName": "INST_LONG_JP",
+    "EventCode": "0x00000026",
+    "BriefDescription": "Long Jump"
+  },
+  {
+    "EventName": "INST_FP",
+    "EventCode": "0x0000002a",
+    "BriefDescription": "Float Point Instruction"
+  },
+  {
+    "EventName": "LOAD_INSTRUCTION",
+    "EventCode": "0x00000030",
+    "BriefDescription": "LOAD Instruction"
+  },
+  {
+    "EventName": "FUSED_INSTRUCTION",
+    "EventCode": "0x00000031",
+    "BriefDescription": "Fused Instruction"
+  },
+  {
+    "EventName": "MULT_INSTRUCTION",
+    "EventCode": "0x00000032",
+    "BriefDescription": "MULT Instruction"
+  },
+  {
+    "EventName": "DIV_INSTRUCTION",
+    "EventCode": "0x00000033",
+    "BriefDescription": "DIV Instruction"
+  },
+  {
+    "EventName": "BRANCH_INSTRUCTION",
+    "EventCode": "0x00000036",
+    "BriefDescription": "Branch Instruction"
+  },
+  {
+    "EventName": "UNCONDITION_BRANCH",
+    "EventCode": "0x00000037",
+    "BriefDescription": "Uncondition Branch"
+  },
+  {
+    "EventName": "BRANCH_MISPRED",
+    "EventCode": "0x00000038",
+    "BriefDescription": "Branch Mispred"
+  },
+  {
+    "EventName": "UNCONDITION_BRANCH_MISPRED",
+    "EventCode": "0x00000039",
+    "BriefDescription": "Uncondition Branch Mispred"
+  },
+  {
+    "EventName": "TAKEN_BRANCH_MISPRED",
+    "EventCode": "0x0000003a",
+    "BriefDescription": "Taken Branch Mispred"
+  },
+  {
+    "EventName": "TAKEN_CONDITION_BRANCH",
+    "EventCode": "0x0000003b",
+    "BriefDescription": "Taken Condition Branch"
+  },
+  {
+    "EventName": "TAKEN_CONDITION_BRANCH_MISPRED",
+    "EventCode": "0x0000003c",
+    "BriefDescription": "Taken Condition Branch Mispred"
+  },
+  {
+    "EventName": "UNALIGN_LOAD_INSTRUCTION",
+    "EventCode": "0x0000003d",
+    "BriefDescription": "Unalign LOAD Instruction"
+  },
+  {
+    "EventName": "UNALIGN_STORE_INSTRUCTION",
+    "EventCode": "0x0000003e",
+    "BriefDescription": "Unalign STORE Instruction"
+  },
+  {
+    "EventName": "LR_INSTRUCTION",
+    "EventCode": "0x0000003f",
+    "BriefDescription": "LR Instruction"
+  },
+  {
+    "EventName": "SC_INSTRUCTION",
+    "EventCode": "0x00000040",
+    "BriefDescription": "SC Instruction"
+  },
+  {
+    "EventName": "AMO_INSTRUCTION",
+    "EventCode": "0x00000041",
+    "BriefDescription": "AMO Instruction"
+  },
+  {
+    "EventName": "BARRIER_INSTRUCTION",
+    "EventCode": "0x00000042",
+    "BriefDescription": "Barrier Instruction"
+  },
+  {
+    "EventName": "FAILED_SC_INSTRUCTION",
+    "EventCode": "0x00000043",
+    "BriefDescription": "Failed SC Instruction"
+  },
+  {
+    "EventName": "FP_DIV_INSTRUCTION",
+    "EventCode": "0x00000045",
+    "BriefDescription": "FP DIV Instruction"
+  },
+  {
+    "EventName": "FP_LOAD_INSTRUCTION",
+    "EventCode": "0x00000046",
+    "BriefDescription": "FP LOAD Instruction"
+  },
+  {
+    "EventName": "FP_STORE_INSTRUCTION",
+    "EventCode": "0x00000047",
+    "BriefDescription": "FP STORE Instruction"
+  },
+  {
+    "EventName": "VECTOR_DIV_INSTRUCTION",
+    "EventCode": "0x00000048",
+    "BriefDescription": "Vector DIV Instruction"
+  },
+  {
+    "EventName": "VECTOR_LOAD_INSTRUCTION",
+    "EventCode": "0x00000049",
+    "BriefDescription": "Vector LOAD Instruction"
+  },
+  {
+    "EventName": "VECTOR_STORE_INSTRUCTION",
+    "EventCode": "0x0000004a",
+    "BriefDescription": "Vector STORE Instruction"
+  },
+  {
+    "EventName": "VECTOR_MICRO_OP",
+    "EventCode": "0x0000004b",
+    "BriefDescription": "Vector Micro Op"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/thead/c908/microarch.json b/tools/perf/pmu-events/arch/riscv/thead/c908/microarch.json
new file mode 100644
index 000000000000..35d344e1f8f1
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/thead/c908/microarch.json
@@ -0,0 +1,512 @@
+[
+  {
+    "EventName": "IFU_BRANCH_TARGET_MISPRED",
+    "EventCode": "0x0000001b",
+    "BriefDescription": "IFU Branch Target Mispred"
+  },
+  {
+    "EventName": "IFU_BRANCH_TARGET_INSTRUCTION",
+    "EventCode": "0x0000001c",
+    "BriefDescription": "IFU Branch Target Instruction"
+  },
+  {
+    "EventName": "INTERRUPT_NUMBER",
+    "EventCode": "0x00000023",
+    "BriefDescription": "Interrupt Number"
+  },
+  {
+    "EventName": "IFU_STALLED_CYCLE",
+    "EventCode": "0x00000027",
+    "BriefDescription": "Stalled Cycles Frontend"
+  },
+  {
+    "EventName": "IDU_STALLED_CYCLE",
+    "EventCode": "0x00000028",
+    "BriefDescription": "Stalled Cycles Backend"
+  },
+  {
+    "EventName": "SYNC_STALL",
+    "EventCode": "0x00000029",
+    "BriefDescription": "SYNC Stall"
+  },
+  {
+    "EventName": "M_MODE_CYCLES",
+    "EventCode": "0x0000002b",
+    "BriefDescription": "M Mode Cycles"
+  },
+  {
+    "EventName": "S_MODE_CYCLES",
+    "EventCode": "0x0000002c",
+    "BriefDescription": "S Mode Cycles"
+  },
+  {
+    "EventName": "U_MODE_CYCLES",
+    "EventCode": "0x0000002d",
+    "BriefDescription": "U Mode Cycles"
+  },
+  {
+    "EventName": "EXCEPTION_NUMBER",
+    "EventCode": "0x0000002e",
+    "BriefDescription": "Exception Number"
+  },
+  {
+    "EventName": "FLUSH_NUMBER",
+    "EventCode": "0x0000002f",
+    "BriefDescription": "Flush Number"
+  },
+  {
+    "EventName": "MULT_INNER_FORWARD",
+    "EventCode": "0x00000034",
+    "BriefDescription": "Mult Inner Forward"
+  },
+  {
+    "EventName": "DIV_BUFFER_HIT",
+    "EventCode": "0x00000035",
+    "BriefDescription": "DIV Buffer Hit"
+  },
+  {
+    "EventName": "BUS_BARRIER",
+    "EventCode": "0x00000044",
+    "BriefDescription": "Bus Barrier"
+  },
+  {
+    "EventName": "ECC_INTERRUPT",
+    "EventCode": "0x0000004c",
+    "BriefDescription": "ECC Interrupt"
+  },
+  {
+    "EventName": "ASYNC_ABORT_INTERRUPT",
+    "EventCode": "0x0000004d",
+    "BriefDescription": "Async Abort Interrupt"
+  },
+  {
+    "EventName": "IF_STALL",
+    "EventCode": "0x0000004e",
+    "BriefDescription": "IF Stall"
+  },
+  {
+    "EventName": "IP_STALL",
+    "EventCode": "0x0000004f",
+    "BriefDescription": "IP Stall"
+  },
+  {
+    "EventName": "IB_STALL",
+    "EventCode": "0x00000050",
+    "BriefDescription": "IB Stall"
+  },
+  {
+    "EventName": "IF_MMU_STALL",
+    "EventCode": "0x00000052",
+    "BriefDescription": "IF Mmu Stall"
+  },
+  {
+    "EventName": "IB_MISPRED_STALL",
+    "EventCode": "0x00000053",
+    "BriefDescription": "IB Mispred Stall"
+  },
+  {
+    "EventName": "IB_FIFO_STALL",
+    "EventCode": "0x00000054",
+    "BriefDescription": "IB Fifo Stall"
+  },
+  {
+    "EventName": "IB_IND_BTB_RD_STALL",
+    "EventCode": "0x00000055",
+    "BriefDescription": "IB Ind Btb Rd Stall"
+  },
+  {
+    "EventName": "IB_VSETVL_STALL",
+    "EventCode": "0x00000056",
+    "BriefDescription": "IB Vsetvl Stall"
+  },
+  {
+    "EventName": "ID_STALL",
+    "EventCode": "0x00000057",
+    "BriefDescription": "ID Stall"
+  },
+  {
+    "EventName": "RF_STALL",
+    "EventCode": "0x00000058",
+    "BriefDescription": "RF Stall"
+  },
+  {
+    "EventName": "EU_STALL",
+    "EventCode": "0x00000059",
+    "BriefDescription": "EU Stall"
+  },
+  {
+    "EventName": "ID_INST_PIPEDOWN",
+    "EventCode": "0x0000005a",
+    "BriefDescription": "ID Inst Pipedown"
+  },
+  {
+    "EventName": "RF_INST_PIPEDOWN",
+    "EventCode": "0x0000005b",
+    "BriefDescription": "RF Inst Pipedown"
+  },
+  {
+    "EventName": "ID_ONE_INST_PIPEDOWN",
+    "EventCode": "0x0000005c",
+    "BriefDescription": "ID One Inst Pipedown"
+  },
+  {
+    "EventName": "ID_CSR_BEFORE_FENCE_STALL",
+    "EventCode": "0x0000005d",
+    "BriefDescription": "ID CSR Before Fence Stall"
+  },
+  {
+    "EventName": "ID_VSETVL_FOF_STALL",
+    "EventCode": "0x0000005e",
+    "BriefDescription": "ID VSETVL Fof Stall"
+  },
+  {
+    "EventName": "ID_FLUSH_STALL",
+    "EventCode": "0x0000005f",
+    "BriefDescription": "ID Flush Stall"
+  },
+  {
+    "EventName": "ID_MISPREDICTION_STALL",
+    "EventCode": "0x00000060",
+    "BriefDescription": "ID Misprediction Stall"
+  },
+  {
+    "EventName": "ID_IID_NOT_VLD_STALL",
+    "EventCode": "0x00000061",
+    "BriefDescription": "ID IID Not Vld Stall"
+  },
+  {
+    "EventName": "RF_ONE_INST_PIPEDOWN",
+    "EventCode": "0x00000062",
+    "BriefDescription": "RF One Inst Pipedown"
+  },
+  {
+    "EventName": "RF_RAW_STALL",
+    "EventCode": "0x00000063",
+    "BriefDescription": "RF RAW Stall"
+  },
+  {
+    "EventName": "RF_WAW_STALL",
+    "EventCode": "0x00000064",
+    "BriefDescription": "RF WAW Stall"
+  },
+  {
+    "EventName": "RF_STRUCTURE_STALL",
+    "EventCode": "0x00000065",
+    "BriefDescription": "RF Structure Stall"
+  },
+  {
+    "EventName": "RF_CSR_AFTER_FENCE_STALL",
+    "EventCode": "0x00000066",
+    "BriefDescription": "RF CSR After Fence Stall"
+  },
+  {
+    "EventName": "EU_IU_FULL",
+    "EventCode": "0x00000067",
+    "BriefDescription": "EU IU Full"
+  },
+  {
+    "EventName": "EU_IU_CONTROL_FULL",
+    "EventCode": "0x00000068",
+    "BriefDescription": "EU IU Control Full"
+  },
+  {
+    "EventName": "EU_CP0_FULL",
+    "EventCode": "0x00000069",
+    "BriefDescription": "EU CP0 Full"
+  },
+  {
+    "EventName": "EU_LSU_LOAD_FULL",
+    "EventCode": "0x0000006a",
+    "BriefDescription": "EU LSU LOAD Full"
+  },
+  {
+    "EventName": "EU_LSU_STORE_FULL",
+    "EventCode": "0x0000006b",
+    "BriefDescription": "EU LSU STORE Full"
+  },
+  {
+    "EventName": "EU_VFPU_FULL",
+    "EventCode": "0x0000006c",
+    "BriefDescription": "EU VFPU Full"
+  },
+  {
+    "EventName": "EU_BJU_FULL",
+    "EventCode": "0x0000006d",
+    "BriefDescription": "EU BJU Full"
+  },
+  {
+    "EventName": "IU_DP_STALL_PIPE0",
+    "EventCode": "0x0000006e",
+    "BriefDescription": "IU Dp Stall Pipe0"
+  },
+  {
+    "EventName": "IU_MULT_STALL_PIPE0",
+    "EventCode": "0x0000006f",
+    "BriefDescription": "IU MULT Stall Pipe0"
+  },
+  {
+    "EventName": "IU_DIV_EX1_STALL_PIPE0",
+    "EventCode": "0x00000070",
+    "BriefDescription": "IU DIV EX1 Stall Pipe0"
+  },
+  {
+    "EventName": "IU_DP_STALL_PIPE1",
+    "EventCode": "0x00000071",
+    "BriefDescription": "IU Dp Stall Pipe1"
+  },
+  {
+    "EventName": "IU_MULT_STALL_PIPE1",
+    "EventCode": "0x00000072",
+    "BriefDescription": "IU MULT Stall Pipe1"
+  },
+  {
+    "EventName": "IU_DIV_EX1_STALL_PIPE1",
+    "EventCode": "0x00000073",
+    "BriefDescription": "IU DIV EX1 Stall Pipe1"
+  },
+  {
+    "EventName": "IU_DP_WB_CONFLICT_PIPE0",
+    "EventCode": "0x00000074",
+    "BriefDescription": "IU DP Wb Conflict Pipe0"
+  },
+  {
+    "EventName": "IU_DP_WAW_STALL_PIPE0",
+    "EventCode": "0x00000075",
+    "BriefDescription": "IU DP WAW Stall Pipe0"
+  },
+  {
+    "EventName": "IU_DP_UNCOMMIT_PIPE0",
+    "EventCode": "0x00000076",
+    "BriefDescription": "IU DP Uncommit Pipe0"
+  },
+  {
+    "EventName": "IU_DP_WB_CONFLICT_PIPE1",
+    "EventCode": "0x00000077",
+    "BriefDescription": "IU DP Wb Conflict Pipe1"
+  },
+  {
+    "EventName": "IU_DP_WAW_STALL_PIPE1",
+    "EventCode": "0x00000078",
+    "BriefDescription": "IU DP WAW Stall Pipe1"
+  },
+  {
+    "EventName": "IU_DP_UNCOMMIT_PIPE1",
+    "EventCode": "0x00000079",
+    "BriefDescription": "IU DP Uncommit Pipe1"
+  },
+  {
+    "EventName": "IU_MULT_UNCOMMIT",
+    "EventCode": "0x0000007a",
+    "BriefDescription": "IU MULT Uncommit"
+  },
+  {
+    "EventName": "IU_MULT_WB_STALL",
+    "EventCode": "0x0000007b",
+    "BriefDescription": "IU MULT Wb Stall"
+  },
+  {
+    "EventName": "IU_DIV_UNCOMMIT",
+    "EventCode": "0x0000007c",
+    "BriefDescription": "IU DIV Uncommit"
+  },
+  {
+    "EventName": "IU_DIV_WB_STALL",
+    "EventCode": "0x0000007d",
+    "BriefDescription": "IU DIV Wb Stall"
+  },
+  {
+    "EventName": "LSU_LOAD_WAW_STALL",
+    "EventCode": "0x0000007e",
+    "BriefDescription": "LSU LOAD WAW Stall"
+  },
+  {
+    "EventName": "LSU_LOAD_COMMIT_STALL",
+    "EventCode": "0x0000007f",
+    "BriefDescription": "LSU LOAD Commit Stall"
+  },
+  {
+    "EventName": "LSU_LOAD_RAW_STALL",
+    "EventCode": "0x00000080",
+    "BriefDescription": "LSU LOAD RAW Stall"
+  },
+  {
+    "EventName": "LSU_STORE_COMMIT_STALL",
+    "EventCode": "0x00000081",
+    "BriefDescription": "LSU STORE Commit Stall"
+  },
+  {
+    "EventName": "VIDU_RF_NO_PIPEDOWN",
+    "EventCode": "0x00000082",
+    "BriefDescription": "Vidu Rf No Pipedown"
+  },
+  {
+    "EventName": "VPU_STALL_PIPE0",
+    "EventCode": "0x00000083",
+    "BriefDescription": "VPU Stall Pipe0"
+  },
+  {
+    "EventName": "VPU_STALL_PIPE1",
+    "EventCode": "0x00000084",
+    "BriefDescription": "VPU Stall Pipe1"
+  },
+  {
+    "EventName": "VPU_STRUCT_HAZARD_STALL_PIPE0",
+    "EventCode": "0x00000085",
+    "BriefDescription": "VPU Struct Hazard Stall Pipe0"
+  },
+  {
+    "EventName": "VPU_UNCOMMIT_STALL_PIPE0",
+    "EventCode": "0x00000086",
+    "BriefDescription": "VPU Uncommit Stall Pipe0"
+  },
+  {
+    "EventName": "VPU_VLSU_STALL_PIPE0",
+    "EventCode": "0x00000087",
+    "BriefDescription": "VPU VLSU Stall Pipe0"
+  },
+  {
+    "EventName": "VPU_STRUCT_HAZARD_STALL_PIPE1",
+    "EventCode": "0x00000088",
+    "BriefDescription": "VPU Struct Hazard Stall Pipe1"
+  },
+  {
+    "EventName": "VPU_UNCOMMIT_STALL_PIPE1",
+    "EventCode": "0x00000089",
+    "BriefDescription": "VPU Uncommit Stall Pipe1"
+  },
+  {
+    "EventName": "VPU_VLSU_STALL_PIPE1",
+    "EventCode": "0x0000008a",
+    "BriefDescription": "VPU VLSU Stall Pipe1"
+  },
+  {
+    "EventName": "VFPU_FDIV_VDIV_BUSY",
+    "EventCode": "0x0000008b",
+    "BriefDescription": "VFPU FDIV/VDIV Busy"
+  },
+  {
+    "EventName": "BJU_CP0_STALL",
+    "EventCode": "0x0000008c",
+    "BriefDescription": "BJU CP0 Stall"
+  },
+  {
+    "EventName": "BJU_IBUF_STALL",
+    "EventCode": "0x0000008d",
+    "BriefDescription": "BJU IBUF Stall"
+  },
+  {
+    "EventName": "BJU_WB_STALL",
+    "EventCode": "0x0000008e",
+    "BriefDescription": "BJU Wb Stall"
+  },
+  {
+    "EventName": "BJU_PIPEDOWN_STALL",
+    "EventCode": "0x0000008f",
+    "BriefDescription": "BJU Pipedown Stall"
+  },
+  {
+    "EventName": "RTU_FLUSH",
+    "EventCode": "0x00000090",
+    "BriefDescription": "RTU Flush"
+  },
+  {
+    "EventName": "RTU_IU_NOT_NO_OP",
+    "EventCode": "0x00000091",
+    "BriefDescription": "RTU IU Not No OP"
+  },
+  {
+    "EventName": "RTU_BJU_NOT_NO_OP",
+    "EventCode": "0x00000092",
+    "BriefDescription": "RTU BJU Not No OP"
+  },
+  {
+    "EventName": "RTU_LSU_NOT_NO_OP",
+    "EventCode": "0x00000093",
+    "BriefDescription": "RTU LSU Not No OP"
+  },
+  {
+    "EventName": "RTU_CP0_NOT_NO_OP",
+    "EventCode": "0x00000094",
+    "BriefDescription": "RTU CP0 Not No OP"
+  },
+  {
+    "EventName": "RTU_VFPU_NOT_NO_OP",
+    "EventCode": "0x00000095",
+    "BriefDescription": "RTU VFPU Not No OP"
+  },
+  {
+    "EventName": "RTU_ONLY_IU_NOT_NO_OP",
+    "EventCode": "0x00000096",
+    "BriefDescription": "RTU Only IU Not No OP"
+  },
+  {
+    "EventName": "RTU_ONLY_BJU_NOT_NO_OP",
+    "EventCode": "0x00000097",
+    "BriefDescription": "RTU Only BJU Not No OP"
+  },
+  {
+    "EventName": "RTU_ONLY_LSU_NOT_NO_OP",
+    "EventCode": "0x00000098",
+    "BriefDescription": "RTU Only LSU Not No OP"
+  },
+  {
+    "EventName": "RTU_ONLY_CP0_NOT_NO_OP",
+    "EventCode": "0x00000099",
+    "BriefDescription": "RTU Only CP0 Not No OP"
+  },
+  {
+    "EventName": "RTU_ONLY_VFPU_NOT_NO_OP",
+    "EventCode": "0x0000009a",
+    "BriefDescription": "RTU Only VFPU Not No OP"
+  },
+  {
+    "EventName": "IQ_FULL",
+    "EventCode": "0x000000ab",
+    "BriefDescription": "Iq Full"
+  },
+  {
+    "EventName": "VIDU_VEC0_STALL",
+    "EventCode": "0x000000ac",
+    "BriefDescription": "Vidu Vec0 Stall"
+  },
+  {
+    "EventName": "VIDU_VEC1_STALL",
+    "EventCode": "0x000000ad",
+    "BriefDescription": "Vidu Vec1 Stall"
+  },
+  {
+    "EventName": "VIDU_VEC0_DEPEND_STALL",
+    "EventCode": "0x000000ae",
+    "BriefDescription": "Vidu Vec0 Depend Stall"
+  },
+  {
+    "EventName": "VIDU_VEC0_STRUCT_HAZARD_STALL",
+    "EventCode": "0x000000af",
+    "BriefDescription": "Vidu Vec0 Struct Hazard Stall"
+  },
+  {
+    "EventName": "VIDU_VEC1_DEPEND_STALL",
+    "EventCode": "0x000000b0",
+    "BriefDescription": "Vidu Vec1 Depend Stall"
+  },
+  {
+    "EventName": "VIDU_VEC1_STRUCT_HAZARD_STALL",
+    "EventCode": "0x000000b1",
+    "BriefDescription": "Vidu Vec1 Struct Hazard Stall"
+  },
+  {
+    "EventName": "VIDU_TOTAL_CYCLE",
+    "EventCode": "0x000000b2",
+    "BriefDescription": "Vidu Total Cycle"
+  },
+  {
+    "EventName": "VIDU_VEC0_CYCLE",
+    "EventCode": "0x000000b3",
+    "BriefDescription": "Vidu Vec0 Cycle"
+  },
+  {
+    "EventName": "VIDU_VEC1_CYCLE",
+    "EventCode": "0x000000b4",
+    "BriefDescription": "Vidu Vec1 Cycle"
+  }
+]

---
base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
change-id: 20261005-c908-pmu-events-59219f7d3c82

Best regards,
--  
Justus Bergermann <mail@justus-bergermann.de>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

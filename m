Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+vH6wl0CzdfeGdkhlueiPRi3oraRyU35uKFVZMvwhoo=; b=DNrktM7QSJ/Dzc
	T/ZSEoILYN7Oi4O/38Qg3repa4x5T9EohKVv5/RUx0WMOSeN5OrLOC0G5sd7bm88sHDx8B6bpptMy
	5kiAUgoI89aa6RUEnomDLKT4jEc+D+gtizQmQ5stBXOtSyIZQNwquqSQFCEOrhjNNbGFaDiHMCqsI
	CCtaitfTVo6w/Gfvhcvk4kFfeux3TsExiQpaL7+enpX2cFRLRNcxBce9NbxadM6DowrITC29BXbYG
	5PTxG67ETisPmwzhm/AfcPpjlQnnHuv2Tdj7GdPD3cW/hIsNfxxW965Q1EpDNzbIvrqMMMFNkeyy2
	Lq4FgGjF6XjL35DHEtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyMwi-008VWs-2A;
	Thu, 02 Nov 2023 01:56:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyMwZ-008VSu-1r
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 01:56:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 618E924E281;
	Thu,  2 Nov 2023 09:55:33 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Nov
 2023 09:55:33 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Nov
 2023 09:55:24 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Namhyung
 Kim" <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Nikita
 Shubin" <n.shubin@yadro.com>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] perf vendor events riscv: add StarFive Dubhe-80 JSON file
Date: Thu, 2 Nov 2023 09:54:47 +0800
Message-ID: <20231102015447.2526572-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_185624_069513_21BD6F52 
X-CRM114-Status: GOOD (  13.09  )
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

StarFive's Dubhe-80 supports raw event id 0x00 - 0x22.
The raw events are enabled through PMU node of DT binding.

Example of PMU DT node:
pmu {
	compatible = "riscv,pmu";
	riscv,raw-event-to-mhpmcounters =
		/* Event ID 1-31 */
		<0x00 0x00 0xFFFFFFFF 0xFFFFFFE0 0x00007FF8>,
		/* Event ID 32-33 */
		<0x00 0x20 0xFFFFFFFF 0xFFFFFFFE 0x00007FF8>,
		/* Event ID 34 */
		<0x00 0x22 0xFFFFFFFF 0xFFFFFF22 0x00007FF8>;
};

Example of Perf stat output:
[root@user]# perf stat -a \
	-e access_mmu_stlb \
	-e miss_mmu_stlb \
	-e access_mmu_pte_c \
	-e rob_flush \
	-e btb_prediction_miss \
	-e itlb_miss \
	-e sync_del_fetch_g \
	-e icache_miss \
	-e bpu_br_retire \
	-e bpu_br_miss \
	-e ret_ins_retire \
	-e ret_ins_miss \
	-- openssl speed rsa2048

Doing 2048 bits private rsa's for 10s: 39 2048 bits private RSA's in
10.14s
Doing 2048 bits public rsa's for 10s: 1563 2048 bits public RSA's in
10.00s
version: 3.0.11
built on: Tue Sep 19 13:02:31 2023 UTC
options: bn(64,64)
CPUINFO: N/A
                  sign    verify    sign/s verify/s
rsa 2048 bits 0.260000s 0.006398s      3.8    156.3

 Performance counter stats for 'system wide':

           1338350      access_mmu_stlb
           1154025      miss_mmu_stlb
           1162691      access_mmu_pte_c
             34067      rob_flush
          11212384      btb_prediction_miss
           1256242      itlb_miss
         652523491      sync_del_fetch_g
            384465      icache_miss
          64635789      bpu_br_retire
            323440      bpu_br_miss
           8785143      ret_ins_retire
             31236      ret_ins_miss

      20.760822480 seconds time elapsed

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 .../arch/riscv/starfive/dubhe-80/common.json  | 172 ++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/common.json

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index c61b3d6ef616..ee61e26f90cd 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -15,3 +15,4 @@
 #
 #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
+0x67e-0x80000000db000080-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
diff --git a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/common.json b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/common.json
new file mode 100644
index 000000000000..fbffcacb2ace
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/common.json
@@ -0,0 +1,172 @@
+[
+  {
+    "EventName": "ACCESS_MMU_STLB",
+    "EventCode": "0x1",
+    "BriefDescription": "access MMU STLB"
+  },
+  {
+    "EventName": "MISS_MMU_STLB",
+    "EventCode": "0x2",
+    "BriefDescription": "miss MMU STLB"
+  },
+  {
+    "EventName": "ACCESS_MMU_PTE_C",
+    "EventCode": "0x3",
+    "BriefDescription": "access MMU PTE-Cache"
+  },
+  {
+    "EventName": "MISS_MMU_PTE_C",
+    "EventCode": "0x4",
+    "BriefDescription": "miss MMU PTE-Cache"
+  },
+  {
+    "EventName": "ROB_FLUSH",
+    "EventCode": "0x5",
+    "BriefDescription": "ROB flush (all kinds of exceptions)"
+  },
+  {
+    "EventName": "BTB_PREDICTION_MISS",
+    "EventCode": "0x6",
+    "BriefDescription": "BTB prediction miss"
+  },
+  {
+    "EventName": "ITLB_MISS",
+    "EventCode": "0x7",
+    "BriefDescription": "ITLB miss"
+  },
+  {
+    "EventName": "SYNC_DEL_FETCH_G",
+    "EventCode": "0x8",
+    "BriefDescription": "SYNC delivery a fetch-group"
+  },
+  {
+    "EventName": "ICACHE_MISS",
+    "EventCode": "0x9",
+    "BriefDescription": "ICache miss"
+  },
+  {
+    "EventName": "BPU_BR_RETIRE",
+    "EventCode": "0xA",
+    "BriefDescription": "condition branch instruction retire"
+  },
+  {
+    "EventName": "BPU_BR_MISS",
+    "EventCode": "0xB",
+    "BriefDescription": "condition branch instruction miss"
+  },
+  {
+    "EventName": "RET_INS_RETIRE",
+    "EventCode": "0xC",
+    "BriefDescription": "return instruction retire"
+  },
+  {
+    "EventName": "RET_INS_MISS",
+    "EventCode": "0xD",
+    "BriefDescription": "return instruction miss"
+  },
+  {
+    "EventName": "INDIRECT_JR_MISS",
+    "EventCode": "0xE",
+    "BriefDescription": "indirect JR instruction miss (inlcude without target)"
+  },
+  {
+    "EventName": "IBUF_VAL_ID_NORDY",
+    "EventCode": "0xF",
+    "BriefDescription": "IBUF valid while ID not ready"
+  },
+  {
+    "EventName": "IBUF_NOVAL_ID_RDY",
+    "EventCode": "0x10",
+    "BriefDescription": "IBUF not valid while ID ready"
+  },
+  {
+    "EventName": "REN_INT_PHY_REG_NORDY",
+    "EventCode": "0x11",
+    "BriefDescription": "REN integer physical register file is not ready"
+  },
+  {
+    "EventName": "REN_FP_PHY_REG_NORDY",
+    "EventCode": "0x12",
+    "BriefDescription": "REN floating point physical register file is not ready"
+  },
+  {
+    "EventName": "REN_CP_NORDY",
+    "EventCode": "0x13",
+    "BriefDescription": "REN checkpoint is not ready"
+  },
+  {
+    "EventName": "DEC_VAL_ROB_NORDY",
+    "EventCode": "0x14",
+    "BriefDescription": "DEC is valid and ROB is not ready"
+  },
+  {
+    "EventName": "OOD_FLUSH_LS_DEP",
+    "EventCode": "0x15",
+    "BriefDescription": "out of order flush due to load/store dependency"
+  },
+  {
+    "EventName": "BRU_RET_IJR_INS",
+    "EventCode": "0x16",
+    "BriefDescription": "BRU retire an IJR instruction"
+  },
+  {
+    "EventName": "ACCESS_DTLB",
+    "EventCode": "0x17",
+    "BriefDescription": "access DTLB"
+  },
+  {
+    "EventName": "MISS_DTLB",
+    "EventCode": "0x18",
+    "BriefDescription": "miss DTLB"
+  },
+  {
+    "EventName": "LOAD_INS_DCACHE",
+    "EventCode": "0x19",
+    "BriefDescription": "load instruction access DCache"
+  },
+  {
+    "EventName": "LOAD_INS_MISS_DCACHE",
+    "EventCode": "0x1A",
+    "BriefDescription": "load instruction miss DCache"
+  },
+  {
+    "EventName": "STORE_INS_DCACHE",
+    "EventCode": "0x1B",
+    "BriefDescription": "store/amo instruction access DCache"
+  },
+  {
+    "EventName": "STORE_INS_MISS_DCACHE",
+    "EventCode": "0x1C",
+    "BriefDescription": "store/amo instruction miss DCache"
+  },
+  {
+    "EventName": "LOAD_SCACHE",
+    "EventCode": "0x1D",
+    "BriefDescription": "load access SCache"
+  },
+  {
+    "EventName": "STORE_SCACHE",
+    "EventCode": "0x1E",
+    "BriefDescription": "store access SCache"
+  },
+  {
+    "EventName": "LOAD_MISS_SCACHE",
+    "EventCode": "0x1F",
+    "BriefDescription": "load miss SCache"
+  },
+  {
+    "EventName": "STORE_MISS_SCACHE",
+    "EventCode": "0x20",
+    "BriefDescription": "store miss SCache"
+  },
+  {
+    "EventName": "L2C_PF_REQ",
+    "EventCode": "0x21",
+    "BriefDescription": "L2C data-prefetcher request"
+  },
+  {
+    "EventName": "L2C_PF_HIT",
+    "EventCode": "0x22",
+    "BriefDescription": "L2C data-prefetcher hit"
+  }
+]
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD61C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rz5gu8BJNMV93x3aK+D/DqVEPddnLKpZa4Ps+2qiaM=; b=SnBoDs1z4RjUtN
	zaXPZJF2O+Dn7SZ5bfre3KdDaEjhwqyNbVD6szFQzW5+YP154GV0H8mVVOF7kuX+fDMDliVJlYhCl
	EUnSGJDv9jenXKWHwkCDfkg2sKUosuh0TNQuriOGdeUyCZiWwogql7JxJgQijv5Zs2KFzsxrDLC6W
	Syh/ds2i8dOduuxI298sVY3TLGCknNjciqxJvdQLKuY1Tlm+FgwnkBHyPvlKd6VGb4VrDkGu1UEtz
	JeOJyh/qs45kN7ebyA0XQGSQkDFlhyVT50A4ZmV48it4iKdhJP4IDtatqG4Nt/9xRsKMGxViAZnhP
	GR+uMHIEQksK6GjErqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tK5-000000003Rp-3zzH;
	Thu, 09 May 2024 02:15:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJy-000000003NZ-0Ee1
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1eeabda8590so2553135ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220944; x=1715825744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pIBduwe3RMg13/lORG0pNA6/JD6DG4hGUAT0C8H3lQ=;
        b=L9k3DVcR/eOTzuhOwDYtfoKuyJ04yIz31T/vwIPZJ/mEiUIdZPWZ/8HYQ/ay13h3fQ
         ocir3AkQcFHrlXzk+GYBjffFuSmfgh6rdmQoRDyAa3gMu8d+0aXukJjbjgcfpilK0qHS
         /Eo+J7L90wLtHJmO4SGiZgSVNJExEjdL6BdoWJCHupxhb/CTYri2RchU+aFiYSlfvsXI
         wZDtZd2toKVRBRr5zwi66IgrEPcxSSQzJ8exEw1G47YFzATBqOvmcPm9t+4cDuxg7u+M
         TGIFsRJ7eDIg9wUcsB4FgSPaD+X+UUXYLW7e45fsePvrnJ33o/AS80D477A14KXzwTTl
         4vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220944; x=1715825744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pIBduwe3RMg13/lORG0pNA6/JD6DG4hGUAT0C8H3lQ=;
        b=L8/xsvmR+C/Np1eMcM2sydtitJ+eOGmp5Tsc4LIX2op5RkvA1wHhsrCNu4cLVd9/Fn
         4l0gYq5N6BG5x3+cLp6l4hRQQSBp1BG6nxmWYCxNYF7TGp1U0G+mPQBfDZSom0swXbXp
         QyvPCpNQ7Z89kBVz5svNgX7OtQ89UpCFWtOTJM0xe6miUvcNmynaYLSJntprb8UuYdk2
         uRjNGs8RD+/o0CVdUzOk5u4ItqCeAlP0S8t8rNBm+CXEuOlEcOlH5PQI5W1U70RVWZOG
         WLfqLhYIbYFHHQAke2UFQpnQ2xqvcSqTHV7BEFiIqp4niGcreJ7VxmNCWpPR5AQkeijg
         a+7g==
X-Forwarded-Encrypted: i=1; AJvYcCV4TKssJ0VzDqYb2Hgd7H03FZKtmBoHl/Udg5gigluUBSEZJ1wIRH//DHpsnmHl6EwxEu4KtuUv7myre4Efb5fonM9S2bwm8AFIE0PeMvP4
X-Gm-Message-State: AOJu0YyD8YUbS7dKEUQ0+KjUOVZkoUdUORtU6Msqa/3n1bsYwFux3bJN
	AmTu5x3p7tWy1ue7lpLa3QOQxvohFwhh6pjmkKQtUsMolYbuQX8MRVyzszGmkukkXuIg317X7VL
	Y
X-Google-Smtp-Source: AGHT+IEEZLq+IYfVUB25BnK6cFxTtDl2tlIs8mgbH7oOj7JJJBFEXPS2na9S266EWo8ZuqvpnLlIJA==
X-Received: by 2002:a17:902:d4c7:b0:1e5:d021:cf02 with SMTP id d9443c01a7336-1eeb05976e4mr56002325ad.36.1715220944185;
        Wed, 08 May 2024 19:15:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:43 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Eric Lin <eric.lin@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 7/7] perf vendor events riscv: Add SiFive P650 events
Date: Wed,  8 May 2024 19:15:00 -0700
Message-ID: <20240509021531.680920-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191546_228655_23571FF4 
X-CRM114-Status: GOOD (  17.70  )
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

From: Eric Lin <eric.lin@sifive.com>

The SiFive Performance P650 core (including the vector-enabled P670 and
area-optimized P450/P470 variants) updates the P550 microarchitecture.
It brings in the debug, trace, and counter events from newer Bullet
cores, and adds new events for iTLB and dTLB multi-hits.

All other PMU events are unchanged from the P550 core.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  1 +
 .../p650/cycle-and-instruction-count.json     |  1 +
 .../arch/riscv/sifive/p650/firmware.json      |  1 +
 .../arch/riscv/sifive/p650/instruction.json   |  1 +
 .../arch/riscv/sifive/p650/memory.json        | 57 +++++++++++++++++
 .../arch/riscv/sifive/p650/microarch.json     | 62 +++++++++++++++++++
 .../arch/riscv/sifive/p650/watchpoint.json    |  1 +
 7 files changed, 124 insertions(+)
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index a301e9dbfd5a..0a7e7dcc81be 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -18,6 +18,7 @@
 0x489-0x8000000000000[1-9a-e]07-0x[78ac][[:xdigit:]]+,v1,sifive/bullet-07,core
 0x489-0x8000000000000[1-9a-e]07-0xd[[:xdigit:]]+,v1,sifive/bullet-0d,core
 0x489-0x8000000000000008-0x[[:xdigit:]]+,v1,sifive/p550,core
+0x489-0x8000000000000[1-6]08-0x[9b][[:xdigit:]]+,v1,sifive/p650,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json b/tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json
new file mode 120000
index 000000000000..ccd29278f61b
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json
@@ -0,0 +1 @@
+../bullet-07/cycle-and-instruction-count.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json
new file mode 120000
index 000000000000..34e5c2870eee
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json
@@ -0,0 +1 @@
+../bullet/firmware.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json b/tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json
new file mode 120000
index 000000000000..62eacc2d7497
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json
@@ -0,0 +1 @@
+../bullet/instruction.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json
new file mode 100644
index 000000000000..f1431b339c7f
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json
@@ -0,0 +1,57 @@
+[
+  {
+    "EventName": "ICACHE_MISS",
+    "EventCode": "0x102",
+    "BriefDescription": "Counts instruction cache misses"
+  },
+  {
+    "EventName": "DCACHE_MISS",
+    "EventCode": "0x202",
+    "BriefDescription": "Counts data cache misses"
+  },
+  {
+    "EventName": "DCACHE_RELEASE",
+    "EventCode": "0x402",
+    "BriefDescription": "Counts writeback requests from the data cache"
+  },
+  {
+    "EventName": "ITLB_MISS",
+    "EventCode": "0x802",
+    "BriefDescription": "Counts Instruction TLB misses caused by instruction address translation requests"
+  },
+  {
+    "EventName": "DTLB_MISS",
+    "EventCode": "0x1002",
+    "BriefDescription": "Counts Data TLB misses caused by data address translation requests"
+  },
+  {
+    "EventName": "UTLB_MISS",
+    "EventCode": "0x2002",
+    "BriefDescription": "Counts Unified TLB misses caused by address translation requests"
+  },
+  {
+    "EventName": "UTLB_HIT",
+    "EventCode": "0x4002",
+    "BriefDescription": "Counts Unified TLB hits for address translation requests"
+  },
+  {
+    "EventName": "PTE_CACHE_MISS",
+    "EventCode": "0x8002",
+    "BriefDescription": "Counts Page Table Entry cache misses"
+  },
+  {
+    "EventName": "PTE_CACHE_HIT",
+    "EventCode": "0x10002",
+    "BriefDescription": "Counts Page Table Entry cache hits"
+  },
+  {
+    "EventName": "ITLB_MULTI_HIT",
+    "EventCode": "0x20002",
+    "BriefDescription": "Counts Instruction TLB multi-hits"
+  },
+  {
+    "EventName": "DTLB_MULTI_HIT",
+    "EventCode": "0x40002",
+    "BriefDescription": "Counts Data TLB multi-hits"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json
new file mode 100644
index 000000000000..de8efd7b8b34
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json
@@ -0,0 +1,62 @@
+[
+  {
+    "EventName": "ADDRESSGEN_INTERLOCK",
+    "EventCode": "0x101",
+    "BriefDescription": "Counts cycles with an address-generation interlock"
+  },
+  {
+    "EventName": "LONGLATENCY_INTERLOCK",
+    "EventCode": "0x201",
+    "BriefDescription": "Counts cycles with a long-latency interlock"
+  },
+  {
+    "EventName": "CSR_INTERLOCK",
+    "EventCode": "0x401",
+    "BriefDescription": "Counts cycles with a CSR interlock"
+  },
+  {
+    "EventName": "ICACHE_BLOCKED",
+    "EventCode": "0x801",
+    "BriefDescription": "Counts cycles in which the instruction cache was not able to provide an instruction"
+  },
+  {
+    "EventName": "DCACHE_BLOCKED",
+    "EventCode": "0x1001",
+    "BriefDescription": "Counts cycles in which the data cache blocked an instruction"
+  },
+  {
+    "EventName": "BRANCH_DIRECTION_MISPREDICTION",
+    "EventCode": "0x2001",
+    "BriefDescription": "Counts mispredictions of conditional branch direction (taken/not taken)"
+  },
+  {
+    "EventName": "BRANCH_TARGET_MISPREDICTION",
+    "EventCode": "0x4001",
+    "BriefDescription": "Counts mispredictions of the target PC of control-flow instructions"
+  },
+  {
+    "EventName": "PIPELINE_FLUSH",
+    "EventCode": "0x8001",
+    "BriefDescription": "Counts flushes of the core pipeline. Common causes include fence.i and CSR accesses"
+  },
+  {
+    "EventName": "REPLAY",
+    "EventCode": "0x10001",
+    "BriefDescription": "Counts instruction replays"
+  },
+  {
+    "EventName": "INTEGER_MUL_DIV_INTERLOCK",
+    "EventCode": "0x20001",
+    "BriefDescription": "Counts cycles with a multiply or divide interlock"
+  },
+  {
+    "EventName": "FP_INTERLOCK",
+    "EventCode": "0x40001",
+    "BriefDescription": "Counts cycles with a floating-point interlock"
+  },
+  {
+    "EventName": "TRACE_STALL",
+    "EventCode": "0x80001",
+    "BriefDescription": "Counts cycles in which the core pipeline is stalled due to backpressure from the Trace Encoder"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json b/tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json
new file mode 120000
index 000000000000..e88b98bfc5c8
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json
@@ -0,0 +1 @@
+../bullet-07/watchpoint.json
\ No newline at end of file
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A474DC04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpqtTvUIucHS56EcvXslxk1W7SH/w4doQchMyHRBLy0=; b=hcoPuCuNm92v9e
	1+TbHyq74VE6ExvC/+A3tINxMTtzI/9pLQlmUzCBrysjC6gEqOtmkORnQfWstHFRN34+IvBGnS+l6
	CKmWXKbZdUpVIqyoTbzNJnXm2u/3j16HcuFkVsjMxD0+Q9ku9AX795X3peS5WpCZCI9yPvVz38JQQ
	7MxUF8kUpofGeDgJZqdQqqTWLDw69vWzfys87ULdsSDyCd1nlxIQs3aut2vaOuFwjtIwvxvDOg0OS
	qpOCz+FwNzcX9P2fd4HluzzEit2jAcxhPKKrcNSCPO1lOSUGhgaxt8+vgOYiau6Qgq1Fu5WCLpOOt
	EGN3itf2lzB06WRK/Mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tK0-000000003PS-1efG;
	Thu, 09 May 2024 02:15:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJv-000000003KZ-07xX
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ec4b2400b6so3148145ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220941; x=1715825741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXfa/PXX0wNxcWsuTnJvVKBz5xkIckXoldeqVQ+uY6s=;
        b=koJAqZ9l4OcZWkDhKwgfW0APcrLDfE6aRFMgN4SDt873sjpg/uHLWLYz4ffbGEayiB
         AV//ZJStXyf/YBRVohu0Jv5hvX6QLZMP9RtCs62Nu8EcsY8F+7MHprGkJ922i975QtLn
         hoOjufJ3AMgl7nNbagdjKOhrI49JSLt+VRrNw5amodCi5b3zz5a7OSbL+Kt3vcOVY+i8
         iDwd5ZngoHD3NLpjxL7/DdUeM7ugUCj2w79HeI0yJeikB5jVZ8FIeqVix4u2wuswZDTI
         q5z108buGGPQM0Y2pxAvAFF3d5q3PyGn5m7L8H+G5XoUKoMHfETYFmK2zJNjH+bAJamJ
         FeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220941; x=1715825741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXfa/PXX0wNxcWsuTnJvVKBz5xkIckXoldeqVQ+uY6s=;
        b=T7N5PC1viapa+NhmwT3tuV7OXMKi+SA4UeYmKsEl6Lq0cPYmZ62I3Lb9unpfbRwdL0
         M0MR7GWasl+iP8np20XQfMUyVM3RPBu+wdpm984F+Z2yomnkYJR0mZPXJJ/+d5CHHaNC
         0c44TTm9YCllY0TwsMYZ36bkAic4sOeoaFFMXDmOLJLEziMxicN2DZkBcsChG6x4rmqZ
         8ueaFkulkNmKxjYHw+wFha9UNvMsOi9lMvPngQY1+fpFxuM69oiDT/I1/SZm9ln3SgoI
         0Kh7gbPuQ3WHljqcYw9MGHGU1rqfGAKXPfZwy2Gn3ycayjyzLNxemG72t6I0biCugttc
         ixqg==
X-Forwarded-Encrypted: i=1; AJvYcCVl3yeYyHTy/uaAgwITOkFI2CEwD2FqrL0U/Do7ohlVJCusvlT9JItNaCKwecLbiXu0lUiRSQlYKmd5SHVIOn/BDIyxzRuPtXZXg2rLKSmu
X-Gm-Message-State: AOJu0YxIIJnnFCFDDYf0NHezBXOkcm3glJzsVKBRIe+J3SHSV21AR5oJ
	ja/dzTEFdqRiljVCtxA3+NIIp38f71cpUgHhHA5yuo3jzVjcZKhaLCLSoiXkmDo=
X-Google-Smtp-Source: AGHT+IE9ZoyucFXxbdSGw7XJTOvvL/daIX0wCHcvpRgNlMZzb6xM1tdXMzrCLA56bysKpPynTf/B8w==
X-Received: by 2002:a17:902:f548:b0:1e5:8629:44d with SMTP id d9443c01a7336-1eeb03a6a1dmr52745165ad.1.1715220941080;
        Wed, 08 May 2024 19:15:41 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:40 -0700 (PDT)
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
Subject: [PATCH 5/7] perf vendor events riscv: Add SiFive Bullet version 0x0d events
Date: Wed,  8 May 2024 19:14:58 -0700
Message-ID: <20240509021531.680920-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191543_223755_44D5F07A 
X-CRM114-Status: GOOD (  16.59  )
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

SiFive Bullet microarchitecture cores with mimpid values starting with
0x0d or greater add new PMU events to count TLB miss stall cycles.

All other PMU events are unchanged from earlier Bullet cores.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  1 +
 .../cycle-and-instruction-count.json          |  1 +
 .../arch/riscv/sifive/bullet-0d/firmware.json |  1 +
 .../riscv/sifive/bullet-0d/instruction.json   |  1 +
 .../arch/riscv/sifive/bullet-0d/memory.json   |  1 +
 .../riscv/sifive/bullet-0d/microarch.json     | 72 +++++++++++++++++++
 .../riscv/sifive/bullet-0d/watchpoint.json    |  1 +
 7 files changed, 78 insertions(+)
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 8706d289215e..9e9bd7ac0ebe 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -16,6 +16,7 @@
 #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/bullet,core
 0x489-0x8000000000000[1-9a-e]07-0x[78ac][[:xdigit:]]+,v1,sifive/bullet-07,core
+0x489-0x8000000000000[1-9a-e]07-0xd[[:xdigit:]]+,v1,sifive/bullet-0d,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json
new file mode 120000
index 000000000000..ccd29278f61b
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json
@@ -0,0 +1 @@
+../bullet-07/cycle-and-instruction-count.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json
new file mode 120000
index 000000000000..34e5c2870eee
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json
@@ -0,0 +1 @@
+../bullet/firmware.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json
new file mode 120000
index 000000000000..62eacc2d7497
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json
@@ -0,0 +1 @@
+../bullet/instruction.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json
new file mode 120000
index 000000000000..df50fc47a5fe
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json
@@ -0,0 +1 @@
+../bullet/memory.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json
new file mode 100644
index 000000000000..6573b24788eb
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json
@@ -0,0 +1,72 @@
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
+  },
+  {
+    "EventName": "ITLB_MISS_STALL",
+    "EventCode": "0x100001",
+    "BriefDescription": "Counts cycles in which the core pipeline is stalled due to ITLB Miss"
+  },
+  {
+    "EventName": "DTLB_MISS_STALL",
+    "EventCode": "0x200001",
+    "BriefDescription": "Counts cycles in which the core pipeline is stalled due to DTLB Miss"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json
new file mode 120000
index 000000000000..e88b98bfc5c8
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json
@@ -0,0 +1 @@
+../bullet-07/watchpoint.json
\ No newline at end of file
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

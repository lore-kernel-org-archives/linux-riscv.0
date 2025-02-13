Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D551C021A7
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsoCD9YrRRhH5VnpaUaVvpFNAO9bwMu56KWR1teXqv0=; b=mxFTlZcoLs7yMX
	9qLRBtQF4G/WUgQr0+2keBOiUY65DDUpfqYsJRVD8lPs1/XXhl4KamN79UdCKX2PDweb6dm+Zsi5/
	2i8WP9V3Mmm5G+iBGSRaq/e3lj889efZnz/a600lPCXuG1YHRpfCi/5L5LDqSsIgqQZhj78jiotIP
	LX812Yg5A10RGZEyubjyP5fqdyD2LUXZtCrv5WpRUz5UGKetTBX06t2xElprZX1dyQUKkISexWJkz
	YlmwtkTTLomuAn1brfj0Akxjz0LCpS/BPol/3iBLOOjVZI6wdf3oYnFCMlMyQq3qnQRYqucNO7LSs
	Wfp9mUwDKWtUkl6mpkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJK-0000000ClYl-157P;
	Thu, 13 Feb 2025 22:03:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJH-0000000ClV6-0xbe
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f61b01630so40787435ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484231; x=1740089031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpwIO49GNbtoyWqWXl7vLneMjnaxCqv/Wwmz/9PWqJA=;
        b=LT9FNsgLjtDTD5dTBHJqYGdAhNIh7TohvIOSm2ifiawCJudGI26ZAgYx+Z80hZPrYL
         Jz0bpt3t2Ce1nCPndmF52NMx2Ke6Lkh5hXPHcOMGzLkCXjsnccs1Jgb4ucobeCIrYqRC
         Gf6cJeYm6kzyTVQw5zerv3dg3EfwWWYx84CJoqGW2hZlvWM9CC4obXndzPyVnz05atLC
         HBK7LKoCxmNc7itrR9mWuIqq1oh/MByhC5sKxFysWdgzEpniISUammvjCfbo5VXFn3KB
         eDRRV5PpEsGdCYAmhyuXok1q17lU/ATa7Bn1JCtZlmquoMGodAGGKubMytYQisYejJCI
         xyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484231; x=1740089031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpwIO49GNbtoyWqWXl7vLneMjnaxCqv/Wwmz/9PWqJA=;
        b=DK3qV+necCcqhFiXCn2fqDvOcqS+ZkKspUCVoaZRcKp+c1mfdSM+7JoWbGXEQv5+zH
         7C8ZIFp41hHDbB47AbRKQrw+YjESdBwGBQAZ752AxOeIVmotHQalYLEDGfacFWEwnh8t
         KTrmY1VAe279sIq75HB1Jfd2o0L2fx0zf8DUwsp1f7AQzVY0lDRUVhXkS1Olhmf+MwXV
         nNmO40W/codBIYpxRPyOV0H8PF8sjV1L8MBmEKJ6lSC3xTF2YrehOpJIFqVQ6T1k4ja1
         CtA6mMG2CCLeiLTjWYze79Wzq2msWXcRtmY2+tT1cQL3mrYnlX13M983CcJHk4Av/FVd
         9eow==
X-Forwarded-Encrypted: i=1; AJvYcCVAPszvjDm6KSpc7uDOhg+wiaHI0LM1HQb1NBACPjUKYOtOMu3mRSvsc9g80g3kdY86Oj/4/XSnnIw9jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ2iHrr1a8islsWKrr6lIatPsaXo0Jr6ceXhubbeZYzlpK2Ma6
	Cw9TsZvXju56y0+QS/lu51NxNGeOFewsTpVV7tl3o6zJ8Z77c+M4wMom2TMCnsk=
X-Gm-Gg: ASbGnctQK6NXoCcTTLUlhMjAUVBeBCzKihseU53/56OzYQB777j696iQSJHis7M7MYd
	KtpRgkoREu34H7v0gEWDyySxM6yTlWl/hnVoc4ojTbYkuA20JW/Sk6DBoo7DYIi8692jF9NbDzr
	rc013OsXFdQkFe1hqiZ/cgvZJIoytVN5Cn8CAdueETmgBZaVEGPPdWfWHTNkPXyCJYUAGrztn99
	iFuwpanHErQxNkEYA18VOHKI3Gcvo1mw9OffW178eNgT6XGEDkgQAPP29FLBFZYAgXdMg363Dhw
	QUqKx1xRtQ/jGP8BH27EtDpvlJfz7CjE42ALqA==
X-Google-Smtp-Source: AGHT+IHyp5GPdiF4nIYOwtKcjQEfdkn2i33PogWXmBC+DOooDH454z3E0beNUeVSYbV2PZWSHNiXZw==
X-Received: by 2002:a05:6a00:2d82:b0:725:4915:c10 with SMTP id d2e1a72fcca58-7323c76e38fmr8546927b3a.10.1739484230699;
        Thu, 13 Feb 2025 14:03:50 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:50 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Eric Lin <eric.lin@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RESEND PATCH 5/7] perf vendor events riscv: Add SiFive Bullet version 0x0d events
Date: Wed, 12 Feb 2025 17:21:38 -0800
Message-ID: <20250213220341.3215660-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140351_282317_9C449184 
X-CRM114-Status: GOOD (  15.66  )
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

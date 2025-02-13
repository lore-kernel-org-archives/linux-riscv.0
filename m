Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ED8C021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrk4CECzZIIxT4MQEexQmgQF2tcx2KJttOavPjCa0oU=; b=Izc6J6G2IgZ0Sm
	ZvFD6ul8esD4TnH+yO+uWdkh7AcwznKbB9iWxnV5Kb4BJC985maX/yJv32Q6iuxIA8/iwwVkFKclM
	futi+kOVbi2agcoWe/r4CiKghNMwTlMpExUc7ZVgZm3ibtnjhnTZKoT3SRIH56KR8CDBKJ6r/+m6O
	LyLbMhIF1Yxo+QwBbdmBLhNsJw4JiWTfpCGetF4fFMaofL7R10cKpMBhCaTfMoocrM9+1S/dArUC9
	cwqgnmhPwrsn2kVVLK1yBrU6Bupthy48/PRsWiTSCf5rEDyqzv0K2imXf37A9EVbZePK67UvqIxrE
	84vgh2gpJwMEYmk5KcGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJO-0000000Clc7-1EF7;
	Thu, 13 Feb 2025 22:03:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJN-0000000Clap-1X6F
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Feb 2025 22:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/ujrNz6bFEjXMZWyeD7xO+6PAHSEy846AW7WXFdUvFc=; b=UPwvF7qCVOHWLtPiIeCkrCWoTB
	GiiMW9VtYw7DZoKz1RE9op7/MzlLDs8rkVb4ShpDmjDlakm3zueTujMx8bBhRJP8xhaeoypH0wAiY
	GsOC16fuYgaDpxJo0xRbWLQ3+ZJPxYBZZ8o233jW6LEpbyk8BVdJdI+ZXiWc51Rly47MgACvQ1HtJ
	lxs7NVgI9cj3pHm+urpGT5odWvJQxEva/ONbZcbidloDlaElhpk3FsMZtd0nDikvWJp76P56hEbDX
	hmavX01lJFoE4WuuCUaKN5e/YXkkyh2rosgh7RfS2DeNhpQBf23kSGIzBueS4nQxEJ2q1DaBl8YZh
	sOMIi1TQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJG-000000016ys-3F3K
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220c8cf98bbso27720185ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484226; x=1740089026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ujrNz6bFEjXMZWyeD7xO+6PAHSEy846AW7WXFdUvFc=;
        b=gIYroRZgLysVSvMiWNPxlODngrVpLJx5iQUE2QjWkxXS5NvjquSk671xXalPxjPvbs
         sY+1MO3hcec8mkNI6UXuUVyuiDT48kKVt7+It5l0tumRrVl1mZbIXaHiANF/qUAo+kTO
         xFeAAIeNeg6NkUoD50AbzkSNOy8xd0vP9p8tQ0PvE1gY99lSSpB/FaDV2KUXqkv1ccAk
         9WN8HDebDxfioztUDwFLoozdByFqAmdiKJTfGHiKdU9/YwhPoaCdQ3kx1K4/RlcHks6g
         sftYow3WVSt+BnMgjUHtBByqXH3uKUr3vSs7cQoOLRAckFEbmzd8NkQd3NTCInNbLBgd
         /Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484226; x=1740089026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ujrNz6bFEjXMZWyeD7xO+6PAHSEy846AW7WXFdUvFc=;
        b=a7+0DFvW8U6uZixRMerJHwe7FNNAlMd/Blugj/VXiMNAwYT0VuAwFDN+9mDW+RvjWM
         FVHk4MKJ0knZLSnZrhVZhuSuG8lm99cR+aL7WjaYDkjEucLM7L8cxzC5qvBJnRtFUhgi
         ywa/jnhngwqdbIJWM1R5enX4+CXEwjQUANNPHIBxtJUTUumj2A61vKcWSxHMbNHwlfXG
         XhTj3PE20TWxerxcBTdgV7Pufslo3C1PnK4lkrKMg6VBBefuh52KoI6EPuFHvDeFn+Z8
         YHOIIMmHYWcw6/u/KHw4Zv8+S69wl3bE9Id9usQzla4MNAC5FmyzA/kSITD4OHjK3A6c
         71ig==
X-Forwarded-Encrypted: i=1; AJvYcCWKtzj3zokARuBBUDwG+1Ui6JzCNOSN5oFTtfCAN+tvqauvHeHGzXUjVQXtdtXvWvfgUNmL+7KjXP2+zA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGnalLQQ0qBh298m+nOXCNL2E8sCZLyUyY4xCCt5NL9h8w1R+D
	DyQAvZx1XPilAjNeBNJkJGwe4IBSW0KzPtrlu6HXWuTedJ/FIvphEKHFTr8OpMk=
X-Gm-Gg: ASbGnctDGqOdvadrZ+pmk9HXT+YV4IJLA/le80vltF+WQBRFPuaiquZmu62sUmrZXZW
	O4zV0YbDrASgLJSMaQQxNCx3JWtLNzf7m6A308Hf9jAHqPJ1Mdw5Ku9D+EXb3vsv3GsTsUx+SRY
	XjBU1w8KwNkduy2xHQ1SPaiyJB3BVjDTRRPVE1R3wCYQcudd9lp0JJzPseXW9kDRfKYaFHalfhj
	9mgdWGYElnOLXBsgrjeG0kvbkDb155mPKwTYX0/FK/dh16PEAvL97z6Jgv+jaSkCmToloLhrc7Z
	HL5Aln0pEVcG3sUGMPzv+S/mYU0HgaU28CxeOQ==
X-Google-Smtp-Source: AGHT+IEkWuYu6Mf+HWuIrNOvHWAQyQHQHIN4Af/iLEKahRrF/JeeptdD8j+MBLAWGFNetgsaZ+DGjg==
X-Received: by 2002:a05:6a00:8006:b0:72a:9ddf:55ab with SMTP id d2e1a72fcca58-7322c38b08emr12659266b3a.10.1739484226610;
        Thu, 13 Feb 2025 14:03:46 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:46 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RESEND PATCH 2/7] perf vendor events riscv: Remove leading zeroes
Date: Wed, 12 Feb 2025 17:21:35 -0800
Message-ID: <20250213220341.3215660-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_220352_445252_6E299A12 
X-CRM114-Status: UNSURE (   9.51  )
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

The EventCode field (as stored in the mhpmeventN CSRs) is actually 56
bits wide, but there is no need to keep leading zeroes in the JSON
files. Remove them to simplify review of the following change, which
regenerates the files in a way that does not include leading zeroes.

This change was performed automatically with `sed -i "s/0x0*/0x/"`.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 .../arch/riscv/sifive/bullet/instruction.json | 32 +++++++++----------
 .../arch/riscv/sifive/bullet/memory.json      | 12 +++----
 .../arch/riscv/sifive/bullet/microarch.json   | 22 ++++++-------
 3 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
index 5eab718c9256..d5c370f70819 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
@@ -1,82 +1,82 @@
 [
   {
     "EventName": "EXCEPTION_TAKEN",
-    "EventCode": "0x0000100",
+    "EventCode": "0x100",
     "BriefDescription": "Exception taken"
   },
   {
     "EventName": "INTEGER_LOAD_RETIRED",
-    "EventCode": "0x0000200",
+    "EventCode": "0x200",
     "BriefDescription": "Integer load instruction retired"
   },
   {
     "EventName": "INTEGER_STORE_RETIRED",
-    "EventCode": "0x0000400",
+    "EventCode": "0x400",
     "BriefDescription": "Integer store instruction retired"
   },
   {
     "EventName": "ATOMIC_MEMORY_RETIRED",
-    "EventCode": "0x0000800",
+    "EventCode": "0x800",
     "BriefDescription": "Atomic memory operation retired"
   },
   {
     "EventName": "SYSTEM_INSTRUCTION_RETIRED",
-    "EventCode": "0x0001000",
+    "EventCode": "0x1000",
     "BriefDescription": "System instruction retired"
   },
   {
     "EventName": "INTEGER_ARITHMETIC_RETIRED",
-    "EventCode": "0x0002000",
+    "EventCode": "0x2000",
     "BriefDescription": "Integer arithmetic instruction retired"
   },
   {
     "EventName": "CONDITIONAL_BRANCH_RETIRED",
-    "EventCode": "0x0004000",
+    "EventCode": "0x4000",
     "BriefDescription": "Conditional branch retired"
   },
   {
     "EventName": "JAL_INSTRUCTION_RETIRED",
-    "EventCode": "0x0008000",
+    "EventCode": "0x8000",
     "BriefDescription": "JAL instruction retired"
   },
   {
     "EventName": "JALR_INSTRUCTION_RETIRED",
-    "EventCode": "0x0010000",
+    "EventCode": "0x10000",
     "BriefDescription": "JALR instruction retired"
   },
   {
     "EventName": "INTEGER_MULTIPLICATION_RETIRED",
-    "EventCode": "0x0020000",
+    "EventCode": "0x20000",
     "BriefDescription": "Integer multiplication instruction retired"
   },
   {
     "EventName": "INTEGER_DIVISION_RETIRED",
-    "EventCode": "0x0040000",
+    "EventCode": "0x40000",
     "BriefDescription": "Integer division instruction retired"
   },
   {
     "EventName": "FP_LOAD_RETIRED",
-    "EventCode": "0x0080000",
+    "EventCode": "0x80000",
     "BriefDescription": "Floating-point load instruction retired"
   },
   {
     "EventName": "FP_STORE_RETIRED",
-    "EventCode": "0x0100000",
+    "EventCode": "0x100000",
     "BriefDescription": "Floating-point store instruction retired"
   },
   {
     "EventName": "FP_ADDITION_RETIRED",
-    "EventCode": "0x0200000",
+    "EventCode": "0x200000",
     "BriefDescription": "Floating-point addition retired"
   },
   {
     "EventName": "FP_MULTIPLICATION_RETIRED",
-    "EventCode": "0x0400000",
+    "EventCode": "0x400000",
     "BriefDescription": "Floating-point multiplication retired"
   },
   {
     "EventName": "FP_FUSEDMADD_RETIRED",
-    "EventCode": "0x0800000",
+    "EventCode": "0x800000",
     "BriefDescription": "Floating-point fused multiply-add retired"
   },
   {
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
index be1a46312ac3..ba3168f8a4cd 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
@@ -1,32 +1,32 @@
 [
   {
     "EventName": "ICACHE_RETIRED",
-    "EventCode": "0x0000102",
+    "EventCode": "0x102",
     "BriefDescription": "Instruction cache miss"
   },
   {
     "EventName": "DCACHE_MISS_MMIO_ACCESSES",
-    "EventCode": "0x0000202",
+    "EventCode": "0x202",
     "BriefDescription": "Data cache miss or memory-mapped I/O access"
   },
   {
     "EventName": "DCACHE_WRITEBACK",
-    "EventCode": "0x0000402",
+    "EventCode": "0x402",
     "BriefDescription": "Data cache write-back"
   },
   {
     "EventName": "INST_TLB_MISS",
-    "EventCode": "0x0000802",
+    "EventCode": "0x802",
     "BriefDescription": "Instruction TLB miss"
   },
   {
     "EventName": "DATA_TLB_MISS",
-    "EventCode": "0x0001002",
+    "EventCode": "0x1002",
     "BriefDescription": "Data TLB miss"
   },
   {
     "EventName": "UTLB_MISS",
-    "EventCode": "0x0002002",
+    "EventCode": "0x2002",
     "BriefDescription": "UTLB miss"
   }
 ]
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
index 50ffa55418cb..8036e72fb0d4 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
@@ -1,57 +1,57 @@
 [
   {
     "EventName": "ADDRESSGEN_INTERLOCK",
-    "EventCode": "0x0000101",
+    "EventCode": "0x101",
     "BriefDescription": "Address-generation interlock"
   },
   {
     "EventName": "LONGLAT_INTERLOCK",
-    "EventCode": "0x0000201",
+    "EventCode": "0x201",
     "BriefDescription": "Long-latency interlock"
   },
   {
     "EventName": "CSR_READ_INTERLOCK",
-    "EventCode": "0x0000401",
+    "EventCode": "0x401",
     "BriefDescription": "CSR read interlock"
   },
   {
     "EventName": "ICACHE_ITIM_BUSY",
-    "EventCode": "0x0000801",
+    "EventCode": "0x801",
     "BriefDescription": "Instruction cache/ITIM busy"
   },
   {
     "EventName": "DCACHE_DTIM_BUSY",
-    "EventCode": "0x0001001",
+    "EventCode": "0x1001",
     "BriefDescription": "Data cache/DTIM busy"
   },
   {
     "EventName": "BRANCH_DIRECTION_MISPREDICTION",
-    "EventCode": "0x0002001",
+    "EventCode": "0x2001",
     "BriefDescription": "Branch direction misprediction"
   },
   {
     "EventName": "BRANCH_TARGET_MISPREDICTION",
-    "EventCode": "0x0004001",
+    "EventCode": "0x4001",
     "BriefDescription": "Branch/jump target misprediction"
   },
   {
     "EventName": "PIPE_FLUSH_CSR_WRITE",
-    "EventCode": "0x0008001",
+    "EventCode": "0x8001",
     "BriefDescription": "Pipeline flush from CSR write"
   },
   {
     "EventName": "PIPE_FLUSH_OTHER_EVENT",
-    "EventCode": "0x0010001",
+    "EventCode": "0x10001",
     "BriefDescription": "Pipeline flush from other event"
   },
   {
     "EventName": "INTEGER_MULTIPLICATION_INTERLOCK",
-    "EventCode": "0x0020001",
+    "EventCode": "0x20001",
     "BriefDescription": "Integer multiplication interlock"
   },
   {
     "EventName": "FP_INTERLOCK",
-    "EventCode": "0x0040001",
+    "EventCode": "0x40001",
     "BriefDescription": "Floating-point interlock"
   }
 ]
\ No newline at end of file
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

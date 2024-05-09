Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC89C25B4F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCXta99uz345KW56B1oWUUrYRyVzw02Ta+y7vsnmmPk=; b=jnEzpW3rsDmSJA
	cgYqw3NNq1Vl55U4hD3/4exfVDzzczO+Nr5q0SdQGuwInjXb+eHFLoyGO8rSwYE7MjB7gNg7/eF5H
	a9lEBE+cj+2rM5DCGPeiWZkoqI84pztg/ULuiEGv4aUKh5YjhyulJsnSTtiWYlQFzbbZ4IZu00tLV
	+SyApcjzIGSEdjaQZIYnFFlMPmNtz9xF7tJWLz2KQ5Sc0cP3PLzjZXU0jyE9EBEamd4RLolpjtVka
	WaRF3GTZiaCoThAhRxJ9ZpPotFUccqf3GLDKHhsyNrhtretwXblTFjpyujQ8XD7vpy8EEQzFIXFPt
	Kebus0bafp21IUAV+Elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJx-000000003Nr-1mDv;
	Thu, 09 May 2024 02:15:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJs-000000003II-2rjp
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1eeabda8590so2552545ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220936; x=1715825736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w31VG7dFEHQi12OtWSwU5murL3FH6dEyF6pyBObg2Y=;
        b=PAXyoYsNu5jKmzRuZsEEUlIFuQil6gp59YBqWNZRrQ6Vgy8lPqqR6nEAXZA8mUXkpj
         8qmdaPoGgWALbeMkJOkF3aXnjOyUN24fslKebpRk28B1LjkyeumrDWo+pjoRFSdzQ4Lx
         FPmcOGcuoinxXFmZ3++X61PWQ51IWH1T0aYENGVbfRsnM3h9Je0+B6cgmad2P1NlCZHV
         XYXNSWskNEpKFACV23ddmxRE0ygrOzGEhg6i7fBQYilqy52Yvx3M1MEQlcoiHCl24oiB
         7HiCUgWWuY7kYJ8nMY5eo23AEbGDU1gwNFbfC9mN6twjGy4H44yULmIQe4VpOAFZBn7z
         1/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220936; x=1715825736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1w31VG7dFEHQi12OtWSwU5murL3FH6dEyF6pyBObg2Y=;
        b=r/loeCr5FDKDCPF88uTswZu5SVKH2/rX288gTr2Gu+XG67fMQLha+rLYBzmfGl9hu9
         vkTkBtqPvgkgWkcPMFEUeHDTdFmYT77Y8slcsRNupClntrruOnukYzzvcBH0efWhyF+q
         Uwyd3mgeFhivLn5xJbBdWABzEKyopvcgcS6Js5VAba1xwx5ApGGybD6vE2ql3voYuquQ
         qDf54peXIvKlU1ooq/VkQDPTWCksep0KtmeZtP6eXNptDPOAso84wSiFzMRkeS0B/VzD
         /V5+e9b3jY5ILFbxGK3BjgfZUDcpolWLgpbcMU/hzIUG+9m7XOVdpgsqG/HNT65im3/Q
         J4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuf/M8L26rJTRp8c0EGzTqxHbp3pBe3rymE+I8HFggn6mHFK2os8Hzyqi0h7cKdlHJqihnlRX7uh0HpNyr6yYQ4q388twieu5KkF06cMMs
X-Gm-Message-State: AOJu0YwklEgVG2yNdtqhC2Rb8treNOTsb/MmnputgZHiuHOmLKCCqLpq
	8tjdcYlDOwGzHhDkG5CpE1QY94FoPMLiOc/zbNzfUccafDLR0dixEDSY0xaphVs=
X-Google-Smtp-Source: AGHT+IHTiaNofc4U3P/rwsUFxye22khX46ky/BlrMrvmBPV1NPQpIRm+fTnBzHzUfN8eU3mopldIaQ==
X-Received: by 2002:a17:903:2410:b0:1e2:194a:3d22 with SMTP id d9443c01a7336-1eeb0597692mr50740855ad.32.1715220936117;
        Wed, 08 May 2024 19:15:36 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:35 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/7] perf vendor events riscv: Remove leading zeroes
Date: Wed,  8 May 2024 19:14:55 -0700
Message-ID: <20240509021531.680920-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191540_756950_0B4A3D1E 
X-CRM114-Status: GOOD (  10.82  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

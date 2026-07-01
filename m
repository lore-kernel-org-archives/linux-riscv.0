Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EECC43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MY5lW8JsVtnwaqfndSDWh7p2Y9a4McXw+Oz7UmYLQdI=; b=Lq4dzsfHmNuzPF
	93/0vV+CZNtx6Y7mrWzNf9d6mIdQ22ZPg9LA0loPO4lYBGOmc9aAlzhwYgNdEFXsBekkc2gIiwhDJ
	ZLRIU+Sc3Q0n/D1OMdu/6gtKpe3SpRF+5mNFSsXPPzuyWoI5xC6T5JSuif1yEY57CYZeXy77p1YR8
	H2lp+lGmjI3/rPRHIQ74Fa9zEPZRAfTTuPDPHxGt0v98dTD0ZPnVFlMVCmWhpzZAwT/95mt89TfRe
	8dcVNAMUEjuZ1WZrGE9IjuvglqqFG59IxAgxPfT8kxHLjyDS++O3K4bJWKi2Pc4vkJRrvFmo/GP+q
	fXvp92uWzFi0ozByxE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqd3-000000016Nt-0tWI;
	Wed, 01 Jul 2026 08:49:09 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqd0-000000016Dy-1ryV
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:49:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KM/aix7Aoq3ErthWJJhVZGT/lKJGUMSauEvdAp3MmGs=;
	b=idSR86bRfn7ZYGRhVuVR1igwFO20aocVs5vam+0JJ+tJGd448gZUIXXUlg9IrVOLUd/PTR
	/siamZ9g5fKUuv6zXvwXpewzO3GXbmLPwplqdsbJ8GESTvjSmemWFngNPwed43KRINxxvK
	trG53oCWbp07eerA/xgJ08iaxCOtdV8=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:47:10 -0700
Subject: [PATCH v8 22/22] TEST(do-not-upstream): fake qemu vendor JSON +
 mapfile entry for CounterIDMask path
MIME-Version: 1.0
Message-Id: <20260701-counter_delegation-v8-22-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_014906_726874_3EAD8FDA 
X-CRM114-Status: GOOD (  10.88  )
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

From: Atish Patra <atishp@meta.com>

arch/riscv/qemu/virt/events.json: fake-json-{any,ctr3,ctr34,ctr6} with EventCode
+ CounterIDMask; mapfile.csv: 0x0-0x0-0x0 -> qemu/virt. Exercises jevents
CounterIDMask -> counterid_mask= -> config2 -> cdeleg counter allocation.

Signed-off-by: Atish Patra <atishp@meta.com>
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv       |  2 ++
 .../pmu-events/arch/riscv/qemu/virt/events.json    | 26 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 87cfb0e0849f..2fa3c3fd4663 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -24,3 +24,5 @@
 0x602-0x3-0x0,v1,openhwgroup/cva6,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
+0x0-0x0-0x0,v1,qemu/virt,core
+0x0-0x2a-0x0,v1,qemu/virt,core
diff --git a/tools/perf/pmu-events/arch/riscv/qemu/virt/events.json b/tools/perf/pmu-events/arch/riscv/qemu/virt/events.json
new file mode 100644
index 000000000000..294c4ed645f6
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/qemu/virt/events.json
@@ -0,0 +1,26 @@
+[
+  {
+    "EventName": "fake-json-any",
+    "EventCode": "0xF10",
+    "CounterIDMask": "0xFFFFFFF8",
+    "BriefDescription": "FAKE json event (any hpmcounter 3-31) - QEMU does not model 0xF10"
+  },
+  {
+    "EventName": "fake-json-ctr3",
+    "EventCode": "0xF11",
+    "CounterIDMask": "0x8",
+    "BriefDescription": "FAKE json event constrained to hpmcounter3"
+  },
+  {
+    "EventName": "fake-json-ctr34",
+    "EventCode": "0xF12",
+    "CounterIDMask": "0x18",
+    "BriefDescription": "FAKE json event constrained to hpmcounter3,4"
+  },
+  {
+    "EventName": "fake-json-ctr6",
+    "EventCode": "0xF13",
+    "CounterIDMask": "0x40",
+    "BriefDescription": "FAKE json event constrained to hpmcounter6 (out of a small pmu-mask)"
+  }
+]

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D02C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acssdWVL95wpA0W1kH/H2OKaL5NxRrJnrqyOVSqkU2E=; b=wY1fEcbvljr9VU
	5SXaSKH97iluMLff/Hjn2w0iOh7qzSNq4dl6eKoiYON8LWOqrQ8B8mZyMJXfHz7rDhb7oH/DOgex8
	JOp2BYXUVyd1i4L+J+ronRq9GbSuzA+nuzJTite+SYzltg7iLd/EYFY3i6D6IpXaEasD9B4ReRz36
	QXTUytE45oqXsBfwDHo21ZBRaCzxcHEMP+jpl38LAz+BBcRpi4QD55Xe/IK8V0AOhvJWkffehOtcN
	DVh5KFHVGX+gjfm0uY+MLecP97zZSFAyE0Cp7MSUCSrfFcrpRsF4d/iDb58HfbytB/R6sgkZqybp4
	/xZvJpfNl5ECXChXa1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqcx-000000016Bh-3t00;
	Wed, 01 Jul 2026 08:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqcw-0000000167U-1e4G
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AyzKCBN3s9oeO1EVWFT/ClSVjk7GzsdBFf8WMlFESxc=; b=hX1W+juQlbEI+v/e+mBEzYZnko
	I/ggU5i4rNXI7RfdaNMfGtJwIE4jb75crrUEIakWrn7EOaw26YPSjkKOzpzXdDxygSzAb6CEWO1Dq
	kzM9vJdXC1L1aRVbSPyN/NFioYjAB/16TlOnmPz6H9qezq4nQSI2/k+wxmJLixuwf5WpNLkq2erHO
	oYt3lqPaP/Qhwd1tpCli0SNhnesX6D8UdeA50IkgGAoej6CdowmjmXy8uDrjJNfjgHCxrHDcjUTTl
	BDqRyyCYZpF2IERVv7e81LT2l2JHP4OE2KgI5CMW428LQlSuEGo1uwTVjXWIz0VbD08x4D4ToIcQ5
	E53Xs/gQ==;
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqcp-00000002WwX-2Vtd
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:48:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AyzKCBN3s9oeO1EVWFT/ClSVjk7GzsdBFf8WMlFESxc=;
	b=ggCC8TGbawNchQkwiPC4S7FSHw7Yu9r6rSQ/WYxEEiDkQGLPE4kWFEMAYuUFS2/j24n0fZ
	pbJ170kNzoDN+jkkkXK4bUTqdXiOIdxs/0QY0Gv0Iyu+S6FWGftMsUN8bPgRRkvDHoQgVR
	WwMuHMVMqg3aca7nBWwPAjXAjsFciI0=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:47:07 -0700
Subject: [PATCH v8 19/22] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Message-Id: <20260701-counter_delegation-v8-19-7909f863a645@meta.com>
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
X-CRM114-CacheID: sfid-20260701_094855_908120_615066F0 
X-CRM114-Status: GOOD (  14.22  )
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V relies on the event encoding from the json file. That includes
arch standard events. If event code is present, event is already updated
with correct encoding. No need to update it again which results in losing
the event encoding.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
 tools/perf/pmu-events/jevents.py                    |  9 ++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/perf/pmu-events/arch/riscv/arch-standard.json
new file mode 100644
index 000000000000..96e21f088558
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
@@ -0,0 +1,10 @@
+[
+  {
+    "EventName": "cycles",
+    "BriefDescription": "cycle executed"
+  },
+  {
+    "EventName": "instructions",
+    "BriefDescription": "instruction retired"
+  }
+]
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 3a1bcdcdc685..0cf9d26315b3 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -413,7 +413,14 @@ class JsonEvent:
         self.long_desc = None
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # Inherit the arch-standard encoding only if this event defines no
+        # explicit encoding of its own. Events with explicit EventCode,
+        # ConfigCode, etc. may carry alternate encodings and appended modifiers
+        # that must survive.
+        if ('EventCode' not in jd and 'ExtSel' not in jd and
+            configcode is None and eventidcode is None and
+            legacy_hw_config is None and legacy_cache_config is None):
+          event = _arch_std_events[arch_std.lower()].event
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

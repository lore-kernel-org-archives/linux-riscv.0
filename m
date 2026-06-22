Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA66CDB476
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4EarKqaJwQSCRowMairDnm39H6B+mLxLMtvGuWYYqo=; b=uhu5MWFmgXUVGy
	pOQBZjXF+ZPrysfezk2xwdtCFS3ztt6ZO2hI4RfYrIA+Tv2ZTW3sX0y12izh4TdAocmNRl1/zl/5B
	rrVAZFKrroxsvan72Tw4l0bKcrdByiay1jEyfyQaR6xMGUZ783e/p97Ov/bhpETqG+7TkYOV382fb
	MiXlesQgsetgjZFluo73epAP4Fc72opcLyBNZDxC/vJs3kYDGK5sVs+9ONRT2h7SwhIaQt1jHBoob
	ge42SD/Jk41Kko9DU8Ni+76c+3pJ0oJHkx4E1UX2Vza8x4auecI77vFsYv9xXsgeD0DWBIn2NPuEo
	NvSoeW+P9AYnf9CsEfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZft-00000004d2N-1GRi;
	Mon, 22 Jun 2026 08:06:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfo-00000004crm-3fDe
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D+RY5vs8Ycg6LE30rSiyWAmudN3MbQny6JzyIGr7w5M=; b=YD0K2+TnscTNzK+tRkc2UCywNb
	tahpUoYPsgxI0cN45j03ZTVViHvWHM6snkt0HPj8uNAt0L5Px8WivA/tdbpdUCfbgO10XicK1fQFd
	Iu1fyp0X5j5bWShVBTvjXbi97oCqFe0GuxXUnYvN4/lLkyjQhPpF5TfS58hVdKhSCiOoiotYBugx0
	Pc1TqqwezlWoAYn7eDt3X8v3EKTal4SWcWscH6Bugqk5hC6sIXXFhlmc1aaqoLo1EkuAEFZh9Tjwh
	5+ZNOl3UvlgxpjE2hVKvpdAEpXDcuszPHydljexrXne4PLgyCRsZ6s5Y/Pooquj5F4sSUOA4dgdME
	V2ID36hg==;
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbZfj-0000000HALa-0cmM
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+RY5vs8Ycg6LE30rSiyWAmudN3MbQny6JzyIGr7w5M=;
	b=fSdftwRcfvqQYJbPxvrjZfWISQCYpm4LvPGTH9Y597jpo7hXpj6buWHHayRSiLiaBUdejq
	vfQx7OCoSiubni8VWDj+cl4gPVEfTD91OQ4J8dKeCIy2AXCDuk0g8ubDZIlMRwesmJub37
	AnSNfKlIm6Ju+NOwssWmJMOvDPEV6nI=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:31 -0700
Subject: [PATCH v7 19/22] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Message-Id: <20260622-counter_delegation-v7-19-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090624_406093_331090BE 
X-CRM114-Status: GOOD (  14.34  )
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
 tools/perf/pmu-events/jevents.py                    |  6 +++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index 3a1bcdcdc685..457fce7a5982 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -413,7 +413,11 @@ class JsonEvent:
         self.long_desc = None
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # If the JSON event already specified an event code, the encoding has
+        # been set above; don't overwrite it with the arch standard event or
+        # the event encoding would be lost.
+        if not eventcode:
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

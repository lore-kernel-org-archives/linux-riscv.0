Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DEFCDB46B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5I9GjBvoIaDcoYMIGPZ11cPPPb6LYrl7ZZzkYWLu0sU=; b=SDh64dQVZ3tEAk
	7kk0I6mMXFJHTXpwo1s7eeJiuO9gDmygHKBLFMV2erT27WDZIzrD0vxzClrnfry8vLMwrkVdPXJjA
	O18RzV7voXZ9SacFWY7ydPdLmSZI4RAZmjJl8BypJFxBopirM/Zs0YEpf70Aw+r+868TLGuCy/2s3
	uqTphr1MRUvL+Ps8J9vbj7/3zzC2/smsSjobhJppMuBQ4KduoL4L9lEusI/o3I1GI+vJcWXpiEQMj
	ZmZjOyuAZUTtgnphMxJjy3/LDXTUk8tMgLF3ViFqXWyHFOQXZxc1pLE5OOIIdcsatfX6gCJgaXP1S
	yTLhuM3cWGJ6XUeAjI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZg9-00000004dTV-1Oh1;
	Mon, 22 Jun 2026 08:06:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfw-00000004d7p-3vq3
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+74FvUBZxlbST9+7oM0jYayJwnBAvv8czrcrU+bwgIY=; b=ZvacWUBHyZkqLf/APeQfftG7D3
	kAtqmgacv+QupfsacOYuiCGn5ezvSY7RHX9Fa6HRK5boGposhc5wokWTPq5NuoUneldAANkTVv1wo
	mNJXO46+h7ZkSFlQKEaFwto7oJk1ALHCDxU7h0h/6nmQDgZcmevFrOzTpy3VyFCGLLD4CUXY6wM/G
	+i5xn0mFJqYBfL0qonbXejg4P4ixvxZnpBJGtmF/xANR6kZHaVc5CYrtAD53fAqVnJasA0nAsfTWO
	/cMx1/Ah5ZceDgdsbN0YA3t98ivRRB2lp3TIxlwjAEHO0WQgJsE8eng4M6IeddAL0Oep00R1tsqzR
	EyWjw0Zg==;
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbZfr-0000000HAP7-2SvA
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+74FvUBZxlbST9+7oM0jYayJwnBAvv8czrcrU+bwgIY=;
	b=MVwLbQx7QRJDcIaOMO8q6B6KLxYJWvn8OK56/ca6uQ4AD86ZCcpQY0/uqTkOq1+clGduSf
	hhT3C8Z7znxdgMYSNeu+shiqLRP5Ee4CX1JvJwa5cGMRGcxO/tfDTVwqGcR7KJiUNYX+wT
	hVESMuKdsrG40U5/bmz7cKntbiwzFJA=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:34 -0700
Subject: [PATCH v7 22/22] TEST(do-not-upstream): fake qemu vendor JSON +
 mapfile entry for CounterIDMask path
MIME-Version: 1.0
Message-Id: <20260622-counter_delegation-v7-22-0ba2fd34614e@meta.com>
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
X-CRM114-CacheID: sfid-20260622_090631_907654_05B38268 
X-CRM114-Status: GOOD (  10.47  )
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
 tools/perf/pmu-events/arch/riscv/mapfile.csv       |  1 +
 .../pmu-events/arch/riscv/qemu/virt/events.json    | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 87cfb0e0849f..3533a8c0253f 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -24,3 +24,4 @@
 0x602-0x3-0x0,v1,openhwgroup/cva6,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
+0x0-0x0-0x0,v1,qemu/virt,core
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

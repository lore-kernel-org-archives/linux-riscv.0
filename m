Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA914CDB475
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9ISisVwYleVODdPiJzZuajjhxeH4wZRU8YF3aY9dcY=; b=eJvYsFHejhFnds
	sUzmaFFY4Pim61tMDg3IXqmXr2+bGIwCyGlWz+15sf9meI0pvjTD9Eg/FE0OdV415UhFQGrn+l6p8
	TLqmhAigdVX3qycwWQNAZIlkB3VijV0+ygCHVlX8yWFyz+DSv3gWqNpDvy90vXtth1gIO1kwSqyFs
	ifBxtw7s1iS1A5oGE32nwckR4fMmSlor6iYCr/m3GZ79J288+vDnaGxWV4NbZiXHv/2jSSJhyoVxW
	6+Ay98HqqwISJfrmo11HPhfE/Reg8ldv+/AUIr/kDKTaDeu9YvqQ/HwBljLuTekbjHQ6mMW694SpL
	T5Axd064ygG+gicYmiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfs-00000004d1m-3ydv;
	Mon, 22 Jun 2026 08:06:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfn-00000004cpt-3vk2
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=m33YeEQ2LI4+9pJOZx15rtUmMH8AJOWaugqVbovodV4=; b=vEH7NQlJF6tDjx5bq/sBun8qFH
	L+yCquE33AkGrNrNJ3g2B3QOAaHM7EXBjpR6+6IOaXARqXvGfPIedXeuXwmQi9Hlo1wkrHuMttPvY
	+FD1b7yKUPdfD8gq/+WeqDab+X+WGSftIz9fOf+s36NX42Cdos89E5YO9Snm+9QxNJPdPPbFieyp/
	iUjTmBvJ2Xt3HwrB5h7LHca7/UzMb6W+Hwa1oR/qYDm5ByB2ZqdLNWtHq7eviRPSywTgeCnknZmzf
	JuFeJvvOT2C6NvReMzxNJj6foM/wKgc3ZN+Djl4Tq3PVvi0hpZHPVabLGop42Jqapal5DjbBuoDGq
	LlxehC3A==;
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfk-00000003rRp-2QKp
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m33YeEQ2LI4+9pJOZx15rtUmMH8AJOWaugqVbovodV4=;
	b=bUhMMAu3013yuPd2hGNbmhY9rJUDcI5YKJC/IW0OAsIwiQnjudzZ/8OvBz8OU077+qsWBW
	cXuDQ8Ho5uB0YncTrpD2FPj0sAsO6hX6dnp36jxoH8M1xu2GUnKmceW6RtXPmX9JyDXul9
	otcnAJU3+BEuytvc8qwarMdqXK+krAM=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:32 -0700
Subject: [PATCH v7 20/22] tools/perf: Add RISC-V CounterIDMask event field
MIME-Version: 1.0
Message-Id: <20260622-counter_delegation-v7-20-0ba2fd34614e@meta.com>
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
X-CRM114-CacheID: sfid-20260622_090625_221871_17DFCA65 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Atish Patra <atishp@rivosinc.com>

Counter delegation lets supervisor mode choose the hpmcounter for an event,
but the hardware may only allow a given event on a subset of counters. Add
a RISC-V specific "CounterIDMask" json event field, handled like the other
arch-specific entries in event_fields[], that carries the allowed-counter
bitmask through to the driver's existing counterid_mask (config2:0-31)
format.

The value is the bitmask directly so no counter-list to bitmask
conversion is needed, and because the field is RISC-V specific it is a
no-op for every other architecture's events (unlike the shared "Counter"
field).

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 457fce7a5982..c1ed8a05c9a4 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -396,6 +396,7 @@ class JsonEvent:
         ('EnAllSlices', 'enallslices='),
         ('SliceId', 'sliceid='),
         ('ThreadMask', 'threadmask='),
+        ('CounterIDMask', 'counterid_mask='),
     ]
     for key, value in event_fields:
       if key in jd and not is_zero(jd[key]):

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

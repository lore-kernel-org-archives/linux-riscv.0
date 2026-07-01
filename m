Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB0AC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9mykWLN7w3K7YDbLysIcTz/8cqeWwyVOMM91pLdVc8=; b=2NwChgXYEgdTwn
	F/62ugAT+0x7ZbVYby8l5kGdJvEGYN1rQTLgc/woBEoWxGLurUwfwh+a7EMEB9Z+5GPUeTV/JrbjD
	6v/UhcXhaEfCohOsGputHIpKINItjT3Uq8NWwrCPEFv/wY1dsLZjSdfpwSZHPPHQv5AIRkZGvuJwZ
	PeHyhx8XWiqp0RmYvjltsg+Hcz8MDiLIC563pvXVL/T4oO1M+Ynjoyjbu2sGbxCZh/iQxMlApUm2c
	CWh1Iz85cq2/YVQd6WBMjgsBO4mj+vC1GyAmDYEuBTfF6aGqibQOV1vLXKvqguFMPwf7om7E9avL7
	M5HC8NvD/eEjCwlLy5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqd1-000000016JI-1zuJ;
	Wed, 01 Jul 2026 08:49:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqd0-000000016Ek-0All
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vtg6gtjTXG/5kZ90vLQ3ZK8HeIu7FaVLNgb7sibmyzw=; b=Qdu8+rD8r3FtRE2xYcFMmeLaWK
	mAc6EzhVMg/q8Ljf6lBuSiKyATMwhUFCyn62dac/2btKNSD8ZMhFxSd35Ne5UYZLhfP+5zzCVhHrA
	ee4W+JAbAzHPpVkYBuEE41gUpO2QMpR74wfQYrOthgbm70sBEDDUI3ENvmEfm5LJXhXfRozLv/9N1
	Em5ZPkzJm3mlyq8E0mt1+c+S7aWUfSVyVHxPywvQjt2u0T9WEoO5A3mjArIQSCIBaWyfmZDULNd2D
	0/7HGPl/LkTZGQ9gq/5TZaytXjVeJ4pNuC/1ny742Rn2JfEHMWzTpfu14w94H6gj5W+soPpHjb30z
	0imLT8SQ==;
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqct-00000002WyS-26FW
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:49:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vtg6gtjTXG/5kZ90vLQ3ZK8HeIu7FaVLNgb7sibmyzw=;
	b=PVOo7ZBmM6YIM0NolMjtxLKfchiQEr7jsQyDsVfx1ILzRodHDDodTu/+8yZ/a8/ZWI+xsS
	loVXakO8WmEY/K3R/2MI5d+kkGXuY6uZti8GYMEisHs+IN0qKtKhw3y1/G2iNRPhgF8yLE
	bNBxjuDWrFbO0ZnwwXQ3Rtp1dmB6abc=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:47:08 -0700
Subject: [PATCH v8 20/22] tools/perf: Add RISC-V CounterIDMask event field
MIME-Version: 1.0
Message-Id: <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
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
X-CRM114-CacheID: sfid-20260701_094901_506271_952EB582 
X-CRM114-Status: GOOD (  11.30  )
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
index 0cf9d26315b3..516fb73886ed 100755
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

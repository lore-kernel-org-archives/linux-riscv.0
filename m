Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55F8CD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzY6wg9qcjYgQSz+Nh9/1QyEbk4TXepjBceIknE0bd8=; b=Ff9lIyR/TY5A+0
	eGLzIOS3IfK8QVIv3gzKA8Po78KdTwFOshCQX4dLpTqYOAqc6FpUyoOq2uB2lxpyuIeOPAvef3cdg
	TgVxRJ+n4YcdLvdOYaYUAYEst3e7FYs036vdSBg36ZLVSC/tuMapgoGPS05TI/M4IeT+W/7r8qQKL
	0l9i4VmnRkDy1Usgv05PN/cfMmNw4K1dUISVjZ7LaTpmCUCC3UxhfG2rmd63Avqb7gd2pFybPrWiR
	CG9tkWoFCHYDc2B4mPWG89hC88hx8Hhl5WIggmeCV+pLylzGA9sgLYSpe85PBHYUybn2oS0cgk1ra
	gDqkkoUCZzxXcKJURcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYP-00000004o8D-1px4;
	Tue, 09 Jun 2026 06:03:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYN-00000004o2g-3cCJ
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sMReWLDLXVskrK7YvKiFAJhgJ2Bnx+tOpFTmEt9zhgs=; b=gy1cqmlNX4qZajnRj2QcfT0SSE
	JQ7dc+/EqyVOprFo4uGnWzI2dFDIkGO0Rbw6kHCYJOns9Nkex2G113kOxeW3dl6pD7OJH33SnBmDU
	5M2R3ypB3GyQD17uD6jqeTaYwBZdMFaSMTWFeK+MCom1F1Nz+os8juk+EmcOSLF7+JDr46AUBRwzM
	67RMsyBonduuRsegG3DZVsu9etyzXpXkPsFLNiqQYfCrLPSsUTZLqOEBabnDJvmfHq3TmyDVG4rcl
	vNiDt3PMapzCkP2HGQjK8Lf/UgjcBRGSkbtMl7PspM29gy6RbOS3pFdFWyQgzG9ySElEPqd3zMpUJ
	Nft6RSZQ==;
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpYK-000000020BP-2ZpB
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:03:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMReWLDLXVskrK7YvKiFAJhgJ2Bnx+tOpFTmEt9zhgs=;
	b=gvRwUWkoqGKbVUgPgeiG7/g1s8sdwcUdIJLcVniP2hi4alfPvPizJHNpMvj/acPeEM//pw
	jkn9A0DD8DgGaEyoEm4GXmghWb3BktXQ2A2xZEzzXtCPKQ4SniAx95gCMnAwL5jSmAowFc
	/b6lCTnqECHLw7/opEnGd5Kii5Arzcc=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:33 -0700
Subject: [PATCH v6 19/21] tools/perf: Add RISC-V CounterIDMask event field
MIME-Version: 1.0
Message-Id: <20260608-counter_delegation-v6-19-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070309_105375_510EAFB4 
X-CRM114-Status: GOOD (  10.59  )
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
but the hardware may only allow a given event on a subset of counters. Add a
RISC-V specific "CounterIDMask" json event field, handled like the other
arch-specific entries in event_fields[], that carries the allowed-counter
bitmask through to the driver's existing counterid_mask (config2:0-31) format.

The value is the bitmask directly so no counter-list to bitmask conversion is
needed, and because the field is RISC-V specific it is a no-op for every other
architecture's events (unlike the shared "Counter" field).

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

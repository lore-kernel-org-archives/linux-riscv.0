Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ED3D3ABC7
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsTSiVkyqTcSmIsg050KviygJxTDW9iez5d/ulUuRlE=; b=FPJa1SAQ/9LhUk
	1a8s00+K92ozCoCtxXAYKzXBKaei8kWSN5R3VGXQLck7SZlNqjgp0FnSaDcUtwV/NBE7gSp+oZ8eL
	bmYX0mXKwCgfI377+26j5QFXD4XvF9J0p7E99HdOoue9kpw8Gb+cnrHHXI3GCstun/Qh36+Tokbls
	q9hqldNesH50FX04B3DpwPQzgseejcg3kCOrMx7d4dEtI4iJCS+tMx3FVRt+nVyPo1p0PGQ2Q/dB+
	sWwgqrDk9vrYstz8fUXcR+u2by05jHLprit0cnuKInCza9/nnPDJsNyAm7XUnMgnGs930fscwoNQY
	gBlBKPBlQGL3EoSQ3J6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzT-0000000AECS-0vHh;
	Sat, 06 Dec 2025 00:17:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzQ-0000000AE7M-1p2j
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:34 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34566e62f16so3089644a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980251; x=1765585051; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UxEE6YFCrywRRLGygEARIDA06aPKgmiMBn7nXQjzdiI=;
        b=2sxwtTmuZWu9mWMgDWh+OhAwHXsMx6BX2MC7ismblGafRkvY/sJ0LLcky8im/hrtlH
         NpCvP8UfgZy5y+qvSJ+4YuiH8x0eOaDaiZEPZOY+K3owuEXQBu8+10RUv3esFE/MNrfc
         lfurWkueNwB4mu2dM7dc8gcB/5gC7guY0LJ1sooKkBcop7+GoTQkO1b7zm0Ul2+ziwkD
         cjrSsYHnNPFhlkszlXDnNerpYQElY79rzbV9zVHVOTDLJ4tla0Iy/F+ioWg8mC0i8Tb4
         JfITzaXGwyVzhXj3kSAsjZCC6hRREA7IcPpD2YbPeLyvm522+a+mMQal9EynFJecvP05
         H+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980251; x=1765585051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxEE6YFCrywRRLGygEARIDA06aPKgmiMBn7nXQjzdiI=;
        b=F3zS0glJSDLlF5/xpb+Z8Ef21t2y6hv9bWayxFIzgZQJ1fQ7bkDgoR3QieJ21O/8Sd
         Q8rpGOoOeUVm9aFEkCCspMB1P9C+iVm8djlNl9rQhGQwHY25vRmPiIRY8DU1iR6NbZ+4
         JpuCXfgRbQ/OQROgbG5yTZBBsybRCGINwz9280gqOC+ofN40HsylP02W7pb/WCVXXtbv
         Gys5XAmeHYq/b1eDUxCeBZOY92CqCSvwgcQzL0l+tr2jPwQPWzVcUnrZtoKDS2YEIuJr
         OKX0BhZOmhRpfjdgyH/vS6BVl6GTfYV4ES8RTkih86rfg+tDL1IZwe8aAPzr7Lm9+ITg
         8ZaA==
X-Forwarded-Encrypted: i=1; AJvYcCXMWWW1aLL02yI/NHXQ1+/EmpVJfYkDN7vWYCMJMXyNtAes3P7pVOHD3Uq68HetylGEgyO7cTHRDzexcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMhDmWBLeKbYvq7+5fBAhg2IjRFdyP3UGBQKgWAEkDalFDzGJP
	lcCfDFWac9Wsd5SzIuZSFZuykEL0YIEjXmgfxpSimtFLQbQW0IBdzpeyX8Bn+F11ToKBRkSuaok
	yOV7pCA==
X-Google-Smtp-Source: AGHT+IHjg9edpOr3D1FDjetV+9fqRbGzj3yZXk9Coy0VtACLss4vYlJyIABW7Xcv++xOTx44sX1NPQCjnv8=
X-Received: from pjbkr8.prod.google.com ([2002:a17:90b:4908:b0:343:387b:f2fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38d0:b0:349:8116:a2e1
 with SMTP id 98e67ed59e1d1-349a25fe29fmr699857a91.20.1764980251086; Fri, 05
 Dec 2025 16:17:31 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:38 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-3-seanjc@google.com>
Subject: [PATCH v6 02/44] perf: Add generic exclude_guest support
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161732_471867_44B142C3 
X-CRM114-Status: UNSURE (   9.26  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Kan Liang <kan.liang@linux.intel.com>

Only KVM knows the exact time when a guest is entering/exiting. Expose
two interfaces to KVM to switch the ownership of the PMU resources.

All the pinned events must be scheduled in first. Extend the
perf_event_sched_in() helper to support extra flag, e.g., EVENT_GUEST.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4cc95dd15620..1e37ab90b815 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2872,14 +2872,15 @@ static void task_ctx_sched_out(struct perf_event_context *ctx,
 
 static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
 				struct perf_event_context *ctx,
-				struct pmu *pmu)
+				struct pmu *pmu,
+				enum event_type_t event_type)
 {
-	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_PINNED);
+	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_PINNED | event_type);
 	if (ctx)
-		 ctx_sched_in(ctx, pmu, EVENT_PINNED);
-	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
+		ctx_sched_in(ctx, pmu, EVENT_PINNED | event_type);
+	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_FLEXIBLE | event_type);
 	if (ctx)
-		 ctx_sched_in(ctx, pmu, EVENT_FLEXIBLE);
+		ctx_sched_in(ctx, pmu, EVENT_FLEXIBLE | event_type);
 }
 
 /*
@@ -2935,7 +2936,7 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
-	perf_event_sched_in(cpuctx, task_ctx, pmu);
+	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
 		perf_pmu_enable(epc->pmu);
@@ -4153,7 +4154,7 @@ static void perf_event_context_sched_in(struct task_struct *task)
 		ctx_sched_out(&cpuctx->ctx, NULL, EVENT_FLEXIBLE);
 	}
 
-	perf_event_sched_in(cpuctx, ctx, NULL);
+	perf_event_sched_in(cpuctx, ctx, NULL, 0);
 
 	perf_ctx_sched_task_cb(cpuctx->task_ctx, task, true);
 
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

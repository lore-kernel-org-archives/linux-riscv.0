Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A55BC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r101LTfPsJTZbkvPwVZ0YQdiKsVQfvFfKiCLdLESLY=; b=WvDO8nURk06gTt
	2vE3zCnaA3we2Dy1kV/pUM0d8xQdJcSkN13qTclE4Nvn+gY7sbh/OthASvzf5vsYtwVj1n1e+DduR
	H+1e5tu0jMRBkzyq0q29LH/R63DtZZgbX8wSFilxNWbyGO+FjZA88FJmo4M3N7vwR44hA8sjz5vCG
	LQyuzF5Ol1mPEVr99qKi9YZG1ilprgwQZrjO22RoQrFhUdeKhZQZIdAr1cSTOitMFfgsjVwqI11Op
	4+7rrpQrE/j1IaT7yP/vnu6DWa1tj/kvwPQNtg0N40+JGeLM0kTctSM0Mqj0kMDkPknnDPACaaLcA
	w1/ZkPy+jnsFAvvAFL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkYs-0000000GMx4-47Rg;
	Wed, 06 Aug 2025 20:16:34 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGc-0000000GGCf-186T
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:43 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so126726a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510261; x=1755115061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1cgAGvW2Sa5tNwASy1Md3TT+4FZc1wpWNQfNLgFp1cE=;
        b=vi/Q8Hu95WfDcJYZoldBqscOLKQ9cJKlE5V0PoZ/FaccSLy7lVb2gIyoEj2iXLU9Sc
         PJdkOZ1+Xrdaf6s8PLu+EcpreZ75e7A1ftPeMgAT+pSwdckAPzjeHpfecUh2ATvayOc6
         fGglhA67FaaCDqBEzBuyYXJt2kdA6rnYlym0kWr7wrPFmRt8piRYRp1ELaoCRmdDCEfq
         zvQEikSL292zgVpMbKX6p7tCbtZGBEFCvj8SYpGBCH4OgSL/H6TOt1EkgLvTehhVeE3M
         8jArqW2GMCUC+Ry5p+VrjU1qK02XVL0wgeRml+tU4IIpJyCpiCnU6Tv95JUoNyg4YhZX
         357g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510261; x=1755115061;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cgAGvW2Sa5tNwASy1Md3TT+4FZc1wpWNQfNLgFp1cE=;
        b=XVxtpSp/DC1g2V5tPbGoG2ZWStApja59V1m/28nFY/pm/BKa8ou09ZywET87Os18su
         q4QF8uwfMwX+tEUd2DujedxyNkubRPIuZjCcLCJh6JkWkU2lKDbhha0aP4NoY5isAUxc
         z18F0QVMzMeGQPeRvkbK8zG+csdWprGQGYdqdwcuukK/9LRif8BpDoOKdWkDXc0tQAuv
         HzU/CzUV8ZvPe/DtKtDGuzgQCrz2MMD2UGST7+RGbYdSJtBX6pWVeRW6AwqAKajhR4Gm
         Vk2D7MhLdShhtpOC4DHo6NpIUk8jTmLU0MH68ShOCcabC1fsOcCWm2mPbeE8N1XWHff9
         RE1A==
X-Forwarded-Encrypted: i=1; AJvYcCWtiIJgKnxZ72F9bMrA378xiHWet+NZ557Z8zlvLKfHhhPdZ6uWBZnv4aVJSlElpjDcAGUXi+7m1G2reQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTfjk4CdYLdDeCpyYPO9dHLCes0wgiZDRp6Vb46qmFLok+G/IJ
	VecX662wRSnwtk772EKBimiHtN+jl0MSdidFz49JsYScCPfb+oUhJFZ1tQyDfkiWZtu+xpH9e92
	WvU1yVQ==
X-Google-Smtp-Source: AGHT+IEQshj25YWfgh8jlPDalwm585npWoyFxUPXBG4oqUn1ilItXjqTi+CTUz913BcUQcsY19RFz/4rdM8=
X-Received: from plrj9.prod.google.com ([2002:a17:903:289:b0:242:abd5:b3bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c405:b0:240:b879:fed2
 with SMTP id d9443c01a7336-2429f55daaamr65961135ad.16.1754510261485; Wed, 06
 Aug 2025 12:57:41 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:29 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-8-seanjc@google.com>
Subject: [PATCH v5 07/44] perf: Add APIs to load/put guest mediated PMU context
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125742_311662_FF527CDF 
X-CRM114-Status: GOOD (  11.92  )
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

Add exported APIs to load/put a guest mediated PMU context.  KVM will
load the guest PMU shortly before VM-Enter, and put the guest PMU shortly
after VM-Exit.

On the perf side of things, schedule out all exclude_guest events when the
guest context is loaded, and schedule them back in when the guest context
is put.  I.e. yield the hardware PMU resources to the guest, by way of KVM.

Note, perf is only responsible for managing host context.  KVM is
responsible for loading/storing guest state to/from hardware.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: shuffle patches around, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h |  2 ++
 kernel/events/core.c       | 61 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 0958b6d0a61c..42d019d70b42 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1925,6 +1925,8 @@ extern u64 perf_event_pause(struct perf_event *event, bool reset);
 #ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
 int perf_create_mediated_pmu(void);
 void perf_release_mediated_pmu(void);
+void perf_load_guest_context(unsigned long data);
+void perf_put_guest_context(void);
 #endif
 
 #else /* !CONFIG_PERF_EVENTS: */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6875b56ddd6b..77398b1ad4c5 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -469,10 +469,19 @@ static cpumask_var_t perf_online_pkg_mask;
 static cpumask_var_t perf_online_sys_mask;
 static struct kmem_cache *perf_event_cache;
 
+#ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
+static DEFINE_PER_CPU(bool, guest_ctx_loaded);
+
+static __always_inline bool is_guest_mediated_pmu_loaded(void)
+{
+	return __this_cpu_read(guest_ctx_loaded);
+}
+#else
 static __always_inline bool is_guest_mediated_pmu_loaded(void)
 {
 	return false;
 }
+#endif
 
 /*
  * perf event paranoia level:
@@ -6379,6 +6388,58 @@ void perf_release_mediated_pmu(void)
 	atomic_dec(&nr_mediated_pmu_vms);
 }
 EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);
+
+/* When loading a guest's mediated PMU, schedule out all exclude_guest events. */
+void perf_load_guest_context(unsigned long data)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+
+	lockdep_assert_irqs_disabled();
+
+	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
+
+	if (WARN_ON_ONCE(__this_cpu_read(guest_ctx_loaded)))
+		return;
+
+	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
+	ctx_sched_out(&cpuctx->ctx, NULL, EVENT_GUEST);
+	if (cpuctx->task_ctx) {
+		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
+		task_ctx_sched_out(cpuctx->task_ctx, NULL, EVENT_GUEST);
+	}
+
+	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
+	if (cpuctx->task_ctx)
+		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
+
+	__this_cpu_write(guest_ctx_loaded, true);
+}
+EXPORT_SYMBOL_GPL(perf_load_guest_context);
+
+void perf_put_guest_context(void)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+
+	lockdep_assert_irqs_disabled();
+
+	guard(perf_ctx_lock)(cpuctx, cpuctx->task_ctx);
+
+	if (WARN_ON_ONCE(!__this_cpu_read(guest_ctx_loaded)))
+		return;
+
+	perf_ctx_disable(&cpuctx->ctx, EVENT_GUEST);
+	if (cpuctx->task_ctx)
+		perf_ctx_disable(cpuctx->task_ctx, EVENT_GUEST);
+
+	perf_event_sched_in(cpuctx, cpuctx->task_ctx, NULL, EVENT_GUEST);
+
+	if (cpuctx->task_ctx)
+		perf_ctx_enable(cpuctx->task_ctx, EVENT_GUEST);
+	perf_ctx_enable(&cpuctx->ctx, EVENT_GUEST);
+
+	__this_cpu_write(guest_ctx_loaded, false);
+}
+EXPORT_SYMBOL_GPL(perf_put_guest_context);
 #else
 static int mediated_pmu_account_event(struct perf_event *event) { return 0; }
 static void mediated_pmu_unaccount_event(struct perf_event *event) {}
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

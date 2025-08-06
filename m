Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF94C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+dVXoQE+YCYf/aR5vwfuQGTN+Od+e+KmCdPKym0yAE=; b=kI9vffi4sZos6s
	FVP/2TrvUArI79/QdD/aQrE6gxPgSkaWaXmataEV4MSeG4ghUKw6nLrQT5VMfxe0JeCl35qaAHL3c
	MU12PnhqO45fgQdYVKWOAQL2NHGjk81ESE30tIkWZ+UOd46ap9SvtWjpEu+jXtx6CWmMJpc4olXRf
	Gfza3N9CoFs6ChqguU/UrHt5iqXc+Gx4uAz+btysrMGYC96ma3Mb56xMf0CWpKSi+vg4t8w0Wed7H
	Baou0u/GajOP88sW93yAS81W/oOk9pBz6lfrHMsd4i66nMRSD2kuHyQF7jk2F8Q67fgEo70gNigr4
	rOB/kjhZgM8aCA4oOvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujl83-0000000GTzY-3KxP;
	Wed, 06 Aug 2025 20:52:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkH2-0000000GGZf-2mVy
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:09 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31eec17b5acso271633a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510288; x=1755115088; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=x5qdlfMt7f/v/zSfpvn0pZJb5j/BJcw1RvQoZStHDYU=;
        b=TevjD8t2+KKYQb9OPR69V/gDazez5+MRFYSBwLQgMdkBQSVvxoLVHYjCbqkPq08XVd
         /8U106JqhQNA4GArG7/e2zfh006/WGqM8D2bgcjLIJvWes+5U/yIE7VnNLnCASYvg2Ry
         km/WHpwMfIlP+P6e5x1pMlzuAAX7ZMSr5AT5DeFHrx7dOdh+fW8/kKWJD+hK6cNI7gtT
         ej4iwbKzig6BXwDohl2Rerwz6iq/7noOFvd+edgOpeNoykHSmMrWqzxyPta0xhZnjlvl
         ZzJxRLVozX85MBnsNslM5IqzLnl8RJ5vanKiPUePydSkpvRRIIoD+Vy9fcsFpQihEcfK
         Xlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510288; x=1755115088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5qdlfMt7f/v/zSfpvn0pZJb5j/BJcw1RvQoZStHDYU=;
        b=BicEahgL7NmbH5qLruEjZCDqoEnruCBY7AvtDOHT9P20vJKBJClegjgboGpCjBaN0c
         RVwP4VA/3KauNxqIjd3gjARhhEBSy8pMtxPmec0jZHXhBBDRowqgRdukZOdvxPWaQfG9
         MQ8v8ZqGPPjnKoE5XUvo7RrN9/m5nRzDSDzUP8OxDeZhdqlmhotAMgvpS6OiEBk+N5dK
         W7Tixy8ZolxBMw7oZ2st9JBm9FV3wTBf5FToP1Wk8mVrfsCXRQFBAWwRzRBhUlq4fk7U
         X4aPFyA7iKRHynOlNtrCtoHOO7C/uVSf2p8EFwkjBEpaRZeyep7TLRni2XOxNBZIH1vc
         RQwA==
X-Forwarded-Encrypted: i=1; AJvYcCXyep6gr9NEJc6vOHCpQi+/cQGL2vIXnSZQgApWso86WrkJ8kfxnYQjQ7ew12iNMVFngyCHMjYEKOGSCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ2dX6cfoPHkIGKHevHqMeWqKGLfAZqINqGB6dTdoGBKsvfb/U
	oAriB8JBAoDOSWhppjtsD9jOCGbwyCJv8KaH6dWyM6vVHUgarLZiEWGC6d/j7YKyo6fzQgTJLG2
	YSyQtwA==
X-Google-Smtp-Source: AGHT+IFfF+d9RBweWfYhERWBY7pftrU4yG2unJrGI6enSH3CQtm8m01r3mZaRpes0DVZoNbRLzozGADRUKg=
X-Received: from pjbeu16.prod.google.com ([2002:a17:90a:f950:b0:31e:dd67:e98])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac1:b0:31e:f193:1822
 with SMTP id 98e67ed59e1d1-32166ccac82mr5178351a91.28.1754510287763; Wed, 06
 Aug 2025 12:58:07 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:43 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-22-seanjc@google.com>
Subject: [PATCH v5 21/44] KVM: x86/pmu: Register PMI handler for mediated vPMU
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
X-CRM114-CacheID: sfid-20250806_125808_707180_9578ECA6 
X-CRM114-Status: GOOD (  14.39  )
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

From: Xiong Zhang <xiong.y.zhang@linux.intel.com>

Register a dedicated PMI handler with perf's callback when mediated PMU
support is enabled.  Perf routes PMIs that arrive while guest context is
loaded to the provided callback, by modifying the CPU's LVTPC to point at
a dedicated mediated PMI IRQ vector.

WARN upon receipt of a mediated PMI if there is no active vCPU, or if the
vCPU doesn't have a mediated PMU.  Even if a PMI manages to skid past
VM-Exit, it should never be delayed all the way beyond unloading the vCPU.
And while running vCPUs without a mediated PMU, the LVTPC should never be
wired up to the mediated PMI IRQ vector, i.e. should always be routed
through perf's NMI handler.

Signed-off-by: Xiong Zhang <xiong.y.zhang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 10 ++++++++++
 arch/x86/kvm/pmu.h |  2 ++
 arch/x86/kvm/x86.c |  3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 4d4bb9b17412..680523e9d11e 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -155,6 +155,16 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 		perf_get_hw_event_config(PERF_COUNT_HW_BRANCH_INSTRUCTIONS);
 }
 
+void kvm_handle_guest_mediated_pmi(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (WARN_ON_ONCE(!vcpu || !kvm_vcpu_has_mediated_pmu(vcpu)))
+		return;
+
+	kvm_make_request(KVM_REQ_PMI, vcpu);
+}
+
 static inline void __kvm_perf_overflow(struct kvm_pmc *pmc, bool in_pmi)
 {
 	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index f5b6181b772c..e038bce76b9e 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -46,6 +46,8 @@ struct kvm_pmu_ops {
 
 void kvm_pmu_ops_update(const struct kvm_pmu_ops *pmu_ops);
 
+void kvm_handle_guest_mediated_pmi(void);
+
 static inline bool kvm_pmu_has_perf_global_ctrl(struct kvm_pmu *pmu)
 {
 	/*
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 396d1aa81732..2c34dd3f0222 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9693,7 +9693,8 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr,
+				      enable_mediated_pmu ? kvm_handle_guest_mediated_pmi : NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

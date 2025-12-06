Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74018D3ABC4
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bW4CzuNVL15EgiscO3O2hosoQxEpmCEwow9ceCgHISM=; b=o08EbavBMdQF3M
	/CWNHvQKUFiME89c8AKBhlj4Sy1Q6j0Z+wi2tVRK7PJmIL4FC6WXLCQ5K0EBhQdQywoB6/lAQ5l1T
	ptchNhPxRsIuv8dAFcl4nKOtr8Um0Y4W84uoCIa2m5wZ0IttWLDAfji0DJI3nONaCP+uiU9EenFfP
	qZNLWM8PBNcesl/2VAH4B67Bbfvc82zcuuKu8ED69BvWR+g9FNtRprCc1iRrM/S4UlIAVtc0EdPrs
	Vr7nYTXu+/KAWqiKf1C5UERwQke96MjxJsjBmI5CsxC5wq67iAcFw/H+2Tpwa6/NOlC2TI319+5Ka
	C7eUB2KCbXwyr5V/ltpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2D-0000000AJIc-2yvz;
	Sat, 06 Dec 2025 00:20:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0f-0000000AG9I-3z50
	for linux-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=; b=kYbIQgmDekdXf8MWLbZEcTSguZ
	MbbY9t36l4AZptDIp5icAZxDuk4PVn/LVgI8jPqaikHmWN5dSjuGmNftmjfbH+odPr8b+2+WEQYkV
	RzjD9xOJ1pKF9qkKNAiWjsQ1aq0NjgbOHEnyNSluao4HMzamF2XEUhbwCiGX8oHxkWb8ocqW1tuUM
	Fry8ILfABZTsquSI+gQyRMpl/DKoMYNl3xMf+uwasYIv6nUsw9QV+JEqYJi28Xf1RMhtWOd5Qfgj3
	ATYLj6upBFnM90gr+b5MwSPc8SRaAA3tn6EZm5v2qp8FLAy43zoWCfjywRTY9bdJs8qh3YG22e753
	pk8bErzg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf8b-000000072du-2mQS
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so2996585b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980284; x=1765585084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=;
        b=Daf0/+FzQHnfhJVPL0EETwcJ7ZgXp8nufDZL5mMjhTClQzvNakRK+cowK/YH2SYl67
         Lh2uW1Sx5pYZWn9uZ1Re0EvP0RbV+i0VsF8Zs0tW44mVnX8iE/wcJ4SDDPVQFN/16rgI
         02yiEg9EZN727dvyCQsADpOxqFIGPmpLRe2XnvfthWAZyBghKZvfhJ0U/Ee+S1ho9K5a
         NDmIcjHkDOVWEanKOyWqba422+BFB8Vb1ibMTnjqNlXzlqPXbmznWJGssYtFKShIwkCf
         Ho4NyoBAtoloNm+mbHAS/zwsf4T9vyfcqCRp95Z0LuzeAAPZX4IOOv8rtUQyd1XgOxvZ
         01HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980284; x=1765585084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Updb/Jfn2dAHBrhkdzkPSsR6YWK/TllPUiDQA+O1aSA=;
        b=iXkN1Q3IeS+9I38WjhusNBUu5GW83YD/P+9xGKHfarH5JCf4mEZlkBTFMdRu6BbNvW
         0mNxnoz4gCUmzdkXrlasUdP2aPx9PYCWIfgKYTXIDmzufSgg2m8y5JpMRpDpngp4XKxP
         19malt2wugkuhZCWwgXtermQ57Js7vGlwNxEfabKJCZVOrVtl8As5qyB02rzIFBvz+2F
         yhX+vE1fcjby47dtwNUbU+sr4AoWnh1ZDAJusJwRH9Wi1BnDkFyRKjTDXojVfG7zqihR
         5jz9ujhCnvMh70B3k+izr1OeJyKbhLKEmjrD6kCATkQxNlEoo9DoCu+bM07/6WNjcWcW
         Dlfg==
X-Forwarded-Encrypted: i=1; AJvYcCXIl1pegahVr8pc3UcLg5ctUnhxZQmS6NJ4D6vSzsRrSlyUDHu0CblLnK0DD6W+wwtBgDtLnCONfQnsPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvw4O4GgIaxgaC3RV6yvEvkkkgZQ250Ih5oZvF+6eOZSKfmvqa
	pdqnhELGe+RvRYuMyVX+z/YCE1xZjyXvuEkqlk+HwHRyXlgCFkMAma1sxYqHuXgwNL1K2yFbj0t
	zbV4qXQ==
X-Google-Smtp-Source: AGHT+IGmx8a/eJZmORgvkEWVhn/uP5dbhmnIbP0XRDK0XcrnLs6A3LdHJHErdqkr+RZXqUaApvjJvO7ayAk=
X-Received: from pgbdp3.prod.google.com ([2002:a05:6a02:f03:b0:bc8:5648:d6bf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8187:b0:366:1a2c:6f91
 with SMTP id adf61e73a8af0-3661a2c7805mr309067637.4.1764980284548; Fri, 05
 Dec 2025 16:18:04 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:55 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-20-seanjc@google.com>
Subject: [PATCH v6 19/44] KVM: x86/pmu: Register PMI handler for mediated vPMU
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
X-CRM114-CacheID: sfid-20251205_232324_765708_EE3F667D 
X-CRM114-Status: GOOD (  13.56  )
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
Tested-by: Xudong Hao <xudong.hao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 10 ++++++++++
 arch/x86/kvm/pmu.h |  2 ++
 arch/x86/kvm/x86.c |  3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 0de0af5c6e4f..b3dde9a836ea 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -159,6 +159,16 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
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
index a5c7c026b919..9849c2bb720d 100644
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
index fb3a5e861553..1623afddff3b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10111,7 +10111,8 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr,
+				      enable_mediated_pmu ? kvm_handle_guest_mediated_pmi : NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

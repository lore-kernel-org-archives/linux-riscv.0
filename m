Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702AAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:22:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36DAE61152
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36DAE61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9OckG3t5NsnJWiAxE3R2St8MRRNSiyigrUNqIBkBek=; b=EHLP5CZUWi7/F6
	q4VFPSaRz2zSVeljjSduBioewQeqS7K2cgO/0GKMLyZW2NIX3GFh44W9fUtLRAjFdqxnIa+T5LgXb
	ChZooa7BijkmQlWXfd5XhuCWezKZFWNxFHlqkQ1yPK2CcaYOv7Iasy1Y0iMIvnooKwPbsFhRd0o/D
	CPdXO6GATJnW0k/NyLTlnNgBHXy3YSqbRmvyxH2Frz+9Dl1adE8fcITaE2bVqNUHBC0FomPGF93v1
	bZt+vk3oYfo87agyr+aQqb3uAl11aX8l08AYL0f3ZrXu3oz6EjwJBraDtDaiMwSkkQWSFDyE5C54z
	9Ef2LNW5ZWKMCEhMxXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkzjh-006qa9-Iq; Thu, 11 Nov 2021 02:22:45 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVW-006kfG-PM
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:08:11 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 q29-20020a631f5d000000b002dfcc4e0201so603715pgm.3
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=/YIqAIDcHFuwAQfZoGFGpCQkR+bed1xlNZgqyVQf28E=;
 b=e7isaWxZT/WwPXJW8Qx7YWkAPbx8+WwYXnyULWOmnQdcxssVcaIQUjV7l9ocfrzj/1
 z1dBSLWak0xiQCBEw4pQBZlvDqmdEqTRJUP+Z40PCX/NEachrYFN0ukP1ZGzNNDz6hC8
 ypXPhlkEqsMB53P1s/G0Q8Dg2n01FI0WXWYQbrYIvGu6VNt899fuhgkx/Wx+L0fumdK0
 DgUKSgQ9NGEeMAWRcQat/qxuE6PEmuWNOgqyoFgMMRQ8e+j8axNSLg3wwL/mVfqWCfju
 QtZrvT4+EtSeFefALo6da9zs6M611OWSowxrRuYjpqYPmBtDlX0Y/PjaKJe2gSlYH6Gm
 X8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=/YIqAIDcHFuwAQfZoGFGpCQkR+bed1xlNZgqyVQf28E=;
 b=4E/BtouNjXTXCDjr0HOesU2j5k+QdsTjDW7vhWeH5hixDnhjPqKf0h/qJyWzcUCQTF
 VNaJg1oMibYlStRsEc0pQE3uINvlPJxlb6a+0aTgcH50Fpk8hpe2z8rVOFXutemqkVc8
 hfHG3lBcOeedKnKbq6EfbekFoUlrHqOU+Ks96bcSlGUrw1bL4PCtsAIhIzrZcSzXQl9O
 mFgRegtGt6b8vGpnjQGlDJgW37rkYAxX186p69GycBXy5cg1ULqEGyjYw/jhvcOB7my9
 iFtbB04tXE69/zuweuHorf/KRMkakNxobqAo0/vIk4DoZkVHBEbJRwZaZtU8vZztCW/W
 oYdg==
X-Gm-Message-State: AOAM5327+niNq3o4tbV3QoCRqqjrfuXjNhZ2ONupts3C6Aq+y8k074RE
 K7wjsVAVIEgpwH/x7c5Bgz7HwJiYG/8=
X-Google-Smtp-Source: ABdhPJzNTXRg0manAu6ukUacQ/aIuXahOUAgZ+nsuAEIEEiY7jrc1n1CQ1z/uBehVd+2Ly8STcnpos0K1ss=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:e88a:b0:141:dfde:eed7
 with SMTP id
 w10-20020a170902e88a00b00141dfdeeed7mr4246270plg.17.1636596485366; Wed, 10
 Nov 2021 18:08:05 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:36 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-16-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 15/17] KVM: arm64: Hide kvm_arm_pmu_available behind
 CONFIG_HW_PERF_EVENTS=y
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_180806_870900_DB4B408C 
X-CRM114-Status: GOOD (  12.30  )
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

Move the definition of kvm_arm_pmu_available to pmu-emul.c and, out of
"necessity", hide it behind CONFIG_HW_PERF_EVENTS.  Provide a stub for
the key's wrapper, kvm_arm_support_pmu_v3().  Moving the key's definition
out of perf.c will allow a future commit to delete perf.c entirely.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kernel/image-vars.h |  2 ++
 arch/arm64/kvm/perf.c          |  2 --
 arch/arm64/kvm/pmu-emul.c      |  2 ++
 include/kvm/arm_pmu.h          | 19 ++++++++++++-------
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c96a9a0043bf..7eaf1f7c4168 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -102,7 +102,9 @@ KVM_NVHE_ALIAS(__stop___kvm_ex_table);
 KVM_NVHE_ALIAS(kvm_arm_hyp_percpu_base);
 
 /* PMU available static key */
+#ifdef CONFIG_HW_PERF_EVENTS
 KVM_NVHE_ALIAS(kvm_arm_pmu_available);
+#endif
 
 /* Position-independent library routines */
 KVM_NVHE_ALIAS_HYP(clear_page, __pi_clear_page);
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 374c496a3f1d..52cfab253c65 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -11,8 +11,6 @@
 
 #include <asm/kvm_emulate.h>
 
-DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
-
 void kvm_perf_init(void)
 {
 	kvm_register_perf_callbacks(NULL);
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a5e4bbf5e68f..3308ceefa129 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -14,6 +14,8 @@
 #include <kvm/arm_pmu.h>
 #include <kvm/arm_vgic.h>
 
+DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+
 static void kvm_pmu_create_perf_event(struct kvm_vcpu *vcpu, u64 select_idx);
 static void kvm_pmu_update_pmc_chained(struct kvm_vcpu *vcpu, u64 select_idx);
 static void kvm_pmu_stop_counter(struct kvm_vcpu *vcpu, struct kvm_pmc *pmc);
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 90f21898aad8..f9ed4c171d7b 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -13,13 +13,6 @@
 #define ARMV8_PMU_CYCLE_IDX		(ARMV8_PMU_MAX_COUNTERS - 1)
 #define ARMV8_PMU_MAX_COUNTER_PAIRS	((ARMV8_PMU_MAX_COUNTERS + 1) >> 1)
 
-DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
-
-static __always_inline bool kvm_arm_support_pmu_v3(void)
-{
-	return static_branch_likely(&kvm_arm_pmu_available);
-}
-
 #ifdef CONFIG_HW_PERF_EVENTS
 
 struct kvm_pmc {
@@ -36,6 +29,13 @@ struct kvm_pmu {
 	struct irq_work overflow_work;
 };
 
+DECLARE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
+
+static __always_inline bool kvm_arm_support_pmu_v3(void)
+{
+	return static_branch_likely(&kvm_arm_pmu_available);
+}
+
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
@@ -65,6 +65,11 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
+static inline bool kvm_arm_support_pmu_v3(void)
+{
+	return false;
+}
+
 #define kvm_arm_pmu_irq_initialized(v)	(false)
 static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 					    u64 select_idx)
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

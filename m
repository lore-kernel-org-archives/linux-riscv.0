Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D42C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkBEQg3lt5M+YaxB8we1yxU0XjQUop/QG3SWBGNsjJc=; b=CecksKwaSwcnfX
	Yh63B/FlcMjkqlZnyF7W47FQvAgPnMnsuNeJI21Q3Iidx4D8AdsSKrCFqyxQ9DUIPayG3/MG1EtbK
	1gJOQH/yHUIco7CIe7Jcz6BPlulHcXQAAhFCIFtQWh2ttKEhm/j2fMgLKbNz6RGYggwhpI7qJBHcF
	jv8a1jHZC6pHGfqe4kMu4qhcD6uHbh8udkwdUm42LRvNo6GMLmZnTn6LT0oxfSK6OA0yBcvgkPsgl
	xtjYCrqJx1Y9Lff4G7iq/2wV6hM5fILHm9jn6d//MK5mRdt4eLITe+1Ui/yuRaXOl6JPi5COivpI/
	aFBfH/XlqAggUX1cRNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlUd-0000000GXrX-1bNw;
	Wed, 06 Aug 2025 21:16:15 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHJ-0000000GGpx-05O8
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74ea7007866so241586b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510304; x=1755115104; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=;
        b=yVqCebzlvhxYCb9oLxcB6zfXuCGmbjp0RbxfQZl1jDKDxTWxwNA8cA2gYncu+rWO/F
         v8BujA++oasKRplYGb0jTXX3iOgNHI4nBwW5N+BsHkbNv5M5KzxV0YUt6IvD7HcWSrzh
         jQlq0WGrSw7hAW3wn4jGoUin1vEHCoymxyb649nSEAnoYD93VkRKlxEDKy/NewqjGjwc
         HPIAOQ3iXbIvJ424QownECiGCA4ssz9xr3mLP9i8DISqZCron5os/ZbL4WeUr8yCO8Mr
         D34ELvnSSszHPU6ue/gMXqBK8LY5s2mwhiRRAXBNzeEzhzZDKOZh6KmOmchDQTl97pxK
         dhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510304; x=1755115104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=;
        b=DsByDckozBzi6IZW8FjdpE5hCjHiOcCVra4ePdzQghK4onFMYI09MkkqOodqGGsnN9
         U35mo5qqPdR1zgtbdqTTILP3XhziLZBJuaCmVtq+3EDwNNtgDsUbb+Zl5fJkNFoeHfXu
         WDD7YvB062GgB1zubptHvC0Lbsarga4RJWXsrQCCqkbU2QaizSEVD/Rt2RaYZry1Isq6
         7bbJ0atE0MNOTTOy5Njzwmgz/aWrWEpVHXrfWxkzNRMm74RhOmPOzhIDdbJUTGuAKY1Y
         tlwKewXAVosuhbZqcf6z+spU6bs+y7qrHkIltgx8fngqRh/W0VfmvczdQZkcNF+whJrJ
         8jrw==
X-Forwarded-Encrypted: i=1; AJvYcCV6zVAUAbl1VWbKcnayV2scXWyZEdAA81Xohuvp04I/p9bu6WEzl7/+eRllk7vFMDJyzpzhyQ/YxvLNfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzGKkDvjih46OjEWNZGt3FOjzdtCQr3/Zx2FhWNAPclRQfm4LT
	ocKX0Rd5BCeskfLpsGU4zBObBeWV3+qrd9WIVy2XxSi+PcjA893xh66ijHHZFT0+kPNQaWoJjTx
	rH/WGjw==
X-Google-Smtp-Source: AGHT+IGfcxFcqE+WO40f0G1jJJ785vOiC3NUhX/6TGZEyq4CvV1J0auJAX6NhvanreP79iKSuzsragVBkJw=
X-Received: from pfvf15.prod.google.com ([2002:a05:6a00:1acf:b0:746:3162:8be1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:999f:b0:220:78b9:f849
 with SMTP id adf61e73a8af0-240331272admr5902393637.24.1754510303927; Wed, 06
 Aug 2025 12:58:23 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:52 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-31-seanjc@google.com>
Subject: [PATCH v5 30/44] KVM: x86/pmu: Move initialization of valid PMCs
 bitmask to common x86
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
X-CRM114-CacheID: sfid-20250806_125825_079730_E18BFA90 
X-CRM114-Status: GOOD (  12.78  )
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

Move all initialization of all_valid_pmc_idx to common code, as the logic
is 100% common to Intel and AMD, and KVM heavily relies on Intel and AMD
having the same semantics.  E.g. the fact that AMD doesn't support fixed
counters doesn't allow KVM to use all_valid_pmc_idx[63:32] for other
purposes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c           | 4 ++++
 arch/x86/kvm/svm/pmu.c       | 1 -
 arch/x86/kvm/vmx/pmu_intel.c | 5 -----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index a4fe0e76df79..4246e1d2cfcc 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -932,6 +932,10 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_mediated_pmu(vcpu))
 			kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
 	}
+
+	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
+	bitmap_set(pmu->all_valid_pmc_idx, KVM_FIXED_PMC_BASE_IDX,
+		   pmu->nr_arch_fixed_counters);
 }
 
 void kvm_pmu_init(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index b777c3743304..9ffd44a5d474 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -209,7 +209,6 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 	/* not applicable to AMD; but clean them to prevent any fall out */
 	pmu->counter_bitmask[KVM_PMC_FIXED] = 0;
 	pmu->nr_arch_fixed_counters = 0;
-	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
 }
 
 static void amd_pmu_init(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 6352d029298c..1de94a39ca18 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -579,11 +579,6 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 		pmu->raw_event_mask |= (HSW_IN_TX|HSW_IN_TX_CHECKPOINTED);
 	}
 
-	bitmap_set(pmu->all_valid_pmc_idx,
-		0, pmu->nr_arch_gp_counters);
-	bitmap_set(pmu->all_valid_pmc_idx,
-		INTEL_PMC_MAX_GENERIC, pmu->nr_arch_fixed_counters);
-
 	perf_capabilities = vcpu_get_perf_capabilities(vcpu);
 	if (intel_pmu_lbr_is_compatible(vcpu) &&
 	    (perf_capabilities & PERF_CAP_LBR_FMT))
-- 
2.50.1.565.gc32cd1483b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

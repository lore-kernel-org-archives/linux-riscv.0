Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB677D3ABC4
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6+5w34EZ7vobUEFuI3764eV5vLwGf+aBCwiy5yZG5c=; b=DCYJyWNrV4fGaN
	FyQKupxbDIgWNkVdCJvl3yIRppvnSPWJ+xagRQXXdvuB5Rh3FRCQOut0xPOc2SH9IxZbsmcM1q8KJ
	p4o6Ra+mj+6p1tj1sDQk4oubyjVQIEUkIWKIvH6vsJF03mS4dnl8uVYW9I+4uJ3tOHxWQ9HezHhwZ
	OxcdOI1iFKikTIk73g0PCmP3BGn7+7HStn9FDDHb3++QTPF+RcUe8wkP6K+UDVc6kgNg+jkhPuRvh
	UENNXYLAl7al3BHP/P07H0UabRy2tql4WBTRNcPj/l4z8PxCLNeUA05nv3/wZZw6KVGps/ra3Ba6T
	4Jof1jiX5LJC1W2X/ItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg12-0000000AGo4-2Hvm;
	Sat, 06 Dec 2025 00:19:13 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg01-0000000AF4o-28z1
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:11 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso2476933b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980286; x=1765585086; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3tXwFHzylPZMGyN6KBlqBM06kqQeDyKKeii7TB3ROVw=;
        b=ZmomUMUbWxS+w9C9+K1yM9uBfcBdjk5voRRGNgb/zzVVqjBnet1OidFu34KQ5eJxBw
         TjVDQkhcjSxywKgVlfHLZMVBhL05o9piaL4WY3HaHJKzayj+o/yYA8UPZT/MQGrh4zs9
         2ZXVPjVdQooOUgcLE1ZeZmRzlKMoNzEqQgGloqNkqKGwObR+bjwueGAu119HnjH7kj/E
         Wz9SYBOKP7YQrEIQRSCKecYwYkPh2LRuQ9/doYxlpB+jqziuRPVS9vl0JN9SwHabkKLi
         TGEJSqqtvHtwbX3YITe3Tx1Ez7R0+6t4HDjX57r7oW8HYz/HnIW3c328kCJ7Lh1+LgZf
         wIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980286; x=1765585086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tXwFHzylPZMGyN6KBlqBM06kqQeDyKKeii7TB3ROVw=;
        b=lBJwzKdEDr1az0J4MtyNe7r610o9DjDg7Wfxl+lbi/NtvZBbY9za9mhHKijL8bk4+S
         amu4Zk29ANvtKtlUNOEklqhsllANWMT6Z0qUeaXGw7s4iRuCZIkw4RjHdC4+AR7b3V9+
         Gs2K048qmj7DWuz1edA1+1tafh+i67sn0unHHX27wuIqldszQlHaygzcosMANp5NwWUz
         mVe0B0sLx3OqXKn727ceyypglg0ynTcAmM0CV03VGtHPMWvCTDpS4DRXzD+b8mx7u48D
         EEedGZUaikxGTKCoJA0IGAOJPNSdkL6UCb8WPr8CESuu5LcreBoDmwp53LUrk8vPo4bK
         HZIA==
X-Forwarded-Encrypted: i=1; AJvYcCUUylLy9H9EUBR1vgdhnsN3g6u1JMgDabn+R3gn3IpwgYMkw+AZm+BeC3x5dMolUYYobW0T3clRLsWtrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxysGY6LD5HnQq/hp0c9H2s/zC0o4bBpaTGF3NK7xYxSpOMhgGB
	mfxhYE90/szrQUUxcp7Zi1OG8X/kW8RRmwQkzTg1ym8n1b/AM5Nekdmy1/6VlqyoyNICGfDfEME
	QoHQpgg==
X-Google-Smtp-Source: AGHT+IGMO0B+jqPHT7+9YfCBpeq9zR/PklORB8CpAuE6Up8hoHfkAh/+97jt6V2KW+WqsentqXikVA61obU=
X-Received: from pfbdr8.prod.google.com ([2002:a05:6a00:4a88:b0:7ae:973b:9f29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:14c9:b0:7b7:a62:550c
 with SMTP id d2e1a72fcca58-7e8bf858c3dmr849285b3a.1.1764980286427; Fri, 05
 Dec 2025 16:18:06 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:56 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-21-seanjc@google.com>
Subject: [PATCH v6 20/44] KVM: x86/pmu: Disable RDPMC interception for
 compatible mediated vPMU
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
X-CRM114-CacheID: sfid-20251205_161809_609560_FEFC1B4D 
X-CRM114-Status: GOOD (  12.99  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Disable RDPMC interception for vCPUs with a mediated vPMU that is
compatible with the host PMU, i.e. that doesn't require KVM emulation of
RDPMC to honor the guest's vCPU model.  With a mediated vPMU, all guest
state accessible via RDPMC is loaded into hardware while the guest is
running.

Adust RDPMC interception only for non-TDX guests, as the TDX module is
responsible for managing RDPMC intercepts based on the TD configuration.

Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c     | 26 ++++++++++++++++++++++++++
 arch/x86/kvm/pmu.h     |  1 +
 arch/x86/kvm/svm/svm.c |  5 +++++
 arch/x86/kvm/vmx/vmx.c |  7 +++++++
 arch/x86/kvm/x86.c     |  1 +
 5 files changed, 40 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index b3dde9a836ea..182ff2d8d119 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -716,6 +716,32 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	return 0;
 }
 
+bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	if (!kvm_vcpu_has_mediated_pmu(vcpu))
+		return true;
+
+	/*
+	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
+	 * in Ring3 when CR4.PCE=0.
+	 */
+	if (enable_vmware_backdoor)
+		return true;
+
+	/*
+	 * Note!  Check *host* PMU capabilities, not KVM's PMU capabilities, as
+	 * KVM's capabilities are constrained based on KVM support, i.e. KVM's
+	 * capabilities themselves may be a subset of hardware capabilities.
+	 */
+	return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
+	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed ||
+	       pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
+	       pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_need_rdpmc_intercept);
+
 void kvm_pmu_deliver_pmi(struct kvm_vcpu *vcpu)
 {
 	if (lapic_in_kernel(vcpu)) {
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 9849c2bb720d..506c203587ea 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -238,6 +238,7 @@ void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu);
 void kvm_pmu_branch_retired(struct kvm_vcpu *vcpu);
 
 bool is_vmware_backdoor_pmc(u32 pmc_idx);
+bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu);
 
 extern struct kvm_pmu_ops intel_pmu_ops;
 extern struct kvm_pmu_ops amd_pmu_ops;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 24d59ccfa40d..11913574de88 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1011,6 +1011,11 @@ static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu)
 			svm->vmcb->control.virt_ext |= VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK;
 		}
 	}
+
+	if (kvm_need_rdpmc_intercept(vcpu))
+		svm_set_intercept(svm, INTERCEPT_RDPMC);
+	else
+		svm_clr_intercept(svm, INTERCEPT_RDPMC);
 }
 
 static void svm_recalc_intercepts(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index fdd18ad1ede3..9f71ba99cf70 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4300,8 +4300,15 @@ static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	 */
 }
 
+static void vmx_recalc_instruction_intercepts(struct kvm_vcpu *vcpu)
+{
+	exec_controls_changebit(to_vmx(vcpu), CPU_BASED_RDPMC_EXITING,
+				kvm_need_rdpmc_intercept(vcpu));
+}
+
 void vmx_recalc_intercepts(struct kvm_vcpu *vcpu)
 {
+	vmx_recalc_instruction_intercepts(vcpu);
 	vmx_recalc_msr_intercepts(vcpu);
 }
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1623afddff3b..76e86eb358df 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3945,6 +3945,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 
 		vcpu->arch.perf_capabilities = data;
 		kvm_pmu_refresh(vcpu);
+		kvm_make_request(KVM_REQ_RECALC_INTERCEPTS, vcpu);
 		break;
 	case MSR_IA32_PRED_CMD: {
 		u64 reserved_bits = ~(PRED_CMD_IBPB | PRED_CMD_SBPB);
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

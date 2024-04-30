Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BA7C25B10
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e16WqoHZh9FinHrH8cwCqSEWCONYbNJulcKFeMdvOCE=; b=epeLK2/rwHnyQv
	z+jUbL89UXQh8BUkKwWhbpJsOJOFN3EPuKn+YlCeNwrP0zgMTJTI+TaNYwuZOfeqeUrWTteFN9Eg2
	lQenaLzim+grkY7ldtx09aBMKs+HrHUg34Hj7kgPyDU+BkWepytYcgtaJE0IHy5uBdR7rkDtiYzbA
	ymZ80VqTbPX58YsmZNPWRQ4lIEmAhB47pBLWT60ewk0ascT9a/qxfzVlVQbKGBm0VKzNHPCYEK64T
	XDVTV39utsRFZHEtcjDI2jC6dE5T72+ujIJzXJsaOs9XepfXikIDZ8UyMm9CSyeNN+8wy1VdvOmhm
	bkLRWDLO7J+82JMzarRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tDT-00000007itZ-4ATm;
	Tue, 30 Apr 2024 19:32:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tD7-00000007igV-3aju
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Apr 2024 19:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zlyEud5d/bhoGiNpMEEmnNOfWYjdDQf4ZBXlBrFZHdU=; b=hkEA1VJH9xge0r4sFRGZDicvD6
	TuwpAJa1yS7Jb21u3uop8oDjYIcQMS66XCH1Sn8ATInI//OB2vedFc+p4GLj4Tk3bLn8bZXc3ARnX
	eN0WJsQwIVGmN0WfP1V1EkdnNCPWyHL+OVu2Ot7xQoC0wLuI0pXkKlwVWur+UUKXT9+yoaViyuE0X
	KW/w/D59wIOg9+yg747Q6s32aIgSIl3QOHZKvLQgK82YZoXHTwW01YT1EvWzS5mr7kNUAioptv3nv
	CaqQMFsnwn03yvnT4SEl7CqYWspDmXiWyAC6kTEXAMAe3gV3XLUqD/YxRGZppEHT+qZZMhhveFbGB
	Sx93VmIw==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tD2-0000000H4jM-3KaQ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 19:32:14 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61bea0c36bbso23638917b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505529; x=1715110329; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zlyEud5d/bhoGiNpMEEmnNOfWYjdDQf4ZBXlBrFZHdU=;
        b=yt95gEOb7d05IhaXGX/3D4HKoh9Mj4ktnCt59XC6jOF9lL6p28PJhGSmMIjSwZ7xwS
         CIqNC3AlVZAVggrwGL+GTmOM6+Cc//UEW9Kd5TMEUe3Lxx3qvcEEXNkXGeqpJBG0YwTp
         AOtTE4pGMQ7oStvt7sIKqIR/xc17cxwURIugJcLP576UungmtCS1aPWhnTqpePfintqC
         DhTuWwYaxso6e9qnalxbLZ6qdVigSF+1p1xZJya4sFJxUdUWM3jKItEkA6e7niJHEsKT
         KkcJEZePWox4C2fuos3f9qHSS8CMpINDKg7YZTNAmYcQwLw4XNNf4P0irgmQ+T2xuvrB
         4svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505529; x=1715110329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlyEud5d/bhoGiNpMEEmnNOfWYjdDQf4ZBXlBrFZHdU=;
        b=KcxQGOrwvO0cI5LLlOaY085c2qTFjjhptIxV6NLKUHrdFdtYa02CrV+2tfby1H5TxI
         TNfD4lsk6TreYhoejOk7FAaO0nvWo1xkL4AbyLgfzHmIHEfLvdUX8SSvwWRw3Z7eLOtV
         X2J5a5LKBWbklKzQCOUJ0oCw+dQeq23UViqVu4peM2k21i3fkGUMqLo/hDHq5AQfR4Ms
         F8TpYPRDYh6GJWbB4gwpWcIHu9G/Xi0NBZmGDq/EXJJu4PsanOZ5iuEprfFtOwDW/wxy
         P8SIwc5tdCc2stCUgr4NTiTpparwd7fgzA5R1LklrMuzNnAC0qpYoXQdL2GSPYP+8Wm1
         8lNA==
X-Forwarded-Encrypted: i=1; AJvYcCVY7nghVg8YGQy3F1H9r6++BA2n/+Hb2Sc+UNEyS4Dqe+4SISEYgWuCXFY1bHtn/ipeX873QE5W38VB9ULTKW+7AvpjmNoBJFZHaG6KfMdt
X-Gm-Message-State: AOJu0Yy42hVUKqvMoMsxjOQJixiRSD6WQRfeWlbmR0ZUaOYt+542VQ4O
	Zpxa8xD/XK34QdSZHBS1oBX2KJDS0bVaw5wrObX9TsewOf9C1D3AVb2YMVnF9BmJeOoqEFjZvJq
	sdg==
X-Google-Smtp-Source: AGHT+IG4cB2+idKWRATGCb6OVW7YEX4JltpUlzKwSOtT4qBlUznDsr14mRRca16T5tdKvIRNLf2VCRL2BMM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d2c5:0:b0:61d:3304:c25e with SMTP id
 u188-20020a0dd2c5000000b0061d3304c25emr134509ywd.7.1714505528716; Tue, 30 Apr
 2024 12:32:08 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:31:57 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-5-seanjc@google.com>
Subject: [PATCH 4/4] KVM: Delete the now unused kvm_arch_sched_in()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_203213_042572_EA4CE7CF 
X-CRM114-Status: GOOD (  12.73  )
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

Delete kvm_arch_sched_in() now that all implementations are nops.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h     | 1 -
 arch/loongarch/include/asm/kvm_host.h | 1 -
 arch/mips/include/asm/kvm_host.h      | 1 -
 arch/powerpc/include/asm/kvm_host.h   | 1 -
 arch/riscv/include/asm/kvm_host.h     | 1 -
 arch/s390/include/asm/kvm_host.h      | 1 -
 arch/x86/kvm/pmu.c                    | 6 +++---
 arch/x86/kvm/x86.c                    | 5 -----
 include/linux/kvm_host.h              | 2 --
 virt/kvm/kvm_main.c                   | 1 -
 10 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 9e8a496fb284..a12d3bb0b590 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1180,7 +1180,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 }
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
 void kvm_arm_init_debug(void);
 void kvm_arm_vcpu_init_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 69305441f40d..64ca60a3ce24 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -228,7 +228,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
 static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 179f320cc231..6743a57c1ab4 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -890,7 +890,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 8abac532146e..c4fb6a27fb92 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -897,7 +897,6 @@ struct kvm_vcpu_arch {
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..6cd7a576ef14 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -272,7 +272,6 @@ struct kvm_vcpu_arch {
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 95990461888f..e9fcaf4607a6 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -1045,7 +1045,6 @@ extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index c397b28e3d1b..75346a588e13 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -521,9 +521,9 @@ void kvm_pmu_handle_event(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * Unused perf_events are only released if the corresponding MSRs
-	 * weren't accessed during the last vCPU time slice. kvm_arch_sched_in
-	 * triggers KVM_REQ_PMU if cleanup is needed.
+	 * Release unused perf_events if the corresponding guest MSRs weren't
+	 * accessed during the last vCPU time slice (need_cleanup is set when
+	 * the vCPU is scheduled back in).
 	 */
 	if (unlikely(pmu->need_cleanup))
 		kvm_pmu_cleanup(vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9b0a21f2e56e..17d6ce0d4fa6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12577,11 +12577,6 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
 	return (vcpu->arch.apic_base & MSR_IA32_APICBASE_BSP) != 0;
 }
 
-void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu)
-{
-
-}
-
 void kvm_arch_free_vm(struct kvm *kvm)
 {
 #if IS_ENABLED(CONFIG_HYPERV)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2f5e35eb7eab..85b6dd7927fe 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1496,8 +1496,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 					struct kvm_guest_debug *dbg);
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
-void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
-
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4a4b29a9bace..b154b22a3b84 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6278,7 +6278,6 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 	WRITE_ONCE(vcpu->ready, false);
 
 	__this_cpu_write(kvm_running_vcpu, vcpu);
-	kvm_arch_sched_in(vcpu, cpu);
 	kvm_arch_vcpu_load(vcpu, cpu, true);
 }
 
-- 
2.45.0.rc0.197.gbae5840b3b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

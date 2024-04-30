Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CDFC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 19:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc/uMS1v20KWWMdGNsM+3EZuEkjnABQdukwB/dsx0XE=; b=cU5V2J/XnrNm3F
	VUtTYBCMjaDjH6uB5C6BQWKQhw/vYlOWk1ovxNfKM/gSI3McY3tSEew1DNqPx5+1jSKARpPG1VeeD
	XqYMEvfQ3gvK7Fg9SMYUe2ipwqLDLCEo9LNThtDpSjtnM8zh4tDtpHQfrSmkOPk66HpX2vc3GoKgF
	ShnlPLgeufR1Wz3eTVFGGELc60BGzHqo5o4+qv77iUKcbRDXh6QRC7Hs4WzAI/Utcbh3LCTpTtGPt
	EFhBWFxO+TPxhSlpNMabWfrIwruldCIfpouUEBGluZAejkUwoRjTdnmBZjxpJ71Y9QmcltclWYr72
	XKQUgjl134WxaeXVRCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tDL-00000007im2-0lQJ;
	Tue, 30 Apr 2024 19:32:31 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tCx-00000007ibF-3P7Q
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 19:32:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-de610854b8bso2895965276.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505522; x=1715110322; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/9fRzl3CD0k/SyefV+PuVpGeG7yuKpTeGf5FXkOJQxc=;
        b=BIbbRQcY0OhGBcDVgNAVnWMuGakfi2CFVxmudK2B5qRV8XBzQYT1OAo33DOuDYgWU9
         ysoLFIBNAGw6BLMemoWAPzpFGAICS3iFxvuJMOikd8IJ5TdRWb0X4y33tCJ5sTU1LjSv
         RDRUh2NrBKrwomSZgY6nuIJGYexfFuQguxvciyXuenFfkFPkRpeq/eN71VZssjCZpVU4
         Bs5rDenaOJO6tjYeUWfRaUJn1BaCYmSKLVnM7oA0r/CMLnf4BqMElKf01d4NwO4LCxTD
         aIL6B9TSPbF1ddE1I3ypg2YinKtd9NG9vJ2mxApslBny2sLFEBhk26BGL+PHbuQVqRh5
         TdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505522; x=1715110322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9fRzl3CD0k/SyefV+PuVpGeG7yuKpTeGf5FXkOJQxc=;
        b=eLtOgYcv23AqDqqLivXHdwTj+j1QEp9QZxqFP2sdS/FErFdDQCM4LpQnT+vPxEwGJ6
         OuHYVGIMrGgyknOLds3WY+Lbatf8iwJGeyzMdzzZAwAngmmvo7dYqco43DFQAqEmrbiH
         xSb6QTgZ80zRJQJwBjucFfY4llkYrLI3Skqju5GsNrUoiJhLn4o4eQ4ViaQdkhH4i7Qd
         NvbSv+SH66hmJ1y1uK81vYe+dCR3nk+TlXgfLs77FCfXDydkk1PApoD/NbQNEpR0d5Dv
         GP8OPhzqqhZxAAFVkF0A0ttFvDv15XWnqCWLJn3WL3HPBF6+EpA2TtlKngsVdaYi/SFE
         bb2A==
X-Forwarded-Encrypted: i=1; AJvYcCWnjsw2HrWY2JAR2b+1lFg9Wz9xc4HvwNwJpIiKGNY7KJW18TbPyHNpUCT0FT1DGcIkjy6bjBZzdU//jvoULbptUWqQVR/+yjhrKy5B+OcT
X-Gm-Message-State: AOJu0Yy1qwgrc3l9EunfgStLBpIHgfVd13ixmzGZB8TrByLf5wAsvWMF
	bKBMUVsZkKNx3Q8oedXFxY8oozZGCv/pWUAZavn/GZn7ZRxcbRyNH89mRRdkfWYb6Q9HC8+8Nn1
	yGA==
X-Google-Smtp-Source: AGHT+IHAdk2rf8sKJrz0YzlhWlhSiHEVj5XA1lMxBkIc6CQI4jsKBeWM7e1dBIV2qjtpd3vjCDa8fgs5KY0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2d16:0:b0:de1:d49:7ff6 with SMTP id
 t22-20020a252d16000000b00de10d497ff6mr66932ybt.7.1714505521993; Tue, 30 Apr
 2024 12:32:01 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:31:54 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-2-seanjc@google.com>
Subject: [PATCH 1/4] KVM: Plumb in a @sched_in flag to kvm_arch_vcpu_load()
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
X-CRM114-CacheID: sfid-20240430_123207_972037_FC7FD7A8 
X-CRM114-Status: GOOD (  13.30  )
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

Add a @sched_in flag to kvm_arch_vcpu_load() to note that the vCPU is
being (re)loaded by kvm_sched_in(), i.e. after the vCPU was previously
scheduled out.  KVM x86 currently uses a dedicated kvm_arch_sched_in()
hook, but that's unnecessarily brittle as the behavior of the arch hook
heavily depends on the arbitrary order of the two arch calls.

A separate hook also makes it unnecessarily difficult to do something
unique when re-loading vCPU during kvm_sched_in(), e.g. to optimize vCPU
loading if KVM knows that some CPU state couldn't have changed while the
vCPU was scheduled out.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c            | 2 +-
 arch/arm64/kvm/emulate-nested.c | 4 ++--
 arch/arm64/kvm/reset.c          | 2 +-
 arch/loongarch/kvm/vcpu.c       | 2 +-
 arch/mips/kvm/mmu.c             | 2 +-
 arch/powerpc/kvm/powerpc.c      | 2 +-
 arch/riscv/kvm/vcpu.c           | 4 ++--
 arch/s390/kvm/kvm-s390.c        | 2 +-
 arch/x86/kvm/x86.c              | 2 +-
 include/linux/kvm_host.h        | 2 +-
 virt/kvm/kvm_main.c             | 4 ++--
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c4a0a35e02c7..30ea103bfacb 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -428,7 +428,7 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct kvm_s2_mmu *mmu;
 	int *last_ran;
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 4697ba41b3a9..ad5458c47e5e 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2193,7 +2193,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	*vcpu_pc(vcpu) = elr;
 	*vcpu_cpsr(vcpu) = spsr;
 
-	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	preempt_enable();
 }
 
@@ -2274,7 +2274,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 */
 	__kvm_adjust_pc(vcpu);
 
-	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	preempt_enable();
 
 	return 1;
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 68d1d05672bd..654cf09c81e9 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -262,7 +262,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	kvm_timer_vcpu_reset(vcpu);
 
 	if (loaded)
-		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+		kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	preempt_enable();
 }
 
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 3a8779065f73..61d549c4f8d1 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1050,7 +1050,7 @@ static int _kvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	return 0;
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	unsigned long flags;
 
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..6797799f3f32 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -682,7 +682,7 @@ static void kvm_mips_migrate_count(struct kvm_vcpu *vcpu)
 }
 
 /* Restore ASID once we are scheduled back after preemption */
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	unsigned long flags;
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index d32abe7fe6ab..8de620716875 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -826,7 +826,7 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 	return kvmppc_core_pending_dec(vcpu);
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 #ifdef CONFIG_BOOKE
 	/*
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..a7b7f172fa61 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -87,7 +87,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
-		kvm_arch_vcpu_load(vcpu, smp_processor_id());
+		kvm_arch_vcpu_load(vcpu, smp_processor_id(), false);
 	put_cpu();
 }
 
@@ -507,7 +507,7 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	}
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 5147b943a864..9f04dc312641 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3713,7 +3713,7 @@ __u64 kvm_s390_get_cpu_timer(struct kvm_vcpu *vcpu)
 	return value;
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool shed_in)
 {
 
 	gmap_enable(vcpu->arch.enabled_gmap);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2d2619d3eee4..925cadb18b55 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5003,7 +5003,7 @@ static bool need_emulate_wbinvd(struct kvm_vcpu *vcpu)
 	return kvm_arch_has_noncoherent_dma(vcpu->kvm);
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in)
 {
 	/* Address WBINVD may be executed by guest */
 	if (need_emulate_wbinvd(vcpu)) {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index afbc99264ffa..2f5e35eb7eab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1498,7 +1498,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
 void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu, bool sched_in);
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 658581d4ad68..4a4b29a9bace 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -211,7 +211,7 @@ void vcpu_load(struct kvm_vcpu *vcpu)
 
 	__this_cpu_write(kvm_running_vcpu, vcpu);
 	preempt_notifier_register(&vcpu->preempt_notifier);
-	kvm_arch_vcpu_load(vcpu, cpu);
+	kvm_arch_vcpu_load(vcpu, cpu, false);
 	put_cpu();
 }
 EXPORT_SYMBOL_GPL(vcpu_load);
@@ -6279,7 +6279,7 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 
 	__this_cpu_write(kvm_running_vcpu, vcpu);
 	kvm_arch_sched_in(vcpu, cpu);
-	kvm_arch_vcpu_load(vcpu, cpu);
+	kvm_arch_vcpu_load(vcpu, cpu, true);
 }
 
 static void kvm_sched_out(struct preempt_notifier *pn,
-- 
2.45.0.rc0.197.gbae5840b3b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

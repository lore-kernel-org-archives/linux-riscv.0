Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D29C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324C360F46
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 324C360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fw71rJtyuLOR1JiwmDjvsvPkjYUqUrcazVjyJykSy5I=; b=eaXiEfhLjUviA8
	Q+5huS85saxvKkG+01AUThFsP2G1Xd0MkTqK5bSxGTK2KVsQIzk3VKbapG+Ya7Q0+rS1GU3XcxEal
	TeHEZaU8dHvNZQf/59z+v28M5zbQuBIff/uT8U3Hzk7cQoURTBFpfoR4KMMb4fJvC/3Kq3Yt/tIYt
	cl5L0KUcttevGPY6dTBOVv/4Ae4xktYuJxqRZMRO5K1hBC7VessRAeqPYwi5i1fY46pXqdxvLEBP1
	B5sD5Aqx7LWly177R9jR3s2DLCrfcB1S1iou1q2mOaOzaZ1maa972i0oSQrYfTHBFr90NT/Hw3gxA
	ITAS5I2SFMNURWaV4K7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ29G-004c2N-6V; Sat, 09 Oct 2021 02:31:42 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1re-004UCq-6r
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 i83-20020a252256000000b005b67a878f56so15032675ybi.17
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=32RMiV4r6xip6o15c8bJUTQW2O8kilnMCGQHEfTTYKM=;
 b=Xt+/sD+qL3dmnz376HBxoxNqvIltpU6YZ2LmJMV7IG0i/AZpV1I3dHKqo0HOrsKWoV
 hup6zyRQlIvRk2f+k/Qkt86T31RCpT38q9CZOLd0NEkYhf/DCHHeIuZ1i0z6SSH1w4cv
 87MWNVLb1sk7RMghhTpyh4WMDZEaUB+V4TpFad0hlvVcDNeQ+heTvz7zCw9Q6hUzXDcW
 /ziydy33Gp8JyWZI/IdgaBh5D3MRLdWQtryxN8AojNQ5w7dlpnIsNjMOhg+dVszK8ar5
 MqYtV5N/ZK2vm/4Y4Y5DUZ+fplCVDBqxMgjwSR/fWfam+q2Mo19ZYpN7bZlBF6OLjTAN
 rPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=32RMiV4r6xip6o15c8bJUTQW2O8kilnMCGQHEfTTYKM=;
 b=4PWM66y9JIPkRwTVmFOcNPSP0zSt7lnVIGF/EyDL00DNAauJJSKwI5K5l6ijTA6X5p
 SW6Q/YQI/xGhbDhVb0cPLZYt7ya7z1H+iV0az/5DGEzOYOxnEvEKS5ZVfioBduk3J5+H
 UQCl2WjJ0jOUITBBWDWc4zXaw9Qs+GsLhDXOSRzgQug5ASR2FX3BJ3JzLI6QNu2n1g4r
 KR9zd0VDE+XQZsPV8wuebc1OWHseiFUAkro97d4BMWo8mcHP4D+lRTvDBag3U437JE2T
 xczv66FXV0erYyAyRVWMFRXSOPrkKN6+ckKi6sjwLPTDVCeLjyj8+w8tFXsI3Z+VfSp0
 vkWg==
X-Gm-Message-State: AOAM5335vjdn+SlT1dPCJgQqZjK7vIbvsB4zplVqxlFnOc6EFMYsChyr
 1Opjhbe1LjowzrU+GShNFdsZHG+mqvE=
X-Google-Smtp-Source: ABdhPJw4j9hWuJPsOcM61WVS3IQVTDinA25rMFFzafcSSpwgKm0gpmkD5FDPpiAeFmHa2qG4NwAmC1D9m2Q=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:6584:: with SMTP id
 z126mr6683601ybb.156.1633745608458; 
 Fri, 08 Oct 2021 19:13:28 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:12 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-20-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 19/43] KVM: Add helpers to wake/query blocking vCPU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191330_318641_3C42019F 
X-CRM114-Status: GOOD (  13.77  )
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

Add helpers to wake and query a blocking vCPU.  In addition to providing
nice names, the helpers reduce the probability of KVM neglecting to use
kvm_arch_vcpu_get_wait().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arch_timer.c |  3 +--
 arch/arm64/kvm/arm.c        |  2 +-
 arch/x86/kvm/lapic.c        |  2 +-
 include/linux/kvm_host.h    | 14 ++++++++++++++
 virt/kvm/async_pf.c         |  2 +-
 virt/kvm/kvm_main.c         |  8 ++------
 6 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 7e8396f74010..addd53b6eba6 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -649,7 +649,6 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
 	struct timer_map map;
-	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 
 	if (unlikely(!timer->enabled))
 		return;
@@ -672,7 +671,7 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
 	if (map.emul_ptimer)
 		soft_timer_cancel(&map.emul_ptimer->hrtimer);
 
-	if (rcuwait_active(wait))
+	if (kvm_vcpu_is_blocking(vcpu))
 		kvm_timer_blocking(vcpu);
 
 	/*
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 268b1e7bf700..9ff0e85a9f16 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -622,7 +622,7 @@ void kvm_arm_resume_guest(struct kvm *kvm)
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		vcpu->arch.pause = false;
-		rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
+		__kvm_vcpu_wake_up(vcpu);
 	}
 }
 
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 76fb00921203..0cd7ed21b205 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1931,7 +1931,7 @@ void kvm_lapic_expired_hv_timer(struct kvm_vcpu *vcpu)
 	/* If the preempt notifier has already run, it also called apic_timer_expired */
 	if (!apic->lapic_timer.hv_timer_in_use)
 		goto out;
-	WARN_ON(rcuwait_active(&vcpu->wait));
+	WARN_ON(kvm_vcpu_is_blocking(vcpu));
 	apic_timer_expired(apic, false);
 	cancel_hv_timer(apic);
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index bdaa0e70b060..1fa38dc00b87 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1151,6 +1151,20 @@ static inline struct rcuwait *kvm_arch_vcpu_get_wait(struct kvm_vcpu *vcpu)
 #endif
 }
 
+/*
+ * Wake a vCPU if necessary, but don't do any stats/metadata updates.  Returns
+ * true if the vCPU was blocking and was awakened, false otherwise.
+ */
+static inline bool __kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
+{
+	return !!rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
+}
+
+static inline bool kvm_vcpu_is_blocking(struct kvm_vcpu *vcpu)
+{
+	return rcuwait_active(kvm_arch_vcpu_get_wait(vcpu));
+}
+
 #ifdef __KVM_HAVE_ARCH_INTC_INITIALIZED
 /*
  * returns true if the virtual interrupt controller is initialized and
diff --git a/virt/kvm/async_pf.c b/virt/kvm/async_pf.c
index ccb35c22785e..9bfe1d6f6529 100644
--- a/virt/kvm/async_pf.c
+++ b/virt/kvm/async_pf.c
@@ -85,7 +85,7 @@ static void async_pf_execute(struct work_struct *work)
 
 	trace_kvm_async_pf_completed(addr, cr2_or_gpa);
 
-	rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
+	__kvm_vcpu_wake_up(vcpu);
 
 	mmput(mm);
 	kvm_put_kvm(vcpu->kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 481e8178b43d..c870cae7e776 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3332,10 +3332,7 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_halt);
 
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
 {
-	struct rcuwait *waitp;
-
-	waitp = kvm_arch_vcpu_get_wait(vcpu);
-	if (rcuwait_wake_up(waitp)) {
+	if (__kvm_vcpu_wake_up(vcpu)) {
 		WRITE_ONCE(vcpu->ready, true);
 		++vcpu->stat.generic.halt_wakeup;
 		return true;
@@ -3490,8 +3487,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 				continue;
 			if (vcpu == me)
 				continue;
-			if (rcuwait_active(kvm_arch_vcpu_get_wait(vcpu)) &&
-			    !vcpu_dy_runnable(vcpu))
+			if (kvm_vcpu_is_blocking(vcpu) && !vcpu_dy_runnable(vcpu))
 				continue;
 			if (READ_ONCE(vcpu->preempted) && yield_to_kernel_mode &&
 			    !kvm_arch_dy_has_pending_interrupt(vcpu) &&
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

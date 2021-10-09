Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA2DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F2F60EFE
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14F2F60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibfbCkD2O9oh0KnhScr7BXPMKR2hiy0tbD7VxUVFj4g=; b=pZzDPFk7Uj580b
	XhkMPeeQ37cd5SQb7xxBbh3vwFjFcxRSMiCM3qnBdCy5mNzRM1l1q2vOJu218XayBxdvPzguAysAy
	wRaabhPGGv4NKCjnF/nQ4INrSy94AkYMgvhdrwE0+jnE9sHnXE/rZ3uHfflmr5TkBWen0dxvS/Kbi
	si/Jzj0OF0SuikegGTcJt56FUkjT3HUkfbON4KgJOm9ZnR2lMvROw/EgHAVBQIoL/+/OV8wE3WInF
	CkpvTX/AAVLLwC6EI/IWFCQ6wlQimBnK9Od/MQQDS7wsgZ0n/2COcP9EBOUwxjUpsxWtuKhy19FTB
	nwycwWGmsgHh3Agll+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2NJ-004hd6-02; Sat, 09 Oct 2021 02:46:13 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1s8-004UXP-2g
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 c65-20020a251c44000000b005ba81fe4944so4784508ybc.14
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=74r31OpU8NW+MC737KW2OyC4MoV5BxluWFmZ0wIUFwQ=;
 b=V7r7iotGGXSpwOyFo/5GOSk0OYL1h+1pOxbdC4LI5JCruGlrPLbnqn07EuCdfIwu0T
 Zmfvn9BWul9wSaR03Y4GuJvuRpvNM9GPW0g8UZ0ASJVKDvY1XN6qije5YFCYzLqWb0Ox
 h3h1UTdUfkhi0wg9KFd4+tuAGLSbiGpDis/Fr3m+vTeTPIUcLtSpmxnQfkRh0/DaszXp
 5H2ib25eMzRVYEc2xmrqf1JeyB/szEhAI8rd7GzbDU3qhiUT2F4XMkp8BugwIMIM3gvJ
 6+HChgOgvy/ayjdP2z8uJHXP2yKvQDdpl8X6zrmbCa91OqEywPOyHAZcF4Fpf43IvF27
 jXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=74r31OpU8NW+MC737KW2OyC4MoV5BxluWFmZ0wIUFwQ=;
 b=ZNyCDc8YIAJhZUNfPBMLv19VbuFK2yFCfZPQUNUhay7jZpeTrsLCsSmd5NZmCL0RCp
 is0wJiv1LSz7Ad8ao8xVTCoPIkpUGZqX26+bDLNsYwihkO3wVxrKgWRV7QpSv//qMi18
 fSosOC7Fm88lESkNjOGYNZPjDhJrVcA4b+k9Qu3f10NUurg3NbxQKHOnGguP6o0Yew5I
 aN5oxJyPfZOuKS0TQLvcNILv2TnJXBew2vgehMg4Dbd7hoaOjqen2jGly47QaHIcA5G1
 HM34fVk4/9B+FWa+2bSSEIoPJTpNlVDxR2chBlsBn0aJWRQv+ft9ESnT+wDMpCg/AlSd
 +Wjg==
X-Gm-Message-State: AOAM531nTc5Tg7ZTdXTxvT6CtdTvfId/emz1ENJ08PCv7r35rsD0fsJ5
 HnebTmSgpUGodm3zuNtPKM3XuhkV7XQ=
X-Google-Smtp-Source: ABdhPJwgbsSdnQrzbzPUJKulJyChRLEDriPJWDBbVXRDLiiDF8J2h2Ck1mesLvf0H4KXpFh8QBnQHKs2rsM=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:1b56:: with SMTP id
 b83mr7086955ybb.327.1633745638422; 
 Fri, 08 Oct 2021 19:13:58 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:24 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-32-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 31/43] KVM: Move x86 VMX's posted interrupt list_head to
 vcpu_vmx
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
X-CRM114-CacheID: sfid-20211008_191400_209106_AF26E93F 
X-CRM114-Status: GOOD (  21.01  )
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

Move the seemingly generic block_vcpu_list from kvm_vcpu to vcpu_vmx, and
rename the list and all associated variables to clarify that it tracks
the set of vCPU that need to be poked on a posted interrupt to the wakeup
vector.  The list is not used to track _all_ vCPUs that are blocking, and
the term "blocked" can be misleading as it may refer to a blocking
condition in the host or the guest, where as the PI wakeup case is
specifically for the vCPUs that are actively blocking from within the
guest.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 39 +++++++++++++++++-----------------
 arch/x86/kvm/vmx/vmx.c         |  2 ++
 arch/x86/kvm/vmx/vmx.h         |  3 +++
 include/linux/kvm_host.h       |  2 --
 virt/kvm/kvm_main.c            |  2 --
 5 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index d2b3d75c57d1..f1bcf8c32b6d 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -18,7 +18,7 @@
  * wake the target vCPUs.  vCPUs are removed from the list and the notification
  * vector is reset when the vCPU is scheduled in.
  */
-static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
+static DEFINE_PER_CPU(struct list_head, wakeup_vcpus_on_cpu);
 /*
  * Protect the per-CPU list with a per-CPU spinlock to handle task migration.
  * When a blocking vCPU is awakened _and_ migrated to a different pCPU, the
@@ -26,7 +26,7 @@ static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
  * CPU.  IRQs must be disabled when taking this lock, otherwise deadlock will
  * occur if a wakeup IRQ arrives and attempts to acquire the lock.
  */
-static DEFINE_PER_CPU(spinlock_t, blocked_vcpu_on_cpu_lock);
+static DEFINE_PER_CPU(spinlock_t, wakeup_vcpus_on_cpu_lock);
 
 static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
 {
@@ -36,6 +36,7 @@ static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
 void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	struct pi_desc old, new;
 	unsigned long flags;
 	unsigned int dest;
@@ -71,9 +72,9 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 	 * current pCPU if the task was migrated.
 	 */
 	if (pi_desc->nv == POSTED_INTR_WAKEUP_VECTOR) {
-		spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
-		list_del(&vcpu->blocked_vcpu_list);
-		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
+		spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
+		list_del(&vmx->pi_wakeup_list);
+		spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
 	}
 
 	dest = cpu_physical_id(cpu);
@@ -121,15 +122,16 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
 {
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	struct pi_desc old, new;
 	unsigned long flags;
 
 	local_irq_save(flags);
 
-	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
-	list_add_tail(&vcpu->blocked_vcpu_list,
-		      &per_cpu(blocked_vcpu_on_cpu, vcpu->cpu));
-	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
+	spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
+	list_add_tail(&vmx->pi_wakeup_list,
+		      &per_cpu(wakeup_vcpus_on_cpu, vcpu->cpu));
+	spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
 
 	WARN(pi_desc->sn, "PI descriptor SN field set before blocking");
 
@@ -182,24 +184,23 @@ void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
  */
 void pi_wakeup_handler(void)
 {
-	struct kvm_vcpu *vcpu;
 	int cpu = smp_processor_id();
+	struct vcpu_vmx *vmx;
 
-	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
-	list_for_each_entry(vcpu, &per_cpu(blocked_vcpu_on_cpu, cpu),
-			blocked_vcpu_list) {
-		struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+	spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
+	list_for_each_entry(vmx, &per_cpu(wakeup_vcpus_on_cpu, cpu),
+			    pi_wakeup_list) {
 
-		if (pi_test_on(pi_desc))
-			kvm_vcpu_kick(vcpu);
+		if (pi_test_on(&vmx->pi_desc))
+			kvm_vcpu_kick(&vmx->vcpu);
 	}
-	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
+	spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
 }
 
 void __init pi_init_cpu(int cpu)
 {
-	INIT_LIST_HEAD(&per_cpu(blocked_vcpu_on_cpu, cpu));
-	spin_lock_init(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
+	INIT_LIST_HEAD(&per_cpu(wakeup_vcpus_on_cpu, cpu));
+	spin_lock_init(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
 }
 
 bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 26ed8cd1a1f2..b3bb2031a7ac 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6848,6 +6848,8 @@ static int vmx_create_vcpu(struct kvm_vcpu *vcpu)
 	BUILD_BUG_ON(offsetof(struct vcpu_vmx, vcpu) != 0);
 	vmx = to_vmx(vcpu);
 
+	INIT_LIST_HEAD(&vmx->pi_wakeup_list);
+
 	err = -ENOMEM;
 
 	vmx->vpid = allocate_vpid();
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 592217fd7d92..d1a720be9a64 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -298,6 +298,9 @@ struct vcpu_vmx {
 	/* Posted interrupt descriptor */
 	struct pi_desc pi_desc;
 
+	/* Used if this vCPU is waiting for PI notification wakeup. */
+	struct list_head pi_wakeup_list;
+
 	/* Support for a guest hypervisor (nested VMX) */
 	struct nested_vmx nested;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 87996b22e681..c5961a361c73 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -304,8 +304,6 @@ struct kvm_vcpu {
 	u64 requests;
 	unsigned long guest_debug;
 
-	struct list_head blocked_vcpu_list;
-
 	struct mutex mutex;
 	struct kvm_run *run;
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2bbf5c9d410f..c1850b60f38b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -426,8 +426,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 #endif
 	kvm_async_pf_vcpu_init(vcpu);
 
-	INIT_LIST_HEAD(&vcpu->blocked_vcpu_list);
-
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
 	kvm_vcpu_set_dy_eligible(vcpu, false);
 	vcpu->preempted = false;
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

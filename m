Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22321C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DECC860FD7
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DECC860FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mb9o4HyeWalcVcIRWmAPGjde+yFdcaNupoxScqRd0QY=; b=vL4Jl4SW3KIC8V
	RWNFkCbfY1HsFI7r6bTETvzLyktOWq/WoUboGNLOzbz/6FVFKuGlJGq2E3a8/PjvsP56iDKHIHDlA
	c4ZpxCUY6rH/7jJWe3peyBJV4TbIwE+INsIVvYuty3e17LzLMOVDO1ourc1T7mjZN/+F43hDB7Byv
	fGuFqtHvwl8JqAxRhG/BxFCkKLkSeseNgFzYFXr1O0QWvhLP7VNp8EA9vtHkZJzqC1q3qwkYwlIev
	0YuinB8ae0+sLC1eLh94ZOw7j6w0Z8m6p/fCtBqJDelJHbu0xMwzFEiQknuCbhQfawnII7Mr5Bhqm
	4ODT/ukHjfoHtZ0iee/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1tO-004VIG-82; Sat, 09 Oct 2021 02:15:18 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1r3-004TpH-H4
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:12:56 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 i83-20020a256d56000000b005b706d1417bso15030769ybc.6
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=cmY3ciYgK0Pw7Nc3yQ2tKxt4RfIVgRouhF9jfsbApsU=;
 b=QbQVaw+LEXAnvKqqBqFc88s4xq502vqu1GE3XpXsagKgQF+sSH5oy9ZN3Riurg0uam
 NboPaoBoD+NTvzrr76ut0oSCAr/dobocjfxXDCgfKREM1WgGlcHv/XKBbx+8XlSywjl9
 v6gbyQ/DSMA6ibdL//jX5ac88VgPO68Yar5tSoyOjvQU7DWuLyOGlTMs1EcHp6GBd7t8
 zDaqFcWWP1eS2XcbCz8YiWyZQMO7D8kVYM83EyYLTsNWw/FWNJEOnWDm+n66w3yiKT4b
 k4mJC2lWsO+wgHdIF9UIkXA7mXBDmZvdXGiRS4k0umncgko4hmVixQMSV1g0v0Xm3Xav
 bXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=cmY3ciYgK0Pw7Nc3yQ2tKxt4RfIVgRouhF9jfsbApsU=;
 b=zlq4FK23gmIg6PyUqlZg0cOecVr2CLJ/eD9TL1+oQ2PqnhT0979a4JIZarYk90+rcn
 nlI3BRiizeoBRvBmC8yE3fTfqCzYnnD9rIQmldzTaFoWroE934ogtNmKkdzHDIJ53css
 8NgMAURY8tZWR5hR2/GQVgNf8SjZdGkqfJZScXSli/5fly6zr3TmjRC/MsnobCYViSaf
 kW0puN8Go4q7wsUBcZ7EugVauTa6wtHgOjwKV6h6br3y5FKKLAzZQI+jS9u1VsJx6wo5
 tkaag7XDuIyO2fgip5zowRQCviQN1sAGLG5AaSiGFJ68IbOM4JLsFAjKs3/pRakVLd9U
 ZsrA==
X-Gm-Message-State: AOAM530EXoPD0IczWxQawh27fEYdr28wcUuS8WLDYOIj2vKD64ZxCU9t
 b19crcprLqspTIV0UIocYe/h3IDngRA=
X-Google-Smtp-Source: ABdhPJxDfkHFA9j3YHwNecv1+8g7k+RRNV2EAtanrld0mWMeRHqp+zJFBO4S5rRqjxsoT4caGrG4+Mlfzmc=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:bc0e:: with SMTP id
 i14mr6935877ybh.324.1633745571812; 
 Fri, 08 Oct 2021 19:12:51 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:11:57 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-5-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 04/43] KVM: Force PPC to define its own rcuwait object
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
X-CRM114-CacheID: sfid-20211008_191253_611836_C3E462D8 
X-CRM114-Status: GOOD (  14.21  )
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

Do not define/reference kvm_vcpu.wait if __KVM_HAVE_ARCH_WQP is true, and
instead force the architecture (PPC) to define its own rcuwait object.
Allowing common KVM to directly access vcpu->wait without a guard makes
it all too easy to introduce potential bugs, e.g. kvm_vcpu_block(),
kvm_vcpu_on_spin(), and async_pf_execute() all operate on vcpu->wait, not
the result of kvm_arch_vcpu_get_wait(), and so may do the wrong thing for
PPC.

Due to PPC's shenanigans with respect to callbacks and waits (it switches
to the virtual core's wait object at KVM_RUN!?!?), it's not clear whether
or not this fixes any bugs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_host.h | 1 +
 arch/powerpc/kvm/powerpc.c          | 3 ++-
 include/linux/kvm_host.h            | 2 ++
 virt/kvm/async_pf.c                 | 2 +-
 virt/kvm/kvm_main.c                 | 9 ++++++---
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 59cb38b04ede..876c10803cda 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -749,6 +749,7 @@ struct kvm_vcpu_arch {
 	u8 irq_pending; /* Used by XIVE to signal pending guest irqs */
 	u32 last_inst;
 
+	struct rcuwait wait;
 	struct rcuwait *waitp;
 	struct kvmppc_vcore *vcore;
 	int ret;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 8ab90ce8738f..be22da157569 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -762,7 +762,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		goto out_vcpu_uninit;
 
-	vcpu->arch.waitp = &vcpu->wait;
+	rcuwait_init(&vcpu->arch.wait);
+	vcpu->arch.waitp = &vcpu->arch.wait;
 	kvmppc_create_vcpu_debugfs(vcpu, vcpu->vcpu_id);
 	return 0;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 60a35d9fe259..1ced2914d9ca 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -310,7 +310,9 @@ struct kvm_vcpu {
 	struct mutex mutex;
 	struct kvm_run *run;
 
+#ifndef __KVM_HAVE_ARCH_WQP
 	struct rcuwait wait;
+#endif
 	struct pid __rcu *pid;
 	int sigset_active;
 	sigset_t sigset;
diff --git a/virt/kvm/async_pf.c b/virt/kvm/async_pf.c
index dd777688d14a..ccb35c22785e 100644
--- a/virt/kvm/async_pf.c
+++ b/virt/kvm/async_pf.c
@@ -85,7 +85,7 @@ static void async_pf_execute(struct work_struct *work)
 
 	trace_kvm_async_pf_completed(addr, cr2_or_gpa);
 
-	rcuwait_wake_up(&vcpu->wait);
+	rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
 
 	mmput(mm);
 	kvm_put_kvm(vcpu->kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7bc38549487e..5d4a90032277 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -421,7 +421,9 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	vcpu->kvm = kvm;
 	vcpu->vcpu_id = id;
 	vcpu->pid = NULL;
+#ifndef __KVM_HAVE_ARCH_WQP
 	rcuwait_init(&vcpu->wait);
+#endif
 	kvm_async_pf_vcpu_init(vcpu);
 
 	vcpu->pre_pcpu = -1;
@@ -3213,6 +3215,7 @@ update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
  */
 void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 {
+	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
 	ktime_t start, cur, poll_end;
 	bool waited = false;
@@ -3251,7 +3254,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	}
 
 
-	prepare_to_rcuwait(&vcpu->wait);
+	prepare_to_rcuwait(wait);
 	for (;;) {
 		set_current_state(TASK_INTERRUPTIBLE);
 
@@ -3261,7 +3264,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 		waited = true;
 		schedule();
 	}
-	finish_rcuwait(&vcpu->wait);
+	finish_rcuwait(wait);
 	cur = ktime_get();
 	if (waited) {
 		vcpu->stat.generic.halt_wait_ns +=
@@ -3460,7 +3463,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 				continue;
 			if (vcpu == me)
 				continue;
-			if (rcuwait_active(&vcpu->wait) &&
+			if (rcuwait_active(kvm_arch_vcpu_get_wait(vcpu)) &&
 			    !vcpu_dy_runnable(vcpu))
 				continue;
 			if (READ_ONCE(vcpu->preempted) && yield_to_kernel_mode &&
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

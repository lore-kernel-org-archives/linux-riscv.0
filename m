Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB1EC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E9B46103C
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E9B46103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxRKo1FPuIMwRY/bIDA9H/JBGqUF5l2WOQ2RmourOe4=; b=aD6gNLySgH2T7k
	vLFkxpjWlvATLs39h0q5QX1fcLugXaoEU6QHCLAtYZ7iBxRLi4R37em1MdZgmzwG5dQcXAlbLVnc7
	KGCNMzHVb1sAQGACbuu14IqKwB/pQ3UQmO1poDL5cz8O4n+F5MKVk5xMyR46/iRZZC1yLvc/MNc/a
	yn/Rrp+C6n4wf6Eq8wSscM5hlLvqMk4hEgWuNM2+X/hZ3/gAmSK9jgedz3z3OfPwBeX5y64Ee4Zpt
	J+/1f6h2uFx75GKvzYd/kqmSOram28BbELReaOB6GmL0o5QgyrQ9EUwLrfVLvVdpIHuHrTjuslu5a
	egqX8pua9qBKf0Y/Acsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1yC-004Xiy-3s; Sat, 09 Oct 2021 02:20:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rI-004Txz-6Q
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 z2-20020a254c02000000b005b68ef4fe24so15041940yba.11
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=7UfiFA3j2+6I2+nAWNhD8/i07R8fVsAS1/w0N/aa090=;
 b=aR3og+oc7PMwu8Forg7HYvRnh8xW7rVTXkNeNN4GEdGb9eMQr0BxriYw1WCEWH/rps
 CzI5rGwFNvewdmiYYfcjmrHJ37omSwRaaK67pX54nsvHJAX1QmuyS8m7A3T8srDuMpEq
 INyVvjKgNRHRhfke+WD+WgtgVp7aMSP1M/d2iLvOmKfjBg4cec31at7qrXlRe57r1WT/
 UsDhrANY7t02k9VZy8hnTd7ysR/TwUt+OFlZh1HvACIu+5QAPMNvmCZ5hIypKdufBScF
 7Y9CJreS/iw7TnDZqwI7dewLqo50Fs3ke9ye+sR1ax5lX0kayCH6nt5LFfkuoh7frLyk
 0n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=7UfiFA3j2+6I2+nAWNhD8/i07R8fVsAS1/w0N/aa090=;
 b=BA44ewjjHSh1seug80kUm30LtpQ15aj3N69nXSjpdMm8L/IOBHdGylBo9MC6x2+JJE
 nYbxdGYTqiEmGo5q2vcDVfrMHovlEAzMLBGmcGJ/irl8W6gEaLQpdwUo9ZJBcDiyHsa9
 7W0hr3Yvk+Dto9PMvsLI7l/HhFSGJwwkA0Lpp0yavTzhkLFF8hjoIx6t+phVMZL/sCJ2
 /Iy2+5NOq4HLx3GPK2BAyXiu+ZD2LM6jpeFlDjAxL3t5cA/6sp/AV084BcHAQdVgGCti
 Am9Hyt8AFvNT+K+xhxWIB7mj180RfQQ554tOmSJIJ3FYRpAT/8DBmpZGPIxdMc5MVjFY
 YZJQ==
X-Gm-Message-State: AOAM532YD+pDwLh69/ATANNSQwN+kwkqXDxVArQVVklYKiBGk+RjmnhH
 CpLAXLyJVN5fvXxog9RgNY8zht08mCA=
X-Google-Smtp-Source: ABdhPJx5tQAxYIWw/UxfnO+GS3ZmVIvpanbA+F5BzOK+h+G2iaAxrnXRERnnpv1JgyJw5hk8wtX6cvBcEV4=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a5b:110:: with SMTP id
 16mr7306011ybx.392.1633745586492; 
 Fri, 08 Oct 2021 19:13:06 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:03 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-11-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out arch
 callback hook
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
X-CRM114-CacheID: sfid-20211008_191308_277010_54652D89 
X-CRM114-Status: GOOD (  19.10  )
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

Move the put and reload of the vGIC out of the block/unblock callbacks
and into a dedicated WFI helper.  Functionally, this is nearly a nop as
the block hook is called at the very beginning of kvm_vcpu_block(), and
the only code in kvm_vcpu_block() after the unblock hook is to update the
halt-polling controls, i.e. can only affect the next WFI.

Back when the arch (un)blocking hooks were added by commits 3217f7c25bca
("KVM: Add kvm_arch_vcpu_{un}blocking callbacks) and d35268da6687
("arm/arm64: KVM: arch_timer: Only schedule soft timer on vcpu_block"),
the hooks were invoked only when KVM was about to "block", i.e. schedule
out the vCPU.  The use case at the time was to schedule a timer in the
host based on the earliest timer in the guest in order to wake the
blocking vCPU when the emulated guest timer fired.  Commit accb99bcd0ca
("KVM: arm/arm64: Simplify bg_timer programming") reworked the timer
logic to be even more precise, by waiting until the vCPU was actually
scheduled out, and so move the timer logic from the (un)blocking hooks to
vcpu_load/put.

In the meantime, the hooks gained usage for enabling vGIC v4 doorbells in
commit df9ba95993b9 ("KVM: arm/arm64: GICv4: Use the doorbell interrupt
as an unblocking source"), and added related logic for the VMCR in commit
5eeaf10eec39 ("KVM: arm/arm64: Sync ICH_VMCR_EL2 back when about to block").

Finally, commit 07ab0f8d9a12 ("KVM: Call kvm_arch_vcpu_blocking early
into the blocking sequence") hoisted the (un)blocking hooks so that they
wrapped KVM's halt-polling logic in addition to the core "block" logic.

In other words, the original need for arch hooks to take action _only_
in the block path is long since gone.

Cc: Oliver Upton <oupton@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h |  2 ++
 arch/arm64/kvm/arm.c                 | 52 +++++++++++++++++++---------
 arch/arm64/kvm/handle_exit.c         |  3 +-
 3 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index fd418955e31e..de8b4f5922b7 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -41,6 +41,8 @@ void kvm_inject_vabt(struct kvm_vcpu *vcpu);
 void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr);
 void kvm_inject_pabt(struct kvm_vcpu *vcpu, unsigned long addr);
 
+void kvm_vcpu_wfi(struct kvm_vcpu *vcpu);
+
 static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
 {
 	return !(vcpu->arch.hcr_el2 & HCR_RW);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7838e9fb693e..1346f81b34df 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -359,27 +359,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
 {
-	/*
-	 * If we're about to block (most likely because we've just hit a
-	 * WFI), we need to sync back the state of the GIC CPU interface
-	 * so that we have the latest PMR and group enables. This ensures
-	 * that kvm_arch_vcpu_runnable has up-to-date data to decide
-	 * whether we have pending interrupts.
-	 *
-	 * For the same reason, we want to tell GICv4 that we need
-	 * doorbells to be signalled, should an interrupt become pending.
-	 */
-	preempt_disable();
-	kvm_vgic_vmcr_sync(vcpu);
-	vgic_v4_put(vcpu, true);
-	preempt_enable();
+
 }
 
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 {
-	preempt_disable();
-	vgic_v4_load(vcpu);
-	preempt_enable();
+
 }
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
@@ -662,6 +647,39 @@ static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
 	smp_rmb();
 }
 
+/**
+ * kvm_vcpu_wfi - emulate Wait-For-Interrupt behavior
+ * @vcpu:	The VCPU pointer
+ *
+ * Suspend execution of a vCPU until a valid wake event is detected, i.e. until
+ * the vCPU is runnable.  The vCPU may or may not be scheduled out, depending
+ * on when a wake event arrives, e.g. there may already be a pending wake event.
+ */
+void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Sync back the state of the GIC CPU interface so that we have
+	 * the latest PMR and group enables. This ensures that
+	 * kvm_arch_vcpu_runnable has up-to-date data to decide whether
+	 * we have pending interrupts, e.g. when determining if the
+	 * vCPU should block.
+	 *
+	 * For the same reason, we want to tell GICv4 that we need
+	 * doorbells to be signalled, should an interrupt become pending.
+	 */
+	preempt_disable();
+	kvm_vgic_vmcr_sync(vcpu);
+	vgic_v4_put(vcpu, true);
+	preempt_enable();
+
+	kvm_vcpu_block(vcpu);
+	kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+
+	preempt_disable();
+	vgic_v4_load(vcpu);
+	preempt_enable();
+}
+
 static int kvm_vcpu_initialized(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.target >= 0;
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 275a27368a04..4794563a506b 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -95,8 +95,7 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
 	} else {
 		trace_kvm_wfx_arm64(*vcpu_pc(vcpu), false);
 		vcpu->stat.wfi_exit_stat++;
-		kvm_vcpu_block(vcpu);
-		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		kvm_vcpu_wfi(vcpu);
 	}
 
 	kvm_incr_pc(vcpu);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E8C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 01:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVykuK3GcE3eAGLC6ZYej7Cxtak3uuQAOEcNEMbM0Oc=; b=q0Urxz80ZofzzT
	s8sFYQlTB+TMvPSJ0WLLIXIBkDodfUMNarD0LBoa/GyYoL4/P0eL3HEwx6T4EvwjtTvOT/sLsCdSY
	YY6+gi86SWMAD+7JYhl3ayBxoTr7JGNCKrpDq0Hkc3+PPTxqEkzLf49Q+8t0429ia+DQ41XPqTM50
	6+iNinIlS+zG0r2pqr7B4wzBNXNYxhmHJuJYhMrSfYwK+A4LwmR3VMEE0eCmd1qtlw8dpju3N8RZW
	uqo758JXqjGzApvqi0y91usmwPWnZlR9xWCIuLdIlXRhLzvmV7pI/WC2aQvor5ELYB11js9Nn6ugs
	X9sFswZe/o8vlkXJEBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaop3-0082hA-4a; Wed, 21 Sep 2022 01:46:45 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfc-007hoS-Qh
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:32:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id o1-20020a170902d4c100b00177f59a9889so2718849plg.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=U5vFo4bt4S1YBkw7qJ/8SsXR9dI8fRaWN+LYTLGRLXc=;
        b=FGingks1cs8K3eS5eyjPLfgz2EyXv6C+mz7GjFjIsR+ztzCwCbQq/48DDu5g/uZ1Qf
         TKdHFjxeqF2i0gKdcBxhcxSwZQh25TbMTEUem6xBx1Il6mlI/R35MG7zDJLXZ+I7LRBZ
         mB01ACY29IvkNpuZxo5f8s86udAgXwT4AOfA1e8PAgFjsJzWl66pgmnkr+XqCz1Pxayf
         V7RA+S0PCVWgQtIYKdUAP6E/DVuSBq5M3Pu7Pd23qTYkXbQU93GZE0OA4qnvuhDPMOMn
         IE+AwnDKCJLEXKQ6ToCeXyPtQN6f4t7z2J4mxlNIQNjfcIA2lIcoI5cSSKDW/YvjdeCG
         Unmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=U5vFo4bt4S1YBkw7qJ/8SsXR9dI8fRaWN+LYTLGRLXc=;
        b=Nc0S37ym+eAW8E21v3CaDWuCRQjcg95nnDBuRNzOokGgPvAAm9Xui3VIpTgB8bIgSa
         dIpdbH6UJO+1ZfebWCGDk2nVdyg1mlTU2iiXyd8tV6GeH2a76uQooHK5nRYtKoudVMlX
         Becr+Z5HvcxYwMZIjxrnzXSVAhLRFzt3C97JqzcMlJ8r0YV7DnI6YxiK7PUJcP/6iEb8
         lrkDC78jsweBmeA/0Hr/BvN54QEmjdd3sph6Jn3FxT8bBgcIQZfc0rawiB83CXLrKGgR
         fFkSlFMPWLPGnwkR6fCNb548F1+z5UIz9Z1jUBVcOWTJ9U/NFLdmdRnnaCbkyarboH1A
         rw4A==
X-Gm-Message-State: ACrzQf321cq3E8mV4NEJJAqOFuZ8ziut/U1egrTRretG4uHEmI/HyqDM
	bnaxUdHfgQMlrQkYjZsuFbU+W7CV09U=
X-Google-Smtp-Source: AMsMyM7I8M2k58LdiY9Bn17s48fNmOAL5wLIHciB2Qx2fxuZBU4hSU51h5SdBz6suytGhuqo6XNaa5/wPfk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:a9c6:b0:178:b2d4:f8b2 with SMTP id
 b6-20020a170902a9c600b00178b2d4f8b2mr2142306plr.79.1663720372595; Tue, 20 Sep
 2022 17:32:52 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:52 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-4-seanjc@google.com>
Subject: [PATCH v4 03/12] KVM: x86: Rename and expose helper to detect if
 INIT/SIPI are allowed
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_173256_906343_C6DCC3F3 
X-CRM114-Status: GOOD (  15.55  )
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

Rename and invert kvm_vcpu_latch_init() to kvm_apic_init_sipi_allowed()
so as to match the behavior of {interrupt,nmi,smi}_allowed(), and expose
the helper so that it can be used by kvm_vcpu_has_events() to determine
whether or not an INIT or SIPI is pending _and_ can be taken immediately.

Opportunistically replaced usage of the "latch" terminology with "blocked"
and/or "allowed", again to align with KVM's terminology used for all other
event types.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 4 ++--
 arch/x86/kvm/lapic.h | 7 +++++++
 arch/x86/kvm/x86.c   | 9 +++++----
 arch/x86/kvm/x86.h   | 5 -----
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 9dda989a1cf0..2bd90effc653 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -3051,14 +3051,14 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * INITs are latched while CPU is in specific states
+	 * INITs are blocked while CPU is in specific states
 	 * (SMM, VMX root mode, SVM with GIF=0).
 	 * Because a CPU cannot be in these states immediately
 	 * after it has processed an INIT signal (and thus in
 	 * KVM_MP_STATE_INIT_RECEIVED state), just eat SIPIs
 	 * and leave the INIT pending.
 	 */
-	if (kvm_vcpu_latch_init(vcpu)) {
+	if (!kvm_apic_init_sipi_allowed(vcpu)) {
 		WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED);
 		if (test_bit(KVM_APIC_SIPI, &pe))
 			clear_bit(KVM_APIC_SIPI, &apic->pending_events);
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 117a46df5cc1..c3ce6b0b1ea3 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -7,6 +7,7 @@
 #include <linux/kvm_host.h>
 
 #include "hyperv.h"
+#include "kvm_cache_regs.h"
 
 #define KVM_APIC_INIT		0
 #define KVM_APIC_SIPI		1
@@ -228,6 +229,12 @@ static inline bool kvm_apic_has_events(struct kvm_vcpu *vcpu)
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->pending_events;
 }
 
+static inline bool kvm_apic_init_sipi_allowed(struct kvm_vcpu *vcpu)
+{
+	return !is_smm(vcpu) &&
+	       !static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
+}
+
 static inline bool kvm_lowest_prio_delivery(struct kvm_lapic_irq *irq)
 {
 	return (irq->delivery_mode == APIC_DM_LOWEST ||
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e1a25e46dbf7..59be7b16b92f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11293,11 +11293,12 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 		goto out;
 
 	/*
-	 * KVM_MP_STATE_INIT_RECEIVED means the processor is in
-	 * INIT state; latched init should be reported using
-	 * KVM_SET_VCPU_EVENTS, so reject it here.
+	 * Pending INITs are reported using KVM_SET_VCPU_EVENTS, disallow
+	 * forcing the guest into INIT/SIPI if those events are supposed to be
+	 * blocked.  KVM prioritizes SMI over INIT, so reject INIT/SIPI state
+	 * if an SMI is pending as well.
 	 */
-	if ((kvm_vcpu_latch_init(vcpu) || vcpu->arch.smi_pending) &&
+	if ((!kvm_apic_init_sipi_allowed(vcpu) || vcpu->arch.smi_pending) &&
 	    (mp_state->mp_state == KVM_MP_STATE_SIPI_RECEIVED ||
 	     mp_state->mp_state == KVM_MP_STATE_INIT_RECEIVED))
 		goto out;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index a784ff90740b..829d3134c1eb 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -275,11 +275,6 @@ static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
 	return !(kvm->arch.disabled_quirks & quirk);
 }
 
-static inline bool kvm_vcpu_latch_init(struct kvm_vcpu *vcpu)
-{
-	return is_smm(vcpu) || static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
-}
-
 void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip);
 
 u64 get_kvmclock_ns(struct kvm *kvm);
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

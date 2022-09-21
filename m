Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67BDC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YawM12SXLKhLF25GqxrGHouJ9miOY8MbqN9zGtd770=; b=bKKbl7GAqWEjEU
	rQM6mk33gtxsdsfEy3DtDgRPcvWt/3JvIiFMfAAuhF83eepwMxAcf++y7gPKfD5/rh5W1RrHdsqlc
	ddxxH76MeYdZs/8eFJ5xHSKPEiAtmWP9X+dngVAq11+5F827xb/wFAloSvsU4GZdgDo6bt6ueGZQr
	hwrdpfQR5kKPiEr+bB+nka/bv9AEAtYHBZ2nrHJZvxY9VvbCdJa57o4ZbZBPRs14+SkHy6etTCbpd
	Qf5F7of6BHzseUqRt0NRJlWEmO9kPiudr51tbHkEi02n9ZJVrIWZepgmLm9S2B15u9VCT+OjGMiBU
	hbYb7tfjpJS3mhRewoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaniP-007jOl-Nc; Wed, 21 Sep 2022 00:35:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfv-007hw3-7B
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+nmtDj/EH/uK0SyJnyCY1A9LxFaUnx5384By8rF2AcA=; b=MaZf1UDz/aUzgOUslc6vGhy3Vp
	wnJ8mjB5QdLqqw8oKLib5mc4Gq9TJB87oEdsVEJZTZQd9GteqDeBbl1sTGlD6LmCYiQJg5SCXOXj4
	V4l33st7Bs2XysYjHHxVPRIZqFOHvXfPlYseu9VOgThVtUlWYhs2+NmbX6yE+prQKaXokC4R9LF8F
	Oo1SQ5fjDKpnCwgJvai9FOptCw+C50OVRrHePj20P3ZZQgyG47RL/niwfMMmb3yH9//530+r6APSp
	x8jZzQIiYHabsvtzJyu0RvyF7qLuyFWe5H1SWA0qLONOEOCl2wikSVXnMk/fTGpiQQHcjqwlndSLF
	3a0lO3Ag==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfl-00ET7W-1E
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:07 +0000
Received: by mail-pg1-x54a.google.com with SMTP id d5-20020a63fd05000000b0043be829b589so288359pgh.20
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=+nmtDj/EH/uK0SyJnyCY1A9LxFaUnx5384By8rF2AcA=;
        b=rpWC/VKjogxaSKricNAD/sRggDf2m+ppcZ99cC4f6M2lXn9866lNJfALVMtFhxatIn
         qQLLRO1BUtEoQdRvY1yCuXD/CtkIEdb3+zCRL0TNiOdne1CQBhI/BizUOruqlzoGL1ru
         VCaVy6ynkLdl8Y2SlQn7F72+sRnXKS9nW+9M+WtquUBaCslXgLIbNwAo/KbGQ39Ut11+
         iX38zqjv00zbeQfFOy8nLz7/nmQA6SCthL08Bvu2Mg/I39d68rA1efgAA/OI3nSBX2ld
         cXZNYtWAos3dWx8qB/6lW1KWT1k2gQ6b3mCS+VL9cYwYuehjdDCD0p4cY7hCsI3NeNJV
         wlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=+nmtDj/EH/uK0SyJnyCY1A9LxFaUnx5384By8rF2AcA=;
        b=X+VyIb5AAirbEV0gRrVK9VSG/hV5edUsotGmr+LC+6EWEH0NO7VS0SGjRN9th277Nc
         wNpzF4I6vtm5gfYNgPoEZxftCNFGimVSY5sojygsDY0UYbcnRD4h4ya/hXmLjnJh5w4z
         LAGZVcrXRj7SXfszDgjtgBk5Z3/fZ+RgJz8Um28TSsYUH5D3cqTFE4njDXxVmKp4fDQ5
         dWP2NN35B6CuCf0ga6VHj8859ZmLH3b+91gp3UAVxQP1FaIYjADuk7fcCoxxq8B8AkdU
         xkM1MLcVArOYluVCdHjtPIaXtfwNJhcz4vlFgu8vScH2O4G3WZYK899k/aM2Ab75AXZK
         FnQQ==
X-Gm-Message-State: ACrzQf0IEgRWhgJ1p6JYiHAYM0fhR25dhRFQfM0HEqklJPRYeEvkK40O
	fpY1nFMBFbaEEmOC9oeMWt627aqVthM=
X-Google-Smtp-Source: AMsMyM6zSXdEm/sdOmQ6ucVPu4StzA9LzXizITrmOCaLxtYOZuSorePqxSyOnSzLlOuDLemc+6OfhU9oA1I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4a43:b0:202:7706:73d7 with SMTP id
 lb3-20020a17090b4a4300b00202770673d7mr6477790pjb.137.1663720382986; Tue, 20
 Sep 2022 17:33:02 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:58 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-10-seanjc@google.com>
Subject: [PATCH v4 09/12] KVM: x86: Don't snapshot pending INIT/SIPI prior to
 checking nested events
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
X-CRM114-CacheID: sfid-20220921_013305_386396_80E50F83 
X-CRM114-Status: GOOD (  20.65  )
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

Don't snapshot pending INIT/SIPI events prior to checking nested events,
architecturally there's nothing wrong with KVM processing (dropping) a
SIPI that is received immediately after synthesizing a VM-Exit.  Taking
and consuming the snapshot makes the flow way more subtle than it needs
to be, e.g. nVMX consumes/clears events that trigger VM-Exit (INIT/SIPI),
and so at first glance it appears that KVM is double-dipping on pending
INITs and SIPIs.  But that's not the case because INIT is blocked
unconditionally in VMX root mode the CPU cannot be in wait-for_SIPI after
VM-Exit, i.e. the paths that truly consume the snapshot are unreachable
if apic->pending_events is modified by kvm_check_nested_events().

nSVM is a similar story as GIF is cleared by the CPU on VM-Exit; INIT is
blocked regardless of whether or not it was pending prior to VM-Exit.

Drop the snapshot logic so that a future fix doesn't create weirdness
when kvm_vcpu_running()'s call to kvm_check_nested_events() is moved to
vcpu_block().  In that case, kvm_check_nested_events() will be called
immediately before kvm_apic_accept_events(), which raises the obvious
question of why that change doesn't break the snapshot logic.

Note, there is a subtle functional change.  Previously, KVM would clear
pending SIPIs if and only SIPI was pending prior to VM-Exit, whereas now
KVM clears pending SIPI unconditionally if INIT+SIPI are blocked.  The
latter is architecturally allowed, as SIPI is ignored if the CPU is not
in wait-for-SIPI mode (arguably, KVM should be even more aggressive in
dropping SIPIs).  It is software's responsibility to ensure the SIPI is
delivered, i.e. software shouldn't be firing INIT-SIPI at a CPU until
it knows with 100% certaining that the target CPU isn't in VMX root mode.

Furthermore, the existing code is extra weird as SIPIs that arrive after
VM-Exit _are_ dropped if there also happened to be a pending SIPI before
VM-Exit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 2bd90effc653..d7639d126e6c 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -3025,17 +3025,8 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 	struct kvm_lapic *apic = vcpu->arch.apic;
 	u8 sipi_vector;
 	int r;
-	unsigned long pe;
 
-	if (!lapic_in_kernel(vcpu))
-		return 0;
-
-	/*
-	 * Read pending events before calling the check_events
-	 * callback.
-	 */
-	pe = smp_load_acquire(&apic->pending_events);
-	if (!pe)
+	if (!kvm_apic_has_pending_init_or_sipi(vcpu))
 		return 0;
 
 	if (is_guest_mode(vcpu)) {
@@ -3043,38 +3034,31 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 		if (r < 0)
 			return r == -EBUSY ? 0 : r;
 		/*
-		 * If an event has happened and caused a vmexit,
-		 * we know INITs are latched and therefore
-		 * we will not incorrectly deliver an APIC
-		 * event instead of a vmexit.
+		 * Continue processing INIT/SIPI even if a nested VM-Exit
+		 * occurred, e.g. pending SIPIs should be dropped if INIT+SIPI
+		 * are blocked as a result of transitioning to VMX root mode.
 		 */
 	}
 
 	/*
-	 * INITs are blocked while CPU is in specific states
-	 * (SMM, VMX root mode, SVM with GIF=0).
-	 * Because a CPU cannot be in these states immediately
-	 * after it has processed an INIT signal (and thus in
-	 * KVM_MP_STATE_INIT_RECEIVED state), just eat SIPIs
-	 * and leave the INIT pending.
+	 * INITs are blocked while CPU is in specific states (SMM, VMX root
+	 * mode, SVM with GIF=0), while SIPIs are dropped if the CPU isn't in
+	 * wait-for-SIPI (WFS).
 	 */
 	if (!kvm_apic_init_sipi_allowed(vcpu)) {
 		WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED);
-		if (test_bit(KVM_APIC_SIPI, &pe))
-			clear_bit(KVM_APIC_SIPI, &apic->pending_events);
+		clear_bit(KVM_APIC_SIPI, &apic->pending_events);
 		return 0;
 	}
 
-	if (test_bit(KVM_APIC_INIT, &pe)) {
-		clear_bit(KVM_APIC_INIT, &apic->pending_events);
+	if (test_and_clear_bit(KVM_APIC_INIT, &apic->pending_events)) {
 		kvm_vcpu_reset(vcpu, true);
 		if (kvm_vcpu_is_bsp(apic->vcpu))
 			vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
 		else
 			vcpu->arch.mp_state = KVM_MP_STATE_INIT_RECEIVED;
 	}
-	if (test_bit(KVM_APIC_SIPI, &pe)) {
-		clear_bit(KVM_APIC_SIPI, &apic->pending_events);
+	if (test_and_clear_bit(KVM_APIC_SIPI, &apic->pending_events)) {
 		if (vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED) {
 			/* evaluate pending_events before reading the vector */
 			smp_rmb();
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

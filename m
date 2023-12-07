Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6112FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 01:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zHsx/p7GQhin2LEhIjP7t/FBFqU9C2Wsv33tYWhrhqw=; b=LIclkFDxio/VeHU53KFL4ECDTq
	z9nPOdh83CUl8jvLN4ceTJspNOPOg7qPDE1Lpd0cOpaWSXW3ggCnjTSg0BNuODx17D5ZiPYZLOhFr
	bZrGlL9gz3/HqKB7/cj41U6Q2LlFPMmgGsGsMSBfbYRNmOrB4UpiCSbYaHVJuW4BSJE248KrOQo2w
	tXyzAOcat7+Xc8nlNz9zu3lpUVr4MUDrk3768JvYjtfFDFX9gSuwirTugXH9WL/hiNdolHG95IxG2
	hNWcWBk62/yloXc2GVFGu/DNU64YLreC0YKxiDAAwcdxIzkNGXubliFUHEY7RMITHw7hf63IJyDwI
	E4LytHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB2nV-00Bblw-0H;
	Thu, 07 Dec 2023 01:03:25 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB2nS-00Bbjm-0y
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 01:03:23 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d8da78a5fbso1558907b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 17:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701910996; x=1702515796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kNsTQFENpLV0yAX5x5gNndSdmWF67ocLDbukBVvw4Ho=;
        b=MxXwA69Oa0sXGHBJGdqsjE6N4HATBo42ETdWwv7uvSXXUuzBY2hiPkWh/tkFjb0CaU
         8U1hQdzxCN2+ffo/J7u5bl8hPMYO74V2CgxdxdM56Dy+7SBrMACiXUhKxWevOTnpi+W5
         xGyONXEuYKrysr4kaeDJcbwaHax19rKSLocbq4nvRwRo/ZOt2EA71slp7JGJSYq+Mlpd
         QbGixOyZp8GKEIbm7jTOJ9isJVf6hHRHm6nBFvydGs7t/IhvLKEE1m29SPaGzkznC5ON
         Ove9sBieR+yJX/Txsp7gabXj8KrHHrlHnrr6mW0vLM3vZK4uQklvELOlsQfUKJfZdgyl
         qJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701910996; x=1702515796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNsTQFENpLV0yAX5x5gNndSdmWF67ocLDbukBVvw4Ho=;
        b=hMDQroTuGRPWMUc2mrvtk3X6+MCjj2bI1+HgYGvHYPyrpNJvDwaLNFKLfYnnyS2EBY
         Ew7Q5k2QsZ8HDzf9S/LmIuREGMiZrYKRhPUx4aSdyzQ0RX4exJGNfNhV8DaDW3VUXn4i
         sjy+L+6jeVyG9XQYheDoudxvp0AocApPbC5+SGAebFHs/JOQr1KPe5OAo+xJN9NAvThF
         Q5HlISHWfEuyznsEVUVQQSTzbLBJ92TtlmX5SfOH+PZjSbqTZgBJLJsMbyCKyib+8ceH
         4UZDAcnC5jKp0xFkQaT6co0wSNB+dOMn6qDENprIWIBhpDFPZlv0sOUwc0ZbH/aiTF7W
         vrPg==
X-Gm-Message-State: AOJu0YydNysCLOE8O4o4b7vtPk51Ksb/BprJVQ4scPkLam5KUkrrRDZJ
	MxWh0RpfSmsiUjd7P2AxvM/kWXYB/u/TmQ==
X-Google-Smtp-Source: AGHT+IEeNrOu3itFc+M9ynsd08u9d5b33h7Ph3dWYLMht1q/VwgbdO1TO2ezXuPbPGpyVmgh4Cp2D8u2f11e3g==
X-Received: from loggerhead.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:29a])
 (user=jmattson job=sendgmr) by 2002:a25:2981:0:b0:dbc:3553:efe with SMTP id
 p123-20020a252981000000b00dbc35530efemr3380ybp.4.1701910996183; Wed, 06 Dec
 2023 17:03:16 -0800 (PST)
Date: Wed,  6 Dec 2023 17:03:02 -0800
In-Reply-To: <20220921003201.1441511-11-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207010302.2240506-1-jmattson@google.com>
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Jim Mattson <jmattson@google.com>
To: seanjc@google.com
Cc: aleksandar.qemu.devel@gmail.com, alexandru.elisei@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	borntraeger@linux.ibm.com, chenhuacai@kernel.org, david@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, james.morse@arm.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	maz@kernel.org, mlevitsk@redhat.com, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	suzuki.poulose@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_170322_339133_8640ADC7 
X-CRM114-Status: GOOD (  16.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

kvm_vcpu_check_block() is called while not in TASK_RUNNING, and therefore
it cannot sleep.  Writing to guest memory is therefore forbidden, but it
can happen on AMD processors if kvm_check_nested_events() causes a vmexit.

Fortunately, all events that are caught by kvm_check_nested_events() are
also recognized by kvm_vcpu_has_events() through vendor callbacks such as
kvm_x86_interrupt_allowed() or kvm_x86_ops.nested_ops->has_events(), so
remove the call and postpone the actual processing to vcpu_block().

Opportunistically honor the return of kvm_check_nested_events().  KVM
punted on the check in kvm_vcpu_running() because the only error path is
if vmx_complete_nested_posted_interrupt() fails, in which case KVM exits
to userspace with "internal error" i.e. the VM is likely dead anyways so
it wasn't worth overloading the return of kvm_vcpu_running().

Add the check mostly so that KVM is consistent with itself; the return of
the call via kvm_apic_accept_events()=>kvm_check_nested_events() that
immediately follows  _is_ checked.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[sean: check and handle return of kvm_check_nested_events()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index dcc675d4e44b..8aeacbc2bff9 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10815,6 +10815,17 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 			return 1;
 	}
 
+	/*
+	 * Evaluate nested events before exiting the halted state.  This allows
+	 * the halt state to be recorded properly in the VMCS12's activity
+	 * state field (AMD does not have a similar field and a VM-Exit always
+	 * causes a spurious wakeup from HLT).
+	 */
+	if (is_guest_mode(vcpu)) {
+		if (kvm_check_nested_events(vcpu) < 0)
+			return 0;
+	}
+
 	if (kvm_apic_accept_events(vcpu) < 0)
 		return 0;
 	switch(vcpu->arch.mp_state) {
@@ -10837,9 +10848,6 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 
 static inline bool kvm_vcpu_running(struct kvm_vcpu *vcpu)
 {
-	if (is_guest_mode(vcpu))
-		kvm_check_nested_events(vcpu);
-
 	return (vcpu->arch.mp_state == KVM_MP_STATE_RUNNABLE &&
 		!vcpu->arch.apf.halted);
 }

This commit breaks delivery of a (virtualized) posted interrupt from
an L1 vCPU to a halted L2 vCPU.

Looking back at commit e6c67d8cf117 ("KVM: nVMX: Wake blocked vCPU in
guest-mode if pending interrupt in virtual APICv"), Liran wrote:

    Note that this also handles the case of nested posted-interrupt by the
    fact RVI is updated in vmx_complete_nested_posted_interrupt() which is
    called from kvm_vcpu_check_block() -> kvm_arch_vcpu_runnable() ->
    kvm_vcpu_running() -> vmx_check_nested_events() ->
    vmx_complete_nested_posted_interrupt().

Clearly, that is no longer the case.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

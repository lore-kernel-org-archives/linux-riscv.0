Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75176C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWHbwxzquW5icSqMGbaZol+cWSKQxlO6JWzMZPWy1s8=; b=XhNmlgSfxzCD0H
	OduNzgpB+IaNKM0eSCs6hujPnCm+9MHPXV49jNUPDLZkbCLbBSHZBdJVdKRnalqcdjqBs0uikNUOT
	SK/K7SWT5ayGVHqXKKPIn4yBaNW3zVLTePztZbUETIvQaJAG2+7YKCfoysF1VCjf3EpgK0Qk7maXE
	8O/5jtM6XDezX06lyMrj6t4z15EEnV/rRaEjcQ1uTUJS9/zv4YfhssF33nT26y+CQFf7fjACV7cQh
	E66IOXoOBetRc/A0rQSH5TI6mPJ7GtXDRdQ7da/mNb2i969iG+wIRGzBSLriNjFLMf8+j2J8JKqkN
	Td/SPZlw730TQlEwwe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanhA-007ijK-6w; Wed, 21 Sep 2022 00:34:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfq-007hw3-FH
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6n3oC51LepjybeCO/G1gnLj/7i8/kZTfCzCfh49ZsFY=; b=hqwFfbe73zo3O0sys4ik1PXu9r
	ZOmiJCjcHLv2NBwDznnkOuN7AhILy5l3SYBKWMvl7Rhz6BtwSokORREVUvEjjKP/ZmmEceTRgbGOp
	5Jbkz8pp6uIPQ0dJr9DcjR0uNAfrsDFPl5RZNc0RLiVlH27b1nSlyjTQ+i1QjgOG5qchv+GvXwn+x
	eskZlSYUVZiNdJT71jWeZx5Y6Jhe0O2ZbAyJFowTFRh82/o9sI21xK0bcKn4h0qmdi/HpK9DwIL8q
	vPdR09cg0LyBjNpGAAVmoKw99lR5a+7SVDPeoPee35PU+lmdk033HJWec6J/IHd14ZR6AzvgKE2Ub
	b5y8C6gA==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfl-00ET7b-TP
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:08 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-349423f04dbso38212717b3.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=6n3oC51LepjybeCO/G1gnLj/7i8/kZTfCzCfh49ZsFY=;
        b=W1Ft16I2z4KyotR0zf9JcaxskVjiFIoTSvcCvM9GzqpfMZjOnkUbTlyR/YK2GifRmv
         QrwJq8VMURYEAE2WuDaeBV1lpmfmiUr9qttHXPB25xmfj0zo/Rm8dS6hBczWKfely1To
         iBZYJPxQgEmeTx4V8oSgxXgoc7fmc8jL0B2eJu/Yc6c7NQPqonrY7m5HwsjgveG5t8/q
         DMeMlr+fihRcdrCqNFWVENW4RNE2K4oabECK0hGgUMWhs07ZJGDjNFB5aD/IHo4M7B6i
         xV1aDtVsD/LclbxQq81QXFA9WSGbWt0X054O++Zklv0EWWKP7bGtdKwjb1syoi10fSBt
         trFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=6n3oC51LepjybeCO/G1gnLj/7i8/kZTfCzCfh49ZsFY=;
        b=DN1fJj/ufwLI9+1wBq/vvBKO/ea8Cvj4HtwglvywS1qoed4hXs5xWGfMTgRJrJyJhe
         cCc1RJ3sBVPj8pXLcdR7utv8bd9YNEj2c+VLutBDON0Rp7aRjz6QpNd7inNVLdGjhbVE
         Z3UsHYH0/vcv4l+PVaQ4mBhdM0Ff2nP7bqDJZss7BVHm2C7vysRmRVBUQWmbnK9v5tGf
         Q567euyC8tioEuJKEOqRTge08JMqUWb7BBv8Bpv+FK1QykJDYy+OqTvmA25sV20x04w+
         ohloqwj4/S+so+cLt6XwHTpUXGGZakY4PFpQBza2aMV0SLP6LEqkIqCBSIeJqJNAqYw9
         PPPQ==
X-Gm-Message-State: ACrzQf2/q1hcFiSRrj9fW7eiqT46taB0NooVin9CDle5nFiehNDnyKuO
	r75WNnVv716F4+nVSx+iZVQTJXVgvpo=
X-Google-Smtp-Source: AMsMyM6ajbNthck8O3WF1o+1c/8Kt+/LZ69NQ6nvF17LZv5xSYaJvw/YRsOuqwhN87Jz4vl4Gma5UjnRyp0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c04f:0:b0:6ae:96ac:ac2d with SMTP id
 c76-20020a25c04f000000b006ae96acac2dmr21142783ybf.227.1663720384571; Tue, 20
 Sep 2022 17:33:04 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:59 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-11-seanjc@google.com>
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
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
X-CRM114-CacheID: sfid-20220921_013306_508280_1179DB8B 
X-CRM114-Status: GOOD (  16.04  )
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

From: Paolo Bonzini <pbonzini@redhat.com>

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
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D882AC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ophRSMLlbs5UMe1EVRNSDARPqhWu8VDrRg8V2Hn7rk=; b=a9rDdlIF3Jc/TV
	o6BMUyWmdedG59VfJaVB2Rj3FWuL4N2szD0mpb+wGrFzMWRtYArVH+XS8eEbwB5N15rdmhP9ev1ib
	yq2nRp37YSL51+Gr9vykww6/G3FKHM4nGhCN+dIs9i21n5PX4V5gwjNKw0H35IZbASBDKUD0fj4FY
	Kf02DXkZ+785amK6Z8gpggfLfQqyt06Fn53k9Vphdqa1OIn9NgDbYkjEQYXws8KhS9rXos6/eFadR
	PcsH+MRbBlF6bMwoB5rTu1IkErJiEjEe2WshNRGXBoTLTxVaNhC2nSQJPkgEycUWXRCNlK0Hx8fgv
	paDtu85XgqSxMdATVdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaooe-0082Ne-4w; Wed, 21 Sep 2022 01:46:20 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfX-007hmO-Po
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:32:53 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 128-20020a630486000000b00435b18f71b3so2512662pge.19
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=v7YHpsXihO1IGC0K/PKlA8GEkrI37lPnwhd36LF7pVk=;
        b=T4Pq1vwhu58JKk9S6MS0EL1IJhE9KPvx6f3kP5213oRycLCnCPGalTsox3aAjnkBY+
         bvrARzyrfMnXa376luKHrUSUC3r41vDBz/363U0/GCT1m+sgrmqVasY3fcU9OUU8ZnQr
         fGLzK1tbOFeQ4wKJzJP+i1caYDQsEDEbwf5IEBhf8mxzB0P/PeEP0jzwrUt5tUlgn1vs
         khV0dI6DS92WUbMb+SK3UCu6WG61MT61dVs3It8NhZZ7b/6/vq2QNm9LhdsajCmXKYhu
         RM5VBfvag1jIjc/ktzcq5owOd+kKUM+xzeu/Nh4l3/G9+HsymuEMfqdrfo6zFFuJfavG
         EM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=v7YHpsXihO1IGC0K/PKlA8GEkrI37lPnwhd36LF7pVk=;
        b=K/tWNdgyCuGybMts/mbg+RqU7Kwurvp+WBvJoTpqPKFYluBLInU3WMV+JJvIO1mMeW
         YhGMjwYq7f/2QXYXVu1Al3x5rt1eFNrn5BIqHxJ3REIuGnLTP+Rt7RB8vH1dlCRyvrUN
         LM3VHZGc1duNhnzb5+b3wyKeIfMj2cQw5AZVYiBP+cVWoqbNvD/a630lR064jFzbXXV/
         Kl2vakB7YlYAfN4Q0jaJ8Lc7xqrsg+YTkXm1SgnsNvStKJITODCLSKV+HNAM/xHYZ6K0
         7puTpfpjflgZSV3uECa+A5d2dABaQU9t/UPokwQCqnLSuz0hjX2rueedQhHcDnpSA/3v
         6A6Q==
X-Gm-Message-State: ACrzQf0otBET5w7eO1Vdl7t6rDN0arfMcE0W6xs+lq3YetrGvxW47seo
	g8oC/ov6rg3i2hBVy+dyfmrJTMLgWIM=
X-Google-Smtp-Source: AMsMyM7sgUnowEJxKriF2nS2mMYPc53K7RWElo5y1ug5fX5KhtVWX0U//x1MzIKxCHK8PGNETQVSyl6SEZ4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f644:b0:172:b074:d1f5 with SMTP id
 m4-20020a170902f64400b00172b074d1f5mr2177656plg.29.1663720369344; Tue, 20 Sep
 2022 17:32:49 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:50 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-2-seanjc@google.com>
Subject: [PATCH v4 01/12] KVM: x86: make vendor code check for all nested events
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
X-CRM114-CacheID: sfid-20220920_173251_924297_CABA7901 
X-CRM114-Status: GOOD (  13.10  )
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

Interrupts, NMIs etc. sent while in guest mode are already handled
properly by the *_interrupt_allowed callbacks, but other events can
cause a vCPU to be runnable that are specific to guest mode.

In the case of VMX there are two, the preemption timer and the
monitor trap.  The VMX preemption timer is already special cased via
the hv_timer_pending callback, but the purpose of the callback can be
easily extended to MTF or in fact any other event that can occur only
in guest mode.

Rename the callback and add an MTF check; kvm_arch_vcpu_runnable()
now can return true if an MTF is pending, without relying on
kvm_vcpu_running()'s call to kvm_check_nested_events().  Until that call
is removed, however, the patch introduces no functional change.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/vmx/nested.c       | 8 +++++++-
 arch/x86/kvm/x86.c              | 8 ++++----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ee940c4c0f64..c03590d1c5e1 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1649,7 +1649,7 @@ struct kvm_x86_nested_ops {
 	bool (*is_exception_vmexit)(struct kvm_vcpu *vcpu, u8 vector,
 				    u32 error_code);
 	int (*check_events)(struct kvm_vcpu *vcpu);
-	bool (*hv_timer_pending)(struct kvm_vcpu *vcpu);
+	bool (*has_events)(struct kvm_vcpu *vcpu);
 	void (*triple_fault)(struct kvm_vcpu *vcpu);
 	int (*get_state)(struct kvm_vcpu *vcpu,
 			 struct kvm_nested_state __user *user_kvm_nested_state,
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 4da0558943ce..85318d803f4f 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3929,6 +3929,12 @@ static bool nested_vmx_preemption_timer_pending(struct kvm_vcpu *vcpu)
 	       to_vmx(vcpu)->nested.preemption_timer_expired;
 }
 
+static bool vmx_has_nested_events(struct kvm_vcpu *vcpu)
+{
+	return nested_vmx_preemption_timer_pending(vcpu) ||
+	       to_vmx(vcpu)->nested.mtf_pending;
+}
+
 /*
  * Per the Intel SDM's table "Priority Among Concurrent Events", with minor
  * edits to fill in missing examples, e.g. #DB due to split-lock accesses,
@@ -6971,7 +6977,7 @@ struct kvm_x86_nested_ops vmx_nested_ops = {
 	.leave_nested = vmx_leave_nested,
 	.is_exception_vmexit = nested_vmx_is_exception_vmexit,
 	.check_events = vmx_check_nested_events,
-	.hv_timer_pending = nested_vmx_preemption_timer_pending,
+	.has_events = vmx_has_nested_events,
 	.triple_fault = nested_vmx_triple_fault,
 	.get_state = vmx_get_nested_state,
 	.set_state = vmx_set_nested_state,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5b8328cb6c14..e1a25e46dbf7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9966,8 +9966,8 @@ static int kvm_check_and_inject_events(struct kvm_vcpu *vcpu,
 	}
 
 	if (is_guest_mode(vcpu) &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending(vcpu))
+	    kvm_x86_ops.nested_ops->has_events &&
+	    kvm_x86_ops.nested_ops->has_events(vcpu))
 		*req_immediate_exit = true;
 
 	WARN_ON(kvm_is_exception_pending(vcpu));
@@ -12792,8 +12792,8 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 		return true;
 
 	if (is_guest_mode(vcpu) &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending &&
-	    kvm_x86_ops.nested_ops->hv_timer_pending(vcpu))
+	    kvm_x86_ops.nested_ops->has_events &&
+	    kvm_x86_ops.nested_ops->has_events(vcpu))
 		return true;
 
 	if (kvm_xen_has_pending_events(vcpu))
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

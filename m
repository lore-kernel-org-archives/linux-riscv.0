Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADABC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pj4jHV28hvf4gIR97TipI1ih3xCZwaMEf3K7rDX9bBs=; b=ZeCX70x3KvDkXG
	0+AKViPldsg28W9sPa09HqCxOaYQvbOLyN0G9o8o2gIDJlAXb8SAaPJpn3i5HU3l7EgSXp9dDbjwy
	VhkhXzlT7Mc1aK6e2ji6l3HuHElryyyU60Ro7YHq2hWCso96tsYWvCHvawgB6GBBei/nVAEYfZ/HU
	HkFRJFK8jcbbfFVvYwqLgxVUpLwTFT5R6uYeVwF/CQJbwkt8e3IPyfW1p3X0PPuVEO5SRA455t7dg
	yVNtKpiYfIbaHZ3vZuw4mtoz/vYTLwTUwmSBCsg9VuNSJE2rztRA5srsDPlVdKEcZ2i6oVe9y3IzM
	nRJNK7QTQv+SW6VjrMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oang5-007i4j-TE; Wed, 21 Sep 2022 00:33:25 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfi-007hmM-2N
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:04 +0000
Received: by mail-pf1-x44a.google.com with SMTP id 15-20020a62170f000000b0053e304ef6c0so2559677pfx.6
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=qOL17Oc8lfNiT6vI1N2DgBeo2oQr9pvN4OAUhg4HlfA=;
        b=ARUifQn8X722qfUwF91vggFYXNpMmdld6jHGucJn9mYIHgePg3e3ltjHazRJ7WJQIY
         w+6+dDv/mxautN/CuWkRVIzUB4MM0mFVqAUofjmwyaRB9E3nNhDZAx6ZDYK3UkIvlcW3
         K9NzDWtr9CpQ/CIsHl9VDcl9eNecHkOQ3A4eAV1FpyXScQBTQQwiNPVxGPrxUtBQTP6V
         AEpBQWZgYOtijs1937kE9A8HMcoOQ+ZcnStpwMSDNJZXDvCTzuIS4CNbetfFaKrPYBbF
         SNyUEVo0ACy2TKSphVy9cWwOnuMGoqVKl4ZpNYYdwpjQNgZOx/k9BLzDCMUkycF0nN5P
         tZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=qOL17Oc8lfNiT6vI1N2DgBeo2oQr9pvN4OAUhg4HlfA=;
        b=SdWEPVsC/NBhXQukIs7sZ56ZvGRem08gQmzCd+JchkfzXHVO+SS52LfYjHCx8X+ish
         Kmoq0DJ2xnXjeBmLzGRZRHRBwAKfDOc0ADpyH9rrlCN7jfbzMsMayja65Amar7LlLBS6
         FLGwZjfmtjUKP9+aPZBNQJjt8qPxzxHNaL9FJ0qWzkm2gTf/l4Vc54X/sI6eLKGBqgtx
         z34eNqmLPl5/CcdjakdzRuiAq4WrR7BpBZCR210iSdlUTKy9QnU6ncaeBVq+8AzF1+mr
         kwyXk7kKCkHCZXv2QRfdNtyiBJhmNv2qKvxvDCv7vJVfwMyF18UR22kQC/rHltOgxdJI
         dhZA==
X-Gm-Message-State: ACrzQf2Ycqx77AhphaWjvnDyf5QIecrVADZWdAkQQSNT6yJSxwHkYFg2
	9/q23ysBl7zYagjeXxnCJ0hYmyMncHM=
X-Google-Smtp-Source: AMsMyM6CB910qkp43a3cP5VNkh9ZvqTlylmwVUImF03qdsZIEcBH6bFWk0KDb4437+crJl7uEogrf6c2DIk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:26d4:b0:178:8de:fb5f with SMTP id
 jg20-20020a17090326d400b0017808defb5fmr2230591plb.45.1663720379233; Tue, 20
 Sep 2022 17:32:59 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:56 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-8-seanjc@google.com>
Subject: [PATCH v4 07/12] KVM: nVMX: Make an event request if INIT or SIPI is
 pending on VM-Enter
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
X-CRM114-CacheID: sfid-20220920_173302_162990_C3BD0E9D 
X-CRM114-Status: GOOD (  12.96  )
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

Evaluate interrupts, i.e. set KVM_REQ_EVENT, if INIT or SIPI is pending
when emulating nested VM-Enter.  INIT is blocked while the CPU is in VMX
root mode, but not in VMX non-root, i.e. becomes unblocked on VM-Enter.
This bug has been masked by KVM calling ->check_nested_events() in the
core run loop, but that hack will be fixed in the near future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 3a080051a4ec..5922531f6c52 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -3377,6 +3377,8 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 		(CPU_BASED_INTR_WINDOW_EXITING | CPU_BASED_NMI_WINDOW_EXITING);
 	if (likely(!evaluate_pending_interrupts) && kvm_vcpu_apicv_active(vcpu))
 		evaluate_pending_interrupts |= vmx_has_apicv_interrupt(vcpu);
+	if (!evaluate_pending_interrupts)
+		evaluate_pending_interrupts |= kvm_apic_has_pending_init_or_sipi(vcpu);
 
 	if (!vmx->nested.nested_run_pending ||
 	    !(vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS))
@@ -3457,18 +3459,10 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 	}
 
 	/*
-	 * If L1 had a pending IRQ/NMI until it executed
-	 * VMLAUNCH/VMRESUME which wasn't delivered because it was
-	 * disallowed (e.g. interrupts disabled), L0 needs to
-	 * evaluate if this pending event should cause an exit from L2
-	 * to L1 or delivered directly to L2 (e.g. In case L1 don't
-	 * intercept EXTERNAL_INTERRUPT).
-	 *
-	 * Usually this would be handled by the processor noticing an
-	 * IRQ/NMI window request, or checking RVI during evaluation of
-	 * pending virtual interrupts.  However, this setting was done
-	 * on VMCS01 and now VMCS02 is active instead. Thus, we force L0
-	 * to perform pending event evaluation by requesting a KVM_REQ_EVENT.
+	 * Re-evaluate pending events if L1 had a pending IRQ/NMI/INIT/SIPI
+	 * when it executed VMLAUNCH/VMRESUME, as entering non-root mode can
+	 * effectively unblock various events, e.g. INIT/SIPI cause VM-Exit
+	 * unconditionally.
 	 */
 	if (unlikely(evaluate_pending_interrupts))
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

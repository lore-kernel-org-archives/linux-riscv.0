Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E86AC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpyiKjm/d9V4/ljyWPPJ3RyY+c8XRix4FA2QdDzs6Fw=; b=JRoqIZRxSVsEwM
	JEAFmaC+bhU/LLuUgejzHt4e0Uma5N4g5N5J9Q4Flh7ba/+BvXadA0bJUUmHuvvA4+3jR6I44yEW2
	kU3mB1V8YHCregZF5IaDuLLvM+aNsVRf9V5dO9l5scRnkaWSFeMM6Do/RySG3is/OLPPfk8NH8cTi
	wCYV7PoMflyiYyQOYRKjGP3KsiWKbSbYiwvfs/hUYxMgP1HMQHtzQ2X/DHmyu8dplMmD9hIZxlTUr
	PsBLO2FclkQARMuLs//lB54D+oUPpMxZ9uCMGRCrPIN96FS1kunwwOaPdPUMiHoydTi0RIN6JqFRt
	5+ch5eOiLuFCWxDSG2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVAP-00000005dnC-3clJ;
	Sat, 27 Jul 2024 00:20:09 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlS-00000005QX2-0B6K
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d1df50db2so1368340b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038061; x=1722642861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=495sZLd3sCBTMIrtoKFKEohUXAwQ30LA4hbLQQBllaM=;
        b=sDvOePFAvFgC8uzSLk4jiOO2dWqP7lcelY38TFcY8u3eC3K0BWfeJXcSmrJAelD/ps
         scCgnPTVhWfXLxOE9Hwb5N1TA/J3gkKhceTw7e0/HfcsLcbhGNn4Sul3t8IfH2G1Uq69
         WmK2EqQLL9KfYwSi4MxTSBNWL+jpuuE9so1a5EAokko1O/4zLb6L15Ro2TskUbUN8TMh
         npGUP8ESxShD3krMjJp2X7IS+69JtgGK3KgCzhXmw2eMM1OIcKtEsiMGuszpz3qQmwlg
         eqTZBipk7LWfJj8tNWknQkJzqdJzwX2OEJI7lO1BbprFFQwmqWRSackU2zvIoPw/XIFg
         63/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038061; x=1722642861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=495sZLd3sCBTMIrtoKFKEohUXAwQ30LA4hbLQQBllaM=;
        b=nPBlCaz4a1l4pmd3fh4RCxBubbAl7A0BrQuyqznDu3tHy1VOTF5JqwMUQVGSOIAvd/
         8ufyVx1AMn/u/uWcSoOu7M9YUexWJglDpFbecNE3096RoPGmxSVczTMfXRoCcqtDACOa
         5xEwgYtcUlnqFO2VDN3PSos0hdZbpzdFm2Qwh5ZNj4cc1bT7PaozEwpNw7KshEgQWKNG
         aqloOcIRJFyhgbR40LjZiAtSE+hMsfw8BgJhK9Mg+Up0/qF+UXHxcr629uQbxUDq1o23
         iKw0NS20QMU3vSCh72zANg2T2vV00oCJNqcYT1/hCg1HTnjZBLEtxCLKCmM2WmIyJG+h
         dEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7oZvzG5n3N26rQKO3pebEnDzIaTJcAsp5WekR6btm6c04jsdZ54oeHoXDuHzpzcmCZzd8V5AJRlFOphoeLgwkSNm8YVdnNitNAmZ1dyrk
X-Gm-Message-State: AOJu0YyKQ+gcHGcZ1zyjzVDxg8jbOLHf/HiMT3YV7gX9VVovvaywPYKf
	2/6xIjEH8iICHWV3JIGg+qxKIL09V+NIo2g1+X42ae5k02BmBgrdEirtKXeJrbaiNZAq3maqPLf
	lCA==
X-Google-Smtp-Source: AGHT+IEX18wdLlkp+2aMf2anoWcNTpOtSr1c0ECGrHfjhmBCNZQh1f0vS16HR3FEGEctU7qtPLZbGkdGSSc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:70d:138a:bee8 with SMTP id
 d2e1a72fcca58-70ece533146mr8925b3a.0.1722038060383; Fri, 26 Jul 2024 16:54:20
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:59 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-51-seanjc@google.com>
Subject: [PATCH v12 50/84] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165422_383617_0F50C363 
X-CRM114-Status: GOOD (  14.99  )
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

Use __kvm_faultin_page() get the APIC access page so that KVM can
precisely release the refcounted page, i.e. to remove yet another user
of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
page fault, the semantics are effectively the same; KVM just happens to
be mapping the pfn into a VMCS field instead of a secondary MMU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 30032585f7dc..b109bd282a52 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6786,8 +6786,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memslots *slots = kvm_memslots(kvm);
 	struct kvm_memory_slot *slot;
+	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	bool ign;
 
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6823,7 +6825,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn = gfn_to_pfn_memslot(slot, gfn);
+	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &ign, &refcounted_page);
 	if (is_error_noslot_pfn(pfn))
 		return;
 
@@ -6834,10 +6836,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
 
 	/*
-	 * Do not pin apic access page in memory, the MMU notifier
-	 * will call us again if it is migrated or swapped out.
+	 * Do not pin the APIC access page in memory so that it can be freely
+	 * migrated, the MMU notifier will call us again if it is migrated or
+	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
+	 * should always point at a refcounted page (if the pfn is valid).
 	 */
-	kvm_release_pfn_clean(pfn);
+	if (!WARN_ON_ONCE(!refcounted_page))
+		kvm_release_page_clean(refcounted_page);
 
 	/*
 	 * No need for a manual TLB flush at this point, KVM has already done a
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768F6C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCx5Nv3CC+/5ckAFlJfe4WLpUKmcMvcKlXm88AdJrZI=; b=FhStmM1RdpYymT
	Zs7VmiOgM5zs2kQRg2FH4ycL75lKAIvVZhSBsr069dg0bPpizoY8kayBg0FGbGSmtC4NS3aSN/UIy
	XojLQk3WKciNTNcJve9DJbTPJVQnV7M1gxCuYMtd5ZJHzAoMSmDEckAfEc+SMNnUgwXBqGrJWv5Tg
	mrRpz6Vkst4178LDFvBYESGnLkeikSm6PnSSD7t7UMMaXpBDoGW6790NhvGKm+NaZCbupub8RufGH
	ooO7cXtS2Fux/MpdypD+6zdaq3xBx9IlIxtWAQlRQunTgSI60ECkM4r+btRpd8Nbv92T5Wv3BOvIP
	2/bMAsAZgcGTxbNSNM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUz3-00000005YHT-1oAR;
	Sat, 27 Jul 2024 00:08:25 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUl1-00000005QAT-14zM
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:57 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70d1d51f3e9so1504844b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038034; x=1722642834; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WZrNaP2gtmwMUuypG9xN5YPW8gmxxvZG3Q4zEjuRFyk=;
        b=SLxWDAOjcO+YeiId+O4qMU3uqrENr8CqVMy/4z08UDYW1WaxrwLJI7lTTpTlWejR40
         7ofD7MCOfSl49G0eqbRB//ETO9pMCx4U8Rs2lFivy0DNlNcEVmyi8da0h8tt04xdhpyY
         Gj4RAyld31uCidFXKb3KEmgBCJ8UdW3gWA6HVqM8olCyQwNLJc7eLdaM4zu2OKPBF5v/
         ZaeCkc4Rg026xHgNaEcwkBsnP4r6AUWYI2e4em/JR5yeo0nZQUlHAinwoBXro12T/0wi
         Qje6jjZQsi+jeIqL19JtWkQxdgZ2Fa+xr2Ruh0PGxvixj0iEKl65MZBqwvc+14AgzyYq
         LTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038034; x=1722642834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZrNaP2gtmwMUuypG9xN5YPW8gmxxvZG3Q4zEjuRFyk=;
        b=oYe/ijoxSmGbC/fVPj/gGMWz+r/WPrdyo3skiNwxxJ9zw1IqBV+age7PB5FSS9whQ9
         WZFgjhVGM3w51I13peETWZTtVM98lJRyVMvtBozHRf6FLT65umEbCG1PyB1ve6bQqG+m
         aAX8l+9oWVLvuy2uCRuzkl7NAgkq2Yz7YWVBm0XXm+2LXk698A5gbY+u60iEH9YnmhGG
         8J1+KawGlVbMpIjjqiMjWA1ttgZvYsjhqapxYq/wT5kGMnRwfWrGOurKVdPIFD+Y40Ox
         LgOLmunSQtntZcM45mpCjmGDFyREpWxENntU9v7yI8BdigKL63BbGEQPDVRT4TJlKGF4
         JQtw==
X-Forwarded-Encrypted: i=1; AJvYcCVmxh6LTj95tXcfOJ8TaEfB+2rs21IR/HWOHou1yKN4cr9B/OARH9fI8NCivkK3bK5oLiqQqCvOlB+VbG05dXRz5cSlu/W3RcJ9Nhhi6Z99
X-Gm-Message-State: AOJu0YxHjl9gq2qL6lXf2sOYY8CNJAD4tBpW8sfVFbsgdzE1LKWcG2vz
	MRVxykHpvAT16K8nWVvhcC+/nq1t8RPPATSlEMztxRfmtX8Q9U7sKjoFSsfAEhX3NIftmsG/d60
	r+w==
X-Google-Smtp-Source: AGHT+IGBlhv2aegJ385ep1cUBQA5c+rLA7WdLDI/xGSka7RxNxI5KP3IWpNdT5/lkHtS9+xMECoFkdebDOk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1829:b0:70d:1bf2:2878 with SMTP id
 d2e1a72fcca58-70ecee0a0ebmr24898b3a.5.1722038033787; Fri, 26 Jul 2024
 16:53:53 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:46 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-38-seanjc@google.com>
Subject: [PATCH v12 37/84] KVM: x86/mmu: Add "mmu" prefix fault-in helpers to
 free up generic names
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
X-CRM114-CacheID: sfid-20240726_165355_327051_C42A1F4F 
X-CRM114-Status: GOOD (  12.61  )
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

Prefix x86's faultin_pfn helpers with "mmu" so that the mmu-less names can
be used by common KVM for similar APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 19 ++++++++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a201b56728ae..4d30920f653d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4301,8 +4301,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	return req_max_level;
 }
 
-static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				   struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				       struct kvm_page_fault *fault)
 {
 	int max_order, r;
 
@@ -4325,10 +4325,11 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	return RET_PF_CONTINUE;
 }
 
-static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
+static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+				 struct kvm_page_fault *fault)
 {
 	if (fault->is_private)
-		return kvm_faultin_pfn_private(vcpu, fault);
+		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable);
@@ -4363,8 +4364,8 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	return RET_PF_CONTINUE;
 }
 
-static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
-			   unsigned int access)
+static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+			       struct kvm_page_fault *fault, unsigned int access)
 {
 	struct kvm_memory_slot *slot = fault->slot;
 	int ret;
@@ -4447,7 +4448,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn))
 		return RET_PF_RETRY;
 
-	ret = __kvm_faultin_pfn(vcpu, fault);
+	ret = __kvm_mmu_faultin_pfn(vcpu, fault);
 	if (ret != RET_PF_CONTINUE)
 		return ret;
 
@@ -4524,7 +4525,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
@@ -4617,7 +4618,7 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index f67396c435df..a5113347bb12 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -235,7 +235,7 @@ struct kvm_page_fault {
 	/* The memslot containing gfn. May be NULL. */
 	struct kvm_memory_slot *slot;
 
-	/* Outputs of kvm_faultin_pfn.  */
+	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
 	bool map_writable;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index bc801d454f41..b02d0abfca68 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -811,7 +811,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, walker.pte_access);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, walker.pte_access);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

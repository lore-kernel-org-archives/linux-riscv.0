Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4EC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEp/5jTeYAyNH6eY3psV6yCe5m6n3DhC96UYpWzsEj4=; b=gd1WU/I98y246k
	XcLKPkK9Yz+M7uDWPH5oQBZuW0V97NbrWwQ64EFe2nlxYMRspt+4dnzQ+lI6VWCicxf4gZf83LTF2
	EPpvioiJaSdyL1j26p0ZU3m6on9tMzhHIV+fk1ZRy73aXL9kbIALtWwdAJdMyJIHys/PAl6IASG1x
	WrINXOeG6xloph/wh/agvnHuq1YtpiCzgWpxodqWGv0xeQ5fUfp6wpgLhF2VN04Ijk4EkniFFbHTV
	TiYST5qBmvQLzqkryivcdzuLg+zmoddEY4O0gacA4kjWDlX0LGixtAHVqyPZTx6ZHXHenyDBPrT5x
	O2V+NauR0se0wZ9eQ22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV7i-00000005cIK-3c3N;
	Sat, 27 Jul 2024 00:17:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlI-00000005QNn-1kKm
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc52d3c76eso12299625ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038051; x=1722642851; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RjeQeusXYf+NFoksbIMp6SJLG4xl7UVW4NR1eYCui2c=;
        b=D6x+/kPwbuj6kN3vq1dXXmy8agRQNfx+O9qk9E+4qTWtpoivA9Q1xKx7nnQIa3kr4W
         hrtFWzyAa6gXIwGGsoNlFDsbEQJg0y7D7Pl8kYwWfOb7Ab0r3T1s/Mmt5O0YWSdYCcgo
         a6f6qobdasfL/bbhlgdinfGsrxplkIWqEz0Plz/ksxhiijZ6SwM11NQfnpT4lxFjl0b2
         Xbfj/gNNeNNNhHkHvKzad41zgmmFg/pfLSbD8C+8hB9+jiJPycjIyOZfxddsRSdONRxS
         kKghEvpyTERLU2UTSePykaJhXls3B3jOFUOhg351U6kWx60bu9DEvSx9B/aKwHfSMG84
         TeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038051; x=1722642851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjeQeusXYf+NFoksbIMp6SJLG4xl7UVW4NR1eYCui2c=;
        b=mvrnnA++UjlIZ+9SD5s8yB/NBjAWC7xAMG68il7Fp9J62DQ19/otqrMqXtPmRO2pJD
         7GrhL2zJ2h8d14j3Kw2xD0Of1sJhROM+yWBZJsJ6a0pFSXD7NL9d0HO+ONEYWgJFSvoa
         n5JGYtxXxPXcKU9OWGPIy15PDJVWrCBpw4dsbfjmyf2dtq+7xT34wV7Ac7XH2cZtNtai
         wHBlpvWrpEuqmbknPsDh/e/a8k/Def5wJM6siqmjsavtdbBf/CBHJLwKCNKAgbjy6Dav
         bVLunXu9VPpJqufCBkw2RxynSEFxnai69U7araw1x7ycG9O71asFyBOUidx5i1fkwv2S
         N5yw==
X-Forwarded-Encrypted: i=1; AJvYcCVGgE0+eZiAIe86qvvKG+c0bIgKEamE1MZyFof05CmUNjFSxTYbKRa4K7d/1o+k35qlDOUv4LeAIoktgLwbXbzRvPamBynzN4uH3UHPRZuJ
X-Gm-Message-State: AOJu0Yw2yW/UeLawwY8hn9SMI81z7p6tZc1XRzMQX47VAK++znd0NSB4
	XZmWANLWtc9Zz/Wi7aGrvKWMZH1mduKAx9b5kUKvXhtOToeyMSlD7DhEwAjlrvSS6roE7X3m0op
	1Yg==
X-Google-Smtp-Source: AGHT+IH9Sleax7HjGR/xKBhc5+sBB7ouHNPkUkQToWM2on12s7r2/JIy8m8cUdV6C+LgY7aIUstVbYLK+Ts=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:244b:b0:1fb:82f5:6631 with SMTP id
 d9443c01a7336-1ff04898c7dmr609255ad.9.1722038050968; Fri, 26 Jul 2024
 16:54:10 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:54 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-46-seanjc@google.com>
Subject: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as output
 from kvm_gmem_get_pfn()
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
X-CRM114-CacheID: sfid-20240726_165412_570308_AC99E152 
X-CRM114-Status: GOOD (  15.39  )
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

Provide the "struct page" associated with a guest_memfd pfn as an output
from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
directly put the page instead of having to rely on
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 10 ++++++----
 include/linux/kvm_host.h |  6 ++++--
 virt/kvm/guest_memfd.c   | 19 +++++++++++--------
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 53555ea5e5bb..146e57c9c86d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4353,7 +4353,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &max_order);
+			     &fault->refcounted_page, &max_order);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 62f63fd714df..5c125e4c1096 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3847,6 +3847,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
 		gfn_t gfn = gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
 		struct kvm_memory_slot *slot;
+		struct page *page;
 		kvm_pfn_t pfn;
 
 		slot = gfn_to_memslot(vcpu->kvm, gfn);
@@ -3857,7 +3858,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 		 * The new VMSA will be private memory guest memory, so
 		 * retrieve the PFN from the gmem backend.
 		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
 			return -EINVAL;
 
 		/*
@@ -3886,7 +3887,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 		 * changes then care should be taken to ensure
 		 * svm->sev_es.vmsa is pinned through some other means.
 		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
 	}
 
 	/*
@@ -4686,6 +4687,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = vcpu->kvm;
 	int order, rmp_level, ret;
+	struct page *page;
 	bool assigned;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
@@ -4712,7 +4714,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 		return;
 	}
 
-	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
 	if (ret) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
 				    gpa);
@@ -4770,7 +4772,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 out:
 	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
 out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
 }
 
 static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e0548ae92659..9d2a97eb30e4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2462,11 +2462,13 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 
 #ifdef CONFIG_KVM_PRIVATE_MEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
-				   kvm_pfn_t *pfn, int *max_order)
+				   kvm_pfn_t *pfn, struct page **page,
+				   int *max_order)
 {
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 1c509c351261..ad1f9e73cd13 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -542,12 +542,12 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 }
 
 static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
-		       gfn_t gfn, kvm_pfn_t *pfn, int *max_order, bool prepare)
+			      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			      int *max_order, bool prepare)
 {
 	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	struct kvm_gmem *gmem = file->private_data;
 	struct folio *folio;
-	struct page *page;
 	int r;
 
 	if (file != slot->gmem.file) {
@@ -571,9 +571,9 @@ static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 		return -EHWPOISON;
 	}
 
-	page = folio_file_page(folio, index);
+	*page = folio_file_page(folio, index);
 
-	*pfn = page_to_pfn(page);
+	*pfn = page_to_pfn(*page);
 	if (max_order)
 		*max_order = 0;
 
@@ -585,7 +585,8 @@ static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 }
 
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order)
 {
 	struct file *file = kvm_gmem_get_file(slot);
 	int r;
@@ -593,7 +594,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!file)
 		return -EFAULT;
 
-	r = __kvm_gmem_get_pfn(file, slot, gfn, pfn, max_order, true);
+	r = __kvm_gmem_get_pfn(file, slot, gfn, pfn, page, max_order, true);
 	fput(file);
 	return r;
 }
@@ -604,6 +605,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 {
 	struct file *file;
 	struct kvm_memory_slot *slot;
+	struct page *page;
 	void __user *p;
 
 	int ret = 0, max_order;
@@ -633,7 +635,8 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 			break;
 		}
 
-		ret = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &max_order, false);
+		ret = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &page,
+					  &max_order, false);
 		if (ret)
 			break;
 
@@ -644,7 +647,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 		p = src ? src + i * PAGE_SIZE : NULL;
 		ret = post_populate(kvm, gfn, pfn, p, max_order, opaque);
 
-		put_page(pfn_to_page(pfn));
+		put_page(page);
 		if (ret)
 			break;
 	}
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9259CC25B72
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lOfAAjf5k+V4KiRWqkfOj8TfNaEDyf42Vqqj/oiqJA=; b=Eu4z1Ol/ahR479
	Sc3w1FoXMma+vAfGps9s1za7ywGl/nFI32Oalsobi9K7jKV09olUgJ4MnHMoHRLh1uuxU/asbJPFB
	lplq/XW7Lf78bGrrTPwqaq9yhcO9UWg+NEYLe0mFav4sLypIP5vV23xVC6o0R9Aj4NtqPgBhmNRn+
	F983j9+9ZWc+GjOuXMGSPqVAsIGdA6aujG0K41DjxoxQg0VCZ60/SRI8n8pqvgTBJ+un6/7qnfbts
	fbxaNLAXaGd0rOpo2RKq/S6mlDoKhwhxyQmkbUjej+MJuRPdQhMiyVPNJXUeW02BZsbS8CWc2okTK
	TcvQPE8uTh4Wj7FvJZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSXl-00H5Iu-1S;
	Fri, 27 Oct 2023 19:30:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTi-00Gwr2-1F
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0ecI9u+NU7x+hIBqOXm0c4fKiWu/1/+75d/SeCcbF3U=; b=obpDcUNDpQ9YIF0hbdCyxVWEcq
	jtUgzp9f5FD6YhtTB2QZbN/VEQ2LjfgRYC4iSpBwrn9C39TVFoU92bH+0mPqBKWMg2mUppJTp6toV
	QCRlGQg6wdlOQ5/fHIuxgUe9J4F5iqzCwdrgY9V0BIBcSUKj9Qfei9VJen/HKafLwcUQDlaoo0YMR
	uKlQxUxDE0ASpjYdNJSFxDOo31KOpCCSv2piamZzW0qVTsN8rpXClfBxKxItOvWqjxK04DiN8ovsO
	I2Bk1Ko7hdBkDrVKDzcaHlcAJGABH6doJhWvraehy81ci5clGmxS1OeuoG+D/nEz/2Y7hLWcE5Ait
	W0t6DdTg==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTe-000uT1-1T
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:37 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5af9ad9341fso10342937b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430951; x=1699035751; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0ecI9u+NU7x+hIBqOXm0c4fKiWu/1/+75d/SeCcbF3U=;
        b=NT3v1yKuApY89WbUT+10jqlOyR/ZhTOSwWqHXKlFXtZFMhpqaoEAqgz8x172WaWJei
         Q1jrdvHRvLKmGkiq64WNxZJXNWTDxPnbG8fwrfESMfLjq+4aiolzq/eA0uutIsu4a90/
         IdcfLonoVY7qd5QM9c5UTR95b66bnwUityKURtF9Dp3omZSjJAbmZuw1+sstiwQDwDwG
         O1VlbeICdZJt2LkxKm0ZkcWY77Vgf4dsSOcQDZZaP5utO3AwQNhqif1TMsV0xG4rBG8s
         0Rwg7WvQweF/3mptP4Zlgc78oVfMclbOKmUr1KRfOiLEXIjZS0maW3KywaqRfD7I7kr3
         GsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430951; x=1699035751;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ecI9u+NU7x+hIBqOXm0c4fKiWu/1/+75d/SeCcbF3U=;
        b=sFoqmy0oNa/lcBOmv6lr+DLGOx++TdanDO5gNiZsZGfqAMwcJ1DFioUoU1lMlOEudR
         m+FgodU6/4enGlsdW4ZwyOEbb3GreweTiMExRO03K1h+KngFRV1ZR+Ug5/reyYu2Vjni
         0FXcqaxznmh/HQzHd/8Q64tMpWm6xNdi5P61e/VeCn9IpDcD/p3CnEavthCg734MrKAi
         a8B+B992FPFqnJ4VYStWKj+Yo2AAiOFp4CTLNCsyRgXMdG/0Z75ApwJHtMNlG9Wjoop0
         cfVosCMRxU3w7fAtEe7VZyHnp6sstiUe8cOMNQLvUBRxXLTR809BGMgSgUv4sz6I8mYz
         mS3A==
X-Gm-Message-State: AOJu0YzCGTyBc8SZnDemx9XNf9t52/vDbrm5t4eE8vAVi9cvarqk5AsW
	V4TZ8Y3zoqjGKWvurr8FrYO+var/hXA=
X-Google-Smtp-Source: AGHT+IEVX0PyerXEbWK1UOBgKc7BZmLynzYtP989xU7q9rVAiqIPcpbzc0WQAlmV6uCIwfdxpJ3o/vng1sw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4858:0:b0:5a7:be3f:159f with SMTP id
 v85-20020a814858000000b005a7be3f159fmr70939ywa.5.1698430951577; Fri, 27 Oct
 2023 11:22:31 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:45 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-4-seanjc@google.com>
Subject: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192234_808474_3B97C69D 
X-CRM114-Status: GOOD (  24.47  )
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

From: Chao Peng <chao.p.peng@linux.intel.com>

Currently in mmu_notifier invalidate path, hva range is recorded and
then checked against by mmu_notifier_retry_hva() in the page fault
handling path. However, for the to be introduced private memory, a page
fault may not have a hva associated, checking gfn(gpa) makes more sense.

For existing hva based shared memory, gfn is expected to also work. The
only downside is when aliasing multiple gfns to a single hva, the
current algorithm of checking multiple ranges could result in a much
larger range being rejected. Such aliasing should be uncommon, so the
impact is expected small.

Suggested-by: Sean Christopherson <seanjc@google.com>
Cc: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
[sean: convert vmx_set_apic_access_page_addr() to gfn-based API]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 10 ++++++----
 arch/x86/kvm/vmx/vmx.c   | 11 +++++------
 include/linux/kvm_host.h | 33 ++++++++++++++++++++------------
 virt/kvm/kvm_main.c      | 41 +++++++++++++++++++++++++++++++---------
 4 files changed, 64 insertions(+), 31 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f7901cb4d2fa..d33657d61d80 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3056,7 +3056,7 @@ static void direct_pte_prefetch(struct kvm_vcpu *vcpu, u64 *sptep)
  *
  * There are several ways to safely use this helper:
  *
- * - Check mmu_invalidate_retry_hva() after grabbing the mapping level, before
+ * - Check mmu_invalidate_retry_gfn() after grabbing the mapping level, before
  *   consuming it.  In this case, mmu_lock doesn't need to be held during the
  *   lookup, but it does need to be held while checking the MMU notifier.
  *
@@ -4358,7 +4358,7 @@ static bool is_page_fault_stale(struct kvm_vcpu *vcpu,
 		return true;
 
 	return fault->slot &&
-	       mmu_invalidate_retry_hva(vcpu->kvm, fault->mmu_seq, fault->hva);
+	       mmu_invalidate_retry_gfn(vcpu->kvm, fault->mmu_seq, fault->gfn);
 }
 
 static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
@@ -6245,7 +6245,9 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 
 	write_lock(&kvm->mmu_lock);
 
-	kvm_mmu_invalidate_begin(kvm, 0, -1ul);
+	kvm_mmu_invalidate_begin(kvm);
+
+	kvm_mmu_invalidate_range_add(kvm, gfn_start, gfn_end);
 
 	flush = kvm_rmap_zap_gfn_range(kvm, gfn_start, gfn_end);
 
@@ -6255,7 +6257,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	if (flush)
 		kvm_flush_remote_tlbs_range(kvm, gfn_start, gfn_end - gfn_start);
 
-	kvm_mmu_invalidate_end(kvm, 0, -1ul);
+	kvm_mmu_invalidate_end(kvm);
 
 	write_unlock(&kvm->mmu_lock);
 }
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 72e3943f3693..6e502ba93141 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6757,10 +6757,10 @@ static void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		return;
 
 	/*
-	 * Grab the memslot so that the hva lookup for the mmu_notifier retry
-	 * is guaranteed to use the same memslot as the pfn lookup, i.e. rely
-	 * on the pfn lookup's validation of the memslot to ensure a valid hva
-	 * is used for the retry check.
+	 * Explicitly grab the memslot using KVM's internal slot ID to ensure
+	 * KVM doesn't unintentionally grab a userspace memslot.  It _should_
+	 * be impossible for userspace to create a memslot for the APIC when
+	 * APICv is enabled, but paranoia won't hurt in this case.
 	 */
 	slot = id_to_memslot(slots, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT);
 	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
@@ -6785,8 +6785,7 @@ static void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		return;
 
 	read_lock(&vcpu->kvm->mmu_lock);
-	if (mmu_invalidate_retry_hva(kvm, mmu_seq,
-				     gfn_to_hva_memslot(slot, gfn))) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
 		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
 		read_unlock(&vcpu->kvm->mmu_lock);
 		goto out;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index fb6c6109fdca..11d091688346 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -787,8 +787,8 @@ struct kvm {
 	struct mmu_notifier mmu_notifier;
 	unsigned long mmu_invalidate_seq;
 	long mmu_invalidate_in_progress;
-	unsigned long mmu_invalidate_range_start;
-	unsigned long mmu_invalidate_range_end;
+	gfn_t mmu_invalidate_range_start;
+	gfn_t mmu_invalidate_range_end;
 #endif
 	struct list_head devices;
 	u64 manual_dirty_log_protect;
@@ -1392,10 +1392,9 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
 void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 #endif
 
-void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
-			      unsigned long end);
-void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
-			    unsigned long end);
+void kvm_mmu_invalidate_begin(struct kvm *kvm);
+void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end);
+void kvm_mmu_invalidate_end(struct kvm *kvm);
 
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg);
@@ -1970,9 +1969,9 @@ static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
 	return 0;
 }
 
-static inline int mmu_invalidate_retry_hva(struct kvm *kvm,
+static inline int mmu_invalidate_retry_gfn(struct kvm *kvm,
 					   unsigned long mmu_seq,
-					   unsigned long hva)
+					   gfn_t gfn)
 {
 	lockdep_assert_held(&kvm->mmu_lock);
 	/*
@@ -1981,10 +1980,20 @@ static inline int mmu_invalidate_retry_hva(struct kvm *kvm,
 	 * that might be being invalidated. Note that it may include some false
 	 * positives, due to shortcuts when handing concurrent invalidations.
 	 */
-	if (unlikely(kvm->mmu_invalidate_in_progress) &&
-	    hva >= kvm->mmu_invalidate_range_start &&
-	    hva < kvm->mmu_invalidate_range_end)
-		return 1;
+	if (unlikely(kvm->mmu_invalidate_in_progress)) {
+		/*
+		 * Dropping mmu_lock after bumping mmu_invalidate_in_progress
+		 * but before updating the range is a KVM bug.
+		 */
+		if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
+				 kvm->mmu_invalidate_range_end == INVALID_GPA))
+			return 1;
+
+		if (gfn >= kvm->mmu_invalidate_range_start &&
+		    gfn < kvm->mmu_invalidate_range_end)
+			return 1;
+	}
+
 	if (kvm->mmu_invalidate_seq != mmu_seq)
 		return 1;
 	return 0;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5a97e6c7d9c2..1a577a25de47 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -543,9 +543,7 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
 
 typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
-typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
-			     unsigned long end);
-
+typedef void (*on_lock_fn_t)(struct kvm *kvm);
 typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 
 struct kvm_mmu_notifier_range {
@@ -637,7 +635,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 				locked = true;
 				KVM_MMU_LOCK(kvm);
 				if (!IS_KVM_NULL_FN(range->on_lock))
-					range->on_lock(kvm, range->start, range->end);
+					range->on_lock(kvm);
+
 				if (IS_KVM_NULL_FN(range->handler))
 					break;
 			}
@@ -742,16 +741,29 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
 	kvm_handle_hva_range(mn, address, address + 1, arg, kvm_change_spte_gfn);
 }
 
-void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
-			      unsigned long end)
+void kvm_mmu_invalidate_begin(struct kvm *kvm)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
 	/*
 	 * The count increase must become visible at unlock time as no
 	 * spte can be established without taking the mmu_lock and
 	 * count is also read inside the mmu_lock critical section.
 	 */
 	kvm->mmu_invalidate_in_progress++;
+
 	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
+		kvm->mmu_invalidate_range_start = INVALID_GPA;
+		kvm->mmu_invalidate_range_end = INVALID_GPA;
+	}
+}
+
+void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
+{
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
+
+	if (likely(kvm->mmu_invalidate_range_start == INVALID_GPA)) {
 		kvm->mmu_invalidate_range_start = start;
 		kvm->mmu_invalidate_range_end = end;
 	} else {
@@ -771,6 +783,12 @@ void kvm_mmu_invalidate_begin(struct kvm *kvm, unsigned long start,
 	}
 }
 
+static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
+	return kvm_unmap_gfn_range(kvm, range);
+}
+
 static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
@@ -778,7 +796,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	const struct kvm_mmu_notifier_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.handler	= kvm_unmap_gfn_range,
+		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
 		.on_unlock	= kvm_arch_guest_memory_reclaimed,
 		.flush_on_ret	= true,
@@ -817,8 +835,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	return 0;
 }
 
-void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
-			    unsigned long end)
+void kvm_mmu_invalidate_end(struct kvm *kvm)
 {
 	/*
 	 * This sequence increase will notify the kvm page fault that
@@ -834,6 +851,12 @@ void kvm_mmu_invalidate_end(struct kvm *kvm, unsigned long start,
 	 */
 	kvm->mmu_invalidate_in_progress--;
 	KVM_BUG_ON(kvm->mmu_invalidate_in_progress < 0, kvm);
+
+	/*
+	 * Assert that at least one range was added between start() and end().
+	 * Not adding a range isn't fatal, but it is a KVM bug.
+	 */
+	WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA);
 }
 
 static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

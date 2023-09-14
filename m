Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AA2EE0219
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3T8M6bbSYr7GzpLn86woacfbv786j7xHXvQRfUc4Pqw=; b=pnzycHrNQZMeAz
	MbzxMDoaFJRoebEu9mUfw+EXLrZsPP4MjDARMIRxz4PkN1YqCevUGiCR33Xt0LR1DbWZfE8GJbOBq
	tvZYJs47soL3Ozx/93EUP8X2Rb23eFcTSyZtq2UVwP1BwxcLMI0eZpue9S7f56N21hhd6DzsfFWh0
	1AQ6RNs53f/ozqLTRWhl+VpcHuA0u8k9RGk4U+bELOF6p8GqlZiIwuC1fymDpGZUa5mYGKEQdguC/
	gMIRUS+f1zpB4bmgm7ZbbOv1ZLYsQbPAJw2Fo83UjfCEuTW8r/1gu6bW9GYC4eZnB+ZLDT/FmCMq8
	qWDIYFOfP0s/nioNcm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbd0-0075er-2M;
	Thu, 14 Sep 2023 01:58:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbak-0073Wr-1t
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kuaopqTQwIJoODQjwL8UCc8nafSHAqskK1PNRD1zt6Q=; b=l8UCldfNRdKM/D3ZLNy4Cy2c6K
	KZGOxo0mpSGipjjy6Uxe/rM+5HIYXrsBjTMzfxlGs7BNfHMewWoBzUfGzmZgvGYXzKERSvcZNJHSu
	2gbIMUySMuPu7oYq5xQkSPHmsYDowIBc+Nr+ZOnkyUb/q9sUhzpbf00ABaiVBH67pdx7I063Psotk
	O6sCatw+fWEGpkElU1fFnE85Se5ce0z35DUNDa4O8qWddwKkY6IS+wleRN0r1r6RokPKv2pSLuvMb
	er/PSU0qRTbkpMAs5CEzlBgAqVhV/fv7KWXVR5as96LEvJwAt6ZHBIojo5o5H3/NUpD4kDkqBYMwg
	qWLNm0Sg==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbab-007TcS-0U
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:24 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c3fa9a27ffso4434845ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656576; x=1695261376; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kuaopqTQwIJoODQjwL8UCc8nafSHAqskK1PNRD1zt6Q=;
        b=c6NwBxFmg+euGQx8Ds4Au1lyhIgk76VNs7mYkJ70Ddqr7PLWmrxwSyP5Phf/JuNKZ0
         k/GV6g6WNraYIpFscWNDbhAyJJI9f7MxdN7/4k8a+0VNtnqHJ/jlqllTJ4VuXkwPMpM5
         rHWuh56cOMB3M7Vr82WKZXu4Ei11SXs41ndXBIy1ZgcLi7719a6Fq6E5/1bsqh2fMGr6
         hgcSkSC4BUUg3bZwfoaLbwn9+8s5Zu1H4rdQFNPxCLHTSKBi7giwAvvNl9XmmPxbZZ/w
         9YuxMgd1hxwfSWuhq4a9Ev/Z3OpwM+nB0iU96nrlkiw0Sh6Pyz7zUod/gyOs8XWClFmx
         d5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656576; x=1695261376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuaopqTQwIJoODQjwL8UCc8nafSHAqskK1PNRD1zt6Q=;
        b=DOEYQ+DC5hydModaH5Dxn4iLzUushW5bxodvuG3jf++hfCE2JajdB+FccmEJiQztQL
         YY7weGm7vcQ5MF6asPJuWwXKw5wj/ms6KBUBJuHmQb7n4ogf4GpzIj6SRFuPoKiGi8bV
         emgMX9PQ2cTRkWqDWjPbFowEW7/rKFc2wmpV32/q/pwvDzi1drE+FpAgkz8+fNqOXg+0
         V1O89r0ALwRfdgaQydfZE9GAOdR0DTRMoILNP1xuVeXYoQ+RNhKUsL0kVDz9qVObDHw5
         ZcdYkMUnw4dCZrteUCkujPSlbIHpRERif4Iv/pzrMxHHEEx3i6j4zqUkAYYilzEg9TXc
         3D+w==
X-Gm-Message-State: AOJu0YwO9Sc8pOJcxhGvTt363HeMnnI0Z1ZE8+eUBs53QKz83usSeuw+
	B359OpxRk0iT6h7VEas9EjKGXYQKyVA=
X-Google-Smtp-Source: AGHT+IFIYZjFKMw6WHtNJEOGL2Eon5EsR/54GlB+Thrn8G9XTPh/MDdknE8YBd4objuzaOAQYplftVof7WQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec83:b0:1c3:77cd:6520 with SMTP id
 x3-20020a170902ec8300b001c377cd6520mr179995plg.11.1694656575520; Wed, 13 Sep
 2023 18:56:15 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:18 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-21-seanjc@google.com>
Subject: [RFC PATCH v12 20/33] KVM: Allow arch code to track number of memslot
 address spaces per VM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025619_797786_65FF0165 
X-CRM114-Status: GOOD (  21.25  )
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

Let x86 track the number of address spaces on a per-VM basis so that KVM
can disallow SMM memslots for confidential VMs.  Confidentials VMs are
fundamentally incompatible with emulating SMM, which as the name suggests
requires being able to read and write guest memory and register state.

Disallowing SMM will simplify support for guest private memory, as KVM
will not need to worry about tracking memory attributes for multiple
address spaces (SMM is the only "non-default" address space across all
architectures).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_hv.c    |  2 +-
 arch/x86/include/asm/kvm_host.h |  8 +++++++-
 arch/x86/kvm/debugfs.c          |  2 +-
 arch/x86/kvm/mmu/mmu.c          |  8 ++++----
 arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
 arch/x86/kvm/x86.c              |  2 +-
 include/linux/kvm_host.h        | 17 +++++++++++------
 virt/kvm/dirty_ring.c           |  2 +-
 virt/kvm/kvm_main.c             | 26 ++++++++++++++------------
 9 files changed, 41 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 130bafdb1430..9b0eaa17275a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -6084,7 +6084,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 	}
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct kvm_memory_slot *memslot;
 		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
 		int bkt;
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 78d641056ec5..44d67a97304e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2126,9 +2126,15 @@ enum {
 #define HF_SMM_MASK		(1 << 1)
 #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
 
-# define KVM_ADDRESS_SPACE_NUM 2
+# define KVM_MAX_NR_ADDRESS_SPACES	2
 # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
+
+static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
+{
+	return KVM_MAX_NR_ADDRESS_SPACES;
+}
+
 #else
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index ee8c4c3496ed..42026b3f3ff3 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -111,7 +111,7 @@ static int kvm_mmu_rmaps_stat_show(struct seq_file *m, void *v)
 	mutex_lock(&kvm->slots_lock);
 	write_lock(&kvm->mmu_lock);
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		int bkt;
 
 		slots = __kvm_memslots(kvm, i);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 9b48d8d0300b..269d4dc47c98 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3755,7 +3755,7 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 	    kvm_page_track_write_tracking_enabled(kvm))
 		goto out_success;
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		slots = __kvm_memslots(kvm, i);
 		kvm_for_each_memslot(slot, bkt, slots) {
 			/*
@@ -6301,7 +6301,7 @@ static bool kvm_rmap_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_e
 	if (!kvm_memslots_have_rmaps(kvm))
 		return flush;
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		slots = __kvm_memslots(kvm, i);
 
 		kvm_for_each_memslot_in_gfn_range(&iter, slots, gfn_start, gfn_end) {
@@ -6341,7 +6341,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	flush = kvm_rmap_zap_gfn_range(kvm, gfn_start, gfn_end);
 
 	if (tdp_mmu_enabled) {
-		for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++)
+		for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++)
 			flush = kvm_tdp_mmu_zap_leafs(kvm, i, gfn_start,
 						      gfn_end, true, flush);
 	}
@@ -6802,7 +6802,7 @@ void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen)
 	 * modifier prior to checking for a wrap of the MMIO generation so
 	 * that a wrap in any address space is detected.
 	 */
-	gen &= ~((u64)KVM_ADDRESS_SPACE_NUM - 1);
+	gen &= ~((u64)kvm_arch_nr_memslot_as_ids(kvm) - 1);
 
 	/*
 	 * The very rare case: if the MMIO generation number has wrapped,
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 6c63f2d1675f..ca7ec39f17d3 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -905,7 +905,7 @@ void kvm_tdp_mmu_zap_all(struct kvm *kvm)
 	 * is being destroyed or the userspace VMM has exited.  In both cases,
 	 * KVM_RUN is unreachable, i.e. no vCPUs will ever service the request.
 	 */
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		for_each_tdp_mmu_root_yield_safe(kvm, root, i)
 			tdp_mmu_zap_root(kvm, root, false);
 	}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ac36a5b7b5a3..f1da61236670 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12447,7 +12447,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 		hva = slot->userspace_addr;
 	}
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct kvm_userspace_memory_region2 m;
 
 		m.slot = id | (i << 16);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index aea1b4306129..8c5c017ab4e9 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -80,8 +80,8 @@
 /* Two fragments for cross MMIO pages. */
 #define KVM_MAX_MMIO_FRAGMENTS	2
 
-#ifndef KVM_ADDRESS_SPACE_NUM
-#define KVM_ADDRESS_SPACE_NUM	1
+#ifndef KVM_MAX_NR_ADDRESS_SPACES
+#define KVM_MAX_NR_ADDRESS_SPACES	1
 #endif
 
 /*
@@ -692,7 +692,12 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm);
 #define KVM_MEM_SLOTS_NUM SHRT_MAX
 #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
 
-#if KVM_ADDRESS_SPACE_NUM == 1
+#if KVM_MAX_NR_ADDRESS_SPACES == 1
+static inline int kvm_arch_nr_memslot_as_ids(struct kvm *kvm)
+{
+	return KVM_MAX_NR_ADDRESS_SPACES;
+}
+
 static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 {
 	return 0;
@@ -747,9 +752,9 @@ struct kvm {
 	struct mm_struct *mm; /* userspace tied to this vm */
 	unsigned long nr_memslot_pages;
 	/* The two memslot sets - active and inactive (per address space) */
-	struct kvm_memslots __memslots[KVM_ADDRESS_SPACE_NUM][2];
+	struct kvm_memslots __memslots[KVM_MAX_NR_ADDRESS_SPACES][2];
 	/* The current active memslot set for each address space */
-	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
+	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
 	struct xarray vcpu_array;
 	/*
 	 * Protected by slots_lock, but can be read outside if an
@@ -1018,7 +1023,7 @@ void kvm_put_kvm_no_destroy(struct kvm *kvm);
 
 static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
 {
-	as_id = array_index_nospec(as_id, KVM_ADDRESS_SPACE_NUM);
+	as_id = array_index_nospec(as_id, KVM_MAX_NR_ADDRESS_SPACES);
 	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
 			lockdep_is_held(&kvm->slots_lock) ||
 			!refcount_read(&kvm->users_count));
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index c1cd7dfe4a90..86d267db87bb 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -58,7 +58,7 @@ static void kvm_reset_dirty_gfn(struct kvm *kvm, u32 slot, u64 offset, u64 mask)
 	as_id = slot >> 16;
 	id = (u16)slot;
 
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return;
 
 	memslot = id_to_memslot(__kvm_memslots(kvm, as_id), id);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 68a6119e09e4..a83dfef1316e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -615,7 +615,7 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 
 	idx = srcu_read_lock(&kvm->srcu);
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		struct interval_tree_node *node;
 
 		slots = __kvm_memslots(kvm, i);
@@ -1248,7 +1248,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		goto out_err_no_irq_srcu;
 
 	refcount_set(&kvm->users_count, 1);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		for (j = 0; j < 2; j++) {
 			slots = &kvm->__memslots[i][j];
 
@@ -1391,7 +1391,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 #endif
 	kvm_arch_destroy_vm(kvm);
 	kvm_destroy_devices(kvm);
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
 		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
 	}
@@ -1674,7 +1674,7 @@ static void kvm_swap_active_memslots(struct kvm *kvm, int as_id)
 	 * space 0 will use generations 0, 2, 4, ... while address space 1 will
 	 * use generations 1, 3, 5, ...
 	 */
-	gen += KVM_ADDRESS_SPACE_NUM;
+	gen += kvm_arch_nr_memslot_as_ids(kvm);
 
 	kvm_arch_memslots_updated(kvm, gen);
 
@@ -2044,7 +2044,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	    (mem->gmem_offset & (PAGE_SIZE - 1) ||
 	     mem->gmem_offset + mem->memory_size < mem->gmem_offset))
 		return -EINVAL;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_MEM_SLOTS_NUM)
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
 		return -EINVAL;
@@ -2180,7 +2180,7 @@ int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
 
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
@@ -2242,7 +2242,7 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
@@ -2354,7 +2354,7 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 
 	as_id = log->slot >> 16;
 	id = (u16)log->slot;
-	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_USER_MEM_SLOTS)
+	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
 		return -EINVAL;
 
 	if (log->first_page & 63)
@@ -2494,7 +2494,7 @@ static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
 	gfn_range.only_private = false;
 	gfn_range.only_shared = false;
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		slots = __kvm_memslots(kvm, i);
 
 		kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
@@ -4833,9 +4833,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_IRQ_ROUTING:
 		return KVM_MAX_IRQ_ROUTES;
 #endif
-#if KVM_ADDRESS_SPACE_NUM > 1
+#if KVM_MAX_NR_ADDRESS_SPACES > 1
 	case KVM_CAP_MULTI_ADDRESS_SPACE:
-		return KVM_ADDRESS_SPACE_NUM;
+		if (kvm)
+			return kvm_arch_nr_memslot_as_ids(kvm);
+		return KVM_MAX_NR_ADDRESS_SPACES;
 #endif
 	case KVM_CAP_NR_MEMSLOTS:
 		return KVM_USER_MEM_SLOTS;
@@ -4939,7 +4941,7 @@ bool kvm_are_all_memslots_empty(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->slots_lock);
 
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
 		if (!kvm_memslots_empty(__kvm_memslots(kvm, i)))
 			return false;
 	}
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D67C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Z8+I+RncIPiRRNSsJXEvw6Ut54kNtLVYbPUtxDK9hU=; b=J39gJHol734O4k
	ffWUH97Fhco7nlxrLRgGDk6fBZj08zlI8LnClS18lBzfe9CTuA66xFAJ7PwrUbUtfadJyKuwH+UUl
	7DF/S+BTiFFQPFP3/MIbaOl5uKJNyTb4Yrri/XcCBsqLBMfPPNdc8OH/HV4RKPKYthV0GZ9V8NQss
	JKnCN0Tt8MM6Ynce33wmoI+MHaCE4m/weXk3mlGEy5jJoSmmzAh5eeHSb5JtioYhwMm1eyhCcvGwL
	cW6H4MHDaC0wXtPiOTYNZZ0l7ZLWSPJg732LJ3J1LbssXzvWucjnjbZ9ZXZWVLC0B1heqgkPL5jnT
	oBe6BEVBevmmCHHpK0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSXk-00H5IX-2C;
	Fri, 27 Oct 2023 19:30:52 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTb-00Gwhj-0K
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:36 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-27da957c9a3so2179920a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430947; x=1699035747; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ySJgJVuGTMb9d8TKULAih8JyrrSd4YVeUb9Jc+6kES0=;
        b=Cer01r8egP4wpObecOYQP05qdoG++SE25fgBh2KIsdq761kfKwLtIQYXqbKKYH+z0P
         I5pN85Kr8QupYW8o6NshJaoLb2QX6vAb5tKX0APriAMPlL9JLe0wq5nkL7fx91PM3ZvG
         NmXPHy3ljOTsRwZ2u9vk16KMIyIM2jpUySxC6ymeIxAAGSRL/PVWdU3ANlvF2mHmsj0P
         GcOS/kKnbfe5Yi29RTm2ZGyE+69qzx90aysnOiaMPdq98Jpuaak9TZHB+RABTvFgS34a
         4P/wbe2qCimf4/egAIeixObEzFwkr853sHDualUMeRsLOzENZKP+xEOJ3LNIz7KjlxYB
         Xhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430947; x=1699035747;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySJgJVuGTMb9d8TKULAih8JyrrSd4YVeUb9Jc+6kES0=;
        b=BzoVgMkXt/DJeR0PPbwYFdkQf7SgRrk+yC41aX+2y0pnhdqRDDBNrGbk3oaGBU/VrB
         vpVUMuJJbcdROmfx8LdjzF8hZ+FoTWm0EU2DqT/giCakP5RLowxacMO92IN+IrVRK3fx
         oVmsO5lv1HcppMDgn9JH8/xdrSyAYvuZwxzAPwKeOTfe3ZoxeFUFZrsWwka1FZFCmRZ0
         PGtUOoYddEaUtDlBjn39JC1sbV7NR834F7Bis+PVr8HlZDz7WTz+O5P4vnYoYLFA3HVb
         hiigZZ3M+RCMQONh2kNMgasR7J68vsx0IFZgTKiXRwJ9XIVrHDRHhJR5K1XS6RfxlExs
         djCQ==
X-Gm-Message-State: AOJu0Yy7sqQEbSbewmbV/kazatQSgkngaifPNLZQH2fpn49rMkMlkF+i
	9ncu2NLk70DU92PQhxsUzQXP5KBgn3c=
X-Google-Smtp-Source: AGHT+IEjsuFrlNkUUm601K8PUP+r8R6hCJNbQUJrGpc/pHCXTUzh4iBnaMaTICwCQxjFnojaM1raJDMMRNs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ac8e:b0:1cc:30cf:eae6 with SMTP id
 h14-20020a170902ac8e00b001cc30cfeae6mr955plr.10.1698430947671; Fri, 27 Oct
 2023 11:22:27 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:43 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-2-seanjc@google.com>
Subject: [PATCH v13 01/35] KVM: Tweak kvm_hva_range and hva_handler_t to allow
 reusing for gfn ranges
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
X-CRM114-CacheID: sfid-20231027_112231_159457_E8CF1D00 
X-CRM114-Status: GOOD (  13.21  )
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

Rework and rename "struct kvm_hva_range" into "kvm_mmu_notifier_range" so
that the structure can be used to handle notifications that operate on gfn
context, i.e. that aren't tied to a host virtual address.  Rename the
handler typedef too (arguably it should always have been gfn_handler_t).

Practically speaking, this is a nop for 64-bit kernels as the only
meaningful change is to store start+end as u64s instead of unsigned longs.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 486800a7024b..0524933856d4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -541,18 +541,22 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
 	return container_of(mn, struct kvm, mmu_notifier);
 }
 
-typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
+typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
 typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 			     unsigned long end);
 
 typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 
-struct kvm_hva_range {
-	unsigned long start;
-	unsigned long end;
+struct kvm_mmu_notifier_range {
+	/*
+	 * 64-bit addresses, as KVM notifiers can operate on host virtual
+	 * addresses (unsigned long) and guest physical addresses (64-bit).
+	 */
+	u64 start;
+	u64 end;
 	union kvm_mmu_notifier_arg arg;
-	hva_handler_t handler;
+	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
 	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
@@ -581,7 +585,7 @@ static const union kvm_mmu_notifier_arg KVM_MMU_NOTIFIER_NO_ARG;
 	     node = interval_tree_iter_next(node, start, last))	     \
 
 static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
-						  const struct kvm_hva_range *range)
+						  const struct kvm_mmu_notifier_range *range)
 {
 	bool ret = false, locked = false;
 	struct kvm_gfn_range gfn_range;
@@ -608,9 +612,9 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			unsigned long hva_start, hva_end;
 
 			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
-			hva_start = max(range->start, slot->userspace_addr);
-			hva_end = min(range->end, slot->userspace_addr +
-						  (slot->npages << PAGE_SHIFT));
+			hva_start = max_t(unsigned long, range->start, slot->userspace_addr);
+			hva_end = min_t(unsigned long, range->end,
+					slot->userspace_addr + (slot->npages << PAGE_SHIFT));
 
 			/*
 			 * To optimize for the likely case where the address
@@ -660,10 +664,10 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
 						unsigned long end,
 						union kvm_mmu_notifier_arg arg,
-						hva_handler_t handler)
+						gfn_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range range = {
+	const struct kvm_mmu_notifier_range range = {
 		.start		= start,
 		.end		= end,
 		.arg		= arg,
@@ -680,10 +684,10 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
 							 unsigned long start,
 							 unsigned long end,
-							 hva_handler_t handler)
+							 gfn_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range range = {
+	const struct kvm_mmu_notifier_range range = {
 		.start		= start,
 		.end		= end,
 		.handler	= handler,
@@ -771,7 +775,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range hva_range = {
+	const struct kvm_mmu_notifier_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
 		.handler	= kvm_unmap_gfn_range,
@@ -835,7 +839,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range hva_range = {
+	const struct kvm_mmu_notifier_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

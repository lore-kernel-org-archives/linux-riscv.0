Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7944C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKa0qL0M93bU1GOD60CuWoz4OXRKCRH0Tt1clit0XnI=; b=zmnAA8Ub71EvNS
	zNb1zkHylsi6gFseB29+qpBa/zEXGXy9CeKevZy6B7T3Bs8XMPhtW3ZVtKaRMppA6zaOUhGU86Afb
	daiGV260zi1QElzEUfsdDqoJHU8IOGC2Eu7ni9G7XVs+VM2WxT7UzrIPIvd8WnquSuUFlSJdEIOTL
	hK4R/vUfvsQwMrRURqhWgfpK72n3qDVfp2kwsRpjN4Gw1ABmx4v/y98ygHJpO6xhu33tnTA6qPJdg
	9avP35luGZr2qFAOuRAdOj/sKIKoc+IHn7dl6CRCvvExpPv3d9WsZsA1ch0plN6U92wJZyzNzXwaC
	Nmy0ZsOLoaSGvINCZvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzex-005GXf-2E;
	Wed, 19 Jul 2023 05:23:35 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzcF-005Dg5-0x
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/Q2YqUewU0QJU59tCBKplqkoUGv4ucil0ZC6wcpHcqQ=; b=t/OnbJ5FXBEbXTHNcvxkeI6TNz
	zUMv5jD96xTEYnon1hD97MW/MiZ03Rvps73zBBy9XdyGPemE/8BcQwGxOiUyBxmyYb7UpSjACQVem
	rozxPju0lZrfKpOT09kmeSkLpGBpwlGmyIBrVc9pUPuELLQhwuFnm2R9roAGjCRfey7tLlOIImwMf
	FERWrvJ0RzOcG65ab0r5mOR5uIQKSZHY7ECqP5Kn+MVzwuK8x+CJj4k4xRuzlHvBcN29gRM6SbgTy
	K+iaGSd5sWk96WsxkpUaMDuP1m9b6SwYe+PZ+eqkCzwdOhPYTk7BoRvud+3T4nNFRHlzMlhgGIrFo
	mjd358uQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuRo-005QSg-Kw
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:49:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5704e551e8bso58171947b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724116; x=1692316116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q2YqUewU0QJU59tCBKplqkoUGv4ucil0ZC6wcpHcqQ=;
        b=45wJtqLvPSM2rUMqLcMXNw7NxwmgG2m5SPDbrufh73pgAUQWbP2rdleJScR1b7QLYa
         DP+HuKEmKkMRrP/q2T4jHzBU5n9sIMiGoirvjexsulrIA7SmCoB2RD0OJCDc7ASGVipq
         PSRwcUv6R9/P6Anldtw3uzpwddoQDwmG+UiYNrQvXXPePgR1SMt+qMM6R80vVgNfZRfr
         Zbb1A+J7od+BdsPgC4npxwhpyfqZPutWxMFqb23fAWYB7jdyyiYB7CufeFn8KjpoJ/AS
         dfYNegwygmszJ2XjdeBWt4nfgaIFP2EbKAWHMTSRTuZjvFbBEP2gM0wxgdw7XbY9RihO
         seBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724116; x=1692316116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q2YqUewU0QJU59tCBKplqkoUGv4ucil0ZC6wcpHcqQ=;
        b=bp4W9CtR8SX2dKl6gIpY8x44ba3PlsqUs8xMFoR0qqFWNDbDrTWSFHwSFdEkOBhLn7
         r0XxCZ+MQd2EpeFhCH2nOVz3EAKNWqmaxoIMz2ov90sL8mPjF8zi1Fs0qV8dr5m/2DFd
         pr8HTXvAvTHc7DCtdHOjZ+2+eq62esawoVAIW637BZVw19JtmuS6xea0dp79k9nA9ya9
         Ybyh8GIdM26I6nP9rTm1vxI7OosN2451b9nIcmUukAD6w/fvoumxQFfvC551emzvSTcV
         7pTmLTDvpeGEKR45pQVeMxqzVpn7oPrvgF3/XU6Z3yESMObLmJTcVmDXwOlbhm4qlvek
         I6jQ==
X-Gm-Message-State: ABy/qLb0cVqjXyJItV+H0ruX/xBDcS9ow74Aihf6FuOIstodn8Qu8QUX
	YtmWxMsm5Z1s1EYQ8mgLTkcQaq7/4/A=
X-Google-Smtp-Source: APBJJlHjosfFmr47fAQ4FwoHYiy0rQprOrE8ng/AJ+BqBK9Dg+T53fJUISRxGIkaIZYnyupUcGSciTRGnxE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b61d:0:b0:57a:141f:b4f7 with SMTP id
 u29-20020a81b61d000000b0057a141fb4f7mr40058ywh.6.1689724115002; Tue, 18 Jul
 2023 16:48:35 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:45 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-3-seanjc@google.com>
Subject: [RFC PATCH v11 02/29] KVM: Tweak kvm_hva_range and hva_handler_t to
 allow reusing for gfn ranges
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
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004940_708950_B0B72849 
X-CRM114-Status: GOOD (  10.50  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d58b7a506d27..50aea855eeae 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -516,21 +516,25 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
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
 	union {
 		pte_t pte;
 		u64 raw;
 	} arg;
-	hva_handler_t handler;
+	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
 	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
@@ -557,7 +561,7 @@ static void kvm_null_fn(void)
 	     node = interval_tree_iter_next(node, start, last))	     \
 
 static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
-						  const struct kvm_hva_range *range)
+						  const struct kvm_mmu_notifier_range *range)
 {
 	bool ret = false, locked = false;
 	struct kvm_gfn_range gfn_range;
@@ -588,9 +592,9 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
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
@@ -640,10 +644,10 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 						unsigned long start,
 						unsigned long end,
 						pte_t pte,
-						hva_handler_t handler)
+						gfn_handler_t handler)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range range = {
+	const struct kvm_mmu_notifier_range range = {
 		.start		= start,
 		.end		= end,
 		.arg.pte	= pte,
@@ -660,10 +664,10 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
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
@@ -750,7 +754,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range hva_range = {
+	const struct kvm_mmu_notifier_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
 		.handler	= kvm_unmap_gfn_range,
@@ -814,7 +818,7 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 					const struct mmu_notifier_range *range)
 {
 	struct kvm *kvm = mmu_notifier_to_kvm(mn);
-	const struct kvm_hva_range hva_range = {
+	const struct kvm_mmu_notifier_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381F0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rlPcFb/2mqkcjpFyp2hfdtIItdJdtFTyssULb5z1s/w=; b=VsaFwerJef0uQG8xW4Zk4b4WlJ
	rteAolyGAw08aOruyTh3Q14vnybmD1j/VPjr7LWNFdIurJUlZGU2LrgfJrAybD+G7JU02ZT1iB4Xt
	uAHQvB1p5vEPuwrdIYz2KobEbHuum0FOYShNS/SxR34aKi13FiXosX5WvwuXFKVMKpavfvEWjn+w0
	kMkku3cQGuO7XAs8x/cBMoFJPbr1i+g6QJcIGnKSoegYbog3Asfz79olrOphgRP6Hv5DTGrMW4gVf
	tdmjVJA0GTTpC6bGKonOCc6sdOqsrcavCUed+iAVyugJnjq2fRd8kS1dNp2RUsutu2rE/8F4QbSWF
	HGtAHoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Nva-00B1sm-CW; Thu, 08 Dec 2022 20:55:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjz-009rhD-4D
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 19:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HxpbJTUNlMZJd8tslVgq3JHdSPdfNWxn0UnaVUQQc0A=; b=AfAwUJaTcXn+/0Akuff+TkVju3
	5k9VZL4PZuQH/8ZaJikDadD8txkKqw3MogOIaSetn/Q4p9FbDdXdbMD2PmPk3UIXvYKh8qzUcuxfs
	gYTQIFTKdEhyZD587k4URoNqw0htKaoPJKmCKnE3UjkRVumItM2NORt2I6mCDdPpmHZQWBgXI+RIA
	G4SI7V/rko/phrRrz5sXADpkPEAGrwmT8j6ZDNoPHAH4g1Sy8LFKC/Jipxmfq5xi0XQHkLNTyDXsw
	u1O9n012lhEe0KB594FEILlqDi9atvbcatlRvijHfufH2Ox9miKswrnwzRmOTHFTkVVgamzesXgC/
	YLnIjNQQ==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mk4-007Fx5-4p
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:38 +0000
Received: by mail-yb1-xb49.google.com with SMTP id y6-20020a25b9c6000000b006c1c6161716so2533460ybj.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxpbJTUNlMZJd8tslVgq3JHdSPdfNWxn0UnaVUQQc0A=;
        b=X27Fj8NMQTMpgpQSLD6fEhoU4fVXBG4FfQvE4hDE+MTeWoJhGcT5LpYCDXh1D+/w82
         hPv1oB7AV9ecGMFLuN13hRpFiRPBuJVO9vanqpaNAxBJ4jir+35FDyU9qXPhlEpW7coO
         /8u9arxvokXqrqKeLqz9h601trg+4wcye67rx9tVyN1axVtupBSnJ7E5BSc5oEBXMlHO
         KSROKMtQE8+C88/p6gUIBi3yv6webYqOh7OUiLmP0ZCWyP2DF2whWsSz/1NabrWwZBVJ
         X38Wy5/22Z5LwdqIzNX3mhOM6a0liS8P2HZHtMcipS0tuORgcla3kymZxvCrrppA0ZTX
         8LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxpbJTUNlMZJd8tslVgq3JHdSPdfNWxn0UnaVUQQc0A=;
        b=GLiPF3ML3yaeaYcb7P0YZMCTHC1p8Fent6PqsumiURu0IN1aHZT4KQp+aFDXgmieKO
         wVkDN2+eBYCBbv+EOTzLNAtvf7PK+ECW1e4BFExam27fzdQYBuBeoQf2PNrd2ng5VfH6
         4t6Ff/kgivgGOV4+Lg7XHG0D/edJ470a/QX0vU6el1FEvb05E9u1+S3cB2eKzbndfiXy
         cOdCYlhTI8tXpngmH40v+Xx5KDp4M1iEdw5Zeq/HeyjA3XPydAc7AxX2LO6rMj3PUTnI
         Dcp2LBHsjioLz/xSpUySTpzu8Kr9QZtc+ozbuATpDSqk8lh+Qy/4zhXvwjz66zqTzY/V
         8mzg==
X-Gm-Message-State: ANoB5plUmd0boHkDb0zEhK3un7bKDUX42qlpl1xALHpVCnx6BUSi5YWg
	QXJKFrEqAz8bxufAQ0R36cryDBy7sf8czA==
X-Google-Smtp-Source: AA0mqf6nQ3bCSMPTn17mxc4GCVurLewt/EOjnyHvTIs/ImZGe4frb7eZXMD/Hm3cZq91ON4VNM6eRlaJXvRssg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:d807:0:b0:6f4:1c40:273a with SMTP id
 p7-20020a25d807000000b006f41c40273amr52016342ybg.622.1670528361862; Thu, 08
 Dec 2022 11:39:21 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:29 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-10-dmatlack@google.com>
Subject: [RFC PATCH 09/37] KVM: Move page size stats into common code
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_193936_235017_CF21AFC8 
X-CRM114-Status: GOOD (  13.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move the page size stats into common code. This will be used in a future
commit to move the TDP MMU, which populates these stats, into common
code. Architectures can also start populating these stats if they wish,
and export different stats depending on the page size.

Continue to only expose these stats on x86, since that's currently the
only architecture that populates them.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h | 8 --------
 arch/x86/kvm/mmu.h              | 5 -----
 arch/x86/kvm/x86.c              | 6 +++---
 include/linux/kvm_host.h        | 5 +++++
 include/linux/kvm_types.h       | 9 +++++++++
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f5743a652e10..9cf8f956bac3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1363,14 +1363,6 @@ struct kvm_vm_stat {
 	u64 mmu_recycled;
 	u64 mmu_cache_miss;
 	u64 mmu_unsync;
-	union {
-		struct {
-			atomic64_t pages_4k;
-			atomic64_t pages_2m;
-			atomic64_t pages_1g;
-		};
-		atomic64_t pages[KVM_NR_PAGE_SIZES];
-	};
 	u64 nx_lpage_splits;
 	u64 max_mmu_page_hash_collisions;
 	u64 max_mmu_rmap_size;
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 168c46fd8dd1..ec662108d2eb 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -261,11 +261,6 @@ kvm_mmu_slot_lpages(struct kvm_memory_slot *slot, int level)
 	return __kvm_mmu_slot_lpages(slot, slot->npages, level);
 }
 
-static inline void kvm_update_page_stats(struct kvm *kvm, int level, int count)
-{
-	atomic64_add(count, &kvm->stat.pages[level - 1]);
-}
-
 gpa_t translate_nested_gpa(struct kvm_vcpu *vcpu, gpa_t gpa, u64 access,
 			   struct x86_exception *exception);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2bfe060768fc..517c8ed33542 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(host_xss);
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
+	STATS_DESC_ICOUNTER(VM_GENERIC, pages_4k),
+	STATS_DESC_ICOUNTER(VM_GENERIC, pages_2m),
+	STATS_DESC_ICOUNTER(VM_GENERIC, pages_1g),
 	STATS_DESC_COUNTER(VM, mmu_shadow_zapped),
 	STATS_DESC_COUNTER(VM, mmu_pte_write),
 	STATS_DESC_COUNTER(VM, mmu_pde_zapped),
@@ -238,9 +241,6 @@ const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	STATS_DESC_COUNTER(VM, mmu_recycled),
 	STATS_DESC_COUNTER(VM, mmu_cache_miss),
 	STATS_DESC_ICOUNTER(VM, mmu_unsync),
-	STATS_DESC_ICOUNTER(VM, pages_4k),
-	STATS_DESC_ICOUNTER(VM, pages_2m),
-	STATS_DESC_ICOUNTER(VM, pages_1g),
 	STATS_DESC_ICOUNTER(VM, nx_lpage_splits),
 	STATS_DESC_PCOUNTER(VM, max_mmu_rmap_size),
 	STATS_DESC_PCOUNTER(VM, max_mmu_page_hash_collisions)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f16c4689322b..22ecb7ce4d31 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2280,4 +2280,9 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_update_page_stats(struct kvm *kvm, int level, int count)
+{
+	atomic64_add(count, &kvm->stat.generic.pages[level - 1]);
+}
+
 #endif
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 76de36e56cdf..59cf958d69df 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -20,6 +20,7 @@ enum kvm_mr_change;
 
 #include <linux/bits.h>
 #include <linux/mutex.h>
+#include <linux/pgtable.h>
 #include <linux/types.h>
 #include <linux/spinlock_types.h>
 
@@ -105,6 +106,14 @@ struct kvm_mmu_memory_cache {
 struct kvm_vm_stat_generic {
 	u64 remote_tlb_flush;
 	u64 remote_tlb_flush_requests;
+	union {
+		struct {
+			atomic64_t pages_4k;
+			atomic64_t pages_2m;
+			atomic64_t pages_1g;
+		};
+		atomic64_t pages[PG_LEVEL_NUM - 1];
+	};
 };
 
 struct kvm_vcpu_stat_generic {
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

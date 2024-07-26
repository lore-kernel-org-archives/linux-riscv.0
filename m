Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD40C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xoVmWIcsTXXvsD8tgsPhmTOkT9x3ddSv08JG+P9wuA=; b=Tc2qOIYWB6yHTN
	orX0R4IMZF2S41XiooKAuXDSbvuI/PdjumoN6K8Ia1mfUgvgyaPIVNq4GykzD4CUhTeA6uPouT4cW
	TCmzi0waRdmUGrKPaBk6pGs8I3pj/Hry9n5mxDsnzGaOKdsiK6A+zsOGB9Lpe6Ltzk29JKdHDFedA
	3iSTFzeM3CZeV3pllKlL1FEn3PUYbTC1qtSn5vL3/0+5Bqlpy6nFy4Rd6kVy8LMaj80oCOtsZm3GL
	BJF0aLoLje7wNIcMTauNCr0IRVrBzrrcYdY8kGRFday9cPHZH3gBlCHhVDlUbgbw4hW3ev+TrJuWv
	uQz/tCPcFNJII924zK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUnK-00000005RwW-3uIh;
	Fri, 26 Jul 2024 23:56:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUk3-00000005PID-1uzv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:52:59 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6799b9a2161so6382577b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037974; x=1722642774; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Dpyi/TQvAabfHqvBiXmrWwwqtiSCC0ukXFLvczoDhHE=;
        b=KlfbSK+3gItoshuo1nYuD1xlA9HwqdpDfTcLeh5n4so7bIF0p3oDjFCYpWEu593IDl
         XEek7Zngo1AIQVqhxWQFUBJ64eaelkSX2O9ByNM2qSTUEdRRVyxlfCO/3HoXu0FL4gw2
         qFziuUYqh7C5ZhvmkHZW8hqVVsLOnGJXk+sf6sStxQCci8ot+WgFfrX6J1p7bwEZ9LGz
         GAc5jqheDziz4w8oh7+Uva2GSuFvesHPkuIZSWWDKoSJ8LRBInIIKEkAd424hxjDY1CM
         +CNZ0hiiUL1X7UBGAMoKX/R3jzcJuGCyaa3TW/RBmTJijljJJs2vP4gUTLJzXaUObYTU
         ZTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037974; x=1722642774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dpyi/TQvAabfHqvBiXmrWwwqtiSCC0ukXFLvczoDhHE=;
        b=uyCgD2dP/7vUwNd6+ODgtxtue1SXZSa1hsfCXuTv7+hJBOo1bFIb4Dz7ek6SYdAy5d
         mcjpISKkkXiT39huiPFwIg4PqsHAlPIOh8gVtCvPjxPfi+oSwXdsvKCPl+/2GHr+dU5Y
         GHSBsWyBXFBDOQ+sov4dCRk+lybWsMIJssjC5N8x4iDZ75RZCDVFO27E5zu1265E0SC0
         23yPasZ5qJLFQhkwZ/EhquOlwaBJdkAOXOpcfbAfVJA0KDH5IBC2EMxrnNLS6nZIbXpH
         Ith23keOXAYDTPxyvTUMpUUbJGdPmpzm21lXwzL8/rGb5rDPLa/VIF7WeQutv9BQONUv
         LCiA==
X-Forwarded-Encrypted: i=1; AJvYcCVChhRqNmb0DCICfiDXeO2J+fvUpSPp5sT1uFcW0Owr0qS20aEdgSvAN0oqVMgaLlo1L3H69gclcG80Zfru5DL/iSc6xf40ElQYA6sSscHq
X-Gm-Message-State: AOJu0YzUpUd335/r8VgBXMmJiYjzQKZVJjDiiuo9capa/YVuK1i94zQR
	CnERg7bx2Z0m3L5uYmBfuiOdURmyZ+5A/WAdNHdq1iPbhAxwNTrg5gRkMOI8J/1d0wP8H3r9wRE
	Kwg==
X-Google-Smtp-Source: AGHT+IEuz+UKgzDWJGr0lPjm3UdUlqhv4uVGAVLwalCQIXTZVrMJ3vp7bbZbHMGkSPe0yP2xueKpOueyV+8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f07:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-67a051e9c33mr504237b3.1.1722037973756; Fri, 26 Jul 2024
 16:52:53 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:17 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-9-seanjc@google.com>
Subject: [PATCH v12 08/84] KVM: x86/mmu: Mark page/folio accessed only when
 zapping leaf SPTEs
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
X-CRM114-CacheID: sfid-20240726_165255_603691_5B1AA5FE 
X-CRM114-Status: GOOD (  16.23  )
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

Mark folios as accessed only when zapping leaf SPTEs, which is a rough
heuristic for "only in response to an mmu_notifier invalidation".  Page
aging and LRUs are tolerant of false negatives, i.e. KVM doesn't need to
be precise for correctness, and re-marking folios as accessed when zapping
entire roots or when zapping collapsible SPTEs is expensive and adds very
little value.

E.g. when a VM is dying, all of its memory is being freed; marking folios
accessed at that time provides no known value.  Similarly, because KVM
marks folios as accessed when creating SPTEs, marking all folios as
accessed when userspace happens to delete a memslot doesn't add value.
The folio was marked access when the old SPTE was created, and will be
marked accessed yet again if a vCPU accesses the pfn again after reloading
a new root.  Zapping collapsible SPTEs is a similar story; marking folios
accessed just because userspace disable dirty logging is a side effect of
KVM behavior, not a deliberate goal.

As an intermediate step, a.k.a. bisection point, towards *never* marking
folios accessed when dropping SPTEs, mark folios accessed when the primary
MMU might be invalidating mappings, as such zappings are not KVM initiated,
i.e. might actually be related to page aging and LRU activity.

Note, x86 is the only KVM architecture that "double dips"; every other
arch marks pfns as accessed only when mapping into the guest, not when
mapping into the guest _and_ when removing from the guest.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/locking.rst | 76 +++++++++++++++---------------
 arch/x86/kvm/mmu/mmu.c             |  4 +-
 arch/x86/kvm/mmu/tdp_mmu.c         |  7 ++-
 3 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 02880d5552d5..8b3bb9fe60bf 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -138,49 +138,51 @@ Then, we can ensure the dirty bitmaps is correctly set for a gfn.
 
 2) Dirty bit tracking
 
-In the origin code, the spte can be fast updated (non-atomically) if the
+In the original code, the spte can be fast updated (non-atomically) if the
 spte is read-only and the Accessed bit has already been set since the
 Accessed bit and Dirty bit can not be lost.
 
 But it is not true after fast page fault since the spte can be marked
 writable between reading spte and updating spte. Like below case:
 
-+------------------------------------------------------------------------+
-| At the beginning::                                                     |
-|                                                                        |
-|	spte.W = 0                                                       |
-|	spte.Accessed = 1                                                |
-+------------------------------------+-----------------------------------+
-| CPU 0:                             | CPU 1:                            |
-+------------------------------------+-----------------------------------+
-| In mmu_spte_clear_track_bits()::   |                                   |
-|                                    |                                   |
-|  old_spte = *spte;                 |                                   |
-|                                    |                                   |
-|                                    |                                   |
-|  /* 'if' condition is satisfied. */|                                   |
-|  if (old_spte.Accessed == 1 &&     |                                   |
-|       old_spte.W == 0)             |                                   |
-|     spte = 0ull;                   |                                   |
-+------------------------------------+-----------------------------------+
-|                                    | on fast page fault path::         |
-|                                    |                                   |
-|                                    |    spte.W = 1                     |
-|                                    |                                   |
-|                                    | memory write on the spte::        |
-|                                    |                                   |
-|                                    |    spte.Dirty = 1                 |
-+------------------------------------+-----------------------------------+
-|  ::                                |                                   |
-|                                    |                                   |
-|   else                             |                                   |
-|     old_spte = xchg(spte, 0ull)    |                                   |
-|   if (old_spte.Accessed == 1)      |                                   |
-|     kvm_set_pfn_accessed(spte.pfn);|                                   |
-|   if (old_spte.Dirty == 1)         |                                   |
-|     kvm_set_pfn_dirty(spte.pfn);   |                                   |
-|     OOPS!!!                        |                                   |
-+------------------------------------+-----------------------------------+
++-------------------------------------------------------------------------+
+| At the beginning::                                                      |
+|                                                                         |
+|	spte.W = 0                                                              |
+|	spte.Accessed = 1                                                       |
++-------------------------------------+-----------------------------------+
+| CPU 0:                              | CPU 1:                            |
++-------------------------------------+-----------------------------------+
+| In mmu_spte_update()::              |                                   |
+|                                     |                                   |
+|  old_spte = *spte;                  |                                   |
+|                                     |                                   |
+|                                     |                                   |
+|  /* 'if' condition is satisfied. */ |                                   |
+|  if (old_spte.Accessed == 1 &&      |                                   |
+|       old_spte.W == 0)              |                                   |
+|     spte = new_spte;                |                                   |
++-------------------------------------+-----------------------------------+
+|                                     | on fast page fault path::         |
+|                                     |                                   |
+|                                     |    spte.W = 1                     |
+|                                     |                                   |
+|                                     | memory write on the spte::        |
+|                                     |                                   |
+|                                     |    spte.Dirty = 1                 |
++-------------------------------------+-----------------------------------+
+|  ::                                 |                                   |
+|                                     |                                   |
+|   else                              |                                   |
+|     old_spte = xchg(spte, new_spte);|                                   |
+|   if (old_spte.Accessed &&          |                                   |
+|       !new_spte.Accessed)           |                                   |
+|     flush = true;                   |                                   |
+|   if (old_spte.Dirty &&             |                                   |
+|       !new_spte.Dirty)              |                                   |
+|     flush = true;                   |                                   |
+|     OOPS!!!                         |                                   |
++-------------------------------------+-----------------------------------+
 
 The Dirty bit is lost in this case.
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2e6daa6d1cc0..58b70328b20c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -542,10 +542,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
 	 * to guarantee consistency between TLB and page tables.
 	 */
 
-	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte)) {
+	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte))
 		flush = true;
-		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
-	}
 
 	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte))
 		flush = true;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7ac43d1ce918..d1de5f28c445 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -520,10 +520,6 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
 	if (was_present && !was_leaf &&
 	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
 		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
-
-	if (was_leaf && is_accessed_spte(old_spte) &&
-	    (!is_present || !is_accessed_spte(new_spte) || pfn_changed))
-		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
 }
 
 static inline int __must_check __tdp_mmu_set_spte_atomic(struct tdp_iter *iter,
@@ -865,6 +861,9 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct kvm_mmu_page *root,
 
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
 
+		if (is_accessed_spte(iter.old_spte))
+			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
+
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

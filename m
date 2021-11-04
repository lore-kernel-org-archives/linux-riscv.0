Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18FAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABDAF60174
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABDAF60174
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZPxK4J+rKDZuiYjbGpd+Q/2ORMFtvmFbeIsHi/6/tw=; b=1bV1RKeR5CeRCN
	suY6V5RPB68Fk1fQEJXF/wctCSAey6M33YOsUlSdJ2aGO6NqB11INGacqtsPS9qgWN+xH1XUh6+D4
	myqZKrV8PsE3juCNgPv9rm+u6zAJaIpFLzKzeVfbh27fb3aBJlsh06szin2LJpjV9SduHDwdPKCHT
	dFL8iWoc1QLi1aJ3AAYGxPRBnK96/xlabFtx0Hjmi+ntrOzYbRVnt5cp0U7syMqS9znF9ImSUdiMm
	6CVZDYZU5VsoNaDuFRWYUSnHsR0FSj3eU3HeH2CC5LO3a++OfxsUuyjdL1wKFzzgeyMYALX9h7wQP
	rBhAawf4bhVwWjpC2wXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQua-007LdG-4N; Thu, 04 Nov 2021 00:47:24 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaS-007Ctz-Jy
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:39 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 c207-20020a621cd8000000b0048060050cfeso2355666pfc.3
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=FUEi7KfqPphzymRQTGTbfOx/MaI4KzNKcipjuT8FVdY=;
 b=dFLgxm0c72Sa9o7RZRhGakedthtd0rFQ9fxpUH7hzUonvUmaEHzTEnr9Z7QKN+CMp/
 UnHWs+AkXOLJwNuZqSXK1TbkIXte514NBf/fueQC3NI4aiWd2h85ZQ55FxOM3E6EZZr8
 49Ow/tJTyTy5Xhf5TSJTHjUY9Vrt2JWRXIpRq3jtBZ24fzBy9ywvoMoucypPleHtz7Bt
 nyGl9zsi/YAZTSoy9L2rlvKnLcaek2cAGwNHMKjOBf2K1E/oRLqh2gz69UfhBmUXR2vR
 bqL0iE5lPgi5OSkY6KeTt/6FnfFKdVm554W2sAwUPzX0qvPyOIEUQT5iY+zRVA9g6jW8
 c+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=FUEi7KfqPphzymRQTGTbfOx/MaI4KzNKcipjuT8FVdY=;
 b=YEEiLbdU6l2McornzfsLQWKo73g4gjUnNg/MUJ5Je5zzArLkwZiNy5wL7AAoYJQ8kw
 OqI74yF8acFZrzLn7SkHUVh+cAeovSIXs+le1goChEKqBqfTWKKGWqEUG4GqOJh2J56r
 rmhJ7tay8ASTN6ZiNd24nO9NJDma8A99GdhC2Lz2HxmuNHPcPQbj5foOW2vruRjV4+rZ
 LF4yhNEQwdvdIkRwdRcIhVMJA3mFhN6ZEwdDyNshFrxlG4dpq1SH8NRqsvRfHXg/lGpd
 TMIjir9fnXUbvxcpP3GD/6XzWh2PLbF8xnIxsIL/a1fZn06WGOcGE4OZZZt/TqZQT022
 3l+Q==
X-Gm-Message-State: AOAM530fQCDVqoVw8ZiSLo2VB0d5orVu7EfUyrh0J01l28N5e+kBUQr4
 QGOS3FZ14UgJriOA/uzs1Smr1xrRzrw=
X-Google-Smtp-Source: ABdhPJzI7wXfhmzIb07WZ6IKVyEUUmbTY3InZMh88rZP6YElu9I5y2TlNvxIb1UtjdEBVBmnF7+gpU4SBUM=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c3:: with SMTP id
 v3mr252447pjd.0.1635985594374; Wed, 03 Nov 2021 17:26:34 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:22 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-22-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 21/30] KVM: Integrate gfn_to_memslot_approx() into
 search_memslots()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172636_709545_F862F7EF 
X-CRM114-Status: GOOD (  18.74  )
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

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

s390 arch has gfn_to_memslot_approx() which is almost identical to
search_memslots(), differing only in that in case the gfn falls in a hole
one of the memslots bordering the hole is returned.

Add this lookup mode as an option to search_memslots() so we don't have two
almost identical functions for looking up a memslot by its gfn.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
[sean: tweaked helper names to keep gfn_to_memslot_approx() in s390]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 45 +++++++---------------------------------
 include/linux/kvm_host.h | 35 ++++++++++++++++++++++++-------
 virt/kvm/kvm_main.c      |  2 +-
 3 files changed, 36 insertions(+), 46 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index c4d0ed5f3400..4e032e176216 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -1941,41 +1941,6 @@ static long kvm_s390_set_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 /* for consistency */
 #define KVM_S390_CMMA_SIZE_MAX ((u32)KVM_S390_SKEYS_MAX)
 
-/*
- * Similar to gfn_to_memslot, but returns the index of a memslot also when the
- * address falls in a hole. In that case the index of one of the memslots
- * bordering the hole is returned.
- */
-static int gfn_to_memslot_approx(struct kvm_memslots *slots, gfn_t gfn)
-{
-	int start = 0, end = slots->used_slots;
-	int slot = atomic_read(&slots->last_used_slot);
-	struct kvm_memory_slot *memslots = slots->memslots;
-
-	if (gfn >= memslots[slot].base_gfn &&
-	    gfn < memslots[slot].base_gfn + memslots[slot].npages)
-		return slot;
-
-	while (start < end) {
-		slot = start + (end - start) / 2;
-
-		if (gfn >= memslots[slot].base_gfn)
-			end = slot;
-		else
-			start = slot + 1;
-	}
-
-	if (start >= slots->used_slots)
-		return slots->used_slots - 1;
-
-	if (gfn >= memslots[start].base_gfn &&
-	    gfn < memslots[start].base_gfn + memslots[start].npages) {
-		atomic_set(&slots->last_used_slot, start);
-	}
-
-	return start;
-}
-
 static int kvm_s390_peek_cmma(struct kvm *kvm, struct kvm_s390_cmma_log *args,
 			      u8 *res, unsigned long bufsize)
 {
@@ -1999,11 +1964,17 @@ static int kvm_s390_peek_cmma(struct kvm *kvm, struct kvm_s390_cmma_log *args,
 	return 0;
 }
 
+static struct kvm_memory_slot *gfn_to_memslot_approx(struct kvm_memslots *slots,
+						     gfn_t gfn)
+{
+	return ____gfn_to_memslot(slots, gfn, true);
+}
+
 static unsigned long kvm_s390_next_dirty_cmma(struct kvm_memslots *slots,
 					      unsigned long cur_gfn)
 {
-	int slotidx = gfn_to_memslot_approx(slots, cur_gfn);
-	struct kvm_memory_slot *ms = slots->memslots + slotidx;
+	struct kvm_memory_slot *ms = gfn_to_memslot_approx(slots, cur_gfn);
+	int slotidx = ms - slots->memslots;
 	unsigned long ofs = cur_gfn - ms->base_gfn;
 
 	if (ms->base_gfn + ms->npages <= cur_gfn) {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2ef946e94a73..9d46937a3a4e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1230,10 +1230,14 @@ try_get_memslot(struct kvm_memslots *slots, int slot_index, gfn_t gfn)
  * Returns a pointer to the memslot that contains gfn and records the index of
  * the slot in index. Otherwise returns NULL.
  *
+ * With "approx" set returns the memslot also when the address falls
+ * in a hole. In that case one of the memslots bordering the hole is
+ * returned.
+ *
  * IMPORTANT: Slots are sorted from highest GFN to lowest GFN!
  */
 static inline struct kvm_memory_slot *
-search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index)
+search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index, bool approx)
 {
 	int start = 0, end = slots->used_slots;
 	struct kvm_memory_slot *memslots = slots->memslots;
@@ -1251,22 +1255,26 @@ search_memslots(struct kvm_memslots *slots, gfn_t gfn, int *index)
 			start = slot + 1;
 	}
 
+	if (approx && start >= slots->used_slots) {
+		*index = slots->used_slots - 1;
+		return &memslots[slots->used_slots - 1];
+	}
+
 	slot = try_get_memslot(slots, start, gfn);
 	if (slot) {
 		*index = start;
 		return slot;
 	}
+	if (approx) {
+		*index = start;
+		return &memslots[start];
+	}
 
 	return NULL;
 }
 
-/*
- * __gfn_to_memslot() and its descendants are here because it is called from
- * non-modular code in arch/powerpc/kvm/book3s_64_vio{,_hv}.c. gfn_to_memslot()
- * itself isn't here as an inline because that would bloat other code too much.
- */
 static inline struct kvm_memory_slot *
-__gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
+____gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn, bool approx)
 {
 	struct kvm_memory_slot *slot;
 	int slot_index = atomic_read(&slots->last_used_slot);
@@ -1275,7 +1283,7 @@ __gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
 	if (slot)
 		return slot;
 
-	slot = search_memslots(slots, gfn, &slot_index);
+	slot = search_memslots(slots, gfn, &slot_index, approx);
 	if (slot) {
 		atomic_set(&slots->last_used_slot, slot_index);
 		return slot;
@@ -1284,6 +1292,17 @@ __gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
 	return NULL;
 }
 
+/*
+ * __gfn_to_memslot() and its descendants are here to allow arch code to inline
+ * the lookups in hot paths.  gfn_to_memslot() itself isn't here as an inline
+ * because that would bloat other code too much.
+ */
+static inline struct kvm_memory_slot *
+__gfn_to_memslot(struct kvm_memslots *slots, gfn_t gfn)
+{
+	return ____gfn_to_memslot(slots, gfn, false);
+}
+
 static inline unsigned long
 __gfn_to_hva_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bbaa01afac43..a2d51ce957e1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2126,7 +2126,7 @@ struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn
 	 * search_memslots() instead of __gfn_to_memslot() to avoid
 	 * thrashing the VM-wide last_used_index in kvm_memslots.
 	 */
-	slot = search_memslots(slots, gfn, &slot_index);
+	slot = search_memslots(slots, gfn, &slot_index, false);
 	if (slot) {
 		vcpu->last_used_slot = slot_index;
 		return slot;
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

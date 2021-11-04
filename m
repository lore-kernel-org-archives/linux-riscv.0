Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FE4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5E360EDF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F5E360EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqo2T9NtvP+9XgUlFNZuHKhsDJUHrZO0UFyi8bTvm+E=; b=JZCFKWSFFbU2c7
	hRaYQKHPR3vz2hkYJsRNJrBxPYjf9J9zuLOZjT7SYgxl5NeBAujV8sFMv2zTQlaL7lYFMDxvqY3P/
	dsyAiRX6fdO8G3q3RBKHvL3CKYRKreG4oR9Fhxoiv4nWhjRPmoaB5SFZvmUdrAmOXyCKDxNImA1Xn
	044oF9BMK5hFPjwp7/zjbZs0XmN/juVPWIsGFu9sbzU0s8vZIRmA/A4znhfz2k9vlgVlGmO8RpBpW
	9DT7856qbyD9NcXAdWfbx0hLXexwvbsLGOVBNBV6M3jVNZMa4gYzIhFDPXsQcPeq2YC6I8UZ/JKAD
	/5h3oRPLlZ/cVdAhdwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQxU-007MjF-2g; Thu, 04 Nov 2021 00:50:24 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaW-007CwX-CM
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:43 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 z4-20020a634c04000000b00299bdd9abdbso2367745pga.13
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=bf5Wla2cVS/NSNTHi12y0NmBRJVt1N4KO7mJKYBsTzA=;
 b=oyskjhxq492MNnNgoYvCMpWUrybgKTR5+c9tJMCSXGTpHGd93ECu+cBn4hW6iXWMJb
 +tW7ZDiSS7M7A8gZq6psJebVWkHPkeURrhjB47LU2V3Rr9C3yFJYAWfKZ0h2g2hu5LrN
 +upXS7WnShG3NyC78PhAh0NEuEMfLSwzOwdD09Jx0ayis8Rco2MLGCgq7Eh20/Z9UGQf
 0vOhM1m8OJ9I8KDHiTJEj2RH3hRsuvp7NQCAV83q1tm0e7hA6Fxs8smv8Ln6HLP55HMA
 P9Pew5nu/KnSAwmIX15Y7lYjPgNrQlQ71yBxESh2M4l5MyfuPfAlrZYxw3IqEOSxC17C
 VYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=bf5Wla2cVS/NSNTHi12y0NmBRJVt1N4KO7mJKYBsTzA=;
 b=2kZ/0axjfJjZXYhVGBSYYqKhrWlqq510feVKPJKM7rvCpxmgaDmgEmZ+Lk+H05eJoN
 8xboTXcLSp8DSGwAY75MsyYVYPKTOzEedDEjFdm1Hwa2yZfLG114G0I/sjHl+jPUxcMv
 7loDUHmO4WWDyqGKv5l4kCEGp+Z6zyyVK+ml+1jvzcENe03LbocXATxgwOqepbK4YOhs
 cDbXD0VgGk46g/Zsw2pZ/Fu0cvNOwMzQf5x5Pf90aze12455dJEA5MCpm+lzhagC+8uu
 XdjZVloe5ntwWv9l9U0Z7jFEJ2Fbix7mwLy08rkWfp4iOj5rMtaqfZSuEcglylwSpC03
 hCVQ==
X-Gm-Message-State: AOAM531zWZX1yUf5kuyoMe1SglSW2pmvhdx9IvRx31kjFl0Tom+U73n/
 bYe3d1kluAI7q0sCOBD8AHlwYpA0Kho=
X-Google-Smtp-Source: ABdhPJxL7zht6iLFJV0a0zpNfp8Oa/5w3I7yQoZdwUk7Z/rSlm9jVidWozZVaWQaks2CN5zXVqK0nQSaWr0=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c3:: with SMTP id
 v3mr252465pjd.0.1635985598344; Wed, 03 Nov 2021 17:26:38 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:24 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-24-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 23/30] KVM: Resolve memslot ID via a hash table instead
 of via a static array
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
X-CRM114-CacheID: sfid-20211103_172640_505306_1E3CE409 
X-CRM114-Status: GOOD (  26.74  )
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

Memslot ID to the corresponding memslot mappings are currently kept as
indices in static id_to_index array.
The size of this array depends on the maximum allowed memslot count
(regardless of the number of memslots actually in use).

This has become especially problematic recently, when memslot count cap was
removed, so the maximum count is now full 32k memslots - the maximum
allowed by the current KVM API.

Keeping these IDs in a hash table (instead of an array) avoids this
problem.

Resolving a memslot ID to the actual memslot (instead of its index) will
also enable transitioning away from an array-based implementation of the
whole memslots structure in a later commit.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 16 +++----
 virt/kvm/kvm_main.c      | 96 +++++++++++++++++++++++++++++++---------
 2 files changed, 84 insertions(+), 28 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d46937a3a4e..81003e3acd53 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -29,6 +29,7 @@
 #include <linux/refcount.h>
 #include <linux/nospec.h>
 #include <linux/notifier.h>
+#include <linux/hashtable.h>
 #include <asm/signal.h>
 
 #include <linux/kvm.h>
@@ -425,6 +426,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
 
 struct kvm_memory_slot {
+	struct hlist_node id_node;
 	gfn_t base_gfn;
 	unsigned long npages;
 	unsigned long *dirty_bitmap;
@@ -527,7 +529,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 struct kvm_memslots {
 	u64 generation;
 	/* The mapping table from slot id to the index in memslots[]. */
-	short id_to_index[KVM_MEM_SLOTS_NUM];
+	DECLARE_HASHTABLE(id_hash, 7);
 	atomic_t last_used_slot;
 	int used_slots;
 	struct kvm_memory_slot memslots[];
@@ -789,16 +791,14 @@ static inline struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu)
 static inline
 struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 {
-	int index = slots->id_to_index[id];
 	struct kvm_memory_slot *slot;
 
-	if (index < 0)
-		return NULL;
+	hash_for_each_possible(slots->id_hash, slot, id_node, id) {
+		if (slot->id == id)
+			return slot;
+	}
 
-	slot = &slots->memslots[index];
-
-	WARN_ON(slot->id != id);
-	return slot;
+	return NULL;
 }
 
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d45d574a5a2d..13c497abaab8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -853,15 +853,13 @@ static void kvm_destroy_pm_notifier(struct kvm *kvm)
 
 static struct kvm_memslots *kvm_alloc_memslots(void)
 {
-	int i;
 	struct kvm_memslots *slots;
 
 	slots = kvzalloc(sizeof(struct kvm_memslots), GFP_KERNEL_ACCOUNT);
 	if (!slots)
 		return NULL;
 
-	for (i = 0; i < KVM_MEM_SLOTS_NUM; i++)
-		slots->id_to_index[i] = -1;
+	hash_init(slots->id_hash);
 
 	return slots;
 }
@@ -1259,17 +1257,49 @@ static int kvm_alloc_dirty_bitmap(struct kvm_memory_slot *memslot)
 	return 0;
 }
 
+static void kvm_replace_memslot(struct kvm_memslots *slots,
+				struct kvm_memory_slot *old,
+				struct kvm_memory_slot *new)
+{
+	/*
+	 * Remove the old memslot from the hash list, copying the node data
+	 * would corrupt the list.
+	 */
+	if (old) {
+		hash_del(&old->id_node);
+
+		if (!new)
+			return;
+	}
+
+	/* Copy the source *data*, not the pointer, to the destination. */
+	if (old)
+		*new = *old;
+
+	/* (Re)Add the new memslot. */
+	hash_add(slots->id_hash, &new->id_node, new->id);
+}
+
+static void kvm_shift_memslot(struct kvm_memslots *slots, int dst, int src)
+{
+	struct kvm_memory_slot *mslots = slots->memslots;
+
+	kvm_replace_memslot(slots, &mslots[src], &mslots[dst]);
+}
+
 /*
  * Delete a memslot by decrementing the number of used slots and shifting all
  * other entries in the array forward one spot.
+ * @memslot is a detached dummy struct with just .id and .as_id filled.
  */
 static inline void kvm_memslot_delete(struct kvm_memslots *slots,
 				      struct kvm_memory_slot *memslot)
 {
 	struct kvm_memory_slot *mslots = slots->memslots;
+	struct kvm_memory_slot *oldslot = id_to_memslot(slots, memslot->id);
 	int i;
 
-	if (WARN_ON(slots->id_to_index[memslot->id] == -1))
+	if (WARN_ON(!oldslot))
 		return;
 
 	slots->used_slots--;
@@ -1277,12 +1307,17 @@ static inline void kvm_memslot_delete(struct kvm_memslots *slots,
 	if (atomic_read(&slots->last_used_slot) >= slots->used_slots)
 		atomic_set(&slots->last_used_slot, 0);
 
-	for (i = slots->id_to_index[memslot->id]; i < slots->used_slots; i++) {
-		mslots[i] = mslots[i + 1];
-		slots->id_to_index[mslots[i].id] = i;
-	}
+	/*
+	 * Remove the to-be-deleted memslot from the list _before_ shifting
+	 * the trailing memslots forward, its data will be overwritten.
+	 * Defer the (somewhat pointless) copying of the memslot until after
+	 * the last slot has been shifted to avoid overwriting said last slot.
+	 */
+	kvm_replace_memslot(slots, oldslot, NULL);
+
+	for (i = oldslot - mslots; i < slots->used_slots; i++)
+		kvm_shift_memslot(slots, i, i + 1);
 	mslots[i] = *memslot;
-	slots->id_to_index[memslot->id] = -1;
 }
 
 /*
@@ -1300,30 +1335,39 @@ static inline int kvm_memslot_insert_back(struct kvm_memslots *slots)
  * itself is not preserved in the array, i.e. not swapped at this time, only
  * its new index into the array is tracked.  Returns the changed memslot's
  * current index into the memslots array.
+ * The memslot at the returned index will not be in @slots->id_hash by then.
+ * @memslot is a detached struct with desired final data of the changed slot.
  */
 static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
 					    struct kvm_memory_slot *memslot)
 {
 	struct kvm_memory_slot *mslots = slots->memslots;
+	struct kvm_memory_slot *oldslot = id_to_memslot(slots, memslot->id);
 	int i;
 
-	if (slots->id_to_index[memslot->id] == -1 || !slots->used_slots)
+	if (!oldslot || !slots->used_slots)
 		return -1;
 
+	/*
+	 * Delete the slot from the hash table before sorting the remaining
+	 * slots, the slot's data may be overwritten when copying slots as part
+	 * of the sorting proccess.  update_memslots() will unconditionally
+	 * rewrite the entire slot and re-add it to the hash table.
+	 */
+	kvm_replace_memslot(slots, oldslot, NULL);
+
 	/*
 	 * Move the target memslot backward in the array by shifting existing
 	 * memslots with a higher GFN (than the target memslot) towards the
 	 * front of the array.
 	 */
-	for (i = slots->id_to_index[memslot->id]; i < slots->used_slots - 1; i++) {
+	for (i = oldslot - mslots; i < slots->used_slots - 1; i++) {
 		if (memslot->base_gfn > mslots[i + 1].base_gfn)
 			break;
 
 		WARN_ON_ONCE(memslot->base_gfn == mslots[i + 1].base_gfn);
 
-		/* Shift the next memslot forward one and update its index. */
-		mslots[i] = mslots[i + 1];
-		slots->id_to_index[mslots[i].id] = i;
+		kvm_shift_memslot(slots, i, i + 1);
 	}
 	return i;
 }
@@ -1334,6 +1378,10 @@ static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
  * is not preserved in the array, i.e. not swapped at this time, only its new
  * index into the array is tracked.  Returns the changed memslot's final index
  * into the memslots array.
+ * The memslot at the returned index will not be in @slots->id_hash by then.
+ * @memslot is a detached struct with desired final data of the new or
+ * changed slot.
+ * Assumes that the memslot at @start index is not in @slots->id_hash.
  */
 static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
 					   struct kvm_memory_slot *memslot,
@@ -1348,9 +1396,7 @@ static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
 
 		WARN_ON_ONCE(memslot->base_gfn == mslots[i - 1].base_gfn);
 
-		/* Shift the next memslot back one and update its index. */
-		mslots[i] = mslots[i - 1];
-		slots->id_to_index[mslots[i].id] = i;
+		kvm_shift_memslot(slots, i, i - 1);
 	}
 	return i;
 }
@@ -1395,6 +1441,9 @@ static inline int kvm_memslot_move_forward(struct kvm_memslots *slots,
  * most likely to be referenced, sorting it to the front of the array was
  * advantageous.  The current binary search starts from the middle of the array
  * and uses an LRU pointer to improve performance for all memslots and GFNs.
+ *
+ * @memslot is a detached struct, not a part of the current or new memslot
+ * array.
  */
 static void update_memslots(struct kvm_memslots *slots,
 			    struct kvm_memory_slot *memslot,
@@ -1419,7 +1468,7 @@ static void update_memslots(struct kvm_memslots *slots,
 		 * its index accordingly.
 		 */
 		slots->memslots[i] = *memslot;
-		slots->id_to_index[memslot->id] = i;
+		kvm_replace_memslot(slots, NULL, &slots->memslots[i]);
 	}
 }
 
@@ -1512,6 +1561,7 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
 {
 	struct kvm_memslots *slots;
 	size_t new_size;
+	struct kvm_memory_slot *memslot;
 
 	if (change == KVM_MR_CREATE)
 		new_size = kvm_memslots_size(old->used_slots + 1);
@@ -1519,8 +1569,14 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
 		new_size = kvm_memslots_size(old->used_slots);
 
 	slots = kvzalloc(new_size, GFP_KERNEL_ACCOUNT);
-	if (likely(slots))
-		memcpy(slots, old, kvm_memslots_size(old->used_slots));
+	if (unlikely(!slots))
+		return NULL;
+
+	memcpy(slots, old, kvm_memslots_size(old->used_slots));
+
+	hash_init(slots->id_hash);
+	kvm_for_each_memslot(memslot, slots)
+		hash_add(slots->id_hash, &memslot->id_node, memslot->id);
 
 	return slots;
 }
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

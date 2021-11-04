Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972ACC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 584DD60F9D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 584DD60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZCq3vq4q9rhTfrgdDsG++5ed4pAkIuIYEGqAzzE3j4=; b=AYdMOHQJPwrmnP
	mxCRI1+ddGtAJu32q4lI2xlb8t3Bqp7qX5/6jV2ngC9J7EpEq3YCFC2u1vNKJxGo/FQxXv3CGyCtF
	9nXaeK2PfVijkgkhXyu7Egjway1C6Slw8eeXKNeOYhzIAMJRrYyYWZrv5E9h+/Tznoy4jA1RRtGe2
	NZ1jJ+IxkoB7rurujcASLp13HDqR4wpzf4/VQhvEry3rkwNMIgHCr4GW6nYjgQ93H0Iu99pE5JQbf
	iYTSOunQ9SqoN8wNiGn1Kv8NU69mYLfNBcQ4dFNlNbtqKvM9U4ABYRD3e+Opi3zvqrau94v4etsff
	RINJfAuIgQLN1+60hE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miR3d-007OzG-Ud; Thu, 04 Nov 2021 00:56:46 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQad-007D1J-4e
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:53 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 z4-20020a634c04000000b00299bdd9abdbso2367895pga.13
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=WFKHlikOkpZJpdiLsH4aJihxblDmBHivJrGM8NlUt9c=;
 b=CRXCwBEqUdB8xBBWvbn9rvEyj5xPoJz0Yiq4O9bYP8Cnw9QN2e+/rU9Z5zno6u5DVK
 hNycH7Nu/XPtuVsGfPUbSSTGueoe3SJ6D/+uQvX8yXVdBR6JZwONNcY2XuE+tNblfPrg
 DzYe3VWSE9iz+kLrReWCKtPXc8mvDFxOyEZwsrJmqEqT2dddKgFB7DSFo4206QBqUe3l
 k94nG8IGw8Qk397gTW+mXweZuq2D9/OlhQu3qaAukGk74Ifow4G0x6SSEWRb7kyDOXHM
 mtFt8FUjKSwLn45cNEc6CmGXWE+Jks8EonoUKThzOIBSyaz6+hVlcyMpoJKcO82sckqF
 5Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=WFKHlikOkpZJpdiLsH4aJihxblDmBHivJrGM8NlUt9c=;
 b=GYwbpcUQeeynJ5vaOvPefwRJ3TIhfo42coplKl3wwePJTWjc5JiEyfnafOOHIUz202
 uQhYwW4/Z8Th7igdg1tNFZZadpcLQONHUPHdbZ9QPt679Iabk9vph7ON6B4YNH5eLhKL
 vdm3UpdgzjlamLwAgzfeO8P7R3LczstQ+9IgnxymXks6MrlxsPz1jEfwjRjLLxwIHaq2
 n4lohygo0By0JhB0D5rAGdwijgagjatlts4S3b5YwVPBwgoQvoLgeeJ5lpeX03jmOUJZ
 bRnZ82WCxn46YhP3B3fj6zhVnyJGQDH4n0lKhpzBl94EMsh+QJWMIFNsAvtyCZThJXj0
 S59A==
X-Gm-Message-State: AOAM532eOpgI9elVfMADcwjaxRz8V9YX1o1xABWP69a2gT3I0Sq4lM3H
 rfGj+fO405u741ckNhlaIhhVVd83m/k=
X-Google-Smtp-Source: ABdhPJxoDZvqdkusy2MitxT+1dAwOu5YXFxH0crl6GBFlwKLx55yi8xQIaLV4Wu5oujGScgLca++ESEBh4I=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1994:b0:47e:64e5:a1b3
 with SMTP id
 d20-20020a056a00199400b0047e64e5a1b3mr42939171pfl.64.1635985605387; Wed, 03
 Nov 2021 17:26:45 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:28 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-28-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 27/30] KVM: Optimize gfn lookup in kvm_zap_gfn_range()
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
X-CRM114-CacheID: sfid-20211103_172647_229380_DBA54631 
X-CRM114-Status: GOOD (  16.29  )
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

Introduce a memslots gfn upper bound operation and use it to optimize
kvm_zap_gfn_range().
This way this handler can do a quick lookup for intersecting gfns and won't
have to do a linear scan of the whole memslot set.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Not-signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 11 +++++--
 include/linux/kvm_host.h | 69 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 09ff0ccaa203..14e41278c069 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5714,16 +5714,20 @@ static bool __kvm_zap_rmaps(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 {
 	const struct kvm_memory_slot *memslot;
 	struct kvm_memslots *slots;
+	struct rb_node *node;
 	bool flush = false;
 	gfn_t start, end;
-	int i, bkt;
+	int i, idx;
 
 	if (!kvm_memslots_have_rmaps(kvm))
 		return flush;
 
 	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
 		slots = __kvm_memslots(kvm, i);
-		kvm_for_each_memslot(memslot, bkt, slots) {
+		idx = slots->node_idx;
+
+		kvm_for_each_memslot_in_gfn_range(node, slots, gfn_start, gfn_end) {
+			memslot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
 			start = max(gfn_start, memslot->base_gfn);
 			end = min(gfn_end, memslot->base_gfn + memslot->npages);
 			if (start >= end)
@@ -5747,6 +5751,9 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	bool flush;
 	int i;
 
+	if (WARN_ON_ONCE(gfn_end <= gfn_start))
+		return;
+
 	write_lock(&kvm->mmu_lock);
 
 	kvm_inc_notifier_count(kvm, gfn_start, gfn_end);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6888f3c2e04b..810a5b958697 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -832,6 +832,75 @@ struct kvm_memory_slot *id_to_memslot(struct kvm_memslots *slots, int id)
 	return NULL;
 }
 
+static inline
+struct rb_node *kvm_memslots_gfn_upper_bound(struct kvm_memslots *slots, gfn_t gfn)
+{
+	int idx = slots->node_idx;
+	struct rb_node *node, *result = NULL;
+
+	for (node = slots->gfn_tree.rb_node; node; ) {
+		struct kvm_memory_slot *slot;
+
+		slot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
+		if (gfn < slot->base_gfn) {
+			result = node;
+			node = node->rb_left;
+		} else
+			node = node->rb_right;
+	}
+
+	return result;
+}
+
+static inline
+struct rb_node *kvm_for_each_in_gfn_first(struct kvm_memslots *slots, gfn_t start)
+{
+	struct rb_node *node;
+
+	/*
+	 * Find the slot with the lowest gfn that can possibly intersect with
+	 * the range, so we'll ideally have slot start <= range start
+	 */
+	node = kvm_memslots_gfn_upper_bound(slots, start);
+	if (node) {
+		struct rb_node *pnode;
+
+		/*
+		 * A NULL previous node means that the very first slot
+		 * already has a higher start gfn.
+		 * In this case slot start > range start.
+		 */
+		pnode = rb_prev(node);
+		if (pnode)
+			node = pnode;
+	} else {
+		/* a NULL node below means no slots */
+		node = rb_last(&slots->gfn_tree);
+	}
+
+	return node;
+}
+
+static inline
+bool kvm_for_each_in_gfn_no_more(struct kvm_memslots *slots, struct rb_node *node, gfn_t end)
+{
+	struct kvm_memory_slot *memslot;
+
+	memslot = container_of(node, struct kvm_memory_slot, gfn_node[slots->node_idx]);
+
+	/*
+	 * If this slot starts beyond or at the end of the range so does
+	 * every next one
+	 */
+	return memslot->base_gfn >= end;
+}
+
+/* Iterate over each memslot *possibly* intersecting [start, end) range */
+#define kvm_for_each_memslot_in_gfn_range(node, slots, start, end)	\
+	for (node = kvm_for_each_in_gfn_first(slots, start);		\
+	     node && !kvm_for_each_in_gfn_no_more(slots, node, end);	\
+	     node = rb_next(node))					\
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

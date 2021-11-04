Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A96C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:30:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF01D60FC2
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF01D60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UlW8yrZewhQJQ5JXSbBqXVlrjcQIUVb3q5eq63bh10=; b=YFREEN2d9R8d4U
	g8N/841PdwH51akDzt/d/m0/cENtgYddKBme6zTYt/LzaW8lu/dNUjZ6OVOzv5ntoR98dNzotO5dj
	I0pgGAVepV2bn2s/Z2q0od/c5JHYsr7+iGjlwhgZTTz463MVB6xePN9mS81hyp3uvVr80X1Khs/78
	nVx2lMD5Tu4o0GY4lhb8gmoPVRXEJKSRkzNHm5uqJ0pGNv2cLaTQlbSdxyVoZTpKNCVPCEcs/N7nX
	gmFalzrQZ7wdw50aGAn4asJYJLnUHGI4vmO43WpUtQl08quWyZoCVuxrhxt7+BLXXEZWV1/WoAtvW
	l80KfKQvYzZwvC7Cy0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQdx-007F1m-Os; Thu, 04 Nov 2021 00:30:13 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQa2-007CbC-B6
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:12 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 m74-20020a633f4d000000b0029fed7e61f9so2362055pga.16
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=LkuPu2MAmPCt3jWV5gNi6FOTigPIaUyFE38xvFpYcwQ=;
 b=fQ2bhoWoTNjz/8iYeFRgk8xE8v2Objy7+s+fRs3Xbjqo7xemtwELytlJkHcmrH+I8M
 nF5+PPWzNIVtCFCIG/25evZjDbhEXHDEYI4QPrbiUqkMtJe/NqQSXDqAkRrWHvTsM3jA
 SrPBKggz5NoPesjkkd2VEpQQcxnugvWHDTSR8XA4/eYqple6lXn1XqFKMNVmaihp1/C5
 Wp0hIBRrvn/u5O+ODQm5fCPzEDbT4Tydnp6dW0bf7m2CqdK9fPiOK1MYaFjy9+H/z58g
 ImoAfZaL85IvUdUGLtGquAHeWwmvPs8y2pam7sWV2Bi4gxyPO2lJ2+0Gm/fMDsQ6WkmD
 xZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=LkuPu2MAmPCt3jWV5gNi6FOTigPIaUyFE38xvFpYcwQ=;
 b=vT3+7DlWhxQyMM/r3Xr4wo7l9httCJVMfBzQ+6Y/3wOBuV4lnB9ClTOJlnk4ygTNk1
 AumcunySczr/UXfJ5qNOB32j5T17As22TMZk47RxVuwhDx/6d2FXBgu7xwplHUmvZRA7
 IPFGK3LXyrXQ/atsnP44tWnAWzTyN4rukVuR4hQzXRhG+yhgyax02BPeaoGYWo6lCWbK
 N9auWQuMwuEGPnvvhpWNCiMC+D85r3GGsO+k7JIAvawXMvPCPeYOSuKPA1npppzLrXta
 BwaNJdsdmetDry8Vhn8gi2JEqnivL4lWvwVQwQkStrNiW4SYu+DHmKhcpaLXMRyEzoIz
 f+eg==
X-Gm-Message-State: AOAM530/fT3g8TFzxl4f4KzzVqlsg82PAX6Qj4OD8nMvDXF1QFEir4yc
 gtA2CElnKp8GO42wOtcZRTFxFRcLaTg=
X-Google-Smtp-Source: ABdhPJzeKw7Ie9jZTvrBx1qRvJ+/3gb9DtrWa/OZ/zOTtW8+RR4Bzhv/NHzsa4hGJ6ZmrRjYSntDBRUHEEc=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:ecca:b0:141:e920:3b71
 with SMTP id
 a10-20020a170902ecca00b00141e9203b71mr22220776plh.10.1635985568621; Wed, 03
 Nov 2021 17:26:08 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:07 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-7-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 06/30] KVM: Use "new" memslot's address space ID instead
 of dedicated param
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
X-CRM114-CacheID: sfid-20211103_172610_395569_908C8E92 
X-CRM114-Status: GOOD (  14.13  )
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

Now that the address space ID is stored in every slot, including fake
slots used for deletion, use the slot's as_id instead of passing in the
redundant information as a param to kvm_set_memslot().  This will greatly
simplify future memslot work by avoiding passing a large number of
variables around purely to honor @as_id.

Drop a comment in the DELETE path about new->as_id being provided purely
for debug, as that's now a lie.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e5c2d10f6111..39a64e02a43a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1536,7 +1536,7 @@ static void kvm_copy_memslots_arch(struct kvm_memslots *to,
 
 static int kvm_set_memslot(struct kvm *kvm,
 			   const struct kvm_userspace_memory_region *mem,
-			   struct kvm_memory_slot *new, int as_id,
+			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
 {
 	struct kvm_memory_slot *slot, old;
@@ -1559,7 +1559,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 	 */
 	mutex_lock(&kvm->slots_arch_lock);
 
-	slots = kvm_dup_memslots(__kvm_memslots(kvm, as_id), change);
+	slots = kvm_dup_memslots(__kvm_memslots(kvm, new->as_id), change);
 	if (!slots) {
 		mutex_unlock(&kvm->slots_arch_lock);
 		return -ENOMEM;
@@ -1579,7 +1579,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		 * dropped by update_memslots anyway.  We'll also revert to the
 		 * old memslots if preparing the new memory region fails.
 		 */
-		slots = install_new_memslots(kvm, as_id, slots);
+		slots = install_new_memslots(kvm, new->as_id, slots);
 
 		/* From this point no new shadow pages pointing to a deleted,
 		 * or moved, memslot will be created.
@@ -1601,7 +1601,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		 * to retrieve memslots *after* acquiring slots_arch_lock, thus
 		 * the active memslots are guaranteed to be fresh.
 		 */
-		kvm_copy_memslots_arch(slots, __kvm_memslots(kvm, as_id));
+		kvm_copy_memslots_arch(slots, __kvm_memslots(kvm, new->as_id));
 	}
 
 	/*
@@ -1618,7 +1618,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		WARN_ON_ONCE(change != KVM_MR_CREATE);
 		memset(&old, 0, sizeof(old));
 		old.id = new->id;
-		old.as_id = as_id;
+		old.as_id = new->as_id;
 	}
 
 	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
@@ -1629,7 +1629,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		goto out_slots;
 
 	update_memslots(slots, new, change);
-	slots = install_new_memslots(kvm, as_id, slots);
+	slots = install_new_memslots(kvm, new->as_id, slots);
 
 	/*
 	 * Update the total number of memslot pages before calling the arch
@@ -1651,7 +1651,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 
 out_slots:
 	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
-		slots = install_new_memslots(kvm, as_id, slots);
+		slots = install_new_memslots(kvm, new->as_id, slots);
 	else
 		mutex_unlock(&kvm->slots_arch_lock);
 	kvfree(slots);
@@ -1723,13 +1723,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 
 		memset(&new, 0, sizeof(new));
 		new.id = id;
-		/*
-		 * This is only for debugging purpose; it should never be
-		 * referenced for a removed memslot.
-		 */
 		new.as_id = as_id;
 
-		return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
+		return kvm_set_memslot(kvm, mem, &new, KVM_MR_DELETE);
 	}
 
 	new.as_id = as_id;
@@ -1792,7 +1788,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			bitmap_set(new.dirty_bitmap, 0, new.npages);
 	}
 
-	r = kvm_set_memslot(kvm, mem, &new, as_id, change);
+	r = kvm_set_memslot(kvm, mem, &new, change);
 	if (r)
 		goto out_bitmap;
 
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

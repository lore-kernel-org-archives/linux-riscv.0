Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E101C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:26:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9160611EE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9160611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWmiOjjH3vr3kbys5xviVtiwQkmaS9CNBShgEFLUlHE=; b=UG9A8P5YVdjYSu
	Y6GuJUWqEhwQqzEJSnHhm5VykX0tgletTj0ujObMRxCr7RobNur+Nbu5tvaZqnevSSOQ4cXpKhR25
	Gx4gSPbJSykSkRSp7VXkjlm20wRuBPgmKtRlGBkFFHmFoB2rgV9hUKsxwj9ZlPkIcE1y/juIrj0va
	kF7vH6RwHOqYmuT9w3gJH8bsmE84z7YU80MulXrdQNIPVbR1VoIRvQNgjsWAKBGrgWywIpmSmLMM3
	hafTXl75csDrzkBvBTg5qzI9tGpERptgslefqCIxaCtjlkY1roqufx1B8vxrTeAqS/YOMRUm0s5Wo
	HtMwgJ6gqd5eNsTpnmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQaA-007Cgs-RC; Thu, 04 Nov 2021 00:26:18 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQZt-007CVu-OY
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:03 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 r25-20020a63a019000000b002a20656994dso2408044pge.3
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=+lV0XpIZU6tw19BsegMK11Am0XrNm95tEDZ+cjWdUrM=;
 b=jbtShP55MKCx20McDFEhvtwsoRH1khB6gzD/3j56rgiZ3zt1jHh02awL7RkCEzV3OS
 juVR4kJgynHQLk53v8qOxVTOjp/cr1Axpeb38StAvaM6K/Esi65OU9b5Xxj4BlHERFw/
 20Ros746PIesTfL4lqUBcYH1DmBdILCibzAzE0JyxJqshteAL/za33QXIkiltJhs6fgG
 bVtI7QJVCXpF8HJS0rKZ95KbFtPX72tTwq3ga0tOCYx8FS5o3uLhWSoZiizq/DCYGBRC
 nP9YYyqmezSHN3kgANHiJKtWGLbMgy/F9P8mC6PT1O/nqJH2RcSpIBmpTyxPG6DF1Hbi
 bVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=+lV0XpIZU6tw19BsegMK11Am0XrNm95tEDZ+cjWdUrM=;
 b=2dxEB3Lk0gHUD+iaahigJXB2pEeGTGO1ZSrA+P+LAjHUOMTZrU6HDMtDcyQxQytCq/
 chYxhkVuy3HKVhwF+nxKbDyNYasnrQmzlmUpDoeATdfMKfDDVgFcUjeiO6AANB2ptv7f
 ZrAxAcTDtpf7nqDecLf2ivLk1D7KvAGoUvVF0Uf7cofT1s6e98xc3GLY5qnZPhbW6+4Y
 ipeT1mqvmjOE5mUutQiOe4qJhcUooV/GXL02VHqKtDs1AK0wYkrUs938tJVDvV9kERRd
 KKlHNVKuitY5oi3L/C5G7coSveH43KdQoP/aXIZFGpoaa786sTKDCZYp5yGCoHtqpwUM
 SXlQ==
X-Gm-Message-State: AOAM533AohSV/ntBKErKgTEfG1Sq99RCLwk1df4zZS649eQGK9+33odV
 TkKQ7VIR3PWvoyn+i7XJfM30ZaghSpU=
X-Google-Smtp-Source: ABdhPJxPA9GZBaEM5Ul3kt/1JljrZJu3YLRnIzyzQ/7OAn8VgQo/7agz4e2n8dYIb/fDnOKKBTJDQWAH1V8=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c3:: with SMTP id
 v3mr252263pjd.0.1635985559868; Wed, 03 Nov 2021 17:25:59 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:02 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-2-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
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
X-CRM114-CacheID: sfid-20211103_172601_829832_EDD1AB53 
X-CRM114-Status: GOOD (  16.17  )
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

When modifying memslots, snapshot the "old" memslot and copy it to the
"new" memslot's arch data after (re)acquiring slots_arch_lock.  x86 can
change a memslot's arch data while memslot updates are in-progress so
long as it holds slots_arch_lock, thus snapshotting a memslot without
holding the lock can result in the consumption of stale data.

Fixes: b10a038e84d1 ("KVM: mmu: Add slots_arch_lock for memslot arch fields")
Cc: stable@vger.kernel.org
Cc: Ben Gardon <bgardon@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 47 ++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3f6d450355f0..99e69375c4c9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1531,11 +1531,10 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
 
 static int kvm_set_memslot(struct kvm *kvm,
 			   const struct kvm_userspace_memory_region *mem,
-			   struct kvm_memory_slot *old,
 			   struct kvm_memory_slot *new, int as_id,
 			   enum kvm_mr_change change)
 {
-	struct kvm_memory_slot *slot;
+	struct kvm_memory_slot *slot, old;
 	struct kvm_memslots *slots;
 	int r;
 
@@ -1566,7 +1565,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		 * Note, the INVALID flag needs to be in the appropriate entry
 		 * in the freshly allocated memslots, not in @old or @new.
 		 */
-		slot = id_to_memslot(slots, old->id);
+		slot = id_to_memslot(slots, new->id);
 		slot->flags |= KVM_MEMSLOT_INVALID;
 
 		/*
@@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
 		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
 	}
 
+	/*
+	 * Make a full copy of the old memslot, the pointer will become stale
+	 * when the memslots are re-sorted by update_memslots(), and the old
+	 * memslot needs to be referenced after calling update_memslots(), e.g.
+	 * to free its resources and for arch specific behavior.  This needs to
+	 * happen *after* (re)acquiring slots_arch_lock.
+	 */
+	slot = id_to_memslot(slots, new->id);
+	if (slot) {
+		old = *slot;
+	} else {
+		WARN_ON_ONCE(change != KVM_MR_CREATE);
+		memset(&old, 0, sizeof(old));
+		old.id = new->id;
+		old.as_id = as_id;
+	}
+
+	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
+	memcpy(&new->arch, &old.arch, sizeof(old.arch));
+
 	r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
 	if (r)
 		goto out_slots;
@@ -1604,14 +1623,18 @@ static int kvm_set_memslot(struct kvm *kvm,
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, as_id, slots);
 
-	kvm_arch_commit_memory_region(kvm, mem, old, new, change);
+	kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
+
+	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
+	if (change == KVM_MR_DELETE)
+		kvm_free_memslot(kvm, &old);
 
 	kvfree(slots);
 	return 0;
 
 out_slots:
 	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
-		slot = id_to_memslot(slots, old->id);
+		slot = id_to_memslot(slots, new->id);
 		slot->flags &= ~KVM_MEMSLOT_INVALID;
 		slots = install_new_memslots(kvm, as_id, slots);
 	} else {
@@ -1626,7 +1649,6 @@ static int kvm_delete_memslot(struct kvm *kvm,
 			      struct kvm_memory_slot *old, int as_id)
 {
 	struct kvm_memory_slot new;
-	int r;
 
 	if (!old->npages)
 		return -EINVAL;
@@ -1639,12 +1661,7 @@ static int kvm_delete_memslot(struct kvm *kvm,
 	 */
 	new.as_id = as_id;
 
-	r = kvm_set_memslot(kvm, mem, old, &new, as_id, KVM_MR_DELETE);
-	if (r)
-		return r;
-
-	kvm_free_memslot(kvm, old);
-	return 0;
+	return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
 }
 
 /*
@@ -1718,7 +1735,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (!old.npages) {
 		change = KVM_MR_CREATE;
 		new.dirty_bitmap = NULL;
-		memset(&new.arch, 0, sizeof(new.arch));
 	} else { /* Modify an existing slot. */
 		if ((new.userspace_addr != old.userspace_addr) ||
 		    (new.npages != old.npages) ||
@@ -1732,9 +1748,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		else /* Nothing to change. */
 			return 0;
 
-		/* Copy dirty_bitmap and arch from the current memslot. */
+		/* Copy dirty_bitmap from the current memslot. */
 		new.dirty_bitmap = old.dirty_bitmap;
-		memcpy(&new.arch, &old.arch, sizeof(new.arch));
 	}
 
 	if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
@@ -1760,7 +1775,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			bitmap_set(new.dirty_bitmap, 0, new.npages);
 	}
 
-	r = kvm_set_memslot(kvm, mem, &old, &new, as_id, change);
+	r = kvm_set_memslot(kvm, mem, &new, as_id, change);
 	if (r)
 		goto out_bitmap;
 
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

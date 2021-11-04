Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAFBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB850611CA
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB850611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNqaQ+S/7DVwfIxusb1uMLr6I9Mo0PRKVbJJDkHF/iE=; b=q5sLiHpiX4mwKJ
	CueG9MeHHoFkt0QPZAGJ2sArojw423GZVrcMItjNk+3NxHte63BB8BW9ede/v0YDnw02kYiXV/8AF
	K2HuLJbJBRy97W2ZydhDDUvnDNip+p8lEzUFEPPmOEV8OuaYOTfS4vmJw48F1alMBkbYAo3RxrI61
	y9VvVeO/ItvOLUMSGpjaGPkqTOyuNFvtMP8MaiuX5XCKOspi4K/eehyVo0rsvz98/3vxpX/8EuEMo
	vqiWpwCprKzmVwPxiNVs//wIix5WUu41toMToJnrg9ZuWBeEOxAfbbv9lgQDhsB8Z/pFj/NqmzeEa
	1DwO7RgygzO8tt+kdm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQd8-007EZm-RU; Thu, 04 Nov 2021 00:29:22 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQa0-007CaH-Sa
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:10 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 c2-20020a63d5020000b029023ae853b72cso2357711pgg.18
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=d5eBGhjOdraOb8ROBhsskw4veY1ejlVUg/ty/xkC83c=;
 b=L0C1v+L5WkKOg/1UpzG68qTukZN83qwmMd/ueUN7ewuot9u43aTlXxZMHBpBnaC7/S
 e6lXD4GKbCtYx2tBTmg/D1dxn24ATg3EXOzk/ufgGhsCdxjkWD3S/Oet9+81xR7BjiXX
 KsSER1qqH3/ReOXKXEOMxEw+ZWZNMNrHAG+1wsXmgAmQGJdPsauAqWgxGa2bXM3eqrsd
 MHAblvb9KsqWTWqMYMO09zCzubyhjCK3PZcX9W1VDJfzaXxKjt1+UDPCWwyzZTqBxXQG
 LYMbx+aWi+q//Eh8G56e8rXxUsD7RwW0EkMLPRzsJeTaMSzf+hbvycjlYJ8jReWzoeCU
 NYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=d5eBGhjOdraOb8ROBhsskw4veY1ejlVUg/ty/xkC83c=;
 b=QZAG1j5b4DxEzu7krMQ1NuTytI9LxVbZGbpkc7vDjMdf46pYu5q+4pyZdoHWJ6gvck
 aY0EiUcsHhkbq1FpUQznzLT6w/23wYR5SDNsxSFCMx9Dx9J/iah7I4g4NmtDrn0o8AIa
 6oXUPDB30ukeqnIsO9t2DoPOQ9EFvKiOyKBTLJWVqXMr8oLDfVE1ugOMtgu65sNaijD8
 6wzLGOuruCOPj+BJ+noP04ibPBqqKGMz5YatFQrOLE5hlH0XwjxHtX7njb4TUxHrbGwb
 PnjXpNRF6N7w5B8vfMKdOWu6cRJ2vyaVfhqRknyxBjA2HmtrEcR8HBPnts4FAfpASbft
 l8pA==
X-Gm-Message-State: AOAM533HYdDzdCoZLVFpciTJ8szHRWQ9NrvK29srq1AoEQiUx0H6+Q/f
 kzGQhItG3/c5PSJwKBYTbVeXmnCOtO4=
X-Google-Smtp-Source: ABdhPJwR/8S2bf9OYImnNTGTvQtJKx+tPqKxegkkAxc8UN7P/Djj1xJRY5WUZbtpalPRRv4cuF26HKA4p5A=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr261267pjh.1.1635985566550; Wed, 03 Nov 2021 17:26:06 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:06 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-6-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 05/30] KVM: Resync only arch fields when slots_arch_lock
 gets reacquired
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
X-CRM114-CacheID: sfid-20211103_172608_980961_059F7B54 
X-CRM114-Status: GOOD (  17.53  )
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

There is no need to copy the whole memslot data after releasing
slots_arch_lock for a moment to install temporary memslots copy in
kvm_set_memslot() since this lock only protects the arch field of each
memslot.

Just resync this particular field after reacquiring slots_arch_lock.

Note, this also eliminates the need to manually clear the INVALID flag
when restoring memslots; the "setting" of the INVALID flag was an
unwanted side effect of copying the entire memslots.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
[sean: tweak shortlog, note INVALID flag in changelog, revert comment]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6171ddb3e31c..e5c2d10f6111 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1500,12 +1500,6 @@ static size_t kvm_memslots_size(int slots)
 	       (sizeof(struct kvm_memory_slot) * slots);
 }
 
-static void kvm_copy_memslots(struct kvm_memslots *to,
-			      struct kvm_memslots *from)
-{
-	memcpy(to, from, kvm_memslots_size(from->used_slots));
-}
-
 /*
  * Note, at a minimum, the current number of used slots must be allocated, even
  * when deleting a memslot, as we need a complete duplicate of the memslots for
@@ -1524,11 +1518,22 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
 
 	slots = kvzalloc(new_size, GFP_KERNEL_ACCOUNT);
 	if (likely(slots))
-		kvm_copy_memslots(slots, old);
+		memcpy(slots, old, kvm_memslots_size(old->used_slots));
 
 	return slots;
 }
 
+static void kvm_copy_memslots_arch(struct kvm_memslots *to,
+				   struct kvm_memslots *from)
+{
+	int i;
+
+	WARN_ON_ONCE(to->used_slots != from->used_slots);
+
+	for (i = 0; i < from->used_slots; i++)
+		to->memslots[i].arch = from->memslots[i].arch;
+}
+
 static int kvm_set_memslot(struct kvm *kvm,
 			   const struct kvm_userspace_memory_region *mem,
 			   struct kvm_memory_slot *new, int as_id,
@@ -1569,9 +1574,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 		slot->flags |= KVM_MEMSLOT_INVALID;
 
 		/*
-		 * We can re-use the memory from the old memslots.
-		 * It will be overwritten with a copy of the new memslots
-		 * after reacquiring the slots_arch_lock below.
+		 * We can re-use the old memslots, the only difference from the
+		 * newly installed memslots is the invalid flag, which will get
+		 * dropped by update_memslots anyway.  We'll also revert to the
+		 * old memslots if preparing the new memory region fails.
 		 */
 		slots = install_new_memslots(kvm, as_id, slots);
 
@@ -1588,12 +1594,14 @@ static int kvm_set_memslot(struct kvm *kvm,
 		mutex_lock(&kvm->slots_arch_lock);
 
 		/*
-		 * The arch-specific fields of the memslots could have changed
-		 * between releasing the slots_arch_lock in
-		 * install_new_memslots and here, so get a fresh copy of the
-		 * slots.
+		 * The arch-specific fields of the now-active memslots could
+		 * have been modified between releasing slots_arch_lock in
+		 * install_new_memslots and re-acquiring slots_arch_lock above.
+		 * Copy them to the inactive memslots.  Arch code is required
+		 * to retrieve memslots *after* acquiring slots_arch_lock, thus
+		 * the active memslots are guaranteed to be fresh.
 		 */
-		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
+		kvm_copy_memslots_arch(slots, __kvm_memslots(kvm, as_id));
 	}
 
 	/*
@@ -1642,13 +1650,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 	return 0;
 
 out_slots:
-	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
-		slot = id_to_memslot(slots, new->id);
-		slot->flags &= ~KVM_MEMSLOT_INVALID;
+	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE)
 		slots = install_new_memslots(kvm, as_id, slots);
-	} else {
+	else
 		mutex_unlock(&kvm->slots_arch_lock);
-	}
 	kvfree(slots);
 	return r;
 }
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

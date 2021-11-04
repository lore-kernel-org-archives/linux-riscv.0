Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A48C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 01:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C29261051
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 01:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C29261051
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84U/YnGO4sLqIBNEhDOVz8KNfzEmZHgAl2M49k8nG/U=; b=lxTtVbB2qyZdIu
	I9IV3sa1pICWreWYyJVHAJ0VnZHJzVbqkRPWzRBOKQ3C++5v7IZhazGg6Vd7FQ+iKnS72D+0Hw/+0
	8LDtOdJPX1fsmtv3FXV8ZTYLhwAOWAil5E8g+nMWJnjvHy3MlBk0MGmhaw7KdGJHtfm3bNDNUJrKd
	rz54Yh5mB9S6do0+rnjlBk+6j1vAkQii0zGJYC+0ESpkDio+mhjG3fCD+7U8hNOTGw51I+q3/L9l3
	ltosqGg0x3HTjDm405V0GIz52LIkRw+N21NjAJR/Fq7Dvc58B8wNlfTA6nmDHUTLnaObtd+5l/O3Y
	mLj+njhkR1KXuwGp2VoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miR6n-007QET-1Z; Thu, 04 Nov 2021 01:00:01 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQag-007D3r-Gz
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:58 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 x25-20020aa79199000000b0044caf0d1ba8so2367060pfa.1
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=cwptNtKIDGBxPZN/2DV/RXa3ZTx9EN7Ut32v7IxrbNY=;
 b=kp5W0d4ZKAqTQCeZRqX3O+a/DAfCjKvi3mu4Tg7fQ3jvfDHMY9wuQ5slcGHjKHrpuA
 O41kLcfJOvm1lVdKYW85uy2oNREGu2MSv7jrDheS1753o05M2Y57yo4STeIs65Q2EHGK
 B5up0zB0VZ6L8ytxDvtb0VGTD9hy1sbsnk0DAyC3cwRi4JiDc+TXwSManxsjb2qDyn2O
 OiXBUS1i7vJaF7j3il7TVpDWNEF8CLeaquv4Bhyqc0YSiiB0sbOWzXDrq3GuqvjBYdoT
 il3fanhD0s/lcfunhrA5jBW1o7Wn+UmL0jWWhjPVM5Fv3i3nvUx16q/ebHR7bCXwY+na
 ZUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=cwptNtKIDGBxPZN/2DV/RXa3ZTx9EN7Ut32v7IxrbNY=;
 b=WCg9eUQrmA4r4hLHL9SzMyjdLHwnIKLVVrwaPeB1LA/ZmQEBEnRNa7Efo8JL07G1uP
 sJR/suu/vkvIDX4CscQh5rMMUSz9Opw7P8I+toFbG2AiA+TB5luGOw5CX8TInO66lt4N
 XgY0GT+nWj53nxMi5QJhKOfBiedBjj4+wddTqWnHgY8FVHuOEStYcuBu5yiZ7zAY48lY
 LGCMgzW3o/ev65knym4CJkv1AIijRKpTS170JDdalPcFQDg6NMnmx4b6AwtmiGmoqeZ3
 knWfPDD5q6RcESDIZq/Xt7ePCJdyj66av0izPrG1H2lW5OMQNuR/dZiwQA47FyS4aOPn
 mP3g==
X-Gm-Message-State: AOAM533YPRsFApUIqLlK+evDh/H+ZbEvsECd1S2Zf9S33Y2qzjjPAWSA
 CVuNtAAvMZbYmbvNJ0IGN78ESjb8pTU=
X-Google-Smtp-Source: ABdhPJwR0Cgz5rdM3APhtKmfNq/3RdcWCCfmBz9ZLpAOZgawdF+Lq6eMD3AhC92nfdAaylW7AAzDiY84qhk=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1709:b0:481:203:d3bd
 with SMTP id
 h9-20020a056a00170900b004810203d3bdmr28140075pfc.58.1635985608753; Wed, 03
 Nov 2021 17:26:48 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:30 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-30-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 29/30] KVM: Wait 'til the bitter end to initialize the
 "new" memslot
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
X-CRM114-CacheID: sfid-20211103_172650_606067_E1375C5D 
X-CRM114-Status: GOOD (  12.30  )
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

Initialize the "new" memslot in the !DELETE path only after the various
sanity checks have passed.  This will allow a future commit to allocate
@new dynamically without having to copy a memslot, and without having to
deal with freeing @new in error paths and in the "nothing to change" path
that's hiding in the sanity checks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d22e40225703..5cc0b50faa8c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1838,6 +1838,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	struct kvm_memory_slot new;
 	struct kvm_memslots *slots;
 	enum kvm_mr_change change;
+	unsigned long npages;
+	gfn_t base_gfn;
 	int as_id, id;
 	int r;
 
@@ -1864,6 +1866,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
 		return -EINVAL;
+	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -1887,15 +1891,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return kvm_set_memslot(kvm, old, &new, KVM_MR_DELETE);
 	}
 
-	new.as_id = as_id;
-	new.id = id;
-	new.base_gfn = mem->guest_phys_addr >> PAGE_SHIFT;
-	new.npages = mem->memory_size >> PAGE_SHIFT;
-	new.flags = mem->flags;
-	new.userspace_addr = mem->userspace_addr;
-
-	if (new.npages > KVM_MEM_MAX_NR_PAGES)
-		return -EINVAL;
+	base_gfn = (mem->guest_phys_addr >> PAGE_SHIFT);
+	npages = (mem->memory_size >> PAGE_SHIFT);
 
 	if (!old || !old->npages) {
 		change = KVM_MR_CREATE;
@@ -1904,27 +1901,33 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		 * To simplify KVM internals, the total number of pages across
 		 * all memslots must fit in an unsigned long.
 		 */
-		if ((kvm->nr_memslot_pages + new.npages) < kvm->nr_memslot_pages)
+		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		if ((new.userspace_addr != old->userspace_addr) ||
-		    (new.npages != old->npages) ||
-		    ((new.flags ^ old->flags) & KVM_MEM_READONLY))
+		if ((mem->userspace_addr != old->userspace_addr) ||
+		    (npages != old->npages) ||
+		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
 			return -EINVAL;
 
-		if (new.base_gfn != old->base_gfn)
+		if (base_gfn != old->base_gfn)
 			change = KVM_MR_MOVE;
-		else if (new.flags != old->flags)
+		else if (mem->flags != old->flags)
 			change = KVM_MR_FLAGS_ONLY;
 		else /* Nothing to change. */
 			return 0;
 	}
 
 	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
-	    kvm_check_memslot_overlap(slots, id, new.base_gfn,
-				      new.base_gfn + new.npages))
+	    kvm_check_memslot_overlap(slots, id, base_gfn, base_gfn + npages))
 		return -EEXIST;
 
+	new.as_id = as_id;
+	new.id = id;
+	new.base_gfn = base_gfn;
+	new.npages = npages;
+	new.flags = mem->flags;
+	new.userspace_addr = mem->userspace_addr;
+
 	return kvm_set_memslot(kvm, old, &new, change);
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

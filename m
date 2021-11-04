Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A463AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:57:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A23260249
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A23260249
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LV+s45qGLA9LEkkzt7GdRGvL541ULZ620Yw+k6lioCA=; b=UCel599vBuIFxw
	u33V0WwQuHXvWaigCD2hueD6nqs1sQ5JzXj9dnGA3t/Ompf9iayHhsDHH0qp2f4LVJsTZR+We+pVo
	uAlKLKgmmQnBo6BFgwTeplSCgrogDGc8yINptIN0AMZ/zL6Db2J/rmbZ1Dv+x61MPMubxDpKLG51P
	WrI9gSuM3MlNR4leoqrrPGa88S68aB/kWfyV2ERcZcKeuZt5c6UwUiEfEcugSMbqhY3C6XQE4tTz9
	8/48e1qqAzeWtAMuENa76qYujqJu+KDM2ZIuNEtzrVSAttgV7HMAfwUK8FRqoTpHDzbH60qmdcZ+z
	b6Jbw9sU4jVJlyb91ftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miR3n-007P2W-4n; Thu, 04 Nov 2021 00:56:55 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQae-007D2X-Qx
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:56 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 i25-20020a631319000000b002cce0a43e94so2444932pgl.0
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=eDJLgTwa4Mq+pfIoYabE+ramu2f6Q5nSW9TL6LbQQsI=;
 b=AwZyd1OGNd2jGC9KPlXvy0oV+JkIiHs9n78p1LAJEXYu3abpzCJ4C2qjD9WEdimC8h
 /U06PEKK8296gAr9y+mGJ7YU/AYB7mMLshQmjbfJT2JjYIs1QGfBkPinN0rTDsM0mJ8v
 y1VXf6q7OT9SnMxtkJVPvG6qnljmv27pg/hk28jYo+otmvhiKA+XTi2uKknvqQboocCi
 bNfT4/DvRM5KrXSU8LLRMexndgtLytkukMKS+6YJqn2ZlSHrKvNjmLuH6tB44y+OnCgy
 GssafhzFt1xigLvtK4LdQ29M/UL2+eLN8sYzUERpdj2aCM8q7wJx2XZ+IzRmu3TIf4VS
 eNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=eDJLgTwa4Mq+pfIoYabE+ramu2f6Q5nSW9TL6LbQQsI=;
 b=yaEs9OCJSYBnjR5ypWwElppvLWpVJ5DJFaU62PuCb8WEk2SmzO3Nrnd9jVnWQjZW+j
 g5DbS3tK98bJZTd+HhlvIi82XJcrSHUE9ml/5aA8tRAf6Bxx79yNKvofFdzwqNd3d9kX
 aY33mI8/FlL3XC04SsOkQcWdZX4kyLwfiLaZtI+txLIXh+FK4NETl80T+vP2UarRmxI6
 eog/DfQPfcb5qcEK2nPxQLqyQO5erwYvTuaI26a5aHznQHXXYJNm7TPMMEVnww2tbnpX
 tcEq0L5yond491+A43iZ3pyXzVPJV3jR5NJb7dD34G7Fd0fjrNwpGjQlnRvkNF1R5kj5
 VDcA==
X-Gm-Message-State: AOAM533Y6QoqEcMz3R0Q2lqXGsNDRFNYjk8zqsSmFgolWnnOs9XycgFE
 o1GHcdiy3DKaJXPToYXDIxF/DlsqeDE=
X-Google-Smtp-Source: ABdhPJyj4rUoqs2915nhSyoqX9YGWRaiikX568lnB/vn8bpIGUoxqu2M9ISziOOEMnXgiMyENpFmkaA/Mco=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:ab50:b0:13f:4c70:9322
 with SMTP id
 ij16-20020a170902ab5000b0013f4c709322mr41332797plb.89.1635985607093; Wed, 03
 Nov 2021 17:26:47 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:29 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-29-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 28/30] KVM: Optimize overlapping memslots check
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
X-CRM114-CacheID: sfid-20211103_172648_902212_A459F379 
X-CRM114-Status: GOOD (  13.48  )
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

Do a quick lookup for possibly overlapping gfns when creating or moving
a memslot instead of performing a linear scan of the whole memslot set.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
[sean: tweaked params to avoid churn in future cleanup]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 46 +++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d095e01838bf..d22e40225703 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1800,6 +1800,29 @@ static int kvm_set_memslot(struct kvm *kvm,
 	return 0;
 }
 
+static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
+				      gfn_t start, gfn_t end)
+{
+	int idx = slots->node_idx;
+	struct rb_node *node;
+
+	kvm_for_each_memslot_in_gfn_range(node, slots, start, end) {
+		struct kvm_memory_slot *cslot;
+		gfn_t cend;
+
+		cslot = container_of(node, struct kvm_memory_slot, gfn_node[idx]);
+		cend = cslot->base_gfn + cslot->npages;
+		if (cslot->id == id)
+			continue;
+
+		/* kvm_for_each_in_gfn_no_more() guarantees that cslot->base_gfn < nend */
+		if (cend > start)
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * Allocate some memory and give it an address in the guest physical address
  * space.
@@ -1811,8 +1834,9 @@ static int kvm_set_memslot(struct kvm *kvm,
 int __kvm_set_memory_region(struct kvm *kvm,
 			    const struct kvm_userspace_memory_region *mem)
 {
-	struct kvm_memory_slot *old, *tmp;
+	struct kvm_memory_slot *old;
 	struct kvm_memory_slot new;
+	struct kvm_memslots *slots;
 	enum kvm_mr_change change;
 	int as_id, id;
 	int r;
@@ -1841,11 +1865,13 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
 		return -EINVAL;
 
+	slots = __kvm_memslots(kvm, as_id);
+
 	/*
 	 * Note, the old memslot (and the pointer itself!) may be invalidated
 	 * and/or destroyed by kvm_set_memslot().
 	 */
-	old = id_to_memslot(__kvm_memslots(kvm, as_id), id);
+	old = id_to_memslot(slots, id);
 
 	if (!mem->memory_size) {
 		if (!old || !old->npages)
@@ -1894,18 +1920,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			return 0;
 	}
 
-	if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
-		int bkt;
-
-		/* Check for overlaps */
-		kvm_for_each_memslot(tmp, bkt, __kvm_memslots(kvm, as_id)) {
-			if (tmp->id == id)
-				continue;
-			if (!((new.base_gfn + new.npages <= tmp->base_gfn) ||
-			      (new.base_gfn >= tmp->base_gfn + tmp->npages)))
-				return -EEXIST;
-		}
-	}
+	if ((change == KVM_MR_CREATE || change == KVM_MR_MOVE) &&
+	    kvm_check_memslot_overlap(slots, id, new.base_gfn,
+				      new.base_gfn + new.npages))
+		return -EEXIST;
 
 	return kvm_set_memslot(kvm, old, &new, change);
 }
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

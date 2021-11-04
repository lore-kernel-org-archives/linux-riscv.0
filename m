Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A44C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F274611C1
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F274611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4Y2hKt/dEAs/vBt6c8jTjXWTLjQFDBjULGMvkg1SnM=; b=P1jS4sOThvyXjf
	Jdm0M7dMUaIqiQOO2wXFAFkActleeLAVIDSfxpGpsUGUCCljhEyVhtuYqmQeg93vF5WU+v10k97xk
	qK+Q2kk8sQbA58iHHuYRtFVRmDBn4gvzrVjhCdDllOqRJaXsZkZd+3pIirsvgPDkVcU1+08PrT0GA
	jmTwxiJ7XpCuCWlYXPAFhRu4C/pM/T7GJ0q+yAwXbBWsT0rq0e2OItM84khWQTdyW0FRbCYlt8DP9
	E/Cqa+/y3qdH1c8tGQIYeCekQwBsywx4tbX+ZM0su3sZ/AymzW3Yqibz1ioZkXHonBpC29NGANjxd
	IfGMxwgg37YRA/QIm+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQlg-007IMM-H4; Thu, 04 Nov 2021 00:38:12 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaF-007CkB-A8
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:28 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 2-20020aa79102000000b0044c216dd8ecso2321660pfh.18
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=/RvGHTt4E3c4iVv3wsterupSlbh/I++vTjsd+nrbZTE=;
 b=HyykrtCCmq3kCamMD/Tm7VvDgqmDnoEsE+g1eeqH4NbqmVOGEIPXEF0p44V12K+tKv
 cuhUnPrZGQP5wZ3hLK+/1RKT0txi5xKCd+JuqAuxM/FmVqFBME7pAC+KWpd37Sadnmeu
 lG6JAvLtVSbJb1He7sVTN3iqT2jXaXZ9aCFU0nSIjt20mOePuQMygvc8lEwJBvVIqi6I
 K5uhrd/Mr5VKCjgNFfaDRg+gQDzGFZRQLuV3piNS1sOT1VVHqP+YMJNc8a7c9S8QvZA6
 4wHieFDZfoFTOKF1jdxfARHJJ/0OEyKmgNBjIBCXoaMWWRQ2moanjPbmOrNTixvUNha5
 SCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=/RvGHTt4E3c4iVv3wsterupSlbh/I++vTjsd+nrbZTE=;
 b=KlhYHM9EH2IxW8cku9SkN3CrnDtC7F9aiL8G3DP1Bq/M1t1o6WB/xhMlVBpxioD8nq
 w1K+8Txmyf1LML4Eu+5V16bNc5cJqKuvgJLHTBtICPibPg/wm2+44tNWp2zg6Z2e6asf
 bsuiWcW9iA8khJMv+9DVBX4SCJbkb+QDBGQ6KKsg04ea33+uwcGI4EEoNnrVmgyCPP43
 wn9eRcch41xLZOcKjgppBw7midftTpZ56YnZOrnhSmgKAvx5h0dNgwAMSK2yKlZ5JEnC
 LUjfiC1wBRRr+1a3rtYCm5fBwhuEN+1/M2vO29BoKZzp7H9BXoHS4RLJqjoufb2hmrLn
 GQnw==
X-Gm-Message-State: AOAM532YUwwyjSxL+Q9/HBSvO4yjrGz5dOczP41K+23fZiwkKkoOiu5N
 agt/5Cz5/69rg2oYBbUatTE5AbMFHqA=
X-Google-Smtp-Source: ABdhPJzUTstetgr7LfAz4PUuI3fkJrGKDFjmFGhXU/D+Ufl0+b4ADI76LnvXO52LyVNOIFV+GAz+aYo+l4Q=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:9348:b0:141:5862:28b4
 with SMTP id
 g8-20020a170902934800b00141586228b4mr41368996plp.17.1635985582257; Wed, 03
 Nov 2021 17:26:22 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:15 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-15-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 14/30] KVM: Stop passing kvm_userspace_memory_region to
 arch memslot hooks
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
X-CRM114-CacheID: sfid-20211103_172623_390937_EAE25909 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Drop the @mem param from kvm_arch_{prepare,commit}_memory_region() now
that its use has been removed in all architectures.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c       | 2 --
 arch/mips/kvm/mips.c       | 2 --
 arch/powerpc/kvm/powerpc.c | 2 --
 arch/riscv/kvm/mmu.c       | 2 --
 arch/s390/kvm/kvm-s390.c   | 2 --
 arch/x86/kvm/x86.c         | 2 --
 include/linux/kvm_host.h   | 2 --
 virt/kvm/kvm_main.c        | 9 ++++-----
 8 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 21213cba7c47..a76718388cbd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1463,7 +1463,6 @@ int kvm_mmu_init(u32 *hyp_va_bits)
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   struct kvm_memory_slot *old,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -1486,7 +1485,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index b7aa8fa4a5fb..47b7dc149032 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -233,7 +233,6 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -242,7 +241,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   struct kvm_memory_slot *old,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 59342237e046..52ab1782b257 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -706,7 +706,6 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -715,7 +714,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   struct kvm_memory_slot *old,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index db5230ec6951..0732867d398c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -456,7 +456,6 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
@@ -471,7 +470,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index e69ad13612d9..81f90891db0f 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5016,7 +5016,6 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 
 /* Section: memory related */
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -5044,7 +5043,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c68e7de9f116..80e726f73dd7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11727,7 +11727,6 @@ void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
 }
 
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_userspace_memory_region *mem,
 				   const struct kvm_memory_slot *old,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
@@ -11831,7 +11830,6 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f8e79cf7584f..2ef946e94a73 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -826,12 +826,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				const struct kvm_memory_slot *old,
 				struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-				const struct kvm_userspace_memory_region *mem,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 389243120435..9c75691b98ba 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1535,7 +1535,6 @@ static void kvm_copy_memslots_arch(struct kvm_memslots *to,
 }
 
 static int kvm_set_memslot(struct kvm *kvm,
-			   const struct kvm_userspace_memory_region *mem,
 			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
 {
@@ -1621,7 +1620,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 		old.as_id = new->as_id;
 	}
 
-	r = kvm_arch_prepare_memory_region(kvm, mem, &old, new, change);
+	r = kvm_arch_prepare_memory_region(kvm, &old, new, change);
 	if (r)
 		goto out_slots;
 
@@ -1637,7 +1636,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 	else if (change == KVM_MR_CREATE)
 		kvm->nr_memslot_pages += new->npages;
 
-	kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
+	kvm_arch_commit_memory_region(kvm, &old, new, change);
 
 	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
 	if (change == KVM_MR_DELETE)
@@ -1722,7 +1721,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		new.id = id;
 		new.as_id = as_id;
 
-		return kvm_set_memslot(kvm, mem, &new, KVM_MR_DELETE);
+		return kvm_set_memslot(kvm, &new, KVM_MR_DELETE);
 	}
 
 	new.as_id = as_id;
@@ -1785,7 +1784,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			bitmap_set(new.dirty_bitmap, 0, new.npages);
 	}
 
-	r = kvm_set_memslot(kvm, mem, &new, change);
+	r = kvm_set_memslot(kvm, &new, change);
 	if (r)
 		goto out_bitmap;
 
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

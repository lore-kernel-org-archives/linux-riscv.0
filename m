Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666A2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2480E61058
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2480E61058
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQ6qtmf/RmYMoFC1H5rBL2myRshaf1TLk7Iefn4n2JI=; b=kJwzdYnIwHX+BV
	V+bJL0EZsxd7RC2NBEyIcsuQ0EwAo3C6leN+75UjGbQQ4fouULRdZKMyTMFXLjYJtCPCWX7CP2Elk
	ScnaGNeWK90VACqACYrsJGC7abVnMJLhWsuxaqNO2pKJwyehN6pGMK8K/13Qamg+fDeLSucJX5cz3
	4EcT9X598P+wld1qOIGOxN4iNxSwbM5cEsfGX58lGLfuxMRmIj2zwC/TSfLmINQcwheTVoov+xtDI
	YTb8MM3ROeaSFamyhQAPI6fhNJS2NZncDWJmjSKPE/wXg2ds5nG7JZtrjgrczY0wKBmhKiwRDlQEb
	Ov/gp7T+u4qtrtQVM4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQtU-007LCl-HQ; Thu, 04 Nov 2021 00:46:16 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaQ-007CsL-Iq
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:37 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 w5-20020a654105000000b002692534afceso2391725pgp.8
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=h7EfkSVswSL3FymMNglXt58S7Vc0tx9NzVk9JdibdVk=;
 b=DBOeGcjhrXQwhK0FDOBounT9evoR1Uijermfpo2pBeH9R90xNB6NiKKYfJXt4+tgd/
 IJ6jypcgRe3jOg4zlXWx5eC1V32MNn6vaqHSQr5smH43RoADVpNyl0gwCePpvloc8Ypr
 F1pfRhWLlrBnkA1hdX3ERXkuM/PO79U9BEXqecoo3QkL6YdP7YHLNYC5NWI2JUA/rUmh
 xU//wrDCCMLfmQuyamdw2hMfy0zAoUq6wowZ4aj1Y2drElfwl5AaFtyY1b2PFE88cjJE
 QyDIm2njMA5AFpQT4XPba1500YCHFs+L2URKin8PC+/TgGc7BaLAMkj9Nt+raQ950oUC
 96+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=h7EfkSVswSL3FymMNglXt58S7Vc0tx9NzVk9JdibdVk=;
 b=Q5KZBNrb8KIHU19yAPjhZF6/9x4ui65TFhYIdq/0cuFSnxHOCHX2MdPeYdb95Nskoj
 gSZ0jbprSl0K/XHTABNyY1tfDVocz1XZetvkOdwB1SKwezBVdjlqrFopTZbYb6koLfT+
 iD32IDQiY0Tu3J+YWFsh2d0PjUJB7I1mq55eYctQQ4tGCfdfvBarca/wxnb1spAZDiXI
 QNP8nYpcbDbxvoXr2RkzV4TaPBYG1bQMPCgAlYQb2BuPhGAtVIeJd6F4jvTJCPmu16DV
 NzWucRtQz0Xx5gyYkHK+bRunnvNh+Zko+E7VReUUbgjbruaI8Id7xUNEDax0xelU+ZcC
 qynA==
X-Gm-Message-State: AOAM530lZ8sm7RbZNjkOlPzNZUZIFtj/xT6X40zmLmmGM8t1zBlgk1UM
 lM6ffB1KNkzLLKsffNIuHXJdDDGoHr0=
X-Google-Smtp-Source: ABdhPJxsxHfihcUwqJ9+RVNX21hbTOai5CGcJvQmgGN1uIZFdZGoK7dZESQoRGdygHMeGrtUc4zbFpEoUSY=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a63:83c2:: with SMTP id
 h185mr20757080pge.146.1635985592609; 
 Wed, 03 Nov 2021 17:26:32 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:21 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-21-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 20/30] KVM: x86: Use nr_memslot_pages to avoid traversing
 the memslots array
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
X-CRM114-CacheID: sfid-20211103_172634_656179_25F8C957 
X-CRM114-Status: GOOD (  11.05  )
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

There is no point in recalculating from scratch the total number of pages
in all memslots each time a memslot is created or deleted.  Use KVM's
cached nr_memslot_pages to compute the default max number of MMU pages.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
[sean: use common KVM field and rework changelog accordingly]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/mmu/mmu.c          | 24 ------------------------
 arch/x86/kvm/x86.c              | 11 ++++++++---
 3 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 88fce6ab4bbd..3fe155ece015 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1582,7 +1582,6 @@ void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
 				   const struct kvm_memory_slot *memslot);
 void kvm_mmu_zap_all(struct kvm *kvm);
 void kvm_mmu_invalidate_mmio_sptes(struct kvm *kvm, u64 gen);
-unsigned long kvm_mmu_calculate_default_mmu_pages(struct kvm *kvm);
 void kvm_mmu_change_mmu_pages(struct kvm *kvm, unsigned long kvm_nr_mmu_pages);
 
 int load_pdptrs(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu, unsigned long cr3);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 354d2ca92df4..564781585fd2 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6141,30 +6141,6 @@ int kvm_mmu_module_init(void)
 	return ret;
 }
 
-/*
- * Calculate mmu pages needed for kvm.
- */
-unsigned long kvm_mmu_calculate_default_mmu_pages(struct kvm *kvm)
-{
-	unsigned long nr_mmu_pages;
-	unsigned long nr_pages = 0;
-	struct kvm_memslots *slots;
-	struct kvm_memory_slot *memslot;
-	int i;
-
-	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
-		slots = __kvm_memslots(kvm, i);
-
-		kvm_for_each_memslot(memslot, slots)
-			nr_pages += memslot->npages;
-	}
-
-	nr_mmu_pages = nr_pages * KVM_PERMILLE_MMU_PAGES / 1000;
-	nr_mmu_pages = max(nr_mmu_pages, KVM_MIN_ALLOC_MMU_PAGES);
-
-	return nr_mmu_pages;
-}
-
 void kvm_mmu_destroy(struct kvm_vcpu *vcpu)
 {
 	kvm_mmu_unload(vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4b0cb7390902..9a0440e22ede 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11837,9 +11837,14 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				enum kvm_mr_change change)
 {
 	if (!kvm->arch.n_requested_mmu_pages &&
-	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE))
-		kvm_mmu_change_mmu_pages(kvm,
-				kvm_mmu_calculate_default_mmu_pages(kvm));
+	    (change == KVM_MR_CREATE || change == KVM_MR_DELETE)) {
+		unsigned long nr_mmu_pages;
+
+		nr_mmu_pages = kvm->nr_memslot_pages * KVM_PERMILLE_MMU_PAGES;
+		nr_mmu_pages /= 1000;
+		nr_mmu_pages = max(nr_mmu_pages, KVM_MIN_ALLOC_MMU_PAGES);
+		kvm_mmu_change_mmu_pages(kvm, nr_mmu_pages);
+	}
 
 	kvm_mmu_slot_apply_flags(kvm, old, new, change);
 
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

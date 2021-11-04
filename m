Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224CDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAFDB60E9C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAFDB60E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mF2OFg+Q/6wFrfswM1WbF4gDGAzbP0/5iARKlqzOEo4=; b=GDc/QgEkqdC1co
	jigK0GoUiKG7F6UX1zlk78chgSKD1yZ3fN2OZIjSij/lQUlBQoM78gKqgTODQV/yJLf04iGgAc70T
	OKxKcXxnDPOuPmW1kXfiuOAJIBsv3jJLUOqO2PHNjlbUNQHIra/z672SJkohVImYM/DP8sLK3apG0
	JY1yOjTlW9zzMpOhypIVhTsJe9wBjhSN8i6UJhQ5uYGujSoWR99bXMTSsdtvwTi4NIex64by7VlS+
	XrQ0xzUtJS3ec6RYQDxJM8g/CotRAYEdHXz4wpaVcsXLnfQUI3V4PIeP3wxFP1OWC0zSJF+FZlDmA
	/ImrWye5oALoptMfS8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQfj-007Fpa-Q1; Thu, 04 Nov 2021 00:32:03 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQa5-007CdO-HK
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:15 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 m26-20020a62a21a000000b0041361973ba7so2330513pff.15
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=tLQvwVMFuRU1rudmVd+Ot8DGDwWCKV2XWE4z9OvxcSI=;
 b=aidjRg109rDQhcbEOaDvYUP/J6xeFiJXWQHPB/9inpIU47CGJj4EB+RwhcIG070Mie
 lVHTfvEeNG2Brzpgw8EZNdAVeUVZ4nNqCUo0Ix5XLJ0H18oJo/2rFOKMzl6fWLSJY191
 J6xXKGp+3siToXIqVebLKzjgDI+yAMnV78lg50hWKNPX/pVq2TrOflawSIczG+Lqobke
 Z0ZzafsHPcdo8PEDuhw/rn2m58dsopFaT3sRkFsFmilo83Ii5s7nnixu4BD3y0cdffxJ
 kzs8TJbXMv5IItYIkJSv/EhZBtHn1F5Yu5VOIhoRSGmVNkoq+MSSDwRM5budJwMaPSM5
 i1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=tLQvwVMFuRU1rudmVd+Ot8DGDwWCKV2XWE4z9OvxcSI=;
 b=3DkkHRffPlG2ptrm9XHaolIVXPBMuJtn5lAVwhqZYndmqL9jRidbydqtsFCvjYEx07
 wbqXh6zwGVPxGOd9IKluHnJfxm3cYEzaM7fpsVwj66Wy89IlXM8BwbMZfxFzBPJjxDdb
 Wv2OdKSRghdtmGhKTerUuvIhrMUp7jNnNBRr6NC6UaC6yw2J/u9y5VS6HrWQYXKNy8Ay
 cqOQ5xpxOOEdDuiNzWtA3vsDDwGW2pzuizAyDYoFiATkGWWfr/tUEOdDyGeu8ifQ/rZp
 qsvcL0CvWq/cLylud1W01I8fpgIf+A+Vz6sAyicKr+gazFutbnHCa1cKd26e1E3lamrm
 B0Jw==
X-Gm-Message-State: AOAM533vgPtZGti3V4Zwm1xAkSQupFkNaEHZKvXP31TRtpAIjLbBt0iU
 cvr0OZUjI4e0foeUWIVKSbywNxSmqzQ=
X-Google-Smtp-Source: ABdhPJwCsMzZuRxv6iw0pTuYU4/wjVIfD1uNyeuH4Gna3eUrPsMPSwpB1c5wUSrPuzkGj84qqgXi63hO2s0=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1484:b0:48c:2e58:8d39
 with SMTP id
 v4-20020a056a00148400b0048c2e588d39mr11085289pfu.13.1635985571770; Wed, 03
 Nov 2021 17:26:11 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:09 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-9-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 08/30] KVM: arm64: Use "new" memslot instead of userspace
 memory region
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
X-CRM114-CacheID: sfid-20211103_172613_615418_77419454 
X-CRM114-Status: GOOD (  12.01  )
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

Get the slot ID, hva, etc... from the "new" memslot instead of the
userspace memory region when preparing/committing a memory region.  This
will allow a future commit to drop @mem from the prepare/commit hooks
once all architectures convert to using "new".

Opportunistically wait to get the hva begin+end until after filtering out
the DELETE case in anticipation of a future commit passing NULL for @new
when deleting a memslot.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index cc41eadfbbf4..21213cba7c47 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1473,14 +1473,14 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	 * allocated dirty_bitmap[], dirty pages will be tracked while the
 	 * memory slot is write protected.
 	 */
-	if (change != KVM_MR_DELETE && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+	if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 		/*
 		 * If we're with initial-all-set, we don't need to write
 		 * protect any pages because they're all reported as dirty.
 		 * Huge pages and normal pages will be write protect gradually.
 		 */
 		if (!kvm_dirty_log_manual_protect_and_init_set(kvm)) {
-			kvm_mmu_wp_memory_region(kvm, mem->slot);
+			kvm_mmu_wp_memory_region(kvm, new->id);
 		}
 	}
 }
@@ -1491,8 +1491,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
-	hva_t hva = mem->userspace_addr;
-	hva_t reg_end = hva + mem->memory_size;
+	hva_t hva, reg_end;
 	int ret = 0;
 
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
@@ -1506,6 +1505,9 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if ((new->base_gfn + new->npages) > (kvm_phys_size(kvm) >> PAGE_SHIFT))
 		return -EFAULT;
 
+	hva = new->userspace_addr;
+	reg_end = hva + (new->npages << PAGE_SHIFT);
+
 	mmap_read_lock(current->mm);
 	/*
 	 * A memory region could potentially cover multiple VMAs, and any holes
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

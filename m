Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85969C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U4fmE9jX/WAt+SV8RdU9hLysyvwYWWksBIK9+1SA0Ks=; b=EOIxOXUp2n7ZW7IG/nhMG6sN4j
	7nUxOsmgoHxRCZj+roANH426NWHsbOoGqajqS0pnJ+U/oyweosKiIeDdXjnWOi0osvz0J7YzjIq3x
	vKf+KQ6iaRrRjAadB307w4mQNHeqaA490vXoqVB4vNIx9CtR7aS5+d/Flecc69xJikVSqOvbqMFOe
	oP3Szf1hf/AariSeV3wgkQWXlDsf9oJ+cGxD4An1etSTz1lBWlPyhDEYpELAI/f/yfCbYkcZtNApf
	oqWTvd8ENvzg+26l4eqnz5cf7FRo2w+45+J/7wwql7lAu5dVArhbwG8RmoVGOLOjpuRFmDbjy+sWF
	ZFZtL+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuiZ-00BW69-1E;
	Fri, 21 Apr 2023 17:38:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuiV-00BW4g-27
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Apr 2023 17:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gE2N+oWt7hK60UExWH8Apuvl/6Zc9TUNxMrpzS6/3Tk=; b=W/j20STzLPS8u+qvGvD+ng5CMb
	nHJ219LTXpXwEm3mAEmkEEy+Y26CSjMd15EXj6BqywFY9SLuVrsefZg5XhardU1JIPEKeWJWvw+Pj
	79WdkLzsfRU7AdWueaen4vNbEPAjQ+Fb6tKXsPzDNlXPxRL8Z+4wgWiDNWMjm2YAu9n7r7B5IjfzQ
	+MBmf332BIibttruivpVglz/OCuwDzt45hQzizeTurkHsaVGVLjw3Tj0+ulZUuU3xEbV6uwTzIDh1
	EB3wZLC4GZENg1F9HwiB6wpLOUGLLUunvwyWOVaKGVpVBCuQQt53C+M7PZKIsx1a0sVTWcyH8hB5g
	tv/7gNhA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0j-005NC7-2b
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:29 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1a52677bd54so15773365ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682096001; x=1684688001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gE2N+oWt7hK60UExWH8Apuvl/6Zc9TUNxMrpzS6/3Tk=;
        b=gSJswkUtsqGy+NAfu8py5auMpkfLQNTOEqX3uJ9U9Og/ThQanQOKyGUkdPpPpGces1
         JpO7/8XndhNyW9IWOI0DDDaGS4u0h+nk5XDS2GaU/CIIPt+gKrJUunjiSwrs3SD6+lmK
         wh8ezPSLRVsI9k+kb5tXPIHwUoJgXCm0nOXfCCMzRUm+aSooj6bPriuueEgRC25O2ve2
         DnSPWIvPfpaLGGXJeHYj1BpIYqB/JxSdn66Mw4UCn5rgAEpuf+2j/iCwE5JFs61Ikr7f
         Ym5a7YO8FpydTjeb6RKG5TTrhNhKd8qH9v5YJRVyuzemRjvxOLMfGgUvt+dkgVK1UreB
         wi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682096001; x=1684688001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gE2N+oWt7hK60UExWH8Apuvl/6Zc9TUNxMrpzS6/3Tk=;
        b=AWQd77Km+g6S0yAcA/pOjxzBuPOCInEZXs0IlhRmKEjIoMYjQzrVt57rwtLzY/pmET
         NUJs1sTTZr/AWtyN2HxgbvXHvJF8b+FV7grg87RIReSLnZGIXD5g4DoVMfPFr/9LroR4
         bxap2LyoIK6gckn5Pr+zoJw2OPbLhKGVphZJ7fwruMZpxV6HWScGzTf5lzlTBzlMKZNR
         XsPuXzNgSg0NDo4xcyAZRZTO+RS4OI3EwECxlpKrjAv4oOhcyoyxwt8Vzv8rag0ghtKD
         9W9eiH6V/6+NROw6Lyoyb1ds3UaFl1JULyw27Jaahyeof7uG6sWySuzjWu/3UMWA76W2
         Qnwg==
X-Gm-Message-State: AAQBX9civKaMNBZHbj+QTL7uCsgb22738aoZ/R2lDbC31A38vW0l27rF
	PDIk2KuC6llQRETBU7by3Tr3crpUIc27
X-Google-Smtp-Source: AKy350Zm39wmROPzIjLdWsr/QX3YmQtoV9lDDZ9cKibG8CUkTfGAonW6liBLjD1f7VOqEfq8woe5teAtwAON
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:902:ca14:b0:1a6:b4bf:8956 with SMTP id
 w20-20020a170902ca1400b001a6b4bf8956mr1835188pld.12.1682096001326; Fri, 21
 Apr 2023 09:53:21 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:53:03 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-8-vipinsh@google.com>
Subject: [PATCH 7/9] KVM: mmu: Move mmu lock/unlock to arch code for clear
 dirty log
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_175327_543724_EA65FD1F 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move mmu_lock lock and unlock calls from common code in
kvm_clear_dirty_log_protect() to arch specific code in
kvm_arch_mmu_enable_log_dirty_pt_masked(). None of the other code inside
the for loop of kvm_arch_mmu_enable_log_dirty_pt_masked() needs mmu_lock
exclusivity apart from the arch specific API call.

Future commits will change clear dirty log operations under mmu read
lock instead of write lock for ARM and, potentially, x86 architectures.

No functional changes intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c   | 2 ++
 arch/mips/kvm/mmu.c    | 2 ++
 arch/riscv/kvm/mmu.c   | 2 ++
 arch/x86/kvm/mmu/mmu.c | 3 +++
 virt/kvm/dirty_ring.c  | 2 --
 virt/kvm/kvm_main.c    | 4 ----
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7113587222ff..dc1c9059604e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1002,7 +1002,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		gfn_t gfn_offset, unsigned long mask)
 {
+	write_lock(&kvm->mmu_lock);
 	kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
+	write_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index e8c08988ed37..b8d4723d197e 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -415,11 +415,13 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		gfn_t gfn_offset, unsigned long mask)
 {
+	spin_lock(&kvm->mmu_lock);
 	gfn_t base_gfn = slot->base_gfn + gfn_offset;
 	gfn_t start = base_gfn +  __ffs(mask);
 	gfn_t end = base_gfn + __fls(mask);
 
 	kvm_mips_mkclean_gpa_pt(kvm, start, end);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 /*
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 78211aed36fa..425fa11dcf9c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -395,11 +395,13 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 					     gfn_t gfn_offset,
 					     unsigned long mask)
 {
+	spin_lock(&kvm->mmu_lock);
 	phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 
 	gstage_wp_range(kvm, start, end);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 144c5a01cd77..f1dc549b01cb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1367,6 +1367,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 				struct kvm_memory_slot *slot,
 				gfn_t gfn_offset, unsigned long mask)
 {
+	write_lock(&kvm->mmu_lock);
 	/*
 	 * Huge pages are NOT write protected when we start dirty logging in
 	 * initially-all-set mode; must write protect them here so that they
@@ -1397,6 +1398,8 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 		kvm_mmu_clear_dirty_pt_masked(kvm, slot, gfn_offset, mask);
 	else
 		kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
+
+	write_unlock(&kvm->mmu_lock);
 }
 
 int kvm_cpu_dirty_log_size(void)
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index c1cd7dfe4a90..d894c58d2152 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -66,9 +66,7 @@ static void kvm_reset_dirty_gfn(struct kvm *kvm, u32 slot, u64 offset, u64 mask)
 	if (!memslot || (offset + __fls(mask)) >= memslot->npages)
 		return;
 
-	KVM_MMU_LOCK(kvm);
 	kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot, offset, mask);
-	KVM_MMU_UNLOCK(kvm);
 }
 
 int kvm_dirty_ring_alloc(struct kvm_dirty_ring *ring, int index, u32 size)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f40b72eb0e7b..378c40e958b6 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2157,7 +2157,6 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 		dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
 		memset(dirty_bitmap_buffer, 0, n);
 
-		KVM_MMU_LOCK(kvm);
 		for (i = 0; i < n / sizeof(long); i++) {
 			unsigned long mask;
 			gfn_t offset;
@@ -2173,7 +2172,6 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
 			kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot,
 								offset, mask);
 		}
-		KVM_MMU_UNLOCK(kvm);
 	}
 
 	if (flush)
@@ -2268,7 +2266,6 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 	if (copy_from_user(dirty_bitmap_buffer, log->dirty_bitmap, n))
 		return -EFAULT;
 
-	KVM_MMU_LOCK(kvm);
 	for (offset = log->first_page, i = offset / BITS_PER_LONG,
 		 n = DIV_ROUND_UP(log->num_pages, BITS_PER_LONG); n--;
 	     i++, offset += BITS_PER_LONG) {
@@ -2291,7 +2288,6 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
 								offset, mask);
 		}
 	}
-	KVM_MMU_UNLOCK(kvm);
 
 	if (flush)
 		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

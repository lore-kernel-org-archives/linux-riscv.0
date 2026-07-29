Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EB5C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nvi89ChIUwrdrti+DXMFrg4SrlTVd+1iw0XyQsto174=; b=clpkI+BvYTBCvI
	SoP6FkROYrnr6l8/0mITQOFoAax5qPoZ7tsrWxLGNRD1q2JLWRJCxoKwxkoqWU3YaWLqouHqgA0en
	i8us0GS17hxwI66VOHx7nz/YELo6/v7WoDjlq6YtINB7MaaLaPhmtBsHPxBYjgBLVj8ZP27bzbISA
	kFj7dGfH6ka0hpJ6AkrQfvXrshPc6KLr1FecL4Dw8D7pOkqLFV3iITbEh44SYoryE22eQfpH+3yrr
	OqhkXAwGEWt1suQE3TABTDR/dDtX2fl0H/Q1IJWklGrB8+K1mGUyT4g42BRn9bpt38lp9V4Vagx73
	w1bWx5IhgT1Uwg3KAb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyOd-0000000759u-3SZa;
	Wed, 29 Jul 2026 07:08:07 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyOb-0000000758n-0Rr3
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 07:08:06 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3810f0aba07so279727a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785308884; x=1785913684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3JdpARdvO6SntweUzlxloeUTF3+X8KQZf2BNPxyxhE=;
        b=FamMNHlfHR7tf47O7TzuXNU0xf0t3faSHAzhEy2ym0Ffgr0JV0ZA35j32p1uB8TRBt
         fOMbyKUyeXj9xR4gv27Szrl8AXb5VgO5BJNY8w9zDwEOAoSURmHr0+9C15k4Jb/lgOle
         5ue3rqMwsOKArLvy7VmXX0dkWb8qcNw2UppQRqRx1g0BxlyK6PFwKCGjmVA80hxwdK56
         xj9KBeTTm3lr+4l7AAGiofC+NzxCtSjAw8ulkYNqDZyEqGJvWk/T/et2gg8czrS1Fg4s
         blk/+a+5ZfzJ6/nvRsRpCQSUF2b/WylH1O+N8Awv27/Kz9JOmHux9R2/oIlr+Y0PVF5O
         uvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785308884; x=1785913684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3JdpARdvO6SntweUzlxloeUTF3+X8KQZf2BNPxyxhE=;
        b=PHGhyQSV5goydtvtF+Qv6P5uCdcdGL6MX9UmWf3Sna3PIgccwNqhILmFEEUzCvBDRo
         x/WCHapuLn28X5+meMhf8+LyKNKjogmPREELrt/Ka7EsLNytt3Ahf4wJWc4j4LCh3YwR
         mzAZGdfOXThpD5immbwxXmzcAqQel6xyEDEcHrK5xZLte8PYC57GUPsWJP42mTHOlFip
         mDp3eT+Wwgw+T9tJCmwJbY2l7tZcj87TALuBxlBLylb1IBKjLUnrgt3Q4P8N3ZBs6cyl
         SYyJRAgn05sadGT7EBpJQGUh+hRw9ZDW4rdUNlF6vw2gUMsMKtETGWJlYzzt5p8JfGHO
         Rmsw==
X-Forwarded-Encrypted: i=1; AHgh+RqcJmSmXi9Zq6JwhS2CjbdjchxyVpoxSb5HWYVG3GvuBEQWLL1P4kHUAxJOBjLG8MDKXrBwn3uSnChCgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsUgQoDAb2c5gnV4RMm2E1piX1iQEKrsSY89fKyNMow89fMZk9
	PhjeJLXEc7UTk4CHfPxn5+KGwLiaKTWB+gYkOTF6R6xnJoQ/qWU2OTn/+a4gcRfL2QM=
X-Gm-Gg: AR+sD12xnGxZk1AFuh/VSFaLemV5Fko3EJaWxXe5kmP3EiEyHGPFRUps2UjDzBqn6dt
	8/JbVTc5UQTGEc35BcVyqOctWQ1EES3D34+peALS6tQPN1jecEMMFXhqeKkZ/XWI8/9sgbzrtF+
	/6wD1W3KV2QTH8Jlz7ehKHjg0uehPNcExbjpeiVPzJNkUza41FsVAB9p+9Ia7sHpRSFrcr10+ro
	C078/wbDmPLpaXlXvuBmNrUoKaUFqKwV87s+JQqsWXwmQkWxZrHI75C4sah9N6hI9rO0Pz6rg/p
	9lzpZerPObUDbpPaZI2AYgGPjG6hSYYLa8CcL42nrCnDfd2sRoV0AjiyP/uO6HT1zRQBhkuqb1t
	Gas0N3K/NcH80SkMSVEcxF/SSDViJ/7wMgOJRT5kV8076+Y9fQNyXE8vcYg3frPvl0SsIxUh4xJ
	lgSN+bJst8n08hzW5q3qvJHTT6eevqjBRu5V41eRhsRjmLxzpMh/nz23Pj9CsWwyG2bwm7P7ZTv
	+U=
X-Received: by 2002:a17:90b:3c12:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f6a44b7a8mr6072575a91.14.1785308884161;
        Wed, 29 Jul 2026 00:08:04 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292af9sm873721a91.11.2026.07.29.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:08:03 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [RFC PATCH] RISC-V: KVM: Add minimal guest_memfd support
Date: Wed, 29 Jul 2026 15:07:56 +0800
Message-ID: <20260729070756.730312-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_000805_180935_C0B0F7F1 
X-CRM114-Status: GOOD (  12.38  )
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

Add minimal guest_memfd support for RISC-V KVM, following the same
pattern as x86 and arm64.

1. Select KVM_GUEST_MEMFD in Kconfig
2. In kvm_riscv_mmu_map(), check kvm_slot_has_gmem() early, before
   taking mmap_read_lock(). For gmem memslots, resolve the PFN via
   kvm_gmem_get_pfn(), then acquire kvm->mmu_lock and jump to G-stage
   mapping, bypassing vma_lookup()/__kvm_faultin_pfn(). The gmem PFN
   is resolved before mmap_read_lock() so the mmu_lock taken for the
   mapping is never held while waiting for mmap_lock, which would
   deadlock against mmu_notifier invalidation (mmu_lock -> mmap_lock).
3. Skip kvm_release_faultin_page() for gmem pages; their lifetime is
   managed by the gmem inode and invalidation notifiers.

Verified: defconfig + CONFIG_KVM_GUEST_MEMFD=y compiles cleanly.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/Kconfig |  1 +
 arch/riscv/kvm/mmu.c   | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..77121100579f 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_GUEST_MEMFD
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d2a06a54be17..a9d61d0366e2 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -557,6 +557,19 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	/* Setup initial state of output mapping */
 	memset(out_map, 0, sizeof(*out_map));
 
+	if (kvm_slot_has_gmem(memslot)) {
+		int max_order;
+
+		ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &hfn, &page, &max_order);
+		if (ret)
+			return ret;
+
+		vma_pagesize = PAGE_SIZE;
+		writable = true;
+		write_lock(&kvm->mmu_lock);
+		goto map_gstage;
+	}
+
 	if (is_write && logging &&
 	    kvm_riscv_mmu_dirty_log_write_fault_fast(kvm, memslot, gpa, out_map))
 		return 0;
@@ -643,6 +656,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
 		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
 
+map_gstage:
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
@@ -658,7 +672,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret, writable);
+	if (!kvm_slot_has_gmem(memslot))
+		kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

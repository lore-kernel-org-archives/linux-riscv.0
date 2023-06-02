Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07390C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IFaNBLf4Gg0v3oxeTLXDszYDgxFz6iksM3Jw4R4Srys=; b=Yojanf7xUv7MeYNxxOR3ERIFzz
	8ME1fSPec23CiyYBBFNlcy1jI2UVX8mGc20cGJ76U9X6+XYAJ4fBLYwAYXhP0WRA23vvmRIZr9SrS
	jsEB9/l2p7rPVev9y9wflJaWerm1UsuhTa0yQ0wfkILS7yYHX0evDiTfKD5GlQs5HEjPlUffLt9NR
	a8YrjD99sC5XzGAnIwo/HIJNz0BzknRUIL4L1pwoC3jx9ULZOG7e1RcBUzVS/9axiHg4k3lG3sNnk
	I5ID6UNMljgOiD3BIO4mWkFupNeAfocGj4g+1KaF1+40BqTTi6iMpDRNprqnSE9RF2I+Q5WLiAzJh
	qyR9b54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57jb-007PiE-2d;
	Fri, 02 Jun 2023 16:34:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57jZ-007Pfm-0e
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pnaTvciscS5chSJrFdy/XWmGw+v5DL+sKG313yn6vtE=; b=gUEVHRPYwSH7E2XXV/RG8EwyJa
	ZJaCbhkmz7FdMkvDfS5GylRo6F+gfk5TKWciU6rEryNXD/lMp4+ezgZc/uJJmTQBuTWUvQp8ws1iX
	oHT26rpQ0TKYKX+sQOFkGxzUqVVjQVOLYhkijJDKEKxcQPb71Clcjh1+7x6nM3pXDUJ5vQwVH9o0R
	AB4kIUTY3cTNuN6QNUCfYnU4buLVzrVa7rCtO7YjJbSFsG8RBTHW5vlZlfezd7CflqEaGU5Gp6hp4
	zhcFL0fVmqKO1YiWMAKW3t39EeR2jJXsO/HdhcqO+yKtkhFuk2T0CY+W7tTN8w+LmjAwWJca0/Ofc
	ezodFCqQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q57Lf-009Lnp-7K
	for linux-riscv@lists.infradead.org; Fri, 02 Jun 2023 16:09:57 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-653d8974c49so170766b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722192; x=1688314192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pnaTvciscS5chSJrFdy/XWmGw+v5DL+sKG313yn6vtE=;
        b=3qM+gPLnKOcFkte53nrFJ4yxYHfRvj6VAQ74elJ+qIzLMj97WYlQnMm+LRqHDvoho4
         8AW7RUIjuOvTDqJRc6MGpLfknZTHUVt0ac+jf1e4fznmqTNQB1YeAez2Pbf+vu4gX/wo
         xA9uw3YiFJ59xCiKuG3PqvgkOpwn1kfOyfDGnV3P6/41gfMjzqB9OHhb0wbZKNfck3ux
         QuubqPWPIMr2dr+usJ/0oHW/nWAg0PkVCfHTFjYBlz4FbohVSt4JZLXej+/lCcVIkw51
         dikq26nIlv8414HoG8qlckcW0gk8fed5eU7B/bJPELllDOCa6K4cYwpu/yZBPdgX/sdW
         NMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722192; x=1688314192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnaTvciscS5chSJrFdy/XWmGw+v5DL+sKG313yn6vtE=;
        b=IdqQ5n2LrWdE7SAK47lEgKVhBmD83JYlzAq025QuoPgvSE/z9SKnc/IDwqSezS7opM
         KCg27KRX252CREOcuJLhsgYlV5EVvaYH+eKA6w/spNw4rKxwwUZ8D/wn9k5bfyW1eXJR
         whfmTkUiabNohmB2YQl2JHP5KgxJJQHZ51nY+jycrVOjzIMhaUjLHUwKRDOELhA7WINa
         lLVRhPfN5La7JPN4MuewIDpLKq/H4DrtGigMj/NzFm4PzGSIZjXmPcNSounAYWM2UDAh
         Ltat8o+TBMNbZIfyBBH49bWLvLFNdAuB3ZApfRxHawAxYY9bdm1TYIX/2uyxRPWpkwtk
         lxpw==
X-Gm-Message-State: AC+VfDzsCq22GuKPGOTB/X+ZCdrh5a+ymb160pEYD7AsGKtKmXizpHvm
	t9yTWiFLyvWOGsUULPtSQ1NOCIDVsgvO
X-Google-Smtp-Source: ACHHUZ7CrgQcXBBk0scZtBwPutYqwQ0i1jeHWFv03iHedZStcHfAHgjqtsGQJinldbGkFtIY3nwdqwhDBsPu
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6a00:2e1a:b0:64f:9e1b:d4a8 with SMTP
 id fc26-20020a056a002e1a00b0064f9e1bd4a8mr4922796pfb.1.1685722192061; Fri, 02
 Jun 2023 09:09:52 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:14 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-17-vipinsh@google.com>
Subject: [PATCH v2 16/16] KVM: arm64: Split huge pages during clear-dirty-log
 under MMU read lock
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
X-CRM114-CacheID: sfid-20230602_170955_270387_A2BE1CBF 
X-CRM114-Status: GOOD (  12.09  )
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

Split huge pages under MMU read lock instead of write when clearing
dirty log.

Running huge page split under read lock will unblock vCPUs execution and
allow whole clear-dirty-log operation run parallelly to vCPUs.

Note that splitting huge pages involves two walkers. First walker calls
stage2_split_walker() callback on each huge page. This callback will call
another walker which creates an unlinked page table. This commit makes
first walker as shared page walker which means, -EAGAIN will be retried.
Before this patch, -EAGAIN would have been ignored and walker would go
to next huge page. In practice this would not happen as the first walker
was holding MMU write lock. Inner walker is unchanged as it is working
on unlinked page table so no other thread will have access to it.

To improve confidence in correctness tested via dirty_log_test.

To measure performance improvement tested via dirty_log_perf_test.

Set up:
-------
Host: ARM Ampere Altra host (64 CPUs, 256 GB memory and single NUMA
      node)

Test VM: 48 vCPU, 192 GB total memory.

Ran dirty_log_perf_test for 400 iterations.
 ./dirty_log_perf_test -k 192G -v 48 -b 4G -m 2 -i 4000 -s anonymous_hugetlb_2mb -j

Observation:
------------

+==================+=============================+===================+
| Clear Chunk size | Clear dirty log time change | vCPUs improvement |
+==================+=============================+===================+
| 192GB            | 56%                         | 152%              |
+------------------+-----------------------------+-------------------+
| 1GB              | -81%                        | 72%               |
+------------------+-----------------------------+-------------------+

When larger chunks are used, clear dirty log time increases due to lots
of cmpxchg() but vCPUs are also able to execute parallelly causing
better performance of guest.

When chunk size is small, read lock is very fast in clearing dirty logs
as it is not waiting for MMU write lock and vCPUs are also able to run
parallelly.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6dd964e3682c..aa278f5d27a2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -126,7 +126,10 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 	int ret, cache_capacity;
 	u64 next, chunk_size;
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
+	if (flags & KVM_PGTABLE_WALK_SHARED)
+		lockdep_assert_held_read(&kvm->mmu_lock);
+	else
+		lockdep_assert_held_write(&kvm->mmu_lock);
 
 	chunk_size = kvm->arch.mmu.split_page_chunk_size;
 	cache_capacity = kvm_mmu_split_nr_page_tables(chunk_size);
@@ -138,13 +141,19 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 
 	do {
 		if (need_split_memcache_topup_or_resched(kvm)) {
-			write_unlock(&kvm->mmu_lock);
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				read_unlock(&kvm->mmu_lock);
+			else
+				write_unlock(&kvm->mmu_lock);
 			cond_resched();
 			/* Eager page splitting is best-effort. */
 			ret = __kvm_mmu_topup_memory_cache(cache,
 							   cache_capacity,
 							   cache_capacity);
-			write_lock(&kvm->mmu_lock);
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				read_lock(&kvm->mmu_lock);
+			else
+				write_lock(&kvm->mmu_lock);
 			if (ret)
 				break;
 		}
@@ -1139,9 +1148,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 
 	read_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end, KVM_PGTABLE_WALK_SHARED);
-	read_unlock(&kvm->mmu_lock);
 
-	write_lock(&kvm->mmu_lock);
 	/*
 	 * Eager-splitting is done when manual-protect is set.  We
 	 * also check for initially-all-set because we can avoid
@@ -1151,8 +1158,8 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	 * again.
 	 */
 	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		kvm_mmu_split_huge_pages(kvm, start, end, 0);
-	write_unlock(&kvm->mmu_lock);
+		kvm_mmu_split_huge_pages(kvm, start, end, KVM_PGTABLE_WALK_SHARED);
+	read_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

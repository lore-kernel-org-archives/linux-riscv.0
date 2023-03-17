Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF78C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 21:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=xyRsBwVQtBJOLPe3j8CKy1GznoQBAPy0/qKfJI5u9gk=; b=xsx
	JDGA72ygWGB+7tjkSaS+ATsEhyRnQ6mj0vuz2Cpj82ePDYD1avBbYhD7BV+M4L5ZvoyA6o5OP8oxy
	HS6j57mpLDR0QCP0BM3nRlKECjZoA2sWugPdAlS+4oPzGhPFWjMAEaj+OzjHYej6MESsX3zCFQs1R
	q0BD+HzS3GyzuuJ7yZ/v8ClSG769MrDcjb0WoPMRO3SelHihPOyUCroG15DDVh1hfiy2kCVG6mpcF
	mFRZYshxRUA0ZEv4fsxh15wb9+umwW6dkJNiPSiMPn99ghfZe47XqkOtafJZM945mHZvdXjr7NsCA
	ye32vBuDN3tb8BQkRng2ck360kwVIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHMJ-003PY0-2m;
	Fri, 17 Mar 2023 21:11:31 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHMG-003PWE-2P
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 21:11:30 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 204-20020a2514d5000000b00a3637aea9e1so6485934ybu.17
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 14:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679087482;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WQhD8cecG2lw7f4ASBIhYK1IsLLuRaNhUnK57Izlu3U=;
        b=jBtf/Lll6PR9MHdfL1x0pC39HEwrPWpmRrFzvqVF7UlMMd8i4/hP1y0+L6fF3THf3P
         wEaKAXmK1cs62qjKoNYfxxab7hni9OYTk8gkip+iurgAgqY3NyHrrBvvcaT7dydF5gWy
         ie+sFGneLF6nLeiRHZ+uFkhtk75zn0Y6NYk5twxcfsURDUqkZ21r29I3ZTeQUf8PIBjU
         crB8+SzXpx0rNLmOqMBhtICD/fLgqeh15WYGeYr9psNhS7slXyvzK/QLjNP4uQQkNPjq
         8j4TzZoDocPQlLCddT9N39T0Z9lXUnBU5NvlzjphFq8V+ZFO6JaLOzcO+SubFV7h54gQ
         BPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679087482;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQhD8cecG2lw7f4ASBIhYK1IsLLuRaNhUnK57Izlu3U=;
        b=h1ox5MxTnNvC53kcN7UVM/v33O194UaUuyLNWpLM5fki8a+yGf5Hwy6wyebZY8OKJ5
         sCUgr4K77T/m7k8HmXLYBBkvjnQV9NR6EVw4gAuU8G7j1Bu1/KFUeABjr2FkmJjxuGjE
         IUk7uJi3TZHm+CNx42OOeYoncwfdfel2sBH1KxUlDE2CwJnHrF7QO5/ICR789OKVO9KI
         84ADKyXJtPpx3BemYTYTaEi9tRV+IYPjKT0PsGRoL8wlKvN5/7EakaSlrCdCFYo5wzNF
         xfXsArYrrLSuYPwrlDRUuTgc0F6etfxNxDsNj2dqLNgm0XPVkx8h35FeuWekt0M+jyZx
         ZQOw==
X-Gm-Message-State: AO0yUKVzOTJGv2mRsrOhzjEkCCVpRupc1+VI+pE91Td8jUzaZIOFnJBY
	xX9jscbb7QUBhv5CbKMf3k5SJzdzsHPEmA==
X-Google-Smtp-Source: AK7set+SNiTmP2J+IL8lUhNwhFNEIbJIkL/PTyLj01bi/FQZoOtY+P7EHKBhm7n4KUmvvVxo+kVpWzxe0kT5Pg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6902:120b:b0:b51:2cba:b971 with SMTP
 id s11-20020a056902120b00b00b512cbab971mr567372ybu.10.1679087482088; Fri, 17
 Mar 2023 14:11:22 -0700 (PDT)
Date: Fri, 17 Mar 2023 14:11:06 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <20230317211106.1234484-1-dmatlack@google.com>
Subject: [PATCH] KVM: RISC-V: Retry fault if vma_lookup() results become invalid
From: David Matlack <dmatlack@google.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_141128_785425_4E1D6855 
X-CRM114-Status: GOOD (  12.80  )
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

Read mmu_invalidate_seq before dropping the mmap_lock so that KVM can
detect if the results of vma_lookup() (e.g. vma_shift) become stale
before it acquires kvm->mmu_lock. This fixes a theoretical bug where a
VMA could be changed by userspace after vma_lookup() and before KVM
reads the mmu_invalidate_seq, causing KVM to install page table entries
based on a (possibly) no-longer-valid vma_shift.

Re-order the MMU cache top-up to earlier in user_mem_abort() so that it
is not done after KVM has read mmu_invalidate_seq (i.e. so as to avoid
inducing spurious fault retries).

It's unlikely that any sane userspace currently modifies VMAs in such a
way as to trigger this race. And even with directed testing I was unable
to reproduce it. But a sufficiently motivated host userspace might be
able to exploit this race.

Note KVM/ARM had the same bug and was fixed in a separate, near
identical patch (see Link).

Link: https://lore.kernel.org/kvm/20230313235454.2964067-1-dmatlack@google.com/
Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
Cc: stable@vger.kernel.org
Signed-off-by: David Matlack <dmatlack@google.com>
---
Note: Compile-tested only.

 arch/riscv/kvm/mmu.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 78211aed36fa..46d692995830 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -628,6 +628,13 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
 	unsigned long vma_pagesize, mmu_seq;
 
+	/* We need minimum second+third level pages */
+	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
+	if (ret) {
+		kvm_err("Failed to topup G-stage cache\n");
+		return ret;
+	}
+
 	mmap_read_lock(current->mm);
 
 	vma = vma_lookup(current->mm, hva);
@@ -648,6 +655,15 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
 		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
 
+	/*
+	 * Read mmu_invalidate_seq so that KVM can detect if the results of
+	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
+	 * kvm->mmu_lock.
+	 *
+	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
+	 * with the smp_wmb() in kvm_mmu_invalidate_end().
+	 */
+	mmu_seq = kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
 	if (vma_pagesize != PUD_SIZE &&
@@ -657,15 +673,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	/* We need minimum second+third level pages */
-	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
-	if (ret) {
-		kvm_err("Failed to topup G-stage cache\n");
-		return ret;
-	}
-
-	mmu_seq = kvm->mmu_invalidate_seq;
-
 	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,

base-commit: eeac8ede17557680855031c6f305ece2378af326
-- 
2.40.0.rc2.332.ga46443480c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C723C7EE26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cynSss4CFJnb/0jItthrdFobvlQickeRdwMAqn13AAc=; b=FyO7DOOEoV3Z/6
	4fc3AV13+KY67/kf23YJKIWHb1r3/GN73IT6EzHICFOYH1CCXGdo3x4eZLBA5KdOiRvQN6NXyuX5X
	m6pAUoTLdXVxU0QQPgzHuq6UIFnbvT+vOMM2VFnadcymLuXNQm0Nuln3mdcc1P+mZsDB/beytHQy8
	gLGp/7aMc+weiLn/XjeMA3kMKjfx3xE7aVAZbm/Ul2HWEaGhHA1rtwIAGV3B8pKeCGrEqrYlQsWgw
	VsLezxGmUD9N4k3CTw2gr6pEJbP/SSh2g1UQxnSxO4stG+ZY0/oeSVXj8xNEskWeSA7cbtrGa9vv0
	a0cV/gu8WobAnmZEwzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VXF-00Auj7-02;
	Tue, 23 May 2023 17:10:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VXC-00AuiP-16
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 17:10:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B227B6222F;
	Tue, 23 May 2023 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CA5C433EF;
	Tue, 23 May 2023 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861853;
	bh=iYEi+B9sslkLJiksbVO2kVvlfMuA7iAdpf02AyS8igQ=;
	h=From:To:Cc:Subject:Date:From;
	b=PhDRPvYZILhYEYCmQtt/slf03Yh5MHR8+iyRxWyhTh0eq+BhqtiOWmp610Nbsl1oh
	 zpMvW7cAZ7KmLytiPFn5OwUU7+NH2z0jMIFQ2xdKZU5QrSiMMsHbXcSToHXwnN33D2
	 R53shFR+HN4q3PTe3gqtoRz5M/oYvlNGV+NYyt+ctmKTaLaDcEtX1DL74HQRqGyg/d
	 /IuV75WmSi2z9yzargQmPsWNyXPRCST0duDsSFI06XF9mPeBUnX3yVhu5b9AnzYHjx
	 iK2GXx+uNq0FtyeDKxJjxeUxUhiE4/cDDyDuFbNVkvz0mZEpMEkOVfcoquSUIfTZpB
	 nekLt4xeKLHQg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH] riscv: mm: try VMA lock-based page fault handling first
Date: Wed, 24 May 2023 00:59:42 +0800
Message-Id: <20230523165942.2630-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_101054_440661_143FC6F4 
X-CRM114-Status: GOOD (  12.97  )
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

Attempt VMA lock-based page fault handling first, and fall back to the
existing mmap_lock-based handling if that fails.

A simple running the ebizzy benchmark on Lichee Pi 4A shows that
PER_VMA_LOCK can improve the ebizzy benchmark by about 32.68%. In
theory, the more CPUs, the bigger improvement, but I don't have any
HW platform which has more than 4 CPUs.

This is the riscv variant of "x86/mm: try VMA lock-based page fault
handling first".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Any performance numbers are welcome! Especially the numbers on HW
platforms with 8 or more CPUs.

 arch/riscv/Kconfig    |  1 +
 arch/riscv/mm/fault.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62e84fee2cfd..b958f67f9a12 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
+	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 8685f85a7474..eccdddf26f4b 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -286,6 +286,36 @@ void handle_page_fault(struct pt_regs *regs)
 		flags |= FAULT_FLAG_WRITE;
 	else if (cause == EXC_INST_PAGE_FAULT)
 		flags |= FAULT_FLAG_INSTRUCTION;
+#ifdef CONFIG_PER_VMA_LOCK
+	if (!(flags & FAULT_FLAG_USER))
+		goto lock_mmap;
+
+	vma = lock_vma_under_rcu(mm, addr);
+	if (!vma)
+		goto lock_mmap;
+
+	if (unlikely(access_error(cause, vma))) {
+		vma_end_read(vma);
+		goto lock_mmap;
+	}
+
+	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
+	vma_end_read(vma);
+
+	if (!(fault & VM_FAULT_RETRY)) {
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+		goto done;
+	}
+	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			no_context(regs, addr);
+		return;
+	}
+lock_mmap:
+#endif /* CONFIG_PER_VMA_LOCK */
+
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma(mm, addr);
@@ -355,6 +385,9 @@ void handle_page_fault(struct pt_regs *regs)
 
 	mmap_read_unlock(mm);
 
+#ifdef CONFIG_PER_VMA_LOCK
+done:
+#endif
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		tsk->thread.bad_cause = cause;
 		mm_fault_error(regs, addr, fault);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

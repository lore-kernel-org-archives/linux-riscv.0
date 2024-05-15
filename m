Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBAFC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 05:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4uiWUX3bGJcfC3mzE9PmYiQyKowcOfZUA3a84ApDm4=; b=hAdKOb7hWkR/xZ
	lZvm6CF6GmRScWk01xApcHskLiRanqaDijHMpYtiJBA0GkMJH0B0GtL5rCZpHa5n/I8xiFj2ssYEJ
	H9DfYf6SvjNP2L86DfkZfoONptWrm5xlUYpiaMCb2lUvhyvTysg/QWVWtS9YBTRN+IHF7dL0iH3aD
	HsT8enTDesDzN4GcUMIxGIb+u96h3WdlXPAV+kIX7qXZiWhZDDfDMDXsH1mCCZ9AnBTUHY39FeLAR
	eaKDK3tlvBVjMmQ/I/JNi8ttdNDOga03W3AJxubW1F1BHFeO2q6l8SUdiucjbhjRmv7DwStGcI5Xn
	hwRqUsZMtJvlpe/Zsk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77Xd-00000000YKZ-1B3B;
	Wed, 15 May 2024 05:51:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77XS-00000000YH1-3y8W
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 05:51:01 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715752248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ht2zV3Jwo1nvvXt+RYb/7OxyhB2TGOQ0zLq4kftAlWw=;
	b=v/zOiICbwxFvvbkhYTb+BPdiSUlGYgkohq22S5n934KSqzEjHtDwLZcNEOG3ZIk87yScRb
	txKNgenx67ZNeuMLTsLayjc4gQ6KqE/speyfXNjHNnV8EpX79YnhEki0eKmKIN+ipnAu/e
	VO/c3Cg/qoQTFFo7r7U36H0ZXijN41H9AeoMDneSIwrB+FBJHmMfewSYA6iIoPQgKPi7T0
	ANzPrE6+n0D/D09ZW5vHZzG4qISdWsrjEnJgclz8iDlJilyCR79a74IvhZIubEB+cZ0b15
	fj4wcvw+3UQDgwrWulXLz+FwHRRJ5nH71boZztBItkHHDhKHresYrRvRot6MoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715752248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ht2zV3Jwo1nvvXt+RYb/7OxyhB2TGOQ0zLq4kftAlWw=;
	b=l5c/HVYLvLyXdUH93a45vxSwZGEUso1ZTwv2+/NzTtyLp2LFyX4HFlVW3ws+TGQ1tkeu8l
	JMisrKDY27LCUaCQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] riscv: force PAGE_SIZE linear mapping if debug_pagealloc is enabled
Date: Wed, 15 May 2024 07:50:39 +0200
Message-Id: <2e391fa6c6f9b3fcf1b41cefbace02ee4ab4bf59.1715750938.git.namcao@linutronix.de>
In-Reply-To: <cover.1715750938.git.namcao@linutronix.de>
References: <cover.1715750938.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_225055_272592_5F4784EB 
X-CRM114-Status: GOOD (  10.69  )
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

debug_pagealloc is a debug feature which clears the valid bit in page table
entry for freed pages to detect illegal accesses to freed memory.

For this feature to work, virtual mapping must have PAGE_SIZE resolution.
(No, we cannot map with huge pages and split them only when needed; because
pages can be allocated/freed in atomic context and page splitting cannot be
done in atomic context)

Force linear mapping to use small pages if debug_pagealloc is enabled.

Note that it is not necessary to force the entire linear mapping, but only
those that are given to memory allocator. Some parts of memory can keep
using huge page mapping (for example, kernel's executable code). But these
parts are minority, so keep it simple. This is just a debug feature, some
extra overhead should be acceptable.

Fixes: 5fde3db5eb02 ("riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
Interestingly this feature somehow still worked when first introduced.
My guess is that back then only 2MB page size is used. When a 4KB page is
freed, the entire 2MB will be (incorrectly) invalidated by this feature.
But 2MB is quite small, so no one else happen to use other 4KB pages in
this 2MB area. In other words, it used to work by luck.

Now larger page sizes are used, so this feature invalidate large chunk of
memory, and the probability that someone else access this chunk and
trigger a page fault is much higher.

 arch/riscv/mm/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2574f6a3b0e7..73914afa3aba 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -682,6 +682,9 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 static uintptr_t __init best_map_size(phys_addr_t pa, uintptr_t va,
 				      phys_addr_t size)
 {
+	if (debug_pagealloc_enabled())
+		return PAGE_SIZE;
+
 	if (pgtable_l5_enabled &&
 	    !(pa & (P4D_SIZE - 1)) && !(va & (P4D_SIZE - 1)) && size >= P4D_SIZE)
 		return P4D_SIZE;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

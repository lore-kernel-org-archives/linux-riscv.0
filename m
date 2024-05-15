Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CAAC25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 05:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Nxw40VGqj/IATkk2XjO/YSSWrCL/HDR7+tAZJTPgiw=; b=jAalPIz1vvw1Po
	UG2kjwIiHeO8vxpSzB+7qgMzgyuVfJ3jplyx+XzO1ktMPKyq8XfrLkZC3LA+vtBStc5OpZ3svszkd
	I63pElkUgVUHiVhN9ZBb49NBTEOcVwJOdC3+b7zQdAi1NhBKLyc+12zPZdRiQj2n9WcizM8ROo0pg
	c8yA2Th0BaUsPGNRDujg5/y0i5oUAnJ5MZvbMYYFyaLsx4vE+UTvxIFMZTPU/xeUzFUXeUm/IaV2h
	DEfeJu8zG1dQ/yBf9L056SS1ATHccZq49wHCS3Swxj/g17tl+7RGrFosXb+n2pPcCGynRVXoR//PE
	6BxlRP5iIusyXD1uWWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77Xa-00000000YJt-2G5N;
	Wed, 15 May 2024 05:51:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77XS-00000000YH7-3srt
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 05:50:58 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715752248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcCWvr4SYjjrlRwhgChA7o17sApj+WC9QqfSYFJ7iw8=;
	b=BBp/I4aAMOJZAn0wYG2Ov3GZZFd3p39GWccszwcrm6q7whrnMNp+LT633bIzm7vK7JPRza
	UIFJALiiqKN+Lc2IlqzVYYNB8yP1J5c2wgXfvy8w2rUhEcYXS/776ppePa3vyo4v+96rhX
	zKMB47qE07KbmgDAm/bJxjdTdpNt5M4vpN8xHxOq1UHmwO4CMYg0kqZfZrGXmH/hZwp6hU
	X4hiMiChusRVwIrS6TTt3MVJkUQ+rKmctwIv4J2igd2hE3f6f8XmIGOtVKOEKw6ATNjCYj
	twvrbySbUFgkAzoBSRwXR+wsmeAu218sF1lMxiKzc5ybIBkuVdUIJcFl0WXdtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715752248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcCWvr4SYjjrlRwhgChA7o17sApj+WC9QqfSYFJ7iw8=;
	b=xw64g/ieiCfH+JsJAphRQgD5n4QcjPNhfUwFJaLtQ81Kzet3RCCy3Z8NJgbJMfQ13Kg7ai
	56K9Ek3XHbUwS6Dw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] riscv: rewrite __kernel_map_pages() to fix sleeping in invalid context
Date: Wed, 15 May 2024 07:50:40 +0200
Message-Id: <1289ecba9606a19917bc12b6c27da8aa23e1e5ae.1715750938.git.namcao@linutronix.de>
In-Reply-To: <cover.1715750938.git.namcao@linutronix.de>
References: <cover.1715750938.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_225055_261531_BBAD9501 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

__kernel_map_pages() is a debug function which clears the valid bit in page
table entry for deallocated pages to detect illegal memory accesses to
freed pages.

This function set/clear the valid bit using __set_memory(). __set_memory()
acquires init_mm's semaphore, and this operation may sleep. This is
problematic, because  __kernel_map_pages() can be called in atomic context,
and thus is illegal to sleep. An example warning that this causes:

BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1578
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 2, name: kthreadd
preempt_count: 2, expected: 0
CPU: 0 PID: 2 Comm: kthreadd Not tainted 6.9.0-g1d4c6d784ef6 #37
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff800060dc>] dump_backtrace+0x1c/0x24
[<ffffffff8091ef6e>] show_stack+0x2c/0x38
[<ffffffff8092baf8>] dump_stack_lvl+0x5a/0x72
[<ffffffff8092bb24>] dump_stack+0x14/0x1c
[<ffffffff8003b7ac>] __might_resched+0x104/0x10e
[<ffffffff8003b7f4>] __might_sleep+0x3e/0x62
[<ffffffff8093276a>] down_write+0x20/0x72
[<ffffffff8000cf00>] __set_memory+0x82/0x2fa
[<ffffffff8000d324>] __kernel_map_pages+0x5a/0xd4
[<ffffffff80196cca>] __alloc_pages_bulk+0x3b2/0x43a
[<ffffffff8018ee82>] __vmalloc_node_range+0x196/0x6ba
[<ffffffff80011904>] copy_process+0x72c/0x17ec
[<ffffffff80012ab4>] kernel_clone+0x60/0x2fe
[<ffffffff80012f62>] kernel_thread+0x82/0xa0
[<ffffffff8003552c>] kthreadd+0x14a/0x1be
[<ffffffff809357de>] ret_from_fork+0xe/0x1c

Rewrite this function with apply_to_existing_page_range(). It is fine to
not have any locking, because __kernel_map_pages() works with pages being
allocated/deallocated and those pages are not changed by anyone else in the
meantime.

Fixes: 5fde3db5eb02 ("riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 arch/riscv/mm/pageattr.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 410056a50aa9..271d01a5ba4d 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -387,17 +387,33 @@ int set_direct_map_default_noflush(struct page *page)
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
+static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
+{
+	int enable = *(int *)data;
+
+	unsigned long val = pte_val(ptep_get(pte));
+
+	if (enable)
+		val |= _PAGE_PRESENT;
+	else
+		val &= ~_PAGE_PRESENT;
+
+	set_pte(pte, __pte(val));
+
+	return 0;
+}
+
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (!debug_pagealloc_enabled())
 		return;
 
-	if (enable)
-		__set_memory((unsigned long)page_address(page), numpages,
-			     __pgprot(_PAGE_PRESENT), __pgprot(0));
-	else
-		__set_memory((unsigned long)page_address(page), numpages,
-			     __pgprot(0), __pgprot(_PAGE_PRESENT));
+	unsigned long start = (unsigned long)page_address(page);
+	unsigned long size = PAGE_SIZE * numpages;
+
+	apply_to_existing_page_range(&init_mm, start, size, debug_pagealloc_set_page, &enable);
+
+	flush_tlb_kernel_range(start, start + size);
 }
 #endif
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

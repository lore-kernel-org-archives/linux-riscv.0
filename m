Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8EBC982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w25sgLfxXbR5jvr9z2wRMpI53EtoP0rY4xQrr7ZcE+w=; b=OisUL1q5CgePxH
	hMW4L3DLcdmnvEa47ddaL3ljT2p82w1sakD0BrmA1tMeHTe7UsyXXIKmLddXKsVOqDzj9pBP8/DsJ
	OLBTK0XRb6bBXIb9QFFJXhAsO/mkIEatjH6WB0qLrlRf9H7obIQCB3jCBgu84IQ7i7rIMP0SDNjTj
	ZmyBWu1APE+Tb9C5PU3qToszeKDGIC0rpzOUom87Wgm8KqsY6fZQJuDnnX+iYcvsKrn49+rcDR5Kb
	AG1BKlpMailHPRbFQ8UWg/F1rAxKPBSu1EEZPKjvQGp6+uCXZC+CEhOx7MGziRBhJh0AHf8zovtOY
	70GxkL/eX41Cc8Wjilhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8duB-00000002DbI-0izi;
	Mon, 21 Sep 2026 13:17:59 +0000
Received: from out-235.mta0.migadu.com ([2001:41d0:1004:224b::eb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8du8-00000002DaM-34Ur
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 13:17:57 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ueVOpPzYnMeot+dswpS82YrnsBHSSPYd5K+PQjCvvaY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789996674; v=1; x=1790601474;
 b=X/SjqYcJokzG5Jzyk6IVWxAXA+B4Xm2zy1fhXRgjy9ZEfXBQNe028meEjtHeHVkI9ZGDZo0U
 vBCYfFcQl7QxHlYUPwMhSmzQ9JxpQNVX7LiAOzX4bRqgCdd6x7u/k1nBG4zy91iUNa8YHVRUDCW
 AjTsvty9tppeRrskQ66c1STU=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f48b4f0c2c5289ef;
	Mon, 21 Sep 2026 13:17:54 +0000
X-Mizu-Trace-ID: f48b4f0c2c5289ef
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 21 Sep 2026 21:17:22 +0800
Subject: [PATCH v2 2/3] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
MIME-Version: 1.0
Message-Id: <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
In-Reply-To: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_061756_921653_4E0515BF 
X-CRM114-Status: GOOD (  11.48  )
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

From: Ye Liu <liuye@kylinos.cn>

vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
but a vmalloc allocation may span multiple vmap zones.  The VA is
stored in only one node's rb-tree (addr_to_node(va_start)), so an
object pointer in a different zone than va_start maps to a different
node and the search misses.  This affects any allocation larger than
vmap_zone_size (64 KiB) on multi-CPU systems.

Iterate all vmap nodes using for_each_vmap_node, like find_vmap_area()
does, but with spin_trylock instead of spin_lock as this function can
be called from atomic dump contexts (OOM, KASAN, RCU).

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df42d8a6f058..30c610f678dc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5278,17 +5278,29 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long nr_pages;
 
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
-	vn = addr_to_node(addr);
 
-	if (!spin_trylock(&vn->busy.lock))
-		return false;
+	/*
+	 * A vmalloc allocation may span multiple vmap zones, so the
+	 * node whose rb-tree holds the VA may differ from the node
+	 * the address maps to.  Search all nodes.  Use trylock as
+	 * this function can be called from atomic dump contexts.
+	 */
+	va = NULL;
+	for_each_vmap_node(vn) {
+		if (!spin_trylock(&vn->busy.lock))
+			continue;
+
+		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va && va->vm)
+			break;
 
-	va = __find_vmap_area(addr, &vn->busy.root);
-	if (!va || !va->vm) {
 		spin_unlock(&vn->busy.lock);
-		return false;
+		va = NULL;
 	}
 
+	if (!va)
+		return false;
+
 	vm = va->vm;
 	addr = (unsigned long) vm->addr;
 	caller = vm->caller;

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

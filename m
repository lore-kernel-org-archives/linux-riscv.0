Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB93AC98311
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpXWjQcrFSVT//yT0BjXy2ofojqMt59v7qcYFKfPQb8=; b=3B2Z7ZzhVRBJNf
	VESOsoQUQK9VgUseCDlIZ8I7XeS9E+onKw7o0LFz6C9bAnGmA/PgvqZRcGBAcGDCY7dh9hew11fGM
	sHeu/j2zCtS+QvQHhVKwR6aRthJ0xlnLMUDZbkJCmPuxrwUBwmHxqoBBv65PutDCcbHOq2WyhAcZq
	4/FJ8LBRv2n5GLDu6eQ27JMSLqjvGxiWxO/V+PQIn36lnX5JWk2gRfHuYQHBassy+B7b9N+/Esawj
	ByBhuhC9mCZ7W+L3F/OgeGHZW+f1yPK1dR2xrnVVCy9EvRKVShHEouX/WsLGzARzIefoDb5RzeyOb
	caeAn9yRh72uy60wdnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fBS-0000000AV2w-1G0r;
	Thu, 24 Sep 2026 08:52:02 +0000
Received: from out-34.mta1.migadu.com ([95.215.58.34] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fBP-0000000AV0k-2wHN
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 08:52:01 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SSX9xIAupprnWjWqUwH2oYEZRlvMUWqzHUN8lhagogw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790239918; v=1; x=1790844718;
 b=BhFgSU6x72wnDos1k2qf6Fd9lM1UlkPIf4CIWWmHLJt7j/fJqj6dWrgEuE72JmEnf9OHrR+F
 kEukD5SkxDpC607CU2XjUQygInZipl9G3Gbx5Zo3kT7RiwH0sI79Z++bonMUUDKAiDkyUmMbN31
 VCGxdOzEQoiTuFnDpxkCzjco=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bf2fbf69d3d2174c;
	Thu, 24 Sep 2026 08:51:57 +0000
X-Mizu-Trace-ID: bf2fbf69d3d2174c
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Thu, 24 Sep 2026 16:51:40 +0800
Subject: [PATCH v3 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
MIME-Version: 1.0
Message-Id: <20260924-vmalloc_dump_obj-v3-2-5bdee3da37b3@linux.dev>
References: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
In-Reply-To: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015159_903992_13B5C2E5 
X-CRM114-Status: GOOD (  19.34  )
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

Extract find_vmap_area_lock() from find_vmap_area() to share the
cross-node iteration logic.  The helper supports both spin_lock and
spin_trylock, the latter for atomic dump contexts (OOM, KASAN, RCU).

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 111 +++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 42 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df42d8a6f058..e5b465de1559 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2517,39 +2517,81 @@ static void free_unmap_vmap_area(struct vmap_area *va)
 	free_vmap_area_noflush(va);
 }
 
-struct vmap_area *find_vmap_area(unsigned long addr)
+static inline int next_vmap_node_id(int i)
+{
+	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
+}
+
+enum vmap_lock_mode {
+	VMAP_LOCK,
+	VMAP_TRYLOCK,
+};
+
+/*
+ * Search for a vmap_area at @addr across all vmap nodes.  An
+ * addr_to_node_id(addr) converts an address to a node index where
+ * a VA is located. If VA spans several zones and passed addr is not
+ * the same as va->va_start, what is not common, we may need to scan
+ * extra nodes. See an example:
+ *
+ *      <----va---->
+ * -|-----|-----|-----|-----|-
+ *     1     2     0     1
+ *
+ * VA resides in node 1 whereas it spans 1, 2 an 0. If passed addr
+ * is within 2 or 0 nodes we should do extra work.
+ *
+ * Returns the VA with @locked_vn->busy.lock held; the caller must
+ * release it. If @mode is VMAP_TRYLOCK, nodes that cannot be locked
+ * are skipped.
+ */
+static struct vmap_area *
+find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
+		enum vmap_lock_mode mode)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	int i, j;
 
-	if (unlikely(!vmap_initialized))
+	if (unlikely(!vmap_initialized)) {
+		*locked_vn = NULL;
 		return NULL;
+	}
 
-	/*
-	 * An addr_to_node_id(addr) converts an address to a node index
-	 * where a VA is located. If VA spans several zones and passed
-	 * addr is not the same as va->va_start, what is not common, we
-	 * may need to scan extra nodes. See an example:
-	 *
-	 *      <----va---->
-	 * -|-----|-----|-----|-----|-
-	 *     1     2     0     1
-	 *
-	 * VA resides in node 1 whereas it spans 1, 2 an 0. If passed
-	 * addr is within 2 or 0 nodes we should do extra work.
-	 */
 	i = j = addr_to_node_id(addr);
 	do {
 		vn = &vmap_nodes[i];
 
-		spin_lock(&vn->busy.lock);
+		if (mode == VMAP_LOCK) {
+			spin_lock(&vn->busy.lock);
+		} else {
+			if (!spin_trylock(&vn->busy.lock))
+				continue;
+		}
+
 		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va) {
+			*locked_vn = vn;
+			return va;
+		}
+
 		spin_unlock(&vn->busy.lock);
+	} while ((i = next_vmap_node_id(i)) != j);
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
+	*locked_vn = NULL;
+	return NULL;
+}
+
+struct vmap_area *find_vmap_area(unsigned long addr)
+{
+	struct vmap_node *vn;
+	struct vmap_area *va;
+
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va) {
+		spin_unlock(&vn->busy.lock);
+		return va;
+	}
 
 	return NULL;
 }
@@ -2558,26 +2600,14 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
-	int i, j;
-
-	/*
-	 * Check the comment in the find_vmap_area() about the loop.
-	 */
-	i = j = addr_to_node_id(addr);
-	do {
-		vn = &vmap_nodes[i];
 
-		spin_lock(&vn->busy.lock);
-		va = __find_vmap_area(addr, &vn->busy.root);
-		if (va)
-			unlink_va(va, &vn->busy.root);
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va) {
+		unlink_va(va, &vn->busy.root);
 		spin_unlock(&vn->busy.lock);
+	}
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
-
-	return NULL;
+	return va;
 }
 
 /*** Per cpu kva allocator ***/
@@ -5278,14 +5308,11 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long nr_pages;
 
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
-	vn = addr_to_node(addr);
-
-	if (!spin_trylock(&vn->busy.lock))
-		return false;
 
-	va = __find_vmap_area(addr, &vn->busy.root);
+	va = find_vmap_area_lock(addr, &vn, VMAP_TRYLOCK);
 	if (!va || !va->vm) {
-		spin_unlock(&vn->busy.lock);
+		if (va)
+			spin_unlock(&vn->busy.lock);
 		return false;
 	}
 

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

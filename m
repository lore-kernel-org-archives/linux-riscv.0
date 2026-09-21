Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA72DC982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QzxFUFvgF5e+x74NnMQWSPH9soz+I/xzCPBvIZukSE=; b=2Oy0iyrTBNc2XY
	bZHdSS25maMFVmIpkPPF5YORmLevUugx+qqTfaAnChJGa89vRaaoQOlYcACtoJAmN5Kx51AXdM2lw
	LyvDvLSS+cOWydX+Jd4l+CwxoaZM7MEsQisvUPeYR4XyX3ZYcu16AOdtZF5DyEWfzojxpUJZ1FTjJ
	k6ysg1TMcm1IlD/H09YTzAQ7bOWCY/wklOF5NrvzTUxbV7eDtUa9MwpdPsPEs/z04sQHVXUwaLUO3
	H7QgEHkzX11iTvl40mMgjmbyI12nt2MwiWYZ7zk+UVCe4jBP9nSKTuq+sgaR8eZuTucxSaQLX9xIi
	NMPWi1aLvFkDlaPJWj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8duJ-00000002Def-1CXX;
	Mon, 21 Sep 2026 13:18:07 +0000
Received: from out-168.mta1.migadu.com ([2001:41d0:203:375::a8] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8duF-00000002Dby-0sXw
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 13:18:06 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IN3u//Q3+OpLA8rMnVjE8v9xBIK2AikPADGADNf418I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789996681; v=1; x=1790601481;
 b=myA1+5KRkTOpFpgN9Q7qgN+XSlBivE/MVPxxYjs+yMiMagjddcNTGevuYj+9z2O5eA4TEJQt
 X0YPrWdUw+XglWLP4iIDUMuTvTxoEvNYtoUhP968mOD6fsh+JU8gbRzxTXlARXkD5e7AQkcp5M7
 5HngVexuaiONVCvxe8lRki60=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 28b20bafde2dc762;
	Mon, 21 Sep 2026 13:18:00 +0000
X-Mizu-Trace-ID: 28b20bafde2dc762
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 21 Sep 2026 21:17:23 +0800
Subject: [PATCH v2 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
MIME-Version: 1.0
Message-Id: <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
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
X-CRM114-CacheID: sfid-20260921_061805_010985_940C75A3 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Ye Liu <liuye@kylinos.cn>

vmalloc_dump_obj() unconditionally searches all vmap nodes even when
called with a non-vmalloc address (e.g. a slab or stack pointer from
mem_dump_obj()).  Add an is_vmalloc_or_module_addr() check at the
entry to avoid the unnecessary per-node trylock and rb-tree traversal.

Use is_vmalloc_or_module_addr() rather than is_vmalloc_addr() because
module, BPF, and execmem allocations reside in MODULES_VADDR..MODULES_END
on x86_64, arm64, and riscv -- outside VMALLOC_START..VMALLOC_END -- but
are still tracked in the same vmap_nodes rb-tree.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 30c610f678dc..d8095b558365 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5277,6 +5277,9 @@ bool vmalloc_dump_obj(void *object)
 	unsigned long addr;
 	unsigned long nr_pages;
 
+	if (!is_vmalloc_or_module_addr(object))
+		return false;
+
 	addr = PAGE_ALIGN_DOWN((unsigned long) object);
 
 	/*

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

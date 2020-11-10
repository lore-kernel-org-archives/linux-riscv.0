Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C692BC388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:17:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 466B92076E
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rGQTl61s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVV/hsDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 466B92076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3sVsDrRSIoHSCXyALyuh1qUPx/YQFIFNFi5uEQUSJBQ=; b=rGQTl61s5Drw0aTNhhEni/54y
	WL1inqrq1bdHEbACoh2JUBZErXkQMnHuklFYq9yS7AgKreHU2FvOUII1o0XmGrmp1wHd3vX5UsVCf
	FMGdmWVhFguyXXiH45prbjLyPeUzE9pE/M9Xle8M0K63GZjptn9KrfAKp6wm7AT6lvzF7BzIcDesx
	d+9Wybj2Ct4uA83IxKJHRX7A0kckWNuRESvoXi2N+LtY7V//k4QxGUx7wKVcYY3pJtDWP+cS+k5pF
	LKWVEFCQ/v6tlE39oUSD07v9GbyQpTex4R0SFUMw4frgP4u8WkE6he6/TWzg+ticR/xffradKFmI6
	zeq1kKuEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcVO7-0001E7-8D; Tue, 10 Nov 2020 15:16:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcVNK-0000iT-8U; Tue, 10 Nov 2020 15:16:05 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76E162151B;
 Tue, 10 Nov 2020 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605021361;
 bh=bInqIGRUfZ/ZeTiTbRPYOh4OOIeCg0iqRXozcLKRJ3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZVV/hsDCUezNW7HJaYfn2+8TPpzuUbTmBlkXTTtd0iPWzXcMg2XJiuRBilBnrHW5r
 6osHn5gFkuMbrTDEYLCaYfBm053/CETLd26tjtEaEZTdOGFDF8erTIPYdD5f9a6y++
 V2JYeB/L6h3bBfG8jt5nhcD0qO0X9229KjmsRECA=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 6/9] secretmem: add memcg accounting
Date: Tue, 10 Nov 2020 17:14:41 +0200
Message-Id: <20201110151444.20662-7-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110151444.20662-1-rppt@kernel.org>
References: <20201110151444.20662-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_101603_054966_4214C05D 
X-CRM114-Status: GOOD (  23.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Account memory consumed by secretmem to memcg. The accounting is updated
when the memory is actually allocated and freed.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/filemap.c   |  2 +-
 mm/secretmem.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 249cf489f5df..11387a077373 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -844,7 +844,7 @@ static noinline int __add_to_page_cache_locked(struct page *page,
 	page->mapping = mapping;
 	page->index = offset;
 
-	if (!huge) {
+	if (!huge && !page->memcg_data) {
 		error = mem_cgroup_charge(page, current->mm, gfp);
 		if (error)
 			goto error;
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 1aa2b7cffe0d..1eb7667016fa 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -17,6 +17,7 @@
 #include <linux/syscalls.h>
 #include <linux/memblock.h>
 #include <linux/pseudo_fs.h>
+#include <linux/memcontrol.h>
 #include <linux/set_memory.h>
 #include <linux/sched/signal.h>
 
@@ -49,6 +50,38 @@ struct secretmem_ctx {
 
 static struct cma *secretmem_cma;
 
+static int secretmem_memcg_charge(struct page *page, gfp_t gfp, int order)
+{
+	unsigned long nr_pages = (1 << order);
+	int i, err;
+
+	err = memcg_kmem_charge_page(page, gfp, order);
+	if (err)
+		return err;
+
+	for (i = 1; i < nr_pages; i++) {
+		struct page *p = page + i;
+
+		p->memcg_data = page->memcg_data;
+	}
+
+	return 0;
+}
+
+static void secretmem_memcg_uncharge(struct page *page, int order)
+{
+	unsigned long nr_pages = (1 << order);
+	int i;
+
+	for (i = 1; i < nr_pages; i++) {
+		struct page *p = page + i;
+
+		p->memcg_data = 0;
+	}
+
+	memcg_kmem_uncharge_page(page, PMD_PAGE_ORDER);
+}
+
 static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 {
 	unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
@@ -61,10 +94,14 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 	if (!page)
 		return -ENOMEM;
 
-	err = set_direct_map_invalid_noflush(page, nr_pages);
+	err = secretmem_memcg_charge(page, gfp, PMD_PAGE_ORDER);
 	if (err)
 		goto err_cma_release;
 
+	err = set_direct_map_invalid_noflush(page, nr_pages);
+	if (err)
+		goto err_memcg_uncharge;
+
 	addr = (unsigned long)page_address(page);
 	err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
 	if (err)
@@ -81,6 +118,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 	 * won't fail
 	 */
 	set_direct_map_default_noflush(page, nr_pages);
+err_memcg_uncharge:
+	secretmem_memcg_uncharge(page, PMD_PAGE_ORDER);
 err_cma_release:
 	cma_release(secretmem_cma, page, nr_pages);
 	return err;
@@ -310,6 +349,7 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
 	int i;
 
 	set_direct_map_default_noflush(page, nr_pages);
+	secretmem_memcg_uncharge(page, PMD_PAGE_ORDER);
 
 	for (i = 0; i < nr_pages; i++)
 		clear_highpage(page + i);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

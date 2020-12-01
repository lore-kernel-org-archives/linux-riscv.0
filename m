Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CBEC64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 07:48:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4FF2087C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 07:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+Z1t+39";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eW/8bMGy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4FF2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nx/WB1S0UMm93KItdCU9ABzOVYdCTbePmLkZEREmJYA=; b=a+Z1t+39KdngKjYNFOS8Ck7DZ
	vfaWtdMwEXog/sRro6vRXhin2Yp/ivWtP3i9TphYjnX49RzTx2kNT+xOcsRoa5sr3/A+P2wTjTPEt
	5iiH3sUFcnUm+06T3zGfQD77VW3DBpzQXdGV5KpD5DvXfPW3a+bIn0loe8uaQQ1J7BxyHIusGdR5/
	KtE/WG8Ytm3Mu1haUYg4vZTyq/v8H3OFOu0N3tMA/2hceYAvlVp9+7T38CBzmlEILQQKgIT1DoW7m
	L0ThEdFotFNHjewWbNt5z+w5sNCKOd4cb3wLRUoxTuy08RmuIqdyg3zPjHSr9zB33RAbi2TEtHNAn
	ugpJli3Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk0Ol-00015n-Fy; Tue, 01 Dec 2020 07:48:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk0Nw-0000aM-7K; Tue, 01 Dec 2020 07:47:46 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A01CA21D7A;
 Tue,  1 Dec 2020 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606808859;
 bh=jzflA3mR/TMzuhxXwTnDLrV2CbCxIP/Hh6KajityKxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eW/8bMGyWgXk4XFLSwQHPftGwbMv6DmYwb9zILLbV4THe297bPBFMXaCCykYmuUHE
 cHARK/s1amKRgcqsdapN2UA6LfxBIJ12mJipxLAsYiMJDd1YCnl/o7ScrtzM7jCcRH
 tbIlDG4eWSc+kn7bHXS6JttxeY6OjyR8FiP3b21s=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v13 07/10] secretmem: add memcg accounting
Date: Tue,  1 Dec 2020 09:45:56 +0200
Message-Id: <20201201074559.27742-8-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201074559.27742-1-rppt@kernel.org>
References: <20201201074559.27742-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_024740_539046_38843AD9 
X-CRM114-Status: GOOD (  22.95  )
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
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Account memory consumed by secretmem to memcg. The accounting is updated
when the memory is actually allocated and freed.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Roman Gushchin <guro@fb.com>
---
 mm/filemap.c   |  3 ++-
 mm/secretmem.c | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 249cf489f5df..cf7f1dc9f4b8 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -42,6 +42,7 @@
 #include <linux/psi.h>
 #include <linux/ramfs.h>
 #include <linux/page_idle.h>
+#include <linux/secretmem.h>
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
@@ -844,7 +845,7 @@ static noinline int __add_to_page_cache_locked(struct page *page,
 	page->mapping = mapping;
 	page->index = offset;
 
-	if (!huge) {
+	if (!huge && !page_is_secretmem(page)) {
 		error = mem_cgroup_charge(page, current->mm, gfp);
 		if (error)
 			goto error;
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 52a900a135a5..5e3e5102ad4c 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -18,6 +18,7 @@
 #include <linux/memblock.h>
 #include <linux/pseudo_fs.h>
 #include <linux/secretmem.h>
+#include <linux/memcontrol.h>
 #include <linux/set_memory.h>
 #include <linux/sched/signal.h>
 
@@ -44,6 +45,32 @@ struct secretmem_ctx {
 
 static struct cma *secretmem_cma;
 
+static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
+{
+	int err;
+
+	err = memcg_kmem_charge_page(page, gfp, order);
+	if (err)
+		return err;
+
+	/*
+	 * seceremem caches are unreclaimable kernel allocations, so treat
+	 * them as unreclaimable slab memory for VM statistics purposes
+	 */
+	mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
+			      PAGE_SIZE << order);
+
+	return 0;
+}
+
+static void secretmem_unaccount_pages(struct page *page, int order)
+{
+
+	mod_node_page_state(page_pgdat(page), NR_SLAB_UNRECLAIMABLE_B,
+			    -PAGE_SIZE << order);
+	memcg_kmem_uncharge_page(page, order);
+}
+
 static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 {
 	unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
@@ -56,10 +83,14 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 	if (!page)
 		return -ENOMEM;
 
-	err = set_direct_map_invalid_noflush(page, nr_pages);
+	err = secretmem_account_pages(page, gfp, PMD_PAGE_ORDER);
 	if (err)
 		goto err_cma_release;
 
+	err = set_direct_map_invalid_noflush(page, nr_pages);
+	if (err)
+		goto err_memcg_uncharge;
+
 	addr = (unsigned long)page_address(page);
 	err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
 	if (err)
@@ -76,6 +107,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 	 * won't fail
 	 */
 	set_direct_map_default_noflush(page, nr_pages);
+err_memcg_uncharge:
+	secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
 err_cma_release:
 	cma_release(secretmem_cma, page, nr_pages);
 	return err;
@@ -302,6 +335,7 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
 	int i;
 
 	set_direct_map_default_noflush(page, nr_pages);
+	secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
 
 	for (i = 0; i < nr_pages; i++)
 		clear_highpage(page + i);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

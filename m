Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0176C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7576E233F6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7576E233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CSNzhkeCsjsCuT6m2AgOlvafw2UV22PUbc83WCp5Dvs=; b=pDZBtuvwy8Mj3Lj509a6m3DtL
	ljNXnD3ExebGaaiCg9z5OjpkQEZ8p3UDKGsuM8DLczp/+6XL1x61VA4QpNJbJiNPXjzNwyuiATFIz
	gHKSTGRsgwZ1ec/EjOI+sOEfPh3ZGJtyTXoRDMXYtLsBqeYg51n35rOFsLbXIZjvQsrRXdzjIRw0t
	5tmnr96QocmsltWIZ6rFfAKGOgAiKTNAqCVIUnvGAAdNDkr+R5eDeFD+hVXc3sEl1f/NiiKIYBF2I
	8UkrKXWbHq7N9NaP+JVwH4sm/c4x7i4GzlM44K8sM0n+E3jkHz8ilK6X6mRO6a99AdDtALc38rP/r
	P3BBs5+Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2HvD-00056a-G1; Wed, 20 Jan 2021 18:09:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2HtP-0004HK-PV; Wed, 20 Jan 2021 18:07:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEC23233F6;
 Wed, 20 Jan 2021 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611166062;
 bh=N2c2dlXxzRHPCRtWcevrFXjQzxHy4SQCbf7Ja0dBpXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YEW3dxuk+YxfbTgRWUi/C4dBST4s9JJM5KN1DmBpCKDoZAcBJ6nQDYwwxHSJM6lp4
 iFvi8pHWzOaFU1IrUn5zHC4PWUifVD2XNeb8c6sPpKl9R8NC5kvtZV/85iY2yI6aYz
 kSrE8z3lgUxpXO9GP2eSsYcSBbYkmNswC/KSd7XOA26exk/UHOaK9RmpoF129IrkLN
 NqF5tB6JqFZ4WWl4A4xAgnWl9oaf+jAzb+6ehfsbacrHu8j9UBpGdtCqUXuRaZNzZQ
 l/TukCQeDGzQ+SXocUYJXoTcIIQNcyc0iGb/5wc8p5yqVwhlCNMe9yOOB3jd8CHqxa
 gz1MNKLx8LKIQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v15 08/11] secretmem: add memcg accounting
Date: Wed, 20 Jan 2021 20:06:09 +0200
Message-Id: <20210120180612.1058-9-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120180612.1058-1-rppt@kernel.org>
References: <20210120180612.1058-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_130744_979908_2CDD7AED 
X-CRM114-Status: GOOD (  22.62  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
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
Reviewed-by: Shakeel Butt <shakeelb@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christopher Lameter <cl@linux.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Hagen Paul Pfeifer <hagen@jauu.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tycho Andersen <tycho@tycho.ws>
Cc: Will Deacon <will@kernel.org>
---
 mm/filemap.c   |  3 ++-
 mm/secretmem.c | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 2d0c6721879d..bb28dd6d9e22 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -42,6 +42,7 @@
 #include <linux/psi.h>
 #include <linux/ramfs.h>
 #include <linux/page_idle.h>
+#include <linux/secretmem.h>
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
@@ -839,7 +840,7 @@ noinline int __add_to_page_cache_locked(struct page *page,
 	page->mapping = mapping;
 	page->index = offset;
 
-	if (!huge) {
+	if (!huge && !page_is_secretmem(page)) {
 		error = mem_cgroup_charge(page, current->mm, gfp);
 		if (error)
 			goto error;
diff --git a/mm/secretmem.c b/mm/secretmem.c
index fe193bdedd76..3c6c037b3381 100644
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
+	mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
+			      -PAGE_SIZE << order);
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
@@ -307,6 +340,7 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
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

Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E3EC433E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 16:31:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B88206E7
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 16:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGOQSYyP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2qowF2k3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B88206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9q1LbH/0M2v/O2nxQTKYI5kOD0Id8eyuNsBsqgT0+Yc=; b=QGOQSYyPyY1qoGWsnBskXXl1u
	QcdathsWsx2veuojFxEzgUbg5Bt83QfsZF+vCWtyoymzXfV/mRZhsEieCBZ92qH8RNfV7Co17yUyY
	cY/Y3kVEom7sWTQ/qISjwBN9Y1/uZA74E3M0UP3UAgohTkJSg/CucQikzRW1ed+qje+s96zf8UPsL
	TS2LqJtHjoSHtgPj7Kr8aINj5JBVwBvUt+WjTbsyOyK63fXx2y7wlUwoIS7wxw+L7WaSKpE88Nf32
	B28GKcfiXxqoMhijbyG4h5QB3V0ifpWN5tn7Xjd2oy9GTbE1UTw95lI43bBmTYU9cBrdk5aNFVnyO
	Dh+4rk/YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0628-0007TB-BQ; Mon, 27 Jul 2020 16:31:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k061P-00078X-Du; Mon, 27 Jul 2020 16:30:41 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9245C20719;
 Mon, 27 Jul 2020 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595867438;
 bh=EtHjzgniWiPXpM15YNvo+5Gcb8cwPdBCUgOLFSAcRWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2qowF2k3E6IzoSvyVCDxDhXiZ9mC/bdHex8EHHDxmfMbqtHJf8l1p2YMm3plWQvJO
 PbvvxhREz9YtWMAp/pOSwI4fwwdSpRuXAkQTD1cwAj3N7QDNCCpICI/kO6Bg3kY1eC
 KeJMAWyZ+Bm/2JItsoEJ60TG2Pw21K7f/I6RhTlU=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] mm: secretmem: add ability to reserve memory at boot
Date: Mon, 27 Jul 2020 19:29:34 +0300
Message-Id: <20200727162935.31714-7-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727162935.31714-1-rppt@kernel.org>
References: <20200727162935.31714-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_123039_786882_589AC7E8 
X-CRM114-Status: GOOD (  27.13  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
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
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Taking pages out from the direct map and bringing them back may create
undesired fragmentation and usage of the smaller pages in the direct
mapping of the physical memory.

This can be avoided if a significantly large area of the physical memory
would be reserved for secretmem purposes at boot time.

Add ability to reserve physical memory for secretmem at boot time using
"secretmem" kernel parameter and then use that reserved memory as a global
pool for secret memory needs.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/secretmem.c | 134 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 126 insertions(+), 8 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index da609701e10e..35616e3982a4 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -8,6 +8,7 @@
 #include <linux/pagemap.h>
 #include <linux/genalloc.h>
 #include <linux/syscalls.h>
+#include <linux/memblock.h>
 #include <linux/pseudo_fs.h>
 #include <linux/set_memory.h>
 #include <linux/sched/signal.h>
@@ -30,6 +31,39 @@ struct secretmem_ctx {
 	unsigned int mode;
 };
 
+struct secretmem_pool {
+	struct gen_pool *pool;
+	unsigned long reserved_size;
+	void *reserved;
+};
+
+static struct secretmem_pool secretmem_pool;
+
+static struct page *secretmem_alloc_huge_page(gfp_t gfp)
+{
+	struct gen_pool *pool = secretmem_pool.pool;
+	unsigned long addr = 0;
+	struct page *page = NULL;
+
+	if (pool) {
+		if (gen_pool_avail(pool) < PMD_SIZE)
+			return NULL;
+
+		addr = gen_pool_alloc(pool, PMD_SIZE);
+		if (!addr)
+			return NULL;
+
+		page = virt_to_page(addr);
+	} else {
+		page = alloc_pages(gfp, PMD_PAGE_ORDER);
+
+		if (page)
+			split_page(page, PMD_PAGE_ORDER);
+	}
+
+	return page;
+}
+
 static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 {
 	unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
@@ -38,12 +72,11 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
 	struct page *page;
 	int err;
 
-	page = alloc_pages(gfp, PMD_PAGE_ORDER);
+	page = secretmem_alloc_huge_page(gfp);
 	if (!page)
 		return -ENOMEM;
 
 	addr = (unsigned long)page_address(page);
-	split_page(page, PMD_PAGE_ORDER);
 
 	err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
 	if (err) {
@@ -269,11 +302,13 @@ SYSCALL_DEFINE1(memfd_secret, unsigned long, flags)
 	return err;
 }
 
-static void secretmem_cleanup_chunk(struct gen_pool *pool,
-				    struct gen_pool_chunk *chunk, void *data)
+static void secretmem_recycle_range(unsigned long start, unsigned long end)
+{
+	gen_pool_free(secretmem_pool.pool, start, PMD_SIZE);
+}
+
+static void secretmem_release_range(unsigned long start, unsigned long end)
 {
-	unsigned long start = chunk->start_addr;
-	unsigned long end = chunk->end_addr;
 	unsigned long nr_pages, addr;
 
 	nr_pages = (end - start + 1) / PAGE_SIZE;
@@ -283,6 +318,18 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
 		put_page(virt_to_page(addr));
 }
 
+static void secretmem_cleanup_chunk(struct gen_pool *pool,
+				    struct gen_pool_chunk *chunk, void *data)
+{
+	unsigned long start = chunk->start_addr;
+	unsigned long end = chunk->end_addr;
+
+	if (secretmem_pool.pool)
+		secretmem_recycle_range(start, end);
+	else
+		secretmem_release_range(start, end);
+}
+
 static void secretmem_cleanup_pool(struct secretmem_ctx *ctx)
 {
 	struct gen_pool *pool = ctx->pool;
@@ -322,14 +369,85 @@ static struct file_system_type secretmem_fs = {
 	.kill_sb	= kill_anon_super,
 };
 
+static int secretmem_reserved_mem_init(void)
+{
+	struct gen_pool *pool;
+	struct page *page;
+	void *addr;
+	int err;
+
+	if (!secretmem_pool.reserved)
+		return 0;
+
+	pool = gen_pool_create(PMD_SHIFT, NUMA_NO_NODE);
+	if (!pool)
+		return -ENOMEM;
+
+	err = gen_pool_add(pool, (unsigned long)secretmem_pool.reserved,
+			   secretmem_pool.reserved_size, NUMA_NO_NODE);
+	if (err)
+		goto err_destroy_pool;
+
+	for (addr = secretmem_pool.reserved;
+	     addr < secretmem_pool.reserved + secretmem_pool.reserved_size;
+	     addr += PAGE_SIZE) {
+		page = virt_to_page(addr);
+		__ClearPageReserved(page);
+		set_page_count(page, 1);
+	}
+
+	secretmem_pool.pool = pool;
+	page = virt_to_page(secretmem_pool.reserved);
+	__kernel_map_pages(page, secretmem_pool.reserved_size / PAGE_SIZE, 0);
+	return 0;
+
+err_destroy_pool:
+	gen_pool_destroy(pool);
+	return err;
+}
+
 static int secretmem_init(void)
 {
-	int ret = 0;
+	int ret;
+
+	ret = secretmem_reserved_mem_init();
+	if (ret)
+		return ret;
 
 	secretmem_mnt = kern_mount(&secretmem_fs);
-	if (IS_ERR(secretmem_mnt))
+	if (IS_ERR(secretmem_mnt)) {
+		gen_pool_destroy(secretmem_pool.pool);
 		ret = PTR_ERR(secretmem_mnt);
+	}
 
 	return ret;
 }
 fs_initcall(secretmem_init);
+
+static int __init secretmem_setup(char *str)
+{
+	phys_addr_t align = PMD_SIZE;
+	unsigned long reserved_size;
+	void *reserved;
+
+	reserved_size = memparse(str, NULL);
+	if (!reserved_size)
+		return 0;
+
+	if (reserved_size * 2 > PUD_SIZE)
+		align = PUD_SIZE;
+
+	reserved = memblock_alloc(reserved_size, align);
+	if (!reserved) {
+		pr_err("failed to reserve %lu bytes\n", secretmem_pool.reserved_size);
+		return 0;
+	}
+
+	secretmem_pool.reserved_size = reserved_size;
+	secretmem_pool.reserved = reserved;
+
+	pr_info("reserved %luM\n", reserved_size >> 20);
+
+	return 1;
+}
+__setup("secretmem=", secretmem_setup);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613FBC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 14:36:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD38207FC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 14:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vefpkh0M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tavnjC0O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD38207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OCa7rDsmk5LGpcSBqZTM4zznuO10OA3QmKzkJbjA1to=; b=Vefpkh0MXUqAntQAb2uLBfCZ+
	ww2uUfY87uI9xZGDPY2pjIREuULcFOO9GdudX/oeRvNEunnx+MoI3QFb8S5Q3PtlWiC6ZZQhrH3V6
	gpbYqlErz8WCvJDebur08f/qLiOvEBP0uj597a8uaGDaJhica58/CmMLnsrUiOhpTIGVfu5lmjq5R
	gMGvPg8WE+bxAFz+XQq+BJI0jt0Om2OkLcn9GgTlpQJ6GUqD1BfSkw6lfhS1jMEr2qAbcGIfmhtyB
	zStRRyalqffoDmogMBwbw41/PftvJmorHtMA+h/tGEfRgdHihk5mHm5kHK18jh2ts9RIKShO6e8ZM
	gBmbw4RrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBwn-0005ML-Eo; Sat, 27 Jun 2020 14:36:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBw6-00054a-7N; Sat, 27 Jun 2020 14:36:13 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A0EC207FC;
 Sat, 27 Jun 2020 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268565;
 bh=c/eMZI3jQgAi5SoZSPf0xO2BFRL8cRrF8f5daihy1NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tavnjC0OxMDJoIlyDxFikqduze2IUaa0AgGq0rxYqYJlFONRgjoXyQz2IHmDHLbJ9
 BzFf/ighE7YqPkBb3l3Iq1iklT/uak8w0WeCI9qhOuodXq20/x69FsxHo0DOq6l+eS
 UkDvWiqOG/pqcuds69Lm/5lx91K+fpPqfOXqoW7s=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] mm: move lib/ioremap.c to mm/
Date: Sat, 27 Jun 2020 17:34:52 +0300
Message-Id: <20200627143453.31835-8-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The functionality in lib/ioremap.c deals with pagetables, vmalloc and
caches, so it naturally belongs to mm/
Moving it there will also allow declaring p?d_alloc_track functions in an
header file inside mm/ rather than having those declarations in
include/linux/mm.h

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 lib/Makefile          | 1 -
 mm/Makefile           | 2 +-
 {lib => mm}/ioremap.c | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename {lib => mm}/ioremap.c (100%)

diff --git a/lib/Makefile b/lib/Makefile
index b1c42c10073b..5f9384adde9c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -37,7 +37,6 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
 	 nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o
 
 lib-$(CONFIG_PRINTK) += dump_stack.o
-lib-$(CONFIG_MMU) += ioremap.o
 lib-$(CONFIG_SMP) += cpumask.o
 
 lib-y	+= kobject.o klist.o
diff --git a/mm/Makefile b/mm/Makefile
index 6e9d46b2efc9..d5649f1c12c0 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -38,7 +38,7 @@ mmu-y			:= nommu.o
 mmu-$(CONFIG_MMU)	:= highmem.o memory.o mincore.o \
 			   mlock.o mmap.o mmu_gather.o mprotect.o mremap.o \
 			   msync.o page_vma_mapped.o pagewalk.o \
-			   pgtable-generic.o rmap.o vmalloc.o
+			   pgtable-generic.o rmap.o vmalloc.o ioremap.o
 
 
 ifdef CONFIG_CROSS_MEMORY_ATTACH
diff --git a/lib/ioremap.c b/mm/ioremap.c
similarity index 100%
rename from lib/ioremap.c
rename to mm/ioremap.c
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

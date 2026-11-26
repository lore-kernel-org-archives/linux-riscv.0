Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB1606A687
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GFi84FxH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQ824Twb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lDw0zuzha+KktPJej3TCuUPJQ4FpAu6R6W/3VlVSdSc=; b=GFi84FxH1Jo7+bFoFNz/2FY5lU
	AVsvPbRRrMKBOVqOoaobUt6Lh4AyUCNKpsHcUndpKxlLqereTu7snITIgKOe8cJ4KhZUGBBU7s9Zb
	X+jtaVEXROdfpcvBG7KbeAzRA9W0+DkRmJAbeuTEPIh5MYEDuSXbBN/UXqU2aEvZ0I9b9Uedvsag5
	e67VTmW7gfnCNOPJiIXGAXVv4k5kdhCmJBM/KauVKIXbMapyzDobd+Jkd9JtqOSbvn3ZcYW7VfKKd
	ppRgxgSGYlPaIP8ZW0DvTTqb7boZ/eVKN7vwa08jm1Eri/9fKXtGuOtBdKmN2U/AOKy5vhcAYRvj6
	cqcZt0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXYz-0000000Cy8a-41n3;
	Thu, 26 Nov 2026 11:22:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXXq-0000000CwpZ-3a4r;
	Thu, 26 Nov 2026 11:21:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71179465A5;
	Thu, 26 Nov 2026 11:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD22E1F00A01;
	Thu, 26 Nov 2026 11:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692102;
	bh=AWz1FsKs9LGo5NyRovT968VOcnA5bINSvJfjoSeKHiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AQ824Twb4ALIqbjov3o+wIN2U+2/6b51/CWeKM+zoQx5APB58zI/yLVE7AgN02BLY
	 90rmSuGQUtENr/nE4mNk+jvdK++v4rBBpkaAD/3lGFydSk94agQAQvnGNBIrUt7pqJ
	 qeG0tLyEXHORMngIoNNGSeIOYL0uTbbz0Wd9xJhVugOxmWuCAufAq2YqzjGtP1LCA/
	 o3L4T1istYHsA0MbvoYUVeiWmyGjXxpLn3lmCyFfZvQheV46g+ImAlMUwMcVpcOlZ6
	 dYQ8sYKoKt8MvfmQsAdZfRioSw6scLwAFDjaPy6WIhwYm+gm398pxo1SOKIvCx2SKz
	 lLqrMgtJFIy6Q==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:58 +0200
Subject: [PATCH RFC v2 45/54] s390/boot: map the identity map with 4K pages
 for debug_pagealloc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-45-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

debug_pagealloc maps and unmaps single pages of the identity map, so it
needs the identity map to use 4K pages.

The decompressor maps it with large pages regardless, and vmem_map_init()
then splits it with __set_memory_4k().

The s390 implementation of change_page_attr() skips the PTE level for that
request, so the split costs little more than filling the new page tables.

The generic CPA core, which s390 is going to use, has no such shortcut:
after the split it would visit each page of the identity map, taking
cpa_lock and walking the page table for every one of them.

Parse debug_pagealloc in the decompressor and map the identity map with 4K
pages when it is enabled, like x86 and arm64 do for their direct and linear
maps. Drop the split from vmem_map_init().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/boot/boot.h     | 1 +
 arch/s390/boot/ipl_parm.c | 9 +++++++++
 arch/s390/boot/vmem.c     | 3 ++-
 arch/s390/mm/vmem.c       | 2 --
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/s390/boot/boot.h b/arch/s390/boot/boot.h
index 61a205b489fb..07ca806ff8ff 100644
--- a/arch/s390/boot/boot.h
+++ b/arch/s390/boot/boot.h
@@ -110,6 +110,7 @@ extern const char kernel_version[];
 extern unsigned long memory_limit;
 extern unsigned long vmalloc_size;
 extern int vmalloc_size_set;
+extern bool debug_pagealloc;
 extern char __boot_data_start[], __boot_data_end[];
 extern char __boot_data_preserved_start[], __boot_data_preserved_end[];
 extern char __vmlinux_relocs_64_start[], __vmlinux_relocs_64_end[];
diff --git a/arch/s390/boot/ipl_parm.c b/arch/s390/boot/ipl_parm.c
index ac4cf1ced71d..cf6c6679c5a5 100644
--- a/arch/s390/boot/ipl_parm.c
+++ b/arch/s390/boot/ipl_parm.c
@@ -34,6 +34,7 @@ int __bootdata_preserved(cmma_flag) = 1;
 unsigned long vmalloc_size = VMALLOC_DEFAULT_SIZE;
 unsigned long memory_limit;
 int vmalloc_size_set;
+bool debug_pagealloc = IS_ENABLED(CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT);
 
 static inline int __diag308(unsigned long subcode, void *addr)
 {
@@ -332,6 +333,14 @@ void parse_boot_command_line(void)
 			stack_protector_debug = 1;
 #endif
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+		if (parameq(param, "debug_pagealloc")) {
+			rc = kstrtobool(val, &enabled);
+			if (!rc)
+				debug_pagealloc = enabled;
+		}
+#endif
+
 #if IS_ENABLED(CONFIG_KVM)
 		if (parameq(param, "prot_virt")) {
 			rc = kstrtobool(val, &enabled);
diff --git a/arch/s390/boot/vmem.c b/arch/s390/boot/vmem.c
index ff6d58a476ba..3a6cd62c31ae 100644
--- a/arch/s390/boot/vmem.c
+++ b/arch/s390/boot/vmem.c
@@ -286,8 +286,9 @@ static unsigned long resolve_pa_may_alloc(unsigned long addr, unsigned long size
 static bool large_page_mapping_allowed(enum populate_mode mode)
 {
 	switch (mode) {
-	case POPULATE_DIRECT:
 	case POPULATE_IDENTITY:
+		return !debug_pagealloc;
+	case POPULATE_DIRECT:
 	case POPULATE_KERNEL:
 #ifdef CONFIG_KASAN
 	case POPULATE_KASAN_MAP_SHADOW:
diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
index d2879ce860a1..191326ee7ec8 100644
--- a/arch/s390/mm/vmem.c
+++ b/arch/s390/mm/vmem.c
@@ -681,8 +681,6 @@ void __init vmem_map_init(void)
 	 */
 	if (!cpu_has_bear())
 		set_memory_x(0, 1);
-	if (debug_pagealloc_enabled())
-		__set_memory_4k(__va(0), absolute_pointer(__va(0)) + ident_map_size);
 	pr_info("Write protected kernel read-only data: %luk\n",
 		(unsigned long)(__end_rodata - _stext) >> 10);
 }

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

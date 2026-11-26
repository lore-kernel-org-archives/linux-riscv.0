Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6020606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G6dtxTFP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arH33Iw+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CDG8YZYG/MIhM18P9pH5WVCLdxcIDHqKbb4lu9sqOiw=; b=G6dtxTFP7eOVzlDuP967h4UfjM
	gKycIC5Hq8Jukty2TyJeH6LvZsrvGYSys4bm0fvw2IeeKdkndC/IbSSbL42OpgqqtXsBG9XMirNcD
	A5fDyS62WaVZTraLpv7yrph/4sz/0MFNb9b/gUQpuGV2M51REga9ukdBnNbPLN3q9fAGtzlPhnYit
	No9M4pUQJnJcFDf/7mIX3oMDbTBQyY9YLxcgAS7qm768q6+GXC8B81xowhE9dT8JGlo916fL1alhx
	tO0ePYtSvAuzyzqAWe9YLT7ZhOhQDimsXFq05HNmTIe0kfJ5J2O3fwFTtgbDUOA38pwJidY/GQYmz
	QT4v9G0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXWy-0000000CvxC-1Ce8;
	Thu, 26 Nov 2026 11:20:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXW0-0000000Cuqa-1gBl;
	Thu, 26 Nov 2026 11:19:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE5DB43BED;
	Thu, 26 Nov 2026 11:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3021F008B2;
	Thu, 26 Nov 2026 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691987;
	bh=3baBQY1vcim/LIuBDd2iS5vp7cN9wnC3Urh2E32RyUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=arH33Iw+PdWr+zlekYtf5nt+Op90L1TFCAIp15UEy+JOD/BMr6gM82izCzHJ1j53x
	 Rf7Bd3XB7buR8nKFBjOykUN3NzH886rFBdFTBPFTBNhX8nMAbZ26UqYbx9bGLW+g3i
	 /sQ2LSWtOosQOua5U2835M+MrgzYeEUFMalhl41+LsupVwAVt0II5/HrUmhS4p0NSh
	 NQAllOapJ7m1dfpO7PW+vkvGZTmiNe52cT0vTejwfyJiRSIEKrJTLRp8aAuN4g45//
	 GvISaE7BPJ/Lhx5ZN5KxgnwBOhwRJdneHwiwJQvKiPXC9/6nLeJSOz+UOUnwYZx5zs
	 1+Ng3jE8359qw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:46 +0200
Subject: [PATCH RFC v2 33/54] LoongArch: use pfn_is_nosave() to exclude
 firmware ranges from hibernation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-33-723f1e33c3d8@kernel.org>
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

Commit 619b52777a49 ("LoongArch: Fix kernel_page_present() for
KPRANGE/XKPRANGE") made kernel_page_present() filter out firmware pages,
such as EFI runtime services code and data, to prevent hibernation from
saving and restoring them.

kernel_page_present() reports whether a page is mapped in the kernel page
tables, while excluding physical memory from the hibernation image is what
pfn_is_nosave() is for.

Move the check for firmware pages to pfn_is_nosave().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/loongarch/mm/pageattr.c     | 3 +--
 arch/loongarch/power/hibernate.c | 6 +++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index a7dcff40f759..a728db40f9e0 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2024 Loongson Technology Corporation Limited
  */
 
-#include <linux/memblock.h>
 #include <linux/pagewalk.h>
 #include <linux/pgtable.h>
 #include <asm/set_memory.h>
@@ -168,7 +167,7 @@ bool kernel_page_present(struct page *page)
 	unsigned long addr = (unsigned long)page_address(page);
 
 	if (addr < vm_map_base)
-		return memblock_is_memory(__pa(addr));
+		return true;
 
 	pgd = pgd_offset_k(addr);
 	if (pgd_none(pgdp_get(pgd)))
diff --git a/arch/loongarch/power/hibernate.c b/arch/loongarch/power/hibernate.c
index 3de38ffb11c3..65dbf1aed4a7 100644
--- a/arch/loongarch/power/hibernate.c
+++ b/arch/loongarch/power/hibernate.c
@@ -4,6 +4,7 @@
 #include <asm/sections.h>
 #include <asm/time.h>
 #include <asm/tlbflush.h>
+#include <linux/memblock.h>
 #include <linux/suspend.h>
 
 static u32 saved_crmd;
@@ -44,7 +45,10 @@ int pfn_is_nosave(unsigned long pfn)
 	unsigned long nosave_begin_pfn = PFN_DOWN(__pa(&__nosave_begin));
 	unsigned long nosave_end_pfn = PFN_UP(__pa(&__nosave_end));
 
-	return	(pfn >= nosave_begin_pfn) && (pfn < nosave_end_pfn);
+	if (pfn >= nosave_begin_pfn && pfn < nosave_end_pfn)
+		return 1;
+
+	return !memblock_is_memory(PFN_PHYS(pfn));
 }
 
 extern int swsusp_asm_suspend(void);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

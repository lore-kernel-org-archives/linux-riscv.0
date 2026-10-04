Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC63FCA5FED
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 03:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HHsw9CM1i/MZ83qVylB5TKUdVUDyKsXpkbnNEPXxse0=; b=gLkIVP7MX12TSp
	oASa27LUow/Zollww556ytu1tt7I14VpLFn2/AsTw+zjXh6srAqmApc8TbcIl/VpRVUBzWaLlMO6s
	DELYSDB0DaYLO23kNWvSp6yjFbihY+7mYsP9zpLOnst6yX0bfj8qpw+PxCzz+qYIbe5a4jMAg730o
	IEC85CfCYgL/ogrkevd9h20WWG96IJ/yZbMFh/NngHKwRuKrU1nXL97YmBxJzJonFXdLI9gTnFTRW
	bUv3eptQ6yln9gTAxwkcU6Xd+uOscU8HK3ce6yEKI7VwYe23CYRezJAUt4gBmlKLeq0aDq2ASy4d+
	4yr9NvXai52RCWoa3Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDCVh-0000000EIG0-3zai;
	Sun, 04 Oct 2026 03:03:33 +0000
Received: from out-164.mta0.migadu.com ([2001:41d0:1004:224b::a4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDCVd-0000000EIFK-1juB
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 03:03:32 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Jwr5K51ukqdtnHr4Uin+bWG/FzAyJskE0K5YWYJSjM8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791083004; v=1; x=1791687804;
 b=wdmSdBh5jKz9+Rc2sr38SD3flaJQM6XLAntVnBoQU7AvDZgGkANKNVRnq7kAwzK6kCNSnTLG
 6zG63tAVaNulyvm21VKt9Dl/olPIbJR6fBKhdefrCCCVLhkcaCWjwbquP7XQGnIeGBMsStUieIU
 Np0glmuYZoU6/I+C51rF2ApQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f5c2ae1123ce7d6d;
	Sun, 04 Oct 2026 03:03:24 +0000
X-Mizu-Trace-ID: f5c2ae1123ce7d6d
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn,
	rppt@kernel.org,
	kas@kernel.org,
	david@kernel.org,
	andrew+kernel@donnellan.id.au,
	rmclure@linux.ibm.com,
	debug@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	usama.arif@linux.dev,
	wangruikang@iscas.ac.cn,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexghiti@rivosinc.com,
	viro@zeniv.linux.org.uk,
	ajones@ventanamicro.com,
	arnd@arndb.de,
	axelrasmussen@google.com,
	brauner@kernel.org,
	conor.dooley@microchip.com,
	conor@kernel.org,
	jack@suse.cz,
	liam@infradead.org,
	ljs@kernel.org,
	mhocko@suse.com,
	paul.walmsley@sifive.com,
	peterx@redhat.com,
	robh@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	yuanchu@google.com,
	stable@vger.kernel.org,
	pasha.tatashin@soleen.com,
	linux-mm@kvack.org,
	me@ziyao.cc,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] riscv/mm: fix soft-dirty migration PMDs being treated as present
Date: Sun,  4 Oct 2026 11:03:12 +0800
Message-ID: <20261004030312.90163-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_200330_524622_E86AEA28 
X-CRM114-Status: GOOD (  11.00  )
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

RISC-V uses _PAGE_EXEC for swap soft-dirty tracking when
CONFIG_MEM_SOFT_DIRTY is enabled and Svrsw60t59b is available. That's
a problem for PMD migration entries, since pmd_present() also checks
_PAGE_LEAF (R/W/X) to recognize THPs with _PAGE_PRESENT temporarily
cleared during splitting.

When a soft-dirty THP is migrated, set_pmd_migration_entry() preserves
soft-dirty with pmd_swp_mksoft_dirty(), setting the X bit in the
migration PMD. Even with _PAGE_PRESENT clear, we end up treating a
migration PMD as a present THP! The fault handler skips
pmd_migration_entry_wait(), and a write fault can end up in
do_huge_pmd_wp_page(), where pmd_page() decodes the migration entry
as a mapped PFN.

Move the swap soft-dirty bit to bit 12 and start the swap offset at
bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled. This keeps R/W/X clear
in migration PMDs and lets us keep the existing pmd_present() check
for invalidated THPs. Leave the offset at bit 12 when soft-dirty
tracking is disabled.

Fixes: 2a3ebad4db63 ("riscv: mm: add soft-dirty page tracking support")
Cc: stable@vger.kernel.org
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
I found this while reviewing Usama's PMD-level swap entries series [1]
and comparing the swap flag bits with the PMD presence checks across
architectures.

[1] https://lore.kernel.org/all/20261002095503.3585565-1-usama.arif@linux.dev/

 arch/riscv/include/asm/pgtable-bits.h |  6 +++---
 arch/riscv/include/asm/pgtable.h      | 10 ++++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index d5a86b4df3ce6..d84b459e010c1 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -27,12 +27,12 @@
 	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
 	 (1UL << 59) : 0)
 /*
- * Bit 3 is always zero for swap entry computation, so we
- * can borrow it for swap page soft-dirty tracking.
+ * Bit 12 is reserved for swap soft-dirty tracking. The swap offset
+ * starts at bit 13 when CONFIG_MEM_SOFT_DIRTY is enabled.
  */
 #define _PAGE_SWP_SOFT_DIRTY						\
 	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
-	 _PAGE_EXEC : 0)
+	 (1UL << 12) : 0)
 #else
 #define _PAGE_SOFT_DIRTY	0
 #define _PAGE_SWP_SOFT_DIRTY	0
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b644db16bda94..acaf6d3b54d04 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1178,18 +1178,20 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
  *
  * Format of swap PTE:
  *	bit            0:	_PAGE_PRESENT (zero)
- *	bit       1 to 2:	(zero)
- *	bit            3:	_PAGE_SWP_SOFT_DIRTY
+ *	bit       1 to 3:	_PAGE_LEAF (zero)
  *	bit            4:	_PAGE_SWP_UFFD
  *	bit            5:	_PAGE_PROT_NONE (zero)
  *	bit            6:	exclusive marker
  *	bits      7 to 11:	swap type
- *	bits 12 to XLEN-1:	swap offset
+ *	bit           12:	_PAGE_SWP_SOFT_DIRTY (CONFIG_MEM_SOFT_DIRTY)
+ *	bits 12/13 to XLEN-1:	swap offset (without/with CONFIG_MEM_SOFT_DIRTY)
  */
 #define __SWP_TYPE_SHIFT	7
 #define __SWP_TYPE_BITS		5
 #define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
-#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
+#define __SWP_OFFSET_SHIFT \
+	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT + \
+	 IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 
 #define MAX_SWAPFILES_CHECK()	\
 	BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > __SWP_TYPE_BITS)
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

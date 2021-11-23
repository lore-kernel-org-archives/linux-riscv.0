Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AE8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3ZED1hzXLwI7GItUJD/4lmeAcnqP/OufzfZBwwjSvo=; b=B8iSC9u25zS44S
	nr5JZcavpoz8hwvqzCcHDeyFV9VjrYfHifU2qwhH9LXGyKvUFoOQ2wVQvsrtA0If+4k4lzZCa5APu
	np6lh8WtQ7D382gx2mCpDUSHGxAVCWSnm/HYfq9y48zAHEbW0nlpKtSV5LoWyU/9IukVcTtiUOZn6
	DghK9Yh3XKEl4qX2X4Hx33WY+tcxXC+kVOPaOhXdFThE/MVN7Qt5qUrq31IlXK1QMdFXonQuTpqOT
	Wids2CnX2s2H+6QhcC6IUepIfSUk8emnwMnLt/hqwvVodEffd6w6MeKsXp4Wu0vFMPF+gXgx1hh1S
	JZrmdSBmlHMplQ330Meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpVsl-002O6c-U9; Tue, 23 Nov 2021 13:30:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVsD-002Nud-42
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 13:30:15 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hz4gs2MYvz1DJfd;
 Tue, 23 Nov 2021 21:27:37 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 23 Nov 2021 21:30:08 +0800
Received: from huawei.com (10.175.113.32) by kwepemm600003.china.huawei.com
 (7.193.23.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 23 Nov
 2021 21:30:07 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <sunnanyong@huawei.com>, <palmerdabbelt@google.com>,
 <wangkefeng.wang@huawei.com>, <anup@brainfault.org>, <alex@ghiti.fr>,
 <jszhang@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 1/2] riscv/mm: Adjust PAGE_PROT_NONE to comply with THP
 semantics
Date: Tue, 23 Nov 2021 22:06:37 +0800
Message-ID: <20211123140638.3852400-2-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123140638.3852400-1-sunnanyong@huawei.com>
References: <20211123140638.3852400-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_053013_638728_714287E4 
X-CRM114-Status: GOOD (  11.35  )
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

This is a preparation for enabling THP migration.
As the commit b65399f6111b("arm64/mm: Change THP helpers
to comply with generic MM semantics") mentioned, pmd_present()
and pmd_trans_huge() are expected to behave in the following
manner:
-------------------------------------------------------------------------
|	PMD states	|	pmd_present	|	pmd_trans_huge	|
-------------------------------------------------------------------------
|	Mapped		|	Yes		|	Yes		|
-------------------------------------------------------------------------
|	Splitting	|	Yes		|	Yes		|
-------------------------------------------------------------------------
|	Migration/Swap	|	No		|	No		|
-------------------------------------------------------------------------

At present the PROT_NONE bit reuses the READ bit could not comply with
above semantics with two problems:
1. When splitting a PMD THP, PMD is first invalidated with
pmdp_invalidate()->pmd_mkinvalid(), which clears the PRESENT bit
and PROT_NONE bit/READ bit, if the PMD is read-only, then the PAGE_LEAF
property is also cleared, which results in pmd_present() return false.
2. When migrating, the swap entry only clear the PRESENT bit
and PROT_NONE bit/READ bit, the W/X bit may be set, so _PAGE_LEAF may be
true which results in pmd_present() return true.

Solution:
Adjust PROT_NONE bit from READ to GLOBAL bit can satisfy the above rules:
1. GLOBAL bit has no other meanings, not like the R/W/X bit, which is
also relative with _PAGE_LEAF property.
2. GLOBAL bit is at bit 5, making swap entry start from bit 6, bit 0-5
are zero, which means the PRESENT, PROT_NONE, and PAGE_LEAF are
all false, then the pmd_present() and pmd_trans_huge() return false when
in migration/swap.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/include/asm/pgtable-bits.h |  2 +-
 arch/riscv/include/asm/pgtable.h      | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 2ee413912926..a6b0c89824c2 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -31,7 +31,7 @@
  * _PAGE_PROT_NONE is set on not-present pages (and ignored by the hardware) to
  * distinguish them from swapped out pages
  */
-#define _PAGE_PROT_NONE _PAGE_READ
+#define _PAGE_PROT_NONE _PAGE_GLOBAL
 
 #define _PAGE_PFN_SHIFT 10
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index bf204e7c1f74..8bb2010f9a25 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -119,7 +119,7 @@
 /* Page protection bits */
 #define _PAGE_BASE	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER)
 
-#define PAGE_NONE		__pgprot(_PAGE_PROT_NONE)
+#define PAGE_NONE		__pgprot(_PAGE_PROT_NONE | _PAGE_READ)
 #define PAGE_READ		__pgprot(_PAGE_BASE | _PAGE_READ)
 #define PAGE_WRITE		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_WRITE)
 #define PAGE_EXEC		__pgprot(_PAGE_BASE | _PAGE_EXEC)
@@ -628,11 +628,12 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
  *
  * Format of swap PTE:
  *	bit            0:	_PAGE_PRESENT (zero)
- *	bit            1:	_PAGE_PROT_NONE (zero)
- *	bits      2 to 6:	swap type
- *	bits 7 to XLEN-1:	swap offset
+ *	bit       1 to 3:       _PAGE_LEAF (zero)
+ *	bit            5:	_PAGE_PROT_NONE (zero)
+ *	bits      6 to 10:	swap type
+ *	bits 10 to XLEN-1:	swap offset
  */
-#define __SWP_TYPE_SHIFT	2
+#define __SWP_TYPE_SHIFT	6
 #define __SWP_TYPE_BITS		5
 #define __SWP_TYPE_MASK		((1UL << __SWP_TYPE_BITS) - 1)
 #define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DB8C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:34:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A2060238
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A2060238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rkXOplaLH3vCZiBfXz9UZCMlrn9kBNdFdg5BaI4YjYw=; b=oTezG724Yc8vQyLuacnU28VUL
	SZrAecYiLwwO3WMyiKWUjn8OMVz6OitXaAGGVcFQ2cVoRiQ9gUJUzsIgRXAKISsbWf8iA8Ay5MqAQ
	6rPJqnNS9ii/3H2F2A0ATNVkBBxoj8FRQzIltnLPj/sBKbO5aWGiDw+mCbh/edhcRQaphJghlWO8E
	L9QVJVLBFKCBRITwja8p0QfMSalc7fBOFKe8GHe+TI32hlK6jy0SEk7GiXCfWO5A1ITI9nLga3Sg/
	i5JsLlbiPTOkmQW89Uet3Z3KcUlvmCVhmx2Em2M0hjtwnbirFlxqfwImF+4mpRumlcwapG3HV+8Ms
	1lFYiTJOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9CJ8-0007UY-26; Mon, 08 Feb 2021 19:34:50 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9CIz-0007Tn-Py
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 19:34:47 +0000
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 863E5200008;
 Mon,  8 Feb 2021 19:34:35 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] riscv: Improve kasan population by using hugepages when
 possible
Date: Mon,  8 Feb 2021 14:30:17 -0500
Message-Id: <20210208193017.30904-5-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208193017.30904-1-alex@ghiti.fr>
References: <20210208193017.30904-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_143441_939781_025ADAE2 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The kasan functions that populates the shadow regions used to allocate them
page by page and did not take advantage of hugepages, so fix this by
trying to allocate hugepages of 1GB and fallback to 2MB hugepages or 4K
pages in case it fails.

This reduces the page table memory consumption and improves TLB usage,
as shown below:

Before this patch:

---[ Kasan shadow start ]---
0xffffffc000000000-0xffffffc400000000    0x00000000818ef000        16G PTE     . A . . . . R V
0xffffffc400000000-0xffffffc447fc0000    0x00000002b7f4f000   1179392K PTE     D A . . . W R V
0xffffffc480000000-0xffffffc800000000    0x00000000818ef000        14G PTE     . A . . . . R V
---[ Kasan shadow end ]---

After this patch:

---[ Kasan shadow start ]---
0xffffffc000000000-0xffffffc400000000    0x00000000818ef000        16G PTE     . A . . . . R V
0xffffffc400000000-0xffffffc440000000    0x0000000240000000         1G PGD     D A . . . W R V
0xffffffc440000000-0xffffffc447e00000    0x00000002b7e00000       126M PMD     D A . . . W R V
0xffffffc447e00000-0xffffffc447fc0000    0x00000002b818f000      1792K PTE     D A . . . W R V
0xffffffc480000000-0xffffffc800000000    0x00000000818ef000        14G PTE     . A . . . . R V
---[ Kasan shadow end ]---

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/kasan_init.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index b7d4d9abd144..2b196f512f07 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -83,6 +83,15 @@ static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long en
 
 	do {
 		next = pmd_addr_end(vaddr, end);
+
+		if (pmd_none(*pmdp) && IS_ALIGNED(vaddr, PMD_SIZE) && (next - vaddr) >= PMD_SIZE) {
+			phys_addr = memblock_phys_alloc(PMD_SIZE, PMD_SIZE);
+			if (phys_addr) {
+				set_pmd(pmdp, pfn_pmd(PFN_DOWN(phys_addr), PAGE_KERNEL));
+				continue;
+			}
+		}
+
 		kasan_populate_pte(pmdp, vaddr, next);
 	} while (pmdp++, vaddr = next, vaddr != end);
 
@@ -103,6 +112,21 @@ static void kasan_populate_pgd(unsigned long vaddr, unsigned long end)
 
 	do {
 		next = pgd_addr_end(vaddr, end);
+
+		/*
+		 * pgdp can't be none since kasan_early_init initialized all KASAN
+		 * shadow region with kasan_early_shadow_pmd: if this is stillthe case,
+		 * that means we can try to allocate a hugepage as a replacement.
+		 */
+		if (pgd_page_vaddr(*pgdp) == (unsigned long)lm_alias(kasan_early_shadow_pmd) &&
+		    IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vaddr) >= PGDIR_SIZE) {
+			phys_addr = memblock_phys_alloc(PGDIR_SIZE, PGDIR_SIZE);
+			if (phys_addr) {
+				set_pgd(pgdp, pfn_pgd(PFN_DOWN(phys_addr), PAGE_KERNEL));
+				continue;
+			}
+		}
+
 		kasan_populate_pmd(pgdp, vaddr, next);
 	} while (pgdp++, vaddr = next, vaddr != end);
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

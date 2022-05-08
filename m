Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E274C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  8 May 2022 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWHOB/nzS4nqMsvw7H05boi7TvtgsdAWigYJJyTEwVI=; b=4C+CjrvxritVet
	MjyTU6pzfmnxYpVJ4DyUhD8OnCX/u+GrpTRbjX0XDQtCUskbwQ5al6QrQwlRemFb/zlggShhno4zu
	kSCaSyQmLM/CcM96e4d+kPhF376/FWClqQp7HrnidHUusk5bo9e9ilDSeV1iVbsgoyrKoF0GbblXq
	4XYk2+i2E8GTsxVbCCSB38eVNJ+FycGb9jd0DEI/c7ps7yISc06SzxSzah3TN56aceS8iHjnca+CA
	awMo8ThIL/A0onSHTBMEi6KPPgVqd95gaCDV4G56mPvf4I658eyc6UPsdqEYOtR5yQWP4y7I8rKew
	5mlY+FtLNVpPK0TLu4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnjaF-00Ab0D-C9; Sun, 08 May 2022 16:16:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnjaC-00AazC-JH
 for linux-riscv@lists.infradead.org; Sun, 08 May 2022 16:16:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 507696121C;
 Sun,  8 May 2022 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB75C385A4;
 Sun,  8 May 2022 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652026589;
 bh=cai4u5JKDr1cLjhdt9yaycCa4Y3iBnxfkpZjmnNWcVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mdPAo0t5mrvr4GmAHEi7fUpzOr52OdPOdTfvMG2GDQeOpWO4nWnz+BT8ei8S8bldv
 KGF56HqI6nCm50Jia/awUHAqUlXLc5KirY9OTAv+cDqV+3VHJOJNG66cS9GlDqP5wP
 l4+sOr1tt2o3b7/L6ifGSp7h0MxMkLSy9wfI8RXXzx5TJtIaSd8MK8o9VM+DXOt7xy
 Po0SUd/H6NhU4PshiM8nAIBCnU85lUhGkdQXtmz5iY5gMnEkGC3VQTcQBPLoRKq/D9
 bESc0bsVD7erCPt7hJGlgaoO0YbJUdtISbpRRey/rCYsW+7jIV+hrrQTGz/IPqvvYI
 biSZhsinVL0Rg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 1/4] riscv: mm: init: make pt_ops_set_[early|late|fixmap]
 static
Date: Mon,  9 May 2022 00:07:46 +0800
Message-Id: <20220508160749.984-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220508160749.984-1-jszhang@kernel.org>
References: <20220508160749.984-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_091632_708144_A23BC0F9 
X-CRM114-Status: GOOD (  12.85  )
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

These three functions are only used in init.c, so make them static.
Fix W=1 warnings like below:

arch/riscv/mm/init.c:721:13: warning: no previous prototype for function
'pt_ops_set_early' [-Wmissing-prototypes]
   void __init pt_ops_set_early(void)
               ^

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 05ed641a1134..5f3f26dd9f21 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -849,7 +849,7 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
  * MMU is not enabled, the page tables are allocated directly using
  * early_pmd/pud/p4d and the address returned is the physical one.
  */
-void __init pt_ops_set_early(void)
+static void __init pt_ops_set_early(void)
 {
 	pt_ops.alloc_pte = alloc_pte_early;
 	pt_ops.get_pte_virt = get_pte_virt_early;
@@ -871,7 +871,7 @@ void __init pt_ops_set_early(void)
  * Note that this is called with MMU disabled, hence kernel_mapping_pa_to_va,
  * but it will be used as described above.
  */
-void __init pt_ops_set_fixmap(void)
+static void __init pt_ops_set_fixmap(void)
 {
 	pt_ops.alloc_pte = kernel_mapping_pa_to_va((uintptr_t)alloc_pte_fixmap);
 	pt_ops.get_pte_virt = kernel_mapping_pa_to_va((uintptr_t)get_pte_virt_fixmap);
@@ -889,7 +889,7 @@ void __init pt_ops_set_fixmap(void)
  * MMU is enabled and page table setup is complete, so from now, we can use
  * generic page allocation functions to setup page table.
  */
-void __init pt_ops_set_late(void)
+static void __init pt_ops_set_late(void)
 {
 	pt_ops.alloc_pte = alloc_pte_late;
 	pt_ops.get_pte_virt = get_pte_virt_late;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

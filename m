Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4186C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o68buBSmm8W3YGEaB0sKbh7zrloLD6CdhgwL+DDabH8=; b=A39N6jOk1CRIrI
	uLiZvppKTS/iUrmgxo5Mqbds2j8SwLOSoHcA+oLjbwM+Z0HGmVlEDzdh77UUXWqVaPsC/imK6DIgH
	RUv5uXlAf7bA7DaG4KopDOi9xX24wTD6jU4Wpf1Q/+mGrYDmoiABdm711/b5q4Sbyj3gGFV1mYpTA
	WG+BpLLuE+1t1wC4WZB6Iq2+jKozVoeEeuKMDRAzO4Pvejezbb5YlcqAbnTFMdsUGu4AOrnPyrow0
	hJzdXRNXmbENL1ZBT071g3nMwfnWnrXDQNHgvZQjfrJXYtLYtY/y00eV7dkMG5vVd2U60ajw0OVLA
	90UbeDF8D1XfvJKut6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqbtt-008Pn3-G1; Mon, 16 May 2022 14:40:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqbtq-008PmV-V3
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 14:40:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA96AB81243;
 Mon, 16 May 2022 14:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC54C385AA;
 Mon, 16 May 2022 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652712039;
 bh=/LjZDM0tlNGi7ZrpCRvjcDx6kOF+zSUPdV+ox6kBvhU=;
 h=From:To:Cc:Subject:Date:From;
 b=NJhtJktX0yTMk0aDnZn0NnEzXf5PBQJ8E2hc3f+ckAZ4A00WEXhePXoXwowYigGfc
 XUoiWOmt6bZi0s9o2PrBxpl4JR51Jyg6komF7j1F+G74ud4ZYbsfyVqN3H3mZ6KPnN
 3yZ5d9g/FoHguUTCvqH0MtbTiRN1z/nRi8B13sXbIntKjfaAD6xGez/Kvh07MPMXA1
 T0rB8jf04krNXuZGCtUtgPdLGMprVpao3c9nEKboEZtytrqvf0m0S58W/Tk7Omjl/1
 C3D/oL4trXu7FRzyqmuIFFdWqk6cSXv1QcNk4g8/RwLD0c3SnElMksJMyG0jTtKZeu
 8RTutvHVklLPQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
Subject: [PATCH v2] riscv: mm: init: make pt_ops_set_[early|late|fixmap] static
Date: Mon, 16 May 2022 22:32:04 +0800
Message-Id: <20220516143204.2603-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_074043_189898_916220BE 
X-CRM114-Status: GOOD (  12.65  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---

since v1:
 - collect Reviewed-by tag
 - move out from the static key series as a separate patch

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

Return-Path: <SRS0=CF9+=7G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF58C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 May 2020 09:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6FA2076C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 May 2020 09:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZoBMMfFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6FA2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJsAs5zzI+wKL1374Yn6oN9d9oh4ET/3jmTNhJfVXvw=; b=ZoBMMfFOZMdvzt
	Cyv+ZmTVMptV/q5z14fOTb7TE+m5ks9I3td17ZeDkCDzcVWQ2D2IN9Qp72jSdn+SYpLSrMmAFttS/
	HF94h3KK59eHVWtoGO/zOyPwAFsROeU+1kZbvpYhE6D1yhxDsxkVae/f5UI9cNT6eybcOvrSZt9fA
	c55Egu5AqubwwgzGMYjLNiB8wJGhLoyUP1RSXR8K4Y7kDWcBTQJBPHUwlKjsFeS3cTtnwvyu7caXN
	FpLAd58/d7Z6jx4MwOQwSrv2aNNRD/TWKY8xV20q4lWJRzmLnO1k82hwHq0NW/rPlvyryNEeaiqis
	OyR+N72CrGUPOGjoBjjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcmk8-0004cZ-1g; Sun, 24 May 2020 09:16:28 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcmk4-0004bQ-Vz
 for linux-riscv@lists.infradead.org; Sun, 24 May 2020 09:16:26 +0000
Received: from localhost.localdomain
 (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr [90.112.45.105])
 (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B5B91200005;
 Sun, 24 May 2020 09:16:21 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] riscv: Allow user to downgrade to sv39 when hw supports
 sv48
Date: Sun, 24 May 2020 05:10:06 -0400
Message-Id: <20200524091008.25587-7-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200524091008.25587-1-alex@ghiti.fr>
References: <20200524091008.25587-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_021625_162714_79CC3246 
X-CRM114-Status: GOOD (  11.79  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is made possible by using the mmu-type property of the cpu node of
the device tree.

By default, the kernel will boot with 4-level page table if the hw supports
it but it can be interesting for the user to select 3-level page table as
it is less memory consuming and faster since it requires less memory
accesses in case of a TLB miss.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bad8da099ff6..1776eeb53d61 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -509,11 +509,32 @@ void disable_pgtable_l4(void)
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
  */
-asmlinkage __init void set_satp_mode(uintptr_t load_pa)
+asmlinkage __init void set_satp_mode(uintptr_t load_pa, uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	int cpus_node;
 
+	/* 1/ Check if the user asked for sv39 explicitly in the device tree */
+	cpus_node = fdt_path_offset((void *)dtb_pa, "/cpus");
+	if (cpus_node >= 0) {
+		int node;
+
+		fdt_for_each_subnode(node, (void *)dtb_pa, cpus_node) {
+			const char *mmu_type = fdt_getprop((void *)dtb_pa, node,
+							"mmu-type", NULL);
+			if (!mmu_type)
+				continue;
+
+			if (!strcmp(mmu_type, "riscv,sv39")) {
+				disable_pgtable_l4();
+				return;
+			}
+
+			break;
+		}
+	}
+
+	/* 2/ Determine if the HW supports sv48: if not, fallback to sv39 */
 	create_pgd_mapping(early_pg_dir, load_pa, (uintptr_t)early_pud,
 			   PGDIR_SIZE, PAGE_TABLE);
 	create_pud_mapping(early_pud, load_pa, (uintptr_t)early_pmd,
@@ -561,7 +582,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	load_sz = (uintptr_t)(&_end) - load_pa;
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_MAXPHYSMEM_2GB)
-	set_satp_mode(load_pa);
+	set_satp_mode(load_pa, dtb_pa);
 #endif
 
 	kernel_virt_addr = KERNEL_VIRT_ADDR;
-- 
2.20.1



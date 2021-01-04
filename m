Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DBCC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:08:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7315A21BE5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7315A21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZkffvbgkFgEfEWem42pwn435gHf9TG9k2oShWm08VvM=; b=f+pNL/ZtwqJNQLRztxPXH3iij
	BTmlkrwbw2xmSlWS/BDyfN8Sct0YbBGoXUmsDaoHayeInMLP8Dy6cPn7ZBP372gZ5cF6vZmecrcB5
	29gTj3doPOpsfowDBOCn/pHm34V/DbAXiRZpVZuzb9xhF/kq+zV+P96ZrbCfeDj9J979L6U5ngx0n
	m62aAwhU46zxSTvrk3HmUnj8KiNwM/QeYa81CAfi0TmA+xYd3XROtwjOcJagoI8hLNPjCgLRbRO5M
	vm5MdXWe6dkRN7hLyTS36WAZzQ6vW5lLTgoH/4W4qrClZCkIlGFhI8eA54Vsz+7Bt8jIfJ6ol2bD6
	01hIa3RRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwW9R-0000Li-Pj; Mon, 04 Jan 2021 20:08:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwW9P-0000LJ-9M
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 20:08:24 +0000
X-Originating-IP: 90.112.190.212
Received: from debian.home (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4135E40007;
 Mon,  4 Jan 2021 20:08:20 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 09/12] riscv: Allow user to downgrade to sv39 when hw
 supports sv48
Date: Mon,  4 Jan 2021 14:58:37 -0500
Message-Id: <20210104195840.1593-10-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104195840.1593-1-alex@ghiti.fr>
References: <20210104195840.1593-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_150823_484314_121D79AE 
X-CRM114-Status: GOOD (  14.48  )
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

This is made possible by using the mmu-type property of the cpu node of
the device tree.

By default, the kernel will boot with 4-level page table if the hw supports
it but it can be interesting for the user to select 3-level page table as
it is less memory consuming and faster since it requires less memory
accesses in case of a TLB miss.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/mm/init.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cb23a30d9af3..f9a99cb1870b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -550,10 +550,32 @@ void disable_pgtable_l4(void)
  * then read SATP to see if the configuration was taken into account
  * meaning sv48 is supported.
  */
-asmlinkage __init void set_satp_mode(uintptr_t load_pa)
+asmlinkage __init void set_satp_mode(uintptr_t load_pa, uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
+	int cpus_node;
 
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
@@ -611,7 +633,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_MAXPHYSMEM_2GB)
-	set_satp_mode(load_pa);
+	set_satp_mode(load_pa, dtb_pa);
 #endif
 
 	kernel_virt_addr = KERNEL_VIRT_ADDR;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

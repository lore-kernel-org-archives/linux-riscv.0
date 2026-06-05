Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4379DCD6E74
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 05:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbtTxZ0i17ZgePw8Y4XcN6nIof6dpIXzExHSiCPjvY8=; b=O4k/1ImTtmzm8f
	eG3E/uZXnCCIE1fLmEPZuO3O6o2xquJR4n1hm02Lt2K1xQQwegbxUaIGDloFx/rkU36OZV4GGb7vu
	eU9TnD5L2AkkiLzi7k15vE6+eS4VDkGg+oHmw+Io8y7jQGxdZ1SHzLCEdevVdytUdnHJ9K8nKf86e
	ARSrOGL4geVkM5R3LEHunWFB/iOshds/mUW68XDrW3LPRmvbbZX9cJ7b4IqHyJVlQrXmNHkNj8EUt
	73gkO72m2bD63WUJjXpyZ3NR9W30ZzM/Q+a9EfQZeSMhCYMRwPZgMW+KuUCkiAvc8NzQjtwUku+cf
	fRNAuHj0IX2qGpQffJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVN2h-000000006R3-1D2u;
	Fri, 05 Jun 2026 05:24:27 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVN2b-000000006Q3-1yys
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 05:24:26 +0000
Received: from [127.0.0.2] (unknown [123.118.218.239])
	by APP-05 (Coremail) with SMTP id zQCowAB3zhF1XSJqwQ1mEg--.1348S2;
	Fri, 05 Jun 2026 13:24:05 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 05 Jun 2026 13:23:22 +0800
Subject: [PATCH v3] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
MIME-Version: 1.0
Message-Id: <20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAEpdImoC/42Q0U6EMBBFf4X02SGFAgvEGP/DaDK0g9tdCtiWR
 kP4dwtror4YH29yc+6ZWZkjq8mxNlmZpaCdnsYYxF3C5BnHVwKtYmY5zyte5iUYtFfA3pOFYMg
 YnGGe5mVAT1DVnTo1vBaNbFgkzJZ6/X7Qn55v2S3dhaTfkV8NS29LnPW3GuvQEcjJGO3bJJzSD
 KzMXtZtbxtyDg+lNrk/jAQXEDXVQHDtaZQEs518HAA3L1ZPi4Mel8FDyIFDX3NVi7KIkupRO4k
 uRZnK8YHtdmft/GQ/jleE7JD519UhgwyoampVl02HWfUTfZBD/k2rePE3bRfFrsKT4qIrRPGbt
 m3bJzrWIba0AQAA
X-Change-ID: 20260525-mark-after-vmemmap-populate-68bd790839c9
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: zQCowAB3zhF1XSJqwQ1mEg--.1348S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWfJr1rJr1xXFy5KF1xXwb_yoWrZw4kpF
	Wj9wsxKFW5JryIgws7Cw12grW7t3ZY9a43Kw10k34rZrW3XFyUXwn5Ka1Utry3XFWrCa4v
	qan8A3yrC3WDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_222421_895462_877985F5 
X-CRM114-Status: GOOD (  12.91  )
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

section_activate() does not flush TLB after populating new vmemmap
pages. On most architectures, this is okay. However it is a problem on
RISC-V since there the TLB caching non-present entries is permitted,
which causes spurious faults on some hardwares.

This seems to be most easily reproduced with DEBUG_VM=y and
PAGE_POISONING=y, which causes these newly mapped struct pages to be
poisoned i.e. written to immediately after mapping.

Add a hook vmemmap_populate_finalize() in __populate_section_memmap()
after population, to allow architectures to handle such situations as
needed. Then implement it on RISC-V to arrange for the existing
exception handler code to deal with these faults if they happen.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Depends on my earlier kfence fixes for mark_new_valid_map() [1].

Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
ZONE_DEVICE requires another fix [2].

[1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
[2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
---
Changes in v3:
- Merged back into one patch (Mike)
- (No code changes otherwise.)
- Link to v2: https://patch.msgid.link/20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn

Changes in v2:
- Split patch in two, hook point and riscv hook 
- Explain hook necessity in patch 1 message (Mike)
- Make hook #define based (Mike)
- Call finalize hook only on populate success
- Link to v1: https://patch.msgid.link/20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn
---
 arch/riscv/include/asm/pgtable.h | 4 ++++
 arch/riscv/mm/init.c             | 6 ++++++
 mm/sparse-vmemmap.c              | 8 ++++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a1a7c6520a09..aa0f50e3d534 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1243,6 +1243,10 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #define TASK_SIZE	FIXADDR_START
 #endif
 
+/* Needed on SPARSEMEM_VMEMMAP */
+#define vmemmap_populate_finalize vmemmap_populate_finalize
+void __meminit vmemmap_populate_finalize(void);
+
 #else /* CONFIG_MMU */
 
 #define PAGE_SHARED		__pgprot(0)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 706f43523935..cf9ae4099f82 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1360,6 +1360,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	 */
 	return vmemmap_populate_hugepages(start, end, node, altmap);
 }
+
+void __meminit vmemmap_populate_finalize(void)
+{
+	/* Avoid faults on cached non-present TLB entries. */
+	mark_new_valid_map();
+}
 #endif
 
 #if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 6eadb9d116e4..2a8b923fabe8 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -544,6 +544,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 
 #endif
 
+#ifndef vmemmap_populate_finalize
+static void __meminit vmemmap_populate_finalize(void)
+{
+}
+#endif
+
 struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
@@ -564,6 +570,8 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 	if (r < 0)
 		return NULL;
 
+	vmemmap_populate_finalize();
+
 	return pfn_to_page(pfn);
 }
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9
prerequisite-message-id: <20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn>
prerequisite-patch-id: fdc42f2647e21d111f44a6532887a6705cd470a9
prerequisite-patch-id: 096fa339c84c36643ae4311fd8362dc63e23d950
prerequisite-patch-id: 305c876a5f4a23a840a8142aea79b796ed297545
prerequisite-patch-id: d78cb55d6a616b1170f06a401c8fd44acd11e5d5
prerequisite-patch-id: b02b4a76e94f3e2821291d4c23b46f6e5ecf5203

Best regards,
--  
Vivian Wang <wangruikang@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

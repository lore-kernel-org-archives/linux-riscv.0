Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3D5CD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 04:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gjy9WVxen/HCH58oF9xMuLDsZ8udhGIFULm5Z+JmPOI=; b=AqNs3BkQHPQX2n
	hgpnaFKLfZMJTgO4FMazZSGho1Q1ZalHUiwNvpxj7kOCOvlqUsPQGqCKMC/T21szzcD8X+9JZcnvX
	kNykq12fSiRPLO/YgnmUtOxDignZ5e6+GdyR8rJI6EIL/ndpo3Z5J0z35olSUjfPY6/sjpPnB2A5q
	v/C1dv3GsX+UYA/rZC9XdTTA2/ihVacrz5xKWn4x5VSGp0J1cHXQ4UDkM0VJe/XCEzJMAdfxRL3a1
	TjF1doa11Q1TJU9wcdzFJ3BQvzVQiHq5clr/ISvYUsTHZACtUc0nhleoDBvENATRGMhXruCQhE/vr
	vk7CgtNDhK2Fp8Pr/8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRMqx-0000000GFpQ-1O4W;
	Mon, 25 May 2026 04:23:47 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRMqu-0000000GFot-0ETr
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 04:23:45 +0000
Received: from [127.0.0.2] (unknown [123.118.218.47])
	by APP-05 (Coremail) with SMTP id zQCowABHk8bDzhNqWZZiEQ--.4758S2;
	Mon, 25 May 2026 12:23:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 25 May 2026 12:23:29 +0800
Subject: [PATCH] riscv: mm: Call mark_new_valid_map() after hotplugging
 vmemmap
MIME-Version: 1.0
Message-Id: <20260525-mark-after-vmemmap-populate-v1-1-e698d859ba16@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAMLOE2oC/y2O0WqEMBBFf0Xy3JGodVellP2PZQtjnLTpGpNmE
 imI/96s28cDh3vPJpiCIRZDsYlAq2HjlgzVSyHUFy6fBGbKLGpZn2Rbt2Ax3AF1pACrJWvRg3c
 +zRgJTt04nXvZNb3qRV7wgbT5PdavtydzGr9JxcfkvxHoJ+Xb+NTEiEygnLUmDsV6LisIqvrY9
 odtiRmPpKF4O4oa2UDOnGaCu6ZFEfjgYj4A9ikYlxg0pjnCWoME3cmpa9rXHDldDCvkElWplnd
 x2/c/GqTYygsBAAA=
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
X-CM-TRANSID: zQCowABHk8bDzhNqWZZiEQ--.4758S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWkAF13Xr13AFW8Cw45KFg_yoWrXFy7pF
	9Fgws7KrW5X3429397Zw429rW2q3ZY9FW7Ka17K34rZr1aqFy7Zwn5Ka1Yyry5JrZ5Gay8
	Z39Ik3s8Cw1DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-Originating-IP: [123.118.218.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_212344_472244_8DEC61D2 
X-CRM114-Status: GOOD (  12.06  )
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

section_activate() creates new mappings in the vmemmap range without
flushing TLB, which may cause faults on some RISC-V implementations that
cache non-present PTEs and crashes.

This seems to be most easily reproduced with DEBUG_VM=y and
PAGE_POISONING=y, which causes these newly mapped struct pages to be
poisoned i.e. written to immediately after mapping.

Add a hook vmemmap_populate_finalize() in __populate_section_memmap(),
and implement it as calling mark_new_valid_map() on RISC-V, which
arranges for the exception handler to deal with these faults if they
happen.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
I'm not sure if this is the right place to add this hook. I didn't add
it to vmemmap_populate because it doesn't seem to be called in all
cases. Please advise.

Depends on my earlier kfence fixes for mark_new_valid_map() [1].

Found while testing AMD_HSA/ZONE_DEVICE on SpacemiT K3. Using
ZONE_DEVICE requires another fix [2].

[1]: https://lore.kernel.org/linux-riscv/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn
[2]: https://lore.kernel.org/linux-riscv/20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn
---
 arch/riscv/mm/init.c | 6 ++++++
 include/linux/mm.h   | 1 +
 mm/sparse-vmemmap.c  | 6 ++++++
 3 files changed, 13 insertions(+)

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
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0b776907152e..65deccbd7e31 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4882,6 +4882,7 @@ int vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap);
 int vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap);
+void vmemmap_populate_finalize(void);
 int vmemmap_populate_hvo(unsigned long start, unsigned long end,
 			 unsigned int order, struct zone *zone,
 			 unsigned long headsize);
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 6eadb9d116e4..2b860d2b1703 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -544,6 +544,10 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 
 #endif
 
+void __weak __meminit vmemmap_populate_finalize(void)
+{
+}
+
 struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap)
@@ -561,6 +565,8 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 	else
 		r = vmemmap_populate(start, end, nid, altmap);
 
+	vmemmap_populate_finalize();
+
 	if (r < 0)
 		return NULL;
 

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

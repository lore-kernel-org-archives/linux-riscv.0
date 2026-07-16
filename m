Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBCEC4450E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XezpdGYlrRDsN/JaYO5KsPrRnVF7IJd8upm4j92xpUE=; b=WgrAqjAe5AyP74
	atMAEhCa1nB82sNizKFOkLSHuCviLJjjDV158EDyQSR2l34z569dvVodQDFmRdmw2R3n5gfMYIHzU
	Ct1NEjtaDtU4/hMsNW5X9/EvrRHEi7x0WmzsMtGzY2yqPrXsBPjpaO1INT4mOpnL9oWwTo+ohgYOd
	4rRTzCqKpnWxdgRTt42rcjfAaUOQgclFm927FsPGmNmnhkv2EPGDNZb5b9PfvUgsjAKagWbb8UPsm
	VIjCyLaKHWInZ2Z8cix5yzfuELR4V+okgs8wYyMYMO5FQCZqF8HnCsTAloctyDKZVDWMc67GxKYs7
	IZBDfjRg1ZBWZz9y5vyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKam-0000000HB2U-2l36;
	Thu, 16 Jul 2026 11:49:28 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKai-0000000HB1y-3plp
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 11:49:27 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADngPQwxVhqCVQfAA--.22319S2;
	Thu, 16 Jul 2026 19:49:04 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: David Hildenbrand <david@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vishal Moola <vishal.moola@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Kiryl Shutsemau <kas@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Nam Cao <namcao@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH] riscv/mm: use physical alignment for vmemmap_start_pfn
Date: Thu, 16 Jul 2026 11:49:02 +0000
Message-Id: <20260716114902.3455029-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADngPQwxVhqCVQfAA--.22319S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18KF4kXr1rKw17ury7Awb_yoW8Zr1fpF
	s0kF4q9ayUXr18ua9Fvw18WF4UW3s0kF17Kr42yr9xZF1YgFyxurWjq343uryDG3Wxua4k
	Gr1ayFWrC3WrZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTR_9NVDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwMKCWpYpPBVKAAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_044925_344304_F94DA113 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

RISC-V computes vmemmap_start_pfn by rounding phys_ram_base down to
VMEMMAP_ADDR_ALIGN. That alignment must therefore be expressed in the
physical-address domain.

Commit 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
attempted to account for the maximal folio alignment by feeding
MAX_FOLIO_VMEMMAP_ALIGN directly into VMEMMAP_ADDR_ALIGN. However,
MAX_FOLIO_VMEMMAP_ALIGN is measured in bytes of struct page storage,
whereas VMEMMAP_ADDR_ALIGN is used to align a physical address.

The mask-based compound_info encoding requires pfn_to_page(0) to be
naturally aligned to MAX_FOLIO_VMEMMAP_ALIGN. Commit 9f94db4c7eaa
("mm/sparse: check memmap alignment for compound_info_has_mask()")
added a check for that requirement and exposed the unit mismatch on
systems such as QEMU virt, where the DRAM base is not aligned to
MAX_FOLIO_NR_PAGES * PAGE_SIZE.

Convert MAX_FOLIO_VMEMMAP_ALIGN to the equivalent physical alignment
before using it in VMEMMAP_ADDR_ALIGN. This keeps the existing
round_down() logic while making the resulting vmemmap base satisfy the
mask-alignment requirement.

Fixes: 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Assisted-by: YuanSheng:DeepSeek-V4-Flash
---
 arch/riscv/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3e450890be07..422efa11824b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -63,7 +63,8 @@ EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 #define VMEMMAP_ADDR_ALIGN	max(1ULL << SECTION_SIZE_BITS, \
-				    MAX_FOLIO_VMEMMAP_ALIGN)
+				    PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / \
+					     sizeof(struct page)))
 
 unsigned long vmemmap_start_pfn __ro_after_init;
 EXPORT_SYMBOL(vmemmap_start_pfn);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

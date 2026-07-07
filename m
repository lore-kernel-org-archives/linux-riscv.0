Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110DDC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BDVdH9ks0Jv/mp7BMrAQnxig+PqOT9BJrlV+gQP+dEc=; b=serGXlMOHyKx2H
	KbuclrK9pY9r+ZBKmQ8SFOOuRe7Uk7p0hb5VUdxSNcW1FofCrJKzBVkvQoKiUdUw/uv1RNlHLyBHy
	vEgvkmvbnm9Rs7hZUPBbxx/99X4fonjqDKlT3YoJbqQIo7gQuz/60sjCCB1L+/dOAHStErQZSadUm
	OVmoZZkoxzvdCawqlW7SI56/4H8bxHUizAU53yJiZOjZPD+U/6wpyIlr84SHuM33Fc7uzxTUp640L
	svRM59CsKKZdbCylHgR8KnjFCoofVQdtREk2cTjMjgOD0+hVkeMRdBOZfpPtD10gUbL9vMAuwZ79e
	509G5d9G22uTaqLypK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgx8c-0000000E3Zb-2o3B;
	Tue, 07 Jul 2026 04:10:26 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgx8Y-0000000E3Z4-3nYk
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 04:10:25 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABHk8YdfExq_cVRFw--.40495S2;
	Tue, 07 Jul 2026 12:10:05 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 07 Jul 2026 12:10:05 +0800
Subject: [PATCH v5] mm/sparse-vmemmap: flush_cache_vmap() after hotplugging
 vmemmap
MIME-Version: 1.0
Message-Id: <20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIABx8TGoC/43Oy04DIRgF4FdpWEvDvdCV72G6+IF/LOpcAlNS0
 8y7y9SFNZrq8iQn3zkXUjAnLGS/uZCMNZU0Di3ohw0JRxiekabYMhFMGKaFpj3kVwrdjJnWHvs
 eJjqN0+kNZqTG+rhzzEoXHGnClLFL56v+dPjM5eRfMMwruTaOqcxjfr/OV772/rdUOeUUjbPRa
 ueBm8dUApQthG0YyLpVxZdmmLqvCcooeAO7yKRXUv3U5K32xzfZvkGrMQ7BCfOLpm40ye5rqmk
 deh+4jsCE/a4ty/IB5XVbMMQBAAA=
X-Change-ID: 20260525-mark-after-vmemmap-populate-68bd790839c9
To: Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, Muchun Song <muchun.song@linux.dev>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: zQCowABHk8YdfExq_cVRFw--.40495S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWfJr15Kw4rtFykCr13CFg_yoW5tF4xpF
	Zruwn5trZ8Wr1xWr47Zw1I9r4xJwnIga4xK3WFkry5Zws8XFyUWr95Kay8WryDJFZ5Zayx
	Ca1Yk34rWFyUZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUJWrAUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_211023_336654_31C85BF5 
X-CRM114-Status: GOOD (  15.82  )
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

Extend the RISC-V flush_cache_vmap() to also handle the vmemmap range,
and call it after hotplugging vmemmap, which gets the possible spurious
fault handled in the exception handler.

At least for now, the only other architecture with both
SPARSEMEM_VMEMMAP and flush_cache_vmap() is PowerPC, which has a similar
problem with newly valid PTEs. But there flush_cache_vmap() is just a
ptesync. So it should be safe to do this for generic code while having
minimal performance impact.

Suggested-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v5:
- Remove hook, use existing flush_cache_vmap() (Muchun)
- Link to v4: https://patch.msgid.link/20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn

Changes in v4:
- Rebase on v7.2-rc1, drop dependencies
- (No code changes otherwise)
- (A concurrency fix for mark_new_valid_map was sent independently)
  https://lore.kernel.org/linux-riscv/20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn/
- Link to v3: https://patch.msgid.link/20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn

(See v3 link for older changes)
---
 arch/riscv/include/asm/cacheflush.h | 3 ++-
 arch/riscv/mm/init.c                | 1 +
 mm/sparse-vmemmap.c                 | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8cfe59483a8f..e935db27f09f 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -56,7 +56,8 @@ static inline void mark_new_valid_map(void)
 #define flush_cache_vmap flush_cache_vmap
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 {
-	if (is_vmalloc_or_module_addr((void *)start))
+	if (is_vmalloc_or_module_addr((void *)start) ||
+	    (start >= VMEMMAP_START && end <= VMEMMAP_END))
 		mark_new_valid_map();
 }
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4d1..1b4f16704133 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -24,6 +24,7 @@
 #include <linux/execmem.h>
 
 #include <asm/alternative.h>
+#include <asm/cacheflush.h>
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <asm/kasan.h>
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 99e2be39671b..ebd3ac997f64 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -564,6 +564,8 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 	if (r < 0)
 		return NULL;
 
+	flush_cache_vmap(start, end);
+
 	return pfn_to_page(pfn);
 }
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

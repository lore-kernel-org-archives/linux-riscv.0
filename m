Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212ECD6E6B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkaUF2ZtzoRwtGHQ4zGUU2c3PKlCK5SVp533bTI/xqQ=; b=irmzxDERJP912r
	iJLw2vkxd+s2K2CHnlSfXSm3TFTWYfqQF1dmANFcgrzQvTmAhSKg8m3OYH3+Bx6uqGYyN23bjwQ7y
	Jl0pUOmq7zo9+uJJpx5otcmuqEbJLUtvOYcCSFe+4uWPq8gz/2beyHvXZBrE247mdqoiENV3RwN3P
	QlCqFVH8WEDh3M6S1OCaWzHzdjoQqsLvB+Hul/m/jsGdzECu+owy3raVtkiXJJuU3Ns3g7NhW0D5f
	hi6dKc5KBcvMNImu8m6Y49U8D/bAMSnQZe2u0pDU+63b74NXB+b32SRzUF+6VWSM1m6GGdYvKmCGO
	apQORXHnWEI4zvL3O+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV60T-0000000GcTl-1kLt;
	Thu, 04 Jun 2026 11:13:01 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV60P-0000000GcSf-1u3I
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 11:12:59 +0000
Received: from [127.0.0.2] (unknown [123.118.218.239])
	by APP-01 (Coremail) with SMTP id qwCowABX+tKpXSFqnS2YAA--.469S4;
	Thu, 04 Jun 2026 19:12:43 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Thu, 04 Jun 2026 19:11:55 +0800
Subject: [PATCH v2 2/2] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
MIME-Version: 1.0
Message-Id: <20260604-mark-after-vmemmap-populate-v2-2-ab6a7d03b434@iscas.ac.cn>
References: <20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn>
In-Reply-To: <20260604-mark-after-vmemmap-populate-v2-0-ab6a7d03b434@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: qwCowABX+tKpXSFqnS2YAA--.469S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4rKFykAr1rtF4DWrW5GFg_yoW8Zw15pr
	Z8uwn5KrW5ur97C397Aa42gr18JanYga43Kw1UCw1kZrW5XrWUXrn5KanxJryrXFs7ua48
	CF43CryrC3WDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_041257_872992_75C8F812 
X-CRM114-Status: UNSURE (   9.74  )
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

section_activate() creates new mappings in the vmemmap range without
flushing TLB, which may cause faults on some RISC-V implementations that
cache non-present PTEs and crashes.

This seems to be most easily reproduced with DEBUG_VM=y and
PAGE_POISONING=y, which causes these newly mapped struct pages to be
poisoned i.e. written to immediately after mapping.

Implement the newly added hook vmemmap_populate_finalize() on RISC-V, to
arrange for the existing exception handler code to deal with these
faults if they happen.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
I put the declaration here since it's the file where vmemmap and the
vmemmap area addresses are defined.

Depends on my kfence patches for mark_new_valid_map() (see cover).
---
 arch/riscv/include/asm/pgtable.h | 4 ++++
 arch/riscv/mm/init.c             | 6 ++++++
 2 files changed, 10 insertions(+)

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

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

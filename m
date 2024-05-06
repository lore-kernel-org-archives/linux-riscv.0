Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A30FC25B4F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWn6NwDB1iJdv0UgODozgBEsDv5pflM6SuQdOZ1h5dU=; b=L9zt+m3ucuO7Ai
	t1TF8ZRPumuY9J3Uprpf74tuMnXAOHMtPFA1TTaNGAOQD5c43UXDH5ThZwPK+HgxqwUnilG8B4Ya6
	Gx5xvdUxzoLxbdc+JcxEcD+sFZhNIKAD4U5kOma80MXLznZDEk1mhGCwLQyTDETFZBMxNy7yrfofa
	Wbe5gnbJ/OpEpPNAQzkBb20LKgZrGitEk0wSFERKuLHQXSu/Hi07JwlSkC3Z8sSOl9PYSn363HIig
	gtjxzXhrXY4oLUv9NkWF/mCqZAUUvW8B9EoteClZbVCJcV6scv35wb0EJDQzWB+bnli9N9qKZKuM0
	lIRiOnvmRRkkIKG+jUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40dZ-00000007wB9-2dVz;
	Mon, 06 May 2024 15:52:21 +0000
Received: from out0-213.mail.aliyun.com ([140.205.0.213])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40dQ-00000007w37-2H3x
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 15:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715010729; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fZLMp0zX1lVO/AMMqpo0KyiatSIXbG3CSPTawlIjnSU=;
	b=aStQqaZOohz35DRBGFMCkuopRx0Plzkaz7/qx/bdVjo8Z3vieMhz0bKgcYtSB3MSv42bZluAWutG9ZcN1lAHQXvu/dimpoYpg8FAaPm0hX56hBb0HlPKkx5ot72wKBB7NNSwt41xrpgKJOPIK+8l+pwoTe2eXDixpsbXlBzeH4U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047192;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XTcewEm_1715010727;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XTcewEm_1715010727)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:08 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-riscv@lists.infradead.org>,
   <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <ioworker0@gmail.com>,
   <libang.linux@gmail.com>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v2 4/5] xtensa: Add update_mmu_tlb_range()
Date: Mon, 06 May 2024 23:51:19 +0800
Message-Id: <20240506155120.83105-5-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240506155120.83105-1-libang.li@antgroup.com>
References: <20240506155120.83105-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_085212_879252_284970B9 
X-CRM114-Status: UNSURE (   6.09  )
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

Added update_mmu_tlb_range function, we can batch update tlb of an
address range.

Signed-off-by: Bang Li <libang.li@antgroup.com>
---
 arch/xtensa/include/asm/pgtable.h | 4 ++++
 arch/xtensa/mm/tlb.c              | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 9a7e5e57ee9a..57f97e7e06d0 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -414,6 +414,10 @@ void update_mmu_tlb(struct vm_area_struct *vma,
 		    unsigned long address, pte_t *ptep);
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 
+void update_mmu_tlb_range(struct vm_area_struct *vma,
+			unsigned long address, pte_t *ptep, unsigned int nr);
+#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
+
 #endif /* !defined (__ASSEMBLY__) */
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index d8b60d6e50a8..05efba86b870 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -169,6 +169,12 @@ void update_mmu_tlb(struct vm_area_struct *vma,
 	local_flush_tlb_page(vma, address);
 }
 
+void update_mmu_tlb_range(struct vm_area_struct *vma,
+			unsigned long address, pte_t *ptep, unsigned int nr)
+{
+	local_flush_tlb_range(vma, address, address + PAGE_SIZE * nr);
+}
+
 #ifdef CONFIG_DEBUG_TLB_SANITY
 
 static unsigned get_pte_for_vaddr(unsigned vaddr)
-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

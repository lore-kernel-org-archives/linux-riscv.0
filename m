Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0C0C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoCTOLCZnWxjfITonxbMWyUd9rIiWNfbJEyEnlq9+tw=; b=35hMfXpCfizH21
	uRzJqLTgINUDqg54rNJUyXy1rUDqLSGo1dkgoI+baLGmkiDBYSr2af29JmU5Ws+SswmClmGK1kkhA
	bMaMH8Mwys41v//hxfChw7vdJ+PJ/d1Cvlwur3Fv2AL2uqAqurwW5TCj09OhxhjzRZOtlBUn6FmaF
	gUexdIzEqNRXKqTfr7AN3kIANGushxouYjm1/+QOUNLOrBiOkQJNT3LpQWoEDFYc/QzyAKDL2Fywj
	XKZSZOPsx9arVl30h6Z7JT9oAYdMj+MDg5JYFfhEdCM+sXgCw0mImFeeCs2kj5FFqUxlgQl1TsGZF
	g2FirXAcOFF5TwuBDUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ONA-00000002IhA-2ORt;
	Mon, 29 Apr 2024 10:36:36 +0000
Received: from out0-200.mail.aliyun.com ([140.205.0.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OMl-00000002IMd-1au6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 10:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386961; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=L9Nnq3jHrztC2V1l+aPsgS97TA5W6U5sPTcwdSCKib4=;
	b=oPwIfU0gSfBrVohHAdkhWKn06WI1FfS6b7uuYUGFoD88bxPGYtPbEIU96r+wxLekbLAGx5cc+JBuPTky9Ikn+TmK+i6Dz/2Zlsaz86JX551+PpkPQ9o7i9IYIwZhU/kVVqBs6vcSRTRCVJ4B594Fow2YluF6wz6Cc9b90k+GtuA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047207;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOEanMa_1714386956;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOEanMa_1714386956)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:57 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <libang.linux@gmail.com>,
   <ioworker0@gmail.com>,
   <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-mips@vger.kernel.org>,
   <linux-riscv@lists.infradead.org>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v1 4/5] xtensa: Add update_mmu_tlb_range()
Date: Mon, 29 Apr 2024 18:33:45 +0800
Message-Id: <20240429103346.59115-5-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20240429103346.59115-1-libang.li@antgroup.com>
References: <20240429103346.59115-1-libang.li@antgroup.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_033611_731997_5FB18A73 
X-CRM114-Status: UNSURE (   5.88  )
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
 arch/xtensa/include/asm/pgtable.h | 2 ++
 arch/xtensa/mm/tlb.c              | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 9a7e5e57ee9a..50ccfc988256 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -412,6 +412,8 @@ typedef pte_t *pte_addr_t;
 
 void update_mmu_tlb(struct vm_area_struct *vma,
 		    unsigned long address, pte_t *ptep);
+void update_mmu_tlb_range(struct vm_area_struct *vma,
+			unsigned long address, pte_t *ptep, unsigned int nr);
 #define __HAVE_ARCH_UPDATE_MMU_TLB
 
 #endif /* !defined (__ASSEMBLY__) */
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

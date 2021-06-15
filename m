Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7F9C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:40:33 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1895661433
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1895661433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePXT1g00grlmgxAh+nhNK/13fK7L4jkNnS6r4YV2VRA=; b=OHs/W2vTPA9ycs
	hFcNuwnZVu5+dzLp94TqF1JFRrhByw9c3h30X2oxPe2NJELGjGXNy1akeFeMtl+dZbVft64w/G11S
	80d2SVc5qeBPsmKvwsc6w2SUzwbJYWXUOvXgrwX9F3P8fC3KyGh9qKg5HEXr95Q6qsCu7pvWeX+vc
	InOx58wwo44WEO0jUKJwbGSRL8GBxe4X9BEx+BFkWNSQWUz6h6mLO27y+MyijlFXPiQgLzSGp5/TT
	xPlaA3dznfDZ7DgQ9A7VbHVyTNC6AaiOV4zuCYkKObp0snPuoJ0lXIaHYoDgwvxVRO1UETB0wtsoC
	w1kKXe/yckSVn6CCmXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9IG-000Evt-Kq; Tue, 15 Jun 2021 13:39:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9F9-000DEY-49; Tue, 15 Jun 2021 13:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=46lRDQvPDCMptNp8KPNFjxHnQhG6dR0aecdnO90y5zY=; b=hXwAT1mcgXQVEQxSSGn7mnXvWk
 CVWCXbS6WfznzD2HitCtMUDRpT3w24JVlXrWvHMBYPcvnqZyk1t+NbOv1HPFMfhhSKgSClH+MTgbR
 yz3i6YBjjo7pmlxYcysY9eZwDA3WhEI4CagGv1oB4xI66jDqP8VZ9HKlAVtg5dfEzcZuVFr/KEpQ9
 yBXjxg1yz5eRFyIeEtybkgb89w7Oueyq5kLVKRP5wpqDIkCqoIQrDHEZdpgDExLt40yzba4ygd407
 x9QZycesy+TM0Ez6OGUdEmapk3zIrPZInD4rBVD2gwLCl+1LJ9lk5xsyCIOzP3J/zbtfoz0mJgtfY
 uxVFfyhg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt7ga-007p9Y-7y; Tue, 15 Jun 2021 11:57:01 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FBB46P063562; Tue, 15 Jun 2021 07:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=46lRDQvPDCMptNp8KPNFjxHnQhG6dR0aecdnO90y5zY=;
 b=jKcOlBHhGIfgGnqdP/XmHzlW9TZpQtHvF+GSdiBeRW4b5r4eLE+1+OBzHpb7PxV/BI1S
 12Q0a/IZSky1B4fLZFAnSdt5kGuow/Ra2l3LOXC34BhVvbwZD7nBLWJSxm1LrlivhLE6
 ltZc9alf5qb9wBvCTDVZiByBSEc3R5Z5mlu0YUpHu2j4nYQlONKr/FLO+LXozFQ7jz7K
 QhXyCZ8tI5Ak4i6aheaRwZLeJPmRFrwYrTGVxoShJxCfZFvebp74ehuBpf/hjT9yYpCZ
 1AFuYjC1KojjhfosdvvwB0hQeRUrqkb+eqWnFF7Du+24ONS8vH7Oi8qM8weUfsC1lsC/ vw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396tq4s28y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:31:04 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FBNNI9020401;
 Tue, 15 Jun 2021 11:31:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 394mj97b34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 11:31:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FBV29Y30147066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 11:31:02 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1977EAE0DA;
 Tue, 15 Jun 2021 11:09:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 530C0AE06D;
 Tue, 15 Jun 2021 11:09:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.54.82])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 11:09:19 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org
Subject: [PATCH v2 2/2] mm: rename p4d_page_vaddr to p4d_pgtable and make it
 return pud_t *
Date: Tue, 15 Jun 2021 16:38:59 +0530
Message-Id: <20210615110859.320299-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615110859.320299-1-aneesh.kumar@linux.ibm.com>
References: <20210615110859.320299-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _LkL_3fJzhGn91Y5tgVoMjM15-XPwyMY
X-Proofpoint-GUID: _LkL_3fJzhGn91Y5tgVoMjM15-XPwyMY
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=848 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125659_457558_C169CBC8 
X-CRM114-Status: GOOD (  21.65  )
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

No functional change in this patch.

Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-arch@vger.kernel.org

Link: https://lore.kernel.org/linuxppc-dev/CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com/
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h                | 4 ++--
 arch/ia64/include/asm/pgtable.h                 | 2 +-
 arch/mips/include/asm/pgtable-64.h              | 4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h    | 5 ++++-
 arch/powerpc/include/asm/nohash/64/pgtable-4k.h | 6 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c        | 2 +-
 arch/powerpc/mm/pgtable_64.c                    | 2 +-
 arch/sparc/include/asm/pgtable_64.h             | 4 ++--
 arch/x86/include/asm/pgtable.h                  | 4 ++--
 arch/x86/mm/init_64.c                           | 4 ++--
 include/asm-generic/pgtable-nop4d.h             | 2 +-
 include/asm-generic/pgtable-nopud.h             | 2 +-
 include/linux/pgtable.h                         | 2 +-
 13 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 53a415b329b0..fde06639fff8 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -697,9 +697,9 @@ static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
 	return __p4d_to_phys(p4d);
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return (unsigned long)__va(p4d_page_paddr(p4d));
+	return (pud_t *)__va(p4d_page_paddr(p4d));
 }
 
 /* Find an entry in the frst-level page table. */
diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index b2ddfbe70365..a2d5098b299a 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -282,7 +282,7 @@ ia64_phys_addr_valid (unsigned long addr)
 #define p4d_bad(p4d)			(!ia64_phys_addr_valid(p4d_val(p4d)))
 #define p4d_present(p4d)		(p4d_val(p4d) != 0UL)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
-#define p4d_page_vaddr(p4d)		((unsigned long) __va(p4d_val(p4d) & _PFN_MASK))
+#define p4d_pgtable(p4d)		((pud_t *) __va(p4d_val(p4d) & _PFN_MASK))
 #define p4d_page(p4d)			virt_to_page((p4d_val(p4d) + PAGE_OFFSET))
 #endif
 
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index ab305453e90f..b865edff2670 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -210,9 +210,9 @@ static inline void p4d_clear(p4d_t *p4dp)
 	p4d_val(*p4dp) = (unsigned long)invalid_pud_table;
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return p4d_val(p4d);
+	return (pud_t *)p4d_val(p4d);
 }
 
 #define p4d_phys(p4d)		virt_to_phys((void *)p4d_val(p4d))
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 40bafe1e80c9..cbedc7c8959d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1048,7 +1048,10 @@ extern struct page *p4d_page(p4d_t p4d);
 /* Pointers in the page table tree are physical addresses */
 #define __pgtable_ptr_val(ptr)	__pa(ptr)
 
-#define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
+{
+	return (pud_t *)__va(p4d_val(p4d) & ~P4D_MASKED_BITS);
+}
 
 static inline pmd_t *pud_pgtable(pud_t pud)
 {
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h b/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
index fe2f4c9acd9e..10f5cf444d72 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
@@ -56,10 +56,14 @@
 #define p4d_none(p4d)		(!p4d_val(p4d))
 #define p4d_bad(p4d)		(p4d_val(p4d) == 0)
 #define p4d_present(p4d)	(p4d_val(p4d) != 0)
-#define p4d_page_vaddr(p4d)	(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
 #ifndef __ASSEMBLY__
 
+static inline pud_t *p4d_pgtable(p4d_t p4d)
+{
+	return (pud_t *) (p4d_val(p4d) & ~P4D_MASKED_BITS);
+}
+
 static inline void p4d_clear(p4d_t *p4dp)
 {
 	*p4dp = __p4d(0);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b663d8f9f05c..1ba6d9291c10 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -859,7 +859,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 			continue;
 		}
 
-		pud_base = (pud_t *)p4d_page_vaddr(*p4d);
+		pud_base = p4d_pgtable(*p4d);
 		remove_pud_table(pud_base, addr, next);
 		free_pud_table(pud_base, p4d);
 	}
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 4ba311808bdb..78c8cf01db5f 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -105,7 +105,7 @@ struct page *p4d_page(p4d_t p4d)
 		VM_WARN_ON(!p4d_huge(p4d));
 		return pte_page(p4d_pte(p4d));
 	}
-	return virt_to_page(p4d_page_vaddr(p4d));
+	return virt_to_page(p4d_pgtable(p4d));
 }
 #endif
 
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 534ec872fa2c..c0f56da1c205 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -860,8 +860,8 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define pmd_clear(pmdp)			(pmd_val(*(pmdp)) = 0UL)
 #define pud_present(pud)		(pud_val(pud) != 0U)
 #define pud_clear(pudp)			(pud_val(*(pudp)) = 0UL)
-#define p4d_page_vaddr(p4d)		\
-	((unsigned long) __va(p4d_val(p4d)))
+#define p4d_pgtable(p4d)		\
+	((pud_t *) __va(p4d_val(p4d)))
 #define p4d_present(p4d)		(p4d_val(p4d) != 0U)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 35a34ca6f2e9..b6c97b8f59ec 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -906,9 +906,9 @@ static inline int p4d_present(p4d_t p4d)
 	return p4d_flags(p4d) & _PAGE_PRESENT;
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return (unsigned long)__va(p4d_val(p4d) & p4d_pfn_mask(p4d));
+	return (pud_t *)__va(p4d_val(p4d) & p4d_pfn_mask(p4d));
 }
 
 /*
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index e527d829e1ed..ffb3da2cb038 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -193,8 +193,8 @@ static void sync_global_pgds_l4(unsigned long start, unsigned long end)
 			spin_lock(pgt_lock);
 
 			if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
-				BUG_ON(p4d_page_vaddr(*p4d)
-				       != p4d_page_vaddr(*p4d_ref));
+				BUG_ON(p4d_pgtable(*p4d)
+				       != p4d_pgtable(*p4d_ref));
 
 			if (p4d_none(*p4d))
 				set_p4d(p4d, *p4d_ref);
diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index ce2cbb3c380f..982de5102fc1 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -42,7 +42,7 @@ static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
 #define pgd_page(pgd)				(p4d_page((p4d_t){ pgd }))
-#define pgd_page_vaddr(pgd)			(p4d_page_vaddr((p4d_t){ pgd }))
+#define pgd_page_vaddr(pgd)			(p4d_pgtable((p4d_t){ pgd }))
 
 /*
  * allocating and freeing a p4d is trivial: the 1-entry p4d is
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 7cbd15f70bf5..eb70c6d7ceff 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -49,7 +49,7 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 #define __pud(x)				((pud_t) { __p4d(x) })
 
 #define p4d_page(p4d)				(pud_page((pud_t){ p4d }))
-#define p4d_page_vaddr(p4d)			(pud_pgtable((pud_t){ p4d }))
+#define p4d_pgtable(p4d)			((pud_t *)(pud_pgtable((pud_t){ p4d })))
 
 /*
  * allocating and freeing a pud is trivial: the 1-entry pud is
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 311984f87cf9..d355290bf70e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -96,7 +96,7 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
 #ifndef pud_offset
 static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 {
-	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
+	return p4d_pgtable(*p4d) + pud_index(address);
 }
 #define pud_offset pud_offset
 #endif
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

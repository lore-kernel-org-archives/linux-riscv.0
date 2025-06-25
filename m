Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54579C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWxKVHFEcc4fSzJSWOQoj1WQheEOT0mptarFF1+gLhI=; b=HIu7hY7sjRru3N
	KyPgTA92lNk10hsHG6Tkl5VGSGqFdqJGW+Hc5ZiixtzwNflH8v3KQ58MB8+Ofz5W/uW7CgEX5IjII
	e7r4IYY+t1982Baeif0X8JBxJUW2rhrLYFIpE/8HttrdSuBQsv9HRFWahnU+AWrDy7CFBcpiVDbdj
	2TtSIUl3RefxBm0ELRv4WdHVMQm11lzxlmLdgU8gsEKw7ipKLBUiCRZ7p9DeD4B3O1dHh6uiR4jrD
	AG3q0BgAjrQ29Nm59sn6I5mw3mP7CNDQi2PN3iOhNiKTSJtfA2+G+xVcOpTIN74SCh3e7i5/xDGfA
	MAGISuz+WrG14abQyKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJmA-00000007gPy-3MMs;
	Wed, 25 Jun 2025 06:38:30 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJm8-00000007gP3-1FgW;
	Wed, 25 Jun 2025 06:38:29 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1lEWX029546;
	Wed, 25 Jun 2025 06:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=f6FKGKuzbFrJNBoDx
	2Pvd75p3aFngtqkrbczHAyJRe4=; b=L9T3olY//mS3/5yVKpp0STizZnwC2RoFA
	U1j34w8GQYp/sVbo27Ct2nCKeFOpWWVmO8Z+10p4JaaBizj4x34nz3Hs6SpFZF/S
	KGfq7eDN0IeXxWsVQbah/8BUF4aWXO4/cEAx3B8gLNyCDKDt1qHd9YfB9EkjlLHu
	YxTB6VmzKED5aO8AhqaZvbsXWQAg2/Lgt3vPygJxufldeKLznXyXxK9+LTpi+dpA
	zfjC9WeTJopmGGYGluiHEsVUn+xtQ2aAFwHcIANzC5PiNUC5mA+jqqp84tGZOSjI
	a5TZzcNRkDU2A8WN/OIHYdfTuO/TxgyCGRjuYO5LZZlTOV5sjE1nA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dk63w7x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:38:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P58Vmn030546;
	Wed, 25 Jun 2025 06:38:15 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7f001s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 06:38:15 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P6cE4r63766856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 06:38:14 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CE4258887;
	Wed, 25 Jun 2025 06:38:14 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CE1C5886C;
	Wed, 25 Jun 2025 06:38:10 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:38:09 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 01/13] arm64/mm: Add addr parameter to __set_{ptes_anysz,ptes,pmds,puds}()
Date: Wed, 25 Jun 2025 16:37:41 +1000
Message-ID: <20250625063753.77511-2-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625063753.77511-1-ajd@linux.ibm.com>
References: <20250625063753.77511-1-ajd@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NSBTYWx0ZWRfX6kpCkDAwiIiz UcdM+FD9t/G8vRe0+qUln6egM0tQ0J8i3U9MYppN5UbiJVuI/nW9pFNVxeSZjM8sN12khSBe2eK H6LKojQzcrqCs4E6NpJmvQOh5Hk2qaC2uka7OuEmYMxuFJdow+hibBeF2aJtojgiFCq99PZ4kIZ
 gV5zC2rvTPub6tYqs1WfeK5M991h8lNafWeEhmxUHkrd5/sGq03jTKL5QGqwjD1OShYvC0+u+nT eHAfVQz7Jkey2NhYS1geXx+WknnUmJy6nCklsavyKGrIT+mNaY9kIPpHiwzfSkJ4ivRrVzz5dKY +bawjdCGUqmO6NPmIDk3eHbpT44I0EU0VIlHM7xjLICmGYU1OMOkSjIfYkz1IXbNIQhqRvqN0DY
 lXeJ++3PXG8vdzuFLYYPX+fJGmEgwzKlTl8p3+MZnWO3czjH/fljblh8i5Ve+gNuBOq7/FAN
X-Proofpoint-ORIG-GUID: QX33b91KVV_jTH63ExHqyoYW22D08pZm
X-Proofpoint-GUID: QX33b91KVV_jTH63ExHqyoYW22D08pZm
X-Authority-Analysis: v=2.4 cv=BfvY0qt2 c=1 sm=1 tr=0 ts=685b9957 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=iO9NmEFvf90wNdx_zysA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=627 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_233828_448715_C762AB38 
X-CRM114-Status: GOOD (  14.35  )
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

To provide support for page table check on powerpc, we need to reinstate the
address parameter in several functions, including
page_table_check_{ptes,pmds,puds}_set().

In preparation for this, add the addr parameter to arm64's __set_ptes_anysz()
and its callers, __set_ptes(), __set_pmds() and __set_puds(). While this
parameter won't (at present) be used on arm64, this will keep the usage of
the page table check interfaces consistent.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: new patch
---
 arch/arm64/include/asm/pgtable.h | 19 ++++++++-----------
 arch/arm64/mm/hugetlbpage.c      |  8 ++++----
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 192d86e1cc76..acbcb5e883ce 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -712,8 +712,8 @@ static inline pgprot_t pud_pgprot(pud_t pud)
 	return __pgprot(pud_val(pfn_pud(pfn, __pgprot(0))) ^ pud_val(pud));
 }
 
-static inline void __set_ptes_anysz(struct mm_struct *mm, pte_t *ptep,
-				    pte_t pte, unsigned int nr,
+static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long addr,
+				    pte_t *ptep, pte_t pte, unsigned int nr,
 				    unsigned long pgsize)
 {
 	unsigned long stride = pgsize >> PAGE_SHIFT;
@@ -748,26 +748,23 @@ static inline void __set_ptes_anysz(struct mm_struct *mm, pte_t *ptep,
 	__set_pte_complete(pte);
 }
 
-static inline void __set_ptes(struct mm_struct *mm,
-			      unsigned long __always_unused addr,
+static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	__set_ptes_anysz(mm, ptep, pte, nr, PAGE_SIZE);
+	__set_ptes_anysz(mm, addr, ptep, pte, nr, PAGE_SIZE);
 }
 
-static inline void __set_pmds(struct mm_struct *mm,
-			      unsigned long __always_unused addr,
+static inline void __set_pmds(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
-	__set_ptes_anysz(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
+	__set_ptes_anysz(mm, addr, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
 }
 #define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, 1)
 
-static inline void __set_puds(struct mm_struct *mm,
-			      unsigned long __always_unused addr,
+static inline void __set_puds(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud, unsigned int nr)
 {
-	__set_ptes_anysz(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
+	__set_ptes_anysz(mm, addr, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
 }
 #define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, 1)
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0c8737f4f2ce..1003b5020752 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -226,7 +226,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
-			__set_ptes_anysz(mm, ptep, pte, 1, pgsize);
+			__set_ptes_anysz(mm, addr, ptep, pte, 1, pgsize);
 		return;
 	}
 
@@ -234,7 +234,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
 		clear_flush(mm, addr, ptep, pgsize, ncontig);
 
-	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
+	__set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
 }
 
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
@@ -449,7 +449,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	if (pte_young(orig_pte))
 		pte = pte_mkyoung(pte);
 
-	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
+	__set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
 	return 1;
 }
 
@@ -473,7 +473,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
 	pte = pte_wrprotect(pte);
 
-	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
+	__set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
 }
 
 pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

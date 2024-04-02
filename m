Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFD4CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 05:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWkeyw4ceoXksJ522ZT7PIA781T3SQc8OQUwvK5NLk0=; b=KrhVYgqYw/9dCJ
	bT964glqiE4L+EUHabtWRhPMJ67sh7cunmINZQQMhNnYtC5T0Rv6AWHQmHZomsfprIaXLbhBrYt2j
	q36X6GaUlX1y/Vg/GBdo0WOux3xFSfxNbFE38aHnA1oIdOsaaANtfv731q2j2aiaQds0DVHsdAwJq
	d0d0/EUBqZzje2tvXWpn9VXU3lDbeLlzg/gfMPoXnTS0dmVijFkXydEehQf8QfW69X4LmNH15H96j
	uddKYXQ4nTL4ibmtQKjQFF+x9hPDdlQDzOfR7kmI7eKXSrzMc4MjkxZ3/CaDjsJXIU8p+a05jERQ5
	nJm4ScH2y4+SKJnGB03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrWSu-00000009l6g-0tw3;
	Tue, 02 Apr 2024 05:13:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrWSd-00000009krG-0Oba;
	Tue, 02 Apr 2024 05:13:28 +0000
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43250XeW023780;
	Tue, 2 Apr 2024 05:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l64yPSCJgp+48IGOZHO1jI/AZ1J5HFNmmvqOu9zpdzY=;
 b=eLZit5Xz1abJw+49nek6PSQdUCPJAYkT9bX7/6b3MJx8wujY32n/UJe/4wL/LiZrKXlx
 OU6yxBlgmfIZE7AV8Gn6IwJPg47mhRaUSaa3R/Ru0rPhs5pwAbTivNxZCzmhQGXWybsQ
 6ozARNTQ4WX92oO5lwPIkS+R22AAph0OpJoT32sW5mDOeg1cDpYiEuSqOr4A7XHKo6/O
 5eueFrCQjvcSKj/eyi26wFdsdBmSPpG+xG/y01vLgoPCK3BJLugADVTb7ywXcopviarP
 X/i1c2pGnGXEmMvYB/7lYnWHHOjIjWj8kTr+UIb34uXbw6FNDBgnmyEm5+qaoP2DVQOW Dg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8beq8118-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 05:13:16 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4323JlSh027126;
	Tue, 2 Apr 2024 05:13:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x6wf04p3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 05:13:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4325DBmB55378404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 05:13:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16F0820065;
	Tue,  2 Apr 2024 05:13:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48B442004D;
	Tue,  2 Apr 2024 05:13:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 05:13:09 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.69.87.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 303A560442;
	Tue,  2 Apr 2024 16:13:03 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rohan McLure <rmclure@linux.ibm.com>, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Subject: [PATCH v12 07/11] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
Date: Tue,  2 Apr 2024 16:11:47 +1100
Message-ID: <20240402051154.476244-8-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402051154.476244-1-rmclure@linux.ibm.com>
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DHxauK0Mq3ujQSZLMsUJbV8c803p7Tjj
X-Proofpoint-GUID: DHxauK0Mq3ujQSZLMsUJbV8c803p7Tjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 mlxlogscore=939 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_221327_162839_F8780878 
X-CRM114-Status: GOOD (  20.77  )
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

On several powerpc platforms, a page table entry may not imply whether
the relevant mapping is for userspace or kernelspace. Instead, such
platforms infer this by the address which is being accessed.

Add an additional address argument to each of these routines in order to
provide support for page table check on powerpc.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  6 +++---
 arch/riscv/include/asm/pgtable.h |  6 +++---
 arch/x86/include/asm/pgtable.h   |  6 +++---
 mm/page_table_check.c            | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 040c2e664cff..f698b30463f3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1074,17 +1074,17 @@ static inline int pgd_devmap(pgd_t pgd)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && !pmd_present_invalid(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 92bf5c309055..b9663e03475b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -724,17 +724,17 @@ static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 }
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_present(pte) && pte_user(pte);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && pmd_user(pmd);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && pud_user(pud);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index b2b3902f8df4..e898813fce01 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1688,17 +1688,17 @@ static inline bool arch_has_hw_nonleaf_pmd_young(void)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) && (pmd_val(pmd) & _PAGE_USER);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) && (pud_val(pud) & _PAGE_USER);
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 98cccee74b02..aa5e16c8328e 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -155,7 +155,7 @@ void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pte_user_accessible_page(pte)) {
+	if (pte_user_accessible_page(pte, addr)) {
 		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -167,7 +167,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_clear(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -179,7 +179,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_clear(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -195,7 +195,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
 
 	for (i = 0; i < nr; i++)
 		__page_table_check_pte_clear(mm, addr, ptep_get(ptep + i));
-	if (pte_user_accessible_page(pte))
+	if (pte_user_accessible_page(pte, addr))
 		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
 }
 EXPORT_SYMBOL(__page_table_check_ptes_set);
@@ -207,7 +207,7 @@ void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	__page_table_check_pmd_clear(mm, addr, *pmdp);
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
 				     pmd_write(pmd));
 	}
@@ -221,7 +221,7 @@ void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	__page_table_check_pud_clear(mm, addr, *pudp);
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
 				     pud_write(pud));
 	}
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

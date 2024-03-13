Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602CEC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 04:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pwKXnUGrQYCQ4cEpSCXf+eNvqxqmYJ8oe6r3kOa0nI=; b=fLGlf8urKDlbOI
	qciV327ZCbkRccXPby0qWfsfk0npAOXyY5T3N2CKEiSnSE+u1rw/94zjdW8C5hhJYZxHzrrbRbohA
	B6Chu3yhh8wQ8WCeD9setLAOr4WPbdwUjJemRp/d9qJQo/0qznEMc3TpEWVkTYocEzlr4WIMYL8ym
	nsMn+eb32URobRPOZ4TtdBJuPG/EYfKy5gnrm7Hg+XRYnGmPVJTOcbFQ3eHfKNg5CP9p3AtjWqT8R
	sLYtA4qAISRv7aTRCCUT32W4UIfjKZaolJK3cDryMc9De8wUiLMRsea0YTFc2uAFmSjhM7c9AAzEf
	2r/2PB2wSEBzyRnqmuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkGCF-00000008oIT-290G;
	Wed, 13 Mar 2024 04:26:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkGCB-00000008oEa-11IR;
	Wed, 13 Mar 2024 04:26:28 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42D4QEtL014596;
	Wed, 13 Mar 2024 04:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=STvREBvkeDhV2LjKKS4U5bBNaKWBUpidz56ebDC7rzY=;
 b=nMjvO6I6KElsQu/J/sB3UyLsozwot0FqnYSRNWPRHhj5R00qfmPbhg1b3EkIZCGGP1Kx
 s39ZqJuLloEsmZga/S6d4dmx0nz/U+JlVAI1nlq4ZqRJRFGdt1SDP5FFu7mxe+LUdlYP
 UUcoLQKZarDxE9uohgOEMNiNFJD4ZBUFc8of+HzVst/HmJupmQ91XzMWKBnEU/571oB3
 4LOKHyeaJCch4sNwPfg/TfRASs9rYt9k3SD0DSgoadJtjZXZold0TPI+BQuVO9i5Ml5R
 I0DTK0aeDc/zv/5tijwXOAFLJneChUgPXE6knkoosxmpp8s9Y32vRxWPdSnUTmw9CXFU 2g== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu3vrrpq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:26:15 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42D3MvwS015492;
	Wed, 13 Mar 2024 04:21:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws2fyupbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:21:33 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42D4LTU437552568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Mar 2024 04:21:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 984EE20040;
	Wed, 13 Mar 2024 04:21:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A87C52004F;
	Wed, 13 Mar 2024 04:21:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Mar 2024 04:21:28 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 05473603B6;
	Wed, 13 Mar 2024 15:21:26 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rohan McLure <rmclure@linux.ibm.com>, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Subject: [PATCH v10 03/12] mm: Provide addr parameter to page_table_check_pte_set()
Date: Wed, 13 Mar 2024 15:21:08 +1100
Message-ID: <20240313042118.230397-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313042118.230397-1-rmclure@linux.ibm.com>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9hwx7qgxS082LIEWjl6X1DyKYINRjc7z
X-Proofpoint-ORIG-GUID: 9hwx7qgxS082LIEWjl6X1DyKYINRjc7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_04,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=740
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_212627_332300_C7C1344D 
X-CRM114-Status: GOOD (  19.30  )
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

To provide support for powerpc platforms, provide an address parameter
to the page_table_check_pte_set() routine. This parameter is needed on
some powerpc platforms which do not encode whether a mapping is for
user or kernel in the pte. On such platforms, this can be inferred
from the addr parameter.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 include/linux/page_table_check.h | 12 +++++++-----
 include/linux/pgtable.h          |  2 +-
 mm/page_table_check.c            |  4 ++--
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e97c1b7e3ee1..965e35adb206 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -345,7 +345,7 @@ static inline void set_ptes(struct mm_struct *mm,
 			    unsigned long __always_unused addr,
 			    pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pte, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 	__sync_cache_and_tags(pte, nr);
 
 	for (;;) {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4e1ef3a77879..a4b5da7f0704 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -530,7 +530,7 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pteval, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pteval, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
 
 	for (;;) {
 		__set_pte_at(ptep, pteval);
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 5855d690c48a..9243c920ed02 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -17,8 +17,8 @@ void __page_table_check_zero(struct page *page, unsigned int order);
 void __page_table_check_pte_clear(struct mm_struct *mm, pte_t pte);
 void __page_table_check_pmd_clear(struct mm_struct *mm, pmd_t pmd);
 void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
-void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
-		unsigned int nr);
+void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned int nr);
 void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 				pmd_t *pmdp, pmd_t pmd);
 void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
@@ -68,12 +68,13 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
 }
 
 static inline void page_table_check_ptes_set(struct mm_struct *mm,
-		pte_t *ptep, pte_t pte, unsigned int nr)
+					     unsigned long addr, pte_t *ptep,
+					     pte_t pte, unsigned int nr)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_ptes_set(mm, ptep, pte, nr);
+	__page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 }
 
 static inline void page_table_check_pmd_set(struct mm_struct *mm,
@@ -129,7 +130,8 @@ static inline void page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
 }
 
 static inline void page_table_check_ptes_set(struct mm_struct *mm,
-		pte_t *ptep, pte_t pte, unsigned int nr)
+					     unsigned long addr, pte_t *ptep,
+					     pte_t pte, unsigned int nr)
 {
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f6d0e3513948..5da04d056bc3 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -238,7 +238,7 @@ static inline pte_t pte_next_pfn(pte_t pte)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pte, unsigned int nr)
 {
-	page_table_check_ptes_set(mm, ptep, pte, nr);
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
 
 	arch_enter_lazy_mmu_mode();
 	for (;;) {
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 7b9d7b45505d..3a338fee6d00 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -182,8 +182,8 @@ void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud)
 }
 EXPORT_SYMBOL(__page_table_check_pud_clear);
 
-void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
-		unsigned int nr)
+void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte, unsigned int nr)
 {
 	unsigned int i;
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

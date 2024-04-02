Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9E6CD1294
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So2wB/31ftPFppaLA4R6EZ6GY0aIkYKrpUMSHYRG5tE=; b=Itu1eTaVe4M/su
	uK3GZ2seStC0qs50C+8AJXwljpixKmqi+NMupStvdkYsdi9zPu+xv8JWVTlYxb+BnIcDfl90TSpRS
	uKzUaXjwbUUMgBM6KWmcxWz58ybQCSCBRThpBK3IgC7t5M8eIu3/1yTlCwxglgQsA1/ggD0fWxXfH
	Ltzocd+uCRU0FcNORtW4jzqijok1FlBSIKZODZL1TmNnvYXCG8RugJUJ6IP84npSCkb7apTpR5+cW
	zfhFmQ4SIdU1PV4Psl521nw6Xw2+u/isbdpSjUPYGHiEiDVWd3jf2UM/DIhYdydE8S4RGSrLNFg0B
	4dZA7uKBFMV0d4nMb4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrWSZ-00000009kos-0rnx;
	Tue, 02 Apr 2024 05:13:23 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrWSM-00000009kgN-3sAN;
	Tue, 02 Apr 2024 05:13:16 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4325CnAS002584;
	Tue, 2 Apr 2024 05:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=j0dVV4Z9EkxP7qv1ASuZX8jXitHbIGnvCPaTEv9tU5Q=;
 b=lOaIHGtJL4a86JX7jKiDLpTYWiYbNh5YRZ2aJ6Jz5o4k5Qwrjt272CJqF0+ZMLElhaml
 lJHsIttra9MrLC+0jbRoWNxGu4ODeQVxalD8CFWjoprl981ezIyTTn7iMGiy11ZjzA95
 Z3Wu0NfUmE7Vxxhk6um64XtUfw5I2P+WvWR49MP7lW2pX1sa7fUeq+U/6LGmStySpz6P
 6u0FP46xvG02maAJTKEiArG1HU9wjN1Zrrkwy5q+amRfieklJbRZxiNDqywhBAKL8vyK
 /pt7DT/2iScL7028NV7JNlLRC3v6A0WdLTkEoS1Da5X+JBkJfnAmki+LzW88Ch+7LqQT aA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x8bnvr00h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 05:12:48 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4322a3h2008477;
	Tue, 2 Apr 2024 05:12:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6w2tvs68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 05:12:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4325Ci4T49676600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 05:12:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EB7C20043;
	Tue,  2 Apr 2024 05:12:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FD8B20040;
	Tue,  2 Apr 2024 05:12:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 05:12:43 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.69.87.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ED47560442;
	Tue,  2 Apr 2024 16:12:37 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rohan McLure <rmclure@linux.ibm.com>, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Subject: [PATCH v12 01/11] mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud_set()
Date: Tue,  2 Apr 2024 16:11:41 +1100
Message-ID: <20240402051154.476244-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402051154.476244-1-rmclure@linux.ibm.com>
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fMuw8mdf7BBRnhKKMmNAsCetD8vsxw5L
X-Proofpoint-ORIG-GUID: fMuw8mdf7BBRnhKKMmNAsCetD8vsxw5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_02,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_221311_342449_40C1554E 
X-CRM114-Status: GOOD (  20.10  )
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

This reverts commit 6d144436d954 ("mm/page_table_check: remove unused
parameter in [__]page_table_check_pud_set").

Reinstate previously unused parameters for the purpose of supporting
powerpc platforms, as many do not encode user/kernel ownership of the
page in the pte, but instead in the address of the access.

riscv: Respect change to delete mm, addr parameters from __set_pte_at()

This commit also changed calls to __set_pte_at() to use fewer parameters
on riscv. Keep that change rather than reverting it, as the signature of
__set_pte_at() is changed in a different commit.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/x86/include/asm/pgtable.h   |  2 +-
 include/linux/page_table_check.h | 11 +++++++----
 mm/page_table_check.c            |  3 ++-
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index afdd56d26ad7..7334e5526185 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -568,7 +568,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
 						PUD_SIZE >> PAGE_SHIFT);
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 20242402fc11..1e0c0717b3f9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -719,7 +719,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 				pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return __set_pte_at((pte_t *)pudp, pud_pte(pud));
 }
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 315535ffb258..09db55fa8856 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1245,7 +1245,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 			      pud_t *pudp, pud_t pud)
 {
-	page_table_check_pud_set(mm, pudp, pud);
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	native_set_pud(pudp, pud);
 }
 
diff --git a/include/linux/page_table_check.h b/include/linux/page_table_check.h
index 6722941c7cb8..d188428512f5 100644
--- a/include/linux/page_table_check.h
+++ b/include/linux/page_table_check.h
@@ -20,7 +20,8 @@ void __page_table_check_pud_clear(struct mm_struct *mm, pud_t pud);
 void __page_table_check_ptes_set(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 		unsigned int nr);
 void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd);
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud);
+void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
+				pud_t *pudp, pud_t pud);
 void __page_table_check_pte_clear_range(struct mm_struct *mm,
 					unsigned long addr,
 					pmd_t pmd);
@@ -83,13 +84,14 @@ static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
 	__page_table_check_pmd_set(mm, pmdp, pmd);
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
+static inline void page_table_check_pud_set(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp,
 					    pud_t pud)
 {
 	if (static_branch_likely(&page_table_check_disabled))
 		return;
 
-	__page_table_check_pud_set(mm, pudp, pud);
+	__page_table_check_pud_set(mm, addr, pudp, pud);
 }
 
 static inline void page_table_check_pte_clear_range(struct mm_struct *mm,
@@ -134,7 +136,8 @@ static inline void page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp,
 {
 }
 
-static inline void page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp,
+static inline void page_table_check_pud_set(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp,
 					    pud_t pud)
 {
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index af69c3c8f7c2..75167537ebd7 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -210,7 +210,8 @@ void __page_table_check_pmd_set(struct mm_struct *mm, pmd_t *pmdp, pmd_t pmd)
 }
 EXPORT_SYMBOL(__page_table_check_pmd_set);
 
-void __page_table_check_pud_set(struct mm_struct *mm, pud_t *pudp, pud_t pud)
+void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
+				pud_t *pudp, pud_t pud)
 {
 	if (&init_mm == mm)
 		return;
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5054C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 04:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aCALtBQ3dTo8SWAoHHE7V6Y6pRnkVpMKGb94/tXP40A=; b=ceKrnXpGGZ9EeJ
	+Ss2zSsu8wBaxIHptSKS+ncPpinZHdnOKixivqOZUdkT7P2OpgbNdt3cANsT4+l/B87/98HT9qYEd
	EjS8/XwVkV7CIGit2c5MLu8I72YiK7fvBb8z1bwVuaeptskqm3Gr7nQwtP1+aiDhnFFq/L0vRRHFn
	rl2rw2zbWa1B2HJCAoH0WmKUL70grI91ma2vPY8eZkcd1x4D/uPCcnBvV5wl/K4s30qIcvJUPA4yy
	OK06XXPZHnCW4oRFWLliqH2M2rk3lPK81woaU6ZCegoTEzb8XtAIH7vv5aygIn8C6FU500n9yaFoq
	jlOAo2G1N0yH+TYikSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rphpC-0000000CTT2-2VX9;
	Thu, 28 Mar 2024 04:57:14 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rphp0-0000000CTLm-37L5;
	Thu, 28 Mar 2024 04:57:04 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42S4tx4N013005;
	Thu, 28 Mar 2024 04:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=xU+8019gRKxWrsczkMWC/ErUYVwdYO/FhAhFR/RVm60=;
 b=iccpTIz8vYPXKIP2eJIePU5nsDJMJFA2GSH6R3fO8I+vcEtqJnyN0xtQ6zNrA51cTthr
 Y0oflXaaiiYOuyztpk6WxxKWdSp78kdvMxRUZvvCk2aTu8eO99zKiR+8v/K59Zq+oR0c
 gFFhN9qrVToWCLfb5AO06GcAv+zW2GMAdOfe6cvlVTVQVNLlQwmThWGi/8x3pzxouQ5D
 86KjWs4jyRnE8aT8qD0jfc0/D554F5k8EXL/nlR4aFzt6LwjB/duxYjtmAQufJKCnkL4
 FyaguseiQGB7m7n/471q00/U8RBF/mJ2yV5J7HrXJC1GZXq0nRWa3BbSyS2XrD8+tfFu Qw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x4yx4g86b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 04:56:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42S3Z7CL016394;
	Thu, 28 Mar 2024 04:56:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x29dubp34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 04:56:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42S4uZms53019010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 04:56:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D4C72004E;
	Thu, 28 Mar 2024 04:56:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79E7D2004B;
	Thu, 28 Mar 2024 04:56:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 04:56:34 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.66.88.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B856E600C9;
	Thu, 28 Mar 2024 15:56:26 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rohan McLure <rmclure@linux.ibm.com>, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Subject: [PATCH v11 00/11] Support page table check PowerPC
Date: Thu, 28 Mar 2024 15:55:20 +1100
Message-ID: <20240328045535.194800-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cSIaVpwfp7kjBX1hVnXL3iQLz18_xn9w
X-Proofpoint-GUID: cSIaVpwfp7kjBX1hVnXL3iQLz18_xn9w
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_04,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403280027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_215702_932492_9AA224A3 
X-CRM114-Status: GOOD (  20.76  )
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

Support page table check on all PowerPC platforms. This works by
serialising assignments, reassignments and clears of page table
entries at each level in order to ensure that anonymous mappings
have at most one writable consumer, and likewise that file-backed
mappings are not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of stubs must be
defined for all powerpc platforms. Additionally, seperate set_pte_at()
and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

v11:
 * The pud_pfn() stub, which previously had no legitimate users on any
   powerpc platform, now has users in Book3s64 with transparent pages.
   Include a stub of the same name for each platform that does not
   define their own.
 * Drop patch that standardised use of p*d_leaf(), as already included
   upstream in v6.9.
 * Provide fallback definitions of p{m,u}d_user_accessible_page() that
   do not reference p*d_leaf(), p*d_pte(), as they are defined after
   powerpc/mm headers by linux/mm headers.
 * Ensure that set_pte_at_unchecked() has the same checks as
   set_pte_at().

v10:
 * Revert patches that removed address and mm parameters from page table
   check routines, including consuming code from arm64, x86_64 and
   riscv.
 * Implement *_user_accessible_page() routines in terms of pte_user()
   where available (64-bit, book3s) but otherwise by checking the
   address (on platforms where the pte does not imply whether the
   mapping is for user or kernel) 
 * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
   is identical, but prevents double instrumentation.
Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/

v9:
 * Adapt to using the set_ptes() API, using __set_pte_at() where we need
   must avoid instrumentation.
 * Use the logic of *_access_permitted() for implementing
   *_user_accessible_page(), which are required routines for page table
   check.
 * Even though we no longer need p{m,u,4}d_leaf(), still default
   implement these to assist in refactoring out extant
   p{m,u,4}_is_leaf().
 * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
   page table check wants all *user_accessible_page() variants, and we
   would like to default implement the variants in terms of
   pte_user_accessible_page().
 * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
   its constituent calls instead for radix and hash.
Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/

v8:
 * Fix linux/page_table_check.h include in asm/pgtable.h breaking
   32-bit.
Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/

v7:
 * Remove use of extern in set_pte prototypes
 * Clean up pmdp_collapse_flush macro
 * Replace set_pte_at with static inline function
 * Fix commit message for patch 7
Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/

v6:
 * Support huge pages and p{m,u}d accounting.
 * Remove instrumentation from set_pte from kernel internal pages.
 * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
   as access to the mm_struct * is required.
Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/

v5:
Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/

Rohan McLure (11):
  Revert "mm/page_table_check: remove unused parameter in
    [__]page_table_check_pud_set"
  Revert "mm/page_table_check: remove unused parameter in
    [__]page_table_check_pmd_set"
  mm: Provide addr parameter to page_table_check_pte_set()
  Revert "mm/page_table_check: remove unused parameter in
    [__]page_table_check_pud_clear"
  Revert "mm/page_table_check: remove unused parameter in
    [__]page_table_check_pmd_clear"
  Revert "mm/page_table_check: remove unused parameter in
    [__]page_table_check_pte_clear"
  mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
  powerpc: mm: Add pud_pfn() stub
  poweprc: mm: Implement *_user_accessible_page() for ptes
  powerpc: mm: Use set_pte_at_unchecked() for early-boot / internal
    usages
  powerpc: mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 18 +++---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h    |  5 ++
 arch/powerpc/include/asm/pgtable.h           | 18 ++++++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  6 +-
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 11 ++--
 arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
 arch/powerpc/mm/pgtable.c                    | 12 ++++
 arch/powerpc/mm/pgtable_32.c                 |  2 +-
 arch/riscv/include/asm/pgtable.h             | 18 +++---
 arch/x86/include/asm/pgtable.h               | 20 +++---
 include/linux/page_table_check.h             | 67 ++++++++++++--------
 include/linux/pgtable.h                      |  8 +--
 mm/page_table_check.c                        | 39 +++++++-----
 17 files changed, 220 insertions(+), 98 deletions(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

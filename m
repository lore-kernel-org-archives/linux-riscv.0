Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB8C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VagBxRkhJ2++hETK/ZNZTEN7P09D5V5hmtsJCb58dMk=; b=QY9mp3aMKPhxz+
	Hy1ZDnXeZdG2TCe/g2VJUg7XoReRmYeJw6b3B2n/I1J64La11xxwGiOmD3MdQiODtcZ5CVvHgJ5FZ
	eJWD3igvrjXeMR9BG20H9bQPYwSeZ7PIEsPWxNwiySBQRFQzCV6wq+kMk1NmJH0dg+3Mav1NI9R7Z
	UGT0ZzE0xPwfOXNlxxlnv21TZxtGH9nCfjMlnag5FFQsBcODZDPfc1HHv0u/2CHDqKziev/mBTsMY
	84OKMmi3v+Dwo4leoRKgEbkcGLk0quea9ht2a3lB70T6kwmkgbcd97bsMogxLLt3h8mNK4WcDXY+A
	bNpwCjWYf/fnJGk21Stg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkGBb-00000008o1R-0nsQ;
	Wed, 13 Mar 2024 04:25:51 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkGBG-00000008nvq-3vmk;
	Wed, 13 Mar 2024 04:25:44 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42D42LkV022752;
	Wed, 13 Mar 2024 04:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=MX7yFckHZI87TaTlV/AikEhAEV4rPyjoYAPXw7ifS+s=;
 b=ZzKzuayhJQxBAM9Yt6cL7II2uqNvBdtYjAoNaMz8GwzS5OtqzQot8HsdggRKRXaT4Wij
 k028T8+2WKbwkkDewBEGW8ktCNTuIxLpWU8FQLK2ozobQdC0N+dNZB6NPbw0AuDKXb/C
 PbG6fWIWvTQabZz9tpgEt6/93zJyAtUp2fDnXeuTY8+6rSVzN+CLCKKLstv+8m2Y+Vss
 229gEMTqOEmQ6wyqY1XVpQoZQZtIMpzF1Gp4BJOWqWcV7rBDJSwvK98SKii1F6mkLYQa
 NdPNj0d4LE+ebgVfhcrrGm9u/oGccG0M18ac07o6tdSVNmMUawb5LZss9G3mC/nyrAGM tw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu4rx86qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:25:17 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42D2C44s018582;
	Wed, 13 Mar 2024 04:21:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t23200-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:21:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42D4LToD27656830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Mar 2024 04:21:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A872004D;
	Wed, 13 Mar 2024 04:21:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C8B2004B;
	Wed, 13 Mar 2024 04:21:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Mar 2024 04:21:28 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E33CF600C9;
	Wed, 13 Mar 2024 15:21:25 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rohan McLure <rmclure@linux.ibm.com>, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Subject: [PATCH v10 00/12] Support page table check PowerPC
Date: Wed, 13 Mar 2024 15:21:05 +1100
Message-ID: <20240313042118.230397-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uhAfRQ61n49CJYXhe6LHMyDbUPZvMlRC
X-Proofpoint-GUID: uhAfRQ61n49CJYXhe6LHMyDbUPZvMlRC
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_04,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403130030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_212542_641254_2DA0732E 
X-CRM114-Status: GOOD (  19.40  )
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

Rohan McLure (12):
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
  powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
  powerpc: mm: Add common pud_pfn stub for all platforms
  poweprc: mm: Implement *_user_accessible_page() for ptes
  powerpc: mm: Use set_pte_at_unchecked() for early-boot / internal
    usages
  powerpc: mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 18 ++---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h |  7 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 74 +++++++++++++++-----
 arch/powerpc/include/asm/pgtable.h           | 66 ++++++++++-------
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 ++--
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  6 +-
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 25 ++++---
 arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
 arch/powerpc/mm/pgtable.c                    | 17 ++++-
 arch/powerpc/mm/pgtable_32.c                 |  2 +-
 arch/powerpc/mm/pgtable_64.c                 |  6 +-
 arch/powerpc/xmon/xmon.c                     |  6 +-
 arch/riscv/include/asm/pgtable.h             | 18 ++---
 arch/x86/include/asm/pgtable.h               | 20 +++---
 include/linux/page_table_check.h             | 67 +++++++++++-------
 include/linux/pgtable.h                      |  8 +--
 mm/page_table_check.c                        | 39 ++++++-----
 19 files changed, 261 insertions(+), 150 deletions(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

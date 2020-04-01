Return-Path: <SRS0=xVjr=5R=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25E4C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2020 18:39:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34002054F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2020 18:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcDXVm2f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rPs/cbJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34002054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5Ag0BwqV2s+DVWwyTDjgNnbLx8fakjUne3mO5qHzOs=; b=VcDXVm2fENZknb
	0YPfuULzXl61cgtEorBEedBveVPLJs8K7RHDjoqtDxt4ufg9poy6e3zPFDIHQdx7Q39hpNOgweMJP
	OB7JKYT8s50E548/AYZ7i+sLB05pbeQ7R1YyOVRvmqU1GLEuiUr3YBzkpCnAtiHmiVm7S/2P5CNLt
	TTt2v8PNFLbVJH1PNR/dq7Gi+4RJx4R6Z9O8Jh7T7NWvzw4UbjiAdcQBgpyaPZYYeFOEzqvMxWC9S
	l88+Iy+OQzW0DhyDjjNWRGScUCP+SxjqTw6S73Ul6ijVYEOyAkeB3rOa4lnL7Irf7V1E4jOMDVJsz
	DjAo/+xcp/o/fBQE43hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJiGz-0002Cs-TU; Wed, 01 Apr 2020 18:39:33 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJiGw-0002BS-DY; Wed, 01 Apr 2020 18:39:32 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031IctXl187349;
 Wed, 1 Apr 2020 18:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=/5Ag0BwqV2s+DVWwyTDjgNnbLx8fakjUne3mO5qHzOs=;
 b=rPs/cbJ343KJFmPfRF7d1+xyeTV5Q7rO18NfD2c5LrNh+9zmvhwNTSuNGLZzAEPHT8cj
 L+/yhx+lkH592qSXQEy/31SB2YcV4nlG0Wi5N0tpXaarIjE9XcGVSMawfGNjZe3xzq+W
 DsG5POdYUjkBoDDjZwFe/FZF0K1Z+T7IXzQPyPLtUJIBYer0OGlXFXomks264fZzTc+0
 MlI3quSZ6eOoy9TxAVe6p9AKVjRueAnxUFnw36ULgb3ZivrCImXxLcjNcMa5mxCru7n+
 nOIN8dIldEO4Al4Jib4VxNyh/Z3qgOS3nuIZ5b0vBHjZhkGirnojgWw2TtG28EZ9eqbR pQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 303aqhqmxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Apr 2020 18:38:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031IcUxW175889;
 Wed, 1 Apr 2020 18:38:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 302ga0ym95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Apr 2020 18:38:40 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 031IccWI006129;
 Wed, 1 Apr 2020 18:38:38 GMT
Received: from monkey.oracle.com (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 01 Apr 2020 11:38:38 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
Date: Wed,  1 Apr 2020 11:38:18 -0700
Message-Id: <20200401183819.20647-4-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401183819.20647-1-mike.kravetz@oracle.com>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9578
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_113930_590865_5082BC93 
X-CRM114-Status: GOOD (  24.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Mina Almasry <almasrymina@google.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The routine hugetlb_add_hstate prints a warning if the hstate already
exists.  This was originally done as part of kernel command line
parsing.  If 'hugepagesz=' was specified more than once, the warning
	pr_warn("hugepagesz= specified twice, ignoring\n");
would be printed.

Some architectures want to enable all huge page sizes.  They would
call hugetlb_add_hstate for all supported sizes.  However, this was
done after command line processing and as a result hstates could have
already been created for some sizes.  To make sure no warning were
printed, there would often be code like:
	if (!size_to_hstate(size)
		hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)

The only time we want to print the warning is as the result of command
line processing.  So, remove the warning from hugetlb_add_hstate and
add it to the single arch independent routine processing "hugepagesz=".
After this, calls to size_to_hstate() in arch specific code can be
removed and hugetlb_add_hstate can be called without worrying about
warning messages.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/arm64/mm/hugetlbpage.c   | 16 ++++------------
 arch/powerpc/mm/hugetlbpage.c |  3 +--
 arch/riscv/mm/hugetlbpage.c   |  2 +-
 arch/sparc/mm/init_64.c       | 19 ++++---------------
 arch/x86/mm/hugetlbpage.c     |  2 +-
 mm/hugetlb.c                  |  9 ++++++---
 6 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index f706b821aba6..21fa98b51e00 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -441,22 +441,14 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
 	clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
 }
 
-static void __init add_huge_page_size(unsigned long size)
-{
-	if (size_to_hstate(size))
-		return;
-
-	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
-}
-
 static int __init hugetlbpage_init(void)
 {
 #ifdef CONFIG_ARM64_4K_PAGES
-	add_huge_page_size(PUD_SIZE);
+	hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 #endif
-	add_huge_page_size(CONT_PMD_SIZE);
-	add_huge_page_size(PMD_SIZE);
-	add_huge_page_size(CONT_PTE_SIZE);
+	hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
 
 	return 0;
 }
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 2c3fa0a7787b..4d5ed1093615 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -584,8 +584,7 @@ static int __init add_huge_page_size(unsigned long long size)
 	if (!arch_hugetlb_valid_size((unsigned long)size))
 		return -EINVAL;
 
-	if (!size_to_hstate(size))
-		hugetlb_add_hstate(shift - PAGE_SHIFT);
+	hugetlb_add_hstate(shift - PAGE_SHIFT);
 	return 0;
 }
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 4e5d7e9f0eef..932dadfdca54 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -26,7 +26,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 static __init int gigantic_pages_init(void)
 {
 	/* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
-	if (IS_ENABLED(CONFIG_64BIT) && !size_to_hstate(1UL << PUD_SHIFT))
+	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 	return 0;
 }
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 4618f96fd30f..ae819a16d07a 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -325,23 +325,12 @@ static void __update_mmu_tsb_insert(struct mm_struct *mm, unsigned long tsb_inde
 }
 
 #ifdef CONFIG_HUGETLB_PAGE
-static void __init add_huge_page_size(unsigned long size)
-{
-	unsigned int order;
-
-	if (size_to_hstate(size))
-		return;
-
-	order = ilog2(size) - PAGE_SHIFT;
-	hugetlb_add_hstate(order);
-}
-
 static int __init hugetlbpage_init(void)
 {
-	add_huge_page_size(1UL << HPAGE_64K_SHIFT);
-	add_huge_page_size(1UL << HPAGE_SHIFT);
-	add_huge_page_size(1UL << HPAGE_256MB_SHIFT);
-	add_huge_page_size(1UL << HPAGE_2GB_SHIFT);
+	hugetlb_add_hstate(HPAGE_64K_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(HPAGE_256MB_SHIFT - PAGE_SHIFT);
+	hugetlb_add_hstate(HPAGE_2GB_SHIFT - PAGE_SHIFT);
 
 	return 0;
 }
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 937d640a89e3..cf5781142716 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -195,7 +195,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 static __init int gigantic_pages_init(void)
 {
 	/* With compaction or CMA we can allocate gigantic pages at runtime */
-	if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
+	if (boot_cpu_has(X86_FEATURE_GBPAGES))
 		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
 	return 0;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 02b13ee26790..72a4343509d5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3216,8 +3216,7 @@ static int __init hugetlb_init(void)
 		}
 
 		default_hstate_size = HPAGE_SIZE;
-		if (!size_to_hstate(default_hstate_size))
-			hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
+		hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
 	}
 	default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
 	if (default_hstate_max_huge_pages) {
@@ -3255,7 +3254,6 @@ void __init hugetlb_add_hstate(unsigned int order)
 	unsigned long i;
 
 	if (size_to_hstate(PAGE_SIZE << order)) {
-		pr_warn("hugepagesz= specified twice, ignoring\n");
 		return;
 	}
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
@@ -3330,6 +3328,11 @@ static int __init hugepagesz_setup(char *s)
 		return 0;
 	}
 
+	if (size_to_hstate(size)) {
+		pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n", s);
+		return 0;
+	}
+
 	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
 	return 1;
 }
-- 
2.25.1



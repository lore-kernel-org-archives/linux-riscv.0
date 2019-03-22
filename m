Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE33C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 10:42:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5852921902
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 10:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XYvrd5Mx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5852921902
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrwbmBbKDTPwjiW6EgIuVAN1jVSDLFnnjNFjtI++B6I=; b=XYvrd5Mx1t1gpz
	kG0VbRnZNp3CJ/5uViS5LK9cHt/A9eiD0VTxxRTXGf0walRzquo1ayfgIg/knChgXNrPlVqs/Jj0A
	+/CGILZGxa+KrKr+6HII3ooUoQF0JzfflzagjfHDnd2qQEVgnEPlIlhusUS52VR80osyvqYgFQfD6
	6lm8DxCBpc2zmC8sZQ4i6c08fFW4pLYYeKKOC3fMSYDJuA2tOuQv7AR24oKciDOP3qJEpA6BsEXJp
	S/+SPMCKWOPVsJgLvmSYRN99qWoBzqdqJdAyjwB2pzm5eNheeWaeZLIs5mPXQsXEsaZjdso8DobzT
	jZ23+G+y4xdUf4YdpFpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7Hd1-0005Sq-Vn; Fri, 22 Mar 2019 10:42:23 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Hcy-0005S5-6x
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 10:42:21 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2MAXW8w101328
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 06:42:19 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rcx150cq1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 06:42:19 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Fri, 22 Mar 2019 10:42:07 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Mar 2019 10:42:05 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2MAgDdw42139672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Mar 2019 10:42:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2385F52052;
 Fri, 22 Mar 2019 10:42:13 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.199])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 5DC1952063;
 Fri, 22 Mar 2019 10:42:12 +0000 (GMT)
Date: Fri, 22 Mar 2019 12:42:10 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <anup@brainfault.org>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19032210-0016-0000-0000-00000265E3BC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032210-0017-0000-0000-000032C10823
Message-Id: <20190322104209.GB24367@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903220080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_034220_363224_2A471000 
X-CRM114-Status: GOOD (  26.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Mar 22, 2019 at 11:46:24AM +0530, Anup Patel wrote:
> Hi Palmer,
> 
> The 32bit kernel booting is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
> affecting setup_vm() movement from kernel/setup.c to mm/init.c.
> 
> There is no issue with 64bit kernel booting.
> 
> The "[PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code model"
> fixes this issue.
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1959102.html
> 
> If possible please include above patch as Linux-5.1-rc1 fix.

I'm not convinced that it's the best solution. Multiple __load_pa() and
__load_va() conversions make code unreadable.
Is there any reason swapper_pg_dir cannot be setup after 'relocate'? It'll
save a lot of churn for the current fix and for the addition of 4K mappings

I've drafted a patch that separates trampoline_pd_dir and swapper_pg_dir
setup, if it works, the __load_pa() and __load_va() conversions can be
applied only to the trampoline initialization. I don't have riscv hardware,
so it's compile tested only.

From d1f6f68012c84e188711954f58d63c0a3ba005c5 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Fri, 22 Mar 2019 12:34:31 +0200
Subject: [PATCH] riscv: split trampoline_pg_dir and swapper_pg_dir
 initialization

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/riscv/kernel/head.S |  7 ++-----
 arch/riscv/mm/init.c     | 33 +++++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd..fe0fc70 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -62,8 +62,9 @@ clear_bss_done:
 
 	/* Initialize page tables and relocate to virtual addresses */
 	la sp, init_thread_union + THREAD_SIZE
-	call setup_vm
+	call setup_trampoline
 	call relocate
+	call setup_vm
 
 	/* Restore C environment */
 	la tp, init_task
@@ -117,10 +118,6 @@ relocate:
 .option norelax
 	la gp, __global_pointer$
 .option pop
-
-	/* Switch to kernel page tables */
-	csrw sptbr, a2
-
 	ret
 
 .Lsecondary_start:
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b379a75..1742763 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -187,11 +187,6 @@ asmlinkage void __init setup_vm(void)
 	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
-			__pgprot(_PAGE_TABLE));
-	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
-
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 
@@ -209,9 +204,6 @@ asmlinkage void __init setup_vm(void)
 		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
 				__pgprot(_PAGE_TABLE));
 #else
-	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
-		pfn_pgd(PFN_DOWN(pa), prot);
-
 	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
 		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
 
@@ -223,4 +215,29 @@ asmlinkage void __init setup_vm(void)
 		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
 				__pgprot(_PAGE_TABLE));
 #endif
+	csr_write(sptbr, virt_to_pfn(swapper_pg_dir) | SATP_MODE);
+}
+
+asmlinkage void __init setup_trampoline(void)
+{
+	extern char _start;
+	uintptr_t pa = (uintptr_t) &_start;
+	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
+
+	va_pa_offset = PAGE_OFFSET - pa;
+	pfn_base = PFN_DOWN(pa);
+
+	/* Sanity check alignment and size */
+	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
+	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
+
+#ifndef __PAGETABLE_PMD_FOLDED
+	trampoline_pg_dir[pgd_index(PAGE_OFFSET)] =
+		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
+			__pgprot(_PAGE_TABLE));
+	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
+
+#else
+	trampoline_pg_dir[pgd_index(PAGE_OFFSET)] = pfn_pgd(PFN_DOWN(pa), prot);
+#endif
 }
-- 
2.7.4

 
> Regards,
> Anup
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

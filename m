Return-Path: <SRS0=cKew=DB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E73C4727D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 13:29:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012452076D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2020 13:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owdvFbBc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SctItSWY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012452076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vHtcFSeoc1M/TxnDdbwenxSYj1lnwTtRoSq1CLpaWIo=; b=owdvFbBcQduBZ8YcydKWBZlOF
	wwA/G6cjPCNimLGxptUtNeELSIgeMl8Rf+y2gr63NPgRtSyIsaJPkfFBIiJUyWoe9I0OFbROlyhtT
	WLZjZh/jft7JbGJ4/1HfAHKXZpWCyBRkH6uM7xDu4WOV4SSMM8FbWxnB/k7/mT+5s3bw/YDaCIIq8
	gbr6N5lw0CL+ndg5a/iIcOoS/GUY6bx9m3KJ5WR1H+1x0pP7sOcoSrgTcHABR+nAQVmkN3gd7i0+P
	B/hVbdohr3jUvH2A3kLaEybVZIfTwmbXGE69aHN8J5sbl3I6+q0LPBSopx9X5iBqTqbGlvS/1hZX7
	oF7RfOHHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLRJf-0002OZ-4m; Thu, 24 Sep 2020 13:29:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRJV-0002Kp-Pc; Thu, 24 Sep 2020 13:29:34 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CD992344C;
 Thu, 24 Sep 2020 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600954173;
 bh=RS/S5Ylr1E5JO8x8/BQ35wP+NdhJenOz2B47Vap/Jzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SctItSWYSjVnZZHThfvGYMvtIPIkq+1VVfeu4pNaKBgGoFW2LxYAlntCIFFsUuBVW
 mBOdM+KDyJ1TLvIuO1eTkBEj4QKdri1PFf8MELAhxFaLy7gR96gqF+1v//RtKfBxj2
 wNFAzvwhzUE0DvW6q5W99RezmuwNkpeMu6saq25c=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 1/6] mm: add definition of PMD_PAGE_ORDER
Date: Thu, 24 Sep 2020 16:28:59 +0300
Message-Id: <20200924132904.1391-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924132904.1391-1-rppt@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_092934_051601_FDA25F8A 
X-CRM114-Status: GOOD (  20.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The definition of PMD_PAGE_ORDER denoting the number of base pages in the
second-level leaf page is already used by DAX and maybe handy in other
cases as well.

Several architectures already have definition of PMD_ORDER as the size of
second level page table, so to avoid conflict with these definitions use
PMD_PAGE_ORDER name and update DAX respectively.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 fs/dax.c                | 11 ++++-------
 include/linux/pgtable.h |  3 +++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 994ab66a9907..c0b9aa4bda9e 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -49,9 +49,6 @@ static inline unsigned int pe_order(enum page_entry_size pe_size)
 #define PG_PMD_COLOUR	((PMD_SIZE >> PAGE_SHIFT) - 1)
 #define PG_PMD_NR	(PMD_SIZE >> PAGE_SHIFT)
 
-/* The order of a PMD entry */
-#define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
-
 static wait_queue_head_t wait_table[DAX_WAIT_TABLE_ENTRIES];
 
 static int __init init_dax_wait_table(void)
@@ -98,7 +95,7 @@ static bool dax_is_locked(void *entry)
 static unsigned int dax_entry_order(void *entry)
 {
 	if (xa_to_value(entry) & DAX_PMD)
-		return PMD_ORDER;
+		return PMD_PAGE_ORDER;
 	return 0;
 }
 
@@ -1455,7 +1452,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct address_space *mapping = vma->vm_file->f_mapping;
-	XA_STATE_ORDER(xas, &mapping->i_pages, vmf->pgoff, PMD_ORDER);
+	XA_STATE_ORDER(xas, &mapping->i_pages, vmf->pgoff, PMD_PAGE_ORDER);
 	unsigned long pmd_addr = vmf->address & PMD_MASK;
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
 	bool sync;
@@ -1514,7 +1511,7 @@ static vm_fault_t dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
 	 * entry is already in the array, for instance), it will return
 	 * VM_FAULT_FALLBACK.
 	 */
-	entry = grab_mapping_entry(&xas, mapping, PMD_ORDER);
+	entry = grab_mapping_entry(&xas, mapping, PMD_PAGE_ORDER);
 	if (xa_is_internal(entry)) {
 		result = xa_to_internal(entry);
 		goto fallback;
@@ -1680,7 +1677,7 @@ dax_insert_pfn_mkwrite(struct vm_fault *vmf, pfn_t pfn, unsigned int order)
 	if (order == 0)
 		ret = vmf_insert_mixed_mkwrite(vmf->vma, vmf->address, pfn);
 #ifdef CONFIG_FS_DAX_PMD
-	else if (order == PMD_ORDER)
+	else if (order == PMD_PAGE_ORDER)
 		ret = vmf_insert_pfn_pmd(vmf, pfn, FAULT_FLAG_WRITE);
 #endif
 	else
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e8cbc2e795d5..b0389078df39 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -28,6 +28,9 @@
 #define USER_PGTABLES_CEILING	0UL
 #endif
 
+/* Number of base pages in a second level leaf page */
+#define PMD_PAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
+
 /*
  * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
  *
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

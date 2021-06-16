Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F2BC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD38061107
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD38061107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3zI/SKvkA9/Y8OE9p+Zhz9y4xhBxLbxwdh+H1/YUSg=; b=XhNUud39OQEUNy
	dTAdrwvssQNPdAt4axP0zrT2sigkB37igUBNflfX+aakU+nFkFVjcjdSRF8i92EdM0VD5COdCyTYV
	aPZCudUq4zLHQVxfJ/zrBg/jcyWFUwGpqG7iPsIebtzxUXdUIwnPm9lr6ZbowLvCK9XdPlYOQ8NnL
	3PlxHZOVXMLKU/URjsunoPhdVOUSv4r/bijo/rOIChJWSZr95sEczfQIokibis3s07Z+VHfqhz+yG
	4dMIIUvfubIc/GArOlYIqCTkQiLqvobF2LM/PjhRIaRps7UB6fIGrYPevB0PfFKX3KPrDuA5VS+sX
	Y3j6rpp7j1gxaQrMOj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltWGk-006gHa-1O; Wed, 16 Jun 2021 14:11:50 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltWGg-006gFG-PA; Wed, 16 Jun 2021 14:11:48 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GE3if7123200; Wed, 16 Jun 2021 10:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=UupLhvjLfZlZazopahCfbi8y4ZD+5NPeCGAMnXLT4ms=;
 b=GrLMvthA5rC1tfSKNoifYju5lbcM6AVRhpciJIhco5ODPwvIuG/i+iL3+pVf7j4UJ1WF
 PGYaVz7ew3/53QaOnVSASRqkobVcEnKFWTjhq0p/q8mKSyR0ofHH1LwNNXrQeeerOqIb
 +HOSDDggMYaoURLdXQ5xqUBEnij8WeBYnqX/Oe8izH8QLGGpWJ0kDWBf03VSrsGQnbF/
 u9CQFRxLZerTDx0fi67aJi2oY99ZpMkFgvW5jSSi0e92rE1AUSv4LWE2n94Ai9AFlQn4
 AncDpb2tzMhXF2ljfNp0nN1hhTwW6Kl8A10XfjK0otq9SSx9wrvQtt/B80xNkfyJhnoE pw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397h7dkfyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 10:11:41 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GE4Ld3002192;
 Wed, 16 Jun 2021 14:11:40 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 394mja10ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 14:11:40 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GEBdCb31064526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 14:11:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09094112081;
 Wed, 16 Jun 2021 14:11:39 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CE94112084;
 Wed, 16 Jun 2021 14:11:35 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.77.206.69])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 14:11:35 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: kbuild-all@lists.01.org
Subject: Re: +
 mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
 added to -mm tree
In-Reply-To: <202106162159.MurvDMy6-lkp@intel.com>
References: <20210615233808.hzjGO1gF2%akpm@linux-foundation.org>
 <202106162159.MurvDMy6-lkp@intel.com>
Date: Wed, 16 Jun 2021 19:41:32 +0530
Message-ID: <87zgvpnbl7.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8rMD4mzHJNBx7M8D0iDqW7mllc1ilLVc
X-Proofpoint-ORIG-GUID: 8rMD4mzHJNBx7M8D0iDqW7mllc1ilLVc
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1011 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_071146_872990_8764242C 
X-CRM114-Status: GOOD (  29.42  )
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

kernel test robot <lkp@intel.com> writes:

> Hi,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on powerpc/next]
> [also build test WARNING on tip/x86/mm asm-generic/master linus/master sparc/master v5.13-rc6 next-20210615]
> [cannot apply to sparc-next/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/akpm-linux-foundation-org/mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t-patch-added-to-mm-tree/20210616-161816
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/2ccec57c1def84dab91722c14fd5907ed7423426
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review akpm-linux-foundation-org/mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t-patch-added-to-mm-tree/20210616-161816
>         git checkout 2ccec57c1def84dab91722c14fd5907ed7423426
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    arch/m68k/mm/motorola.c: In function 'kernel_ptr_table':
>>> arch/m68k/mm/motorola.c:265:8: warning: assignment to 'long unsigned int' from 'pmd_t *' {aka 'struct <anonymous> *'} makes integer from pointer without a cast [-Wint-conversion]
>      265 |    pmd = pgd_page_vaddr(kernel_pg_dir[i]);
>          |        ^
>    arch/m68k/mm/motorola.c: At top level:
>    arch/m68k/mm/motorola.c:390:13: warning: no previous prototype for 'paging_init' [-Wmissing-prototypes]
>      390 | void __init paging_init(void)
>          |             ^~~~~~~~~~~
>
>
> vim +265 arch/m68k/mm/motorola.c
>
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  248  
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  249  static pmd_t * __init kernel_ptr_table(void)
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  250  {
> ef9285f69f0efb Peter Zijlstra     2020-01-31  251  	if (!last_pmd_table) {
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  252  		unsigned long pmd, last;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  253  		int i;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  254  
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  255  		/* Find the last ptr table that was used in head.S and
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  256  		 * reuse the remaining space in that page for further
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  257  		 * ptr tables.
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  258  		 */
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  259  		last = (unsigned long)kernel_pg_dir;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  260  		for (i = 0; i < PTRS_PER_PGD; i++) {
> 60e50f34b13e9e Mike Rapoport      2019-12-04  261  			pud_t *pud = (pud_t *)(&kernel_pg_dir[i]);
> 60e50f34b13e9e Mike Rapoport      2019-12-04  262  
> 60e50f34b13e9e Mike Rapoport      2019-12-04  263  			if (!pud_present(*pud))
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  264  				continue;
> 60e50f34b13e9e Mike Rapoport      2019-12-04 @265  			pmd = pgd_page_vaddr(kernel_pg_dir[i]);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  266  			if (pmd > last)
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  267  				last = pmd;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  268  		}
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  269  
> ef9285f69f0efb Peter Zijlstra     2020-01-31  270  		last_pmd_table = (pmd_t *)last;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  271  #ifdef DEBUG
> ef9285f69f0efb Peter Zijlstra     2020-01-31  272  		printk("kernel_ptr_init: %p\n", last_pmd_table);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  273  #endif
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  274  	}
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  275  
> ef9285f69f0efb Peter Zijlstra     2020-01-31  276  	last_pmd_table += PTRS_PER_PMD;
> 41f1bf37a63ecd Geert Uytterhoeven 2020-08-26  277  	if (PAGE_ALIGNED(last_pmd_table)) {
> 7e158826564fbb Geert Uytterhoeven 2020-08-26  278  		last_pmd_table = memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
> ef9285f69f0efb Peter Zijlstra     2020-01-31  279  		if (!last_pmd_table)
> 8a7f97b902f4fb Mike Rapoport      2019-03-11  280  			panic("%s: Failed to allocate %lu bytes align=%lx\n",
> 8a7f97b902f4fb Mike Rapoport      2019-03-11  281  			      __func__, PAGE_SIZE, PAGE_SIZE);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  282  
> ef9285f69f0efb Peter Zijlstra     2020-01-31  283  		clear_page(last_pmd_table);
> ef9285f69f0efb Peter Zijlstra     2020-01-31  284  		mmu_page_ctor(last_pmd_table);
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  285  	}
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  286  
> ef9285f69f0efb Peter Zijlstra     2020-01-31  287  	return last_pmd_table;
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  288  }
> ^1da177e4c3f41 Linus Torvalds     2005-04-16  289  
>

We may want to fixup pgd_page_vaddr correctly later. pgd_page_vaddr() gets
cast to different pointer types based on architecture. But for now this
should work? This ensure we keep the pgd_page_vaddr() same as before. 

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 982de5102fc1..2f1d0aad645c 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -42,7 +42,7 @@ static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
 #define pgd_page(pgd)				(p4d_page((p4d_t){ pgd }))
-#define pgd_page_vaddr(pgd)			(p4d_pgtable((p4d_t){ pgd }))
+#define pgd_page_vaddr(pgd)			((unsigned long)(p4d_pgtable((p4d_t){ pgd })))
 
 /*
  * allocating and freeing a p4d is trivial: the 1-entry p4d is

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

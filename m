Return-Path: <SRS0=JF02=FK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40F2C4361B
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Dec 2020 10:56:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0D022D2C
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Dec 2020 10:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F0D022D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJV+QGMlxcMqXvMghQf+DPpx2rerdP0J+jNb/PStmvo=; b=aAD8KicU2lJoaVuJZwCwWezWo
	C0CvYYpc3gVKhXf7kjUqpmTNJuTUIHsoOOcQePV2KG+K7qehfCG/jcKfTwzqK190PNTBoPhQRHv1k
	g0LX9FgmtB+fnXftoBB2NgTEUxT4J6QGyYgXFTv1WFIBfwT757abrZdlPlRJHFfhhpCW3x0KTZSdk
	uN+s6jLCwJwBd78Iooi7DWSwLGiaOuxJbjewrawIm28pzbzjj3jM2mIB7+BceGo0P90ss1LdAXZKp
	BGoDcixSX/m63jVn5DDS+aALmROUTmjJvbhOFNmWsCmd+j7MbK7umwtwaJVvLgycrwVMwmgpM/J+R
	i6ECUokpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klri0-0004Pu-VZ; Sun, 06 Dec 2020 10:56:05 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klrhy-0004PK-9t
 for linux-riscv@lists.infradead.org; Sun, 06 Dec 2020 10:56:03 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B6AhkZb137926; Sun, 6 Dec 2020 05:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=pWPaikmXQWOK0gMD8XnOnJOqU7asUYn2SaFC+RxZe3A=;
 b=aRqmF4x2s82xDnwqyfqiSqM4+lFQ7QsjPKxf77YDGw15lTI7XLTRcHME+Olw29WcvLx7
 HRFioPaojJu9aMgdSlsvyJPn77FBgRlHzKBLWLJSSbapkV9OJBecXcZRRXN1KC8JhUyj
 ePhAJFkNY4KYHJSsqaATwOjOgj2RnzfNsVm12x3WuydPdJ53tVUnAiMU2eFcUdHi+jIe
 gX2+5fZHm6rQp4luOgd3pdwq5hyux3mzbuR9sUwwRHEqyS1hoscDjVAL1kkdFZTtQ/2A
 ovsVW+kjqRJ2htFNixXVnUVIAIw3F0hfMlNbxEbFqjJG+ttRZZl1IqpCf6262fK1Rrhu Sg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 358t8puhsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 05:55:52 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B6AqIp4019154;
 Sun, 6 Dec 2020 10:55:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3583svgyn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 10:55:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B6Atmfg8651340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 6 Dec 2020 10:55:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 405F111C04A;
 Sun,  6 Dec 2020 10:55:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4926311C04C;
 Sun,  6 Dec 2020 10:55:47 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.50.18])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun,  6 Dec 2020 10:55:47 +0000 (GMT)
Date: Sun, 6 Dec 2020 12:55:45 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 10963/10966] <stdin>:1539:2: warning:
 #warning syscall memfd_secret not implemented
Message-ID: <20201206105545.GA123287@linux.ibm.com>
References: <202012042347.CetZAZAg-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202012042347.CetZAZAg-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-06_06:2020-12-04,
 2020-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012060062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_055602_452079_C7DB6F0C 
X-CRM114-Status: GOOD (  28.48  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

(added RISC-V maintainers)

On Fri, Dec 04, 2020 at 11:41:55PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2996bd3f6ca9ea529b40c369a94b247657abdb4d
> commit: f742050435413d2fe8deba095304788d26a8a144 [10963/10966] arch, mm: wire up memfd_secret system call were relevant
> config: riscv-nommu_k210_defconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f742050435413d2fe8deba095304788d26a8a144
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout f742050435413d2fe8deba095304788d26a8a144
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented [-Wcpp]
> --
>    arch/riscv/kernel/asm-offsets.c:14:6: warning: no previous prototype for 'asm_offsets' [-Wmissing-prototypes]
>       14 | void asm_offsets(void)
>          |      ^~~~~~~~~~~
> >> <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented [-Wcpp]

The availabilty of memfd_secret depends on ARCH_HAS_SET_DIRECT_MAP and
on riscv this option is selected for nommu.

The patch below makes ARCH_HAS_SET_DIRECT_MAP dependent on MMU, which
makes sense regardless of memfd_secret.

From 26cde530ac050bf8a7417230a32daa6fb7c39e9b Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Sun, 6 Dec 2020 12:42:10 +0200
Subject: [PATCH] riscv: make ARCH_HAS_SET_DIRECT_MAP dependent on MMU

The direct map manipulation methods are implemented in
arch/riscv/mm/pageattr.c and they are only built when CONFIG_MMU=y.

Besides, there is not much point in having these functions for nommu
variant.

Update Kconfig to select ARCH_HAS_SET_DIRECT_MAP if MMU is enabled and hide
declarations of the related functions inside '#ifdef CONFIG_MMU' so that
generic stubs would be used for nommu case.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/riscv/Kconfig                  | 2 +-
 arch/riscv/include/asm/set_memory.h | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index af5b858ed8a1..31ff944f092e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,7 +25,7 @@ config RISCV
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_PTE_SPECIAL
-	select ARCH_HAS_SET_DIRECT_MAP
+	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 1aaf2720b8f6..fc37eb03833b 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -17,6 +17,9 @@ int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 int set_memory_rw_nx(unsigned long addr, int numpages);
 void protect_kernel_text_data(void);
+int set_direct_map_invalid_noflush(struct page *page, int numpages);
+int set_direct_map_default_noflush(struct page *page, int numpages);
+bool kernel_page_present(struct page *page);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
@@ -26,10 +29,6 @@ static inline void protect_kernel_text_data(void) {};
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
-int set_direct_map_invalid_noflush(struct page *page, int numpages);
-int set_direct_map_default_noflush(struct page *page, int numpages);
-bool kernel_page_present(struct page *page);
-
 #endif /* __ASSEMBLY__ */
 
 #ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

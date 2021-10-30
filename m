Return-Path: <SRS0=We8W=PS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB425C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BEC360F4C
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Oct 2021 03:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BEC360F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdrsKfIU+AJ1PWcCNm8EqT0iqMujMtdUXvvTx2NBN2g=; b=VuLbyPcWtQwWnf
	A+qgMPWdMWyS4oKJjAe7GszD0A13oDEgzq/3CvFbXgxgjk16FF5cahH1WDEZ9jJcRZYZ7Pnmu7CVu
	V31qf+sIBfWExGYXTMB/rLtfiSxLy6+5uFR6UsYILcQBf298lHE2onNKvUhHcDtzOlKlyqzCRjhPI
	CRWdheQ/uUQ92Wyxl1qieNtjmUvi4Q31EJd0oDg17zqCz4xKTwxwEodkb5qywUdxNps2AeVIwv8u0
	XpG6/lJYKWKrYEMVUmDQffwc+wjUzJCqQ+BrVwNPzrUOgJfdyKPY+TkLaA5GFMQ2CJz1jIUg2DnGM
	sHj8O9lxJd4CTp+JeB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgerk-00Cfzn-FP; Sat, 30 Oct 2021 03:17:08 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgere-00CfvQ-0l; Sat, 30 Oct 2021 03:17:04 +0000
Received: from dggeme706-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hh4Cr3z0Kz1DHpk;
 Sat, 30 Oct 2021 11:14:48 +0800 (CST)
Received: from huawei.com (10.67.174.53) by dggeme706-chm.china.huawei.com
 (10.1.199.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Sat, 30
 Oct 2021 11:16:47 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <ebiederm@xmission.com>, <mick@ics.forth.gr>, <jszhang@kernel.org>,
 <guoren@linux.alibaba.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>, <changbin.du@intel.com>, <alex@ghiti.fr>
CC: <liaochang1@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kexec@lists.infradead.org>
Subject: [PATCH 1/3] kexec_file: Fix kexec_file.c build error for riscv
 platform
Date: Sat, 30 Oct 2021 11:18:30 +0800
Message-ID: <20211030031832.165457-2-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211030031832.165457-1-liaochang1@huawei.com>
References: <20211030031832.165457-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme706-chm.china.huawei.com (10.1.199.102)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_201702_626618_5AA2797D 
X-CRM114-Status: GOOD (  12.47  )
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

When CONFIG_KEXEC_FILE is set for riscv platform, the compilation of
kernel/kexec_file.c generate build error:

kernel/kexec_file.c: In function 'crash_prepare_elf64_headers':
./arch/riscv/include/asm/page.h:110:71: error: request for member 'virt_addr' in something not a structure or union
  110 |  ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < kernel_map.virt_addr))
      |                                                                       ^
./arch/riscv/include/asm/page.h:131:2: note: in expansion of macro 'is_linear_mapping'
  131 |  is_linear_mapping(_x) ?       \
      |  ^~~~~~~~~~~~~~~~~
./arch/riscv/include/asm/page.h:140:31: note: in expansion of macro '__va_to_pa_nodebug'
  140 | #define __phys_addr_symbol(x) __va_to_pa_nodebug(x)
      |                               ^~~~~~~~~~~~~~~~~~
./arch/riscv/include/asm/page.h:143:24: note: in expansion of macro '__phys_addr_symbol'
  143 | #define __pa_symbol(x) __phys_addr_symbol(RELOC_HIDE((unsigned long)(x), 0))
      |                        ^~~~~~~~~~~~~~~~~~
kernel/kexec_file.c:1327:36: note: in expansion of macro '__pa_symbol'
 1327 |   phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);

This occurs is because the "kernel_map" referenced in macro
is_linear_mapping()  is suppose to be the one of struct kernel_mapping
defined in arch/riscv/mm/init.c, but the 2nd argument of
crash_prepare_elf64_header() has same symbol name, in expansion of macro
is_linear_mapping in function crash_prepare_elf64_header(), "kernel_map"
actually is the local variable.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 include/linux/kexec.h | 2 +-
 kernel/kexec_file.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0c994ae37729..25b91cca8077 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -221,7 +221,7 @@ struct crash_mem {
 extern int crash_exclude_mem_range(struct crash_mem *mem,
 				   unsigned long long mstart,
 				   unsigned long long mend);
-extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
+extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 				       void **addr, unsigned long *sz);
 #endif /* CONFIG_KEXEC_FILE */
 
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 33400ff051a8..0837d8c0e792 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -1255,7 +1255,7 @@ int crash_exclude_mem_range(struct crash_mem *mem,
 	return 0;
 }
 
-int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
+int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 			  void **addr, unsigned long *sz)
 {
 	Elf64_Ehdr *ehdr;
@@ -1319,7 +1319,7 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
 	phdr++;
 
 	/* Prepare PT_LOAD type program header for kernel text region */
-	if (kernel_map) {
+	if (need_kernel_map) {
 		phdr->p_type = PT_LOAD;
 		phdr->p_flags = PF_R|PF_W|PF_X;
 		phdr->p_vaddr = (unsigned long) _text;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

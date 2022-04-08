Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3438DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5uycyzgNMqx4+9p5eNelXhJQEjcYVPIxUQZMyiKJzs=; b=mitA5leoMiWu8r
	M5JgKM+Gno5Duwe112cIti4mzZVEcdp+Jlgo1pkn6R0nVV0Y+ugCWWMGMPGgI8irvCD4BY25DHlDw
	X3Y+nL23DOOmY8YuVptHNYSyaCcSGRCtENXIQZ1duZgfIXiLsMIlAC0kgZYEULMMCXwylXpG3apHv
	qFMbK/MRJiTwyNsEvI1xY48nJGzxkc0iISSeD70/5+YyUWYcfMzp5adhGZIgtx2D5nIK8VrDVIPf5
	Ui/cRYR1Bx30CACDuWV1f8qS0E054NCuuDkzt4RooyWtsWSzCpmm+WthOe4BUs1iSG6nebnBPYj23
	S0ZfSuzvlDM+yoLf8mZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclbR-00GJ7Z-GI; Fri, 08 Apr 2022 10:12:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclbI-00GHea-6l; Fri, 08 Apr 2022 10:12:22 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KZYmK4QSrzBsCF;
 Fri,  8 Apr 2022 18:05:53 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Apr
 2022 18:10:05 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <palmer@dabbelt.com>, <liaochang1@huawei.com>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <bjorn.topel@gmail.com>,
 <ebiederm@xmission.com>, <guoren@linux.alibaba.com>, <jszhang@kernel.org>,
 <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <mick@ics.forth.gr>,
 <paul.walmsley@sifive.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>
Subject: [PATCH v3 -next 1/6] kexec_file: Fix kexec_file.c build error for
 riscv platform
Date: Fri, 8 Apr 2022 18:09:09 +0800
Message-ID: <20220408100914.150110-2-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408100914.150110-1-lizhengyu3@huawei.com>
References: <20220408100914.150110-1-lizhengyu3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_031220_625978_55ABE43B 
X-CRM114-Status: GOOD (  11.97  )
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

From: Liao Chang <liaochang1@huawei.com>

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
index 58d1b58a971e..ebb1bffbf068 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -227,7 +227,7 @@ struct crash_mem {
 extern int crash_exclude_mem_range(struct crash_mem *mem,
 				   unsigned long long mstart,
 				   unsigned long long mend);
-extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
+extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 				       void **addr, unsigned long *sz);
 #endif /* CONFIG_KEXEC_FILE */
 
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 8347fc158d2b..331a4f0f10f5 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -1260,7 +1260,7 @@ int crash_exclude_mem_range(struct crash_mem *mem,
 	return 0;
 }
 
-int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
+int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 			  void **addr, unsigned long *sz)
 {
 	Elf64_Ehdr *ehdr;
@@ -1324,7 +1324,7 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
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

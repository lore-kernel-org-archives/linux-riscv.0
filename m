Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673CBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+opzSn62u08oSn+utmYGRa9rXN1RC/ydHsX3tNiIYs=; b=epVGtXCwnAZusG
	tibJYrE3r73G+QeuMQdCfLt/Dv4+gACXfklJguYIDTzT8CBjOKyQScI+acUfDOJxASkFuevfgAa25
	rywEYWPaYimApZbBHHWxWBTvC0KVTpxVVg9oYQFlJUCdlgwQABKZL5uDRb3AqXrvGWUi+ReEphf6k
	P9p6vJ2rlzhV0toInlwaD7BhxefsYH5TBELfvVNa4aWBCl9NM1QXqaEtK7gYJLMzseiUYUJycC5sn
	0unEQmKzSWLfOFeE7GNNkTm8Z9vDyL4Wn/5p8PlBbF7Y3+/rxSCHEV6cv9G7CmipXroajCghAdr6k
	WCdSNupFPZsYen5gp+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclZS-00GHqC-CI; Fri, 08 Apr 2022 10:10:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclZI-00GHgL-2v; Fri, 08 Apr 2022 10:10:19 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KZYrf4MJYzdZnh;
 Fri,  8 Apr 2022 18:09:38 +0800 (CST)
Received: from huawei.com (10.67.174.157) by kwepemi500014.china.huawei.com
 (7.221.188.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Apr
 2022 18:10:07 +0800
From: Li Zhengyu <lizhengyu3@huawei.com>
To: <palmer@dabbelt.com>, <liaochang1@huawei.com>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <bjorn.topel@gmail.com>,
 <ebiederm@xmission.com>, <guoren@linux.alibaba.com>, <jszhang@kernel.org>,
 <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <mick@ics.forth.gr>,
 <paul.walmsley@sifive.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>
Subject: [PATCH v3 -next 4/6] RISC-V: Support for kexec_file on panic
Date: Fri, 8 Apr 2022 18:09:12 +0800
Message-ID: <20220408100914.150110-5-lizhengyu3@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408100914.150110-1-lizhengyu3@huawei.com>
References: <20220408100914.150110-1-lizhengyu3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.157]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_031016_483775_0DB343B5 
X-CRM114-Status: GOOD (  16.09  )
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

This patch adds support for loading a kexec on panic (kdump) kernel.
It has been tested with vmcore-dmesg on riscv64 QEMU on both an smp
and a non-smp system.

Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>
---
 arch/riscv/kernel/elf_kexec.c | 119 +++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 2d442a849871..911d65d5a123 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -18,6 +18,8 @@
 #include <linux/of.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
+#include <linux/memblock.h>
+#include <asm/setup.h>
 
 static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 				struct kexec_elf_info *elf_info, unsigned long old_pbase,
@@ -97,6 +99,79 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	return ret;
 }
 
+static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
+{
+	unsigned int *nr_ranges = arg;
+
+	(*nr_ranges)++;
+	return 0;
+}
+
+static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+{
+	struct crash_mem *cmem = arg;
+
+	cmem->ranges[cmem->nr_ranges].start = res->start;
+	cmem->ranges[cmem->nr_ranges].end = res->end;
+	cmem->nr_ranges++;
+
+	return 0;
+}
+
+static int prepare_elf_headers(void **addr, unsigned long *sz)
+{
+	struct crash_mem *cmem;
+	unsigned int nr_ranges;
+	int ret;
+
+	nr_ranges = 1; /* For exclusion of crashkernel region */
+	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+
+	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
+	if (!cmem)
+		return -ENOMEM;
+
+	cmem->max_nr_ranges = nr_ranges;
+	cmem->nr_ranges = 0;
+	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
+	if (ret)
+		goto out;
+
+	/* Exclude crashkernel region */
+	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
+
+out:
+	kfree(cmem);
+	return ret;
+}
+
+static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
+				 unsigned long cmdline_len)
+{
+	int elfcorehdr_strlen;
+	char *cmdline_ptr;
+
+	cmdline_ptr = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
+	if (!cmdline_ptr)
+		return NULL;
+
+	elfcorehdr_strlen = sprintf(cmdline_ptr, "elfcorehdr=0x%lx ",
+		image->elf_load_addr);
+
+	if (elfcorehdr_strlen + cmdline_len > COMMAND_LINE_SIZE) {
+		pr_err("Appending elfcorehdr=<addr> exceeds cmdline size\n");
+		kfree(cmdline_ptr);
+		return NULL;
+	}
+
+	memcpy(cmdline_ptr + elfcorehdr_strlen, cmdline, cmdline_len);
+	/* Ensure it's nul terminated */
+	cmdline_ptr[COMMAND_LINE_SIZE - 1] = '\0';
+	return cmdline_ptr;
+}
+
 static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 			    unsigned long kernel_len, char *initrd,
 			    unsigned long initrd_len, char *cmdline,
@@ -106,10 +181,12 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	unsigned long old_kernel_pbase = ULONG_MAX;
 	unsigned long new_kernel_pbase = 0UL;
 	unsigned long initrd_pbase = 0UL;
-	void *fdt;
+	unsigned long headers_sz;
+	void *fdt, *headers;
 	struct elfhdr ehdr;
 	struct kexec_buf kbuf;
 	struct kexec_elf_info elf_info;
+	char *modified_cmdline = NULL;
 
 	ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
 	if (ret)
@@ -130,6 +207,45 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	kbuf.image = image;
 	kbuf.buf_min = new_kernel_pbase + kernel_len;
 	kbuf.buf_max = ULONG_MAX;
+
+	/* Add elfcorehdr */
+	if (image->type == KEXEC_TYPE_CRASH) {
+		ret = prepare_elf_headers(&headers, &headers_sz);
+		if (ret) {
+			pr_err("Preparing elf core header failed\n");
+			goto out;
+		}
+
+		kbuf.buffer = headers;
+		kbuf.bufsz = headers_sz;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		kbuf.memsz = headers_sz;
+		kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
+		kbuf.top_down = true;
+
+		ret = kexec_add_buffer(&kbuf);
+		if (ret) {
+			vfree(headers);
+			goto out;
+		}
+		image->elf_headers = headers;
+		image->elf_load_addr = kbuf.mem;
+		image->elf_headers_sz = headers_sz;
+
+		pr_debug("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
+
+		/* Setup cmdline for kdump kernel case */
+		modified_cmdline = setup_kdump_cmdline(image, cmdline,
+						       cmdline_len);
+		if (!modified_cmdline) {
+			pr_err("Setting up cmdline for kdump kernel failed\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		cmdline = modified_cmdline;
+	}
+
 	/* Add the initrd to the image */
 	if (initrd != NULL) {
 		kbuf.buffer = initrd;
@@ -170,6 +286,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 out_free_fdt:
 	kvfree(fdt);
 out:
+	kfree(modified_cmdline);
 	kexec_free_elf_info(&elf_info);
 	return ret ? ERR_PTR(ret) : NULL;
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

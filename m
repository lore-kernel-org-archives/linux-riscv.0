Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB51C5620A
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Date:From:To:In-Reply-To:
	Subject:Cc:Mime-Version:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xq0l8O9sYcZFwS69m/46UH5RhwPMI+kcL6r9H/7spZ4=; b=NHkR0YLHZ6DbYW
	/i7dDlYZK/R4LdJDX+Wy2U1GnA2QFsEVrTvdqJ3neP2E0fr0wyfj9IGrUxyDJFTr5BTjY+iJrjD2Z
	ctpe70UBXLLrLMurnsyRusA5Aw0F+fpr3gTPCgUkKXvRoOsxX7Y7Q0eWIvb8D0Vf/fHTildn0af65
	ZM57MI0OlRCh7SJ4/EPPDB8nkMZHU6QlKi9doKVVzZ/I2Aa2JuAFSpbqSDhfh+DMJkHJeP9g596+z
	u/7YA+Gawzos/ASYaLA6sj9u77TB5bw8l9zz4m1pVrEXfWVvBcnTu/Kxlx4lQ8NtUgqR6DpUOlnN+
	IJi/7fZUfUBUXA/cy0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsRj-000000058Ej-10fV;
	Thu, 06 Aug 2026 07:23:19 +0000
Received: from va-2-59.ptr.blmpb.com ([209.127.231.59])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsRd-000000058Bi-2PcS
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 07:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1786000985; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=aUR1yoU4JOYPKs/rMqqJfgyInNDV//hmTuzZfbk6yls=;
 b=dzkyzZ6Xkmr04tR+qkhE+wc2L24Y8Iceaa8Ds/CsR3pz5iaCJZqotnNN7qasPhMHcbgqqx
 haJKGyBIn7dKMO+nT5KXiviyc+EDkGZZN5pGgV5ofPaTNbRhIciPXTvCNCDYfji6oijtOj
 6mByQncweq9gmZADfGMunjinahqwdi5nSuKYQM67vMqP2WDbLfDOcLTuOPiYfMnkPX0p0w
 2nX3z9Uy01GTF73hxpGuOWH7HDIbWUC3bubJSHBiluCc7wsRFyjZrHVlIFLn4As0S/6WpP
 lY+ina1/SD5X4a4MWPVVUczl64mpWDJ32hHAlAiUEXURzWtEOze/b/zXRdj+0A==
Message-Id: <20260806072256.1813-3-douyufan@picoheart.com>
Mime-Version: 1.0
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Subject: [PATCH 2/3] riscv: kexec_file: size the ELF placement search by the load extent
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-Lms-Return-Path: <lba+26a743658+254274+lists.infradead.org+douyufan@picoheart.com>
In-Reply-To: <20260806072256.1813-1-douyufan@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
From: "Yufan Dou" <douyufan@picoheart.com>
Date: Thu,  6 Aug 2026 15:22:55 +0800
Received: from 5CG30262N9-QAP.localdomain ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 06 Aug 2026 15:23:03 +0800
References: <20260806072256.1813-1-douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_002313_680718_AE3DACB8 
X-CRM114-Status: GOOD (  14.87  )
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

elf_find_pbase() searches for a memory hole to place the whole kernel
image, and the segments are then added at fixed addresses derived from
the base it returns. kexec_add_buffer() skips the memory hole check for
a segment whose address is already known.

The search is sized by the length of the ELF file, which does not
reflect the extent the image occupies in memory: a PT_LOAD segment can
have a memory size larger than its file size, so a stripped vmlinux can
end up needing more memory than the file length accounts for. The tail
of the image is then placed without any check that the memory is
available.

Size the search by the extent between the lowest and the highest
physical address of the PT_LOAD segments instead, and drop the now
unused kernel_len argument.

Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
Cc: stable@vger.kernel.org
Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 arch/riscv/kernel/kexec_elf.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 3e9a32acb8f2..d84548f9d289 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -54,9 +54,9 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
  * Go through the available phsyical memory regions and find one that hold
  * an image of the specified size.
  */
-static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
-			  struct elfhdr *ehdr, struct kexec_elf_info *elf_info,
-			  unsigned long *old_pbase, unsigned long *new_pbase)
+static int elf_find_pbase(struct kimage *image, struct elfhdr *ehdr,
+			  struct kexec_elf_info *elf_info, unsigned long *old_pbase,
+			  unsigned long *new_pbase)
 {
 	int i;
 	int ret;
@@ -64,6 +64,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	const struct elf_phdr *phdr;
 	unsigned long lowest_paddr = ULONG_MAX;
 	unsigned long lowest_vaddr = ULONG_MAX;
+	unsigned long highest_paddr = 0;
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &elf_info->proghdrs[i];
@@ -75,6 +76,9 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 
 		if (lowest_vaddr > phdr->p_vaddr)
 			lowest_vaddr = phdr->p_vaddr;
+
+		highest_paddr = max(highest_paddr,
+				    (unsigned long)(phdr->p_paddr + phdr->p_memsz));
 	}
 
 	kbuf.image = image;
@@ -88,7 +92,12 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	 */
 	kbuf.buf_align = PMD_SIZE;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
+	/*
+	 * The segments are added at fixed addresses later on, which makes
+	 * kexec_add_buffer() skip the memory hole check, so the range searched
+	 * here has to cover the whole extent the image occupies in memory.
+	 */
+	kbuf.memsz = ALIGN(highest_paddr - lowest_paddr, PAGE_SIZE);
 	kbuf.cma = NULL;
 	kbuf.top_down = false;
 	ret = arch_kexec_locate_mem_hole(&kbuf);
@@ -115,8 +124,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = elf_find_pbase(image, kernel_len, &ehdr, &elf_info,
-			     &old_kernel_pbase, &new_kernel_pbase);
+	ret = elf_find_pbase(image, &ehdr, &elf_info, &old_kernel_pbase,
+			     &new_kernel_pbase);
 	if (ret)
 		goto out;
 
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

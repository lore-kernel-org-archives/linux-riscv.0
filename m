Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F5C624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Mime-Version:
	Subject:From:To:Message-Id:Date:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xq0l8O9sYcZFwS69m/46UH5RhwPMI+kcL6r9H/7spZ4=; b=Nu2SIkjtlvWzg9
	AhXTHvrmYobhk+8fuQg4V7nD2Dy+YAlXQteGIZ8ROij6Y62NnLjQXivWsxY3Jz/QM78guQAGJpAdy
	/Cu4VC6aFPwdx/SR9ORgCnpBhvx5FpZGlK/3rAfhdRjpCgz7nCxYwRGpoFfqSP5WOlOGOUQnL7gsp
	gfkEPxHQZRp67bs1zaBT7r6vGPnp8hud6e+vhnV4pwtcpPOU8Wrley4W7ME7xJgPZ5kiP1kLsc1rt
	o5yJOJI6uXf7cez3p3wFyHiShWMpHNftupR4rNSGia1LIYYAbdK28iDRYwuGRv2wfb7SG8/ISXUa9
	sVWFVEdynn0LwPAz5TPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gxy-0000000EBIB-2J0K;
	Wed, 02 Sep 2026 09:09:10 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gxv-0000000EBGe-16DS
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 09:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340141; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=aUR1yoU4JOYPKs/rMqqJfgyInNDV//hmTuzZfbk6yls=;
 b=rdkWWHNdH94aMaglnZ8RSidXMbenbGTGMW+ZAVXi6x4WVscyo12myfk5LHX8RFhOYHoA02
 olnSMdRMD5Mr7EDV0clW27QbVYsYL6x7Gs/NtRC4MJemOMeu+FqTTCui6/VOs38Ngz1ooa
 ofzdj0VZlwo8kpbcqJL+Co2k45j/8VbT3WVzggolczE8DyBIDqKFwI2eA0czkntKraQkgM
 Vxlj8JH6tqGNoyQoICxul50CT+9pqG34ZONPmomNGrnfJ0JxGG4pqppGDVFJ8QMUI7M74A
 VC2t9aZGbIGI0IuUCcC7BeFSPkp2uXMZqxUCk+F0S55fPzW2MGf6cNsA+9jbZw==
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:08:58 +0800
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-Lms-Return-Path: <lba+26a97e7ab+0889cc+lists.infradead.org+douyufan@picoheart.com>
Date: Wed,  2 Sep 2026 17:08:49 +0800
Message-Id: <20260902090850.2601-3-douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
From: "Yufan Dou" <douyufan@picoheart.com>
Subject: [PATCH RESEND 2/3] riscv: kexec_file: size the ELF placement search by the load extent
Mime-Version: 1.0
In-Reply-To: <20260902090850.2601-1-douyufan@picoheart.com>
References: <20260902090850.2601-1-douyufan@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_020907_378241_5069EBE8 
X-CRM114-Status: GOOD (  15.38  )
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

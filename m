Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18715C561E6
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Mime-Version:Date:Message-Id:To:From:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TjkmoU1mBxu/5JUjrWVYqbaMUePCVS9G/c969C5SAQQ=; b=fuAFXB6stnCdEf6frzjQXRlC30
	Ya4eXM0AZGwS40OwjjN7n8SEOf77Bg1HSKtjsJFxQf4Tj3hyDx+7Xl0GNHioTMli1qyyeRagWgiug
	oC/M+3niG4c9RQPgn6e3gM7aP1B2iMBxaHCVAiBrdakkLSggacBJsLwLHPm1qphq5LhgUxnyvsVaG
	BZoPSNcWAgdPujmkDflnNY8u1uBSg4yfrz/wAgUAk6rkSBNU1czI7MndcocQu3jkpmhl8Mhb/rh96
	+5oHgSE+mCzVPEIzL7aSMPfHpTKGO+9EUbwQ8vhWkk4Mq47y7Wa209ztPLDR0vOs2pTAt8dzbuR/Y
	uXFidbwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsRi-000000058EY-41iJ;
	Thu, 06 Aug 2026 07:23:18 +0000
Received: from va-2-57.ptr.blmpb.com ([209.127.231.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsRd-000000058CI-0lGD
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 07:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1786000988; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lfe3yVyViIS9QqUrO1FybHOjTXn3fmtNC6AuZnCPPzk=;
 b=rpAkQMvUwoUfftdVQ7ktaq5jIlSVTrenXqF16AIE0FLPj+uBPY5t2yJZWC9ms9366aQ/RF
 chDH7bnq14SCTTjVE1DHfXz4q3DWte06gKMx6iKeqHIbwb+D4TwfLHjQuFTnfUgLKUGOEm
 6gcPIpIE1gKEKmgrQbcy5rnVQurQJrfWV3cuZd48njKw1KkTgoVZuIIpnP4LZzW34lu7sk
 woMDDyJqaXIBX0xQaQJJLaLuv1afltF8VkPHfFC8mLwJOpnZfPWhedDnvNXft8Zqif5Nh3
 m5BvbTl5K8kV+Wpyr7I5lY1VBFB+5iTKiLytD3IDroVX1MjdJryvYQQfYj2hAg==
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
From: "Yufan Dou" <douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Message-Id: <20260806072256.1813-4-douyufan@picoheart.com>
Received: from 5CG30262N9-QAP.localdomain ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 06 Aug 2026 15:23:06 +0800
Date: Thu,  6 Aug 2026 15:22:56 +0800
Mime-Version: 1.0
In-Reply-To: <20260806072256.1813-1-douyufan@picoheart.com>
References: <20260806072256.1813-1-douyufan@picoheart.com>
Subject: [PATCH 3/3] riscv: kexec: reserve the PMD-aligned kernel image range
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-Lms-Return-Path: <lba+26a74365b+4f44a6+lists.infradead.org+douyufan@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_002313_287284_DB22F8E4 
X-CRM114-Status: GOOD (  15.44  )
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

When strict kernel permissions are enabled, the next kernel extends
its image reservation from _start to the PMD-aligned address following
_end. If kexec only reserves the exact image range, a later segment can
be placed in this aligned tail and overlap the next kernel's
reservation.

For a flat Image, extend the decoded image size to the next PMD
boundary.

An ELF image contains multiple PT_LOAD segments. Extending every
segment can make an intermediate segment overlap the following one.
Find the PT_LOAD segment with the highest physical end address and
extend only that segment to the next PMD boundary. Align the extent
searched by elf_find_pbase() as well, so that the expanded tail stays
within the range validated against the available memory.

This reserves the range expected by the next kernel without changing
the layout of intermediate ELF segments.

Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
Fixes: 809a11eea8e8 ("riscv: kexec_file: Support loading Image binary file")
Cc: stable@vger.kernel.org
Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 arch/riscv/kernel/kexec_elf.c   | 21 +++++++++++++++++++--
 arch/riscv/kernel/kexec_image.c |  7 ++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index d84548f9d289..da5679bf1d0c 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -28,6 +28,15 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 	int ret = 0;
 	struct kexec_buf kbuf = {};
 	const struct elf_phdr *phdr;
+	unsigned long highest_paddr = 0;
+
+	/* Find the highest physical end address of the kernel image. */
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &elf_info->proghdrs[i];
+		if (phdr->p_type == PT_LOAD)
+			highest_paddr = max(highest_paddr,
+					    (unsigned long)(phdr->p_paddr + phdr->p_memsz));
+	}
 
 	kbuf.image = image;
 
@@ -41,6 +50,13 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 		kbuf.buf_align = phdr->p_align;
 		kbuf.mem = phdr->p_paddr - old_pbase + new_pbase;
 		kbuf.memsz = phdr->p_memsz;
+		/*
+		 * The next kernel aligns its image reservation on PMD_SIZE, as
+		 * explained by a comment in setup_bootmem(). Reserve that tail
+		 * so subsequent segments do not overlap it.
+		 */
+		if (phdr->p_paddr + phdr->p_memsz == highest_paddr)
+			kbuf.memsz = ALIGN(kbuf.mem + phdr->p_memsz, PMD_SIZE) - kbuf.mem;
 		kbuf.top_down = false;
 		ret = kexec_add_buffer(&kbuf);
 		if (ret)
@@ -95,9 +111,10 @@ static int elf_find_pbase(struct kimage *image, struct elfhdr *ehdr,
 	/*
 	 * The segments are added at fixed addresses later on, which makes
 	 * kexec_add_buffer() skip the memory hole check, so the range searched
-	 * here has to cover the whole extent the image occupies in memory.
+	 * here has to cover the whole extent the image occupies in memory,
+	 * including the PMD-aligned tail of the last segment.
 	 */
-	kbuf.memsz = ALIGN(highest_paddr - lowest_paddr, PAGE_SIZE);
+	kbuf.memsz = ALIGN(highest_paddr - lowest_paddr, PMD_SIZE);
 	kbuf.cma = NULL;
 	kbuf.top_down = false;
 	ret = arch_kexec_locate_mem_hole(&kbuf);
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 51dc89259f16..52678b3044fd 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -69,7 +69,12 @@ static void *image_load(struct kimage *image,
 	kbuf.buffer = kernel;
 	kbuf.bufsz = kernel_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf.memsz = le64_to_cpu(h->image_size);
+	/*
+	 * The next kernel aligns its image reservation on PMD_SIZE, as
+	 * explained by a comment in setup_bootmem(). Reserve that tail so
+	 * subsequent segments do not overlap it.
+	 */
+	kbuf.memsz = ALIGN(le64_to_cpu(h->image_size), PMD_SIZE);
 	kbuf.buf_align = le64_to_cpu(h->text_offset);
 
 	ret = kexec_add_buffer(&kbuf);
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

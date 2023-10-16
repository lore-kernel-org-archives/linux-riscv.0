Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686ECDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKP+LP+EOPrYaNEztNhtz/yW98Ax2JyRC2QE2kraQ7g=; b=qdxVez+FsVuo1k
	btK5NDcMxs9lYKYEJhqoefbt88QVPqB+pztVHKXkCPP0O02+b6M6ryKISxCY4DOuGKzc/nxX3ujI4
	XDWfNEzBPNA4K8jBtz2RhEm3zFtiJxD3BFOyTdoFEDYbFthni4xxUCa+72KesibA2bAw8qTP+U8k1
	xVmUIUxWgQ6KpO5YX0Qgz0+Iprgr3DbSq0LF7JQ0n13NKzzsrCvVVez8XR7tmZp5ygLKjVDheW7vN
	VzmzEVcgUnlnWuIUhbbfS55sqGsRt5A1o5y8onIxcN8Hnw+K5n9Fjt/jQwk8Lm2HnfACiBJ3msFfd
	u9B5NWXw99cONmXkYerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJpe-008yqC-1u;
	Mon, 16 Oct 2023 09:24:14 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJpc-008ypE-09
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 09:24:13 +0000
X-QQ-mid: bizesmtp66t1697448184tg0dkeep
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Oct 2023 17:23:01 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: Yef1XHldkvjrhRnpCxOeXAiJrC69qh9pmEbO5oIIHtAhJcoX5G5ce0K8dupTL
	hs/tEJkwBRt+23hpBdBy+KCOFAbHyEcsSEJnYeHWiam2edCFdOhrCiHdh9wnaGvTy2sMV8t
	K/JuJbNeGT3Gz0fRk7xYr/XKGW96pEQOUbVH3rGwxy6LnR1KEEoT9OvjvsSYt8MuTNNjszY
	AdG1HyFJcE0ySLW6I6zHA7J5CIn5FHYBIiQ8V8jUOXI7hwt+EHp1ikBSyDeTQKG0MTSMIlh
	xJI/kxcqHyaEB3Y8dDswJC+jO8AHCP4IU7JZub9rImoHbrQDlDKrv4zyDR180sJPg4W5BT6
	tsg2SUTeOST8rVQ9q13GAYEaSQaChiXiuOWhkHPX8e4bufmLmIHMc223+kDEL4opMIYfmnw
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18377875801720570736
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	lihuafei1@huawei.com,
	conor.dooley@microchip.com,
	liaochang1@huawei.com,
	guoren@kernel.org,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	evan@rivosinc.com,
	sunilvl@ventanamicro.com,
	xianting.tian@linux.alibaba.com,
	samitolvanen@google.com,
	masahiroy@kernel.org,
	apatel@ventanamicro.com,
	jszhang@kernel.org,
	duwe@suse.de,
	eric.devolder@oracle.com,
	emil.renner.berthing@canonical.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH V2 2/2] riscv: kexec_file: Support loading Image binary file
Date: Mon, 16 Oct 2023 17:20:06 +0800
Message-Id: <20231016092006.3347632-3-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20231016092006.3347632-1-songshuaishuai@tinylab.org>
References: <20231016092006.3347632-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022412_408914_9152876A 
X-CRM114-Status: GOOD (  17.00  )
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

This patch creates image_kexec_ops to load Image binary file
for kexec_file_load() syscall.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/include/asm/kexec.h         |  1 +
 arch/riscv/kernel/Makefile             |  2 +-
 arch/riscv/kernel/kexec_image.c        | 98 ++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec_file.c |  1 +
 4 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/kexec_image.c

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index 518825fe4160..b9ee8346cc8c 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -56,6 +56,7 @@ extern riscv_kexec_method riscv_kexec_norelocate;
 
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops elf_kexec_ops;
+extern const struct kexec_file_ops image_kexec_ops;
 
 struct purgatory_info;
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 1c62c639e875..9ecba3231a36 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -86,7 +86,7 @@ endif
 obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
-obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o machine_kexec_file.o
+obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o kexec_image.o machine_kexec_file.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
 
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
new file mode 100644
index 000000000000..5339c4f33ff6
--- /dev/null
+++ b/arch/riscv/kernel/kexec_image.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V Kexec image loader
+ *
+ */
+
+#define pr_fmt(fmt)	"kexec_file(Image): " fmt
+
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/kexec.h>
+#include <linux/pe.h>
+#include <linux/string.h>
+#include <asm/byteorder.h>
+#include <asm/image.h>
+#include <linux/bitfield.h>
+
+static int image_probe(const char *kernel_buf, unsigned long kernel_len)
+{
+	const struct riscv_image_header *h =
+		(const struct riscv_image_header *)(kernel_buf);
+
+	if (!h || (kernel_len < sizeof(*h)))
+		return -EINVAL;
+
+	/* According to Documentation/riscv/boot-image-header.rst,
+	 * use "magic2" field to check when version >= 0.2.
+	 */
+
+	if (h->version >= RISCV_HEADER_VERSION &&
+	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void *image_load(struct kimage *image,
+				char *kernel, unsigned long kernel_len,
+				char *initrd, unsigned long initrd_len,
+				char *cmdline, unsigned long cmdline_len)
+{
+	struct riscv_image_header *h;
+	u64 flags;
+	bool be_image, be_kernel;
+	struct kexec_buf kbuf;
+	int ret;
+
+	/* Check Image header */
+	h = (struct riscv_image_header *)kernel;
+	if (!h->image_size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Check endianness */
+	flags = le64_to_cpu(h->flags);
+	be_image = FIELD_GET(RISCV_IMAGE_FLAG_BE_MASK, flags);
+	be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
+	if (be_image != be_kernel) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Load the kernel image */
+	kbuf.image = image;
+	kbuf.buf_min = 0;
+	kbuf.buf_max = ULONG_MAX;
+	kbuf.top_down = false;
+
+	kbuf.buffer = kernel;
+	kbuf.bufsz = kernel_len;
+	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+	kbuf.memsz = le64_to_cpu(h->image_size);
+	kbuf.buf_align = le64_to_cpu(h->text_offset);
+
+	ret = kexec_add_buffer(&kbuf);
+	if (ret) {
+		pr_err("Error add kernel image ret=%d\n", ret);
+		goto out;
+	}
+
+	image->start = kbuf.mem;
+
+	pr_info("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+				kbuf.mem, kbuf.bufsz, kbuf.memsz);
+
+	ret = load_extra_segments(image, kbuf.mem, kbuf.memsz,
+				  initrd, initrd_len, cmdline, cmdline_len);
+
+out:
+	return ret ? ERR_PTR(ret) : NULL;
+}
+
+const struct kexec_file_ops image_kexec_ops = {
+	.probe = image_probe,
+	.load = image_load,
+};
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index aedb8c16a283..5dc700834f1e 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&elf_kexec_ops,
+	&image_kexec_ops,
 	NULL
 };
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

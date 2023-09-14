Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F74EE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4sIjYkwhJAqdHn2BhuYoFYCoIe8RR7F+QS0S0j5TT8=; b=40bQnCPN0WVe48
	Bg+O8PQfzC+HG7z11gIKOR63iPMoIxPnrN8VHpotWYFFjklKUCnrlHV8IA57HmL62xMFXqbFnDiem
	BtXcuiWY6tPKdh0uOriQU7hadL9d34eCR2QBOpCs8ecMjoNYMdNSjUcdZv5TPpuYGEf5wON7H4BRH
	lvoWryq7O3ziYtpCv0ejDSSCOkXNtk/GsY9jTladI9tyAO7/W5OKsqc9EzbIh8o7lgXvyNYiWSp2W
	0n1yXbbtfueQsAgpkXr29I+60mD++94tHP1vnk9zmbvYW5F77wjfVqWNOAeNHeP/Toemes4wdfHcg
	llZ6GZlNLSfp0DYfrdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbij-0079JG-3A;
	Thu, 14 Sep 2023 02:04:41 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbih-0079Ic-04
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 02:04:40 +0000
X-QQ-mid: bizesmtp66t1694657009t7proppp
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 10:03:26 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: JaBgqeDEvbUHWJAjg96BHZRrDBfTtM+Q5gAR3+eQHlcQOirxbSNE8O46Lm6d/
	b8wBWaBnBiRA2XaIz7s3qFvCgDunQM2IfEK+mNkY+3SQNsAB1ppYibkiRvlaJDig9P2fEXs
	YK7LIobQfSJoxz8cMwgwxOh6lQwikTy2qQh4z9eEgchUMv/yg4g0oalfMAZXRd/7aoPJeL2
	lQQx4biBBKOObg/v5RikVBwYHlD8Y09fwCBN71RIcK8uN+a8m3aleyIeNTnE7YkEOeX5b9y
	TZpRa23dxLyW+WSQI9X2bVc2Sk7A/ss7rnTPrGLWEz4vSL/+7jKUKBRjGhQ+GyvsK2/uGCC
	FAF63lHFbG0pFJtA1q8Nc/WAwCzCg8d4uoB+/proTAt3EmYzVDQ75aTwoun8A==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 806983590891785498
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
	eric.devolder@oracle.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH 2/2] riscv: kexec_file: Support loading Image binary file
Date: Thu, 14 Sep 2023 10:00:44 +0800
Message-Id: <20230914020044.1397356-3-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230914020044.1397356-1-songshuaishuai@tinylab.org>
References: <20230914020044.1397356-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_190439_383370_34DC9AF4 
X-CRM114-Status: GOOD (  17.15  )
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
 arch/riscv/include/asm/image.h         |  2 +
 arch/riscv/include/asm/kexec.h         |  1 +
 arch/riscv/kernel/Makefile             |  2 +-
 arch/riscv/kernel/kexec_image.c        | 97 ++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec_file.c |  1 +
 5 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/kexec_image.c

diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/image.h
index e0b319af3681..8927a6ea1127 100644
--- a/arch/riscv/include/asm/image.h
+++ b/arch/riscv/include/asm/image.h
@@ -30,6 +30,8 @@
 			      RISCV_HEADER_VERSION_MINOR)
 
 #ifndef __ASSEMBLY__
+#define riscv_image_flag_field(flags, field)\
+			       (((flags) >> field##_SHIFT) & field##_MASK)
 /**
  * struct riscv_image_header - riscv kernel image header
  * @code0:		Executable code
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
index 000000000000..b6aa7f59bd53
--- /dev/null
+++ b/arch/riscv/kernel/kexec_image.c
@@ -0,0 +1,97 @@
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
+	be_image = riscv_image_flag_field(flags, RISCV_IMAGE_FLAG_BE);
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

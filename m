Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F90C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzY6BvOZHW8pFtPlbEYOjEf0ShQrJpffkPSwT+nSJHo=; b=HBlclp73dflK4s
	8IrfJLhQS79xBQn98mbKsH0aGvHtHW5f2vUNifD4RCORr0Dnmp+PR6CFaoVvzSH7qt9erzjV5QQNp
	7qCVz+zUXpRU+cV4GlntITkIXQUgb66Bj3erKjjCsdfjium/ifGLYjydQdEAKAk9FOtQEDf7de2mI
	CLOrmiW+Gbn7Lkf2r5Wf3bNBYV9sEj/4fy26h8LGUCA9WprSjnF0jo4gWYXPeBNs5FcWx3FUtTUTB
	iZEr4mgtMCuUAMRK582wqT5DoDoGrSkALyJ/wjRCXCDuOeOD40H++92bw7SwKkTuPSZxhjEAOlrmS
	7UUU2HEG/rU+6bL7HVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFL5E-008SMJ-9G; Tue, 10 Jan 2023 20:18:56 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFL59-008SLD-Mp
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 20:18:53 +0000
Received: by mail-pg1-x531.google.com with SMTP id s67so9043534pgs.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 12:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmZY1OG3vNe332Ldn6SBLXuV8Uze5QRsR/60UtVCPJw=;
        b=ttjElWMwOaUBMpTvifsVi6ycU8gvbU6MTiHvMC392d1gVaNVg+44gVRdyqzuioNEca
         ZmgcKQuhpeDVBw3jidvnWcZGQP6Rkk/eA+jGG3/e5K+Tjop3FxBUqwzBgxKQ6olxphbH
         DLNQdx1wAkhGAwY+U1K8+9OePHIpLDsWZPuFeiVh/9GHwCptRUwR0FaUMVvRr2ugiy2H
         XlI23+BFo1GnV4uJDFFySfN5iFzS6Ge1+KXuylxIfPAJXKmtFNgul8EUXcQ0+Cn3Yqzf
         VRpb0viT6jSA0dffFAOO2ef4ueYDDwxKgWOK6DEroFPUyFPquQY3tw8XWOyRMatAJZ6U
         H4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmZY1OG3vNe332Ldn6SBLXuV8Uze5QRsR/60UtVCPJw=;
        b=PjPoifw+UfDaH2Sx59hQjgHpPw4x0lxR1xD9Inb1rR8hRfTXfN3QdsSJFzdL1alb8c
         nmZAAuSx5zZ/ga5R8WGbBSfxX8J5+xhmYXEs+dkHeIfybIUQ9AwrfeEq0FLp/ETF2aeN
         6q0IZWkR8u5PyhzfjH1U87O2Wa30fesn/C2WCChNZLquZ56XFl6541NAElMupXhiyl1l
         SLbxVt7yZnQ0J8icjUmwXlRUbVdcVv7BM229IgW0zt/duh+fz7tUg6Om5p8SzpNZxwgY
         p0NXUQEDYltnf7tJ2dsQjq8Qb2CuDPY0pEXwIAKaoCASHwjclC79WFal7p/BH1Jtp4R7
         jYsw==
X-Gm-Message-State: AFqh2kpgdQTqOjnFLpKGggQVgpEHGOzjKajI6Oge4g13X6EgAHPegrvD
	CYPQn3TdTk3PH6C+MoEN1eMxepDLEuGWDXo3LuQ=
X-Google-Smtp-Source: AMrXdXvjO4PLt837d3MdSE38CVPdAv2/VufYEH3Pz9/Z6W2P2LN5VuNgmI/fW6IHumEr5sMHcoUgFA==
X-Received: by 2002:aa7:84d1:0:b0:58a:9619:9b30 with SMTP id x17-20020aa784d1000000b0058a96199b30mr3503750pfn.10.1673381927403;
        Tue, 10 Jan 2023 12:18:47 -0800 (PST)
Received: from vineet-framework.ba.rivosinc.com (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id d3-20020aa797a3000000b005811c4245c7sm8477802pfq.126.2023.01.10.12.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 12:18:46 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	palmer@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Guo Ren <guoren@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux@rivosinc.com,
	Vineet Gupta <vineetg@rivosinc.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: elf: add .riscv.attributes parsing
Date: Tue, 10 Jan 2023 12:18:41 -0800
Message-Id: <20230110201841.2069353-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_121852_005849_3659AFA3 
X-CRM114-Status: GOOD (  21.22  )
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

This implements the elf loader hook to parse RV specific
.riscv.attributes section. This section is inserted by compilers
(gcc/llvm) with build related information such as -march organized as
tag/value attribute pairs.

It identifies the various attribute tags (and corresponding values) as
currently specified in the psABI specification.

This patch only implements the elf parsing mechanics, leaving out the
recording/usage of the attributes to subsequent patches.

Reported-by: kernel test robot <lkp@intel.com>  # code under CONFIG_COMPAT
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 arch/riscv/Kconfig           |   1 +
 arch/riscv/include/asm/elf.h |  11 +++
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/elf-attr.c | 150 +++++++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 arch/riscv/kernel/elf-attr.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..f7e0ab05a2d2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,7 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ARCH_BINFMT_ELF_STATE
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index e7acffdf21d2..7ab8bd0ec330 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -116,6 +116,17 @@ do {							\
 		*(struct user_regs_struct *)regs;	\
 } while (0);
 
+struct arch_elf_state {
+};
+
+#define INIT_ARCH_ELF_STATE {}
+
+extern int arch_elf_pt_proc(void *ehdr, void *phdr, struct file *elf,
+			    bool is_interp, struct arch_elf_state *state);
+
+extern int arch_check_elf(void *ehdr, bool has_interpreter, void *interp_ehdr,
+			  struct arch_elf_state *state);
+
 #ifdef CONFIG_COMPAT
 
 #define SET_PERSONALITY(ex)					\
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..eff6d845ac9d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -50,6 +50,7 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
+obj-y	+= elf-attr.o
 obj-y	+= probes/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
diff --git a/arch/riscv/kernel/elf-attr.c b/arch/riscv/kernel/elf-attr.c
new file mode 100644
index 000000000000..148d720f97de
--- /dev/null
+++ b/arch/riscv/kernel/elf-attr.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-24 Rivos Inc.
+ */
+
+#include <linux/binfmts.h>
+#include <linux/elf.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "rv-elf-attr: " fmt
+
+#define PT_RISCV_ATTRIBUTES		0x70000003
+
+#define RV_ATTR_TAG_stack_align		4
+#define RV_ATTR_TAG_arch		5
+#define RV_ATTR_TAG_unaligned_access	6
+
+#define RV_ATTR_SEC_SZ			SZ_1K
+
+static void rv_elf_attr_int(u64 tag, u64 val)
+{
+}
+
+static void rv_elf_attr_str(u64 tag, const char *str)
+{
+}
+
+static u64
+decode_uleb128(unsigned char **dpp)
+{
+	unsigned char *bp = *dpp;
+	unsigned char byte;
+	unsigned int shift = 0;
+	u64 result = 0;
+
+	while (1) {
+		byte = *bp++;
+		result |= (byte & 0x7f) << shift;
+		if ((byte & 0x80) == 0)
+			break;
+		shift += 7;
+	}
+	*dpp = bp;
+	return result;
+}
+
+/*
+ * Parse .riscv.attributes elf section to get the various compile time
+ * attributes such as -march, unaligned access and so no.
+ */
+static int rv_parse_elf_attributes(struct file *f, const struct elf_phdr *phdr,
+				   struct arch_elf_state *state)
+{
+	unsigned char buf[RV_ATTR_SEC_SZ];
+	unsigned char *p;
+	ssize_t n;
+	int ret = 0;
+	loff_t pos;
+
+	pr_debug("Section .riscv.attributes found\n");
+
+	/* Assume a reasonable size for now */
+	if (phdr->p_filesz > sizeof(buf))
+		return -ENOEXEC;
+
+	memset(buf, 0, RV_ATTR_SEC_SZ);
+	pos = phdr->p_offset;
+	n = kernel_read(f, &buf, phdr->p_filesz, &pos);
+
+	if (n < 0)
+		return -EIO;
+
+	p = buf;
+	p++;				/* format-version (1B) */
+
+	while ((p - buf) < n) {
+
+		unsigned char *vendor_start;
+		u32 len;
+
+		/*
+		 * Organized as "vendor" sub-section(s).
+		 * Current only 1 specified "riscv"
+		 */
+
+		p += 4;			/* sub-section length (4B) */
+		while (*p++ != '\0')	/* vendor name string */
+			;
+		p++;			/* Tag_File (1B) */
+		len = *(u32 *)p;	/* data length (4B) */
+		p += 4;
+
+		len -= 5;		/* data length includes Tag and self length */
+		vendor_start = p;
+		while ((p - vendor_start) < len) {
+
+			u64 tag = decode_uleb128(&p);
+			unsigned char *val_str;
+			u64 val_n;
+
+			switch (tag) {
+			case RV_ATTR_TAG_stack_align:
+				val_n = decode_uleb128(&p);
+				break;
+
+			case RV_ATTR_TAG_unaligned_access:
+				val_n = decode_uleb128(&p);
+				pr_debug("Tag_RISCV_unaligned_access =%llu\n", val_n);
+				rv_elf_attr_int(tag, val_n);
+				break;
+
+			case RV_ATTR_TAG_arch:
+				val_str = p;
+				while (*p++ != '\0')
+					;
+				pr_debug("Tag_RISCV_arch =[%s]\n", val_str);
+				rv_elf_attr_str(tag, val_str);
+				break;
+
+			default:
+				val_n = decode_uleb128(&p);
+				pr_debug("skipping Unrecognized Tag [%llu]=%llu\n", tag, val_n);
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * Hook invoked from common elf loader to parse any arch specific elf segments
+ */
+int arch_elf_pt_proc(void *_ehdr, void *_phdr, struct file *elf,
+		     bool is_interp, struct arch_elf_state *state)
+{
+	struct elf_phdr *phdr = _phdr;
+	int ret = 0;
+
+	if (phdr->p_type == PT_RISCV_ATTRIBUTES && !is_interp)
+		ret = rv_parse_elf_attributes(elf, phdr, state);
+
+	return ret;
+}
+
+int arch_check_elf(void *_ehdr, bool has_interpreter, void *_interp_ehdr,
+		   struct arch_elf_state *state)
+{
+	return 0;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

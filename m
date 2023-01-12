Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CC6C54EBE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00MrW3HpnNOu/sJ9/ZUGp4+5ST5AX8yYH311YlQxBlo=; b=opFR2wUbLlGFNb
	dDR5j89c4AvTkYQh7DaiJ1A1DoWfQnqwj6UpuBR92QYzlDdJe/8GDZ2tynTC9Texw+zV5KQAQzo+s
	gtZF5vqGzRw1oVdsU2ud6zTywoJ2mntHBM+y0behDLe22T+1s6NqG/OEfM2I0VTicsYtpuq3UA/8l
	YunA7k+rZKqStHGy5ixVLaSuYcHORgkJms0yQ7QQ8TgIeAr4vOksWCis7+MxonaNKYJ3p+HIjlFYH
	5Z81ZF8bkS6VFfAg/59LY8ntbkqQoyqFGF270ff/3SOZTRDQSki0TJWSiSZSDiGCPZZairgaeJ7V7
	sWgBiV4aLg1nVc33mNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4mR-00H5KX-Om; Thu, 12 Jan 2023 21:06:35 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4mM-00H5If-GY
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 21:06:34 +0000
Received: by mail-pg1-x52c.google.com with SMTP id g68so12542955pgc.11
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDsh5GRLDmAPT4ohGzYkIMdBdaGK6a97VLrKERNXpSI=;
        b=tC88Nl63tlsqkUVXbppM8YyNoBDPMJ+wX9IGOvEwtqpHT/QQDNc6B23b26p3/GE2xC
         Hv0XaI+Yp2/yv8Uk5lg/9zlLhNfRGbnvq/+p4zsXDk3g5c/RjXNv35N0RyAb/iW9lbgF
         PZHloYiuqIJt/JBYLbi50vZUYFjgvFmPTgD/5UMPS4OEO3V/CiMn3cVBnkUn3k2LF3OF
         7S7fwQoigqFodERVfs2x4uAib9GFLZM4DU21atw0fmuSzw4ndZyWS0xz7PM2bS8CBamP
         mHjEGgiL4VGMTtdo6YuQuKwRrCESQwFUi3u33nFVKwFQB5MZsaP5P/MR5e4oYpTpq1Rj
         u85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDsh5GRLDmAPT4ohGzYkIMdBdaGK6a97VLrKERNXpSI=;
        b=QQpMqXH8p7hCTTssocIN//Bj/Q0IlaII7a+cal5iQmWQU8Q2swLyxkSZ4tsnmAaudA
         rvzwEroAOPeXB8K0Qi/iAf6zipiLiHeVy6nZ2jBJTwy+1/ZsiHsbon64Mgw96JEJ7EWr
         sB7lEQV7qherUy/0cn1+MU3KLZ3L3cUnDXn3NomAn3OKqPgiH/54V7YQKdmqZ4O6jTGN
         3N7+2X2AOxkdW+ph0YTS8om2IBuWMQ2b7BWDDaHIrLCWnv3tev88zB3cTGfkPuNoM4OM
         sR2S1Blg7V3fTS04Nvap3dnDw3/6QKrYuZXtz82aCCqVWzVL3kDJ+GBvuU7MRXCVJ9by
         12JA==
X-Gm-Message-State: AFqh2kq4ioOvSfeIGV6GBkkyrhu6NcW/pMmHOiJMU5eqDGCPGemUd36i
	Kth9SItg85dtVixOGb+lK/zqBX430OcSAwF9
X-Google-Smtp-Source: AMrXdXsWQjghAE7kgEGAEd1aCFC8+rYzpvT4J079pmOQkHUq/42SJ+7iweefO9sVUj+hscQUxYqVpA==
X-Received: by 2002:a05:6a00:1715:b0:580:ea08:5277 with SMTP id h21-20020a056a00171500b00580ea085277mr7392268pfc.16.1673557586949;
        Thu, 12 Jan 2023 13:06:26 -0800 (PST)
Received: from vineet-framework.ba.rivosinc.com (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id a203-20020a621ad4000000b00580e3917af7sm9206679pfa.117.2023.01.12.13.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:06:26 -0800 (PST)
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
	Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH v2] riscv: elf: add .riscv.attributes parsing
Date: Thu, 12 Jan 2023 13:06:22 -0800
Message-Id: <20230112210622.2337254-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_130630_596315_4BFE93B9 
X-CRM114-Status: GOOD (  22.84  )
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

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
Changes since v1 [1]
  - Handling potential oob accesses due to against malformed elf contents
  - Handling of multiple sub-subsections

[1]https://lore.kernel.org/linux-riscv/20230110201841.2069353-1-vineetg@rivosinc.com

Given the current state of discussions, the intended Vector extension
support would likely not need it, still posting the reworked v2 for
logical conclusion and for posterity in case need comes up in future
for something like CFI elf annotation.
Maintainers/reviewers can decide whether to merge it.
---
 arch/riscv/Kconfig           |   1 +
 arch/riscv/include/asm/elf.h |  11 ++
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/elf-attr.c | 232 +++++++++++++++++++++++++++++++++++
 4 files changed, 245 insertions(+)
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
index 000000000000..51bcee92dd5b
--- /dev/null
+++ b/arch/riscv/kernel/elf-attr.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+#include <linux/binfmts.h>
+#include <linux/elf.h>
+#include <asm/unaligned.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "rv-elf-attr: " fmt
+
+#define PT_RISCV_ATTRIBUTES		0x70000003
+
+#define RV_ATTR_TAG_file		1
+
+#define RV_ATTR_TAG_stack_align		4
+#define RV_ATTR_TAG_arch		5
+#define RV_ATTR_TAG_unaligned_access	6
+
+#define RV_ATTR_VENDOR_RISCV		"riscv"
+
+#define RV_ATTR_SEC_SZ			SZ_1K
+
+static void rv_elf_attr_int(u32 tag, u32 val)
+{
+	pr_debug("Tag %x=%d\n", tag, val);
+}
+
+static void rv_elf_attr_str(u32 tag, const unsigned char *str)
+{
+	pr_debug("Tag %x=[%s]\n", tag, str);
+}
+
+/*
+ * Decode a ule128 encoded value.
+ */
+static int
+decode_uleb128_safe(unsigned char **dpp, u32 *val, const unsigned char *p_end)
+{
+	unsigned char *bp = *dpp;
+	unsigned char byte;
+	unsigned int shift = 0;
+	u32 result = 0;
+	int ok = 0;
+
+	while (bp < p_end) {
+		byte = *bp++;
+		result |= (byte & 0x7f) << shift;
+		if ((byte & 0x80) == 0) {
+			ok = 1;
+			break;
+		}
+		shift += 7;
+	}
+	if (!ok)
+		return -1;
+	*dpp = bp;
+	*val = result;
+	return 0;
+}
+
+/*
+ * Parse a single elf attribute.
+ */
+static int rv_parse_elf_attr_safe(unsigned char **dpp, unsigned char *p_end)
+{
+	unsigned char *p = *dpp;
+	unsigned char *str;
+	u32 tag, val, s_len;
+
+	if (decode_uleb128_safe(&p, &tag, p_end))
+		goto bad_attr;
+
+	switch (tag) {
+	case RV_ATTR_TAG_stack_align:
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		rv_elf_attr_int(tag, val);
+		break;
+
+	case RV_ATTR_TAG_unaligned_access:
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		rv_elf_attr_int(tag, val);
+		break;
+
+	case RV_ATTR_TAG_arch:
+		str = p;
+		s_len = strnlen(p, p_end - p) + 1;
+		p += s_len;
+		if (p > p_end)
+			goto bad_attr;
+		rv_elf_attr_str(tag, str);
+		break;
+
+	default:
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		pr_debug("skipping Unrecognized Tag [%u]=%u\n", tag, val);
+		break;
+	}
+
+	*dpp = p;
+	return 0;
+bad_attr:
+	return -ENOEXEC;
+}
+
+/*
+ * Parse .riscv.attributes elf section.
+ */
+static int rv_parse_elf_attributes(struct file *f, const struct elf_phdr *phdr,
+				   struct arch_elf_state *state)
+{
+	unsigned char buf[RV_ATTR_SEC_SZ];
+	unsigned char *p, *p_end;
+	ssize_t n;
+	int ret = 0;
+	loff_t pos;
+
+	pr_debug("Section .riscv.attributes found\n");
+
+	/* Assume a reasonable size for now */
+	if (phdr->p_filesz > sizeof(buf))
+		goto bad_elf;
+
+	memset(buf, 0, RV_ATTR_SEC_SZ);
+	pos = phdr->p_offset;
+	n = kernel_read(f, &buf, phdr->p_filesz, &pos);
+
+	if (n < 0)
+		return -EIO;
+
+	p = buf;
+	p_end = p + n;
+
+	/* sanity check format-version */
+	if (*p++ != 'A')
+		goto bad_elf;
+
+	/*
+	 * elf attribute section organized as Vendor sub-sections(s)
+	 *   {sub-section length, vendor name, vendor data}
+	 * Vendor data organized as sub-subsection(s)
+	 *   {tag, sub-subsection length, attributes contents}
+	 * Attribute contents organized as
+	 *   {tag, value} pair(s).
+	 */
+	while ((p_end - p) >= 4) {
+		int sub_len, vname_len;
+
+		sub_len = get_unaligned_le32(p);
+		if (sub_len <= 4 || sub_len > n)
+			goto bad_elf;
+
+		p += 4;
+		sub_len -= 4;
+
+		/* Vendor name string */
+		vname_len = strnlen(p, sub_len) + 1;
+		if (vname_len > sub_len)
+			goto bad_elf;
+
+		/* skip non-mandatory sub-section for now */
+		if (strncmp(p, RV_ATTR_VENDOR_RISCV, sub_len)) {
+			p += sub_len;
+			continue;
+		}
+
+		p += vname_len;
+		sub_len -= vname_len;
+
+		/* Vendor data: sub-subsections(s) */
+		while (sub_len > 0) {
+			u32 tag, content_len;
+			unsigned char *sub_end, *sub_start = p;
+
+			if (decode_uleb128_safe(&p, &tag, p_end))
+				goto bad_elf;
+
+			if ((p_end - p) < 4)
+				goto bad_elf;
+
+			content_len = get_unaligned_le32(p);
+			if (content_len > sub_len)
+				goto bad_elf;
+
+			p += 4;
+			sub_len -= content_len;
+			sub_end = sub_start + content_len;
+
+			/* For now handle attributes relating to whole file */
+			if (tag != RV_ATTR_TAG_file) {
+				p = sub_end;
+				continue;
+			}
+
+			/* Attribute(s): tag:value pairs */
+			while (p < sub_end) {
+				ret = rv_parse_elf_attr_safe(&p, p_end);
+				if (ret)
+					goto bad_elf;
+			}
+		}
+	}
+
+	return ret;
+bad_elf:
+	return -ENOEXEC;
+}
+
+/*
+ * Hook invoked by generic elf loader to parse riscv specific elf segments.
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

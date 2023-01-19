Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43060C38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 17:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoR2P4fLFPAEtNlS0ZT3YNhcCAZLjEQfs/pdj4ngXHY=; b=vJV34TbDmc1JNY
	DcTMw8/lvT7Qcg1aknL3Yt5KEUe5RGTaL7GF20zwj7VwDsr6eA8Geh2TfO3TnzTd2p2469iZR9Cq4
	WuPv/yrUt1uVNu6Hbhj91tSHKncWZhvUXACT7IbVNa0kaV4RKL6Gfxga2jOaMC/D2CLH+KeAsni09
	zeluif+xOWsRDX2c1uWdWwXeIvB0pEpY2RULr2wa/dVDYJUDoMycmtKnVXROzYAjYzeP3I9tL24aP
	mA80VfKBZieaiGAF1SOQkmUcNn3AnRqAp+Dc7cooRCurvrFhhAMGTOjIDTPWw259q1znHOBk7Wkg7
	rptkFHFZZoYlpbeGrSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYxd-006MFq-73; Thu, 19 Jan 2023 17:44:25 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYxL-006MAt-9a
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 17:44:23 +0000
Received: by mail-pj1-x1036.google.com with SMTP id x24-20020a17090ab01800b00229f43b506fso1527693pjq.5
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMXRFoJgEBU3JFS7VUd+xLNA0VBDGfFHO+FffVhu5OY=;
        b=fl3cvQGfXY2tlWtG5at8eQ6ziJEqHOBVMxR6Rfb+DiuWyNi0tvhXXxH59d4tsb9g2h
         ev+77zLb5YsfbiYMY4WikZfGUprf1dhYwI8iV6gQyG8e4VbZoHk6/Kzpk6m5ks03PhOo
         BcH7bAjVX+lVrs7xI89TM+9RHhb942b+3jovr1r2vL/2BzgpSjANtcqCU8oxoW34ueWe
         RNZHdlZwIHO2CbHXrfT59VbttyiHlVRSIPmJF3Nsikf2YXruv1ecb/iDwHPHPBlVH23C
         j/69R+1svQt5ADnsvLJOgz7qPhF9BiL8zM1r4EDIwgBW+U0ELUrlqyAY0t+QKg7ZYwZu
         hx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMXRFoJgEBU3JFS7VUd+xLNA0VBDGfFHO+FffVhu5OY=;
        b=gAUIlMGQHwb+nfecWmasVSQkF9pQSVEHysTOGHYVQtQCu3H89HjXZij6OdvXpPkpji
         LU0LcuNVP/j1nRkuU0SDoOh2h4LMNm7/WJWPyLUQBwET4owxUV72vs2f6LO3Y+2B0NDx
         nZcZqzbpHNuXti9DuarpREAwCmIkGFUkB2rfIzWslsv/IyU0aJ3pwYSvGaFSI6Ttr0so
         WWCSiVfRooxEcvNgnIZrDk961anWKzONQvZBp6kug82Lckz22HoyNEUeKrVsXHYVOqdd
         OKh78jjgF0TJogf0VngvwKZxwGtcDG8EWhElrLs250GSUQziakfq9OSs1JkkLjoGQmY1
         qSnA==
X-Gm-Message-State: AFqh2kocOYjjVYUMwupVJeuQOI0yOdBSpjPqU/MTiJ3p/kYOnWbuFL9d
	SZMtfkUHEgRslB4MfvXuPdOX1uUwnETnfdMP
X-Google-Smtp-Source: AMrXdXvlCVFiJQTQ1J5FYsR0lwIwEZuGSm9am5PXzUlzDL3T3qlj5q3b6j2etiWkVPWjydJIrvlZZA==
X-Received: by 2002:a17:903:2789:b0:188:bd82:2b7c with SMTP id jw9-20020a170903278900b00188bd822b7cmr11791708plb.5.1674150240661;
        Thu, 19 Jan 2023 09:44:00 -0800 (PST)
Received: from vineet-framework.ba.rivosinc.com ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902d50100b0017f5ad327casm25415046plg.103.2023.01.19.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:43:59 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	palmer@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux@rivosinc.com,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH v3] riscv: elf: add .riscv.attributes parsing
Date: Thu, 19 Jan 2023 09:43:57 -0800
Message-Id: <20230119174357.3550008-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c2177e4e-e97d-448a-73e7-c50622fdc4bb@rivosinc.com>
References: <c2177e4e-e97d-448a-73e7-c50622fdc4bb@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_094410_643312_195F957E 
X-CRM114-Status: GOOD (  23.59  )
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
Changes since v2 [2]
  - Address Jessica's review comments.
    Mostly robustify code some more, checking for end of buffer etc.

Changes since v1 [1]
  - Handling potential oob accesses due to against malformed elf contents
  - Handling of multiple sub-subsections

[1]https://lore.kernel.org/linux-riscv/20230110201841.2069353-1-vineetg@rivosinc.com
[2]https://lore.kernel.org/linux-riscv/20230112210622.2337254-1-vineetg@rivosinc.com

Given the current state of discussions, the intended Vector extension
support would likely not need it, still posting the reworked v3 for
logical conclusion and for posterity in case need comes up in future
for something like CFI elf annotation.
Maintainers/reviewers can decide whether to merge it.
---
 arch/riscv/Kconfig           |   1 +
 arch/riscv/include/asm/elf.h |  11 ++
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/elf-attr.c | 239 +++++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+)
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
index 000000000000..8df8f2eea42b
--- /dev/null
+++ b/arch/riscv/kernel/elf-attr.c
@@ -0,0 +1,239 @@
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
+static void rv_elf_attr_int(u64 tag, u64 val)
+{
+	pr_debug("Tag %llx=%llx\n", tag, val);
+}
+
+static void rv_elf_attr_str(u64 tag, const unsigned char *str)
+{
+	pr_debug("Tag %llx=[%s]\n", tag, str);
+}
+
+/*
+ * Decode a ule128 encoded value.
+ */
+static int
+decode_uleb128_safe(unsigned char **dpp, u64 *val, const unsigned char *p_end)
+{
+	unsigned char *bp = *dpp;
+	unsigned char byte;
+	unsigned int shift = 0;
+	u64 result = 0;
+
+	while (bp < p_end) {
+		byte = *bp++;
+		result |= (byte & 0x7f) << shift;
+		if ((byte & 0x80) == 0) {
+			*dpp = bp;
+			*val = result;
+			return 0;
+		}
+		shift += 7;
+	}
+
+	return -1;
+}
+
+#define ELF_ATTR_TAG_EVEN(t)	(((t) % 2) ? false : true)
+
+/*
+ * Parse a single elf attribute.
+ */
+static int rv_parse_elf_attr_safe(unsigned char **dpp, unsigned char *p_end)
+{
+	unsigned char *p = *dpp;
+	unsigned char *str;
+	u64 tag, val;
+	u32 s_len;
+
+	if (decode_uleb128_safe(&p, &tag, p_end))
+		goto bad_attr;
+
+	switch (tag) {
+	case RV_ATTR_TAG_stack_align:
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		if (!ELF_ATTR_TAG_EVEN(tag))
+			goto bad_attr;
+		rv_elf_attr_int(tag, val);
+		break;
+
+	case RV_ATTR_TAG_unaligned_access:
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		if (!ELF_ATTR_TAG_EVEN(tag))
+			goto bad_attr;
+		rv_elf_attr_int(tag, val);
+		break;
+
+	case RV_ATTR_TAG_arch:
+		if (ELF_ATTR_TAG_EVEN(tag))
+			goto bad_attr;
+		str = p;
+		s_len = strnlen(p, p_end - p) + 1;
+		if ((p + s_len) > p_end)
+			goto bad_attr;
+		p += s_len;
+		rv_elf_attr_str(tag, str);
+		break;
+
+	default:
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		pr_debug("skipping Unrecognized Tag [%llx]=%llx\n", tag, val);
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
+	if (n <= 0)
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
+		u32 sub_len, vname_len;
+
+		sub_len = get_unaligned_le32(p);
+		if (sub_len <= 4 || sub_len > (p_end - p))
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
+			unsigned char *p_ss_end, *p_ss_start = p;
+			u32 ss_len;
+			u64 tag;
+
+			if (decode_uleb128_safe(&p, &tag, p_end))
+				goto bad_elf;
+
+			if ((p_end - p) < 4)
+				goto bad_elf;
+
+			ss_len = get_unaligned_le32(p);
+			if (ss_len > sub_len)
+				goto bad_elf;
+
+			p += 4;
+			sub_len -= ss_len;
+			p_ss_end = p_ss_start + ss_len;
+
+			/* For now handle attributes relating to whole file */
+			if (tag != RV_ATTR_TAG_file) {
+				p = p_ss_end;
+				continue;
+			}
+
+			/* Attribute(s): tag:value pairs */
+			while (p < p_ss_end) {
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

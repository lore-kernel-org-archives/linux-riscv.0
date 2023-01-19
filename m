Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C6C6379F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwkhtZuCy74gOIOFSXXvs5+fzbrikCrR8l+yUjl1gnI=; b=x9qtSeJh16kK6l
	Aw+v/N8QXS8K/VgVKRnyZurB1qOgLJJK8SlEYecTcIRGt+C4bGH3nJeqKLMiEdTZtabPrICfdDBZU
	aD4uWUv9w3MFphsKjgwcgKLamYMGMzeo8KzEOSPtc0ao5PslHuq7tsrBv3tR966SmKMM1Pg6FIR2F
	qhmg9f5nW6WM9WSbDTWRgqmvriTsia3/ythteG2e3bze/oMBOBPBcrh8VIW5ffvFbQ9BRvnQiimNd
	wmxqfd7j8A/1cpvxwRovpLdQ7pLhcxhQtNPqsffp7y2zAlLKXAvbrxrUBODP11LQLT3pVRTUADLrM
	jEL72Qpp25N+cwaZX46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdFH-007RXP-Ao; Thu, 19 Jan 2023 22:18:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdFD-007RR4-GO
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 22:18:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id d8so3819599pjc.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 14:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsEdBrnw8zv1WxOe57aMagHA1fKjs6sNS2NjosWdfFQ=;
        b=B2NdqkujJqlDIO723PRvDabnr6cpc1OZ/iqkknchwf5q3JQpQDddqf3qQX2vcWgV8Q
         7Xf7jSOk2vnIbHl1NBVXNen8dJDdM/Ks7gurYZYSniofoeC8RI+dv5LqZbXIaqR5avMs
         /TPL63LyCGHUFNhDMpYB2CBdO1Fpk/Kr91O1Kn94u3lZTim/1gdCEItaaTHVJrWZaxsv
         A57bR+Oum3I5RHNGBkKhncfgHfbWrST/Es4JiJlVSsTJgoW/XUcjVZi/AshEkXRLQFNw
         bq07VkTMqpYwaRHzkdUbc6NWkOZi0U1DnbfT5H8B6Mcxwhxa6oxp8Ca95SzawwiUctEp
         ggjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsEdBrnw8zv1WxOe57aMagHA1fKjs6sNS2NjosWdfFQ=;
        b=cmtqGhkrVkjHYNkKeZYfwgRPTEhFC3q9Z1aFIAqn9yz++MaGWlmhmFPVYAGr60XjIW
         nZmllZGwC08uIEiAk5akiEfzt2/HzpDTllV7lGBUN0rXVB6Tr5Y282MMqNMxd/OGZ5k/
         fNUr4KRyz/NZy23+6ff4AEg4imgZxZHqLfOCsupKXyK15wUQQcAK6JZ+Ux1WSDNiW37K
         sWulrL1khqXMSCmUOu3sKK7yqg2Dq1HmEWSlvO6u8+nR4vaLleweZP3K4XaVXhLHb5cu
         wP6cT3TJzvCpbrydItV7usfr3hWtkit4AOR0SKnLnckUDJd1FY2LkJgC0RL8RKUK/9Ws
         mwQQ==
X-Gm-Message-State: AFqh2kp+UJANJUTyGK8fqPu7DwPE8JzSjO5E307bBzjE9LAFBfn9ZnZi
	uw2TST/jAfm6juMDxMuBWQixLo+TMHyfkxwc
X-Google-Smtp-Source: AMrXdXtC8J4Wgo0OEX0QMSLV9liCSNVuXn9aZJsWFGfOfKOcGFMmRJrnH2SQ6dfQ90jSfb8oBinU2g==
X-Received: by 2002:a05:6a20:8ba5:b0:b8:93b8:ee2f with SMTP id m37-20020a056a208ba500b000b893b8ee2fmr11692479pzh.45.1674166716555;
        Thu, 19 Jan 2023 14:18:36 -0800 (PST)
Received: from vineet-framework.ba.rivosinc.com ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w29-20020a63af1d000000b00477bfac06b7sm2850502pge.34.2023.01.19.14.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 14:18:36 -0800 (PST)
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
Subject: [PATCH v4] riscv: elf: add .riscv.attributes parsing
Date: Thu, 19 Jan 2023 14:18:33 -0800
Message-Id: <20230119221833.3629409-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <67c50e8d-ae78-076d-cf25-b7781f2209d7@rivosinc.com>
References: <67c50e8d-ae78-076d-cf25-b7781f2209d7@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_141851_605303_57A984DC 
X-CRM114-Status: GOOD (  23.86  )
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
Changes since v3 [3]
  - Address more review comments from Jessica.
    Specifically handle unknown tags better knowing they can only be
    int/string.

Changes since v2 [2]
  - Address Jessica's review comments.
    Mostly robustify code some more, checking for end of buffer etc.

Changes since v1 [1]
  - Handling potential oob accesses against malformed elf contents.
  - Handling of multiple sub-subsections

[1]https://lore.kernel.org/linux-riscv/20230110201841.2069353-1-vineetg@rivosinc.com
[2]https://lore.kernel.org/linux-riscv/20230112210622.2337254-1-vineetg@rivosinc.com
[3]https://lore.kernel.org/linux-riscv/20230119174357.3550008-1-vineetg@rivosinc.com

Given the current state of discussions, the intended Vector extension
support would likely not need it, still posting the reworked code for
logical conclusion and for posterity in case need comes up in future
for something like CFI elf annotation.
Maintainers/reviewers can decide whether to merge it.
---
 arch/riscv/Kconfig           |   1 +
 arch/riscv/include/asm/elf.h |  11 ++
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/elf-attr.c | 225 +++++++++++++++++++++++++++++++++++
 4 files changed, 238 insertions(+)
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
index 000000000000..ac5df800516e
--- /dev/null
+++ b/arch/riscv/kernel/elf-attr.c
@@ -0,0 +1,225 @@
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
+	if (tag == RV_ATTR_TAG_stack_align ||
+	    tag == RV_ATTR_TAG_unaligned_access)
+		pr_debug("Tag %llx=%llx\n", tag, val);
+	else
+		pr_debug("Unrecognized int Tag [%llx]=%llx\n", tag, val);
+}
+
+static void rv_elf_attr_str(u64 tag, const unsigned char *str)
+{
+	if (tag == RV_ATTR_TAG_arch)
+		pr_debug("Tag %llx=[%s]\n", tag, str);
+	else
+		pr_debug("Unrecognized string Tag [%llx]=[%s]\n", tag, str);
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
+/*
+ * Parse a single elf attribute.
+ */
+static int rv_parse_elf_attr_safe(unsigned char **dpp, unsigned char *p_end)
+{
+	unsigned char *p = *dpp;
+	unsigned char *str;
+	u64 tag, val;
+
+	if (decode_uleb128_safe(&p, &tag, p_end))
+		goto bad_attr;
+
+	if (tag % 2) {
+		u32 s_len;
+
+		str = p;
+		s_len = strnlen(p, p_end - p) + 1;
+		if ((p + s_len) > p_end)
+			goto bad_attr;
+		p += s_len;
+		rv_elf_attr_str(tag, str);
+	} else {
+		if (decode_uleb128_safe(&p, &val, p_end))
+			goto bad_attr;
+		rv_elf_attr_int(tag, val);
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
+		return n;
+	else if (n == 0)
+		return -ENOEXEC;
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
+	if (phdr->p_type == PT_RISCV_ATTRIBUTES)
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

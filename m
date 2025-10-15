Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21C5CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 06:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IWc7w/FV2UbWHyD5VNRPdUyNB7bY8AOXPscOPTaWrY=; b=Is68s+bZnn9cGM
	MNohEOQWKHtXpcr/Nt7po2vUc9PaQ2i8jTTKkT2GMnywIJ6Q4BDiIpc9p+JIY+RMrNV/udQf4o9cl
	QgsB3qeH1Qzj8a5OqpYQGyHRhZ0F56ERUsbhk5q4nlUPkekJSHE/LUCLhE8MbRv4vT+AtWryW57PM
	o/I2ku6wPTWGVOsormda/G+XZ/et6ueVwzsI4nfZ2iduByHxneDEQ59NONXbKJozq8q+jPXoI42Ym
	pcEpbrHLsrFyw1uoM0MrBPKTs0cha4nghLXFwQrC6Dd0arcXCcmzupmlXBOnsbe1c3ApdAgCTY+ca
	lXNCVtVW2PG/WAzrv9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ury-00000000Zvu-4B0f;
	Wed, 15 Oct 2025 06:20:18 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8urv-00000000ZjQ-3yYv
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 06:20:17 +0000
X-QQ-mid: zesmtpsz6t1760509173te78262a4
X-QQ-Originating-IP: u3H1w+MhVp5h6FxUuPEeE01YpOSGlM/XWUOC3g4qmu4=
Received: from GPU-Server-A6000.. ( [202.201.1.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Oct 2025 14:19:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16704342638795234820
EX-QQ-RecipientCnt: 14
From: Yuan Tan <tanyuan@tinylab.org>
To: arnd@arndb.de,
	masahiroy@kernel.org,
	nathan@kernel.org,
	palmer@dabbelt.com,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@maskray.me,
	tanyuan@tinylab.org,
	falcon@tinylab.org,
	ronbogo@outlook.com,
	z1652074432@gmail.com,
	lx24@stu.ynu.edu.cn
Subject: [PATCH v2 6/8] compiler.h: introduce PUSHSECTION macro to establish proper references
Date: Wed, 15 Oct 2025 14:19:20 +0800
Message-ID: <40854460DE090346+c30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760463245.git.tanyuan@tinylab.org>
References: <cover.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: OKKHiI6c9SH3NWplfEdQvnkgxVSivyXpkBuL/axxpl/Cw8vkJRWUxIg3
	HnJnLIJn1Vso5lCrTHERFND2Ac71fMqpoJpzhLKM/tNaKuz9NpD7d+rQiUljVR/GWuET1mt
	3UaqN9XgxVhmUHLpHSHiofcU3XjIq6Nn6vWFfy1qzYjjaeOyAFF9pfiH89nZqsThMYOVbU9
	7CnM9Hb+6zBiCgKSCVP1TFrkRdrMTt14fDfFevi4AVidq8HQ2A4lXjmJxrLF/61Nm+ckGC8
	TrsU+uN0N4V69Ib04ucUt5reAn4u+PWLGRozgAi339J1G5MNP+wxbFXW4K2b833OmXlqfcq
	x4Lv6Qr0W/J4QJjv6S6u4Uf9IANZOadhwGhvKOzdQo0a8fDotfumAoZSxmqSwksIlLZoNdy
	+YjDpNhmfwQUaMbjrPRXYlTO7VX7MnpMO+XOXg/Lr/sNVJNIDs4Jk5xWgP4PaFh3ruFaitm
	wTOkiK0RuFStXCkuIo1NuAFyV0CSXSnymAqZ1skVLsV6xgc2YlecQQJRgB6dqCqai5oCvnG
	hLN+7v/MQQBkK+V99Fadrk4q4EmlFAGRzg77qfWvPQp9ge76QSOU+lZtayzdrzEwhuAo18d
	CpnHzOXv28z2tvxOGOFpamFQvswm3VWfgUuZP0FGZCKKYk4jBFQEJ0xhlh1bCPK8dgDfdv6
	L8w3Qz2G+tzK0P/54t7VG9Ji7/harpqcwFlsLCrjCEPbzasbHewR4na9964hter6LwgGyIX
	zHm4rQYD7msdNncbis1usBYIoVM7M9+jH83trUe28Q3Wv5R0CllhAOjj8NpWE1fChhSKSGM
	SsTzIpLxA9CC6dDgRHG2boniS2d+cF1S3pyM9f8wE9GdqHOV+hwV5bP4D+vJHWUUYwfSNUP
	fTESbxrygLNfIYLVYpNw7L4nTUI6+KQJTQ0JXmn1NVlCWrtZFH409SWmS9qmWYzf34ROfLF
	VpGy6tXpOTbZxTouwQ1+OHlK4j2Ht0hIi4XP1eMqKC3hH9+2kBEtdKEZYxKK3SaMqpmIhEU
	lIUpqE+2TRFGcZvDMO
X-QQ-XMRINFO: OJlEh3abS6gXi5NWrXbD0WI=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_232016_379448_B01FC98F 
X-CRM114-Status: GOOD (  12.62  )
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

When a section is created by .pushsection in assembly, there is no
reference between the caller function and the newly created section. As a
result, --gc-sections may incorrectly discard the newly created section.

To prevent such incorrect garbage collection, kernel code often wraps these
sections with KEEP() in linker scripts. While this guarantees that the
sections are retained, it introduces a dependency inversion: unused
sections are kept unnecessarily, and any sections they reference are also
forcibly retained. This prevents the linker from eliminating truly unused
code or data.

Introduce a new PUSHSECTION macro in include/linux/compiler.h to create a
proper reference between the .pushsection caller and the generated section.
The macro is fully compatible with all existing .pushsection parameters and
has no side effects, making it safe to replace all current .pushsection
usages with this version.

PUSHSECTION works by emitting a unique label inside the new section, and
adding a relocation from the caller function to that label. This ensures
the linker recognizes the dependency and keeps both sections alive
together. So we don't need to wrap the section with KEEP() in linker
anymore.

To guarantee uniqueness of the section and label names, both __COUNTER__
and %= are used:
Either alone is insufficient:
  - __COUNTER__ alone fails when the function containing PUSHSECTION is
    inlined multiple times, causing duplicate labels.
  - %= alone fails when multiple PUSHSECTION directives appear within a
    single inline assembly block.

In assembly code, a separate definition is provided because the C macro
cannot ensure unique section/label names when expanded inside an assembler
macro (.macro).

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Xiao Liu <lx24@stu.ynu.edu.cn>
Signed-off-by: Peihan Liu <ronbogo@outlook.com>
---
 include/linux/compiler.h | 43 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 5b45ea7dff3e..bba79cedbe24 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -3,6 +3,7 @@
 #define __LINUX_COMPILER_H
 
 #include <linux/compiler_types.h>
+#include <linux/stringify.h>
 
 #ifndef __ASSEMBLY__
 
@@ -267,7 +268,47 @@ static inline void *offset_to_ptr(const int *off)
 	return (void *)((unsigned long)off + *off);
 }
 
-#endif /* __ASSEMBLY__ */
+#ifdef CONFIG_PUSHSECTION_WITH_RELOC
+#define __PUSHSECTION_RELOC(lbl) ".reloc ., BFD_RELOC_NONE, " lbl "\n\t"
+#define __PUSHSECTION_HELPER(prefix) __stringify(prefix.%=) "_" __stringify(__COUNTER__)
+#define __PUSHSECTION_LABEL(lbl) lbl ":\n\t"
+#else
+#define __PUSHSECTION_RELOC(lbl)
+#define __PUSHSECTION_HELPER(prefix) __stringify(prefix)
+#define __PUSHSECTION_LABEL(lbl)
+#endif
+
+#define _PUSHSECTION(lbl, sec, ...)					\
+	__PUSHSECTION_RELOC(lbl)					\
+	".pushsection " sec ", " #__VA_ARGS__ "\n\t" __PUSHSECTION_LABEL(lbl)
+
+#define PUSHSECTION(sec, ...)						\
+	_PUSHSECTION(__PUSHSECTION_HELPER(.Lsec), __PUSHSECTION_HELPER(sec), __VA_ARGS__)
+
+#else /* __ASSEMBLY__ */
+
+#ifdef CONFIG_PUSHSECTION_WITH_RELOC
+#define __PUSHSECTION_RELOC .reloc ., BFD_RELOC_NONE, \label
+#define __PUSHSECTION_HELPER(prefix) prefix\().\@
+#define __PUSHSECTION_LABEL \label:
+#else
+#define __PUSHSECTION_RELOC
+#define __PUSHSECTION_HELPER(prefix) prefix
+#define __PUSHSECTION_LABEL
+#endif
+
+.macro  _PUSHSECTION label:req, section:req, args:vararg
+	__PUSHSECTION_RELOC
+	.pushsection __PUSHSECTION_HELPER(\section), \args
+	__PUSHSECTION_LABEL
+.endm
+
+.macro  PUSHSECTION section:req, args:vararg
+	_PUSHSECTION .Lsec\@, \section, \args
+.endm
+
+#endif /* !__ASSEMBLY__ */
+
 
 #ifdef CONFIG_64BIT
 #define ARCH_SEL(a,b) a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

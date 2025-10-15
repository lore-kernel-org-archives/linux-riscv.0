Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFE3CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcxLbiVSj/wHARGDkpco8Vyt5mU3jYZ1qsOXufTZOY0=; b=ginP4jPM0G1slC
	lwp1v+8vFU4q5+N+E3CxEv9IzYu87op8ta9zo4g5n7HDcInwmI77GNVwaDiXxKaCExSqgZ5mup9U6
	yKMuievjXsByCTakXlypv1ehLqoUAfJo15rxbgnelaSyq770cKYwMBlzuaaRhvPFnJZJj9cz/Te8y
	58jTnEFvNZ9md8N4yo2vQZJMGD+sA4kRrWp/+DPFFozB0q4uacoy/EU7XllWUIUdWyylI+NLg3bg0
	bxBkF97rFiAs4VdQMBhDcrJOck/99Z4aEFLD/Am+0PL9ON9UFbTFe1vXtD4/etOefkULtc7ULEskd
	IZiIufeRVqvxxw4uOTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8uvO-00000000ajx-0Ic2;
	Wed, 15 Oct 2025 06:23:50 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8uvK-00000000ae3-3FwA
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 06:23:48 +0000
X-QQ-mid: esmtpsz19t1760509371td6f1d5ef
X-QQ-Originating-IP: MUaYd5o57zoY0W6wIrPI4YBjDwhi9ENIo8kee4n+TZM=
Received: from GPU-Server-A6000.. ( [202.201.1.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Oct 2025 14:22:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6832363004775497478
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
Subject: [PATCH v2 8/8] riscv: use PUSHSECTION in ex_table, jump_table, bug_table and alternatives
Date: Wed, 15 Oct 2025 14:22:39 +0800
Message-ID: <22B977FCB8434D8A+8905ca92f19047804ba693f7cd3b2ef1e2721bad.1760463245.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760463245.git.tanyuan@tinylab.org>
References: <cover.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: OZiGlmjmGvyhm8XwKSZjejE2w2AJd1XT2qIO4ynT4Q9Dl8pkGcdYDe7j
	7n0zDhkb1yAMlVHWWSABnrSSKVAWeIqoJ1SoXInDMX6oQaE52ehrlqX4TlEMF1vQ4KDkiIf
	8/10wRaoWROJCRE3JFtikuA3LK300eNmtL9+VJBZBAiIqKd2sHQvYNfmNDK6Oua/2AAouuM
	GbJmxPb/Ra33LapAkAmC1+RfFK+xsBIvuPdzS4tS/rrlkqAKAVsvpV2QRUspN9JUABeaZjK
	BC70j1V2O3uqoWFmc8osnYG/7lhVK5L0yEcUsZS5asL2yoFx31D+Vk5Rd0B2zHaAD6fthkj
	LErUxR8sfpHWDi02sW/MieLmTTE98h11qhTpNr0/hEJnCRWKofysSKHWm5KvoGPhsxv5VV1
	49nqQtWhJkf4Rx1e3lqB26ZwsH4hHGwSY8gUA/q1wUTNcEoH7kmGnz6thTvn1zJ4c6L/u6G
	2VwDQLsbl6t6BPcG0ylMGjSHzRydHgjOFyAYKxy9cUJVvwvcPDR2G4qt1Beq1eZevhShUna
	/vK4fx6bw49Vp5z+a1O3CnONSM4su08yL6saCSvKYIMfOaEHe6Y0gSL7DTB63J4p69qBvTQ
	m4zFwUq8bpiOIjg4TbqF+QmNCwtBbrIb9zCOVIHik/rRW5f4g8qVhb4b5Nxe49o+DWr1PbY
	6LHvwLrBfCS2kTKmbSg5fTeKcbh8/hu4T9yhqeJ9gOIGPo46TcAf/LMM3rlVUCI5BRR6+/7
	yDGuKCGmA+9+fpKdSiO+ck5d86BQ5Dj8w4ZqPvbqVei0UiA7gvwhDz7Ul5XLSUZY0hGlPM7
	HySeSQqlHA+OoCQaa4TXVGtbOd9PCrh0/nMSQN/wrSLFW/7dxC7ekIUbqlrVYj7KUS70HiJ
	fIHDI5NtfLx2oYNRZd24DtaoTy9M1poMHU8t3yipK3ClJtb1sZS5VU9Xot2qlaXfp5763TY
	xXYm6LtV/OE4Brz8ETGH77Hvbafxpg9XAivWUYGM2m7AQyhvgwavz+v37
X-QQ-XMRINFO: Mgo7HCA7/T7wHQuXcPxwuSA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_232347_372434_2E7B5465 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Replace plain .pushsection with the new PUSHSECTION macro for __ex_table,
__bug_table, __jump_table, and .alternative on RISC-V.

PUSHSECTION establishes proper references between the caller and the
generated sections, allowing --gc-sections to recognize their dependencies
correctly. This avoids the need for KEEP() and prevents dependency
inversion where unused sections keep others alive.

With this change, CONFIG_TRIM_UNUSED_SYSCALLS can correctly discard unused
syscalls together with their exception tables.

This update takes effect only when built with an assembler that supports
BFD_RELOC_NONE, and falls back to the existing behavior otherwise.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Peihan Liu <ronbogo@outlook.com>
---
 arch/riscv/include/asm/alternative-macros.h |  8 +++++---
 arch/riscv/include/asm/asm-extable.h        | 10 ++++++----
 arch/riscv/include/asm/bug.h                |  2 +-
 arch/riscv/include/asm/jump_label.h         |  3 ++-
 arch/riscv/kernel/vmlinux.lds.S             |  9 ++++++++-
 5 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 9619bd5c8eba..dd24c3e1117b 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -2,9 +2,11 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
+#include <linux/compiler.h>
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
-#ifdef __ASSEMBLER__
+#ifdef __ASSEMBLY__
 
 .macro ALT_ENTRY oldptr newptr vendor_id patch_id new_len
 	.4byte \oldptr - .
@@ -16,7 +18,7 @@
 
 .macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c
 	.if \enable
-	.pushsection .alternative, "a"
+	PUSHSECTION .alternative, "a"
 	ALT_ENTRY 886b, 888f, \vendor_id, \patch_id, 889f - 888f
 	.popsection
 	.subsection 1
@@ -67,7 +69,7 @@
 
 #define ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)		\
 	".if " __stringify(enable) " == 1\n"				\
-	".pushsection .alternative, \"a\"\n"				\
+	PUSHSECTION(.alternative, "a")					\
 	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(patch_id), "889f - 888f") \
 	".popsection\n"							\
 	".subsection 1\n"						\
diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 37d425d7a762..24eb29f2ef82 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_ASM_EXTABLE_H
 #define __ASM_ASM_EXTABLE_H
 
+#include <linux/compiler.h>
+
 #define EX_TYPE_NONE			0
 #define EX_TYPE_FIXUP			1
 #define EX_TYPE_BPF			2
@@ -10,10 +12,10 @@
 
 #ifdef CONFIG_MMU
 
-#ifdef __ASSEMBLER__
+#ifdef __ASSEMBLY__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
-	.pushsection	__ex_table, "a";		\
+	PUSHSECTION __ex_table, "a";			\
 	.balign		4;				\
 	.long		((insn) - .);			\
 	.long		((fixup) - .);			\
@@ -31,8 +33,8 @@
 #include <linux/stringify.h>
 #include <asm/gpr-num.h>
 
-#define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
-	".pushsection	__ex_table, \"a\"\n"		\
+#define __ASM_EXTABLE_RAW(insn, fixup, type, data)      \
+	PUSHSECTION(__ex_table, "a")			\
 	".balign	4\n"				\
 	".long		((" insn ") - .)\n"		\
 	".long		((" fixup ") - .)\n"		\
diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 4c03e20ad11f..855860c34209 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -54,7 +54,7 @@ typedef u32 bug_insn_t;
 #define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
-			".pushsection __bug_table,\"aw\"\n\t"	\
+			PUSHSECTION(__bug_table, "aw")          \
 		"2:\n\t"					\
 		__BUG_ENTRY(file, line, flags) "\n\t"		\
 			".org 2b + " size "\n\t"                \
diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 3ab5f2e3212b..1134a9bc95a7 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -11,13 +11,14 @@
 
 #include <linux/types.h>
 #include <asm/asm.h>
+#include <linux/compiler.h>
 
 #define HAVE_JUMP_LABEL_BATCH
 
 #define JUMP_LABEL_NOP_SIZE 4
 
 #define JUMP_TABLE_ENTRY(key, label)			\
-	".pushsection	__jump_table, \"aw\"	\n\t"	\
+	PUSHSECTION(__jump_table, "aw")	                \
 	".align		" RISCV_LGPTR "		\n\t"	\
 	".long		1b - ., " label " - .	\n\t"	\
 	"" RISCV_PTR "	" key " - .		\n\t"	\
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 61bd5ba6680a..e6d117047226 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -7,6 +7,13 @@
 #define RO_EXCEPTION_TABLE_ALIGN	4
 #define RUNTIME_DISCARD_EXIT
 
+#ifdef CONFIG_PUSHSECTION_WITH_RELOC
+#define NOKEEP___jump_table 1
+#define NOKEEP___ex_table 1
+#define NOKEEP___bug_table 1
+#define NOKEEP_alternative 1
+#endif
+
 #ifdef CONFIG_XIP_KERNEL
 #include "vmlinux-xip.lds.S"
 #else
@@ -117,7 +124,7 @@ SECTIONS
 	. = ALIGN(8);
 	.alternative : {
 		__alt_start = .;
-		KEEP(*(.alternative))
+		COND_KEEP(alternative, *(.alternative*))
 		__alt_end = .;
 	}
 	__init_end = .;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00550C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 01:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CDoq1hhVLDaHoSBMCfVDxZCkENPwpJH3adPRCKXBFRk=; b=G/DjjGofYPaN4M
	jTrHzhIeCRYP5J5fiNIlvu0d3TmUp3diZNKj59aPanVmk+FKkVeZvHTz6HDIkFD9Yu/RupuVUJyeZ
	84nz6DHv5pXZk/XJCiX+5q4u40eZabOaJ3NgCuE+mkXClZwpqRw7601zdKaKoG7mJJdFz+4GqliSt
	0Uh5Gz+/8c13lsPPh3srhM9GwzF50N5Gu/EJ14N2vSn+1mfQKntRkN9LTtAjQB20brBtZ8vEyA0Je
	PwfSwju51Ta4y4nstzQ2Apprnk3MzkINIvUjMHj8nmI6z431YCbOfkfKBmbxZDYhDIHMpCv5AIAFw
	msmnSafHEAMUrD3Bcttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmmU7-000kEO-7q; Fri, 06 May 2022 01:10:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmmTw-000kC0-G9; Fri, 06 May 2022 01:10:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF79861957;
 Fri,  6 May 2022 01:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8BEC385A4;
 Fri,  6 May 2022 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651799406;
 bh=hzTsanNVV38HYHQUJN2xutlIzXpivxib3Q/T7DjiyGs=;
 h=From:To:Cc:Subject:Date:From;
 b=pZCfAc1mWv3g9kzjL4L0pgUMR/b/yxZ+h/SpIizPx90F+QuOlQZW2S0syqCkEWlTp
 W3iyAkH+a5xIMFtJEMl8hD7Ot8ruqlUYIEmBz4mrDXvC5VGIpsUU6HQqDzXJfOlpc3
 QerSZgKRYjqa7uaN4bkd3Zw2c0NG/7Y77RlEKT5irxHcV4f0WtaObwJSSDsK//2z1r
 SNXP1ftOPnm68VQ8DS5zIvjW7M7XVJR0iMMPXwllXZDvJmkFSBbPTquPpvchGOxEkc
 inqJUN4mnWCA9AJe5I2N22kjCfJ8lLooWI3DEMAMGmcly390GXneDDY6Tpn53akJ+h
 LhArxheKTOkxQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Date: Thu,  5 May 2022 18:09:45 -0700
Message-Id: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_181008_657521_EA5E1C80 
X-CRM114-Status: GOOD (  12.96  )
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

With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
pointers are calculated weirdly: based on the beginning of the bug_entry
struct address, rather than their respective pointer addresses.

Make the relative pointers less surprising to both humans and tools by
calculating them the normal way.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/include/asm/asm-bug.h |  4 ++--
 arch/powerpc/include/asm/bug.h   |  5 +++--
 arch/riscv/include/asm/bug.h     |  4 ++--
 arch/s390/include/asm/bug.h      |  5 +++--
 arch/x86/include/asm/bug.h       |  2 +-
 lib/bug.c                        | 15 +++++++--------
 6 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 03f52f84a4f3..c762038ba400 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -14,7 +14,7 @@
 	14472:	.string file;					\
 		.popsection;					\
 								\
-		.long 14472b - 14470b;				\
+		.long 14472b - .;				\
 		.short line;
 #else
 #define _BUGVERBOSE_LOCATION(file, line)
@@ -25,7 +25,7 @@
 #define __BUG_ENTRY(flags) 				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
-	14470:	.long 14471f - 14470b;			\
+	14470:	.long 14471f - .;			\
 _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 		.short flags; 				\
 		.popsection;				\
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index ecbae1832de3..76252576d889 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -13,7 +13,8 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 .macro __EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
-5001:	 .4byte \addr - 5001b, 5002f - 5001b
+5001:	 .4byte \addr - .
+	 .4byte 5002f - .
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -24,7 +25,7 @@
 #else
 .macro __EMIT_BUG_ENTRY addr,file,line,flags
 	 .section __bug_table,"aw"
-5001:	 .4byte \addr - 5001b
+5001:	 .4byte \addr - .
 	 .short \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index d3804a2f9aad..1aaea81fb141 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -30,8 +30,8 @@
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - 2b"
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - 2b"
+#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
+#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
 #define __BUG_ENTRY_FILE	RISCV_PTR " %0"
diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index 0b25f28351ed..aebe1e22c7be 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -15,7 +15,8 @@
 		"1:	.asciz	\""__FILE__"\"\n"		\
 		".previous\n"					\
 		".section __bug_table,\"awM\",@progbits,%2\n"	\
-		"2:	.long	0b-2b,1b-2b\n"			\
+		"2:	.long	0b-.\n"				\
+		"	.long	1b-.\n"				\
 		"	.short	%0,%1\n"			\
 		"	.org	2b+%2\n"			\
 		".previous\n"					\
@@ -30,7 +31,7 @@
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
 		".section __bug_table,\"awM\",@progbits,%1\n"	\
-		"1:	.long	0b-1b\n"			\
+		"1:	.long	0b-.\n"				\
 		"	.short	%0\n"				\
 		"	.org	1b+%1\n"			\
 		".previous\n"					\
diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index aaf0cb0db4ae..a3ec87d198ac 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -18,7 +18,7 @@
 #ifdef CONFIG_X86_32
 # define __BUG_REL(val)	".long " __stringify(val)
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - 2b"
+# define __BUG_REL(val)	".long " __stringify(val) " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
diff --git a/lib/bug.c b/lib/bug.c
index 45a0584f6541..c223a2575b72 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -6,8 +6,7 @@
 
   CONFIG_BUG - emit BUG traps.  Nothing happens without this.
   CONFIG_GENERIC_BUG - enable this code.
-  CONFIG_GENERIC_BUG_RELATIVE_POINTERS - use 32-bit pointers relative to
-	the containing struct bug_entry for bug_addr and file.
+  CONFIG_GENERIC_BUG_RELATIVE_POINTERS - use 32-bit relative pointers for bug_addr and file
   CONFIG_DEBUG_BUGVERBOSE - emit full file+line information for each BUG
 
   CONFIG_BUG and CONFIG_DEBUG_BUGVERBOSE are potentially user-settable
@@ -53,10 +52,10 @@ extern struct bug_entry __start___bug_table[], __stop___bug_table[];
 
 static inline unsigned long bug_addr(const struct bug_entry *bug)
 {
-#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-	return bug->bug_addr;
+#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	return (unsigned long)&bug->bug_addr_disp + bug->bug_addr_disp;
 #else
-	return (unsigned long)bug + bug->bug_addr_disp;
+	return bug->bug_addr;
 #endif
 }
 
@@ -131,10 +130,10 @@ void bug_get_file_line(struct bug_entry *bug, const char **file,
 		       unsigned int *line)
 {
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-	*file = bug->file;
+#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
+	*file = (const char *)&bug->file_disp + bug->file_disp;
 #else
-	*file = (const char *)bug + bug->file_disp;
+	*file = bug->file;
 #endif
 	*line = bug->line;
 #else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

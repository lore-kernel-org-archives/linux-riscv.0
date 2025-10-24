Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD62CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XJncnJPD1YIh2YhqIN2V+6ENJUj0gj6brlooVElUhZw=; b=CAQct6cB8vQe7A
	4DO8Mtrx6YX3nyGKMhR9b++kxyoP8gsk08U5fh157Iz59jI2rShQSBgOkIDLQoe+LOt11fOpPz2PR
	IiiN45kGmldEyekHduy84GZnTdq9tWf+SrAMNiXMfO+cNKBxkV9kVc6HkJN3FxLIT1Aowpf9k12jA
	oRwXqABw7C9rZoFNp1XoP6fjA76NDrry7EbutCaT+F6KBzKLuXN6sINIU6d+ricGUJRx6/LyOEzlm
	ivLBaDInjIYKHQzDKRgdlOC2WUhQtm6gEaFzMhpJ9ScAc5yAvoKyn0ku5QcEncUfS9U/aNtn6rX1h
	5qPgsAF9A805Bg42nbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLPK-0000000A6MB-1yni;
	Fri, 24 Oct 2025 17:16:54 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLPH-0000000A6LY-480g
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 17:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=8e/m9li+SlaXxSpEeSi41A4JQjwESEtDZFav1314P1o=; b=VL5j6m49ZQXdqX
	ITUzLsj9aQNWw8oMX/ZrhW9mFARtonDdqL2WzogE4CScr1fkFvTK7Jg/O+FRXtW3XQS2pO3xcY1d0
	GCUOQTWPCyQ04Gh11go+799TzAowAWSvhQviZtkg94/gXKqxmvD8VfU/ISwcHsHl4jHOb7SkMbnX0
	Z64vuFFcCIMmtONHSp87/9kJvQfSDhSt+XMjfceQHYJaJNnv3FEgu3uEDbVlhSLVNb51MKtP5bsTi
	4fh9F/0Ibgcdg2XahI6KOFC1Zf5jzJV9+MSzERhpJDNfKBg21dHBVXcoEwElcng/AJJf+RLypUnUs
	L8eRfixY5w9VBBFiTK+w==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vCLP8-001jji-4u; Fri, 24 Oct 2025 18:16:42 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1vCLP7-00000000GyM-3Z8k;
	Fri, 24 Oct 2025 18:16:41 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ajones@ventanamicro.com,
	macro@orcam.me.uk,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v3] riscv: asm: use .insn for making custom instructions
Date: Fri, 24 Oct 2025 18:16:40 +0100
Message-Id: <20251024171640.65232-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_101652_101902_E54CEF6E 
X-CRM114-Status: UNSURE (   9.21  )
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

The assembler has .insn for building custom instructions
now, so change the .4byte to .insn. This ensures the output
is marked as an instruction and not as data which may
confuse both debuggers and anything else that relies on
this sort of marking.

Add an ASM_INSN_I() wrapper in asm.h to allow the selecting
of how this is output so older assemblers are still good.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - fixed #ifndef v #ifdef
  - added custom MIPS instructions too
  - new patch description
v3:
  - fixed typo missed in compile test of NOP4
  - fixed incorrect MIPS changes
  - re-wored slightly to shorten sentences and remove typos
---
 arch/riscv/include/asm/asm.h                    | 6 ++++++
 arch/riscv/include/asm/insn-def.h               | 8 ++++----
 arch/riscv/include/asm/vendor_extensions/mips.h | 6 +++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 8bd2a11382a3..2d97436999ca 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -12,6 +12,12 @@
 #define __ASM_STR(x)	#x
 #endif
 
+#ifdef CONFIG_AS_HAS_INSN
+#define ASM_INSN_I(__x) ".insn " __x
+#else
+#define ASM_INSN_I(__x) ".4byte " __x
+#endif
+
 #if __riscv_xlen == 64
 #define __REG_SEL(a, b)	__ASM_STR(a)
 #elif __riscv_xlen == 32
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index c9cfcea52cbb..d29da6ccd3dd 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -256,10 +256,10 @@
 	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
 	       SIMM12((offset) & 0xfe0), RS1(base))
 
-#define RISCV_PAUSE	".4byte 0x100000f"
-#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
-#define ZAWRS_WRS_STO	".4byte 0x01d00073"
-#define RISCV_NOP4	".4byte 0x00000013"
+#define RISCV_PAUSE	ASM_INSN_I("0x100000f")
+#define ZAWRS_WRS_NTO	ASM_INSN_I("0x00d00073")
+#define ZAWRS_WRS_STO	ASM_INSN_I("0x01d00073")
+#define RISCV_NOP4	ASM_INSN_I("0x00000013")
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
diff --git a/arch/riscv/include/asm/vendor_extensions/mips.h b/arch/riscv/include/asm/vendor_extensions/mips.h
index ea8ca747d691..ffeb12dc17a3 100644
--- a/arch/riscv/include/asm/vendor_extensions/mips.h
+++ b/arch/riscv/include/asm/vendor_extensions/mips.h
@@ -30,8 +30,8 @@ extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips;
  * allowing any subsequent instructions to fetch.
  */
 
-#define MIPS_PAUSE	".4byte 0x00501013\n\t"
-#define MIPS_EHB	".4byte 0x00301013\n\t"
-#define MIPS_IHB	".4byte 0x00101013\n\t"
+#define MIPS_PAUSE	ASM_INSN_I("0x00501013\n\t")
+#define MIPS_EHB	ASM_INSN_I("0x00301013\n\t")
+#define MIPS_IHB	ASM_INSN_I("0x00101013\n\t")
 
 #endif // _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

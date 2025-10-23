Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579EDCCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pudcUvjKwtXv55Iu7ReWLta++iNl4i2JLf3gMxhfRhg=; b=U5yqMfIOcz52DI
	MFUh56hTXyPBJGRit0NXqdyH7CR9Lust2tyQqIDR+leQG0c2YGMIw5bz8vp8UAOgqN15oLUHaPHZ6
	lJc2lfrdslUITOu9pUkt5uZW7J0/LYdb1Mg8x6Qr/HFDJpmzw1bzofj4KdWCMZtk0kmHDds+fL9tz
	0rJ8TUufsfl4lhnVp6J9NMflq0/8Wfwk9KavqWS6XCwb1XF8z9y/xTgx2+sAEjXfaAj5JYG79Vpei
	ZHddKPDbA93rrwKx1zdx3rC+TAg+O9AHdhY8I0lcNvk8kcLx/MlPpFXR2vH6PHXDMwglhDdUziCQO
	uygiGWwgXo3CM4zUL11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzJ3-000000076A4-1aPv;
	Thu, 23 Oct 2025 17:40:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzJ0-0000000769N-03oa
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=NA76Bs2vV3kegFpbjpPniVtFvOex2OmFuZqQa4tHwrY=; b=chFjAT2pdzFpcAAbT5iaeC8u7v
	tvszUfhaQdikiyaW2hrD/6VYzCQz7NbS1t66r6v+jt800ZzKQcy5u2YLpgelLjedFV5vDv0xfB+3F
	WpEj4lQLbuij8AjvO+XMI2cuddDQGM9C5XxykZrXg0X47o6hJ3s0XR1O/y1IJnvdbjYDwTWdz/+vG
	p+Y2J/Goprp0/aFMp/BX1Mx5BwCWPGvewr4TLGP12V9oynAO4DH2kPjkLih5g6U9Ri2oCRJ44WL9K
	hFXplHsTHlnDzMUhavK5jYDCF20zeZHZsWx46PJDv4cynYZ7NPWucteUCxymZ45LYzqg+Yi4lSlfM
	RC6eFcjw==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByRI-00000001YRi-18AW
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 16:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=NA76Bs2vV3kegFpbjpPniVtFvOex2OmFuZqQa4tHwrY=; b=ZbNGFdgsBv7QvD
	ahg0Px0icgIXqx1E8iFm2l0TUNoOglu915mPGbq0c9CXvHXjYVTXTabF5BxiEhNlEqaTy76Jmc/pr
	6vlUyNqEA2ZzB9Gyu8wNLFy6XsQziA7773oXD3r5guiaMF/cI6cdGKFqvYAR6qCv5qB58GmyaBhGm
	0K/LeNdQ0MNePU1SHd3ORIISS2U/zmfOw4wtD25Pko1rOsVrfUD/t1cs4LlxAL5qPOaIUl4Z+olU3
	QGdTT26Q+0z+CG2swLQXATqOqIGsGm7uv3fgS6KqdDg0K31DkQztzxeCsXEvHeyQMDE3MKzbJdgw1
	a3vG9k/uV9Jzb4lUrgsA==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vBzIq-000xhU-NI; Thu, 23 Oct 2025 18:40:44 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1vBzIp-00000004LyM-3xi7;
	Thu, 23 Oct 2025 18:40:43 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ajones@ventanamicro.com,
	macro@orcam.me.uk,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2] riscv: asm: use .insn for making custom instructioons
Date: Thu, 23 Oct 2025 18:40:40 +0100
Message-Id: <20251023174040.1037765-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_174524_382816_9D2BF25C 
X-CRM114-Status: UNSURE (   8.72  )
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
now, so remove the .4byte which also ensures the output
is marked as an instruction and not as data (which may
confuse both debuggers and anything else that relies on
this sort of marking)

Add an ASM_INSN_I() wrapper in asm.h to allow the selecting
of how this is output so older assemblers are still good.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - fixed #ifndef v #ifdef
  - added custom MIPS instructions too
  -
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
index c9cfcea52cbb..a7860e6b908d 100644
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
+#define RISCV_NOP4	ASM_INSN(_U"0x00000013")
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
diff --git a/arch/riscv/include/asm/vendor_extensions/mips.h b/arch/riscv/include/asm/vendor_extensions/mips.h
index ea8ca747d691..bcdce3ef3869 100644
--- a/arch/riscv/include/asm/vendor_extensions/mips.h
+++ b/arch/riscv/include/asm/vendor_extensions/mips.h
@@ -30,8 +30,8 @@ extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_mips;
  * allowing any subsequent instructions to fetch.
  */
 
-#define MIPS_PAUSE	".4byte 0x00501013\n\t"
-#define MIPS_EHB	".4byte 0x00301013\n\t"
-#define MIPS_IHB	".4byte 0x00101013\n\t"
+#define MIPS_PAUSE	ASM_INSN_I("0x00501013\n\t")
+#define MIPS_EHB	ASM_INSN_I(".4byte 0x00301013\n\t")
+#define MIPS_IHB	ASM_INSN_I(".4byte 0x00101013\n\t")
 
 #endif // _ASM_RISCV_VENDOR_EXTENSIONS_MIPS_H
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

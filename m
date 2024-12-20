Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9260AE7718E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHpUfDbx1guUl4/FIU01sA3PkriImDbli+deyWWo4uE=; b=yZXDP/109Vg8fN
	gq/tS/dWpVWJwYtYIbtVb/MRylUSC3M8xzdsCQSRU58lNrWI8ACaEe9aD3FdENztqVAKLEpSL9aDg
	kPdazh4+EfyvCrP1vP5BDJKou91bK0g1CQZamwjcPAD6jp4wi/oGI8itlLoX3qoU1m5Z8GYRDUtOS
	XD2MeBJ+ZTeV5hgH9+1lChxu2t6Jb/0pGa43e5olZjIIbEX8gFhO9UbQdA86tg8nEn6D7YmuPazK9
	STFYvUxO6KmLTKuUunBvUq6bP/hjp3Gt3RCVB0/3vAqisR2OImTvMAEmJurSYMI+9rlg6jjSbfsYd
	RbIArnvtDLUdTWuLKrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOL-00000005Nwz-0Z7c;
	Fri, 20 Dec 2024 15:58:17 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005Nqg-264W
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ICpbFOgV9PGl+al5ON3gHos7XEkWEkbRVLI2bTeRW0w=; b=PXo56o5D2ARae08cJnRavtmezV
	CzMQQkJ4VFlAuvnR4T8/HWrPKaILHMXLMnn0Kay/Hd8grtWZLJ4KANyci+hLg3+1ymdtkPzsi9oyE
	sO8SIBSQbJz0AqxTwtPYoBzv/lQAUg//WPiGLzp3sMFRucnZmZ6oAr/D+4EijlXMp34Z7C1dE6qXA
	ZMsbwDCVu5AzJRWM3P70Xm+6lUMwcnJdXOsGXGwJeR6E6KxIbBAc63ngyqMeYeyUqH7TvWdP3dEni
	1NVOCYbQhahRKgUOnpp0CNGwbHVi4ipBJMFndSySRgQanM2jJciy6cvTMHAvFxrNcRBUS+1Ii0her
	cuulUCZw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-006axl-4E; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSn-32AK;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 05/15] riscv: asm: use .insn for making custom instructioons
Date: Fri, 20 Dec 2024 15:57:51 +0000
Message-Id: <20241220155801.1988785-6-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_597253_6AF2D012 
X-CRM114-Status: UNSURE (   7.23  )
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

Using .word breaks with big endian builds, making something which
is not a valid or worse an instruction or pair that does something
which is not intended.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/insn-def.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 9a913010cdd9..f6dd6d963de9 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -196,8 +196,14 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
+#ifndef CONFIG_AS_HAS_INSN
 #define RISCV_PAUSE	".4byte 0x100000f"
 #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
 #define ZAWRS_WRS_STO	".4byte 0x01d00073"
+#else
+#define RISCV_PAUSE	".insn 0x100000f"
+#define ZAWRS_WRS_NTO	".insn 0x00d00073"
+#define ZAWRS_WRS_STO	".insn 0x01d00073"
+#endif
 
 #endif /* __ASM_INSN_DEF_H */
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

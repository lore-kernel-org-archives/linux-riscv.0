Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EEEC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JaQMBwSqKGTVSN9LyWNhimSM26Nssp4qH69dtr2Tqzs=; b=maLUcovNBBNi1z
	Sw5T4C+mCmcQZFbuT1iIgrH6Pv53zvdGdm6ipPXtK1/HV9rJ7fZRDYZNnyzr17b/EV8poqCTawIZU
	vhGxfoP1WIym3oq0ic7HMpJ4eU1M1ILvVu6CPbzFRMWEApnmE/mvBSIrroAzudJmRmlbOQJbYmXMd
	arx9yajl06ed1p9r5B4ZhAe8QKSSCDko10lF0RLN22xN3NjEasWdCt7zKkXg739+W07oD2kIgz4ZV
	4GXGfJUNVQ8MuSh9XirhteRgoir886AnR79LISIMljQ6US860gYuPGf2wncG1p27V+QGfZisBQ5y2
	tETdvB6K1FVVKjWPbbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGlD-00Gav1-0r;
	Tue, 23 Jan 2024 13:24:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGlA-00Gat6-1v
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 13:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36F0361D4D;
	Tue, 23 Jan 2024 13:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0F6C433F1;
	Tue, 23 Jan 2024 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706016220;
	bh=0RGNHFInxFQRBM29nCBUXg7rUT8MFbgsXfxi0b/Mf3o=;
	h=From:To:Cc:Subject:Date:From;
	b=HDsdxTCPF2P8K6rIbqpCVoXFAaJMHGYEHl/5rvQT08ljmM5S+A1N+8n6SEbg37UrZ
	 haKP5Mxsx78xdiZzUoW6l8J0KNzhBUuO3BoyKjQBZ73dosoIMGDg2m52H7psIuxJQH
	 5Jcugn+deUs8HeTfr5/b9S07L942RzQmS0UesSgWhrRaJTAVCLW7PS9CXmLeK0XcnB
	 E5yj4eC33L7JH5ENXkgFu65QRES6Lml1d4qXR/YtnVIYSvW145uoed3RHgHz4i5XKm
	 lnn5/r67EHpwzNIUz3i34+oy1CxWQQujKy5WS7FaZnDSZsrqN6BGUccYHDLGnGUnN1
	 p/ssMhEAlE7sA==
From: Arnd Bergmann <arnd@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] sh: use generic uaccess
Date: Tue, 23 Jan 2024 14:23:20 +0100
Message-Id: <20240123132335.2034611-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_052412_735028_F756C2B5 
X-CRM114-Status: GOOD (  10.09  )
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

From: Arnd Bergmann <arnd@arndb.de>

As reported by many people, the nommu SH code runs into a compiler error
with a newly added syscall:

  + {standard input}: Error: displacement to undefined symbol .L105 overflows 8-bit field :  => 590, 593
  + {standard input}: Error: displacement to undefined symbol .L135 overflows 8-bit field :  => 603
  + {standard input}: Error: displacement to undefined symbol .L140 overflows 8-bit field :  => 606
  + {standard input}: Error: displacement to undefined symbol .L76 overflows 12-bit field:  => 591, 594
  + {standard input}: Error: displacement to undefined symbol .L77 overflows 8-bit field : 607 => 607, 582, 585
  + {standard input}: Error: displacement to undefined symbol .L97 overflows 12-bit field:  => 607
  + {standard input}: Error: pcrel too far: 604, 590, 577, 593, 572, 569, 598, 599, 596, 610 => 610, 574, 599, 569, 598, 596, 601, 590, 604, 595, 572, 577, 593

Avoid the code that triggers this entirely by using the same generic
uaccess code that m68k and riscv have on nommu.

Link: https://lore.kernel.org/all/07d8877b-d933-46f4-8ca4-c10ed602f37e@app.fastmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sh/include/asm/uaccess.h    |  5 +++++
 arch/sh/include/asm/uaccess_32.h | 23 -----------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/sh/include/asm/uaccess.h b/arch/sh/include/asm/uaccess.h
index a79609eb14be..b42764d55901 100644
--- a/arch/sh/include/asm/uaccess.h
+++ b/arch/sh/include/asm/uaccess.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_UACCESS_H
 #define __ASM_SH_UACCESS_H
 
+#ifdef CONFIG_MMU
 #include <asm/extable.h>
 #include <asm-generic/access_ok.h>
 
@@ -130,4 +131,8 @@ struct mem_access {
 int handle_unaligned_access(insn_size_t instruction, struct pt_regs *regs,
 			    struct mem_access *ma, int, unsigned long address);
 
+#else
+#include <asm-generic/uaccess.h>
+#endif
+
 #endif /* __ASM_SH_UACCESS_H */
diff --git a/arch/sh/include/asm/uaccess_32.h b/arch/sh/include/asm/uaccess_32.h
index 5d7ddc092afd..e053f2fd245c 100644
--- a/arch/sh/include/asm/uaccess_32.h
+++ b/arch/sh/include/asm/uaccess_32.h
@@ -35,7 +35,6 @@ do {								\
 	}							\
 } while (0)
 
-#ifdef CONFIG_MMU
 #define __get_user_asm(x, addr, err, insn) \
 ({ \
 __asm__ __volatile__( \
@@ -56,16 +55,6 @@ __asm__ __volatile__( \
 	".previous" \
 	:"=&r" (err), "=&r" (x) \
 	:"m" (__m(addr)), "i" (-EFAULT), "0" (err)); })
-#else
-#define __get_user_asm(x, addr, err, insn)		\
-do {							\
-	__asm__ __volatile__ (				\
-		"mov." insn "	%1, %0\n\t"		\
-		: "=&r" (x)				\
-		: "m" (__m(addr))			\
-	);						\
-} while (0)
-#endif /* CONFIG_MMU */
 
 extern void __get_user_unknown(void);
 
@@ -140,7 +129,6 @@ do {							\
 	}						\
 } while (0)
 
-#ifdef CONFIG_MMU
 #define __put_user_asm(x, addr, err, insn)			\
 do {								\
 	__asm__ __volatile__ (					\
@@ -164,17 +152,6 @@ do {								\
 		: "memory"					\
 	);							\
 } while (0)
-#else
-#define __put_user_asm(x, addr, err, insn)		\
-do {							\
-	__asm__ __volatile__ (				\
-		"mov." insn "	%0, %1\n\t"		\
-		: /* no outputs */			\
-		: "r" (x), "m" (__m(addr))		\
-		: "memory"				\
-	);						\
-} while (0)
-#endif /* CONFIG_MMU */
 
 #if defined(CONFIG_CPU_LITTLE_ENDIAN)
 #define __put_user_u64(val,addr,retval) \
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

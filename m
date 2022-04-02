Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B3BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpW17shTy2bO94/wwsd6h12FqnEnGwUQUDasFTb4dyg=; b=p7/5qQLygPEr7V
	ebacBeNactIzvMspxzBg/9szucL2Uz8e6RkRCo1gkHgLgtZyvZGUe3Lk8lyblrZhqVJN3+x99JCsU
	wGPH5WuAIHb9/O+tdgvCYh4gYD3BHD+LG/SKmi1ysyT9alcB7n3BrJNyyWgV9vC0+PhwLa1K+W5mY
	y8VMrnPnsUaTKFhKnG3G+ATQ7gKt2mMKzidWJm20RiFATXfv7C4HU0c2QsKA5b0DeWbupcbbkCBez
	LkI2QMdUdKDqdvApRO+y1zP7IH1JRepRxK8uAwaUckAi4YkPmNvfoXD4DQmEpnm14rmgDdzF1b6lz
	PvFFh222iVDH8hjvWBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naeIA-0095aC-V2; Sat, 02 Apr 2022 13:59:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naeBt-00922X-Uy; Sat, 02 Apr 2022 13:53:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30419B808C0;
 Sat,  2 Apr 2022 13:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F98C340EE;
 Sat,  2 Apr 2022 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648907598;
 bh=x++Mq2RxURkLMg1JsydDN/FlbWbJrQ+uoj7qljhzM7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T6df5Gh2nscfUrDOB3SPGX9ki5NuOtkECS9mz2wAY2wj0ZLSgF1Ppqd02gkVUIJDb
 Ni7epPcxvVrahecGf67TTkIT2iGQcDSUhZr7X9gTZXyCBWo9FX+tP4Ukf3Yv17njXF
 8sUqYd4VctC1Ql++Yn/2j+VxokAtCvA90UMXvRRFIluWg73+OvpZywd19deGY106ks
 TiLuoDns+ho4f4V6G7ykCqMs7tangFGaEaoJ3bAFkv6kuAY9UpwXYBlXNww4ApnNls
 mESqaB2evzSynrNMEXSPjaz/xz/soy9NED2scavJOzFM4BSHf2NRgjjb1va5yNOVzK
 aMzTnlJisVw8g==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de
Subject: [PATCH V11 01/20] uapi: simplify __ARCH_FLOCK{,64}_PAD a little
Date: Sat,  2 Apr 2022 21:52:37 +0800
Message-Id: <20220402135256.2691868-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402135256.2691868-1-guoren@kernel.org>
References: <20220402135256.2691868-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_065322_332869_C3775EE6 
X-CRM114-Status: GOOD (  13.49  )
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

From: Christoph Hellwig <hch@lst.de>

Don't bother to define the symbols empty, just don't use them.
That makes the intent a little more clear.

Remove the unused HAVE_ARCH_STRUCT_FLOCK64 define and merge the
32-bit mips struct flock into the generic one.

Add a new __ARCH_FLOCK_EXTRA_SYSID macro following the style of
__ARCH_FLOCK_PAD to avoid having a separate definition just for
one architecture.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/mips/include/uapi/asm/fcntl.h     | 26 +++-----------------------
 include/uapi/asm-generic/fcntl.h       | 19 +++++++------------
 tools/include/uapi/asm-generic/fcntl.h | 19 +++++++------------
 3 files changed, 17 insertions(+), 47 deletions(-)

diff --git a/arch/mips/include/uapi/asm/fcntl.h b/arch/mips/include/uapi/asm/fcntl.h
index 42e13dead543..9e44ac810db9 100644
--- a/arch/mips/include/uapi/asm/fcntl.h
+++ b/arch/mips/include/uapi/asm/fcntl.h
@@ -50,30 +50,10 @@
 #define F_SETLKW64	35
 #endif
 
-/*
- * The flavours of struct flock.  "struct flock" is the ABI compliant
- * variant.  Finally struct flock64 is the LFS variant of struct flock.	 As
- * a historic accident and inconsistence with the ABI definition it doesn't
- * contain all the same fields as struct flock.
- */
-
 #if _MIPS_SIM != _MIPS_SIM_ABI64
-
-#include <linux/types.h>
-
-struct flock {
-	short	l_type;
-	short	l_whence;
-	__kernel_off_t	l_start;
-	__kernel_off_t	l_len;
-	long	l_sysid;
-	__kernel_pid_t l_pid;
-	long	pad[4];
-};
-
-#define HAVE_ARCH_STRUCT_FLOCK
-
-#endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
+#define __ARCH_FLOCK_EXTRA_SYSID	long l_sysid;
+#define __ARCH_FLOCK_PAD		long pad[4];
+#endif
 
 #include <asm-generic/fcntl.h>
 
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index ecd0f5bdfc1d..77aa9f2ff98d 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -192,25 +192,19 @@ struct f_owner_ex {
 
 #define F_LINUX_SPECIFIC_BASE	1024
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
-	__ARCH_FLOCK_PAD
-};
+#ifdef	__ARCH_FLOCK_EXTRA_SYSID
+	__ARCH_FLOCK_EXTRA_SYSID
 #endif
-
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+#ifdef	__ARCH_FLOCK_PAD
+	__ARCH_FLOCK_PAD
 #endif
+};
 
 struct flock64 {
 	short  l_type;
@@ -218,8 +212,9 @@ struct flock64 {
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
+#ifdef	__ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
-};
 #endif
+};
 
 #endif /* _ASM_GENERIC_FCNTL_H */
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index ac190958c981..99bc9b15ce2b 100644
--- a/tools/include/uapi/asm-generic/fcntl.h
+++ b/tools/include/uapi/asm-generic/fcntl.h
@@ -187,25 +187,19 @@ struct f_owner_ex {
 
 #define F_LINUX_SPECIFIC_BASE	1024
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
-	__ARCH_FLOCK_PAD
-};
+#ifdef	__ARCH_FLOCK_EXTRA_SYSID
+	__ARCH_FLOCK_EXTRA_SYSID
 #endif
-
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+#ifdef	__ARCH_FLOCK_PAD
+	__ARCH_FLOCK_PAD
 #endif
+};
 
 struct flock64 {
 	short  l_type;
@@ -213,8 +207,9 @@ struct flock64 {
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
+#ifdef	__ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
-};
 #endif
+};
 
 #endif /* _ASM_GENERIC_FCNTL_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

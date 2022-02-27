Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA8AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Feb 2022 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SybfhtR+Y5UwqxgySt8SMWT9/guTLjXZqhJLFtPkCo=; b=CXlP0TYaL92yLy
	WPBs2aS53vZ5JhSPSGjbaxczKfwcSy4gR0LbajO1jPZSyIpG+ko7gdzReEaPFs3ZaLnaKXhgfbwRz
	81B9f7wjA3IZ9yWvjQle3Yfm1r7IZOLA5+Q4hJdLZuVEZ6FZRyyk5um+0NdsXWKB6o/dveWHQj0kA
	IY7TMwsC1igONQuGr8KRE6fnOwtDTtJMVmjUwEnIjNfk43sP9TDgXrHB4HUt38B//7U7y/G0sJmFO
	uZu1MqmsUeuCCDGGqZxtPiOQLipgYlmkWSwDPD4xQ2txWbSpOqy2O0eYvak7DkghuJzDhn1dM0PpE
	mFQqYZUfcdW3WJSUrH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOMSy-009hIY-N3; Sun, 27 Feb 2022 16:32:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOMQI-009fjb-O0; Sun, 27 Feb 2022 16:29:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42F3960F9A;
 Sun, 27 Feb 2022 16:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38264C340F4;
 Sun, 27 Feb 2022 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645979366;
 bh=2HIl30aCHVRBUeHgQXhp1ucCggBVRdD0QRrkHU55bs8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XGX+/PCxWT2NfYZRbIEJ9cSQ+v0izxHWxt83de673Pcf4vGkqo8xfpBdPloHKwtmd
 rcnnh5xrCxzQRVa25JhWSxstQ9HiHgP8zO+B4g8wfPxVnb+LyeBYqjTLr8Vhlizp6s
 rRYltH5C5r4YccBcOB0notr9CnMD2Db4GXFzCp3OQOkgpJwS5UGiXDOGL2UnFglL0C
 ZgD8uwbIncrGVsBDXzqaqryur7NXMf9jO5V08lO6TnMpK6Q91sOiSgwMNLvhm29clS
 tpj+DPP245oPNA9pSe4aSaATaaw+flAYlQvZkw4m8fa0dW4z3g+YimUP98yPNIcJqt
 2QdjdzDlFez/g==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V7 05/20] fs: stat: compat: Add __ARCH_WANT_COMPAT_STAT
Date: Mon, 28 Feb 2022 00:28:16 +0800
Message-Id: <20220227162831.674483-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227162831.674483-1-guoren@kernel.org>
References: <20220227162831.674483-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_082926_899118_D02A3F5C 
X-CRM114-Status: GOOD (  11.48  )
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

From: Guo Ren <guoren@linux.alibaba.com>

RISC-V doesn't neeed compat_stat, so using __ARCH_WANT_COMPAT_STAT
to exclude unnecessary SYSCALL functions.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/arm64/include/asm/unistd.h   | 1 +
 arch/mips/include/asm/unistd.h    | 2 ++
 arch/parisc/include/asm/unistd.h  | 1 +
 arch/powerpc/include/asm/unistd.h | 1 +
 arch/s390/include/asm/unistd.h    | 1 +
 arch/sparc/include/asm/unistd.h   | 1 +
 arch/x86/include/asm/unistd.h     | 1 +
 fs/stat.c                         | 2 +-
 8 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index 4e65da3445c7..037feba03a51 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -3,6 +3,7 @@
  * Copyright (C) 2012 ARM Ltd.
  */
 #ifdef CONFIG_COMPAT
+#define __ARCH_WANT_COMPAT_STAT
 #define __ARCH_WANT_COMPAT_STAT64
 #define __ARCH_WANT_SYS_GETHOSTNAME
 #define __ARCH_WANT_SYS_PAUSE
diff --git a/arch/mips/include/asm/unistd.h b/arch/mips/include/asm/unistd.h
index c2196b1b6604..25a5253db7f4 100644
--- a/arch/mips/include/asm/unistd.h
+++ b/arch/mips/include/asm/unistd.h
@@ -50,6 +50,8 @@
 # ifdef CONFIG_32BIT
 #  define __ARCH_WANT_STAT64
 #  define __ARCH_WANT_SYS_TIME32
+# else
+#  define __ARCH_WANT_COMPAT_STAT
 # endif
 # ifdef CONFIG_MIPS32_O32
 #  define __ARCH_WANT_SYS_TIME32
diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/asm/unistd.h
index cd438e4150f6..14e0668184cb 100644
--- a/arch/parisc/include/asm/unistd.h
+++ b/arch/parisc/include/asm/unistd.h
@@ -168,6 +168,7 @@ type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
 #define __ARCH_WANT_SYS_CLONE
 #define __ARCH_WANT_SYS_CLONE3
 #define __ARCH_WANT_COMPAT_SYS_SENDFILE
+#define __ARCH_WANT_COMPAT_STAT
 
 #ifdef CONFIG_64BIT
 #define __ARCH_WANT_SYS_TIME
diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index 5eb462af6766..b1129b4ef57d 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -44,6 +44,7 @@
 #define __ARCH_WANT_SYS_TIME
 #define __ARCH_WANT_SYS_UTIME
 #define __ARCH_WANT_SYS_NEWFSTATAT
+#define __ARCH_WANT_COMPAT_STAT
 #define __ARCH_WANT_COMPAT_SYS_SENDFILE
 #endif
 #define __ARCH_WANT_SYS_FORK
diff --git a/arch/s390/include/asm/unistd.h b/arch/s390/include/asm/unistd.h
index 9e9f75ef046a..4260bc5ce7f8 100644
--- a/arch/s390/include/asm/unistd.h
+++ b/arch/s390/include/asm/unistd.h
@@ -28,6 +28,7 @@
 #define __ARCH_WANT_SYS_SIGPENDING
 #define __ARCH_WANT_SYS_SIGPROCMASK
 # ifdef CONFIG_COMPAT
+#   define __ARCH_WANT_COMPAT_STAT
 #   define __ARCH_WANT_SYS_TIME32
 #   define __ARCH_WANT_SYS_UTIME32
 # endif
diff --git a/arch/sparc/include/asm/unistd.h b/arch/sparc/include/asm/unistd.h
index 1e66278ba4a5..d6bc76706a7a 100644
--- a/arch/sparc/include/asm/unistd.h
+++ b/arch/sparc/include/asm/unistd.h
@@ -46,6 +46,7 @@
 #define __ARCH_WANT_SYS_TIME
 #define __ARCH_WANT_SYS_UTIME
 #define __ARCH_WANT_COMPAT_SYS_SENDFILE
+#define __ARCH_WANT_COMPAT_STAT
 #endif
 
 #ifdef __32bit_syscall_numbers__
diff --git a/arch/x86/include/asm/unistd.h b/arch/x86/include/asm/unistd.h
index 80e9d5206a71..761173ccc33c 100644
--- a/arch/x86/include/asm/unistd.h
+++ b/arch/x86/include/asm/unistd.h
@@ -22,6 +22,7 @@
 #  include <asm/unistd_32_ia32.h>
 #  define __ARCH_WANT_SYS_TIME
 #  define __ARCH_WANT_SYS_UTIME
+#  define __ARCH_WANT_COMPAT_STAT
 #  define __ARCH_WANT_COMPAT_SYS_PREADV64
 #  define __ARCH_WANT_COMPAT_SYS_PWRITEV64
 #  define __ARCH_WANT_COMPAT_SYS_PREADV64V2
diff --git a/fs/stat.c b/fs/stat.c
index 28d2020ba1f4..ffdeb9065d53 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -639,7 +639,7 @@ SYSCALL_DEFINE5(statx,
 	return do_statx(dfd, filename, flags, mask, buffer);
 }
 
-#ifdef CONFIG_COMPAT
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_STAT)
 static int cp_compat_stat(struct kstat *stat, struct compat_stat __user *ubuf)
 {
 	struct compat_stat tmp;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

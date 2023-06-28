Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30185EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYhO3QzMmu1pZy2l+QMY3jPkERt2MIWPuyGJOjjTwb8=; b=rqaNFNpHet3kV1
	goQHlgS/4Hb+Zp7U+z3J7U4qFJB3af6XioX+r4y8O0XSzQs3QeHlQKWmYEpIdrGqemzqt/teV3XPh
	bTyhnPBrpi79Wm5d/DdGR4lfNHrX8adqrAq2ItkhRSqYYXQwPZ8IsU3iNkcnAdNJNtVfFOIrm+vCu
	FIRpEqm1mdAsXf2U2ydmfFkSWWR//TH0XCUizpQPrjcvCS/drsYZ1rHTpT/MTvzWr1eb/rUTK3OTl
	sb3S+7iik9p3R8dKrc2CyCAWs3osUrbrshVyMFN8sI9zTWWjnGXUV1Zd+bUNcuykCGTtnsK6ycPpg
	o3tXnw0ADKgeTv+1FRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVT3-00Fnga-2m;
	Wed, 28 Jun 2023 13:44:21 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVSz-00Fne8-2e
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:44:19 +0000
X-QQ-mid: bizesmtp71t1687959834tnnavfbr
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:43:53 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: Y6Kc/cQg3lZMtgn2kxiU6zmEGNcj28TJS0EgbFpP4twIX+T9y2B6p0bOn3MWv
	kwvUR4P1W5/nG5q1ysHmSUWyO41+7CgGe/G/5Cr9uT7VV9/dHhRkxOPPx8eQM51V/NExjV5
	NnAojSJ9NLly/nYfbygC8y0tCztiSKCNMJjl2tyv6UelKR7tTEonhyqEbq5SY9F/isScf+J
	CVkN9WiXJ7yUkVDmYOdChCbet5bOziyBbcdV46eQkF+gQF230AShRQ//qpPP/8+FrE3HBc/
	mlOEG2WWVXjDZZyYRWG4u/NjvjF3ZNtMw1lVdF+2tC8WkonX/j1Ou8lbp3JZSN6w1SZ/N1F
	UT+xC1U6JoBtLl8IkZcz//WavDz3ZKXZZWvncWZbo14gwTYVbmwEqrTyZWtdg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10849030665645760256
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 11/14] tools/nolibc: clean up mmap() support
Date: Wed, 28 Jun 2023 21:41:13 +0800
Message-Id: <f054cd45de26bccb330ad842bc2b3b708b2a429d.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_064418_154993_5596DA92 
X-CRM114-Status: GOOD (  10.44  )
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

Do several cleanups together:

- Since all supported architectures have my_syscall6() now, remove the
  #ifdef check.

- Move the mmap() related macros to tools/include/nolibc/types.h and
  reuse most of them from <linux/mman.h>

- Apply the new __sysret() to convert the calling of sys_map() to
  oneline code

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h   | 24 +-----------------------
 tools/include/nolibc/types.h |  6 ++++++
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index b6125e600dc2..e0ac95a4bfa1 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -632,26 +632,11 @@ int mknod(const char *path, mode_t mode, dev_t dev)
 	return __sysret(sys_mknod(path, mode, dev));
 }
 
-#ifndef MAP_SHARED
-#define MAP_SHARED		0x01	/* Share changes */
-#define MAP_PRIVATE		0x02	/* Changes are private */
-#define MAP_SHARED_VALIDATE	0x03	/* share + validate extension flags */
-#endif
-
-#ifndef MAP_FAILED
-#define MAP_FAILED ((void *)-1)
-#endif
-
 #ifndef sys_mmap
 static __attribute__((unused))
 void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
 	       off_t offset)
 {
-#ifndef my_syscall6
-	/* Function not implemented. */
-	return (void *)-ENOSYS;
-#else
-
 	int n;
 
 #if defined(__NR_mmap2)
@@ -662,20 +647,13 @@ void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
 #endif
 
 	return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
-#endif
 }
 #endif
 
 static __attribute__((unused))
 void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
 {
-	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
-
-	if ((unsigned long)ret >= -4095UL) {
-		SET_ERRNO(-(long)ret);
-		ret = MAP_FAILED;
-	}
-	return ret;
+	return (void *)__sysret((unsigned long)sys_mmap(addr, length, prot, flags, fd, offset));
 }
 
 static __attribute__((unused))
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index f96e28bff4ba..bed62da7877c 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -10,6 +10,7 @@
 #include "std.h"
 #include <linux/time.h>
 #include <linux/stat.h>
+#include <linux/mman.h>
 
 
 /* Only the generic macros and types may be defined here. The arch-specific
@@ -81,6 +82,11 @@
 #define MAXPATHLEN     (PATH_MAX)
 #endif
 
+/* flags for mmap */
+#ifndef MAP_FAILED
+#define MAP_FAILED ((void *)-1)
+#endif
+
 /* whence values for lseek() */
 #define SEEK_SET       0
 #define SEEK_CUR       1
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

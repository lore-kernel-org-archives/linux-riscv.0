Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF0EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rqj8zRUcGBfLC9Szzes4BOnxDDVoiPMsvd+vTsaDyM=; b=JqW0bxgwMcjtML
	8IFu++d3wbJPC6RVLK7tjMUIqBLr5OVppxxA0h8mxygKK8PEERmGiNsHc43upWaJ2aPhtSSS+unvx
	Aq/8Vb0HdTRP3PR2iir+oI9q22LlQcZhwCcWyVHY2Zwmx8jI5YQaYlOxQX1u+bQhT1T/WeffFvVJS
	w3WsGYcS9JjCOUJN6Ny0b8ZwWJjMItr3M+keu+UHz6Gv2jTHtiNddewUm7ZPlW4VcOQuEOUlIzm2O
	Io7JWrwXOSmXldp7hPabGjf9Ss/V7ui+R9RccpR5TsF0PFQmBaUSD9UAYzJLf0zO3e4eb1j1h1n5r
	iW0TMzwESKwkn+mhTaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmvP-004wyX-1r;
	Fri, 07 Jul 2023 14:59:11 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmvL-004wwn-1L
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 14:59:09 +0000
X-QQ-mid: bizesmtp66t1688741930t1u7j3pm
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 22:58:49 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: FVl8EHhfVR7yQpfZTGK8C+9c2sldMS7g8O8sphi3aZ3lVOgDE6mUBVA4cCQad
	kO/IXo2DyBCrzayugYXvTg5txrwWjTP6N5r+UZweLv4IkFD30FHcdjIK1+jFUtIiMik2QUG
	HkOw6coYGLIO8BZwYXLEer8oY/wY2g/gx+OMutEGwfozZE01xyhidcc6kipNJivkA5mMy65
	UnHb6lTgTTv4PYZwlBSpSFlUEZRRZUodLLdeG6EjdS+b7ZgBv7p0QsKptgKlaz4XVxN1lfe
	hqxBNYLi51fQB/4Dn+CFw55wcyWYxgLZI1J69Sfu59KNZ5n2roe4WNRY7A+Hh9E5VKKVYIX
	d8PyfxwRmSvJCcQjaXt45gwIFPDjpPhrRd5iCY9Cz3CJtT5N/Y1dOGPHqXeOgY+nAuBj+ds
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12986911038597649536
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 07/15] tools/nolibc: clean up mmap() routine
Date: Fri,  7 Jul 2023 22:58:20 +0800
Message-Id: <5817aa30c97be3b4db794a1d35272e0f379b80f1.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075907_776751_7EB795F8 
X-CRM114-Status: GOOD (  11.33  )
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

- Apply the new generic __sysret() to convert the calling of sys_map()
  to oneline code

Note, since MAP_FAILED is -1 on Linux, so we can use the generic
__sysret() which returns -1 upon error and still satisfy user land that
checks for MAP_FAILED.

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/lkml/20230702192347.GJ16233@1wt.eu/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h   | 29 ++++++-----------------------
 tools/include/nolibc/types.h |  6 ++++++
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 3479f54d7957..3d01a24e6f7a 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -636,26 +636,11 @@ int mknod(const char *path, mode_t mode, dev_t dev)
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
@@ -666,20 +651,18 @@ void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
 #endif
 
 	return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
-#endif
 }
 #endif
 
+/* Note that on Linux, MAP_FAILED is -1 so we can use the generic __sysret()
+ * which returns -1 upon error and still satisfy user land that checks for
+ * MAP_FAILED.
+ */
+
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
index f96e28bff4ba..5e1bac8509ec 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -8,6 +8,7 @@
 #define _NOLIBC_TYPES_H
 
 #include "std.h"
+#include <linux/mman.h>
 #include <linux/time.h>
 #include <linux/stat.h>
 
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

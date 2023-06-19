Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F77EEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQnaX+gJTY7CTB2CvVQBvc5YadilhOb7wnsHqLe5j4s=; b=B/4HsHwX8mHsPz
	CTNN4PzX5scOrIDLTy9C2PHYj7qO1ha99SPpDgx/0itS2L1vYtugISnjyUhLjkjHj111iayniuBWu
	ZoiI0PTv8U5aizn6ELZ81rHppHt3SHA7y3lD4JS/mEblcf+c1+x9GIuga9qXuMlBGsJM95IIG2n7l
	Et0Gh3AnAzCScg4Pj294pQX6UXh48CEomLv+MlN5Lonr151DYy0B8KF00Xp1qk3cdm4tpKVVc+64T
	uFMtNE9ttNfs4rZhDkMgYwoau0bgk4NoSymCQNKvuo/kWazL52UXnIb1YjrZWsRJBD8M2P0yvqqwR
	8VJTInR44ixfJTKeiiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHAS-008q9f-2H;
	Mon, 19 Jun 2023 15:51:48 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHAP-008q7A-00
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:51:47 +0000
X-QQ-mid: bizesmtp64t1687189887tg4fzjsv
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:51:26 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 5q30pvLz2icBH/caXxT27x4f9FBSJcYyNdLV7m3J8v2Ry7takMP0mXa7DT1i3
	jQwPJO38Q3Zvqx2UcT3WQjrB96lfe6DY5IP8gMxXL0flRy+x+YiGwXSCxfPaniPbV/rHyxs
	yoCZLQy3AZVEbwKpQFcTc9cslDqmauQUwqfn8v36BVI4qnUnlhFcGWHj9fDtwxI8XCdfYIv
	i9fBc5Z6q3dWlxGEJI1/wI4qq4HDv2X/movyUNAkL1VkfOgx0kA6MUkYC6oLN4eefLH/mRc
	tao0Zr/YcNcFkXKtnmghIGRbaKk31qEouoCTsHb4mhVL4uhexQC/kBtEQnAz7gZoTN4Yoz5
	6O2NyuOrm0FK53k38XqBR3Z/A38eOqjxexOj5nmTN6RQsEeT+lQZW4+A4mKEA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6198696245822752568
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v4 07/10] tools/nolibc: clean up mmap() support
Date: Mon, 19 Jun 2023 23:51:20 +0800
Message-Id: <b1162bc16ce5c397e99925e49317756c110e6f1a.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_085145_343516_DC67C0C4 
X-CRM114-Status: GOOD (  10.10  )
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

- Move the mmap() related macros to tools/include/nolibc/types.h

- Apply the new __sysret() to convert the calling of sys_map() to
  oneline code

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h   | 24 +-----------------------
 tools/include/nolibc/types.h | 11 +++++++++++
 2 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 8a6e16472d54..1c02cec3bcd9 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -624,26 +624,11 @@ int mknod(const char *path, mode_t mode, dev_t dev)
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
@@ -654,20 +639,13 @@ void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
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
index f96e28bff4ba..f889d4e0ac7e 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -81,6 +81,17 @@
 #define MAXPATHLEN     (PATH_MAX)
 #endif
 
+/* flags for mmap */
+#ifndef MAP_SHARED
+#define MAP_SHARED		0x01	/* Share changes */
+#define MAP_PRIVATE		0x02	/* Changes are private */
+#define MAP_SHARED_VALIDATE	0x03	/* share + validate extension flags */
+#endif
+
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

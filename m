Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25E7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z92RfvWSMXoSHUelvgiAZjDXEGTvO829C1THQJPPn8I=; b=x7Sd9Vo+mTXtM6
	oh3aMMz6GCb+Q4Abu3fLUsDeLpzni3zzFMDFXHxHJc/kgIGw7iL/W77qkL1gJZPqLeIk8tPkc67So
	yR4RZ7gdsF13r9smW9Q4+YCH603bAGS+/eUDzpi4nouoPv1sG8f49ASYkSLZR932EzhWdWgXTyC7Q
	tyASSFObh/aaWF+afAKn/DQ2+6WltyE+GsqQ6FVwxcnlPpR5yibRke34VuYGzPZwEl3mzipMev3Y8
	rAatjyfV9PPt0r0pGOQVEvl1y3plegoN8cIcG+C55HFDJLVYmUlxnjE+7Kn+ojHGdI3U4MWt19ck+
	/tQedxPc3bWviJX5kfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWfo7-00BLP5-K7; Tue, 22 Mar 2022 14:48:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWfhQ-00BHO8-FD; Tue, 22 Mar 2022 14:41:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19F06B81CFB;
 Tue, 22 Mar 2022 14:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D7EC340ED;
 Tue, 22 Mar 2022 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647960085;
 bh=iy3SBmMhwucwplDFre+Ge8ybjPqHy1S7cUUZYt5wOvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pszP/ch0RdyrrzU9n52pl2el2F9Z8132dFOEqHTw8k4zVwLlCPkenlDSyNJDEyWYD
 FQDnFz9jH0R0ANCHN+fymPcbTpZAS2jrdKmxiZQteUWdD1N9lMrceMdwKPbmRmX9b8
 iY6rO7m7l7JRtOLAZq21Ycz5qfT87anrRK+36vEXPnWcaLe7cVJNB2seZ9plBPC08k
 GbYA288aXH2p9ymrlAEzSLlVF+wBoAzqIA0xH86RE4JKdj8pTFhjtZqxgChu5b3NHz
 LP8q4E3hjijNlWEf9y8jITYGFDe4FGCBhN5YGS+4x35Kh7B+PvqCBnPK4ZtnFeI1Bt
 rms6gU4I8eBJw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V9 11/20] riscv: compat: syscall: Add compat_sys_call_table
 implementation
Date: Tue, 22 Mar 2022 22:39:54 +0800
Message-Id: <20220322144003.2357128-12-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322144003.2357128-1-guoren@kernel.org>
References: <20220322144003.2357128-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_074128_876217_A8D7B54D 
X-CRM114-Status: GOOD (  20.02  )
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

Implement compat sys_call_table and some system call functions:
truncate64, ftruncate64, fallocate, pread64, pwrite64,
sync_file_range, readahead, fadvise64_64 which need argument
translation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/syscall.h         |  1 +
 arch/riscv/include/asm/unistd.h          | 11 +++++++
 arch/riscv/include/uapi/asm/unistd.h     |  2 +-
 arch/riscv/kernel/Makefile               |  1 +
 arch/riscv/kernel/compat_syscall_table.c | 19 ++++++++++++
 arch/riscv/kernel/sys_riscv.c            |  6 ++--
 fs/open.c                                | 24 +++++++++++++++
 fs/read_write.c                          | 16 ++++++++++
 fs/sync.c                                |  9 ++++++
 include/asm-generic/compat.h             |  7 +++++
 include/linux/compat.h                   | 37 ++++++++++++++++++++++++
 mm/fadvise.c                             | 11 +++++++
 mm/readahead.c                           |  7 +++++
 13 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/compat_syscall_table.c

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 7ac6a0e275f2..384a63b86420 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -16,6 +16,7 @@
 
 /* The array of function pointers for syscalls. */
 extern void * const sys_call_table[];
+extern void * const compat_sys_call_table[];
 
 /*
  * Only the low 32 bits of orig_r0 are meaningful, so we return int.
diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 6c316093a1e5..5ddac412b578 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -11,6 +11,17 @@
 #define __ARCH_WANT_SYS_CLONE
 #define __ARCH_WANT_MEMFD_SECRET
 
+#ifdef CONFIG_COMPAT
+#define __ARCH_WANT_COMPAT_TRUNCATE64
+#define __ARCH_WANT_COMPAT_FTRUNCATE64
+#define __ARCH_WANT_COMPAT_FALLOCATE
+#define __ARCH_WANT_COMPAT_PREAD64
+#define __ARCH_WANT_COMPAT_PWRITE64
+#define __ARCH_WANT_COMPAT_SYNC_FILE_RANGE
+#define __ARCH_WANT_COMPAT_READAHEAD
+#define __ARCH_WANT_COMPAT_FADVISE64_64
+#endif
+
 #include <uapi/asm/unistd.h>
 
 #define NR_syscalls (__NR_syscalls)
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 8062996c2dfd..c9e50eed14aa 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -15,7 +15,7 @@
  * along with this program.  If not, see <https://www.gnu.org/licenses/>.
  */
 
-#ifdef __LP64__
+#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SET_GET_RLIMIT
 #endif /* __LP64__ */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ffc87e76b1dd..3b3e425aadd2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -68,3 +68,4 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
diff --git a/arch/riscv/kernel/compat_syscall_table.c b/arch/riscv/kernel/compat_syscall_table.c
new file mode 100644
index 000000000000..651f2b009c28
--- /dev/null
+++ b/arch/riscv/kernel/compat_syscall_table.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define __SYSCALL_COMPAT
+
+#include <linux/compat.h>
+#include <linux/syscalls.h>
+#include <asm-generic/mman-common.h>
+#include <asm-generic/syscalls.h>
+#include <asm/syscall.h>
+
+#undef __SYSCALL
+#define __SYSCALL(nr, call)      [nr] = (call),
+
+asmlinkage long compat_sys_rt_sigreturn(void);
+
+void * const compat_sys_call_table[__NR_syscalls] = {
+	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
+#include <asm/unistd.h>
+};
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 12f8a7fce78b..9c0194f176fc 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -33,7 +33,9 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 {
 	return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 0);
 }
-#else
+#endif
+
+#if defined(CONFIG_32BIT) || defined(CONFIG_COMPAT)
 SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags,
 	unsigned long, fd, off_t, offset)
@@ -44,7 +46,7 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
 	 */
 	return riscv_sys_mmap(addr, len, prot, flags, fd, offset, 12);
 }
-#endif /* !CONFIG_64BIT */
+#endif
 
 /*
  * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
diff --git a/fs/open.c b/fs/open.c
index 9ff2f621b760..b25613f7c0a7 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -224,6 +224,21 @@ SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
 }
 #endif /* BITS_PER_LONG == 32 */
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_TRUNCATE64)
+COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
+		       compat_arg_u64_dual(length))
+{
+	return ksys_truncate(pathname, compat_arg_u64_glue(length));
+}
+#endif
+
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_FTRUNCATE64)
+COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd,
+		       compat_arg_u64_dual(length))
+{
+	return ksys_ftruncate(fd, compat_arg_u64_glue(length));
+}
+#endif
 
 int vfs_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
 {
@@ -339,6 +354,15 @@ SYSCALL_DEFINE4(fallocate, int, fd, int, mode, loff_t, offset, loff_t, len)
 	return ksys_fallocate(fd, mode, offset, len);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_FALLOCATE)
+COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode, compat_arg_u64_dual(offset),
+		       compat_arg_u64_dual(len))
+{
+	return ksys_fallocate(fd, mode, compat_arg_u64_glue(offset),
+			      compat_arg_u64_glue(len));
+}
+#endif
+
 /*
  * access() needs to use the real uid/gid, not the effective uid/gid.
  * We do this by temporarily clearing all FS-related capabilities and
diff --git a/fs/read_write.c b/fs/read_write.c
index 0074afa7ecb3..548657c462e8 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -681,6 +681,14 @@ SYSCALL_DEFINE4(pread64, unsigned int, fd, char __user *, buf,
 	return ksys_pread64(fd, buf, count, pos);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_PREAD64)
+COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
+		       size_t, count, compat_arg_u64_dual(pos))
+{
+	return ksys_pread64(fd, buf, count, compat_arg_u64_glue(pos));
+}
+#endif
+
 ssize_t ksys_pwrite64(unsigned int fd, const char __user *buf,
 		      size_t count, loff_t pos)
 {
@@ -707,6 +715,14 @@ SYSCALL_DEFINE4(pwrite64, unsigned int, fd, const char __user *, buf,
 	return ksys_pwrite64(fd, buf, count, pos);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_PWRITE64)
+COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd, const char __user *, buf,
+		       size_t, count, compat_arg_u64_dual(pos))
+{
+	return ksys_pwrite64(fd, buf, count, compat_arg_u64_glue(pos));
+}
+#endif
+
 static ssize_t do_iter_readv_writev(struct file *filp, struct iov_iter *iter,
 		loff_t *ppos, int type, rwf_t flags)
 {
diff --git a/fs/sync.c b/fs/sync.c
index c7690016453e..dc725914e1ed 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -373,6 +373,15 @@ SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
 	return ksys_sync_file_range(fd, offset, nbytes, flags);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_SYNC_FILE_RANGE)
+COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, compat_arg_u64_dual(offset),
+		       compat_arg_u64_dual(nbytes), unsigned int, flags)
+{
+	return ksys_sync_file_range(fd, compat_arg_u64_glue(offset),
+				    compat_arg_u64_glue(nbytes), flags);
+}
+#endif
+
 /* It would be nice if people remember that not all the world's an i386
    when they introduce new system calls */
 SYSCALL_DEFINE4(sync_file_range2, int, fd, unsigned int, flags,
diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
index 11653d6846cc..d06308a2a7a8 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -14,6 +14,13 @@
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #endif
 
+#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
+#define compat_arg_u64(name)		u32  name##_lo, u32  name##_hi
+#define compat_arg_u64_dual(name)	u32, name##_lo, u32, name##_hi
+#define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
+					 ((u64)name##_hi << 32))
+#endif
+
 /* These types are common across all compat ABIs */
 typedef u32 compat_size_t;
 typedef s32 compat_ssize_t;
diff --git a/include/linux/compat.h b/include/linux/compat.h
index a0481fe6c5d5..8779e283a1e9 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -926,6 +926,43 @@ asmlinkage long compat_sys_sigaction(int sig,
 /* obsolete: net/socket.c */
 asmlinkage long compat_sys_socketcall(int call, u32 __user *args);
 
+#ifdef __ARCH_WANT_COMPAT_TRUNCATE64
+asmlinkage long compat_sys_truncate64(const char __user *pathname, compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_FTRUNCATE64
+asmlinkage long compat_sys_ftruncate64(unsigned int fd, compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_FALLOCATE
+asmlinkage long compat_sys_fallocate(int fd, int mode, compat_arg_u64(offset),
+				     compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_PREAD64
+asmlinkage long compat_sys_pread64(unsigned int fd, char __user *buf, size_t count,
+				   compat_arg_u64(pos));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_PWRITE64
+asmlinkage long compat_sys_pwrite64(unsigned int fd, const char __user *buf, size_t count,
+				    compat_arg_u64(pos));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_SYNC_FILE_RANGE
+asmlinkage long compat_sys_sync_file_range(int fd, compat_arg_u64(pos),
+					   compat_arg_u64(nbytes), unsigned int flags);
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_FADVISE64_64
+asmlinkage long compat_sys_fadvise64_64(int fd, int advice, compat_arg_u64(pos),
+					compat_arg_u64(len));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_READAHEAD
+asmlinkage long compat_sys_readahead(int fd, compat_arg_u64(offset), size_t count);
+#endif
+
 #endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
 
 /**
diff --git a/mm/fadvise.c b/mm/fadvise.c
index d6baa4f451c5..8950f7c05d20 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -215,5 +215,16 @@ SYSCALL_DEFINE4(fadvise64, int, fd, loff_t, offset, size_t, len, int, advice)
 	return ksys_fadvise64_64(fd, offset, len, advice);
 }
 
+#endif
+
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_FADVISE64_64)
+
+COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, compat_arg_u64_dual(offset),
+		       compat_arg_u64_dual(len))
+{
+	return ksys_fadvise64_64(fd, compat_arg_u64_glue(offset),
+				 compat_arg_u64_glue(len), advice);
+}
+
 #endif
 #endif
diff --git a/mm/readahead.c b/mm/readahead.c
index cf0dcf89eb69..9adf57044299 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -640,6 +640,13 @@ SYSCALL_DEFINE3(readahead, int, fd, loff_t, offset, size_t, count)
 	return ksys_readahead(fd, offset, count);
 }
 
+#if defined(CONFIG_COMPAT) && defined(__ARCH_WANT_COMPAT_READAHEAD)
+COMPAT_SYSCALL_DEFINE4(readahead, int, fd, compat_arg_u64_dual(offset), size_t, count)
+{
+	return ksys_readahead(fd, compat_arg_u64_glue(offset), count);
+}
+#endif
+
 /**
  * readahead_expand - Expand a readahead request
  * @ractl: The request to be expanded
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D27C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhciBgdA9m3mlGpuYbqP+7IgMM5mFfp/HIv/25doToc=; b=zZ5uRnMXQh2N5Q
	+6/PjQBl5oS4Vg8gBNf6mT5NSa6ekBNI6+OxAbn7F+XDMaABQGqdg5m03t9ZQbgMw7ATVtJDy0Nnd
	gDZWOtw24/BlR+8sLcbiz3z3gvCadjTSXJUxYs1E6AAihF4MNDGSWhjldc9KsOdwGH5ASTMxAQIGy
	VdGCRRGX61ckcKqqZV/p4SKNHWD1r7QYCUR83uYPhrHZcKYk/JuGx8Kqej+yHH3k2fVpwb3G2i5+p
	xA4LCaQSnX+jPrf/7a5uLxwug8HEL818H6wk2vII41yOu8LPKJINXxuly6jVbEpWO5y590UrBx8uz
	O3rPG9+zlA3xW5IimFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDml3-004eeC-8z; Sat, 29 Jan 2022 12:23:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDmgi-004cB7-UJ; Sat, 29 Jan 2022 12:18:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B5C8B82699;
 Sat, 29 Jan 2022 12:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFFDC340EE;
 Sat, 29 Jan 2022 12:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458718;
 bh=AVBhZ6mvaynHSvTjpMrfy0VIb0ZM79b6721KFvNFepo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m33Jn6g9VkCeHbKptQ5QXrMUEdyOL4UJUAiX/ap+z+9/v/4O44ZviMWs7+l0WGJpa
 qzfZzqbDcARNOJWx6bRhYNndcjJZ6GI/x14HvqIDGvPyPe9AVef251prxi/BsOvxvC
 DaiF1MyomIcPPfcdfWJREWfNByFo9AiGFbE1wjGqkuliOLXpK79xUH3fyn27IyyG9P
 F/IkxgYF4TORFgcOjMnNk+tBYJIE7Pr9OIDcc7yKQBv8lkW5yuGii8ldzZj+yRZg0y
 jrv0aFgurKhRoJxJg/GbKqxR/Edt2AOMaICxehsZjDyWhIFK8qDdK0006N16xP1jK0
 pXRIe/CiTS/xg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
Date: Sat, 29 Jan 2022 20:17:19 +0800
Message-Id: <20220129121728.1079364-9-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_041841_397199_5C830B8F 
X-CRM114-Status: GOOD (  19.69  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
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
index 612556faa527..954dc7043ad2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -66,3 +66,4 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
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
index 3ce8e2137f31..75edb7a664e5 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -367,6 +367,15 @@ SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
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
index 32269059058a..cdf1124a4883 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -14,6 +14,13 @@
 #define COMPAT_OFF_T_MAX	0x7fffffff
 #endif
 
+#ifndef compat_arg_u64
+#define compat_arg_u64(name)		u32  name##_lo, u32  name##_hi
+#define compat_arg_u64_dual(name)	u32, name##_lo, u32, name##_hi
+#define compat_arg_u64_glue(name)	(((u64)name##_hi << 32) | \
+					 ((u64)name##_lo & 0xffffffffUL))
+#endif
+
 /* These types are common across all compat ABIs */
 typedef u32 compat_size_t;
 typedef s32 compat_ssize_t;
diff --git a/include/linux/compat.h b/include/linux/compat.h
index 1c758b0e0359..841d882c41e2 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -895,6 +895,43 @@ asmlinkage long compat_sys_sigaction(int sig,
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
+asmlinkage long compat_sys_pread64(unsigned int fd, char __user * buf, size_t count,
+				   compat_arg_u64(pos));
+#endif
+
+#ifdef __ARCH_WANT_COMPAT_PWRITE64
+asmlinkage long compat_sys_pwrite64(unsigned int fd, const char __user * buf, size_t count,
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18340C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPDVkJzdgbbF1JVj/NK0gFez/4e++WchtbNznWXmrqs=; b=gzdNBWXUQtxgVT
	QByx4AZIOYl0SLk/YRBmENBcjXwULidwKsRKGp1CppxJMnNE1olYT69iZZo+n2ZkncqeCWIIp6dZT
	MyR1w3SN0sKHFrvXykDSHGIS+XWEb12x69hxUl/NkHhbSTkxa1U5ATF+OMb4DIRsb+/ArdoMT3ngk
	gH6vtqCix45C65Ugm7zGXL07PkgK5OkkBLV6D9JnijGxHAbtuMfH3ihjse2TFE31Mmdqv4GIpZV0G
	5zrWA/Mh0McPHG9ACtQr9pipxt18oeTlBAQDAHwnzt487qgvzQX0KQmBEpng5gsblZqVRVxmOtt4B
	patghty6ptiE++Tqwcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DxC-001I5V-0a; Tue, 28 Dec 2021 14:59:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Df5-001Bx6-HF; Tue, 28 Dec 2021 14:41:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 062EAB811BD;
 Tue, 28 Dec 2021 14:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6507EC36AEC;
 Tue, 28 Dec 2021 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640702468;
 bh=/zz4kcfUsjWXJ1LptyJSPeLGNSqvvgEEHmcGFJCbGl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pplymMPjBmBBH049ZPhADqf4uBaSqsT7g8ZxaxlUA7aAAD00o9wjd7pWlYf5knWdO
 Xvd7EiUynaLapOw2m/FKYmRQEC07ujuErOZqzaBVjUKL/KbfHLOyeWfCykbbf+anPF
 dddHGxOH1TxUHazo7cqzt8AOrzF6WVO3G+77YOH2Kjo2WUM6sM7DUmzIdCxZU7PHzY
 9zlpz7aAI8fTnTPwOHIhhrpa/x31t85zuEFRB2O3XyCptJ5SIan9NpNSXlfTNsT6Nu
 IKYObMDfrni9oqrS+/N2d0oJI097RvGTDaAGfALJaiMPGcbX+QlpB+i8cgTdNPyGMz
 y0koOIF0254hg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 09/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
Date: Tue, 28 Dec 2021 22:39:50 +0800
Message-Id: <20211228143958.3409187-10-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228143958.3409187-1-guoren@kernel.org>
References: <20211228143958.3409187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_064111_901788_8124F319 
X-CRM114-Status: GOOD (  16.28  )
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

Implement compat_syscall_table.c with compat_sys_call_table & fixup
system call such as truncate64,pread64,fallocate which need two
regs to indicate 64bit-arg (copied from arm64).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/syscall.h         |  3 +
 arch/riscv/include/uapi/asm/unistd.h     |  2 +-
 arch/riscv/kernel/Makefile               |  1 +
 arch/riscv/kernel/compat_syscall_table.c | 72 ++++++++++++++++++++++++
 arch/riscv/kernel/sys_riscv.c            |  6 +-
 5 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/compat_syscall_table.c

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 7ac6a0e275f2..4ff98a22ef24 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -16,6 +16,9 @@
 
 /* The array of function pointers for syscalls. */
 extern void * const sys_call_table[];
+#ifdef CONFIG_COMPAT
+extern void * const compat_sys_call_table[];
+#endif
 
 /*
  * Only the low 32 bits of orig_r0 are meaningful, so we return int.
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
index 3397ddac1a30..1f2111179615 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -65,3 +65,4 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
diff --git a/arch/riscv/kernel/compat_syscall_table.c b/arch/riscv/kernel/compat_syscall_table.c
new file mode 100644
index 000000000000..53905947678e
--- /dev/null
+++ b/arch/riscv/kernel/compat_syscall_table.c
@@ -0,0 +1,72 @@
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
+#define arg_u32p(name)  u32, name##_lo, u32, name##_hi
+
+#define arg_u64(name)   (((u64)name##_hi << 32) | \
+			 ((u64)name##_lo & 0xffffffff))
+
+COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
+		       arg_u32p(length))
+{
+	return ksys_truncate(pathname, arg_u64(length));
+}
+
+COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, arg_u32p(length))
+{
+	return ksys_ftruncate(fd, arg_u64(length));
+}
+
+COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode,
+		       arg_u32p(offset), arg_u32p(len))
+{
+	return ksys_fallocate(fd, mode, arg_u64(offset), arg_u64(len));
+}
+
+COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
+		       size_t, count, arg_u32p(pos))
+{
+	return ksys_pread64(fd, buf, count, arg_u64(pos));
+}
+
+COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd,
+		       const char __user *, buf, size_t, count, arg_u32p(pos))
+{
+	return ksys_pwrite64(fd, buf, count, arg_u64(pos));
+}
+
+COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, arg_u32p(offset),
+		       arg_u32p(nbytes), unsigned int, flags)
+{
+	return ksys_sync_file_range(fd, arg_u64(offset), arg_u64(nbytes),
+				    flags);
+}
+
+COMPAT_SYSCALL_DEFINE4(readahead, int, fd, arg_u32p(offset),
+		       size_t, count)
+{
+	return ksys_readahead(fd, arg_u64(offset), count);
+}
+
+COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, arg_u32p(offset),
+		       arg_u32p(len))
+{
+	return ksys_fadvise64_64(fd, arg_u64(offset), arg_u64(len), advice);
+}
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
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

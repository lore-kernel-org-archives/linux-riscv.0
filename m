Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBE1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atq4lK+AnqEv6Wrj2QD/uAAksIoSEFOxvot5ZrcnEtc=; b=PJKyrWQt08cfpb
	onZwz9IUm7H5mcTXfJk07AOaymY5a38vZP75yiOmc7HJNV5QCQe15uf1mzkpn5lZKfLe6kZACfrHk
	qTyCWnqb3/hy6PJ0ze7j+wZ/9+bURQybT5VaO4pGw2kdOXYOld8Xdo0gGGpwfPxdkJrIKdD2RCxsS
	Sd+fMv1XscvaYAoly95otNo0PQic4Lst4toehWK2Pg1oezKApC0PmuGArTMRW1g53o1CV3lOEJfcp
	ORKZQbksTzJ3eyixagSoPLSN+7DQwFXQETtaHhovjdSv7s7oiH3TDmilz5fNW3VbcY2BoXaHiYeCN
	qtM4/6m9ms60OaOZMnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7l-007aCu-Ro; Tue, 21 Dec 2021 16:36:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7i-007a8S-Fe
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E9F8B81722;
 Tue, 21 Dec 2021 16:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AE6C36AEB;
 Tue, 21 Dec 2021 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104579;
 bh=fapZiwfOp6P4ipryF44VXjiGuUYPa79CVgYJTucz1Cg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ctwtEXwzhjNh3I4oNGVFpED0WOtjyzD4i7HQkVITSP7zM7bZ4U+IsHA+UW0ryBzNE
 QszDZbnsjfanF2OH0oLvA6QLzis3hSgWyBgG4TQksfgV5QtqJ0eSY90JHVae5EyJP7
 XH8wIToAAgdyWfa96G3qNXSD1Pxb+DOSrBM/9iwuU55FVjW8cqSwynASOQDjoncGt+
 sgvstfYxyOS0R3LuCzxvxnPXsz9LuU2fI5zWttITZo7qzluBz0QBOFTtHC5qcKKR6T
 xoKFfVSMtTVOFqyRh5WrST9AHGpkwQhHCw8cED+YmX12cxZ6IgVhqA4mewaD0/dsoq
 KT+4+FsWLrjaw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 08/13] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Wed, 22 Dec 2021 00:35:27 +0800
Message-Id: <20211221163532.2636028-9-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083622_850131_B16A7129 
X-CRM114-Status: GOOD (  20.35  )
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

Adds initial skeletal COMPAT Kbuild (Runing 32bit U-mode on 64bit
S-mode) support.
 - Setup kconfig & dummy functions for compiling.
 - Implement compat_start_thread by the way.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Kconfig                 | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/elf.h       |  8 ++++++++
 arch/riscv/include/asm/processor.h |  3 +++
 arch/riscv/kernel/Makefile         |  2 ++
 arch/riscv/kernel/compat_signal.c  | 18 ++++++++++++++++++
 arch/riscv/kernel/process.c        | 10 ++++++++++
 arch/riscv/kernel/ptrace.c         |  9 +++++++++
 arch/riscv/kernel/vdso.c           |  8 ++++++++
 8 files changed, 80 insertions(+)
 create mode 100644 arch/riscv/kernel/compat_signal.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821252b65f89..6c3515a492a8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -72,6 +72,7 @@ config RISCV
 	select HAVE_ARCH_KGDB if !XIP_KERNEL
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
@@ -122,12 +123,18 @@ config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
 
+config ARCH_MMAP_RND_COMPAT_BITS_MIN
+	default 8
+
 # max bits determined by the following formula:
 #  VA_BITS - PAGE_SHIFT - 3
 config ARCH_MMAP_RND_BITS_MAX
 	default 24 if 64BIT # SV39 based
 	default 17
 
+config ARCH_MMAP_RND_COMPAT_BITS_MAX
+	default 17
+
 # set if we run in machine mode, cleared if we run in supervisor mode
 config RISCV_M_MODE
 	bool
@@ -427,6 +434,21 @@ config CRASH_DUMP
 
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
+config COMPAT
+	bool "Kernel support for 32-bit U-mode"
+	depends on 64BIT && MMU
+	help
+	  This option enables support for a 32-bit U-mode running under a 64-bit
+	  kernel at S-mode. riscv32-specific components such as system calls,
+	  the user helper functions (vdso), signal rt_frame functions and the
+	  ptrace interface are handled appropriately by the kernel.
+
+	  If you want to execute 32-bit userspace applications, say Y.
+
+config SYSVIPC_COMPAT
+	def_bool y
+	depends on COMPAT && SYSVIPC
+
 endmenu
 
 menu "Boot options"
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 48c116f3c12d..37f1cbdaa242 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -129,5 +129,13 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)			   \
 typedef compat_ulong_t			compat_elf_greg_t;
 typedef compat_elf_greg_t		compat_elf_gregset_t[ELF_NGREG];
 
+#define compat_start_thread		compat_start_thread
+
+
+extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
+					      int uses_interp);
+#define compat_arch_setup_additional_pages \
+				compat_arch_setup_additional_pages
+
 #endif /* CONFIG_COMPAT */
 #endif /* _ASM_RISCV_ELF_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8649436b8fcf..9544c138d9ce 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -62,6 +62,9 @@ extern void start_thread(struct pt_regs *regs,
 			unsigned long pc, unsigned long sp);
 
 #ifdef CONFIG_COMPAT
+extern void compat_start_thread(struct pt_regs *regs,
+				unsigned long pc, unsigned long sp);
+
 #define DEFAULT_MAP_WINDOW_64 TASK_SIZE_64
 #else
 #define DEFAULT_MAP_WINDOW_64 TASK_SIZE
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 3397ddac1a30..f83e22affd5f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -65,3 +65,5 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_EFI)		+= efi.o
+obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
+obj-$(CONFIG_COMPAT)		+= compat_signal.o
diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
new file mode 100644
index 000000000000..1ad3d348f37c
--- /dev/null
+++ b/arch/riscv/kernel/compat_signal.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/compat.h>
+#include <linux/signal.h>
+#include <linux/uaccess.h>
+#include <linux/syscalls.h>
+#include <linux/tracehook.h>
+#include <linux/linkage.h>
+
+#include <asm/ucontext.h>
+#include <asm/vdso.h>
+#include <asm/switch_to.h>
+#include <asm/csr.h>
+
+COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
+{
+	return 0;
+}
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..9ebf9a95e5ea 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <uapi/linux/elf.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -99,6 +100,15 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	regs->sp = sp;
 }
 
+#ifdef CONFIG_COMPAT
+void compat_start_thread(struct pt_regs *regs, unsigned long pc,
+			 unsigned long sp)
+{
+	start_thread(regs, pc, sp);
+	regs->status |= SR_UXL_32;
+}
+#endif
+
 void flush_thread(void)
 {
 #ifdef CONFIG_FPU
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9c0511119bad..55dd50f8a5cc 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -12,6 +12,7 @@
 #include <asm/thread_info.h>
 #include <asm/switch_to.h>
 #include <linux/audit.h>
+#include <linux/compat.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 #include <linux/regset.h>
@@ -275,3 +276,11 @@ __visible void do_syscall_trace_exit(struct pt_regs *regs)
 		trace_sys_exit(regs, regs_return_value(regs));
 #endif
 }
+
+#ifdef CONFIG_COMPAT
+long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
+			compat_ulong_t caddr, compat_ulong_t cdata)
+{
+	return 0;
+}
+#endif
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index a9436a65161a..4f523a23a5d1 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -253,6 +253,14 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	return PTR_ERR(ret);
 }
 
+#ifdef CONFIG_COMPAT
+int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
+				       int uses_interp)
+{
+	return 0;
+}
+#endif
+
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mm_struct *mm = current->mm;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

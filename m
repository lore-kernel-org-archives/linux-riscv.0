Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5AFC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keW1Vom0YtqEHoJiICEhf79lxo5KYz6frvoBNG3am0k=; b=vbY6WfwYxjCsO8
	0cgArJ4ysorTYJ64umuh/KOp0O0a/ToHUNeOFb/b1UeRJwC4cjqCnF52kqsmkFpIlJ81fs1HliHiD
	OJT29dUpg9FISZgbhzV8WUqNR8qWVdyp32247boMXnwW2QYjCeDac/cgNY+a8fDvXC7yOOQ+ShFYA
	oGX1ZAVQhMBS9K7VywyddJA4By1xaSe9rkgXdEbJdCnG/BHCbZNF3KCItMdDiCiukKojBATMDLwlO
	CJ+l2KDBKdMFxByEJMBRD/uH4sZ1JKXb7acXYCBHav8mICICnjfcj/2E1ukZPKVNV8C+UdFCF+1hP
	/q4h28CB8O60kgkKPCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7O-007Ztr-TD; Tue, 21 Dec 2021 16:36:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7L-007ZsG-Rs
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 615B761660;
 Tue, 21 Dec 2021 16:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F804C36AEA;
 Tue, 21 Dec 2021 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104558;
 bh=KjgCin2hved0yaQS5eqq61a1K9YAgWp53QVssgFiofs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KAMXmW+9ncaDlFiRY4Lu9smDgU9x99exzCHsw+o2vczL0324mWSFYYv5PAXG/ZPLN
 9d7zDmqmDrQTdMg8R2ghmbtJ/o69N28Mu/oyE23MJqo5fYXilmTNhIh36jtjfBadKr
 n/AZZcIWDG+UtvxioqVkFGLSl5wPhFNnmLoeSLU5I3/hsPkGSBBfsmaUxlQzzUstMS
 7O8kGq6DbluITpSdP+86yiDc59L+CXPg1naFSoVcUCKYsDxEbIkNk0YlbcL2s1Nr/+
 T0oIYAskxuifci9B66VXa2OXlPRzTiz3dwWBp79cYhjn7wrcnYJq6+Nw74haD2+ccb
 r5YAumnfjQI1w==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 03/13] riscv: compat: Add basic compat date type implementation
Date: Wed, 22 Dec 2021 00:35:22 +0800
Message-Id: <20211221163532.2636028-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083600_011410_6AF9F3AC 
X-CRM114-Status: GOOD (  13.88  )
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

Implement asm/compat.h for struct compat_xxx, RLIM_INFINITY,
OFF_T_MAX, is_compat_task, compat_user_regset, regset convert.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/compat.h      | 259 +++++++++++++++++++++++++++
 arch/riscv/include/asm/thread_info.h |   1 +
 2 files changed, 260 insertions(+)
 create mode 100644 arch/riscv/include/asm/compat.h

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
new file mode 100644
index 000000000000..8e9777811f3b
--- /dev/null
+++ b/arch/riscv/include/asm/compat.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_COMPAT_H
+#define __ASM_COMPAT_H
+
+#define compat_mode_t	compat_mode_t
+typedef u16		compat_mode_t;
+
+/*
+ * Architecture specific compatibility types
+ */
+#include <linux/types.h>
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <asm-generic/compat.h>
+
+#define COMPAT_USER_HZ		100
+#define COMPAT_UTS_MACHINE	"riscv\0\0"
+
+typedef compat_uint_t	__compat_uid_t;
+typedef compat_uint_t	__compat_gid_t;
+typedef compat_uint_t	compat_dev_t;
+typedef compat_int_t	compat_ipc_pid_t;
+
+struct compat_stat {
+	compat_ulong_t	st_dev;
+	compat_ulong_t	st_ino;
+	compat_uint_t	st_mode;
+	compat_uint_t	st_nlink;
+	compat_uint_t	st_uid;
+	compat_uint_t	st_gid;
+	compat_ulong_t	st_rdev;
+	compat_ulong_t	__pad1;
+	compat_long_t	st_size;
+	compat_int_t	st_blksize;
+	compat_int_t	__pad2;
+	compat_long_t	st_blocks;
+	compat_long_t	st_atime;
+	compat_ulong_t	st_atime_nsec;
+	compat_long_t	st_mtime;
+	compat_ulong_t	st_mtime_nsec;
+	compat_long_t	st_ctime;
+	compat_ulong_t	st_ctime_nsec;
+	compat_uint_t	__unused4;
+	compat_uint_t	__unused5;
+};
+
+struct compat_flock {
+	compat_short_t	l_type;
+	compat_short_t	l_whence;
+	compat_off_t	l_start;
+	compat_off_t	l_len;
+	compat_pid_t	l_pid;
+	/* No __ARCH_FLOCK_PAD in riscv */
+};
+
+#define F_GETLK64	12
+#define F_SETLK64	13
+#define F_SETLKW64	14
+
+struct compat_flock64 {
+	compat_short_t	l_type;
+	compat_short_t	l_whence;
+	compat_loff_t	l_start;
+	compat_loff_t	l_len;
+	compat_pid_t	l_pid;
+	/* No __ARCH_FLOCK64_PAD in riscv */
+};
+
+struct compat_statfs {
+	compat_uint_t	f_type;
+	compat_uint_t	f_bsize;
+	compat_uint_t	f_blocks;
+	compat_uint_t	f_bfree;
+	compat_uint_t	f_bavail;
+	compat_uint_t	f_files;
+	compat_uint_t	f_ffree;
+	__kernel_fsid_t	f_fsid;
+	compat_uint_t	f_namelen;
+	compat_uint_t	f_frsize;
+	compat_uint_t	f_flags;
+	compat_uint_t	f_spare[4];
+};
+
+#define COMPAT_RLIM_INFINITY	0x7fffffff
+#define COMPAT_OFF_T_MAX	COMPAT_RLIM_INFINITY
+
+struct compat_ipc64_perm {
+	compat_key_t key;
+	__compat_uid32_t uid;
+	__compat_gid32_t gid;
+	__compat_uid32_t cuid;
+	__compat_gid32_t cgid;
+	compat_mode_t	mode;
+	unsigned char	__pad1[4 - sizeof(compat_mode_t)];
+	compat_ushort_t	seq;
+	compat_ushort_t	__pad2;
+	compat_ulong_t	unused1;
+	compat_ulong_t	unused2;
+};
+
+struct compat_semid64_ds {
+	struct compat_ipc64_perm sem_perm;
+	compat_ulong_t sem_otime;
+	compat_ulong_t sem_otime_high;
+	compat_ulong_t sem_ctime;
+	compat_ulong_t sem_ctime_high;
+	compat_ulong_t sem_nsems;
+	compat_ulong_t __unused3;
+	compat_ulong_t __unused4;
+};
+
+struct compat_msqid64_ds {
+	struct compat_ipc64_perm msg_perm;
+	compat_ulong_t msg_stime;
+	compat_ulong_t msg_stime_high;
+	compat_ulong_t msg_rtime;
+	compat_ulong_t msg_rtime_high;
+	compat_ulong_t msg_ctime;
+	compat_ulong_t msg_ctime_high;
+	compat_ulong_t msg_cbytes;
+	compat_ulong_t msg_qnum;
+	compat_ulong_t msg_qbytes;
+	compat_pid_t   msg_lspid;
+	compat_pid_t   msg_lrpid;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+
+struct compat_shmid64_ds {
+	struct compat_ipc64_perm shm_perm;
+	compat_size_t  shm_segsz;
+	compat_ulong_t shm_atime;
+	compat_ulong_t shm_atime_high;
+	compat_ulong_t shm_dtime;
+	compat_ulong_t shm_dtime_high;
+	compat_ulong_t shm_ctime;
+	compat_ulong_t shm_ctime_high;
+	compat_pid_t   shm_cpid;
+	compat_pid_t   shm_lpid;
+	compat_ulong_t shm_nattch;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+
+static inline int is_compat_task(void)
+{
+	return test_thread_flag(TIF_32BIT);
+}
+
+struct compat_user_regs_struct {
+	compat_ulong_t pc;
+	compat_ulong_t ra;
+	compat_ulong_t sp;
+	compat_ulong_t gp;
+	compat_ulong_t tp;
+	compat_ulong_t t0;
+	compat_ulong_t t1;
+	compat_ulong_t t2;
+	compat_ulong_t s0;
+	compat_ulong_t s1;
+	compat_ulong_t a0;
+	compat_ulong_t a1;
+	compat_ulong_t a2;
+	compat_ulong_t a3;
+	compat_ulong_t a4;
+	compat_ulong_t a5;
+	compat_ulong_t a6;
+	compat_ulong_t a7;
+	compat_ulong_t s2;
+	compat_ulong_t s3;
+	compat_ulong_t s4;
+	compat_ulong_t s5;
+	compat_ulong_t s6;
+	compat_ulong_t s7;
+	compat_ulong_t s8;
+	compat_ulong_t s9;
+	compat_ulong_t s10;
+	compat_ulong_t s11;
+	compat_ulong_t t3;
+	compat_ulong_t t4;
+	compat_ulong_t t5;
+	compat_ulong_t t6;
+};
+
+static inline void regs_to_cregs(struct compat_user_regs_struct *cregs,
+				 struct pt_regs *regs)
+{
+	cregs->pc = (compat_ulong_t) regs->epc;
+	cregs->ra = (compat_ulong_t) regs->ra;
+	cregs->sp = (compat_ulong_t) regs->sp;
+	cregs->gp = (compat_ulong_t) regs->gp;
+	cregs->tp = (compat_ulong_t) regs->tp;
+	cregs->t0 = (compat_ulong_t) regs->t0;
+	cregs->t1 = (compat_ulong_t) regs->t1;
+	cregs->t2 = (compat_ulong_t) regs->t2;
+	cregs->s0 = (compat_ulong_t) regs->s0;
+	cregs->s1 = (compat_ulong_t) regs->s1;
+	cregs->a0 = (compat_ulong_t) regs->a0;
+	cregs->a1 = (compat_ulong_t) regs->a1;
+	cregs->a2 = (compat_ulong_t) regs->a2;
+	cregs->a3 = (compat_ulong_t) regs->a3;
+	cregs->a4 = (compat_ulong_t) regs->a4;
+	cregs->a5 = (compat_ulong_t) regs->a5;
+	cregs->a6 = (compat_ulong_t) regs->a6;
+	cregs->a7 = (compat_ulong_t) regs->a7;
+	cregs->s2 = (compat_ulong_t) regs->s2;
+	cregs->s3 = (compat_ulong_t) regs->s3;
+	cregs->s4 = (compat_ulong_t) regs->s4;
+	cregs->s5 = (compat_ulong_t) regs->s5;
+	cregs->s6 = (compat_ulong_t) regs->s6;
+	cregs->s7 = (compat_ulong_t) regs->s7;
+	cregs->s8 = (compat_ulong_t) regs->s8;
+	cregs->s9 = (compat_ulong_t) regs->s9;
+	cregs->s10 = (compat_ulong_t) regs->s10;
+	cregs->s11 = (compat_ulong_t) regs->s11;
+	cregs->t3 = (compat_ulong_t) regs->t3;
+	cregs->t4 = (compat_ulong_t) regs->t4;
+	cregs->t5 = (compat_ulong_t) regs->t5;
+	cregs->t6 = (compat_ulong_t) regs->t6;
+};
+
+static inline void cregs_to_regs(struct compat_user_regs_struct *cregs,
+				 struct pt_regs *regs)
+{
+	regs->epc = (unsigned long) cregs->pc;
+	regs->ra = (unsigned long) cregs->ra;
+	regs->sp = (unsigned long) cregs->sp;
+	regs->gp = (unsigned long) cregs->gp;
+	regs->tp = (unsigned long) cregs->tp;
+	regs->t0 = (unsigned long) cregs->t0;
+	regs->t1 = (unsigned long) cregs->t1;
+	regs->t2 = (unsigned long) cregs->t2;
+	regs->s0 = (unsigned long) cregs->s0;
+	regs->s1 = (unsigned long) cregs->s1;
+	regs->a0 = (unsigned long) cregs->a0;
+	regs->a1 = (unsigned long) cregs->a1;
+	regs->a2 = (unsigned long) cregs->a2;
+	regs->a3 = (unsigned long) cregs->a3;
+	regs->a4 = (unsigned long) cregs->a4;
+	regs->a5 = (unsigned long) cregs->a5;
+	regs->a6 = (unsigned long) cregs->a6;
+	regs->a7 = (unsigned long) cregs->a7;
+	regs->s2 = (unsigned long) cregs->s2;
+	regs->s3 = (unsigned long) cregs->s3;
+	regs->s4 = (unsigned long) cregs->s4;
+	regs->s5 = (unsigned long) cregs->s5;
+	regs->s6 = (unsigned long) cregs->s6;
+	regs->s7 = (unsigned long) cregs->s7;
+	regs->s8 = (unsigned long) cregs->s8;
+	regs->s9 = (unsigned long) cregs->s9;
+	regs->s10 = (unsigned long) cregs->s10;
+	regs->s11 = (unsigned long) cregs->s11;
+	regs->t3 = (unsigned long) cregs->t3;
+	regs->t4 = (unsigned long) cregs->t4;
+	regs->t5 = (unsigned long) cregs->t5;
+	regs->t6 = (unsigned long) cregs->t6;
+};
+
+#endif /* __ASM_COMPAT_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 60da0dcacf14..9392e35c689d 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -91,6 +91,7 @@ struct thread_info {
 #define TIF_SECCOMP		8	/* syscall secure computing */
 #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
 #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
+#define TIF_32BIT		11	/* 32bit process */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139F1C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:10:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B799D233F6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B799D233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XNTIzABZQiMrXbJ1N6pPTi8vMQmAmb8vEntG6Usidvg=; b=aC0PcBdKGrYxVXh4W4LtO9rFL
	X9eBKLxyzkshBrIoHdWUOJUM9OpI41OwN54zgHOPsmtCgGtFcdF3uYS5zfZBHDi88m1xTLqOgvxV9
	HpLc6kTMySF+dpW92v7NIIVavMp8R2Y7KPPzYYImApBgQCc+Biu6oOxOcvqg4SD7gAXbAMQGU87pK
	L5b51g2XGKOJmp/WolhfVapw2ioQUNa7owp/w7tGOQvEc5vXFhKIXv9xEpGx3rSAgK0MjzWXHHxVT
	KtfXC4QBeL+4Cc6E5/dZAW0tkjYnNOsIEjbPxKQaHx1igNGPWwFXbgmhLjj6jbpbsh93rwba96yls
	uQ78A63rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2HvQ-0005Dq-2H; Wed, 20 Jan 2021 18:09:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Htj-0004Pu-6u; Wed, 20 Jan 2021 18:08:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C49DD23434;
 Wed, 20 Jan 2021 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611166081;
 bh=aQnb8toyTYnIk3szmn2PNJqXyvTSNUJCXWq4IUJHcWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtcpWfc80YUtx+ftGpQdZC+YYlROZgj7SmUZwmol6QxuGrwMzrp/r2XC+lH5PzSvG
 Qv3K+6W2HSoii4UFOVNOoo0LXIfIkwQkf2l6fXCLUbOSnCKIa9ZatSSFuBxc6yJHLP
 N+OPb6xWFp+RoKuUoloONfgcltnn6uJJX4lZxBO3R1nvHvken24AI2MQfAsEWaLO7K
 VSH2TkJysW9rm4ad6CVCCsbCzlwdTDZo2cbmXE2XUySa0e0mBGNUxtI0VRHFF2OWCy
 pAC9ZaFJcoATRboHAai2x/6oL1hF+FOsS9fpqHUdgwDZlopmvsgRJcqbWzRlYmOWJr
 tyVIxJYAfv8hw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v15 10/11] arch,
 mm: wire up memfd_secret system call where relevant
Date: Wed, 20 Jan 2021 20:06:11 +0200
Message-Id: <20210120180612.1058-11-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120180612.1058-1-rppt@kernel.org>
References: <20210120180612.1058-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_130803_403100_CFB8B804 
X-CRM114-Status: GOOD (  19.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Wire up memfd_secret system call on architectures that define
ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christopher Lameter <cl@linux.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Hagen Paul Pfeifer <hagen@jauu.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Roman Gushchin <guro@fb.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tycho Andersen <tycho@tycho.ws>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/uapi/asm/unistd.h   | 1 +
 arch/riscv/include/asm/unistd.h        | 1 +
 arch/x86/entry/syscalls/syscall_32.tbl | 1 +
 arch/x86/entry/syscalls/syscall_64.tbl | 1 +
 include/linux/syscalls.h               | 1 +
 include/uapi/asm-generic/unistd.h      | 6 +++++-
 mm/secretmem.c                         | 3 +++
 scripts/checksyscalls.sh               | 4 ++++
 8 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/uapi/asm/unistd.h b/arch/arm64/include/uapi/asm/unistd.h
index f83a70e07df8..ce2ee8f1e361 100644
--- a/arch/arm64/include/uapi/asm/unistd.h
+++ b/arch/arm64/include/uapi/asm/unistd.h
@@ -20,5 +20,6 @@
 #define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_TIME32_SYSCALLS
 #define __ARCH_WANT_SYS_CLONE3
+#define __ARCH_WANT_MEMFD_SECRET
 
 #include <asm-generic/unistd.h>
diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index 977ee6181dab..6c316093a1e5 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -9,6 +9,7 @@
  */
 
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_MEMFD_SECRET
 
 #include <uapi/asm/unistd.h>
 
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 02a349afaf9c..a1578cdf6d91 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -447,3 +447,4 @@
 440	i386	process_madvise		sys_process_madvise
 441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
 442	i386	watch_mount		sys_watch_mount
+443	i386	memfd_secret		sys_memfd_secret
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index d9bcc4e02588..d8ecd9df0942 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -364,6 +364,7 @@
 440	common	process_madvise		sys_process_madvise
 441	common	epoll_pwait2		sys_epoll_pwait2
 442	common	watch_mount		sys_watch_mount
+443	common	memfd_secret		sys_memfd_secret
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 28bde029109d..4bc70ac0e993 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1039,6 +1039,7 @@ asmlinkage long sys_pidfd_send_signal(int pidfd, int sig,
 asmlinkage long sys_pidfd_getfd(int pidfd, int fd, unsigned int flags);
 asmlinkage long sys_watch_mount(int dfd, const char __user *path,
 				unsigned int at_flags, int watch_fd, int watch_id);
+asmlinkage long sys_memfd_secret(unsigned long flags);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index ad58f661f4aa..26125974a8a2 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -863,9 +863,13 @@ __SYSCALL(__NR_process_madvise, sys_process_madvise)
 __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
 #define __NR_watch_mount 442
 __SYSCALL(__NR_watch_mount, sys_watch_mount)
+#ifdef __ARCH_WANT_MEMFD_SECRET
+#define __NR_memfd_secret 443
+__SYSCALL(__NR_memfd_secret, sys_memfd_secret)
+#endif
 
 #undef __NR_syscalls
-#define __NR_syscalls 443
+#define __NR_syscalls 444
 
 /*
  * 32 bit systems traditionally used different
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 2de06446ebf9..6f75c0c69c70 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -420,6 +420,9 @@ static int __init secretmem_setup(char *str)
 	unsigned long reserved_size;
 	int err;
 
+	if (!can_set_direct_map())
+		return 0;
+
 	reserved_size = memparse(str, NULL);
 	if (!reserved_size)
 		return 0;
diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index a18b47695f55..b7609958ee36 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -40,6 +40,10 @@ cat << EOF
 #define __IGNORE_setrlimit	/* setrlimit */
 #endif
 
+#ifndef __ARCH_WANT_MEMFD_SECRET
+#define __IGNORE_memfd_secret
+#endif
+
 /* Missing flags argument */
 #define __IGNORE_renameat	/* renameat2 */
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

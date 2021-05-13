Return-Path: <SRS0=0BZE=KI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB028C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 13 May 2021 18:50:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52446613DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 May 2021 18:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52446613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8HKjvQuj1UbGg0eZ+TPrCEGdLATxVQ2kuJ7p9bfy5s4=; b=VjxRuqbi6QgIqCWHl+eG3pel5
	lGc75shidEwzefleMwg5VyWURXyByrJ2U/1w6OAskS81xWS8XKQqu0zby0r7NPDneozTHP9rs89ph
	Z5v6MWIh003aNJetcvAh6+PyFNGV5dToH1ZcVXr5N3Ce+TAUd9F8GiFg3NZ+VeCRFM0DeZtNs3LOr
	r2DcprQiZlY7BTnfOXLoEiA1yNZp+20lJcTExGjcECmU3PF258uKo+GeTSYtu0GXdG26MPrCF2mYU
	FqcMXa6xKhqI0B6+f+fXGkojlUqboNjeZyLkD1CVT2pubYA/8AmonujnLWcihvxnss9p2JZ3HTx0g
	aBNeYFMhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhGPr-006Bl2-S9; Thu, 13 May 2021 18:50:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGOZ-006B7k-9f; Thu, 13 May 2021 18:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Lo/3RiOxGOGDrhVMynaVBT+EC963Qc1AMdnWvGHLmA0=; b=QiSSeqwzGxoJyhFe5vYejkfuD6
 igmiWXZVTV1pepm640hLbGMe4RjYmnL8tybsMH/UUrjnkIFWKc+8xxaU8rTUvH/BfXVQjTHB17TB6
 9MTTpS+4Cg6WzWr9viHpMB58qEp7tP870eXga2C747Hyq9KPFpslFKtlmC7zZ/+KHBbmvNreC7AQ9
 U/z5Ad+K21r4+CW9I32wO4HHnhlAAj+LNUYJphRem5Atn0wRzTW3u9CPK8sE/JAjE/ie53q6pDxDB
 LAiprzvYJbn0T8a7O6KejPrXP+b8AqCuYOP+lY+iKrA3J8Xzj0OOE7MEJRZZVo7KD24x5x6zd+MOa
 VqerVMFw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGOV-00BS8q-6e; Thu, 13 May 2021 18:49:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01830613DF;
 Thu, 13 May 2021 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620931750;
 bh=Z0qMp4YmIWESRdcn/vgjCPIivz/JoaM4GmegmWlo9j4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yk3xiRcl2w4BECjJl/WEbbgm+tbBwdsJhdIeX3TWZKXGXJDlX3U69Ji+VKYQLudsF
 CN6qbg0iBF1QH5ZoJVcipbOv/8pBcIoeZQikfZJdOZOhIddg46PYTTkrh5W4ww8HIH
 Wj8AZ8X5rypve8JBACHJlk36SixAOXbTc+6gj8Mc4ikufkbDjpq3WEQZPHIqQ+nGHw
 pAMFp98wRDEGUTXFInlBTgMaO0hjWUT/g4RTlmn1Lc1zlByX16ZDYtm/35539tbczl
 aEDo4xrZMu1faOI8ZAYsQKuRYP9+PLYpQFGIYIQOpNOmq7+XXF4z9tNGttCjAw0+XW
 9YrdPSQomF1FQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH v19 7/8] arch,
 mm: wire up memfd_secret system call where relevant
Date: Thu, 13 May 2021 21:47:33 +0300
Message-Id: <20210513184734.29317-8-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210513184734.29317-1-rppt@kernel.org>
References: <20210513184734.29317-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_114911_310170_3917FD0A 
X-CRM114-Status: GOOD (  15.59  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Wire up memfd_secret system call on architectures that define
ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
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
 include/uapi/asm-generic/unistd.h      | 7 ++++++-
 scripts/checksyscalls.sh               | 4 ++++
 7 files changed, 15 insertions(+), 1 deletion(-)

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
index 28a1423ce32e..e44519020a43 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -451,3 +451,4 @@
 444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
 445	i386	landlock_add_rule	sys_landlock_add_rule
 446	i386	landlock_restrict_self	sys_landlock_restrict_self
+447	i386	memfd_secret		sys_memfd_secret
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index ecd551b08d05..a06f16106f24 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -368,6 +368,7 @@
 444	common	landlock_create_ruleset	sys_landlock_create_ruleset
 445	common	landlock_add_rule	sys_landlock_add_rule
 446	common	landlock_restrict_self	sys_landlock_restrict_self
+447	common	memfd_secret		sys_memfd_secret
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 050511e8f1f8..1a1b5d724497 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1050,6 +1050,7 @@ asmlinkage long sys_landlock_create_ruleset(const struct landlock_ruleset_attr _
 asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_rule_type rule_type,
 		const void __user *rule_attr, __u32 flags);
 asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 flags);
+asmlinkage long sys_memfd_secret(unsigned int flags);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 6de5a7fc066b..28b388368cf6 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -873,8 +873,13 @@ __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
 #define __NR_landlock_restrict_self 446
 __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
 
+#ifdef __ARCH_WANT_MEMFD_SECRET
+#define __NR_memfd_secret 447
+__SYSCALL(__NR_memfd_secret, sys_memfd_secret)
+#endif
+
 #undef __NR_syscalls
-#define __NR_syscalls 447
+#define __NR_syscalls 448
 
 /*
  * 32 bit systems traditionally used different
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

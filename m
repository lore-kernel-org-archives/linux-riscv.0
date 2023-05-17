Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DD9C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMlKUjynbStEdJtbq9JU+S4D6XU+15d9DzHnJy7oqLM=; b=avWTnQeYXXp+Xu
	6s3fPVMyV+LTPL8HbJ7dpDu+azb6q65nC5+WCeFEq8L2uRuimNhQnxvdIEfAKGNTK6GbkAi+rnTsT
	R8Fqvc+ilnqaN/Lp/NTnggQcxu3KuNCkCdg1A1uRlnnLCHavgLKVCQjKUmZOfiQGl0Ca9hFGFuqCj
	j7YtU30h+ce5xL7LtC/Q8JtSJRitFI1FduugkFJPQjEaqaQ9Ra/ewtpVzn78Yfdq3vdClzzB/YCTn
	QWLHtM9P2G7QxHuxwaC7brjpYt2baSETiq5031SUYsJcccmrWlmOu4CNiN8fBa3dClQR647letpUy
	+GwDrIr+Q39JHDE1rh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGy8-009vYY-04;
	Wed, 17 May 2023 13:13:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGxz-009vOv-1x;
	Wed, 17 May 2023 13:13:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C39F63EF0;
	Wed, 17 May 2023 13:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0DAC433D2;
	Wed, 17 May 2023 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329198;
	bh=tA8vDceOtwnaYEmuvRonEkfnHU5EgkwYZJxxRjDBrtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZhlxehR2rDeiAnVDqzTiOa3ksnRODBJzi001SQy9km83BCh+sSslpUVguoSeN8Il
	 uwXHjW+IYnLrcNsvGw9/vc5PlLdSb4Gcq8SNGb+9U7jqrv+4zSwUd9/9bPNimcMQok
	 LPjRXrVXwWwUwdDMoTBXVMqAwdmMv0pYUVWZ/lWbR3Sum2O620By8zNUB4CsRzRnGT
	 B8+bZt42Vt5lZ795+/xA9/1lKx/j2eJjWnya+dwVW+/eXJBG2ACQBiEl2QIn7S24uR
	 aIHSN8P8r0X9oWG4waSTw5ry47uHOhsMogxlxAjjiT3E57B6sfhCFfCGfKcQYgqDcQ
	 jSutqMkSXP8Ng==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	audit@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 13/14] thread_info: move function declarations to linux/thread_info.h
Date: Wed, 17 May 2023 15:11:01 +0200
Message-Id: <20230517131102.934196-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061319_764480_D8FFA6FD 
X-CRM114-Status: GOOD (  18.25  )
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

From: Arnd Bergmann <arnd@arndb.de>

There are a few __weak functions in kernel/fork.c, which architectures
can override. If there is no prototype, the compiler warns about them:

kernel/fork.c:164:13: error: no previous prototype for 'arch_release_task_struct' [-Werror=missing-prototypes]
kernel/fork.c:991:20: error: no previous prototype for 'arch_task_cache_init' [-Werror=missing-prototypes]
kernel/fork.c:1086:12: error: no previous prototype for 'arch_dup_task_struct' [-Werror=missing-prototypes]

There are already prototypes in a number of architecture specific headers
that have addressed those warnings before, but it's much better to have
these in a single place so the warning no longer shows up anywhere.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/thread_info.h | 4 ----
 arch/s390/include/asm/thread_info.h  | 3 ---
 arch/sh/include/asm/thread_info.h    | 3 ---
 arch/x86/include/asm/thread_info.h   | 3 ---
 include/linux/thread_info.h          | 5 +++++
 5 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 848739c15de8..553d1bc559c6 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -55,10 +55,6 @@ struct thread_info {
 void arch_setup_new_exec(void);
 #define arch_setup_new_exec     arch_setup_new_exec
 
-void arch_release_task_struct(struct task_struct *tsk);
-int arch_dup_task_struct(struct task_struct *dst,
-				struct task_struct *src);
-
 #endif
 
 #define TIF_SIGPENDING		0	/* signal pending */
diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
index c7c97921ed8d..a674c7d25da5 100644
--- a/arch/s390/include/asm/thread_info.h
+++ b/arch/s390/include/asm/thread_info.h
@@ -52,9 +52,6 @@ struct thread_info {
 
 struct task_struct;
 
-void arch_release_task_struct(struct task_struct *tsk);
-int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
-
 void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
 
diff --git a/arch/sh/include/asm/thread_info.h b/arch/sh/include/asm/thread_info.h
index 1400fbb8b423..9f19a682d315 100644
--- a/arch/sh/include/asm/thread_info.h
+++ b/arch/sh/include/asm/thread_info.h
@@ -84,9 +84,6 @@ static inline struct thread_info *current_thread_info(void)
 
 #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
 
-extern void arch_task_cache_init(void);
-extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
-extern void arch_release_task_struct(struct task_struct *tsk);
 extern void init_thread_xstate(void);
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index f1cccba52eb9..d63b02940747 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -232,9 +232,6 @@ static inline int arch_within_stack_frames(const void * const stack,
 			   current_thread_info()->status & TS_COMPAT)
 #endif
 
-extern void arch_task_cache_init(void);
-extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
-extern void arch_release_task_struct(struct task_struct *tsk);
 extern void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
 #endif	/* !__ASSEMBLY__ */
diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index c02646884fa8..9ea0b28068f4 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -256,6 +256,11 @@ check_copy_size(const void *addr, size_t bytes, bool is_source)
 static inline void arch_setup_new_exec(void) { }
 #endif
 
+void arch_task_cache_init(void); /* for CONFIG_SH */
+void arch_release_task_struct(struct task_struct *tsk);
+int arch_dup_task_struct(struct task_struct *dst,
+				struct task_struct *src);
+
 #endif	/* __KERNEL__ */
 
 #endif /* _LINUX_THREAD_INFO_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D0C0015E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffmRg/LHdQ+VXBSu64wlRPUbCiEDFHiUV0xVzRNIV8s=; b=P2YPx4orV/Httq
	/ckYXzrTZD3ShQRpmqqvGMf8d4bZRnqj+d18meRJZlJuBeboQp8cb9pP2/shZo5dxvSJNnDM3Jrdn
	fukX6epFFUWNwKMagMAoP3CcBsBb35+Br7Kh+jysdX2AzrWvyblZpGk9IL//4vI54nr5w+Y35eY2D
	tesCtEouDOzFAAi29EqOWOKr/rXHH1b4HOqqgZ7Cya/iLEyl1W5nteY4WdmtSQ/k2JNORr5wOnFgI
	FMTbzSQKKqnaNEDbg7A+/EYNl1mBeQNZ1uNVDMAdFvLn+7sV87H5Wd7uBCpPNZFAVuWHy9sNBnJJc
	2rzRHdLqDlxV/Ar2hUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9lK-00Fvga-09;
	Sun, 16 Jul 2023 21:58:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9hh-00Fsqh-15;
	Sun, 16 Jul 2023 21:55:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3DF060EDC;
	Sun, 16 Jul 2023 21:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF96C43391;
	Sun, 16 Jul 2023 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544496;
	bh=Cnsh8f14hL4HHiPU9pphPTWTCxuBQLcwEk99smdJn9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FOr4Ap814IFvMAcXBqvqpZeKpNRa7sR8U6pRRrun8Ds045X2N0Q3rcVZ6nUS7jxtY
	 nZpF2TFOkjcHjcw1Y9z4umesRbtQxkIf+pp0D2y8re8czkEk1pTmkUoEc7PrDTgnFK
	 W4pUxBIUghyp5O/oZdly3N6LOPl4p6SI7IPkCQHUI/kAVsQFWIku7lg+6ZUBZsJVCW
	 8iLWcexPJthBCOCv36NO6oaDVK0o4iqyxXIiKNc8/SCzvRHZcnlS1f80tidSWLATch
	 94+iCMNIZz4iMCvQ3CJpQMiOBCI7trp/wwQlEHH6NhhThXFQqJC/4WzTg384V8uisZ
	 VwFMk/pZqTMQw==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:51:16 +0100
Subject: [PATCH 20/35] arm64/gcs: Allocate a new GCS for threads with GCS
 enabled
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-20-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=5142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Cnsh8f14hL4HHiPU9pphPTWTCxuBQLcwEk99smdJn9U=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBktGafY+WmRdG3BvjbI32odNe3p2cT4DVS2GaVY1g+
 oK3bAxqJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmnwAKCRAk1otyXVSH0HsEB/
 iRBALKK6VDtratV+JSI+yIW8agu+rGC5qGc+htITQAExK+N4/5qlQ9hg5snyS/qLQzid9PQoP4miyx
 tlozcDXGlDEUhcMiAiQc/Gfa9OWLhjnx7nqCrB2A6KfeyLJ4oMqMOPkdUkG8uISSaKnl8ixGP9QIs4
 U+E7Dp0vA1CEQNyf6+8AWRt34yCNkxQUWlFAn1xDC7XPNeDyXv7olBuyTNOgCQqaECt4T7EmNBEsoZ
 ey0ZRitkrQfOi4UAGobfb6r/o3kESMH0t47HxaRrhDMQ5G0vlATe3pDE819rUx3Obd18tlT7yXBML9
 29GwoxoWamHlKdOl5GPCqxKTcDyzk=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145458_874431_5533F982 
X-CRM114-Status: GOOD (  20.08  )
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

We do not currently have a mechanism to specify a new GCS for a new
thread so when a thread is created which has GCS enabled allocate one
for it.  Since there is no current API for specifying the size of the
GCS we follow the extensively discussed x86 implementation and allocate
min(RLIMIT_STACK, 4G).  Since the GCS only stores the call stack and not
any variables this should be more than sufficient for most applications.

When allocating the stack we initialise GCSPR_EL0 to point to one entry
below the end of the region allocated, this keeps the top entry of the
stack 0 so software walking the GCS can easily detect the end of the
region.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h |  7 ++++++
 arch/arm64/kernel/process.c  | 30 ++++++++++++++++++++++++
 arch/arm64/mm/gcs.c          | 56 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 04594ef59dad..4371a2f99b4a 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -58,6 +58,8 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 void gcs_set_el0_mode(struct task_struct *task);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
+unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+			    unsigned long clone_flags, size_t size);
 
 #else
 
@@ -69,6 +71,11 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 static inline void gcs_set_el0_mode(struct task_struct *task) { }
 static inline void gcs_free(struct task_struct *task) { }
 static inline void gcs_preserve_current_state(void) { }
+static inline unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+				     unsigned long clone_flags, size_t size)
+{
+	return -ENOTSUPP;
+}
 
 #endif
 
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 0d07f78b6c85..ce0a68d3539f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -283,9 +283,34 @@ static void flush_gcs(void)
 	}
 }
 
+static int copy_thread_gcs(struct task_struct *p, unsigned long clone_flags,
+			   size_t stack_size)
+{
+	unsigned long gcs;
+
+	if (!system_supports_gcs())
+		return 0;
+
+	if (!task_gcs_el0_enabled(p))
+		return 0;
+
+	p->thread.gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
+
+	gcs = gcs_alloc_thread_stack(p, clone_flags, stack_size);
+	if (IS_ERR_VALUE(gcs))
+		return PTR_ERR((void *)gcs);
+
+	return 0;
+}
+
 #else
 
 static void flush_gcs(void) { }
+static int copy_thread_gcs(struct task_struct *p, unsigned long clone_flags,
+			   size_t stack_size)
+{
+	return 0;
+}
 
 #endif
 
@@ -367,6 +392,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long stack_start = args->stack;
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
+	int ret;
 
 	memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
 
@@ -408,6 +434,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 			p->thread.uw.tp_value = tls;
 			p->thread.tpidr2_el0 = 0;
 		}
+
+		ret = copy_thread_gcs(p, clone_flags, args->stack_size);
+		if (ret != 0)
+			return ret;
 	} else {
 		/*
 		 * A kthread has no context to ERET to, so ensure any buggy
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index b0a67efc522b..1e059c37088d 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -8,6 +8,62 @@
 #include <asm/cpufeature.h>
 #include <asm/page.h>
 
+static unsigned long alloc_gcs(unsigned long addr, unsigned long size,
+			       unsigned long token_offset, bool set_res_tok)
+{
+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	struct mm_struct *mm = current->mm;
+	unsigned long mapped_addr, unused;
+
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
+			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);
+	mmap_write_unlock(mm);
+
+	return mapped_addr;
+}
+
+static unsigned long gcs_size(unsigned long size)
+{
+	if (size)
+		return PAGE_ALIGN(size);
+
+	/* Allocate RLIMIT_STACK with limits of PAGE_SIZE..4G */
+	size = PAGE_ALIGN(min_t(unsigned long long,
+				rlimit(RLIMIT_STACK), SZ_4G));
+	return max(PAGE_SIZE, size);
+}
+
+unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+				     unsigned long clone_flags, size_t size)
+{
+	unsigned long addr;
+
+	if (!system_supports_gcs())
+		return 0;
+
+	if (!task_gcs_el0_enabled(tsk))
+		return 0;
+
+	if ((clone_flags & (CLONE_VFORK | CLONE_VM)) != CLONE_VM)
+		return 0;
+
+	size = gcs_size(size);
+
+	addr = alloc_gcs(0, size, 0, 0);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+
+	tsk->thread.gcs_base = addr;
+	tsk->thread.gcs_size = size;
+	tsk->thread.gcspr_el0 = addr + size - sizeof(u64);
+
+	return addr;
+}
+
 /*
  * Apply the GCS mode configured for the specified task to the
  * hardware.

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

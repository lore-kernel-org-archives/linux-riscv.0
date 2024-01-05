Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DC5C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 18:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dPBcCGlNZlnyUxC5FeCiCxECzMLnUZinK0aVbeVEM4=; b=egoQfX7GfM14Y9
	ltb7bYw9aHxiJI+tzPhxXs3PAmkEKcCqDE/fzc6uRoDQKohPHpJmFoYmSYMsmu0WGc7ph1TyR+j2i
	BMuaDGZbYjcyvXp6ex3VFFDtljxcRrQZqlqKD4S18DfYgUo0Uv0H8gMGsLfK7Moc+uUw9oKkuMfDV
	AS+Mq/S9RbO3HrOukf2YdNx9Cg8eB22urTVGPBYY3b8DX2MsvR/Cm/1Xc3V6BXu4HeqvCpX+aGRbg
	iqdyR1SaHoIkA4CawCqYCPOP/WVT5PXWOx4q3Q/cXV+W7OK8yHDvagrVaFdvFBOny91iV1osuk1jH
	O4vRSFeYtJJzbs4n5vaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLpI6-0001K1-1s;
	Fri, 05 Jan 2024 18:51:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLpI2-0001FZ-2l
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 18:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4D7E4B81DD5;
	Fri,  5 Jan 2024 18:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4F3C433CA;
	Fri,  5 Jan 2024 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704480688;
	bh=LjgJiqwLFUXfY2pd8uFd7gL5ZAyYxGKFhbbJI1IcXy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGg1goUl4TGGbweMVgpx8wQYkXLzOThGMBAokLphdrYomC+hjcVqv4BLrz8ENrR94
	 GKfhwE4toJ5oShnhN3kQagA4Pu4oq6xxe0yHa1CpjdZI+gYXNo2e5l1dPTpPz/oVPN
	 gY1BgME7r6oNyPgvl8Y99QgtHSuxJcq5we9hKX9kEW8BeQV2pn0M2ax/IgaZD+axW/
	 DWaL9xKh+vNHeDL06ZGk1YGGsrxr8GJzIn4a2BdLLNq93LIxG4ON65cg8SlaGgVR4X
	 2uYmH9AgBF6JnXQhJif1X0MJIzad4pStZBS/fnio1gCW50xWf089on+5K57UoPYUp3
	 WiSSJhRTh7X7g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerry Shih <jerry.shih@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v2 02/12] riscv: vector: make Vector always available for softirq context
Date: Fri,  5 Jan 2024 10:49:38 -0800
Message-ID: <20240105184950.43181-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184950.43181-1-ebiggers@kernel.org>
References: <20240105184950.43181-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_105131_202503_A32912F5 
X-CRM114-Status: GOOD (  21.12  )
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

From: Andy Chiu <andy.chiu@sifive.com>

The goal of this patch is to provide full support of Vector in kernel
softirq context. So that some of the crypto alogrithms won't need scalar
fallbacks.

By disabling bottom halves in active kernel-mode Vector, softirq will
not be able to nest on top of any kernel-mode Vector. So, softirq
context is able to use Vector whenever it runs.

After this patch, Vector context cannot start with irqs disabled.
Otherwise local_bh_enable() may run in a wrong context.

Disabling bh is not enough for RT-kernel to prevent preeemption. So
we must disable preemption, which also implies disabling bh on RT.

Related-to: commit 696207d4258b ("arm64/sve: Make kernel FPU protection RT friendly")
Related-to: commit 66c3ec5a7120 ("arm64: neon: Forbid when irqs are disabled")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/include/asm/processor.h     |  5 +++--
 arch/riscv/include/asm/simd.h          |  6 +++++-
 arch/riscv/kernel/kernel_mode_vector.c | 14 ++++++++++++--
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 28d19aea24b1d..e768397890673 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -71,22 +71,23 @@
 #ifndef __ASSEMBLY__
 
 struct task_struct;
 struct pt_regs;
 
 /*
  * We use a flag to track in-kernel Vector context. Currently the flag has the
  * following meaning:
  *
  *  - bit 0: indicates whether the in-kernel Vector context is active. The
- *    activation of this state disables the preemption. Currently only 0 and 1
- *    are valid value for this field. Other values are reserved for future uses.
+ *    activation of this state disables the preemption. On a non-RT kernel, it
+ *    also disable bh. Currently only 0 and 1 are valid value for this field.
+ *    Other values are reserved for future uses.
  */
 #define RISCV_KERNEL_MODE_V	0x1
 
 /* CPU-specific state of a task */
 struct thread_struct {
 	/* Callee-saved registers */
 	unsigned long ra;
 	unsigned long sp;	/* Kernel mode stack */
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index ef8af413a9fc7..4d699e16c9a96 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -21,22 +21,26 @@
  *                instructions or access the vector register file
  *
  * Callers must not assume that the result remains true beyond the next
  * preempt_enable() or return from softirq context.
  */
 static __must_check inline bool may_use_simd(void)
 {
 	/*
 	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
 	 * and is clear whenever preemption is enabled.
+	 *
+	 * Kernel-mode Vector temporarily disables bh. So we must not return
+	 * true on irq_disabled(). Otherwise we would fail the lockdep check
+	 * calling local_bh_enable()
 	 */
-	return !in_hardirq() && !in_nmi() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+	return !in_hardirq() && !in_nmi() && !irqs_disabled() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
 }
 
 #else /* ! CONFIG_RISCV_ISA_V */
 
 static __must_check inline bool may_use_simd(void)
 {
 	return false;
 }
 
 #endif /* ! CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 114cf4f0a0eb6..2fc145edae3dd 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -39,37 +39,47 @@ static inline void riscv_v_stop(u32 flags)
 }
 
 /*
  * Claim ownership of the CPU vector context for use by the calling context.
  *
  * The caller may freely manipulate the vector context metadata until
  * put_cpu_vector_context() is called.
  */
 void get_cpu_vector_context(void)
 {
-	preempt_disable();
+	/*
+	 * disable softirqs so it is impossible for softirqs to nest
+	 * get_cpu_vector_context() when kernel is actively using Vector.
+	 */
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_disable();
+	else
+		preempt_disable();
 
 	riscv_v_start(RISCV_KERNEL_MODE_V);
 }
 
 /*
  * Release the CPU vector context.
  *
  * Must be called from a context in which get_cpu_vector_context() was
  * previously called, with no call to put_cpu_vector_context() in the
  * meantime.
  */
 void put_cpu_vector_context(void)
 {
 	riscv_v_stop(RISCV_KERNEL_MODE_V);
 
-	preempt_enable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_bh_enable();
+	else
+		preempt_enable();
 }
 
 /*
  * kernel_vector_begin(): obtain the CPU vector registers for use by the calling
  * context
  *
  * Must not be called unless may_use_simd() returns true.
  * Task context in the vector registers is saved back to memory as necessary.
  *
  * A matching call to kernel_vector_end() must be made before returning from the
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

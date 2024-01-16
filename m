Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD7AC3DA79
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 01:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNu0Nm9sD16/jM+O6d5j+hIOAhgvDncq6I1G1ASDHoU=; b=VOAucE5wCp033A
	POt4B39PmYzn5aQeIad0p1+nNzySJ0pHY0zCwOvAm4mk0is/km4BmZfSWRDX6zvnIWUlT+uVHId36
	uyhwT7wRC/mbgUhttTUrkqeQ0Jkj2MfIfrgFYm1kMYejai3OUQYyZ3nl/DbbOCtRAPuOCTkcKqeqS
	1c3MFuP+H1CiLtkIyUQOohTYsAxaNVkHjP+VWUKp+eRD+HQ1HZNPrs87Z5vZUuGOhTgkf2Oge6TaU
	4dPmFq/jJ0udWhZkOW3EAVZQIX3ZHkETvpO8sdAQt8M9MiyNZ6hb6FsPH7ZmXTaOZDvz3zKq3GHj0
	2vrZJCJ2V2LUkUDtnq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXsj-00Ac4w-2J;
	Tue, 16 Jan 2024 01:04:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXsc-00Ac2W-2m;
	Tue, 16 Jan 2024 01:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F02D4B80D0C;
	Tue, 16 Jan 2024 01:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AEAC433F1;
	Tue, 16 Jan 2024 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705367076;
	bh=4Rgd6pj6ZzHj+h/R371GlQqWUydY+bynAeaxfKNSS8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aD+cWltoW9RendeciKgnR7IKr3X3L02qsi6pyVVQuxoQzFV4ZmZ+bqN+BnMAkqSBA
	 UailrtA6ofEYPXJHJwY88tdnSkp5ju5H0bFbOJN69wg18WzuaKs2qq0eF/gupdm6pf
	 GsKvu2fj6eXTHAV4PzqWK8dAWMXq0YGOaz78JJFg6vex9jQVBozBSY2qd/pw//M+Mi
	 X1QJouIAvzyxqhXcpuowRU6WRN3VXAeUQVtXCOa1Q+jO0V6SD/e2rWaiyeMIaj7JwC
	 pPRHnQdJOmQecFodCvj/aMqCKps+YRkVnPWRi0UiDFuMTMmhCOIh+zqVz+SArjBwEM
	 nH1eA9r+soSIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	will@kernel.org,
	mpe@ellerman.id.au,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 02/21] arch: consolidate arch_irq_work_raise prototypes
Date: Mon, 15 Jan 2024 20:03:39 -0500
Message-ID: <20240116010422.217925-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116010422.217925-1-sashal@kernel.org>
References: <20240116010422.217925-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_170439_229883_064DCBDB 
X-CRM114-Status: GOOD (  11.20  )
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

[ Upstream commit 64bac5ea17d527872121adddfee869c7a0618f8f ]

The prototype was hidden in an #ifdef on x86, which causes a warning:

kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_raise' [-Werror=missing-prototypes]

Some architectures have a working prototype, while others don't.
Fix this by providing it in only one place that is always visible.

Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/include/asm/irq_work.h     | 2 --
 arch/arm64/include/asm/irq_work.h   | 2 --
 arch/csky/include/asm/irq_work.h    | 2 +-
 arch/powerpc/include/asm/irq_work.h | 1 -
 arch/riscv/include/asm/irq_work.h   | 2 +-
 arch/s390/include/asm/irq_work.h    | 2 --
 arch/x86/include/asm/irq_work.h     | 1 -
 include/linux/irq_work.h            | 3 +++
 8 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/irq_work.h b/arch/arm/include/asm/irq_work.h
index 3149e4dc1b54..8895999834cc 100644
--- a/arch/arm/include/asm/irq_work.h
+++ b/arch/arm/include/asm/irq_work.h
@@ -9,6 +9,4 @@ static inline bool arch_irq_work_has_interrupt(void)
 	return is_smp();
 }
 
-extern void arch_irq_work_raise(void);
-
 #endif /* _ASM_ARM_IRQ_WORK_H */
diff --git a/arch/arm64/include/asm/irq_work.h b/arch/arm64/include/asm/irq_work.h
index 81bbfa3a035b..a1020285ea75 100644
--- a/arch/arm64/include/asm/irq_work.h
+++ b/arch/arm64/include/asm/irq_work.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_IRQ_WORK_H
 #define __ASM_IRQ_WORK_H
 
-extern void arch_irq_work_raise(void);
-
 static inline bool arch_irq_work_has_interrupt(void)
 {
 	return true;
diff --git a/arch/csky/include/asm/irq_work.h b/arch/csky/include/asm/irq_work.h
index 33aaf39d6f94..d39fcc1f5395 100644
--- a/arch/csky/include/asm/irq_work.h
+++ b/arch/csky/include/asm/irq_work.h
@@ -7,5 +7,5 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return true;
 }
-extern void arch_irq_work_raise(void);
+
 #endif /* __ASM_CSKY_IRQ_WORK_H */
diff --git a/arch/powerpc/include/asm/irq_work.h b/arch/powerpc/include/asm/irq_work.h
index b8b0be8f1a07..c6d3078bd8c3 100644
--- a/arch/powerpc/include/asm/irq_work.h
+++ b/arch/powerpc/include/asm/irq_work.h
@@ -6,6 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return true;
 }
-extern void arch_irq_work_raise(void);
 
 #endif /* _ASM_POWERPC_IRQ_WORK_H */
diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
index b53891964ae0..b27a4d64fc6a 100644
--- a/arch/riscv/include/asm/irq_work.h
+++ b/arch/riscv/include/asm/irq_work.h
@@ -6,5 +6,5 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return IS_ENABLED(CONFIG_SMP);
 }
-extern void arch_irq_work_raise(void);
+
 #endif /* _ASM_RISCV_IRQ_WORK_H */
diff --git a/arch/s390/include/asm/irq_work.h b/arch/s390/include/asm/irq_work.h
index 603783766d0a..f00c9f610d5a 100644
--- a/arch/s390/include/asm/irq_work.h
+++ b/arch/s390/include/asm/irq_work.h
@@ -7,6 +7,4 @@ static inline bool arch_irq_work_has_interrupt(void)
 	return true;
 }
 
-void arch_irq_work_raise(void);
-
 #endif /* _ASM_S390_IRQ_WORK_H */
diff --git a/arch/x86/include/asm/irq_work.h b/arch/x86/include/asm/irq_work.h
index 800ffce0db29..6b4d36c95165 100644
--- a/arch/x86/include/asm/irq_work.h
+++ b/arch/x86/include/asm/irq_work.h
@@ -9,7 +9,6 @@ static inline bool arch_irq_work_has_interrupt(void)
 {
 	return boot_cpu_has(X86_FEATURE_APIC);
 }
-extern void arch_irq_work_raise(void);
 #else
 static inline bool arch_irq_work_has_interrupt(void)
 {
diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
index 8cd11a223260..136f2980cba3 100644
--- a/include/linux/irq_work.h
+++ b/include/linux/irq_work.h
@@ -66,6 +66,9 @@ void irq_work_sync(struct irq_work *work);
 void irq_work_run(void);
 bool irq_work_needs_cpu(void);
 void irq_work_single(void *arg);
+
+void arch_irq_work_raise(void);
+
 #else
 static inline bool irq_work_needs_cpu(void) { return false; }
 static inline void irq_work_run(void) { }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

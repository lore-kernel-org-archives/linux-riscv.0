Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B815AC32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTepGMafMC0ruHoJ4BFtcEsKKBdZWSMbu3b+p3nYEJY=; b=2XyDEuHQxD9IhE
	Gr9tk5y7SF9pankIrhi3aSRs4UAdOwUDZqD37rKyf8NBq9yu4jffVcDVLY+CMptVjL2Kj4AZGqF7G
	L7jaZ5y6Z/ubz6vIDuD3ayNgLhy8TG0KJ3zDzz/aDkdBlPyKffS6JRO0wTeUtVQVdfVhdRyNYlYZH
	Zi1yRQWWDMcD0XFC9rYkvSGVaH9DrZdcnS14qEidIzRBJ8IedncL4tIgOAPBe0tLgiQGpuP7vZuMU
	0OzusytylhEt+Vl0LpDi11JxPdMkJ984ILu6xJru79ytQx71NPcFCEw2h1DvGHpFDyS3rGynS8QtB
	7N3TlB4cFCJu7VMPMhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwcJ-000Gks-0L; Sun, 18 Sep 2022 15:53:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwcF-000GfN-1L
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82C9F6157D;
	Sun, 18 Sep 2022 15:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3178BC433D7;
	Sun, 18 Sep 2022 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516434;
	bh=7wdNTHkIM9DFcN8uGgXpP5nk6UniAll79CVfZUZJHJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQxUoZx6PZPVUjZX2dZzQGk53IOAdBr+HK9mvTLhLMkTgUrZORWQnUsXlG7U7MxgS
	 lO33apGM2vQR194cZ1XY6qkMlIFyMkB/DMIs9hrksAVUMu35sxqRQoGfQQbsWtFe92
	 +ULKLd0Gx7jCYAete/kVrikuXVsnz8bQlFDvoQ0ZshS44SZEkYvbomsyIZp9fGbvrv
	 2GFrm+bOH3LHegUdFg143cQelUqDqpWVghrc+sS7pEnkoEZ7KjEB15M1QlvONq7JQw
	 rvECyMLX8sMuyJARsoFC1n25vXh9dO59VF7BK/JV3EuyCjr5J2BOw1l9whHf++Je6L
	 wuzq5UKp6pAfA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dao Lu <daolu@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Conor Dooley <Conor.Dooley@microchip.com>
Subject: [PATCH V5 11/11] riscv: Add support for STACKLEAK gcc plugin
Date: Sun, 18 Sep 2022 11:52:46 -0400
Message-Id: <20220918155246.1203293-12-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085355_386322_5BD5E03E 
X-CRM114-Status: GOOD (  12.88  )
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

From: Dao Lu <daolu@rivosinc.com>

Add support for STACKLEAK gcc plugin to riscv by implementing
stackleak_check_alloca, based heavily on the arm64 version, and
modifying the entry.S. Additionally, this disables the plugin for EFI
stub code for riscv. All modifications base on generic_entry.

Link: https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/
Signed-off-by: Dao Lu <daolu@rivosinc.com>
Co-developed-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 arch/riscv/Kconfig                    | 1 +
 arch/riscv/kernel/entry.S             | 8 +++++++-
 drivers/firmware/efi/libstub/Makefile | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8241b12399d7..b4476f17fed6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -81,6 +81,7 @@ config RISCV
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
 	select HAVE_ARCH_SECCOMP_FILTER
+	select HAVE_ARCH_STACKLEAK
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 426529b84db0..2207cf44a3bc 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -130,7 +130,6 @@ END(handle_exception)
 ENTRY(ret_from_exception)
 	REG_L s0, PT_STATUS(sp)
 
-	csrc CSR_STATUS, SR_IE
 #ifdef CONFIG_RISCV_M_MODE
 	/* the MPP value is too large to be used as an immediate arg for addi */
 	li t0, SR_MPP
@@ -139,6 +138,9 @@ ENTRY(ret_from_exception)
 	andi s0, s0, SR_SPP
 #endif
 	bnez s0, 1f
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+	call stackleak_erase
+#endif
 
 	/* Save unwound kernel stack pointer in thread_info */
 	addi s0, sp, PT_SIZE_ON_STACK
@@ -148,8 +150,12 @@ ENTRY(ret_from_exception)
 	 * Save TP into the scratch register , so we can find the kernel data
 	 * structures again.
 	 */
+	csrc CSR_STATUS, SR_IE
 	csrw CSR_SCRATCH, tp
+	j 2f
 1:
+	csrc CSR_STATUS, SR_IE
+2:
 	/*
 	 * The current load reservation is effectively part of the processor's
 	 * state, in the sense that load reservations cannot be shared between
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index d0537573501e..5e1fc4f82883 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 				   -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
 cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
-				   -fpic
+				   -fpic $(DISABLE_STACKLEAK_PLUGIN)
 
 cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

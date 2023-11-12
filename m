Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F41C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HghI2KGHG3RxnyZ655ldCodudeut9jyvNRKDsTvwwrc=; b=DM2MKl9XSSTc+2
	rXlHrMtXj3jOkfWb4Ez3P+XzaJPBfTA0WqOojAPKce8sNok5iAvtwKF1xXlfM5QMdHrB7FgiSFCu8
	NPwW10a/zvFcH/mcpMYDpJEW3uZPsqX+QQ4rYDqg7s/j3h1cHRqexzqFz9So+Lktf3neOwipyNVln
	moBwSPUZMc/KEeTOsOlVdDJvgN2MlHaJjz/K8aYjd/hUOeoAu+EJcH/SQp2DzJha1/BBcF6KaNOSN
	I7P3qZLc8NeNX8AAoDYbUsfvYK0Fjo7v9sbqwA/BV8ryePWoEyj+FcqsRQGt82zzsCqnWOLp3QGZ6
	//9QRGYO5GEXUNbuLarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23ml-00BkAt-1g;
	Sun, 12 Nov 2023 06:17:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mj-00Bk9E-2W
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4459B60C24;
	Sun, 12 Nov 2023 06:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C71C433CB;
	Sun, 12 Nov 2023 06:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769848;
	bh=81esJgTh4dOkvuzt4uEEBn1Vcq8zmYGS/5KoUzDRHwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fM4A4qzP2sUTruR53HAyk8qZNaK4mAcObnJjPX2TBzXVU1E9k1oP29D1Ez3sdVbPq
	 VsesVknvjqglzsZlFYWy6ftyd3D62nRk2/pz7DZpsI7W7TO8MDjHHs0XUMXsZ7j2fr
	 aAj6qKQnOSkGp8jsZBRKxYRlvbmVXPviL5PIdHIDX3N5OPy4/yEVTkn8Pq6uaPa5wO
	 lqPxaJT15ygRjwBsrpYDU+yL0kCH8mcajb45/i0aYxr0YIY7ahmWeIEEumtYCKelgs
	 5Mr7VtDVKIqN5vVaQ+ZFIaoXjEIzMdQ/RE9v+85S4qGWU+sLPqQYtTovNtmUB3AxHv
	 0Vj8D6OiNLLvQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 20/38] riscv: s64ilp32: Add ARCH_RV64ILP32 Kconfig option
Date: Sun, 12 Nov 2023 01:14:56 -0500
Message-Id: <20231112061514.2306187-21-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221729_862829_7F7E2713 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Just the same as ARCH_RV64I & ARCH_RV32I, add ARCH_RV64ILP32 config
for s64ilp32 and turn on the s64ilp32 compile switch in the
arch/riscv/Makefile.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig  | 7 +++++++
 arch/riscv/Makefile | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5d770b8e2756..5a3eb5e7d67a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -334,6 +334,13 @@ config ARCH_RV64I
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select SWIOTLB if MMU
 
+config ARCH_RV64ILP32
+	bool "RV64ILP32"
+	depends on NONPORTABLE
+	select 32BIT
+	select MMU
+	select VDSO64ILP32
+
 endchoice
 
 # We must be able to map all physical memory into the kernel, but the compiler
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 8605050bddd0..3b1435bade49 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,6 +58,7 @@ endif
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-$(CONFIG_ARCH_RV64ILP32)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
@@ -121,7 +122,11 @@ stack_protector_prepare: prepare0
 endif
 
 # arch specific predefines for sparse
+ifeq ($(CONFIG_ARCH_RV64ILP32),y)
+CHECKFLAGS += -D__riscv
+else
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
+endif
 
 # Default target when executing plain make
 boot		:= arch/riscv/boot
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

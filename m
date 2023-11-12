Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76AFC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ii6LyYifp8ESV4Q16A1ueeWxY3xTRCUNJNptgvClEuo=; b=FbJz18ftt9uPSG
	zvYxRuC0vzSjPq4asrRwc/8AG+iabWkPzYaA7mCk/X3WdXX3MGHVph8JLWOHQKBHzO3xeT8ev/VN+
	cyMRjtOFChdQiSF8pU3oephHitMsuBxHMnpiXOD9noJ9FHh8J1wNpvknB/Lmm/2oG676bZT6hYbiH
	YOw8yqCVL4AEMWGd6cLcrNUp9g/2wgGHefPEZZdg/0YijF0BABAn9IebDWOnzLsm/la/PyMDDH+4a
	6uDv5Vj+EDwMqoYp+p17puhAYiqfORs7xPv+kICXrH5DBVsoeE3RhXL/4V01G89zWvCHQvLgNkak0
	9RuFQlKlIV+fn/6WzBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23me-00Bk6E-30;
	Sun, 12 Nov 2023 06:17:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mb-00Bk2m-2P
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:17:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD153CE0E9F;
	Sun, 12 Nov 2023 06:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DD9C433D9;
	Sun, 12 Nov 2023 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769837;
	bh=yJ53jomTLG+j+rzKLDFglTmPOzUq4xATJqhV03Y8NDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uXWH+71BlkB0gLhz3M2X15BE4B4oEYB9gyycQqZ8+FdLYqMz3funNQkzHc0Dy9XBp
	 8ObE/BWmXibABF2C3xM83Jafy7ZAcI0Mt/kEddZ5fp3qHw4s8Sm5JNY7WKFOnwlTHF
	 XebaLVFboE5rnhqBdO5/ZdqxwmPOogqsgCllKNUnGJo0WlEBkq4RTDjX8YLafHMWJ5
	 5PqFLGR5t8hI3HrTmU+l0D0GDKxB0il/JGfS2b455jexb153+6vOha/HJiAAaVRPMD
	 JUj6goF6Ow1Gm47Z17xP/gMVRHN6sFy0NoVDBX0XwqO3xDgrIkSCjn1gSZSqBbhqhi
	 fdcFURboW9taw==
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
Subject: [RFC PATCH V2 18/38] riscv: s64ilp32: Add ebpf jit support
Date: Sun, 12 Nov 2023 01:14:54 -0500
Message-Id: <20231112061514.2306187-19-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221722_126177_2EB7BEDC 
X-CRM114-Status: UNSURE (   8.85  )
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

The s64ilp32 uses the rv64 ISA instruction set, not the rv32 ISA. So
bpf_jit_comp32.c can't be used for s64ilp32, and we use bpf_jit_comp64.c
instead. This patch makes s64ilp32 ebpf jit correct and improves the
performance because bpf_jit_comp32.c has significant gaps in mapping
ebpf 64-bit ISA.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/extable.h | 2 +-
 arch/riscv/net/Makefile          | 6 +++---
 arch/riscv/net/bpf_jit_comp64.c  | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
index 3eb5c1f7bf34..7e22bb520309 100644
--- a/arch/riscv/include/asm/extable.h
+++ b/arch/riscv/include/asm/extable.h
@@ -38,7 +38,7 @@ bool fixup_exception(struct pt_regs *regs);
 static inline bool fixup_exception(struct pt_regs *regs) { return false; }
 #endif
 
-#if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
+#if defined(CONFIG_BPF_JIT) && !defined(CONFIG_ARCH_RV32I)
 bool ex_handler_bpf(const struct exception_table_entry *ex, struct pt_regs *regs);
 #else
 static inline bool
diff --git a/arch/riscv/net/Makefile b/arch/riscv/net/Makefile
index 9a1e5f0a94e5..907edce21acc 100644
--- a/arch/riscv/net/Makefile
+++ b/arch/riscv/net/Makefile
@@ -2,8 +2,8 @@
 
 obj-$(CONFIG_BPF_JIT) += bpf_jit_core.o
 
-ifeq ($(CONFIG_ARCH_RV64I),y)
-	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o
-else
+ifeq ($(CONFIG_ARCH_RV32I),y)
 	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp32.o
+else
+	obj-$(CONFIG_BPF_JIT) += bpf_jit_comp64.o
 endif
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c648864c8cd1..ec0b7fb6982b 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -126,7 +126,7 @@ static u8 rv_tail_call_reg(struct rv_jit_context *ctx)
 
 static bool is_32b_int(s64 val)
 {
-	return -(1L << 31) <= val && val < (1L << 31);
+	return -(1LL << 31) <= val && val < (1LL << 31);
 }
 
 static bool in_auipc_jalr_range(s64 val)
@@ -135,8 +135,8 @@ static bool in_auipc_jalr_range(s64 val)
 	 * auipc+jalr can reach any signed PC-relative offset in the range
 	 * [-2^31 - 2^11, 2^31 - 2^11).
 	 */
-	return (-(1L << 31) - (1L << 11)) <= val &&
-		val < ((1L << 31) - (1L << 11));
+	return (-(1LL << 31) - (1LL << 11)) <= val &&
+		val < ((1LL << 31) - (1LL << 11));
 }
 
 /* Emit fixed-length instructions for address */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

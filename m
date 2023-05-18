Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9DDC7EE2C
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/eeXy+Rf0lA+7j2N/KCU8D3gx/WsEA/FR+xvYKAKVA=; b=VPfDOEct9ceCIk
	GrWRyEA2PP2gLHb4J/oY9Pr+XF/MZY74L+IrHvnVEVTlKeVYndznMuxxB78zC62uktwvwR5MMJDQ+
	CJSXJtM2fXulARLxwEuw+dKUl2MUy2+24YCmO0DApX63k9qr/qSa30pCzwdwL9Z+M2YbSvzoEY2w0
	LYOUKh5zimdGjqwzww9V5oRmMplkbo9o2Wb2K+WIuZWZL3e0bzasePNWuFwbxmQm+c4bcfO7l8y/F
	ahM38DpZBOauXDuCtVfpkTdrRJ+66G+f3hdcKefrP9Y86cB0MwB9c+wZy6ifVSzgzTmtOrqBifvqC
	xc6Z5Vov6UVJm662MG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRD-00D2d6-0w;
	Thu, 18 May 2023 13:12:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRA-00D2bU-2e
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:12:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62D2464F51;
	Thu, 18 May 2023 13:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790E8C433A7;
	Thu, 18 May 2023 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415575;
	bh=gcDd0R4XsxsPBucDmYK1iap8GL8ZX5NOiXczxwUZldM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uu7DJ5RUzqXpTaSuArwglr0rWJYmKTwNtwf/L5azEkL3TnZGpmnZn3fJXUSHUmWpZ
	 dJVivDkIzOHwZOSDa13HbwD6EBl2CPnbpPqmOKR666K2piHTT4NtNULOC3f32AASrE
	 IL7+haD4mgaXB9yLIiarp0uMJAmejmJYqyIEfNMIJgLsVblo4fwUNFeiEu5O1OOvFI
	 OQ4KfeHqtKP5n99HlbyH3fGyXKQJw1mYJbnoFSIXe4fGIsBdqj5OzyqYlrbPjBTpYk
	 /Rv9fPyUwOKT/FJbwRM9rtywAfkUqR3vXa6cu6tZ9IYe6pQ/ThCT2LtfDtqAGmv0ZV
	 E+dV50MoDYR8Q==
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
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 11/22] riscv: s64ilp32: Add ebpf jit support
Date: Thu, 18 May 2023 09:10:02 -0400
Message-Id: <20230518131013.3366406-12-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061256_937953_8A0E0EB2 
X-CRM114-Status: GOOD (  12.84  )
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
 arch/riscv/include/asm/extable.h |  2 +-
 arch/riscv/net/Makefile          |  6 +++---
 arch/riscv/net/bpf_jit_comp64.c  | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
index 512012d193dc..3ad79a7989e2 100644
--- a/arch/riscv/include/asm/extable.h
+++ b/arch/riscv/include/asm/extable.h
@@ -34,7 +34,7 @@ do {							\
 
 bool fixup_exception(struct pt_regs *regs);
 
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
index f5a668736c79..5a65cd01c73c 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -125,7 +125,7 @@ static u8 rv_tail_call_reg(struct rv_jit_context *ctx)
 
 static bool is_32b_int(s64 val)
 {
-	return -(1L << 31) <= val && val < (1L << 31);
+	return -(1LL << 31) <= val && val < (1LL << 31);
 }
 
 static bool in_auipc_jalr_range(s64 val)
@@ -134,15 +134,15 @@ static bool in_auipc_jalr_range(s64 val)
 	 * auipc+jalr can reach any signed PC-relative offset in the range
 	 * [-2^31 - 2^11, 2^31 - 2^11).
 	 */
-	return (-(1L << 31) - (1L << 11)) <= val &&
-		val < ((1L << 31) - (1L << 11));
+	return (-(1LL << 31) - (1LL << 11)) <= val &&
+		val < ((1LL << 31) - (1LL << 11));
 }
 
 /* Emit fixed-length instructions for address */
 static int emit_addr(u8 rd, u64 addr, bool extra_pass, struct rv_jit_context *ctx)
 {
-	u64 ip = (u64)(ctx->insns + ctx->ninsns);
-	s64 off = addr - ip;
+	ulong ip  = (ulong)(ctx->insns + ctx->ninsns);
+	s64 off   = (ulong)addr - ip;
 	s64 upper = (off + (1 << 11)) >> 12;
 	s64 lower = off & 0xfff;
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

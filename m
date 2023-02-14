Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0C8C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KFA2S9IBoKLe/7mUFlVeUNdyF8GWiNuo5YWbOAyIeXw=; b=osKqM62XQ58zoQ
	hMePO97SDocsrYekEqM5aQpNAVYhbGrXOsQ4ieW1DaDYFz0bqC/l6hePePw4CtI9L9x1JIe8Ur5Ss
	0Dtp2y0GPJVXfsQPfOfQqqG0CrVLx2IBsVIX9+RSzdRZpOPmUTUuUjV3p4QZehUDyF+YQPrkZ/gja
	vDBpHBV6qtfRQ6ae4iuBseCg70ZA74VoGkzUVUxSUGYQDplcxzDAI68shoirU9rsdUHupJG1IH/TD
	9qKj3HdKMaDcTFvmgp7b4MecgYR38tXZZx08B3Vx1fkbs4ASU5dVKOB3zDyfFnkqdfpTsZR8Tx6oT
	y0obqflOfwQdPPX0AZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwxR-002RGa-Ab; Tue, 14 Feb 2023 15:11:01 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwxL-002QzK-QT
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 15:10:59 +0000
X-QQ-mid: bizesmtp86t1676387410thfnq3m8
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Feb 2023 23:10:09 +0800 (CST)
X-QQ-SSF: 01200000006000C0T000B00A0000000
X-QQ-FEAT: +ynUkgUhZJmMMgQ/G0DvCYIxJxB+ru0eKw9Bwz9jyJEXuIgmWUnnyashObiG2
	TcKZiMmCwI2XvYIFsMAl6OznJJ7j7mah6i5NawezpUciLHf7BjWwdopVC91eomsWeHWsDmu
	T2jt28foleXJUMMkmKiZNNyhuvMdxjvn9aszea9fwPb8hRR9NBuIR2AarxMKC/wN9J5JY12
	dHSOLLc0o4Kj9OVsJ4wH8aDgZ86mTfM7vBwDinorYHmFQAZrjAxqCsuTZ6bmvQENahkwGtv
	arVLxAkq8dWPfcwRsFFUoD+WTH/wDcnfNL87qWiM/OS+cekpzczHoSYUS9goQUsk/XlqVeJ
	3RxHflEx53d3lQafEfSfYc0AECpKC9DlAmhZcacV4gcixdcORfmv0qMpnS8qcHekZ0BBJ22
	qLbTQLi59kKIlthuWENKJg==
X-QQ-GoodBg: 0
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [PATCH v2] RISC-V: Enable dead code elimination
Date: Tue, 14 Feb 2023 23:09:59 +0800
Message-Id: <20230214150959.49088-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_071056_307018_D8DDCF5A 
X-CRM114-Status: UNSURE (   9.61  )
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

Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
the user to enable dead code elimination. In order for this to work,
ensure that we keep the alternative table by annotating them with KEEP.

This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
it only shrinks their builds by ~1%, a smaller config is thereforce
customized to test this feature:

          | rv32                   | rv64
  --------|------------------------|---------------------
   No DCE | 4460684                | 4893488
      DCE | 3986716                | 4376400
   Shrink |  473968 (~10.6%)       |  517088 (~10.5%)

The config used above only reserves necessary options to boot on qemu
with serial console, more like the size-critical embedded scenes:

  - rv64 config: https://pastebin.com/crz82T0s
  - rv32 config: rv64 config + 32-bit.config

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..8a73d7180cb8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -103,6 +103,7 @@ config RISCV
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
 	select HAVE_RETHOOK if !XIP_KERNEL
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 4e6c88aa4d87..51218cfe1ee4 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -101,7 +101,7 @@ SECTIONS
 	. = ALIGN(8);
 	.alternative : {
 		__alt_start = .;
-		*(.alternative)
+		KEEP(*(.alternative))
 		__alt_end = .;
 	}
 	__init_end = .;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

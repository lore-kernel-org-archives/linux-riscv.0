Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FDCC636CC
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 00:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFA2S9IBoKLe/7mUFlVeUNdyF8GWiNuo5YWbOAyIeXw=; b=h785mf7hCXxtrr
	089vQUMrHR7DIszQpgW9zN8ezqgRMXZO60NdEcIxxvlUpiuDn0csMQbF708an8oMxgWaTleSJxkTb
	O5wpTsk80j+mzms/iRLweN0a9hoZHwFkol4OPNvdcmBdk5QX4ohftF+bvabWHbPR4nhw4ScyBGWcG
	LtFIxls/px/l04F+KlvnLrjxQUDMjbbqlmcaok3Ibx8oSq7wX9J2x9wOEE7AG9qTtmUFWiL8bnegl
	MqI8J+mQDSZFegw8oeZU9bN0LB0xPV1e6CNCmA61fBOoSAbr2kxgILHrG8Hw/b7mICfs5tuV3QBS+
	WoNxYJyLzs1DGfnAWxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxi-00CFmc-4p; Fri, 17 Feb 2023 00:50:54 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSoxe-00CFeG-Ot
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 00:50:52 +0000
X-QQ-mid: bizesmtp76t1676594986t2mmsk6j
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Feb 2023 08:49:43 +0800 (CST)
X-QQ-SSF: 01200000000000C0T000000A0000000
X-QQ-FEAT: 5CNn+SP0K2vhxP3ij/QWqUpDn2ZGtGF/HTyDPtXoKH89iqmX5zLubkqspz2kF
	NtTnLYIU+0SgEHfMgM5sR432r0TwmkrBhe3kSySu0yLsgT/Mzi+EbeZyoycxW8ekbNOfRH1
	EXwhkOKRPC/LUAyhLqRb0s1KBws0EFd+HfFVJy6b2pICKxi0PJuR8HR9PRmB9M2cvkHWsfc
	8XLlUBY56KbU6ixoaSQW5xoQnB2/2OYtiW0RP0OwXyXI4+lqxgiNSKr/RMA0F5hV4Ns5IqG
	cUjDHnF+OJ33xh5c0CET//3UA93C/o1KyTGve+1c/7fiRLD7ejxwfy/voNuaapE0xHPZcwr
	pwOpy7EwBDywpDN/XTzr4UT0Y0uFav3R5GDMcnFLi7Baqd7sxf2ep2dZisXQosML7Wc74Ad
	DQ1lmWv68Z4=
X-QQ-GoodBg: 0
From: Zhangjin Wu <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Willy Tarreau <w@1wt.eu>,
	Paul Burton <paulburton@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nicholas Mc Guire <hofrat@osadl.org>,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [RFC PATCH 3/5] RISC-V: Enable dead code elimination
Date: Fri, 17 Feb 2023 08:49:23 +0800
Message-Id: <234017be6d06ef84844583230542e31068fa3685.1676594211.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676594211.git.falcon@tinylab.org>
References: <cover.1676594211.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_165051_411627_B07828FA 
X-CRM114-Status: GOOD (  10.13  )
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

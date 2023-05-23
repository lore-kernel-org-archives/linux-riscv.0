Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE4C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/NlQEA73ZOtUqus4UJ1aXKlJKuoN2FlbZex+EATjaQ=; b=DpB+xPyuDZUDJ0
	dnC3Rzz8K2KRoe26EIbFGHarGDItKuTNNZbdhQfTyKzKFKHQeYBrKFk0WaQmsWEDNA2uqX/qTYmhO
	qhiWiJiz/iJmi+12d9ylWS9LsgurrX+Kg1+3MBtcRzlOExCjPF+ABIAHSs6rADjqDUtNqV49fKBNr
	xzW6veHx3rZTxbS7zxwXMB7rBmhQr7faenLDJxOhfJChpUfxes0dYHDoFsfrFobvU3+/IQ44w4zko
	G6BRlx7UO3LL14ujZEk9yVnO6hOUb76yTeSws5ohajxDPU4quXU1POg1QEPvNGnsYHuW/Vr4uz6aL
	JkLjnnKwnj6Btlwm3bmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSt-00Atv3-1O;
	Tue, 23 May 2023 17:06:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSq-00AttT-0f
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 17:06:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC1E16186E;
	Tue, 23 May 2023 17:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BE7C4339B;
	Tue, 23 May 2023 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861583;
	bh=J4geLF9/wB/nci7eyTPzHGp1IQrIjTH306iCGvwIsQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzqNIne/apjydPkehRRhk/0O0hkReo4pjcZtGnV4WX7abAD5K4e3kuBRAVahk8os8
	 NaRieZa7LqgDjJyjU1AXbv8j08bEFYKRnT2K5WaUoYsQG7u6dbZmYRa4w1lrVkLGKk
	 AfNwCokEOjU34OHzwDt15ZOWzmY2EYcrAgK1lSiNg/G/2OrctV9LzlJcKjD0Xx2O5K
	 5QLRx+rWuzOuVStoft7q68LYRA02Ic6uHJtnWRJcDd5b682rKLWJKDIChj3ot3PNGU
	 Oph96bKhybNTihKFHNrXw/h8maDWRzFbCZ2O4FrUuNE1nqNc9I2eedAOXS8Uji5dXA
	 KoeOlvBux09Rg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Zhangjin Wu <falcon@tinylab.org>,
	Guo Ren <guoren@kernel.org>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v2 4/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Date: Wed, 24 May 2023 00:55:02 +0800
Message-Id: <20230523165502.2592-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230523165502.2592-1-jszhang@kernel.org>
References: <20230523165502.2592-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_100624_330286_C87A04A4 
X-CRM114-Status: GOOD (  15.07  )
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

From: Zhangjin Wu <falcon@tinylab.org>

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

Here is Jisheng's original commit-msg:
When trying to run linux with various opensource riscv core on
resource limited FPGA platforms, for example, those FPGAs with less
than 16MB SDRAM, I want to save mem as much as possible. One of the
major technologies is kernel size optimizations, I found that riscv
does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
--gc-sections flag to the linker.

This not only benefits my case on FPGA but also benefits defconfigs.
Here are some notable improvements from enabling this with defconfigs:

nommu_k210_defconfig:
   text    data     bss     dec     hex
1112009  410288   59837 1582134  182436     before
 962838  376656   51285 1390779  1538bb     after

rv32_defconfig:
   text    data     bss     dec     hex
8804455 2816544  290577 11911576 b5c198     before
8692295 2779872  288977 11761144 b375f8     after

defconfig:
   text    data     bss     dec     hex
9438267 3391332  485333 13314932 cb2b74     before
9285914 3350052  483349 13119315 c82f53     after

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Tested-by: Bin Meng <bmeng@tinylab.org>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/kernel/vmlinux.lds.S | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8f55aa4aae34..62e84fee2cfd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e5f9f4677bbf..492dd4b8f3d6 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -85,11 +85,11 @@ SECTIONS
 	INIT_DATA_SECTION(16)
 
 	.init.pi : {
-		*(.init.pi*)
+		KEEP(*(.init.pi*))
 	}
 
 	.init.bss : {
-		*(.init.bss)	/* from the EFI stub */
+		KEEP(*(.init.bss*))	/* from the EFI stub */
 	}
 	.exit.data :
 	{
@@ -112,7 +112,7 @@ SECTIONS
 	. = ALIGN(8);
 	.alternative : {
 		__alt_start = .;
-		*(.alternative)
+		KEEP(*(.alternative))
 		__alt_end = .;
 	}
 	__init_end = .;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

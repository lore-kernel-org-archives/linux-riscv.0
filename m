Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD14EC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=plsQhXlkzNuOS5jmWc7eVqqkb6atWPcj215cJkLMjL8=; b=TNi65In960gYfx
	UN9ZCQB+lNHfwsJ9oA6rKX5m6ynIG0bEId05kFU/iZNYEAd7py4mUjG7zl/ZFnuTlVaUZe+MZibEC
	Nhg87eK0ehaHYdTqnwWeRYSMA47ElbVpU3I6vwzAHQg41ycvrBDkA7EMdHQQ88+t/jLCiRx93Idld
	uBZxH8NBYP4W6Yhcc25tlvZoxRWH19u+E5ClBljILVDCamtTIgt6XfobTRSMXXxl4lkQsS8HsWXc8
	Md76V97I8iZgn3ABB/IcUgsuMcPxl/R/kkAnUyt78bh65ctpbgVdjjVT0OKXMrCb8XKK43ZTAlZYY
	vxZ9xRONwviM3mW1udEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCXq-008rK0-03;
	Wed, 17 May 2023 08:30:02 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCXm-008rHi-14
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 08:30:00 +0000
X-QQ-mid: bizesmtp72t1684312179tqesrwha
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 May 2023 16:29:38 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: szTy5SWxjRneKCXULjaAiXzgnGEAcobu/BOGdql9Qd5s0hfoiAsPfM7/SZsN2
	IJF9NHSbDXAlkaXltsWW6rfMC7M0mxF3c/wNvRFT1TeMlrNsoTYl9r4yaVv0slxPThuenRc
	38Pt2+dT4wDjznsTa9r1mvEdOfws+WlF9AQ0q9rRLFQ09J/wfxfjGDAQ5/PzLr1JozafjFG
	lmNHN/cJ78b5vxceiZDMSvGFVc+vIchFm850wq6W445HQLYxixmR5K0CDOziJ2TiY/s93ng
	tYrdtIiHMR0oUYryC5HVBUMN0S3yh69ToVv0Xe0Xmg4ozkOpLhBCWmnoORWEA1y/N51AIeW
	Iq+ra3ayfTf5HDJRhw2gIVSgo2Ymw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4702469989516391609
From: Zhangjin Wu <falcon@tinylab.org>
To: palmer@rivosinc.com
Cc: falcon@tinylab.org,
	conor@kernel.org,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	npiggin@gmail.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	vincent.chen@sifive.com,
	tim.bird@sony.com
Subject: [PATCH v3] RISC-V: Enable dead code elimination
Date: Wed, 17 May 2023 16:29:36 +0800
Message-Id: <20230517082936.37563-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_012958_699021_88940026 
X-CRM114-Status: UNSURE (   9.10  )
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
index 348c0fa1fc8c..d2eb1a862ea8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
 	select HAVE_RETHOOK if !XIP_KERNEL
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e5f9f4677bbf..0f5dfbc113d4 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

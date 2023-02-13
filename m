Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF7C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gl0zakFEyxHZqp0xef5P6ZmqtXR5Fi03mCDuokimnZs=; b=vBrGLtaEZnbMVI
	FolFIZf2RUcZoGRPQKGCXsYpd82hiL5d1jwK74MFDUNbli+DRgPWYIzMVazkba9vl84bIYFIn2zhh
	BsH/0cwpM2VceE1JJF61OdkUfjes3wxxFpBEETw35nZrWH2lrxrfTiIAI1YSiEUEZJbry0GRniQja
	m1qk0Y+9VpDKz0VRAKp7gegU3Jduv+1lgBTG79KgP8Hv4Bdf3wMDhSsqkxxGgMwm22DegrFpBscFz
	K5tpH7YmqxlprmNk0CvclPQmUqV/dFbjE2BxDdhSnH+L5xqpPjW+ZRup6jvxxIpzmhuelsWwMb38B
	HP0dhM0Zw9BGAsJ5sTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcnl-00Fi2r-Uo; Mon, 13 Feb 2023 17:39:41 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcnf-00Fhzm-DR
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:39:39 +0000
X-QQ-mid: bizesmtp77t1676309951tzkk79m5
Received: from localhost.localdomain ( [119.123.130.249])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Feb 2023 01:39:10 +0800 (CST)
X-QQ-SSF: 01200000006000C0T000B00A0000000
X-QQ-FEAT: hoArX50alxGi7QKq3d0oPCwa0FRp3MK19V8qTwYUSBbMVhndQWh0x4zYP7WTx
	4wAEJkqh47zn4h8QLeqxQG11mwFod3Yd0yEklDcESWITmQ3dqfoQyezpoPzFQ/Ceoqf1/Fq
	JYCK3HRSFiGGWzSfiLD37gjVPTNLX+CJtJ4QucZ3eYsIxeX8dQob17RVgDwh3u8ztAGovdv
	Wg/ngMIkakC+4GhkXetA+WyVUaG0EnrVKcuNT/g3beWvlji0QEKzruHTOrNQvTvSTMFPJyN
	6aCDIQ16Qal31uwFPhZ8cMrv8vKExmjk/NH0myRe3ope7dCME2eSw0nJ1EA04VwIbuHCLrf
	0S7WZ2QOHnEnkutUnCNoJVRbHnukcd2txH4A/5HDGjfOv/swzoVQPhbQrbhIO65K3f3Yzrj
X-QQ-GoodBg: 0
From: Falcon <falcon@tinylab.org>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Falcon <falcon@tinylab.org>
Subject: [PATCH] RISC-V: Enable dead code elimination
Date: Tue, 14 Feb 2023 01:39:06 +0800
Message-Id: <20230213173906.214784-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_093937_087718_7B280D8D 
X-CRM114-Status: UNSURE (   9.35  )
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

Signed-off-by: Falcon <falcon@tinylab.org>
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

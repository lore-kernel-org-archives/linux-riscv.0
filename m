Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB51C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIs7DdGIDlAGgbOVE1WC/UdJdQBth+9BViYqJzqfKXo=; b=rXRrj800htrSMQ
	F0IIJeaKh05mHpabudjB/Mkf/e4ww5KdMLHZXYAlJzUTdtVWezEfz5vmxJ50ey3pG1LXif2FpoWtd
	5ua47fBgiY5j6axrDpKY+F3Fb6G89hcDpJUMv+1oyP3HijYJw5BBHYdATUui/nIqrMAFUy6upaVlI
	/L/LA20Xrbz5PVojDFo2DZoqVXPBGJHEL1JyT8zZnZSwnr36xOOkoc4Eux3Oo9430TyGN5OUNOfw9
	Eaw993opJPZTwoO6Wi2zIYl5oFDxFk2aY3VEvyj3ORxrNLbtfo1PP53wWE8Xs6OFcnwjfb8IVevTT
	NvBzUPcqolycyxHbE3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUNqf-00BqgU-SF; Wed, 16 Mar 2022 07:13:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUNiE-00BljD-VK; Wed, 16 Mar 2022 07:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C1606112F;
 Wed, 16 Mar 2022 07:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B164EC36AE3;
 Wed, 16 Mar 2022 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647414289;
 bh=a1P2DNQDu+Nr0wIsMe45GFTAoBbxFKExa639SNMT8Ac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LgPd0H/CgAWrDa1r6V53xbwnOApkexZkCZrfY+9Anm67m/JBXCD8lcjanyRL64Ppd
 QXZc6ovx7MD/aWmVbdzsO48tXypXLMMK2cWjpIib1cT/GXwnNK8Nn/rnCmSw3amNbr
 DP0j/M/jjdTvKABOKUP2KgiSx66XlMucJT9wrMq/3alMD0BgFxBh31R4rA1MCeGqdZ
 maMic0O5dv/tk2cHByy5DPEDsBclItk+BQfdNUc0GirxZygxc8yjkVCSTPC45KeWlX
 TLiOzBX03oPft9KwUSlV2n/RkiN+X5oWXw0RlQ++mkE2319ChO/7TBx2F/pgXGdWUL
 ioVnB7G2ibpbw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V8 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Wed, 16 Mar 2022 15:03:10 +0800
Message-Id: <20220316070317.1864279-14-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316070317.1864279-1-guoren@kernel.org>
References: <20220316070317.1864279-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_000451_110262_4FA4E17C 
X-CRM114-Status: UNSURE (   9.86  )
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

If the current task is in COMPAT mode, set SR_UXL_32 in status for
returning userspace. We need CONFIG _COMPAT to prevent compiling
errors with rv32 defconfig.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/kernel/process.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..8c7665481a9f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -97,6 +97,15 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 	regs->epc = pc;
 	regs->sp = sp;
+
+#ifdef CONFIG_64BIT
+	regs->status &= ~SR_UXL;
+
+	if (is_compat_task())
+		regs->status |= SR_UXL_32;
+	else
+		regs->status |= SR_UXL_64;
+#endif
 }
 
 void flush_thread(void)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

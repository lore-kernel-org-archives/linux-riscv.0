Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60712C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4cY3Zp0QzXr0ZD6Y3FonMfw/Dlko5y7r5YBt4RnW8g=; b=rT0TEBJ0/PKywZ
	a+Z2oDg+/4TwbbkY+ZaYQBSECl70QMjriJa/BbQEoEsu/aIc5ecAslo9Q3qxfIyRnknd61WLrQ9a2
	V/icPKbWCS0B6eLHChi4RJIo6Io8o0oFO5YX3pm+83dj7Dxn90V8JNuU82cwARM41flyWoX0NmsiZ
	Bx+uo7U4Axvj595Ww1rz0hRHPMNGvWFX2cGOPBqdFAnelqPbtnkS7seJRaxkWgtNdrmXs0bKBLyEv
	UHTgMUHy0C9PAqBWvV1p/BBmt0gAdfF6rCtcZZZEq493+hZUNtpWhXyI9ncWqDtWyvz9oDMpnG3z/
	e6T3uQAkoeYM7UeR6L5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDmnC-004fmW-18; Sat, 29 Jan 2022 12:25:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDmgv-004cJs-0f; Sat, 29 Jan 2022 12:18:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E74060C1C;
 Sat, 29 Jan 2022 12:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25475C340EE;
 Sat, 29 Jan 2022 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458731;
 bh=yfEc7zgR3yCBk8Yfn7aWFLEsFQj0j+xfa9v6cbpF6Vc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pdpjdGlMRcHuKdx8nas7nPKxC+10cSp8Gfll1lqGgxvkbB8YMYFeOfPCOFz0wFp+u
 9/wmW0N0MD8TmY+dIFAVv+uY/IExYZRNW0QrxlGzf4RTm0Z6GxFGAc1jqtvqVIIhMp
 hrqQ5ZFYS2uBzY7I/NxA2chymSofMTj6klfxdNpbbHDT+y+GzHDaiCYfQ+qc2nJ+WK
 rPN+CcR7X4tlP/Io4QKbVho8BBzc8L27AzR3L8Vx/GRx0Tr9dBKAMH0FhiaM30UbJz
 TfMy5Ok9Ke1Ki9f6sQIR2w/W22msyhxmfPJYSbES6kdtGlinYTgx6ugDgmejCvK78W
 oZZH/n08IfzQg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 10/17] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Sat, 29 Jan 2022 20:17:21 +0800
Message-Id: <20220129121728.1079364-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_041853_162052_EB0961E2 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/kernel/process.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 03ac3aa611f5..1a666ad299b4 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 	regs->epc = pc;
 	regs->sp = sp;
+
+#ifdef CONFIG_COMPAT
+	if (is_compat_task())
+		regs->status |= SR_UXL_32;
+#endif
 }
 
 void flush_thread(void)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE298C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ej0/sd45R/SSrDWmwq3VCg17OKM7+wKW4O/ceJAeP7g=; b=FFVmdY9Hpr96z8
	HGLpHbkU+DERMv20UqxpKS0CEg9pZbdmZNOPPcIz63wfXnJj95qRAm6C974wpht5F4Kt3ZZ39c2ng
	cLZ7VrCTqp8a/W2TwJngIE+78aPpS8PbO1bm/XxEMShmWkVz/P08RXVjPWPTnzGUj0m0OTh0ppywZ
	aV4RYOUDGvIJPZhRH6RgssyTD0FY8dcL6UiEjR2Gtd+Ok/Lp7ze8vOZSXy4W/Ao/xXwWANT1Aha2s
	DRGCsKs680GXhL8ke4UHujuKQFHqLrBj7vb10iZEpX5g/ns3wtt1IbVbM/PlyicY2Amy/pSLvCt7x
	H2cCe22FyuAWjpRTF4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASIJ-009Uz0-Hl; Thu, 20 Jan 2022 07:55:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAS4U-009OgU-UW; Thu, 20 Jan 2022 07:41:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98F63B81CF8;
 Thu, 20 Jan 2022 07:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E956C340E0;
 Thu, 20 Jan 2022 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642664483;
 bh=0DWs5iJTfzb/AG7lBwtZhAg40maM1nWs2s2i8EajS74=;
 h=From:To:Cc:Subject:Date:From;
 b=ohPrm6RhMpzE4PJlBhzIO3QqmUDGTsZfaWa3yx7kYhp77CPkEpEvQD0hxMOddg/sI
 X+Vh7CX4N/iTsOYZ8VrjPyRGbHwGVnaEcJ+C3ylQMe3oumyRaD65kUkajfLyGkd8UK
 ZvG57y7Zcx4obNSxVmqlUHQkUgaI3unxJA4Xh6WlaJ3+toi+3veYV5AezAWsrDh/PE
 8DkpJz5RmxyeX3aH1XLDkYOgusQRgiAVZ2TMieh7eVtq0MhRiXfC/XDCAfV9T1e5Cr
 TLw2nQmDhnUcV1kzzLVWqm2XfVt7PjqZZIaLUKc7iknEOJTJ+Q+n9RJ1uzH4Y3FIwr
 AFlRcf0qvQeeg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 15/17] riscv: compat: Add UXL_32 support in start_thread
Date: Thu, 20 Jan 2022 15:39:08 +0800
Message-Id: <20220120073911.99857-16-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_234127_155614_7389B06F 
X-CRM114-Status: UNSURE (   9.34  )
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
returning userspace.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
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

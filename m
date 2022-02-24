Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0880C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uohbGYJIT9gbfpNv1DmfOaNHp+FTlvjvJVn9lbwzSQ=; b=Myhs+sC5bZPA2v
	Q5nl3Fp020no7CyN4CyXC/CS905DXFsj5FJf+YG+p+UGj+m1WQNbnlg/QzMKNptnpTrqspoahIjKO
	r2GUJFOtXwpluhpGLWSfL4CXlBFT7+LvttbdEI5IDmzOsmKHjvSg27woswt3aCd0nIDHi1LpvP6D6
	syL3F8uUDRzG5iLYlKxGeoD+XC6pNXzf8qeA2wMb4xpNbl3/lQA7iP/TalhyHyYIJOg3tSSjef8gi
	Zs05NNlz3VuFCGYWGdU6w3INVvZASvySeBPrukk6UjIcR2M/APmGKiKnfu1UCfF7RDiq87fVtpSgi
	XzZXnFohhcoGZtO2+J1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNA4A-00HUIT-Sh; Thu, 24 Feb 2022 09:05:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN9vP-00HP1N-Rx; Thu, 24 Feb 2022 08:56:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19CF061ADD;
 Thu, 24 Feb 2022 08:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C93FC36AE2;
 Thu, 24 Feb 2022 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692992;
 bh=gBbgf5kf3c5mmUEjAYay2wu7mAYR3Ivcy9PEqe9Gg2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qj/38JcZbxTPSmptmMS4yEQnYu+l125VzFo/Ah1g0JDHdEhu43kZTVtnwZLc/VOwj
 yhQWn0u5Z9FXOzml7YR0PGoLfMfGVyBS+kG5JDrW5TsHa5esKlgij8z1R29jh8ldw7
 BcYOSlVRlCHzv0c9iqFnSrznkEMweKP8CD8lUG73uoLXLNIA5bycrxn9Nrobs+gi0G
 AqW514Y4lNjkMo7ntm5w5Yy3ZrGDCREFH8DecO6KSzVfqLvjEDhKPIBAFoXuPCGjo/
 vIk+RgZy6gxnY3ktiN8tfLxe448UsYKijNebRDxXyPgYlYtUMaPNpqPem9zf8mq+w+
 IRHX2pHtJEgzQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Thu, 24 Feb 2022 16:54:03 +0800
Message-Id: <20220224085410.399351-14-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224085410.399351-1-guoren@kernel.org>
References: <20220224085410.399351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_005636_021381_0B7327D3 
X-CRM114-Status: GOOD (  10.19  )
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
index 03ac3aa611f5..54787ca9806a 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 	regs->epc = pc;
 	regs->sp = sp;
+
+	if (is_compat_task())
+		regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
+	else
+		regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
 }
 
 void flush_thread(void)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

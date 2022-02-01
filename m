Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60ACC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4cY3Zp0QzXr0ZD6Y3FonMfw/Dlko5y7r5YBt4RnW8g=; b=SWeyoh/VmHyuSv
	zdXDyIxLO0usgcbnMqGwwHjO2AdFTlMWmR9ZV+ZXeYX/btWfmHxNYd+DCopbcpVnRa08d4q6KlbHT
	KzUSsOrwztCXECDFPl0RDM81gjLqXzjfZwQ7xP13SYuZ7sDMvZ+7Iwa5S4diECi/MXttGHrKXkkmp
	JRFqht1KCJ6LBYlnKtQsgBGK3saY/PNuoEbKDWReRR+WftPvOTC07RjuXBk6XyufX0YD1vw9BcNBD
	niS4t9EXhGgg+PIAjrpZ6hwjdseOr5qqwnYf7UNB/1jGdIlDM45CZihpARVKDYGGfk52T295Jvqc1
	tU/nDuR7HhIBd38MwC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEut3-00Cap2-CX; Tue, 01 Feb 2022 15:16:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEuka-00CWH0-OH; Tue, 01 Feb 2022 15:07:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B52C6166B;
 Tue,  1 Feb 2022 15:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDA7C340F2;
 Tue,  1 Feb 2022 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643728039;
 bh=yfEc7zgR3yCBk8Yfn7aWFLEsFQj0j+xfa9v6cbpF6Vc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XijAuT9bnUGuYuCUmoALNBnEHlhZtDhCRON0RFO4F+1ePEy+7up2ymK2Ee3ugl35d
 Yaj4xeZMW1Asnh8eo46/EAvXu1I0vZizvuVgx83fqUzo8RsmbK6A0q/tKOhnA0InKi
 07WJFqfZsdSh5B1iKRzKqYFRDDFUKI41b/wd93Vpr0zWE29Vemj8+KymSC4bYkkMlK
 JB4JE4rW7JwmWjGG1DiEeSWyBj2hf6gCDG2iHi5SRLLhWJ8QP9q8kXMniqKjs6zzoA
 8r9gJx1Nsox9ck34CBiPhkdvtWJWJEwJ5CP7vktOGRnnlpclGdvMSGvdk6RShWn2ie
 QD1vkrdlU+wZQ==
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
Subject: [PATCH V5 13/21] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Tue,  1 Feb 2022 23:05:37 +0800
Message-Id: <20220201150545.1512822-14-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201150545.1512822-1-guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_070720_872841_B9E2395A 
X-CRM114-Status: GOOD (  10.28  )
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

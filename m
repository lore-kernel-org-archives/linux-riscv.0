Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBB8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ej0/sd45R/SSrDWmwq3VCg17OKM7+wKW4O/ceJAeP7g=; b=Ofy10azqzpSha+
	rpf7Ue6DGTGb3sBP85IBvnVH9Us9+6s/bPBr4BkHxEoUDXB4tazVaTrx89NXXqARhVycdCmHO15mZ
	DSpzNKZLYmuntl8rn/E2zQtbe1rvLCklD33B/dsX+VoFFCUIKAnqRn6u0uZN96F/hzzqdWBc3uR4R
	p/KE6Xr3jKKdr7lxVZfbWJ3i7mqPOBF2AhQ0zTwpvUnpupVaSb3CiuwhPWi8uBpcyvnCyKcZQN5ZD
	QS/2fYrOH+A59oRMCBPBXH7S3lJpV2SlPxNCFkPeapahXvvNYiGTGJ5Hqa78Oyb4j9JlSlZUwIdSP
	I4avA/khApKwuJqQCsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2E4m-001L7J-6A; Tue, 28 Dec 2021 15:07:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Dfn-001CHA-Rv; Tue, 28 Dec 2021 14:41:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E70EB81219;
 Tue, 28 Dec 2021 14:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0161C36AEC;
 Tue, 28 Dec 2021 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640702512;
 bh=0DWs5iJTfzb/AG7lBwtZhAg40maM1nWs2s2i8EajS74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OxBh7C71IIHi9eO5f/pmVx9w0T1KnI8arKFeLEyKuSw0k29VBXEkTJRZveE91eXTZ
 Zp4HIyyeePW0cxsnvhM19Zq8yUN4TpicnnaJJTR77X7dNfLXaRvZoTBMxOp66HimNv
 HVRUw/5Pgn+LSyE8hKnUA77rJ1QYylCqmE/zSVKMaVD4oc8fAns99GeIItWl/PDjPR
 PNPCcZQ2R166HFL/1uLl7cAHv3S+40xgOpXXPr9RGMMjz7ITs4K6LO3GLRFyqAxJAV
 fKqtpUi80X7z40+I9PFzqcdszWf0uUtXjQ34NyfrqN4b7UIguk1ClwbWuOtZXh5KlX
 i1guq1GoJ0IPg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 16/17] riscv: compat: Add UXL_32 support in start_thread
Date: Tue, 28 Dec 2021 22:39:57 +0800
Message-Id: <20211228143958.3409187-17-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228143958.3409187-1-guoren@kernel.org>
References: <20211228143958.3409187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_064156_078261_1972CA40 
X-CRM114-Status: UNSURE (   9.55  )
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

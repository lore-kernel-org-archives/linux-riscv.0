Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABA0C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Feb 2022 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uohbGYJIT9gbfpNv1DmfOaNHp+FTlvjvJVn9lbwzSQ=; b=lspH7lXHWJWULP
	85dpC5ufvP0Pk6cO7Ck1a+Wor7y/sFTGO9GjSrY8WMcjuddsTndRzlhKuXIjFRbPTOu2RX8SG12I+
	CXZ9Jn/cuAjAyauONFDCXdnf5o2nZkcuNS8dN/UPx21T6FRyeLtDUXJS0GV/IvgpJi+fvyMwFIDa4
	q2Eag/I7/EhzrpvcBuyNGG4WSDCqWU5Oy9bgfIoV4aVRvxf0ywsk+c4ryk8D1exCV4+tFL/xQwk/T
	0Adl++x9whIU7uzxn2qJ4CZIx8KstREPoO0hBfqdnCFzb0cPwCe1Y780ZERFA5SWmFlQy7bxHRrHu
	ABRyssh4RUJQwtIzlMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOMYn-009kLR-0A; Sun, 27 Feb 2022 16:38:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOMR2-009gAR-Im; Sun, 27 Feb 2022 16:30:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE2ECB80B79;
 Sun, 27 Feb 2022 16:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C803BC36AE9;
 Sun, 27 Feb 2022 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645979409;
 bh=gBbgf5kf3c5mmUEjAYay2wu7mAYR3Ivcy9PEqe9Gg2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hjbqRvCdQb4QvoBVDG1JMDwjGno3L3iuSBwozvdqRf67T3QgSSGKJFQ/56ni8Fs6V
 HOYkBe3k5SomMVdcmz2/+NYgLypNmc3LYGqKsTIrlYwkO3kyhc3kQjcEtKwIf0koRe
 KkjBPdpMFZHua7JAt41BojHCojrRdqZl7UdjEiZdoc/5Q7od9fGAV73O0btlVvzK3N
 65N7IARvPqXG+SfQcPkFRlFJjMm7eXawilVMsZLoFQrE4LsRejOdLiWoLxfsfYa29I
 CH0hi6oUfWG+jZ3ObojIPbqRLlUT1p3UPS2/i9B0UWUsDCp7tHYXvI+cnOsN0fZGzI
 2qAEb24o31ihA==
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
Subject: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
Date: Mon, 28 Feb 2022 00:28:24 +0800
Message-Id: <20220227162831.674483-14-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227162831.674483-1-guoren@kernel.org>
References: <20220227162831.674483-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_083012_798237_9828C8B2 
X-CRM114-Status: GOOD (  10.38  )
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

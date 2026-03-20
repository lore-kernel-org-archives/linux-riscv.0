Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269661093168
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 02:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPpRvxRFLGqkIptPYm1GtPrTn35WoMeQ12ZBPIqiK2Q=; b=WC4uM9QFLhEO9O
	tuPRdPacWoG+WtaI3F70K8HSY9tuQXTnSHkRWPCLmSEhloXUBSiToFtGi/P7/ec5Lpy3g1CKG/QYb
	f0Xhqhs6OzaDX2x/epbLk2Ubxga/5gelA394LQ3VVmXZFitWBjmLQKIZuv9gABvTeeqfKQrgUVr7Q
	3RaPkZfMCYKAdH6aac3MIoqBZ8HUOTPvHg796WTjeVKZS8xIuGzczPghTKGWLCU6gmXPCs+oPYi2h
	90WHN0l5lvqDcGyQktONylwmEIHeJXfKd+OswQkHdc9iHcnz2kIOI02hXxfuMbtIwSE/9oRc07AYG
	tmY58aj6viTmYtPKi1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSH-0000000BvWq-0TeZ;
	Fri, 20 Mar 2026 02:19:17 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSE-0000000BvW2-0bie
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 02:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773973148; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=27FZNlSrp1L9MDL1syetD/oEdjuKAA4Hp+762ac1MUE=;
	b=pfRoLFPlsTgfzzzlyuTsef2sG2BjzhaLhy9rHU2zZBKOnwnutt4eGQ00G3iHpFAHoBEoyw5ZSVOKTeuifjMmJLLuL1+z9rTWHfoRtD1d3+qxZGtEL84AseMz6OKoOfLvoGvwSx8uPDXKa9pWSmZw2v42YHiLyOzlg04fXX8P2Bs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X.JxWE3_1773973144;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X.JxWE3_1773973144 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 10:19:04 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	alex@ghiti.fr,
	debug@rivosinc.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 2/2] riscv: vdso_cfi: Add .gitignore for build artifacts
Date: Fri, 20 Mar 2026 10:18:50 +0800
Message-ID: <20260320021850.1877-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320021850.1877-1-cp0613@linux.alibaba.com>
References: <20260320021850.1877-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_191914_398328_D4971D27 
X-CRM114-Status: GOOD (  10.45  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The vdso_cfi build process copies source files (*.c, *.S) from the main
vdso directory to the build directory. Without a .gitignore file, these
copied files appear as untracked files in git status, cluttering the
working directory.

Add a .gitignore file to exclude:
- Copied source files (*.c, *.S)
- Temporary build files (vdso.lds, *.tmp, vdso-syms.S)
- While preserving vdso-cfi.S which is the original entry point

This follows the same pattern used in the main vdso directory
and keeps the working directory clean.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/kernel/vdso_cfi/.gitignore | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 arch/riscv/kernel/vdso_cfi/.gitignore

diff --git a/arch/riscv/kernel/vdso_cfi/.gitignore b/arch/riscv/kernel/vdso_cfi/.gitignore
new file mode 100644
index 000000000000..220b6ebece4f
--- /dev/null
+++ b/arch/riscv/kernel/vdso_cfi/.gitignore
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copied source files from the main vdso directory
+*.c
+*.S
+!vdso-cfi.S
+vdso.lds
+*.tmp
+vdso-syms.S
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

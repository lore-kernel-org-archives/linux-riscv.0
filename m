Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48739C54FD2
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 02:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=68/KqvqY8f+qwsOjnTcdE/GW46JvjePS9BvcWGK1ZKQ=; b=aJ2n9IM6uMCsTR
	mpjyoU0vtnWDsgDGSXqTFp+xxDxTBeli9QeQcWTcPyUHWDK+Yzn7jbNWE+/YJCkaZCw9KkT+A/SJo
	8LOc2sEPyXc1ckDPXvn0UAEtYijoF851v0936CEOy3DPMxXSNndjrJdtZyS24lZcdGfrtYsYQcnQK
	5rI98LFkrAmQREvTL9g/0cg24orayu4VIcIaTWYgc7/nH7rJkkXoeSc2cEzvV+fmj8HfT19/rcoig
	mCVDxUIQ/AuyR68JEpfFa4891jHLV+Hli5UUCdiGZ9cC7piuL/KuXREc+xGlryOzKbft7rPfud1SV
	+WIkHlDFhLMbbgAL2kWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtdA3-0000000FmPZ-3ykB;
	Sat, 21 Feb 2026 02:56:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtdA2-0000000FmOv-1KUW
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 02:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDE7060123;
	Sat, 21 Feb 2026 02:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D8EC116C6;
	Sat, 21 Feb 2026 02:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771642560;
	bh=CWYITnkXgzNyfLnHj5X6xXIaWL2MvqJ/EQQYMsFAqRw=;
	h=From:To:Cc:Subject:Date:From;
	b=SA/NzOzNr00ofjEGxz1dT6rP+E4jUWDm4xsr0fzgyjAjwjChonPiZmgXbfa949diq
	 bDPU9f2FVgWYvtt2JHpNdp+5+tEZaWirfPCylx6z6Ynsa16jrbU9IztOgMW1YYuNUd
	 F7IMSK8Xo3d8PPfYMh0F8NEoDBJq18ZJ1OaI14+3s5Yr2IqoB4ZjyT9KWnv/0Fr5F7
	 Ojr5kvynGWda/UtDyEifJ3kgh+ND0MssG4FgdEGbPv+9DP8TPmeHrNqN+HpkbTmabM
	 rBAbIshWUX4sNKX0ANVf73O/41oCnLsqnt0+HmwBtc9NaStzMEsLRnhRu1zuJJ2NKq
	 LDPSnD76lMhEA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: make runtime const not usable by modules
Date: Sat, 21 Feb 2026 10:37:31 +0800
Message-ID: <20260221023731.3476-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

Similar as commit 284922f4c563 ("x86: uaccess: don't use runtime-const
rewriting in modules") does, make riscv's runtime const not usable by
modules too, to "make sure this doesn't get forgotten the next time
somebody wants to do runtime constant optimizations". The reason is
well explained in the above commit: "The runtime-const infrastructure
was never designed to handle the modular case, because the constant
fixup is only done at boot time for core kernel code."

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/runtime-const.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index d766e2b9e6df..900db0a103d0 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -2,6 +2,10 @@
 #ifndef _ASM_RISCV_RUNTIME_CONST_H
 #define _ASM_RISCV_RUNTIME_CONST_H
 
+#ifdef MODULE
+  #error "Cannot use runtime-const infrastructure from modules"
+#endif
+
 #include <asm/asm.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

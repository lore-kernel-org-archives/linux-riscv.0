Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2139C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=chH+E8mIrGorSDQpOkkNpknSxE4V01sMCWw7Kc5zElY=; b=lgYz2Bb/UUoiN/
	SEilvY5TQkRS7r1/3NFXRDJxR9hLQpvtfFDtwl05pUaIRH53lo06oCRn6qRUPoAjDmt7ruaNPmPrr
	zximm7jH/yFzvr8KgE3WVLWc5aiGWS9Bb/WHcU55jFFw5nDruCaAnU93P9HVtv8UNDLDbjirGOQiz
	VveQTdV4eGaVDhuAzXFupUBC/LjpXnxAF/qBnyZ2Vvu+f9JW99n7xPvpS+yKQsKeVDkWKdf+/Q77g
	P8jx7a8dnW/zA8MpEhG/bB7mwKvSd6y77uzCfNiC2/c6mS7D4508HLkIG0iV9G/XYeLOYQg74GtDC
	8mKNTT2vWODzDsfoa3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnxKu-0000000A2Ia-2zZT;
	Sat, 23 Mar 2024 09:06:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnxKs-0000000A2Hc-0xVk
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 09:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79C79CE182D;
	Sat, 23 Mar 2024 09:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738D9C433F1;
	Sat, 23 Mar 2024 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711184794;
	bh=ZOv3sSaesxblVEAdTM44UPJ7JatqCSeSPmXcVNQm2nw=;
	h=From:To:Cc:Subject:Date:From;
	b=k9n2IhuTRpWMUr22Rqdcy09O2XfV33rrrY9XT7OPmgJ0laQCujJxF7Xt1mhHlmSYG
	 v8HI4rH3Y3w2mC/psMahQK9PkPw4atJRajpRe2kaLrI+1rkqq9enn7Jrl77O+ja1pp
	 HSxA/r7b0E9jERyxy1NhCYPLgD6CF3Z4S4yyHYPcVDWe0iACbegoR3P5CQb9rmQfaA
	 4i84kcbPNdpigQ9bpkWe+Zq0uXIlh+6otMFtSHZKd1tvMZ8abnBvJCkvUpTfvrKS9R
	 1egt38OH1p0o/dBRm2WdDk9S6Cdn6bZXKBVEdfL7a4VKqlwmIs5nOQz+tV2Lv5P/1M
	 HZlO2YOvXWM3Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] export.h: remove include/asm-generic/export.h
Date: Sat, 23 Mar 2024 18:06:15 +0900
Message-Id: <20240323090615.1244904-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_020642_451125_CFCC68B3 
X-CRM114-Status: UNSURE (   6.96  )
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

Commit 3a6dd5f614a1 ("riscv: remove unneeded #include
<asm-generic/export.h>") removed the last use of
include/asm-generic/export.h.

This deprecated header can go away.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/asm-generic/export.h | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 include/asm-generic/export.h

diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
deleted file mode 100644
index 570cd4da7210..000000000000
--- a/include/asm-generic/export.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_EXPORT_H
-#define __ASM_GENERIC_EXPORT_H
-
-/*
- * <asm/export.h> and <asm-generic/export.h> are deprecated.
- * Please include <linux/export.h> directly.
- */
-#include <linux/export.h>
-
-#endif
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

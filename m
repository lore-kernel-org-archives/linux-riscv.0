Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F59CC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V60OvY3oxPD0m+I/z5Mc0FCvM9gZ5rLDRKAVofx7Ke8=; b=B47E0khMeUDpZY
	evKcJbAtR6xZOP11XXqp+Go4PYo8Pc9LXH81rOIl8sGWjvbNsNf6qadEBwLYdLZj77dZd5c35yt3s
	zzuXMtRRBcAEw6DFEQzpjIZulYJ8gBl6iOOP1wJk3jdZB636LtO7H0OmO5+aQyI7eQsu3W7gBOTby
	+LXBQs8kEoEmJwhtpeJJ3GFQtvymFT3zjlq/PPeTacKKeO8mYC837lKqdlGWYUith52HgQV3UMIAl
	9lyb0y59sXIzoKBqH7NnEwysoRbXhlKJx/fGXY7hZI3e7orIVmhUlOzHq7/jVwOKxYBZxpIEKIZLS
	ibExN/4ZFHl072bT9XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwyl-00C2sx-B0; Mon, 08 Aug 2022 07:15:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwyh-00C2p5-Vg
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:15:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9E847B80DD7;
	Mon,  8 Aug 2022 07:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45698C43140;
	Mon,  8 Aug 2022 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942905;
	bh=PhULA4jDsByMhb+wbohiUiRVZy/cDd8Zyeeyl+ikEoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ij7fgoAK4RLF2jeypOvXde6SXvGiYiFhg2010qwe0MdJ9Drq0uk6JyUrUGSk0qmpo
	 lSuJlh3/uII5ljQLythYRGYHzJGx/bkutxshAqJngPETLEfN7pi9ht4TkTwlrjU9gF
	 CGhuJfdqMH3ve2+ybv38bhEYh/shj/NyvqKy5RAKg1zOFi8c/NGOKIL3pnhJ2eE2dE
	 sQBC9QyOCN2MmpycM+wVlOJbGY2VdSQWZmcMBdGbWU6FAcQRYQabrN820IvJuQgwmD
	 UUcTZa54wde3tJLkR4S1jq0R+3kLM6xY6kDrJTLO5hfp7HA65zoGFDpjrA7vn1mHVo
	 z9CiOGLJiZ5mQ==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	shorne@gmail.com,
	conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V9 15/15] csky: spinlock: Use the generic header files
Date: Mon,  8 Aug 2022 03:13:18 -0400
Message-Id: <20220808071318.3335746-16-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001508_198689_B1F9F470 
X-CRM114-Status: GOOD (  11.88  )
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

There is no difference between csky and generic, so use the generic
header.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/include/asm/Kbuild           |  2 ++
 arch/csky/include/asm/spinlock.h       | 12 ------------
 arch/csky/include/asm/spinlock_types.h |  9 ---------
 3 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 arch/csky/include/asm/spinlock.h
 delete mode 100644 arch/csky/include/asm/spinlock_types.h

diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 1117c28cb7e8..c08050fc0cce 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -7,6 +7,8 @@ generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
 generic-y += qspinlock.h
+generic-y += spinlock_types.h
+generic-y += spinlock.h
 generic-y += parport.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
deleted file mode 100644
index 83a2005341f5..000000000000
--- a/arch/csky/include/asm/spinlock.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_CSKY_SPINLOCK_H
-#define __ASM_CSKY_SPINLOCK_H
-
-#include <asm/qspinlock.h>
-#include <asm/qrwlock.h>
-
-/* See include/linux/spinlock.h */
-#define smp_mb__after_spinlock()	smp_mb()
-
-#endif /* __ASM_CSKY_SPINLOCK_H */
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm/spinlock_types.h
deleted file mode 100644
index 75bdf3af80ba..000000000000
--- a/arch/csky/include/asm/spinlock_types.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_CSKY_SPINLOCK_TYPES_H
-#define __ASM_CSKY_SPINLOCK_TYPES_H
-
-#include <asm-generic/qspinlock_types.h>
-#include <asm-generic/qrwlock_types.h>
-
-#endif /* __ASM_CSKY_SPINLOCK_TYPES_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FAEC433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 002816191A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 002816191A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIP+xowQk6qaNGJ119o/lnZyF69uMkOy3CNyX50g1sc=; b=RIHuJ31c85rstqUCdtk0TOgmln
	gmNNRBS2pW60CvYBmLIE3vFp5HjabSYyHmpHDtrzP8mxamP11yqiZDZzgZ5XzAJrGMc9Yt+wootjw
	AXUH5eTjN4dVEDX0THTX85DzfWSdTkaHUEpMfGSPuqtT/6rXfDps7VBXMRa517eQvB5HWPydmq32r
	0YZKlbib0MR3KtTQTHiZHMJ3Rk5cu3XfH76cf95p7i6tg8/EmBGWiJWwToel4FtRf1QfzG2BuqHe9
	/tXdvUoN0T4TtNkTnkpVAEnjNASKpvBLekEaVgVZR0pZFtPTITJjTQc0V3PDSnOznJeKbnNBs1PTi
	eH95IeVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQOxb-005uyK-Nf; Sun, 28 Mar 2021 06:31:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQOxY-005uwx-KR
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 06:31:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFCCB61999;
 Sun, 28 Mar 2021 06:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913099;
 bh=O2KxmIPB+fHLZecH69jIXhtq++wb564lj/icyjeUAfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RIkij08xlS8DB8+yEsaHfhkJ4frVk8aqcXZKUjc8aZRsRg14dDqPdSr8TSjbqYWar
 YZa7xXiDmepsbU0aY2OQB+g9ZqgA6O0epYM/s/Lq/CGXTTUZR/qeGjvktEkSawSenY
 6uspD6vEI92SJzbXoQjxXYH9frX6UTrSuMhM5XRheYpddQnE2p8LoyPEDQ5x0vhDc+
 aPIyENu/RTIQJgeveEE/LmORCiHcAjMknUD4XEEpdndhKUefcId80TspfCdlvafStJ
 6CIxmOlQadSXN+7398RrpGZOq23MCSKdY+hW6nlsOKJHvtdBV75Hz84ouhtYXGQH+u
 8EGq83B9rHGOg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 "David S . Miller" <davem@davemloft.net>,
 Rob Gardner <rob.gardner@oracle.com>
Subject: [PATCH v5 6/7] sparc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Sun, 28 Mar 2021 06:30:27 +0000
Message-Id: <1616913028-83376-7-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_073140_847516_C25AF779 
X-CRM114-Status: UNSURE (   7.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

We don't have native hw xchg16 instruction, so let qspinlock
generic code to deal with it.

Using the full-word atomic xchg instructions implement xchg16 has
the semantic risk for atomic operations.

This patch cancels the dependency of on qspinlock generic code on
architecture's xchg16.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David S. Miller <davem@davemloft.net>
Cc: Rob Gardner <rob.gardner@oracle.com>
---
 arch/sparc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 164a5254c91c..1079fe3f058c 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -91,6 +91,7 @@ config SPARC64
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select GENERIC_TIME_VSYSCALL
 	select ARCH_CLOCKSOURCE_DATA
 	select ARCH_HAS_PTE_SPECIAL
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

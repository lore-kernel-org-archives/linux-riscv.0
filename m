Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23DEC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 678976191A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 678976191A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLsCoe/9fRlmvClDIStokFIglyyQzcJ/Gr3WpRV0UoI=; b=Qf4h+J3ZFRIa1B44h6Gr7K7g32
	km5kEeD29NMvMN3R6C1ibOdLJyquEzNzn2nhGH+PzhlsPljedIsDwx1r51PUgI0aN6E6vEjS/E6dR
	QVw5O9dtfwP/PL0z5lIv3VK+OqqJjMoaliNeiVY11+mO8XH7ZI72S//JBryIF+LhlMEMspNkkFkfv
	+V2ffD+vGdmxPNg7KU5nxaUB4W77emXQrMEAS7Aia/y45I5r9rPa6BMpgjUVghetYRn/HflCP2nfs
	8cLhcs1Xs0XidHmBfPkB5Ve432Z9fOqTe4T02OyCybZ22rZ+uB0KE4IJbb7psOs6NhLvmjB9MXVlI
	glIBsiXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQOxe-005uze-SG; Sun, 28 Mar 2021 06:31:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQOxb-005uy0-BI
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 06:31:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4715619A0;
 Sun, 28 Mar 2021 06:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913102;
 bh=sUpQ42V7/BeYJXo8xKilrJhdJzUrsLncMVt8E/NbmTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K1i+Vgp+d0Nt/rDzju12lI4q66EYLkSy5JZ076QiXlZZAxL4Zz1kplBNEVKnDnzeL
 XUtkjJuzzqCLW32Oy7ysq/RMmkHMZuPYez5Wyxk2SMMxQoDGAf6hQweBSn8yFBqUCW
 ilcp7x5OfSZ83pAAh9tjiC72g4z2cXm2BDzOz97kdkTOZQbGOFPWZ2VNnDrQitQwTS
 PSxomOd2/RHIlHwBLl4fVNVs7Ua1PUFN+gK1ipO1IHCQiFh6FVawbp4ISyuFZ29+sQ
 ZJw6ShzgANhvydDXfVdd/XWVF3Es2P54W9xEgMHObmbb/odl0xgFm9ORAQlNoAWC4v
 O2brtoUrLFkBQ==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 7/7] xtensa: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Sun, 28 Mar 2021 06:30:28 +0000
Message-Id: <1616913028-83376-8-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_073143_607433_EA22C9BA 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 9ad6b7b82707..f19d780638f7 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -9,6 +9,7 @@ config XTENSA
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select BUILDTIME_TABLE_SORT
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

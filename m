Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A352C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A975060FF2
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A975060FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIP+xowQk6qaNGJ119o/lnZyF69uMkOy3CNyX50g1sc=; b=AqDKbGWsqrRKAzRDBgzxzj5ecs
	XMSv7KemHnUmG1HIaRubBpzoPgh7Q1RZ9iuoGtuTZ9gaAdExXEPl5Aur4MgxyiPBVBuxm1iaUGEGD
	qqjdmCt9QaRh/JvkDdGopvKzSUzFVWWpbVtHuvkTqNzyP9bsfS7gje7LknE/Ah0erMRbRfnJuGlZI
	NAbUefQAzVbrkVch4c43JKNWWQGNBdNG4CFZM8capnxwoXIpbRXaejMjmnxuKCDdDsGEJT63wxX+x
	7X9sijRxLOpgAWJIgXoMAbOHeY0D/QAiVH780cqETjLrNekTer1igkE8dVeN5uQjRW6j6AUd3PkNU
	1VqcKC5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbtl-006oZr-Pk; Wed, 31 Mar 2021 14:32:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbth-006oYQ-Ex
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:32:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 717C960FF1;
 Wed, 31 Mar 2021 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201160;
 bh=O2KxmIPB+fHLZecH69jIXhtq++wb564lj/icyjeUAfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MuD7utNvxc71QnlLEo6eyoz8UG0sDZiPBtJt3hag6/s4X/dkfRLDhQ5OqJXJFt+j6
 9qXx33FPUmx3G35TT6KpggWZk8CzgnRPRkmBuxb41XLDNB+DLsaZLfn7okWhGAP/fd
 XIcnJzsaYKQDC+07SeSrpysX9+39Fr229UOr1ud5VmRf3ZrA9MM7B1eQrw7Q9Xqnw1
 QLPvIZ3ogIZFd7LK13OYk2vgisiZmroVX6LOouaaODc0ya16hQUPWrUf3ielzPGQMu
 g+xqdXQe1Wujk2SS7zfx9ORiUOU/DX/5BKyLBaTlndIEiV02In4jpH7PAyTKRovgEx
 KBwMY3BPTvyjg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 "David S . Miller" <davem@davemloft.net>,
 Rob Gardner <rob.gardner@oracle.com>
Subject: [PATCH v6 7/9] sparc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Wed, 31 Mar 2021 14:30:38 +0000
Message-Id: <1617201040-83905-8-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_153241_722061_B3FC7048 
X-CRM114-Status: UNSURE (   7.58  )
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

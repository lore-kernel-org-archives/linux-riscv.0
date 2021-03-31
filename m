Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFC0C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56D7460FF0
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56D7460FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzHdHtrdnrPe/JC6aW1467O/wuwfU+d7y7APsnoOPoA=; b=N7fZi0GHAUQmKWyo/M5bMAMk3V
	zM62rfbqo9i+X6ybc3dbSKFKM1vC3xJbWRmH6AyOSiy5WdJvyD0m/gqAQy0MrD59K0RS4JJBCGOlc
	oC6u4iL9ShorMZVq0qejdva1beeoyf5J134uihfclYKYp9za/WNYTo66MJ5sg5JIzk6Utxwz6w6Cc
	5jHMfChReqkEStBujLRf282Oe2iEmaQ5PjBu6aarBFcb1pz1L4G7pfZ1GGKigJsCDtsTTp83ajxjk
	Rq7ZQv/u7DiMhAN/+v+ozXq+/z9Tf7ciWRXHqKcp8xOIrVv0IKVI4/eWpEemJiW1exEssMNWn8UJp
	jNx8ZKXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbtf-006oY3-HV; Wed, 31 Mar 2021 14:32:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbtb-006oWp-FL
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:32:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F357360FF2;
 Wed, 31 Mar 2021 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201154;
 bh=Bg9d2w1WAX5KFLAnbnlQNHWx+c16ctVJTJF6+EgKbfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LrjZ3mx3DLcCEGgombkpOj7HEDG+16RbX7GCxzDylhP8guFWgsFJW1a+vbFusHAdY
 94Qc8qxXh1EaoulNdS9TWbco1PP6GmCZIt2L23pL/QOBIPRyX63GfvbDQ+9NaIDf0j
 cyaxT3exYFQgKDTOgB0wOKQGlgVON8y1piXQwNdT3csJ3MSJFjc5fe9PkswGDii/sd
 eJPqX6kMGOlpOMDJKTbaueqCpyqN6Hisbv6i7VqbZryJVEehQnqSDloumLXlFCearb
 3+InC8R0ziS9cAAyzyzC3f0cJufK7mNuBaiq4wARKob/aEo8zMPVAZ5gZ+eiaTG+y6
 vnrem6tzkauzg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v6 6/9] openrisc: qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Wed, 31 Mar 2021 14:30:37 +0000
Message-Id: <1617201040-83905-7-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_153235_852729_5CC9C9AF 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: openrisc@lists.librecores.org
---
 arch/openrisc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 591acc5990dc..b299e409429f 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -33,6 +33,7 @@ config OPENRISC
 	select OR1K_PIC
 	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_USE_QUEUED_RWLOCKS
 	select OMPIC if SMP
 	select ARCH_WANT_FRAME_POINTERS
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

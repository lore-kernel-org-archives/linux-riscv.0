Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1C4C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 20:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B42A61246
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 20:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B42A61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77qAQmWiTPqIb4FVs75tya9GwSHqdi1MVF71R46MPL0=; b=UQXoBJvJQfJkCV
	ft+LluHPJIB8VOwmfTMPGExnIZdkvvPAixx4tk89C/xXav/USI58DwaJa0icms6tKKYO/ASC5UvQE
	3kU8n5LEC+GbeYwXF16WzHtOG8WleBIjq6TTcS+cEph+mzWzqH3XhUBuQ+CxkoFkVYtJA5Q+41UAU
	ZxLHLedRcfVgy/i8Q5AWSdZFaSCJ9jWekuG4FHa5KyttX/0rSyaetCslgxU/6O0l7g4bUfOgLSqSC
	UY+LqpNwEgkhZY+sG2fU1HnRKyZqpDs0kQA3ntI3ad9hD4H0NGIFBxe05GbXCF4lkDzi5NEn5w7G5
	GEqxYJCZ7wJzPB0BNp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFFf-002e1H-Jd; Tue, 15 Jun 2021 20:01:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBJR-00165F-Uk
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 15:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9ntoQwIrjjfCcaT+2ZYOuyIYJ02rDc+lC2p3NeRR4qw=; b=BqysKj6zmVBSjy+jvToS35EWS9
 lvkyG0hCmFn+Mb2tN+3vGhof7/tgIysTgw7cnbeFhYcwwvayQRcxMmCi+0ZBBCuldhCz7c936VVDV
 +elmiSaBbkIKSC52endLm14b7JxeD1oM+SAIg5x2n2T2QJRH/S7pcqSOXf7VCKg6GJv0qCnYFtAU+
 hmO/u4B1PPzEGrwfpOzsuotKKWbFxwXAYgDIBDV7wYYImP6A/lAMKITJb7kZ5jnO1ZEteP0JvI/uC
 JhBqwPpcWwDlmHd3iDV6qse5wtm534/Dc3zP5515ZUgwlips2THhBMo95WJM8HJrEIoGfiAopGDIC
 f0M+9vXw==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBJH-0081SG-IP
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 15:49:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AAAA6162D;
 Tue, 15 Jun 2021 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772145;
 bh=v1Shj5F8hMUeW+OTytwhZYkO9DtqxbdNhawBkXHVLsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d5X//9F7EIhsrUNE8dGGofy+HZbg2lfKAZh2WypH2x60l9Ag+Lix0z1FaIphbPTrA
 4kYrUwrKr6ikoUAKodAFQT+M3h6fZ06jn9nKtr/cE0uZJAXPniqUTqnVCtlDyEy6qx
 leVA5R2kp86BqyC1vFtq/llNGS7j+CczS1Q48h2IkmGM2sNCFoocxdry+T30Akqs9n
 GLpGJQ+MuLtsGMPHinB0S2yMkJZ+hRn+uFx/6qxPHL5/LWNpy/1JoSMRow3CIgYAGI
 mholXh8Udw018Y8P9HtFN0z2qkz44+iSWBDXckZE1eDZ6VZ1MbPFIGHDlo2jKYi16N
 u/T0k8DbtZC/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 32/33] riscv: code patching only works on
 !XIP_KERNEL
Date: Tue, 15 Jun 2021 11:48:23 -0400
Message-Id: <20210615154824.62044-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_164910_602536_A346E88F 
X-CRM114-Status: UNSURE (   8.12  )
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

From: Jisheng Zhang <jszhang@kernel.org>

[ Upstream commit 42e0e0b453bc6ead49c573ed512502069627546b ]

Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
KGDB can only work on !XIP_KERNEL. Add dependencies for these features
that rely on code patching.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/Kconfig | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d9522fc35ca5..4f116be9152f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -54,11 +54,11 @@ config RISCV
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_ARCH_AUDITSYSCALL
-	select HAVE_ARCH_JUMP_LABEL
-	select HAVE_ARCH_JUMP_LABEL_RELATIVE
+	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
+	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
 	select HAVE_ARCH_KASAN if MMU && 64BIT
 	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
-	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_KGDB if !XIP_KERNEL
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
 	select HAVE_ARCH_SECCOMP_FILTER
@@ -73,9 +73,9 @@ config RISCV
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
 	select HAVE_IRQ_TIME_ACCOUNTING
-	select HAVE_KPROBES
-	select HAVE_KPROBES_ON_FTRACE
-	select HAVE_KRETPROBES
+	select HAVE_KPROBES if !XIP_KERNEL
+	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
+	select HAVE_KRETPROBES if !XIP_KERNEL
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
@@ -227,11 +227,11 @@ config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
-	select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
+	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
-	select HAVE_FTRACE_MCOUNT_RECORD
+	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select SWIOTLB if MMU
 
 endchoice
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

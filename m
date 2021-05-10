Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E222AC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 16:34:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3194561155
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3194561155
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gsMNHgwL3iACSu6SzF8G6MHJ/AZzfPCjl5kwfjvUSsQ=; b=DULiXIrnHsTIug9pBOppUODx62
	uXL54XHarKnAWQQBTCrSmRW32i5eX5D5c1U5PAtpR3HyjQHaBm9XddmxpaZgn9HApcANYQhPFd3xE
	SlJF/3973t+fWUAKfjWJrZ53SYNM7euPCIeoLC7+QLIWzsxeXRK8w6k8ELQ4y7FJJWVdD1lc3hrvO
	al2/IRQZv/X6m0pkkNo9eg16Aof/j/285GE6Z3s+TT2T+0ZevVAXY+I9TMPnTsKPyM8rBVSGRCxhE
	Egt3ErDGbl0smFWCiOKApXz4Jiz9hGk5jX7vc730gs0lA4Ff9Kcoa3XaHOlq74BuLgpO4YhdKWRee
	QOMBhiNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg8rX-00Ez2D-FR; Mon, 10 May 2021 16:34:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg8rN-00EyxC-9y
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 16:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=W35ihF1HmZl897viGKIMEuGvRdzLmwITgJf6gYzR6Qk=; b=X5vSOTxBxfoVHkXhJk4ne/jojP
 3NYWUMQaFzleFgSZQKbtJacAhuwUWNcdwEwHbhH4K547IFjbcvhBqKmDM4sW0decEiQKtEC8BffNz
 DTPILVUoQ02xnOmOakdMUXQEtVzl+rICizEuWxJHumIxlsrkxzfpOC7rshL8hP9DJ+moNWiLcBeY9
 6dD4dl+Oho+hAJ1TnzPmOFOnb307XyHNvteO/KZQ2SoS7o+juITpmEznhd7XjOVtJrLQZ6QDAP7G9
 a/UtCqeREO0BCdmU8m1oL3R/0XrKziDVHGb7JNMZSwbeB6GroACxc1OI6/bk7bk/vMa5WPlZK8zXI
 yoyT/b8g==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lg8rG-008vOt-Dp
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 16:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=W35ihF1HmZl897viGKIMEuGvRdzLmwITgJf6gYzR6Qk=; b=A6ydf6k2ZxXA/
 mhQldeR0HM+RIIPx8DQvwK54AQtg1yXKodWvvMZiWX2uzr01Kho5FEwymDUAA0J7
 5QvYXln7O4CfBK6gizFz1CtSat17QuWbpmx44omLyuKA947iQdB5icXbGc9m/fPp
 CYDDw0NRtQEGnf1Emi+EYIc7jpXjJk=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDHzpp5YJlgEbi3AA--.7137S2; 
 Tue, 11 May 2021 00:34:02 +0800 (CST)
Date: Tue, 11 May 2021 00:28:38 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: code patching only works on !XIP_KERNEL
Message-ID: <20210511002838.7b3cb1e7@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDHzpp5YJlgEbi3AA--.7137S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3GF4xZw45JF4DJrW5ZFb_yoW5Jr1Dpr
 naya47XFZrXr4ruw4YkFy8Ww45ZFZ7XFWfJryrGa48ArW0yrWqyr1j9r1UG34UXr93Ww1f
 WFyrG34UCr4qywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
 6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_093415_166411_C5933BF6 
X-CRM114-Status: UNSURE (   8.36  )
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

Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
KGDB can only work on !XIP_KERNEL. Add dependencies for these features
that rely on code patching.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Hi,

Currently, the RISCV_ERRATA_ALTERNATIVE also only works on !XIP_KERNEL
but from the maillist it seem there's effort to make the co-exist, so
I drop RISCV_ERRATA_ALTERNATIVE dependency on !XIP_KERNEL.

Thanks

 arch/riscv/Kconfig | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..61320b94ef97 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -60,11 +60,11 @@ config RISCV
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
@@ -79,9 +79,9 @@ config RISCV
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
@@ -230,11 +230,11 @@ config ARCH_RV64I
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
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

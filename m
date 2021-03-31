Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432CDC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:33:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D960260FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D960260FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bNm6wk3NzGmZfIJw6sANyXbTLu6oq9tdO1k1afkTCQ=; b=Bst5ARv2/cE1Mesf/PvBvKzAdu
	93oMxD6LqhKp4nQpeqKUeV9Qm/nfUF1iRiXb4ASenOfSuakOUxke0mXiuZW/oVGuRw8J3TRD1E72S
	Ms/+dxeG9jCheXMOZlGbK9eHOhEl7fGkJXgKpTgX5CZmUa3J/+0RivB30wjJS7cF1W64gYO2ogUZj
	Sc6I822oWAc/0+VvnwOHOrYeAmHbjRGfQePWHIqkH4YuaBDCZu+seEnCnJUgUPKFzYX8ctVKHeIsJ
	QG2I4ISWBmwA7r7ee4gCj5RxI7Sy5/BF/EAHrmlBz0mHHBdUE7G4ND7yyefb+mas+i4zfJOXpTCtU
	B9rW2bRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbu1-006of5-At; Wed, 31 Mar 2021 14:33:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbtx-006oe6-RU
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:32:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 012EC60FF1;
 Wed, 31 Mar 2021 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201176;
 bh=Ot/5PmXwS11uulWq3qWA2topEHV4IQyVTJcB7EIJEto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4mj3Ucq0o81O2XyVG3hmXxx3WMjl1D+IiWQy6y3glymXCyXz7HvUH0Y/fnYr9f1h
 1wUUw0fx8O0SKe53NjW/bj/Ou5QXwaPc1g1UvmKUHfz4nwx525LvJmbfcYf5RgZhWk
 XZR9y8fM+4DYoaAJXNL2jgLdlXBwoOnIc/jSJ3r/9sKttJ2VVol/puJBKAjtvOtqgj
 YTwPsq2+RWCppmBEqhKeWazUtN2PGYkR30QcO8bTOPCiOzxjHuAOCNJtEBr/pnFukQ
 2743V9mO+HynrrCRbhsuAOsY5f1+RMF3zawK3FR7K+l/QgZF57ChVKoxlykrytyZNk
 r7q5BWtdFi1iw==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH v6 9/9] powerpc/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Wed, 31 Mar 2021 14:30:40 +0000
Message-Id: <1617201040-83905-10-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_153258_150913_590B3B99 
X-CRM114-Status: UNSURE (   7.76  )
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

Also no need when PPC_LBARX_LWARX is enabled, see the link below.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20201107032328.2454582-1-npiggin@gmail.com/
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..6133ad51690e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -151,6 +151,7 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32	if PPC_QUEUED_SPINLOCKS && !PPC_LBARX_LWARX
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

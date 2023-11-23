Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6F4C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XLrg/llSZEseQf/vUkfEpCwpvin5eeCPDGIXuRMD+wo=; b=xVHbsvbrMwZys2
	sVG8F4qntqk/jK3aEbMDoo+QxX1sa/GPzk4IR0iAQaDjYY+MIKfsmwW15JJAzpBYnp0x2B1ENL/nO
	Jvz5MmBZ93DmWzC8WYRnxOgFNZBhMMvjfKyMEU/8eFipAAMmGeFljBoOjqYRqPBNvLEZcdxRmg8iv
	LB7v3c2WMuJ3tiinl9UpEMVhzvguJIFYkrQpkBtdsjf92rCBFUzquYaCn8+aaVcBtaxE1QfIKSGGT
	3It0wGUPyyXYSInWI6rxHs2leKQd+hN86oN0V7UEOpCOxZ/L77VYKqst+psTGEUKDdXyEy3HrAaRa
	I0e82yKJ9ym40BZLvOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69yM-004vGi-2U;
	Thu, 23 Nov 2023 13:42:26 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r69yJ-004vEb-3B
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 13:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qzDYok5oSedbjSII7O6os148H5o+A9vUBxaMvgxecfA=; b=CuVKMau+FTzX3AXW7KCMXVUHKl
	YfKdpXuCb+4yuztswtlvNNd4yGvdqdnpnYylqNaJZGbKpaPZ+0BtOwrhXJh8kcM61FfUHLTY9Oni6
	Q6F/4ZyQmNU8doDndFglcqLH65C9bSR0EygiFoCSFEuYIHloCCZxqBzmdrp5c/OkF+ZenUpqnPxFG
	ONbLeHkmcFv65XvgL+5kQ3hDGotw80XIPIiLhwRfrTEy0NlMr08wsXIG3SXRYBzjuGm8mRKLoDpTE
	vNHCZw0kEOjACXHwOeaU7iUChT9EOReye7CAqlSMHrym+IllVu7PtQNkc3H86XjmvLi+3OGJ4CprX
	rIpJGVDg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r69yC-004SaQ-3J; Thu, 23 Nov 2023 13:42:17 +0000
Received: from ben by rainbowdash with local (Exim 4.97)
	(envelope-from <ben@rainbowdash>)
	id 1r69yC-00000000LEO-1fTp;
	Thu, 23 Nov 2023 13:42:16 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: declare overflow_stack as exported from traps.c
Date: Thu, 23 Nov 2023 13:42:14 +0000
Message-Id: <20231123134214.81481-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_054224_106273_12120197 
X-CRM114-Status: GOOD (  10.25  )
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

The percpu area overflow_stacks is exported from arch/riscv/kernel/traps.c
for use in the entry code, but is not declared anywhere. Add the relevant
declaration to arch/riscv/include/asm/stacktrace.h to silence the following
sparse warning:

arch/riscv/kernel/traps.c:395:1: warning: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?

We don't add the stackinfo_get_overflow() call as for some of the other
architectures as this doesn't seem to be used yet, so just silence the
warning.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/stacktrace.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index f7e8ef2418b9..b1495a7e06ce 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -21,4 +21,9 @@ static inline bool on_thread_stack(void)
 	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
 }
 
+
+#ifdef CONFIG_VMAP_STACK
+DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
+#endif /* CONFIG_VMAP_STACK */
+
 #endif /* _ASM_RISCV_STACKTRACE_H */
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

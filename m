Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86D0C433EB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75283207BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5CVQTQT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J8rLfCX1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75283207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8hSnghA2kJ/4Opg4GlfnZ2jbKvl4O5koXCA42H7IOQU=; b=f5CVQTQTRVYlXDBLbPMTpaTdh
	NMG/98oVtXYQL1uuP4puU/C1zIV1dSqPkaTsc8F3vV25jFc1EXeodkZNiUWEXyFBsStwfO5BWzVcr
	vTViPu15icPLMTSe1D8aheDOT0+ekgIEQmwcR7bEzEZnLbV1qOfGoBzCHqij9Dj1uX40EanLaUuo5
	23ZTgb9z3VO3hhO0wlKSgxu0lkO6nilD3f1FUCCD/U7F/+mF6SWCbdZqWZnayR/QpbAP/SkO2NFR/
	I1HBGYrLveZfLOWt4gbCBCCbUDkSJVEKjcLreenyBKirOWINQL1CC0nG3i3vGCqus/qBefKEcZnp0
	pi1VJ02zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttWg-00043r-KH; Fri, 10 Jul 2020 13:57:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWe-00042a-I7
 for linux-riscv@merlin.infradead.org; Fri, 10 Jul 2020 13:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aA679qIodiBpC5vbULiwbVKx3fOumlOYyYuEKhecoTI=; b=J8rLfCX1rWf4qIqs7Fehj0+jKo
 yFGyNk3e2uoFfcZNf1M3QeOGq9VbqUAG1y/PYra5V0SIxrUWAwCu3uW+BJaS/Pwv3/8olCOUwaISR
 IzGHg2ZiC44cAjsnSoeRLVXSMLQl5JmaLOP3499goZFgz41YKHPUQeT39S+sSuaRHO3bsRu1NLGXG
 uSojzqVKeQZM3R7LwQUsgnW8GLAnNu7ji/KAnFGWmGbnav9Xt6xkmih3kL2vhPbPf2/nPbbdeIrJF
 K+1WaWDgCw8lmWG0M+4MbXaq2f53/gz7dYZ+z068PuxxTULd6ySpB8UbVjA8oK+jDsYm3hDSvxzZz
 IcdeQBCQ==;
Received: from [2001:4bb8:188:5f50:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWd-0004hr-1S; Fri, 10 Jul 2020 13:57:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 6/6] exec: use force_uaccess_begin during exec and exit
Date: Fri, 10 Jul 2020 15:57:06 +0200
Message-Id: <20200710135706.537715-7-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710135706.537715-1-hch@lst.de>
References: <20200710135706.537715-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Both exec and exit want to ensure that the uaccess routines actually do
access user pointers.  Use the newly added force_uaccess_begin helper
instead of an open coded set_fs for that to prepare for kernel builds
where set_fs() does not exist.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/exec.c     | 7 ++++++-
 kernel/exit.c | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index e6e8a9a7032784..769af470b69124 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1380,7 +1380,12 @@ int begin_new_exec(struct linux_binprm * bprm)
 	if (retval)
 		goto out_unlock;
 
-	set_fs(USER_DS);
+	/*
+	 * Ensure that the uaccess routines can actually operate on userspace
+	 * pointers:
+	 */
+	force_uaccess_begin();
+
 	me->flags &= ~(PF_RANDOMIZE | PF_FORKNOEXEC | PF_KTHREAD |
 					PF_NOFREEZE | PF_NO_SETAFFINITY);
 	flush_thread();
diff --git a/kernel/exit.c b/kernel/exit.c
index 727150f2810338..17d486a20f0dc6 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -731,7 +731,7 @@ void __noreturn do_exit(long code)
 	 * mm_release()->clear_child_tid() from writing to a user-controlled
 	 * kernel address.
 	 */
-	set_fs(USER_DS);
+	force_uaccess_begin();
 
 	if (unlikely(in_atomic())) {
 		pr_info("note: %s[%d] exited with preempt_count %d\n",
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

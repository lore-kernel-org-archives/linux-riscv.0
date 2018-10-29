Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7146FC2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 10:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B482082D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 10:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byjZHrBc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvav30om"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B482082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1mgQtuYaLqrK9OAmHHb+tb135fFiEc28M4feDnSjGqM=; b=byjZHrBcA9E1YSJvsOiaq8XAbI
	xGn6XK7IY3LU+5P9+lx0PQB7CWlTamzO5RqmtAbU53kBy2YLHxjoQAwpiKKn+vc7M7EjLJNjGGtKH
	AoiiLeMjG6pbXfpEfJH33rg9MhqqZZoc6OHyUddCrHherDBnY22BCFViiPh29q+z96kAqdCgH0DeV
	NIlWJZKMWIXIvfbVAmQB7D9ICO8b5zi5WQ2+A4JYdAhc3VsqdrJaaREuClVjQYa57I4mBeYYsQFxA
	dnGk++a34gpghU0OcObDlYWVD4UDpCHo3tLqUwkNZEJtD1FfIDpanlRd2kmPwdHNtXcr+eOZ/ubGZ
	gAvMDNSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gH592-0006OP-QM; Mon, 29 Oct 2018 10:51:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH570-000462-U5
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 10:51:35 +0000
Received: by mail-wm1-x343.google.com with SMTP id q12-v6so4721135wmq.0
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aEWLaDb2yI+1DNd4jxamdSPIdF92GrY7Gw+p21fiuIo=;
 b=Wvav30omjGWoxCfcBTlkQcns3YJnsWigIDibAKGKPuOchPfuYZctMSh/Gni90RgKv8
 zlWy8msSsr/o/xxOLjWNECYki6/kTrTsEjyCzTyv0PmxAG4v9wRcxO0swdJKxJpJw8mF
 mJRLgz1IG3vStpp73BWaBzlnIIGM/7DIStxZe9MobrdLvyRJfP0s6OxEaAghy+1wdp/3
 BkjHik7oVvvBg1yeTSl/gA5sTr8YsZYdyTv836aCovRGiKgqnmPL6ZLX7aqoXERupdls
 1OcgZG7dvv1jkECCjVOx+b1Eq5B+vz1N01KIaFhyt0P//YYkxZ+7k+SvL9yaNjKZ5Efz
 K6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aEWLaDb2yI+1DNd4jxamdSPIdF92GrY7Gw+p21fiuIo=;
 b=h6TjzxYf8TvtcyJ7grORvyNixArmuRcLmt1Tvf/x38HcH0Kg6D5gJyvU/9N7FrHa98
 mvK7D172G00MjEeo5BIwT2VVkhXlbd4ERrbQb/3m6gU5w/jFQWnyjDxvj66NKZAdDG7T
 tNFT9dt/0rTrR7EtWjkxw7b9/4ghsw5YslOb1PclaN0zAP3QxhpJpQfdP6wY3u9XaDdP
 LO+f30ZihpuIjuby1lusSIj/yNc33XcKuVvsIdA0L/bgGqEJmZD7vybeH/ZKj++6FkrD
 Zi50mEKoY9muwSKwB8Lhv5L/JyuYBuzBl8qqchJMmnvonVJSyZOWIqvAdbZ6XRQJ0rdA
 PKrw==
X-Gm-Message-State: AGRZ1gLqUtpIfjYf5Qu/jEAXW6srzyaXS02rjMsgt9LVysJnDsFsMyIH
 Zc7FP5P9sxZlrhy7ziQB3Xo=
X-Google-Smtp-Source: AJdET5dlWfPKGtpRUn8eutl97HqLkVnCWSWGK5D8iDGXIy72o5VQWKhyTJoX6qByOSaWCNyQPec9eQ==
X-Received: by 2002:a1c:9e93:: with SMTP id
 h141-v6mr14369759wme.56.1540810163070; 
 Mon, 29 Oct 2018 03:49:23 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id l70-v6sm36360609wma.0.2018.10.29.03.49.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Oct 2018 03:49:22 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Subject: [PATCH 2/2] riscv: audit: add audit hook in
 do_syscall_trace_enter/exit()
Date: Mon, 29 Oct 2018 11:48:54 +0100
Message-Id: <20181029104854.17432-3-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_034935_019322_A7B72EFD 
X-CRM114-Status: GOOD (  10.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029104854.s2Fbqwu53QQHhN20KEvRCPCx9P8GepvfniWIBIH5hn4@z>

This patch adds auditing functions on entry to and exit from every system
call invocation.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..85b0c93f00c6 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -18,6 +18,7 @@
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
+#include <linux/audit.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 #include <linux/regset.h>
@@ -111,10 +112,14 @@ void do_syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, syscall_get_nr(current, regs));
 #endif
+
+	audit_syscall_entry(regs->a7, regs->a0, regs->a1, regs->a2, regs->a3);
 }
 
 void do_syscall_trace_exit(struct pt_regs *regs)
 {
+	audit_syscall_exit(regs);
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, 0);
 
-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

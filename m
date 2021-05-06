Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8BCC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:11:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128A460232
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128A460232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q0flNJBybp8Rq5berwUJobjM+Zp5wC/xoySeVu+IOCg=; b=fnN3iY0by2PhFTlnnE0aH9+wPB
	kTPzFWhGOOAjFLZV03gf+LEJXWBTbnZmPLhX2PJBBIuNd4RwJlAQe1/xrA/dugfMm134PLcionrpW
	diF827z9AvHbHLt0WMt810F3uUJUhsuyHmp0L/kSK9SdppJfO44ehDXD0zKnaR/Wg5CUSN2HIfVc7
	1HpVSIvZdWUI6nTbfLv0B335t9ChdGQn5oQq9hv3AuiFHkrAsS8fLGAgruR/NGeQb87Xu/ypIiTYx
	krE57Ra747ndzi9nVoNyjk7AzLcVhIHoW40ct+Ar1cdorwkBaIg06AEso78YHOFpYupbSrMejFwoU
	ZAhpYHSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYAg-003Ron-Br; Thu, 06 May 2021 07:11:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYAc-003Rny-BD
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 07:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=RKE6jjXcJ0imsPN/Jcdv9I0BKrwvTPJLbt84HGfjOKU=; b=rFhqa1SQOsY/zCk/xoARGrLwKT
 lG9d3aLpalseMVnnGTMwiSBgVjEgk9WjFGata0JfvSv+TAs/1dkf8/FIso3lxa8Hk6vvqNd/OSOgf
 AUvziRQA+n4U8CIQO7qkzo6Cs810ZgxLrnO1sowXDXN+Fpa8BrZmt+cGLGCD6ooNf9SD9PmpwyNIc
 jxD0P6fK04rd5j7KBabN5ZrHAy9bPc2gYBcMQnCt2d+69RJxWyH7bI3ejRJrZHbYFwnHehYRg5vSP
 sEew+4HFYwac9num7Jqrl8dgXke1L+dQsDv2igulehb5I4+zjAPs4kubytALt1oAZaxQMai2keqU8
 O9WugUgg==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYAZ-005emZ-E6
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 07:11:37 +0000
Received: by mail-pf1-x42e.google.com with SMTP id i13so4573593pfu.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=RKE6jjXcJ0imsPN/Jcdv9I0BKrwvTPJLbt84HGfjOKU=;
 b=cVTBP3osPNsPjzgzQh1Ow7dy1X6bO3T0NsqwfkgRAygGaaHQr2D4cisPBz/HvaHfOn
 9ohX/ECpyU7rjhfKpMZ3u8EegIPDv+ywdGt5MTNdY7ZMJGVsNQPMCy76d7lnRIjCdiKQ
 SCdpV1ZhdIisiF1Did7to27dEP/PP+zAvRM07D7XuugW1ULhs5Gj7ceIbywrclcoDh3n
 /BgGeBa99rolzayb1B7Oj/jNM/YiLg8MUKv/fPKT8FrCkb63yrnfGxauau2u4LRxfuAV
 jeQwMv9il3ACnu+eduoy8uFHcGPlQd4qN/cPIpUPoHtJNCB88WJDIqaoKaKBJqO+Z2y9
 pcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=RKE6jjXcJ0imsPN/Jcdv9I0BKrwvTPJLbt84HGfjOKU=;
 b=ophPGC5JNrD97eCdQjY2Me7W5gNdy1UBNpYBj5Y/cTJ2PXpldHcXhxFphgO7cLJaSW
 1JWgsrZv5N50WQBaV4oFc16E4aGhw4PQ8Jobj7YgjpCFtqgQaT+B80e1euojJ2HffW7o
 ZgHI/mwb4rrrEPmLsAo+5PgAZUCLfs2U+2fSWHlJuOztLCE5n3KdaErUfwmV4jy+NUPw
 32ZNsW29BFgah5aWftXxafboa2J6GNqlSoFukv+fgqTjeIG3V7wNUfZlrHaynQjCU9/Y
 wJE2JAjqfQGRayuJalI+uhvolbMDK9Ntfo1rSO30iD6O8SN1opDNnTUWjgIDsvxPnHKF
 qOUw==
X-Gm-Message-State: AOAM532xcqNbd46TcqT4lVHZecUtlvwukaHC5wazyDadZztVnCsKAc5m
 x7vtBN6VSxnSdspPq5XCXIc15A==
X-Google-Smtp-Source: ABdhPJxhhfP8Rl5Euect2HwVRpdR8zXlp7FMlVmo2xpLE+q5oMhxVN/MdhVs+fCOwAtp/P09lJULHA==
X-Received: by 2002:a05:6a00:ad6:b029:28c:c28d:d3c5 with SMTP id
 c22-20020a056a000ad6b029028cc28dd3c5mr3280987pfl.54.1620285092455; 
 Thu, 06 May 2021 00:11:32 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h22sm1234313pfn.55.2021.05.06.00.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 00:11:31 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't check text_mutex during stop_machine
Date: Thu,  6 May 2021 00:10:41 -0700
Message-Id: <20210506071041.417854-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Cc: rostedt@goodmis.org, mingo@redhat.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 zong.li@sifive.com, 
 guoren@linux.alibaba.com, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Changbin Du <changbin.du@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_001135_537948_CDB26383 
X-CRM114-Status: GOOD (  23.64  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

We're currently using stop_machine() to update ftrace, which means that
the thread that takes text_mutex during ftrace_prepare() may not be the
same as the thread that eventually patches the code.  This isn't
actually a race because the lock is still held (preventing any other
concurrent accesses) and there is only one thread running during
stop_machine(), but it does trigger a lockdep failure.

This patch just elides the lockdep check during stop_machine.

Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Reported-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
In theory we should be able to avoid using stop_machine() with some
clever code sequences, but that's too big of a change to be considered a
fix.  I also can't find the text I thought was in the ISA manual about
the allowed behaviors for concurrent modification of the instruction
stream, so I might have just mis-remembered that.
---
 arch/riscv/include/asm/ftrace.h |  4 ++++
 arch/riscv/kernel/ftrace.c      | 15 +++++++++++++++
 arch/riscv/kernel/patch.c       | 10 +++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..ee8f07b4dbee 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -85,4 +85,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 
 #endif
 
+#ifndef __ASSEMBLY__
+extern int riscv_ftrace_in_stop_machine;
+#endif
+
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 7f1e5203de88..da2405652f1d 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -11,6 +11,8 @@
 #include <asm/cacheflush.h>
 #include <asm/patch.h>
 
+int riscv_ftrace_in_stop_machine;
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
@@ -232,3 +234,16 @@ int ftrace_disable_ftrace_graph_caller(void)
 }
 #endif /* CONFIG_DYNAMIC_FTRACE */
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
+void arch_ftrace_update_code(int command)
+{
+	/*
+	 * The code sequences we use for ftrace can't be patched while the
+	 * kernel is running, so we need to use stop_machine() to modify them
+	 * for now.  This doesn't play nice with text_mutex, we use this flag
+	 * to elide the check.
+	 */
+	riscv_ftrace_in_stop_machine = true;
+	ftrace_run_stop_machine(command);
+	riscv_ftrace_in_stop_machine = false;
+}
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..7983dba477f0 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -11,6 +11,7 @@
 #include <asm/kprobes.h>
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
+#include <asm/ftrace.h>
 #include <asm/patch.h>
 
 struct patch_insn {
@@ -59,8 +60,15 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	 * Before reaching here, it was expected to lock the text_mutex
 	 * already, so we don't need to give another lock here and could
 	 * ensure that it was safe between each cores.
+	 *
+	 * We're currently using stop_machine() for ftrace, and while that
+	 * ensures text_mutex is held before installing the mappings it does
+	 * not ensure text_mutex is held by the calling thread.  That's safe
+	 * but triggers a lockdep failure, so just elide it for that specific
+	 * case.
 	 */
-	lockdep_assert_held(&text_mutex);
+	if (!riscv_ftrace_in_stop_machine)
+		lockdep_assert_held(&text_mutex);
 
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);
-- 
2.31.1.527.g47e6f16901-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

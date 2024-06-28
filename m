Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E34AC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynAkufzp4qMmu5aEHo+SIifao+Uxh4HqC45FXUEg6FA=; b=rfEQro5KOZ6nuw
	zEpb8RzYweVhE23X/+HNV9l/UL+f3DbP6tc/TRYmADXW7PgUN7htKiriFZ5pIW6Pb4wJC7EzIr5Oq
	I9qyjnfrMJgHqr/gvJw1R50BiThFbQm1+xpsC25ltl87lz8ZmeTCtYARqqGqdqeX/Gv61MdSErJvr
	8qCOtEbaN7P2wvEOFfe9AT834Si3k9YThitphy9jNnQJKyhASvRJxGNiXa/i2oj8bkgtSZDLfdwdq
	MFVbw5xk1VnshFx1uOQaGMx88f88XVXFgcryhZYi7pXQeTovhWIvEovVvYuQUM2GjOVRuTlGa2L3b
	/URDD8Qy1Xved5PNXFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5i-0000000Da3P-3GHW;
	Fri, 28 Jun 2024 11:48:34 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5f-0000000Da04-1WBv
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:48:32 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-25cb3f1765bso284759fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575310; x=1720180110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB3HAqDltbljiMzJTGZiW2YiCbH7zPagQDm7C4z8cfY=;
        b=D2OGoGHCXl0/jReL7lq5ACosonRhvAUcqmdJl2NlS/hWOcTfJ9cddGagrb859W9p/a
         e9S8jko++j5tFdrF8HGtu0Lb7QCPLoJNPxEilCt8pv9ADv/1bV5jXVb2LQ/zQx2tFApG
         ZI7H9DAtKv/Pr+mPX4ayI0fTKQmcGHw/HpeQIHH36PK+0TvEhTiGijAkJg6N8tRXh8Ho
         htS6kBgRYY9PwnjnmAzCH3O75YGL+murfbTG2jUPh3OHHtslRiY3wTp6b6lm3Cdg01UB
         LwveEGsnXn6Ff4pi1KeblTPIb4qPXz0Cd5jv871L08X6Nr7msFCkxBbQPhgvZtZe9KoH
         s6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575310; x=1720180110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB3HAqDltbljiMzJTGZiW2YiCbH7zPagQDm7C4z8cfY=;
        b=GSIb4eqRLhI1ymqs7YWC0iHzZPIWxNbT0ujDkH0phm8IN2el1qRhuwnPCWLoBHDuVd
         sYFmGUWsx+bPgrxAFCxMDs4xNdFYDyGv5jsJAoyGxaKYa8OpRYQDpu7gXtkHfY/IYg7k
         ww8qmRvk5VGJRjN08lCa075tOi4yAlUuPdzAD5A3hEoYQMIjom+Ei2KLYzPM9AWOeySF
         NYtCJkE4h9k9S9TSd/Eq42KtFHJ4ew1sQgQeZnPTPayOMkGK/jtjgvKHwKusr9mlIgLs
         EnFE4hn62JRo4dmpkZc64IReVzJ81hYW6Ryb1/545ybkZpCkmrWMiCs4Z3XVKUaO/ZNL
         K4Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXKBU72SSOwLTmibctvC/g8eO0qHKmd7oxIh+dE+xXffVRxg9qxFCCTuoyTo2dZZGkUL9HEQlN8QCQFzAXD4f6MS0Z2ctd8b/z0oJoszp5X
X-Gm-Message-State: AOJu0Yx8sMLinUih43crcIFAU71Slywx2mMuxLE0DcXu8N/CyPhqWIdn
	Ur7VJZ5moY3GjT6wOYEPxIDFOq3B9wNwF4ZEjSQTIpbQgCH+31xD7Q4EdwTsx/w=
X-Google-Smtp-Source: AGHT+IGkb+sc7AJyAjkV7J32sa3aBUKfOklckBlPnZN/quYaW53HpZw38PiUs6Fyq7Dt9/iYzdP+/g==
X-Received: by 2002:a05:6870:9110:b0:254:a57e:1aed with SMTP id 586e51a60fabf-25d06cd083dmr17067065fac.26.1719575310299;
        Fri, 28 Jun 2024 04:48:30 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:30 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:47:47 +0800
Subject: [PATCH v2 4/6] riscv: ftrace: do not use stop_machine to update
 code
MIME-Version: 1.0
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-4-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_044831_498782_0343AB55 
X-CRM114-Status: GOOD (  13.62  )
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

Now it is safe to remove dependency from stop_machine() for us to patch
code in ftrace.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/ftrace.c | 53 ++++------------------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 5ebe412280ef..57a6558e212e 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -13,23 +13,13 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
+void arch_ftrace_update_code(int command)
 {
 	mutex_lock(&text_mutex);
-
-	/*
-	 * The code sequences we use for ftrace can't be patched while the
-	 * kernel is running, so we need to use stop_machine() to modify them
-	 * for now.  This doesn't play nice with text_mutex, we use this flag
-	 * to elide the check.
-	 */
-	riscv_patch_in_stop_machine = true;
-}
-
-void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
-{
-	riscv_patch_in_stop_machine = false;
+	command |= FTRACE_MAY_SLEEP;
+	ftrace_modify_all_code(command);
 	mutex_unlock(&text_mutex);
+	flush_icache_all();
 }
 
 static int ftrace_check_current_call(unsigned long hook_pos,
@@ -155,41 +145,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return __ftrace_modify_call_site(&ftrace_call_dest, func, true);
 }
 
-struct ftrace_modify_param {
-	int command;
-	atomic_t cpu_count;
-};
-
-static int __ftrace_modify_code(void *data)
-{
-	struct ftrace_modify_param *param = data;
-
-	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
-		ftrace_modify_all_code(param->command);
-		/*
-		 * Make sure the patching store is effective *before* we
-		 * increment the counter which releases all waiting CPUs
-		 * by using the release variant of atomic increment. The
-		 * release pairs with the call to local_flush_icache_all()
-		 * on the waiting CPU.
-		 */
-		atomic_inc_return_release(&param->cpu_count);
-	} else {
-		while (atomic_read(&param->cpu_count) <= num_online_cpus())
-			cpu_relax();
-
-		local_flush_icache_all();
-	}
-
-	return 0;
-}
-
-void arch_ftrace_update_code(int command)
-{
-	struct ftrace_modify_param param = { command, ATOMIC_INIT(0) };
-
-	stop_machine(__ftrace_modify_code, &param, cpu_online_mask);
-}
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

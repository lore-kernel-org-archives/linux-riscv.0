Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48EAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 02:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KGL/bzVY6uDxvrRKTXF68p91Adbet29Z7u29XRh8lns=; b=uZOtQwZ6toIs7/
	+kWRJmkXQT9tAAbP74vitQuIjUiv/ZDxTn5gpO97Ha010lmXx110PjuwJw/0S+ZqFcesAgoEmX9UO
	xBEBVbFWwj2VPoZt4xU2rT1mAx8dxHWWDBUTiBW6ylmSaco8thBEEtsqbFzm92eYN0ymC8+ITd5rJ
	N+oar2Yh+6rmBkInmZjKhgABKPj580jJRlX6s3xhrp18M7SgyKa89YXItJL/f8F8tA8c9u+jxV7k4
	eY47eMxRP3lGezC49TwIQTUbjEbpY2Xag6qna3ZXT4+Jxo+92RUP0qqCNMohIowX9klxbPQ7IpQZU
	L2A/5VuRM+omxWxH4Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWURQ-009kQ5-Sb; Tue, 22 Mar 2022 02:40:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWURN-009kOo-2z
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 02:40:11 +0000
Received: by mail-pg1-x52c.google.com with SMTP id c2so11635434pga.10
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 19:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=kbDNC7nwvfxYUv1EhLiPssj97St0I3K9gZTYcVJqPsU=;
 b=7KoGB1p/MFxA65A/e014UrzGVxM4M69YHYXwQNGOF7LAH6X+Lwbw6ayXRxuO0NBEKQ
 vLbIT7WLlrov+KxZ4afuppj3/cjqfqcF2gWKfCUMKQGzn0iTvwbhHbMAR9DGUQcgSXIp
 X92rooJ6q474av6j5dmRvm1KZVCtEko80yidm7jKmNuCaNezOiTqEw9qIeHd6C2at9yC
 ayfuigPqJD4CmcMGxBBR2v36eJJj6PrSWiZspGWQ5bmOUuHPthFirftTM+EVCA7HdzWM
 ligJjynIaI3bUbZmIji5CJg9UPkVAEDVBCDrl660O0gQH+PbaY4IM/Ru/WSn/OUJGzs5
 QUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=kbDNC7nwvfxYUv1EhLiPssj97St0I3K9gZTYcVJqPsU=;
 b=j7bBY/OUhyNdKFliW4XSCwJD533z/3x5MzYMWFBWmgvOZxGwzwIKoCME2FLrwBVS8d
 IHf1aoxnMwol1PMlWaynouivuy4t4v1VDX/rhQ0hz+KYtY0G+oC7oq+N7V7Zr6wOuKGY
 +teJBvU9KO7ks89mg+KlOGiN9smVZSWIthzfZTbv51i7mKYJcN9973he9zMB6gAYb8mB
 xcj3Fb26X8jg25zGEQtCr/+I+bT3g4U+yd37r8lkZ2Podh2KeXMMUk48Ene/vt7uKTr6
 nPBr2soBQn6vUCtMamBjOZtKzTqpa9Ae8DuNcd2rSsP3hsuJY/T/WD0MlAOCHypUBfCz
 Ki4A==
X-Gm-Message-State: AOAM533VjG7C+A7tHZ/ADZR+qw4qvZC+TRdQPCoTKTJR8+uC1Lt+CJlh
 MZqkkirR9N+DJueMSGqGD+MHgA==
X-Google-Smtp-Source: ABdhPJzqwad5fmG7gwHxbfCNhJJ8lJiKisxYu8q/ryzgwj+t/lNjQu+liFBKnPSpYvLOFRgfCwwPXw==
X-Received: by 2002:a05:6a00:ad0:b0:4e1:2d96:2ab0 with SMTP id
 c16-20020a056a000ad000b004e12d962ab0mr27068856pfl.3.1647916807757; 
 Mon, 21 Mar 2022 19:40:07 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 lj7-20020a17090b344700b001c7032eba5fsm724045pjb.4.2022.03.21.19.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 19:40:07 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't check text_mutex during stop_machine
Date: Mon, 21 Mar 2022 19:23:31 -0700
Message-Id: <20220322022331.32136-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: mingo@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, changbin.du@gmail.com, rostedt@goodmis.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_194009_240163_981D13AC 
X-CRM114-Status: GOOD (  23.73  )
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
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

--

Changes since v1 [<20210506071041.417854-1-palmer@dabbelt.com>]:
* Use ftrace_arch_ocde_modify_{prepare,post_process}() to set the flag.
  I remember having a reason I wanted the function when I wrote the v1,
  but it's been almost a year and I forget what that was -- maybe I was
  just crazy, the patch was sent at midnight.
* Fix DYNAMIC_FTRACE=n builds.
---
 arch/riscv/include/asm/ftrace.h |  7 +++++++
 arch/riscv/kernel/ftrace.c      | 12 ++++++++++++
 arch/riscv/kernel/patch.c       | 10 +++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..3ac7609f4ee9 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -81,8 +81,15 @@ do {									\
 struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop
+extern int riscv_ftrace_in_stop_machine;
 #endif
 
+#else /* CONFIG_DYNAMIC_FTRACE */
+
+#ifndef __ASSEMBLY__
+#define riscv_ftrace_in_stop_machine 0
 #endif
 
+#endif /* CONFIG_DYNAMIC_FTRACE */
+
 #endif /* _ASM_RISCV_FTRACE_H */
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4716f4cdc038..c5f77922d7ea 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -11,15 +11,27 @@
 #include <asm/cacheflush.h>
 #include <asm/patch.h>
 
+int riscv_ftrace_in_stop_machine;
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
+
+	/*
+	 * The code sequences we use for ftrace can't be patched while the
+	 * kernel is running, so we need to use stop_machine() to modify them
+	 * for now.  This doesn't play nice with text_mutex, we use this flag
+	 * to elide the check.
+	 */
+	riscv_ftrace_in_stop_machine = true;
+
 	return 0;
 }
 
 int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
 {
+	riscv_ftrace_in_stop_machine = false;
 	mutex_unlock(&text_mutex);
 	return 0;
 }
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

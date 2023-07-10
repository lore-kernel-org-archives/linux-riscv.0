Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79661EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uGDkYLx+UPcjIW+1MJa8xCn4BqEHR9n6fZYZWt4fm+A=; b=rttQ4KcGbsVReLjC7rUs7ykeoU
	dWimHUwwiYQp8z/s1qPzD9p6Q54f0T+30kW93w1USTjlVDxb1D3kL1bN+yY+oaot8s1/RViKZ3QE0
	H1jfPRDGC7TL1b4w3LrhzrPNvMVUyakIpYNkD/QkGxgaGdHOgY+HMap1+ujZ1pZNknTpbFf/4KlXD
	SxtOzRZPo+mgWz+G7HUnYrkBVf/UxwLtM6/FD+cE/AdlgSg1fnbQOg5er6g0I4vaRxdnH9FR3SiIk
	3KMtqeqQRZYwTFHfDUIJa1hjKCfI8YrDj1eGaeZU12QugESu8cwp8Rd8fX3LiGofou2qqy5tIxgD+
	yT4VNoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjq-00CTFd-0O;
	Mon, 10 Jul 2023 18:35:58 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjm-00CTDF-0q
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 18:35:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-262d69faef9so6087125a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014151; x=1691606151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lmw3qam11jRSo1H1z3ye084M7cKP++evQKCp2c6VGA=;
        b=mBak734wMFR6S9+GtbGpTrkghWF+xr1fRhSK0yzJKLx0aVQpIh/dJA08JpJj0Dspmv
         +KbhrJ1C2ctjEr/1mPfjOLMv2MbYo0us/2F7/8vx2tcXngA5q7eTaZ67JcQRTRYHOu5h
         8muHVf2PQjWeu46I51Zsb1knY7eaQnEy4NmF1rWIF9TEchAsuxDYzeXnnAtTHL23VWH+
         oxJSCthj46MWSMAttTVrGpHOMejythMECwFTW988R748Ji6HIYOI2Dtt6GQ+aEaySBSr
         YdYX6GRMU7PTiffp1+4F4pOPCeWqwdawHz7JdI8gfFK8pVDdHxB4qkSizIV8TETm576h
         gD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014151; x=1691606151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lmw3qam11jRSo1H1z3ye084M7cKP++evQKCp2c6VGA=;
        b=Ujtl9xatcMZTqU2T0617gXkI8Nvsh2PqYE6V1Hzwc7wyaKV45bBHo1UhHhwudQBVL4
         VWiBKHInk73h9FlOR9ls1WQuyiKz0citbbF341Y9/m/ruJd2sbHjWPmfIn4cdgcvrei1
         Jig8asdP3QFuRhx+5cDXnjwY077ywvqQJfoZX5Z9NgXYfN/9Pz0ePqcDO+TxdDkhCXrV
         20cD2uPaNpZoI3KRovdWIeHVbPCNEj/CTmfSkTHXz39B+rHtJ1BzZc2VfYTDawwt0lG9
         iMh+F80bgltHF0l/VZuJRhQH5enJYkcfQN6kcgwe0gYcEWctvjTZGVCpoR17szU7GZUZ
         ierw==
X-Gm-Message-State: ABy/qLZn0mlEO73arPFvSeNSTyIqT1d7BXcsVv5Z+TqxS8q8fYsowZLk
	+FhORpwp9G+MAhefbo5xvXykC5K2FTgg63kFtSA=
X-Google-Smtp-Source: APBJJlFU00+7gY7YBrESlPEsWXN0HjjU8yiIxkSBDPukNPRNwI/iq87FZheK3yIXtLj3iPKAZwQFHXwHjUoK9+pnV18=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:d511:b0:263:4d9e:64f1 with
 SMTP id t17-20020a17090ad51100b002634d9e64f1mr11001626pju.0.1689014151573;
 Mon, 10 Jul 2023 11:35:51 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:47 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996; i=samitolvanen@google.com;
 h=from:subject; bh=q4ijnPW2Mn1tvBetsRvgpl+qoFykStv8yW3UK+1fGGg=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+ABPMDmB0fh0LjTs3/VHFrPcBar3PHMmw3b
 h6Q9A6DPKuJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgAAKCRBMtfaEi7xW
 7jgpC/9553yUfoqA9C4FRMa2OFuUbOCPwbvDRNsX7Y9zDAkutsoIgeg23FWNH3zegBmF5hA7+uW
 gmc4wt+WIt8lObecQrM8afOor4zIgp36iPBEyXWKQWiV6rzZqTev31yXsHzaeOxi/S0pUVykNZ2
 BVisTBwjLdMO2wO0WJRMCtoQheGw7NreTHf6ke1uYaqM71zvVaIijKaJL82bOoZGYc9tuUSeBnw
 i7Ve2L/W+lCEs0THbayq+7Z+wGOQ3f8YyU5VedjHsi1v0wki1Q0ekFH5I/BhQDq65ae4cHHfBQZ
 8faWYq/uAteKnSDn52Y5KqaH9pnHBKpFpYAUSI4Y1m1s1JQlpKwyIWsL+v9Lv5VqnVibdLXvZRD
 baULUYdoNKvc0fUPv746yPn/Ty1RsLoyaulv1PWezPFQ2WvsaAlhmAHtxKrC4tm19h8ptxDztlL MUIMlLVQLmpTSJZH9C4VsYCQuhJhmC6eljPY8UdNAn8rs0Lsd0Bzo6uRDWaYza3fi9HwQ=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-10-samitolvanen@google.com>
Subject: [PATCH v2 2/6] riscv: Add types to indirectly called assembly functions
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_113554_298793_D5F15FAD 
X-CRM114-Status: UNSURE (   9.85  )
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

With CONFIG_CFI_CLANG, assembly functions indirectly called
from C code must be annotated with type identifiers to pass CFI
checking. Use the SYM_TYPED_START macro to add types to the
relevant functions.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S        | 5 +++--
 arch/riscv/kernel/suspend_entry.S | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 8a6e5a9e842a..6c9469050f4c 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -3,6 +3,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/unistd.h>
@@ -47,13 +48,13 @@
 	addi	sp, sp, 4*SZREG
 	.endm
 
-ENTRY(ftrace_stub)
+SYM_TYPED_FUNC_START(ftrace_stub)
 #ifdef CONFIG_DYNAMIC_FTRACE
        .global MCOUNT_NAME
        .set    MCOUNT_NAME, ftrace_stub
 #endif
 	ret
-ENDPROC(ftrace_stub)
+SYM_FUNC_END(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index 12b52afe09a4..f7960c7c5f9e 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -5,6 +5,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
@@ -58,7 +59,7 @@ ENTRY(__cpu_suspend_enter)
 	ret
 END(__cpu_suspend_enter)
 
-ENTRY(__cpu_resume_enter)
+SYM_TYPED_FUNC_START(__cpu_resume_enter)
 	/* Load the global pointer */
 	.option push
 	.option norelax
@@ -94,4 +95,4 @@ ENTRY(__cpu_resume_enter)
 
 	/* Return to C code */
 	ret
-END(__cpu_resume_enter)
+SYM_FUNC_END(__cpu_resume_enter)
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

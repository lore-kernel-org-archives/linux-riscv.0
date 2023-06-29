Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EE5EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=m6tiwM+Gxd6KWdEbdMkcigAJzh8pFHI3G37SDer3/oU=; b=wGrU5TJt5P086a/7CARRm47eIO
	XAe1HVHDz3rjlnraGmhMDGQiXyeqD2Dp1Gw+b+kyFo/HSPhGxjw41xY44LrS88MN1pyGgBL08tyFJ
	lT95/KI5Z8/bpqG0HmMT5KhJP/47NictxqP/SUFnuCJ9JNPB4jSHrP3gHdbPrjhHTBZJQtvf46vrO
	uN2pNpTFfActpUV4LH2R0N4AVIakW0y9icxOfCe0fUBphRIkgcg10WMI4In2Ypzt0GSI6n8UXxGdl
	g+5npgzdUnYziIf5ms/cY93V6uSJmNQdfMHrHM/sBcvDB1PoP3oSXkfidjFdj3Vky2+rFqNQXRJ4V
	7EJE1Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Hz-002Tyk-2g;
	Thu, 29 Jun 2023 23:43:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Ht-002Tv1-30
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:43:00 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-56ff81be091so11102947b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082173; x=1690674173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwKLI/qRUKPULIlBC3OTUhb6lfrxfVtcL7RWgMXp+DM=;
        b=xZ4gzYmgSDP58mOKR8hM46Nd3CktXTb7BWdOsL40ZpOowsFja8hHx4hEpRu7h+8XXt
         MXlo89FDD72TAUb0aNZwUN9hsD5krX9N6BIDIdgNZjO2+Q9hqoPmMO0wHRAE3CanaHoU
         CADHRRVIOfgsXUI7G64inFFIC6roC6nRP9g9q4FoTqTZt29i4bySfE6PCOpQKuDFFD+S
         qmiO+EA4gU+2Idsy+Qnduwt2kaRDhqdZTG4p59yUdS5hMXfpchMb7zXP+BfLtVyISxVO
         bziwFW/aif6c2MFD81O0+6TPzmJ57qD6QsqQF1V8sU5pSP48L18NjLafTtvf7VZj/Uf6
         mi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082173; x=1690674173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwKLI/qRUKPULIlBC3OTUhb6lfrxfVtcL7RWgMXp+DM=;
        b=bXVRyV/23OTggekKyuaNmTh4qIlzxyjMw/q9Zr7SXhllLj8yNNc+DC7rYTZ0W56GIB
         OgMpNcGKgx89W8AXv/n3VtseoGC73EQ4jnvrnSUpdGzyRNsb5115Co56wlZruB2/GkJx
         FgGBgNFU6n/x3cCvWbgfhLw6AgjseDWlufdqwXSLWbwW1kYhdbtY8BN1o01IKxhCAk0f
         Gzq4uZW2/d9FDUA7kDh6nsFre8OAVMhycjkwHtoEuDFM8JEL5F0kuN3HgEtWdsZCO9C+
         Y/g9/VQsyDjufs89wsKwO5wtpHAyO53MQIk4KS+INxZrXPLXPpDG+CbV62VLD6MZSyFj
         t1tA==
X-Gm-Message-State: ABy/qLZEAnX8Y2SakeYw+NbUlIgO+VPPQhgplkmdABRzJDJq8ngRg4MX
	aDsbFd9P84aiNF4Tprd6NhHu2vGh3uHQlrLc8rA=
X-Google-Smtp-Source: APBJJlGvY9o8TdVQA2iFVhCCB50GqC+vEYRFxxtjURS+zUxZ3uCTPfePcPm+HJkTvW8UT4zvI1DCpmZcRMm1arw/G+E=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:7e0a:0:b0:56f:f62b:7a11 with SMTP
 id o10-20020a817e0a000000b0056ff62b7a11mr6436ywn.8.1688082173423; Thu, 29 Jun
 2023 16:42:53 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:47 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=samitolvanen@google.com;
 h=from:subject; bh=Gkp1NJ2f7yYUqQXHMI7a2x2tGYxFA1ILvi7IEKTnass=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb1WHJAgo4Uq6U6j6NflafXu9jZGHzv6JSKG
 I68vAHUjwOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7ra7DACnV4oH9Zp+lDg83B8KilPxMfwy2imQEk7g4tL0+joJ7XhULu9MfK90xn7TM7i4gtaSYlw
 WWtBPr32oT+mqBypw6Zzzh3TjqvFxGw6L4NBPrew6Zv8Q2DnCsPP3MdTja4RKLIR9eYZz/6MKhY
 KoJ1U2HlLEczeZs9jBPFvTUBeodHLyEcItxzzSMGaK8gSj0HUgan9Y0jDi1r2wlPF9qgKtm/5lF
 e3pkg/Uv3sTKtwhfqNeCqnkBuo3UwEAuXmUP2BKHh1RVZRRHkXsYPbi6hckTUsHIsz/Ei36AaKy
 dYHxMndLyrFMOV55dL9x2qlhOYEwmNjRDotAMG/b0sT09z4txrkykyuszG4sHikOQg5drQ6Qt5K
 Fjw/DqnV9FeYOjowphHAm21MgWwnxwBUALJrWe92r5LVU+EqWAZEFtROnZlRkcsTrt3D8P6ozhM kSPl2dnVwxy5LCbyOS8SfKJPZbyg7P3geJcOGAJ3DcZ0TRSuOpXbTvdhgxFYPSa++A5FQ=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-10-samitolvanen@google.com>
Subject: [PATCH 2/6] riscv: Add types to indirectly called assembly functions
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_164257_966214_E5BC52C8 
X-CRM114-Status: UNSURE (   9.78  )
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

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S        | 5 +++--
 arch/riscv/kernel/suspend_entry.S | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 30102aadc4d7..712c1d2c2723 100644
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

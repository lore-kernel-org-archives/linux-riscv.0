Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A199C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 23:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E3760ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 23:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14E3760ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wwja34S6eyqciFUR4QXeFBygffxOXaYt4HO9AETTq3Q=; b=4w1HpIz3wIXK3IyHul0mbMkHHd
	K4CaRviL5kZkVRAUNtyb2ZLBIbNZa1AFh2NVQqtUDx29oirdliONSEiyvkTMUALMXs2AtB0nHma/2
	WJG35DCM0TJHc4bKWqO1/psAGBeZhARcjjCGHMHJCJcY7GrBLZnIfcP7MJIyzh847yLP+Mf/Zw2Um
	bUAavA87XxNAsQGZE0clVQsbkhtnOm2M+aF5CxBioiIwwxb1v6BUHxHEVFRI5QVnqXr0UooBiqlNB
	acpbGuwNmWkiLP8bzgTP8GNp8c5uAhXgQIwPdtD0e9mlkeHKeqerxvsPybgQy01df/s5kyMiYKm1z
	TCMMc1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOq8p-00E0Jf-Bp; Fri, 10 Sep 2021 23:41:07 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOq8m-00E0Ik-SU
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 23:41:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 d93-20020a25a366000000b0059fff274d9aso4611619ybi.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YcybJ36BhVQqnQ/Zp3BgBUwuPlp4Dytcf9sCPFcMjQI=;
 b=YgJpLsayXI0kRA30Qyay/Kq/6VBc852ZzPTDo9EzTjJTNtF9D0UVBAUgqY/mnDPOl+
 pGTUFD61EqoICDCAXs//AXw0PdPDQ06DEbrW0h4xmAfxhA1egiPkgqeuA7aKa8DqjerJ
 PkrJtScmhKJbvHhlEWfI0lnnSj1rsD/G/nSp5hmtW+wkXtRhBg9B1Pr1u9QjmvKsjABP
 4t5hd33qwRgzZ8nO7gWCYz+rmQJH3tPDL9uozMFUhmmG0u0lAtZvjl2tiHD4Tt+my1V7
 m0LFoef1gwGQFGCuSx+R+cF4s5MbzwcLeEGELfhig5F8S/YsXDwM6cw+dQEFKnbIgIYN
 tP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YcybJ36BhVQqnQ/Zp3BgBUwuPlp4Dytcf9sCPFcMjQI=;
 b=7HFHCEBN0OwW+yVvREcoPOw5t29bKsrX2gnk37FotCGC3fmCHfEp0Dwmw5kRwWfg0K
 7xM36p2rPlvQFLxw77pRwWvF2JuH7Z9/hYYlG0Gzwf9vZoNeeMmBrsmiqZRfuAuXH/v7
 CkouDt9sfeAdA7AgIF4QtkWKkt0M95cTdw18wk3VzjZ7qNW3zptDWbSti58meraViGBD
 gE1TRxV0YI727X60cjCVOsrtdiHsSA0RgPpFssGXcVIrTZx0mFi28UouuCytLF70yCAb
 03Wz+qpVbesBvNpOpcmLMp+UmKgAsp47XB2IB/Lpp28qgPCn8YfgMi60/KlM/nbnMdI7
 FUsQ==
X-Gm-Message-State: AOAM532dwp9Texib2JZca9SZRujUnjjAw6AV9nLZI2vTY/ZLi/LOdQAt
 gO4Z0MbeAoxoefLXTwTtvFsIOGcf6hncjkAF+0E=
X-Google-Smtp-Source: ABdhPJw0Jp3nHTv3ruhAHm4RkeseXcb8gI25D2fzseDBVW5d8S8nqZvDZTYEl37UNWxcGpM+JEUlWwmPxuiXFe7eVe0=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a25:2302:: with SMTP id
 j2mr315979ybj.507.1631317263067; Fri, 10 Sep 2021 16:41:03 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:42 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-6-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@kernel.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_164104_968609_3AE3C50C 
X-CRM114-Status: GOOD (  11.68  )
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

The minimum supported version of GCC is now 5.1. The check wasn't
correct as written anyways since GCC_VERSION is 0 when CC=clang.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c79955655fa4..5fc1d0cc82e1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -235,7 +235,7 @@ config ARCH_RV32I
 config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
-- 
2.33.0.309.g3052b89438-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

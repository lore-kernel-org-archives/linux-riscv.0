Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E06C2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 08:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493FA205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 08:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F2D4UL5C";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JRJeJlPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 493FA205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1q1dIc4oOXMLuGJhmG405YIgkstM/KJ0hlFL0aEcs0=; b=F2D4UL5C+tPZUc
	mYAM4q/JOjPB7d2m8V8sos+GzMkK/Y3UFh8ee3b3xsfVeJcTopEIRKJ1k7pekfonINMTmBik2OlTS
	rUUFdeR+ndcOYy8W2hqgLrZSeLyJlElJLs/NWMVqr4DBYrZaNCEzOCQSzuqbfBnJCCOLba1o09b7w
	NoWX+dYYmlpWOgRPYh5yEjoIHbru1cOmsbb/jplWPkObewHEFBOZqvvNS0n/YbRZKEjNCSfpnasux
	TXTa4GJZhvr+hsUIt1HczZn8gZtlBrbrUDXDjYoErqLRyMVQuG9dwUoixEw2Jurn8bbT+xW5ZuqJL
	pIqCmo5HGTfLZugxixGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQo6v-0008LK-Ma; Tue, 21 Apr 2020 08:18:29 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQo61-0007Vk-Kg
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 08:17:35 +0000
Received: by mail-pj1-x1042.google.com with SMTP id t40so1051753pjb.3
 for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2020 01:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x1q1dIc4oOXMLuGJhmG405YIgkstM/KJ0hlFL0aEcs0=;
 b=JRJeJlPbvECowqMMqAqWbzZ8nqW0b1fVx207l4nQs0G9+u8AyrE8inMOe8Uu+Z6mGj
 oEOZzr8Klh+dWRbsfgOaINRJsKMd/aRX3NBYE5XqzRJkaxfMatym5xIbV3ooZL9jnaaM
 +HNfMZHP/TNdCf+PfqN1VPRK3J4JEGjE/ewraiaQV5Hg6+Ddm8v+G1yXlEhe/L1wUJsC
 baY1iJBav4DXjyhX63v9oHhvFi0vhSpYSODaovIkLUeCbp0OKzfU1xWU0XnbBOC1jzjx
 sc81wyIHXiBh5pXITuvhWZg3AI1x327mOGasYIohrkBPXI/7uBC/YKfXZ3fW0DizX8rC
 IIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1q1dIc4oOXMLuGJhmG405YIgkstM/KJ0hlFL0aEcs0=;
 b=neyhz+QzThAv5nFCwPuGwceZEA+icKIKaZKY6FKw/fOBGpTwfobAZPdxFTiodGrj9u
 5rx8erXqOWOX2OahVzBFcLU9udnIeY5RtLzkag0KVohP8RY4thFiY72EQndecq4y5Xt/
 VJG8RzbYTHn2wctacM7P0E21InIYznYRpiQiX3P2ei8fZDF+QXSxMCL84OeMi0V4irvC
 rXtpYnYoSzS8HHX5/skIAdWo3KNNnpmZfBQCCOlRKTqxSIj5KRmbUfuKSbrijqFSycQR
 jwTAFOTPibqurXiW7q9ZrwwniY3ZBTP11nXvc5huPEKPd2B2y0W2HuisDm63r55BxjR7
 uCsQ==
X-Gm-Message-State: AGi0Pub745s2atzopHOtfRdJQijr8Hs/qbl3g66/iQsj3ZWX6W4HnoW2
 y6InzjF6N6YVPb+cw8Dsc8SWbQ==
X-Google-Smtp-Source: APiQypJ6TDv1BUeEjsdzkZkCUKbnTrPG7TD+P1kqLfxoAk/M5KRTxIjpkFX2KILsnIQRT2ae8Ou8Jw==
X-Received: by 2002:a17:90a:1da6:: with SMTP id
 v35mr4465596pjv.44.1587457051158; 
 Tue, 21 Apr 2020 01:17:31 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v9sm1610067pju.3.2020.04.21.01.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:17:30 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] riscv: support DEBUG_WX
Date: Tue, 21 Apr 2020 16:17:13 +0800
Message-Id: <282e266311bced080bc6f7c255b92f87c1eb65d6.1587455584.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1587455584.git.zong.li@sifive.com>
References: <cover.1587455584.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_011733_714544_BB287BBA 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Support DEBUG_WX to check whether there are mapping with write and
execute permission at the same time.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/include/asm/ptdump.h | 6 ++++++
 arch/riscv/mm/init.c            | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62f7bfeb709e..612bf0a258d0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -68,6 +68,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
+	select ARCH_HAS_DEBUG_WX
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
index e29af7191909..eb2a1cc5f22c 100644
--- a/arch/riscv/include/asm/ptdump.h
+++ b/arch/riscv/include/asm/ptdump.h
@@ -8,4 +8,10 @@
 
 void ptdump_check_wx(void);
 
+#ifdef CONFIG_DEBUG_WX
+#define debug_checkwx() ptdump_check_wx()
+#else
+#define debug_checkwx() do { } while (0)
+#endif
+
 #endif /* _ASM_RISCV_PTDUMP_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b55be44ff9bd..86606e4d1860 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -19,6 +19,7 @@
 #include <asm/sections.h>
 #include <asm/pgtable.h>
 #include <asm/io.h>
+#include <asm/ptdump.h>
 
 #include "../kernel/head.h"
 
@@ -529,6 +530,8 @@ void mark_rodata_ro(void)
 	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
+
+	debug_checkwx();
 }
 #endif
 
-- 
2.26.1



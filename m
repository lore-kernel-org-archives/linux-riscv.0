Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45332C64ED9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCekC5W8ro30qmFL0CPB+eik0ktlQd9LuFFQGD9zjdY=; b=UwVMebFiAe9Hgm
	EDKxOUmzVoZ01INIVRKhfXKReEZhD2lB07urgLZ++9drxf99xrCspImrXmZiVz+OQ2rxRMPnldhGC
	WX+o+8kTm4cesvgjWY68hPd6vThz0xE58Q1rMXIRZ98m+eKiG+IAfsM8Kn3zeia/6UA34NlJFj2+U
	pk+OKlUshd3D56Luv2qeK6seskIY/plm5uWjNbcujKUWnOBcRQFwGEJpyts+8dKRHNRT1b7bJVrdY
	nx4w7YAs6JcK8TvTOttZt34dgkQaJdr0muXztmJhZi19cOytgz0qO4ffeWuGhG+zMDtv8wa4UTX0/
	KVt/N+5oQl9xS82NVDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoN-009Rnz-9u; Tue, 21 Feb 2023 18:56:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoB-009RiK-Jr
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 18:56:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ec43so20727000edb.8
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 10:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Si0+gWiKrBP+C5qJqQaRILLJowE0wEFCNh+SC8OAZs0=;
        b=nPikY4FCjr7Pr/quul448p1vzi2y0DWKk+EQmOgjKFcdH9Pz1sniVqIO0We1k8cXge
         JJ1KCpFyJh7j8KVS6lzXYMmntDUGblR/jvyWkCmD62Pi9XHTbuwOs4McxedTUlToqtTh
         czf6pVbC3IJpjtB055rS27ZsMLLAg2paeUkAtxtlQl3sKY7ZIoNcgniZDkzrVmkNZJUw
         LfJ/ciB5qj4PCSMdGHldzsZDFbssGUR/OBFdF8zKdDi7lTtKpqoU4HSP/KMQGxAPccFP
         lIv0VapNSWy9rbnk2JOq+wPeozzNScq9zh2tt/NGDIjb9zkea92ddhR4fNLY2S6dFwT8
         JmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Si0+gWiKrBP+C5qJqQaRILLJowE0wEFCNh+SC8OAZs0=;
        b=W9z5R+vVjSkalcc2FY061xpsQbHF18rae6pklPbhD952i/30QLU60ofPHky0zlAfM+
         vbD/wpe9kSEAZO41fKC9JzAy76moZAT1MoEii0ILq1avyEUFrv1mYKGiZybcgLXiRmvH
         bIGVFcZGCammHGMW39jd3PQBZe8pxeh3Snipeq8tFlimncv3UFF+AMifOaeznomk2xMw
         AOw1tHR0GfdzH1iSom0hIkdGhH2FEmz5mQe+VE187bL4CT9a6DaR7jl6YyYq9efJcA5n
         mqTV4QMjG9w32W3S+aTq8Me8Kgzv6XOsIYFIO2LGcfUGnGtX9EcppcvIyrUOaCaLirbm
         4yxw==
X-Gm-Message-State: AO0yUKWGbw2MTKRpyNRhjl//SSbuTyLBFfOY2qa1AF35fcYhwjo3pi8H
	vcpx7InRPXNOccAhDy5pEoD2GcTXGYmmA5Z6
X-Google-Smtp-Source: AK7set9ulcwD9OtvPKck3hQREtg2ZSvI5DFz5/sv13hW01ELyWMeOVr23w0e8jXOwFpNkelYSp6vww==
X-Received: by 2002:a05:6402:20c:b0:4ab:1d33:69ba with SMTP id t12-20020a056402020c00b004ab1d3369bamr4980720edv.16.1677005771072;
        Tue, 21 Feb 2023 10:56:11 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b42-20020a509f2d000000b004ad72045ed9sm2395167edf.65.2023.02.21.10.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:56:10 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 4/5] riscv: lib: Include hwcap.h directly
Date: Tue, 21 Feb 2023 19:56:02 +0100
Message-Id: <20230221185603.570882-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221185603.570882-1-ajones@ventanamicro.com>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105611_677135_549BB40E 
X-CRM114-Status: UNSURE (   9.00  )
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

When using alternatives for cpufeatures we should include hwcap.h
directly, rather than through errata_list.h. Opportunistically drop
an unused include too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/lib/strcmp.S  | 3 +--
 arch/riscv/lib/strlen.S  | 3 +--
 arch/riscv/lib/strncmp.S | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 986ab23fe787..4f9b80dfb5db 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -2,9 +2,8 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm-generic/export.h>
 #include <asm/alternative-macros.h>
-#include <asm/errata_list.h>
+#include <asm/hwcap.h>
 
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 8345ceeee3f6..ed78449f2e05 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -2,9 +2,8 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm-generic/export.h>
 #include <asm/alternative-macros.h>
-#include <asm/errata_list.h>
+#include <asm/hwcap.h>
 
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index ee49595075be..e4e97d9b4e4e 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -2,9 +2,8 @@
 
 #include <linux/linkage.h>
 #include <asm/asm.h>
-#include <asm-generic/export.h>
 #include <asm/alternative-macros.h>
-#include <asm/errata_list.h>
+#include <asm/hwcap.h>
 
 /* int strncmp(const char *cs, const char *ct, size_t count) */
 SYM_FUNC_START(strncmp)
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

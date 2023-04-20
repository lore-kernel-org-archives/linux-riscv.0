Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E20C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F25lXPqP5gZIQPuePUiXnLb3lAyM1SQ6C4LyR4LBsNs=; b=d1nc70LctD8nc+
	y6V+Yfcl0io/6z57VxKdPJt3Nv7rIpkr+cGok/P7tdxXPkNLyLwOauE3XXqJB6oKvLGTUjICdPZ8j
	ptJ2XWCS3KN2atYpeVot+lj/WVewP5+OVdaqQkpa+V/2CL7tPjYc0QncxxADnvQe+fvs/p2LXeFQl
	o1B3+hj9wXD+DhIevjA9gNCJ+TSW02P79d4KfGJMlqJJjD7y6k2O4j6cLCGX+OsrQzpW4DHreyORT
	JP9MHHEVyQzu7wCgbymtwCSUXOYY3zJmi+P7LTCPOjwR8fWAwSJvDf5tRsIvIJGddu39uGqFP8qiJ
	dt7FJIhZNLUuRsKM8xSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppZ3M-008jgd-1z;
	Thu, 20 Apr 2023 18:30:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppZ3J-008jgC-38
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 18:30:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E117364856;
	Thu, 20 Apr 2023 18:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD81DC433D2;
	Thu, 20 Apr 2023 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682015440;
	bh=HO4Zl8j62lMdr5HPcHD4MUspdzCrF3HR0sO76PtJlis=;
	h=From:To:Cc:Subject:Date:From;
	b=HqFucfiB+V+/k0m6GN9TSu/c8P+RTooSLbS80r7mgtUD9tri7Lu7BF5WW8QOCvOmC
	 TYzU+JIML6FHQmeHQ5WPu1cU9k1lUBLguDc5xeW7XHxHfav5wpS/p7DkZrW1yjTkrV
	 LWY3IsFhQZDtP1RyDwvrbnFUbCCkvf7ipG38V5x6gjAXciJIwOreU0kNWgrbcduNkw
	 q9vyCkU8wi5XCXpYhNPLtPWXolxhF2SfRjv0xJsyvY01C+3Z3VQgDFBu/5kCH1J2Lz
	 /QKdtivyX1i8ADL0dm0ivG0v6jiq6qWGDUwHEAZ2RxGQnLIqP0Y3C54hSyGc9iRFyE
	 UPTD7ighzpBZQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v1] RISC-V: include cpufeature.h in cpufeature.c
Date: Thu, 20 Apr 2023 19:30:16 +0100
Message-Id: <20230420-wound-gizzard-2b2b589d9bea@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Bh0Xzm3DmDh1pSFXOkDywHZt14tDUNFaKMKI/7tIwGo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmOLYvX/T5ubll7suX7r1WW5s0ekZMy/sk6T/zsumPa8 p2m/y5FdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiHFsZ/pds735W3CfnkHMi gG+K0L3QSczqjpbitibmGux7s4vPf2RkuGBvejhXNke8U7hIcKbbzqpP1921et5ONc+1uvfnybw 8PgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_113042_073806_FD87E765 
X-CRM114-Status: GOOD (  10.87  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Automation complains:
warning: symbol '__pcpu_scope_misaligned_access_speed' was not declared. Should it be static?

cpufeature.c doesn't actually include the header of the same name, as it
had not previously used anything from it.
The per-cpu variable is declared there, so include it to silence the
complaints.

Fixes: 62a31d6e38bd ("RISC-V: hwprobe: Support probing of misaligned access performance")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Evan Green <evan@rivosinc.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 52585e088873..00f9f57a8566 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/hwcap.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

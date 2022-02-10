Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B821C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KQpP3gKlfDToA1u1abr6rJ40cNoxwKWFPbFN9lMLYRo=; b=N/lSa8EeLRArFm
	yH7yiN+JVTRqH7zbbyhGSScLJOu1vV5969L9+a1BVTQ9gHscc6he1AQXbjAVtEshOuegglG/QHgnw
	7NBp/ds4aJLPgtYLF5ILsJDXHL9xy6AllTRZFZT/SaHLqxtzGzCYW/COuqiKNtbot5g1MMHXCIIql
	iMikawbmsJ1b18oUFLEBGia0Q8MGPIvb8RVyakcW2eXcOHcbLU8brMiodbO+G87ZoOV8G1VvA9W3p
	cRNMoYl/iPMhNZgwwGitV3PjfnN8BXKeZfv+X5deQTD8KqS2BVxBjzKo1QizoSw/4e68fvz050yiS
	XHS6WfrOdi1BSFpHJYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIClB-004SBu-MS; Thu, 10 Feb 2022 16:57:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nICl8-004SAm-O2
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 16:57:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 464F6B80B16;
 Thu, 10 Feb 2022 16:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789DCC004E1;
 Thu, 10 Feb 2022 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644512247;
 bh=Fd0kc4ClVmsdMt5I8xjQsCXxmNuCaOh6XmyTDmrK5h0=;
 h=From:To:Cc:Subject:Date:From;
 b=SyLqH1XjRQ7awad+24hAAOTFKLqfbentRah/JnB0Ok0YK5PmNIaTGfxrdzOzaR00M
 m90mNtfFt4zARiN61pnP3Q49IZY/zqUc1K7vAYRDewUu099zbl9WeLg3np1cWrC0nA
 iPOdnqWLDdR708b2NjS6SO9KK0Q5ydFpOm8YGY5uwKsDvnbrmBKSTzgaRQlmhPvoV+
 WK7VRUxpH41D+J79rAiAL6FGGrqg9uCo1veorAHl07KjN14lY4yWwmDYX/bIaIcgv+
 S/clH3658HV3eYiuuE4ZmL1o5qQ4fdymZL8cSBFmBo35pGOyRr+5W5XwTfML4aoDDC
 oobKMxK8fmdsA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] riscv: alternative only works on !XIP_KERNEL
Date: Fri, 11 Feb 2022 00:49:43 +0800
Message-Id: <20220210164943.2646-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_085730_950854_1B934455 
X-CRM114-Status: GOOD (  12.04  )
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

The alternative mechanism needs runtime code patching, it can't work
on XIP_KERNEL. And the errata workarounds are implemented via the
alternative mechanism. So add !XIP_KERNEL dependency for alternative
and erratas.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig.erratas | 1 +
 arch/riscv/Kconfig.socs    | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index b44d6ecdb46e..0aacd7052585 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -2,6 +2,7 @@ menu "CPU errata selection"
 
 config RISCV_ERRATA_ALTERNATIVE
 	bool "RISC-V alternative scheme"
+	depends on !XIP_KERNEL
 	default y
 	help
 	  This Kconfig allows the kernel to automatically patch the
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6ec44a22278a..c112ab2a9052 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -14,8 +14,8 @@ config SOC_SIFIVE
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
-	select RISCV_ERRATA_ALTERNATIVE
-	select ERRATA_SIFIVE
+	select RISCV_ERRATA_ALTERNATIVE if !XIP_KERNEL
+	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
 	  This enables support for SiFive SoC platform hardware.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

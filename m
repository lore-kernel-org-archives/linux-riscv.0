Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE283C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 08:46:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54AFC6141E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 08:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54AFC6141E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cfAvsLlm/SQU0Y4ZXOIHhi11iMKw5+7K2GsO1uLz0wk=; b=oTJAfj2UiczwSj
	y4pmUu14g4An0rstNAW3S8I86rEc1LGvvsjWbmYz2NSIhbJEHK4hN9XGIB0gABTF7qJtYy9RP2LmL
	5kJ/jk5RB6Sa8/YIVOqExHXg6uzS7Kg8lZNWrPq817q5z69/rQx+3GFAm3wBW3madUBKN7jgXxLLP
	QfyyDT0CwFDz9Jq8rulg++h4dmWgW90VwEmGWbrK5WIADxj259wIAGzIFdu5QYz5AVRlWR2ggxpC3
	NUS9ZXcuarypGMwQVqvxzbhqoKnUoVOwbNbaNX30sPgzTjoF90b473+f9tZ4WGrCWnbZ1kXWeulVv
	vwZQXUvK2k9lbFWCIEvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2J5-005Lr9-Gd; Thu, 29 Apr 2021 08:45:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2J3-005Lqp-LJ
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 08:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=OgSjdYNodjoFoLNBIeXmlGucKytvN/1G2+FQvPAeLLU=; b=UTmCOkkpnEEMWC/kOeME2maX0z
 2f9piff2ez/f585iLn9kdX4HJviJ3v1PltT6GS+y//egrGegncOOX5RQJ4Oao1URkbZV3hwIiIQHf
 FKUDf3cfvtZ7AUjfYv12AmOlBoVU7QQbLXDUbG+IHxXYyYy+6XQkj1E5m2RXe8epK8Op+kO6R2znt
 VcknTi+qsiRDpEyY9+Qf88Sbg6QIOmKp1Su88x/rpvoeJ+dypJ+RCjpPZL8SoYA+lK8P3fswApbSw
 GUhtq+0JONCLGAOjmZAieGXFzGcHd5z0zU92hUkBQQnF8bi9viRAi9NljeyIHSObMo2yoe8xZYpE/
 C968UNfw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2Iv-000UzO-K0
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 08:45:56 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C4ECF240006;
 Thu, 29 Apr 2021 08:45:42 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
Date: Thu, 29 Apr 2021 04:45:41 -0400
Message-Id: <20210429084541.28083-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_014549_817713_2864DB24 
X-CRM114-Status: GOOD (  10.42  )
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

RISCV_ERRATA_ALTERNATIVE patches text at runtime which is not possible when
the kernel is executed from the flash in XIP mode, and as the SIFIVE
errata must be fixed somehow, disallow to build a XIP kernel that
supports SIFIVE socs.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/Kconfig.erratas | 2 +-
 arch/riscv/Kconfig.socs    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index d5d03ae8d685..9537dbd67357 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -2,7 +2,7 @@ menu "CPU errata selection"
 
 config RISCV_ERRATA_ALTERNATIVE
 	bool "RISC-V alternative scheme"
-	default y
+	default y if !XIP_KERNEL
 	help
 	  This Kconfig allows the kernel to automatically patch the
 	  errata required by the execution platform at run time. The
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 00c2b205654c..9cb38bc9d7cd 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -9,6 +9,7 @@ config SOC_MICROCHIP_POLARFIRE
 
 config SOC_SIFIVE
 	bool "SiFive SoCs"
+	depends on !XIP_KERNEL
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select CLK_SIFIVE
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

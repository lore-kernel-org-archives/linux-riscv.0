Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6226C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLtSKTELbGAzcu27qatQA1FFNoVEe4EBz//hcLGXRLI=; b=2iXcUvtDATjOnU
	Xzx68O9Arr8yxhqQ0itTVqjUS6VSZt7LBq6aXyA8VNNZ8Pn7nhCGobyblW/U+I8M6o4tdSs+TlVSW
	eH+OuKrui0A46NT+BQ8/CQVETYo9/Ny0Ir+qqJNRivk9/K/hiz/NDok4KHioUTUwe0RAKNnmoLvLq
	MJvHlodI7QLcJ6GXc7GGxrYZaEaD+b+iHZlVdDeA54rug8RTubEzGoTZTUGkhRok7JdSKlXeD95/V
	+L7/fs0mP8C+mngJPLAqjGRpW8EDePAyz706QD+RkI/i8LgbkjMZa9r/JN0nuuMqIB3V5ZKH3R719
	XaDLpQUNtAf9M3bsM8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns8-005QwK-0W; Fri, 23 Sep 2022 18:58:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrn-005QaD-RO
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 77E11B831E5;
	Fri, 23 Sep 2022 18:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DC4C433D6;
	Fri, 23 Sep 2022 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959458;
	bh=ZH+1NG2dL7YEKegInyqCDu8MqKhX4WDryo5wkiwU3Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YM7cwjXES/bJ3FgCPU0TsqkD0ka1jXFgyrtkCWd/uJor0wRqsMgNYpgDWvPmM8pMd
	 NQyRdZdn88DtLxsDcnPmr7LXJULzHRUXmLjtiPLv3kJAratXZo1Sk73o0YrP1VtWaB
	 STT+Fode+h5crvSuWZ2AqgpJd5KDRiLiTGDjdk5zY5EwZpFAF0ybzPXojzyZCGN0vD
	 9ac0K7nBmvPScPbGSyRNsSiRU01vAZz6uFN5ztwAnSeKCgXJ9rLiqtZcgDKFi6SLxB
	 r6cGN3i5x30D1eozwuKU8G6aKJ35Lny5G6hDXrk4aldLmFnS2G4z0fjY3kM7SSmF/l
	 tlsxobusIJ7vA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 13/27] clk: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
Date: Fri, 23 Sep 2022 19:55:52 +0100
Message-Id: <20220923185605.1900083-14-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115740_079633_48B585E3 
X-CRM114-Status: GOOD (  11.14  )
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

At LPC we decided to convert all of the SOC_ symbols in arch/riscv to
ARCH_ for consistency between "incumbent" vendors and those with a
legacy from other architectures. To that end, swap SOC_SIFIVE for
ARCH_SIFIVE & depend on it rather than RISCV.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/sifive/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 9132c3c4aa86..b21f4cbc3583 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,7 +2,7 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
-	depends on RISCV || COMPILE_TEST
+	depends on ARCH_SIFIVE || COMPILE_TEST
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

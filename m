Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D6FC04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSZwf1DPG+rLhDgu9jtUkkV27497yhOcr4UL+yZy8aQ=; b=qZTQbZPbthgzZk
	5LLcOVO1e9jzTJ4xI2F1lgQPIuF//iJvSlfXDlySiQX7ED4LzV4Gzy8onr9NU2i+dxYAUtyPuHG0A
	pc9ISMIdIDJ/sUicAGUNQ5nZsh3pMFsICORCwcGuBZUVqRRq0bw7RGL9pIq7wtXr0RyCWUZ3XY6pr
	W68NeRa2lyDBNZm1W1ftEgRFP+uJjVNqM+uLkOGN/UjVlK0wENhmzQbC0QcEwF07eVS+vgLWeMy5+
	b0w01Q7stPEHSjDfQW8VXlvBzswJSbmTrMPgLC0hxx/jb4ZPs5Ho/5BAm9cARWqsmZwmFpdbcTJcF
	i28Q3jxptPtvNR8HWxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obntR-005SAO-Sd; Fri, 23 Sep 2022 18:59:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsF-005R3L-2y
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A595B623F5;
	Fri, 23 Sep 2022 18:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D29C433D6;
	Fri, 23 Sep 2022 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959485;
	bh=ur+c3O7bAmOCgs0dVuhN5MxSLlz2mKk5+cSzNsI58Cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xi4cZKT2Ln0RHZO4P+CgwCef+lCHhX++rzMwjVqtm5NxEmAHOcq1EkGuQ+w0dpvbs
	 SIUoTgMB/Y4ryOwR9FIHVgDEbd5zhg45QqMYyd6olSzJ5zfNPBEswg6bAi/4BUII5i
	 /8zuZbMrtDr/h04CMoWbIYNqMVmjvkx+GzevjfaPJr/yT2jCQdSHPRngst0MXUIrsl
	 uwymclFS3Q89fE1RZ9ozk3CdWvPndy4+XJ96eKujNnlUE3TzYsJKUqhC82v4HoXq1y
	 ow+qDxIEqCVw80fonbs/RXdfURr/SwD9Ie7azXvDoGupdfpxmgN+jmYcWMbNMDB/MV
	 wrmQ3kAwMm2PA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 26/27] serial: sifive: select by default if ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:05 +0100
Message-Id: <20220923185605.1900083-27-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115807_210641_C6EC9710 
X-CRM114-Status: GOOD (  10.86  )
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

With the aim of dropping direct selects of drivers from Kconfig.socs,
default the SiFive serial drivers to enabled if ARCH_CANAAN.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/tty/serial/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index daadcfe2703c..dd5a1d6f8bb0 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -972,7 +972,7 @@ config SERIAL_OMAP_CONSOLE
 config SERIAL_SIFIVE
 	tristate "SiFive UART support"
 	depends on OF
-	default ARCH_SIFIVE
+	default ARCH_SIFIVE || ARCH_CANAAN
 	select SERIAL_CORE
 	help
 	  Select this option if you are building a kernel for a device that
@@ -982,7 +982,7 @@ config SERIAL_SIFIVE
 config SERIAL_SIFIVE_CONSOLE
 	bool "Console on SiFive UART"
 	depends on SERIAL_SIFIVE=y
-	default ARCH_SIFIVE
+	default ARCH_SIFIVE || ARCH_CANAAN
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4845EC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAluZeOa7fp20jexVgb+kvKe8BIueO+75APZzsCFHHs=; b=1DBDoN5DvhPQZM
	5E/O0DXBbF5DyrBKWc1eHl3JG5CKEnUZZ3D7i1iIItzbLAJP4R532QAC30f9MA3T9V7oMtqTC7Or6
	m34sN8NFEMzsKe05/Y9Nr2e8tkEdRYSiPXc4tCTIeNLGBcawlhRNZyYQBVh91n0Kdwat8ao8jSh+T
	Vx37aP2u+5wIjyZdN8SpX2vTTZd9skrJtybilW1OcvqF/5N8x8XxDN53KNBGSopkOewgbN/hfXdt0
	5cxzjM1kRtAjgQWBmZ4KlSgoheNpHoPq26qCfEfA21u7RmdiAIh9RtBwiw4eGeSB0zHc/it/zeJOU
	TzU/JPYNHmCqJHfBYYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsC-005R1E-Sm; Fri, 23 Sep 2022 18:58:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrp-005Qca-ET
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0EAA6114C;
	Fri, 23 Sep 2022 18:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C32C433C1;
	Fri, 23 Sep 2022 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959460;
	bh=0V0Fd/YVdc27xVOkbNcOspKORs+3v5vxQOgd72njwWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3XIKLqBj4HcjcvlzDD5aW7zyqwzdzZGUTEsG/SMdwXLV4i2CTpcn5RkqonQR1Qn9
	 ROvaK95bngXm5C9Dbq4IKYGBaEsHPPqrO8WVajlNIU9glAMJ0Ukl2XjPkOd6mr+lBy
	 0LU8N0B1eU9n60P+fzOsd3O49p0Pfnge8iZSfcQelCCpWWPDctcSFvfkse5haBRPts
	 nMZp30O9VzLfL0KGDeM2uyPDMJZ2HLNJvgt2UpzGFqtapryjpZvBs5OhOJMl2XWHfd
	 WtBBcbeZOsyp/PLUgggXwo8ZKtuEvYnqKMhyjkbDXX7rskLscE88KxqP1qvWfLz5Ss
	 Kh7l6MmIl2LwQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 14/27] clk: sifive: select by default if ARCH_SIFIVE
Date: Fri, 23 Sep 2022 19:55:53 +0100
Message-Id: <20220923185605.1900083-15-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115741_563281_D8CFDD1D 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Conor Dooley <conor.dooley@microchip.com>

With the aim of dropping direct selects of drivers from Kconfig.socs,
default the SiFive clock drivers to the value of ARCH_SIFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/sifive/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index b21f4cbc3583..2322f634a910 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -3,6 +3,7 @@
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
 	depends on ARCH_SIFIVE || COMPILE_TEST
+	default ARCH_SIFIVE
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
@@ -10,6 +11,7 @@ if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
 	bool "PRCI driver for SiFive SoCs"
+	default ARCH_SIFIVE
 	select RESET_CONTROLLER
 	select RESET_SIMPLE
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

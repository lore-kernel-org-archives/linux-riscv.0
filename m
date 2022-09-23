Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7BBC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hja6BA1KyZP3EmKLnwGAM/XsaZ0HiUTQ+nTVnlF7p8Q=; b=3JigjTjN2DtWZc
	75sFrhzHgWwD5TpGH+mFODAF0NZgQOaKNhi5ypQhCG/Sl2UfS6DFD8ko2GfWtCLIXcuAJSO6VVJV+
	2SjTonbqqKVsnKhScD8N4fUs+PPzAWWhRAGbZUQDqtz6Gxgu052ZcZ/Fh3P3zRPrhElkGCGq/+dp8
	+7XjRbZMiNZUUGrCyDWM3l+qbej+lisqPk3l4wFgKs/V7PMOfX0mdJhK96a9XEvz79oq5B/9+hYGr
	8Hqn+jNFO/TTKp3Rz/ETJ/XoOcP+jGSXMuKwpsyIQxU58UA7L03i28EUwfkrgmZ58TR5cJPk10KzE
	0hgObqIsDOztE32XG0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsK-005R8g-TX; Fri, 23 Sep 2022 18:58:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrt-005Qh1-OE
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 450556114C;
	Fri, 23 Sep 2022 18:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D1C43140;
	Fri, 23 Sep 2022 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959464;
	bh=ZtiuYA+aR73YzDTGCtR92yjy69G8fEvXNL0Ge7oduB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWAMO+JNazBl1bOmZqFvt+RHv9uECmjOUfA2PTJq/r7cPVvl/BYaT9jJ76Yz5ahHD
	 WyCtSIEZoPlMErxkVzWsp9CqP8O60M2B09oUm5HfKlBCqV7I12uZ00d9II9W/4ULp5
	 Iq+8HF2IYL7G6zNoSRvtNhfpN8ZFySVahWZJFhujnTmkL5fENnoja+RTTpM/UaCv7e
	 Q36GVJSSLWUBJa8qikpEJztTNEP/MVCknmqhLwGHTerwnKDFSkqpYr4cwNHj9PCNIm
	 y8r/WHGHunGQ2YN7wWGNVh5OgM2YxpZrt212lmhY952eAqE+yl8RiofKnbdzYc6ccp
	 rCvSX5Wvi1Zbg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 16/27] PCI: dwc: fu740: convert SOC_SIFIVE to ARCH_SIFIVE
Date: Fri, 23 Sep 2022 19:55:55 +0100
Message-Id: <20220923185605.1900083-17-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115745_888976_93315179 
X-CRM114-Status: GOOD (  11.78  )
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
 drivers/pci/controller/dwc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 62ce3abf0f19..b42a246a68cd 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -378,7 +378,7 @@ config PCIE_AL
 config PCIE_FU740
 	bool "SiFive FU740 PCIe host controller"
 	depends on PCI_MSI_IRQ_DOMAIN
-	depends on SOC_SIFIVE || COMPILE_TEST
+	depends on ARCH_SIFIVE || COMPILE_TEST
 	select PCIE_DW_HOST
 	help
 	  Say Y here if you want PCIe controller support for the SiFive
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

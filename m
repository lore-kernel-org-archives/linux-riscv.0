Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8BFC77B6C
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjgPelUdsEYfqw2nAZMGMNXIMrj7yuVvt9ruNpO0sD8=; b=ui19NglWM/t/4Z
	87bIERySzj12bDLplF2NxBPDcOmrnh98SPLt2qu+nY9J+5p7RF9HGmZoE75J4mLo9LXBfVhUlUnFT
	gn46n3ZrF34533cJida4FWikMf9GWetdU5gku52Md6P6M7aJzZtti0X5UozKdVnbTsVDfY2RfDBBx
	wDzFKPSwuc4GuLKmIKQImSWWNEIieAGzZwaA027v5Ijr5w5uI3w3zq3MMhC5Nk8WACxkOJP9JXLYB
	pGhcxLWIpTWHW2BGHcQsDjdA2S+w2BN7tF+TmcjemdQoxTf4D2fvak0XbfXs6OFFRF6K6J4lUdisP
	DOHcACg7IZoBOnWkZPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgk-008awg-30;
	Thu, 06 Apr 2023 20:58:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgi-008ave-19
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 20:58:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F29E064CA1;
	Thu,  6 Apr 2023 20:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAC5C433AC;
	Thu,  6 Apr 2023 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680814711;
	bh=/eevk9xUiKe/1mZGgG08xIjAaIv7WJjn8F+AGiH1IgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NjmHF6hwUGR/yuQH0N/dyFnQq7Rbr66z21aS+6spQezESiffNwDM6Mxq+VRMPmnny
	 tFjWxZJwYroT1Lto7k9VzZZhPtDTHCuC6CX4ymH41mqTwWAsltP4Edm/hdHvDbkBst
	 5SsZNTmbrY/EzXiHf8qav9t0mbU+EgFF/bZA+8XFgkQm8yy324SxZyZqcSlz3Xe6dc
	 KuKlMF7TjEYjN2Nv6EtQuHynTHklrMswGaACU5rgwD3xMEYqfI51uNmYvR6upBE1a/
	 x483aZntpgUzwkZ5FvPmix6/tx0BOBq66YNnfQPLWg4ZxY+Pg7BvDKd+p2ocheHp9A
	 Um3km2Zxvaxaw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 2/4] PCI: dwc: make SiFive's PCI driver depend on ARCH_ symbols
Date: Thu,  6 Apr 2023 21:57:48 +0100
Message-Id: <20230406-banshee-issue-db90fd3fafe0@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406-undertake-stowing-50f45b90413a@spud>
References: <20230406-undertake-stowing-50f45b90413a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qmcM2Yt7tg8pV2eIGJVXVJi3kTv/CdbcEGHBnd4Yhd0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCn6Rl6bFtq8LciXemaaMsXmYB3PszarprP+0/5vOi/o2 fznj9O7jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkRzzD/+zP8q6bDX4bOPR6 z/HLOJ33vijw8Snzdee4NyswrbugJMLIMIc/3LgiKD748N4tU654OP3euKg6dnbjkfm+tU8NboR t4wUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_135832_435174_335443B5 
X-CRM114-Status: GOOD (  12.58  )
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

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the dependency on
SOC_SIFIVE to the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/dwc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d29551261e80..7d670be44073 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -409,7 +409,7 @@ config PCIE_AL
 config PCIE_FU740
 	bool "SiFive FU740 PCIe host controller"
 	depends on PCI_MSI
-	depends on SOC_SIFIVE || COMPILE_TEST
+	depends on ARCH_SIFIVE || COMPILE_TEST
 	select PCIE_DW_HOST
 	help
 	  Say Y here if you want PCIe controller support for the SiFive
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3333AC04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekde/GQHw5QAcH8VaRxWH01SXH8WB+2Ivql3c9E2r7s=; b=1fdTLeft0fuL1B
	k+sIlk2M9nkYNVuoZJgT1y1SPSaCuE4QGQ8FAdXf4wvRaPfrGaDufI1cc5vK+3SclfZry4EvNZk8y
	zp9nMuZo//fdD7GgZaJuHX85xP1zg9ldHXiICOtq+dDM8MdErnYD9P4efH6/uepY4FpavvBJMDgzb
	neUsQzodMOCBHEkT+nXhICvRpdj0NvlEXha9C4yedWfjbBbJUKMLoL17hNOlCi8GQcaMSVas9z4Oh
	8jouE5CTYuB3p66m4ZMeE0EBrJMWRxlXF1Etj5xDiCaTJPUw92Iy0kzv4+J1NVhgauPNnMMtquvbu
	fno31LZUjANY7E16BOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrT-005QKt-OZ; Fri, 23 Sep 2022 18:57:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrP-005QJS-34
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6BB4B819FE;
	Fri, 23 Sep 2022 18:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1054C433C1;
	Fri, 23 Sep 2022 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959432;
	bh=89fE3GgwMArP5RUH5AzkamUnSj4Zdo/Y2jvid7bDby8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqHNNm3+oF8HrDYcfw8E4OQGCaN04V4HGpef9JBjoM+sjFBwXKe5FlTeaxi4AI9KM
	 ZbfwmUWDzmWT4rtVJJcZCZGiib5H+0olQq/S3O2E+HoXSvJL9rsDkNnY5o8FKecrdq
	 3/DwjM+21hFjGbDvJN30hUm7zGJwe1ucA/1SSTI83lI5Pk36EAgEaIKbxQAloBIgRK
	 8dhh2nUX1PXiJb78a4lbudI4m/qf/iOtU30c4ZD8L92iTzLJEbtXNQRMHPDfqTiJtE
	 tQgHh2Ng/2eMM+LBD/pxPAMb2QNRE636Vz0AuaiaK0a8Mk0tZHPvjDiMNFuyVAXu4t
	 G3OKLsfR1x4+A==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 01/27] clk: microchip: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
Date: Fri, 23 Sep 2022 19:55:40 +0100
Message-Id: <20220923185605.1900083-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115715_304402_B385E9E3 
X-CRM114-Status: GOOD (  12.57  )
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

At LPC, we decided that for the sake of consistency the SOC_FOO symbols
in arch/riscv should be replaced with ARCH_FOO so that we could have a
consistent policy regardless of whether a vendor had ARM legacy or was
a RISC-V "incumbent".

The symbol is currently selected by the arch Kconfig, but that is going
to change, so as a precursor to that change the symbol so that it
defaults to the value of ARCH_MICROCHIP. The symbol is only defined by
RISC-V, so there is no reason to also depend on RISCV

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index b46e864b3bd8..5c6d780870ab 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,7 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	default ARCH_MICROCHIP
 	select AUXILIARY_BUS
 	help
 	  Supports Clock Configuration for PolarFire SoC
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
